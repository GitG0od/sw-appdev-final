class SpellListsController < ApplicationController
  def index
    matching_spell_lists = SpellList.all

    @list_of_spell_lists = matching_spell_lists.order({ :created_at => :desc })

    render({ :template => "spell_lists/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_spell_lists = SpellList.where({ :id => the_id })

    @the_spell_list = matching_spell_lists.at(0)

    render({ :template => "spell_lists/show.html.erb" })
  end

  def create
    the_spell_list = SpellList.new
    the_spell_list.spell = params.fetch("query_spell")

    if the_spell_list.valid?
      the_spell_list.save
      redirect_to("/spell_lists", { :notice => "Spell list created successfully." })
    else
      redirect_to("/spell_lists", { :alert => the_spell_list.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_spell_list = SpellList.where({ :id => the_id }).at(0)

    the_spell_list.spell = params.fetch("query_spell")

    if the_spell_list.valid?
      the_spell_list.save
      redirect_to("/spell_lists/#{the_spell_list.id}", { :notice => "Spell list updated successfully."} )
    else
      redirect_to("/spell_lists/#{the_spell_list.id}", { :alert => the_spell_list.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_spell_list = SpellList.where({ :id => the_id }).at(0)

    the_spell_list.destroy

    redirect_to("/index" )
  end
end
