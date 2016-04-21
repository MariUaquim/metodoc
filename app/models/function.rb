class Function < ActiveRecord::Base
 has_and_belongs_to_many :papers

 def self.deUsuario(ontology_id, user_id)
     Function.find_by_sql(["select * from functions where functions.id in (select functions.id from functions inner join functions_papers on functions.id = functions_papers.function_id inner join papers on functions_papers.paper_id = papers.id where papers.id in (select ontology_users.paper_id  from ontology_users where ontology_users.ontology_id =? and ontology_users.user_id =?) )", ontology_id, user_id])
 end 

end
