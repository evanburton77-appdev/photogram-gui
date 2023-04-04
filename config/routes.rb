Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username", { :controller => "users", :action => "show" })
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  get("/delete_photo/:toast_id", { :controller => "photos", :action => "delete" })
  get("/create_photo", { :controller => "photos", :action => "create" })
  get("/update_photo/:modify_id", { :controller => "photos", :action => "update" })
  get("/create_user", { :controller => "users", :action => "create" })
  get("/update_username/:old_username", { :controller => "users", :action => "update" })
  get("/create_comment", { :controller => "photos", :action => "create_comment" })
end
