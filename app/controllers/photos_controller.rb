class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb" })
  end

  def show
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.first

    render({ :template => "photo_templates/show.html.erb" })
  end

  def delete
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.first

    the_photo.destroy
    redirect_to("/photos")
    # render({ :template => "photo_templates/delete.html.erb" })
  end

  def create
    photo = Photo.new
    photo.image = params.fetch("URL")
    photo.caption = params.fetch("caption")
    photo.owner_id = params.fetch("owner_id")
    photo.save

    redirect_to("/photos/" + photo.id.to_s)
  end

  def update
    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.first

    the_photo.image = params.fetch("input_image")
    the_photo.caption = params.fetch("input_caption")
    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def create_comment
    comment = Comment.new
    comment.photo_id = params.fetch("id")
    comment.body = params.fetch("body")
    comment.author_id = params.fetch("author_id")
    comment.save

    redirect_to("/photos/" + comment.photo_id.to_s)
  end
end
