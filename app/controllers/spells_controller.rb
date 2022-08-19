class SpellsController < ApplicationController
  def index
    matching_spells = Spell.all

    @list_of_spells = matching_spells.order({ :created_at => :desc })

    render({ :template => "spells/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_spells = Spell.where({ :id => the_id })

    @the_spell = matching_spells.at(0)

    render({ :template => "spells/show.html.erb" })
  end

  def create
    the_spell = Spell.new
    the_spell.spells = params.fetch("query_spells")

    if the_spell.valid?
      the_spell.save
      redirect_to("/spells", { :notice => "Spell created successfully." })
    else
      redirect_to("/spells", { :alert => the_spell.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_spell = Spell.where({ :id => the_id }).at(0)

    the_spell.spells = params.fetch("query_spells")

    if the_spell.valid?
      the_spell.save
      redirect_to("/spells/#{the_spell.id}", { :notice => "Spell updated successfully."} )
    else
      redirect_to("/spells/#{the_spell.id}", { :alert => the_spell.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_spell = Spell.where({ :id => the_id }).at(0)

    the_spell.destroy

    redirect_to("/index", { :notice => "Spell deleted successfully."} )
  end
end
