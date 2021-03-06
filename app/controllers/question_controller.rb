class QuestionController < ApplicationController

before_filter :load_ontologias


  def index
    @atividade = DocConfigEspec.find(2)
    @documento = Document.find(params[:document_id])
    @questoes = Question.find(:all, :conditions=>['questions.document_id=?', params[:document_id]])

  end

  def resposta
    @type_answers = TypeAnswer.find(:all)
    @documento = Document.find(params[:document_id])
    @questoes = Question.find(:all, :conditions=>['questions.document_id=?', @documento.doc_reference])
    @respostas = Answer.find(:all, :conditions=>['answers.document_id=?', @documento.id])
    if request.post?
	@questoes.each do |q|
		param = q.id
		@str=params["answer_#{param}"]
		@resposta = Answer.find(:first, :conditions=>['answers.question_id=? and answers.document_id=?',param, @documento.id])
		if @resposta.nil?
		   @resposta = Answer.new
		   @resposta.attributes = {:document_id => @documento.id, :question_id => param}
   	           if q.answer_type == 3
		      @resposta.attributes = {:type_answer_id => @str}
		   else
		      @resposta.attributes = {:answer => @str}
		   end 
		   @resposta.save
		else

   	           if q.answer_type == 3
			Answer.find_by_sql(['update answers set type_answer_id = ? where document_id=? and question_id = ?',@str, @documento.id, param])
		   else
			Answer.find_by_sql(['update answers set answer = ? where document_id=? and question_id = ?',@str, @documento.id, param])
		   end

		end
                
      end

      if @documento.version_id.nil?
             redirect_to :controller=>'ontology', :action => 'show', :id=> @documento.ontology_id
      else
             redirect_to :controller=>'version', :action => 'show', :id => @documento.version_id, :ontology_id =>@documento.version.ontology_id
      end
    end

  end

  def show
    @documento = Document.find(params[:document_id])
    @questoes = Question.find(:all, :conditions=>['questions.document_id=?', params[:document_id]])
    
  end

def edit
  if request.post?
        @questao = Question.find(params[:id])
	@questao.attributes = params[:question]
        @questao.save
        redirect_to :action =>'index', :document_id=>@questao.document_id, :message => 'Edição efetuada com sucesso'
    end
end

def novo
  if request.post?
        @questao = Question.new
	@questao.attributes = params[:question]
        @questao.attributes = {:document_id=> params[:document_id]}
        @questao.save
        redirect_to :action =>'index', :document_id=>@questao.document_id, :message => 'Cadastro efetuado com sucesso'
    end
end

 def destroy
   @questao = Question.find(params[:id])
   @questao.destroy 
   redirect_to :action =>'index', :document_id=>@questao.document_id, :message => 'Deleção efetuada com sucesso'
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :message => 'Efetue o Login'
    end
  end

  def load_ontologias
    @ontologias = Ontology.all
  end


end
