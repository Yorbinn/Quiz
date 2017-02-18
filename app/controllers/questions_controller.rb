class QuestionsController < ApplicationController
  def index
    #busca preguntas existentes
    @questions = Question.all
    #ordena el arreglo en forma descendente
    @questions.sort{|a, b| a.text <=> b.text}

    #en respuesta de la petion envia a index.html.erb el arreglode preguntas en formato xml
    respond_to do|format|
        format.html
      format.xml {render :xml => @question}
    end
    end

  def show
    #busca la pregunta con el id almacenado en los parametros enviados a show.html.erb la pregunta encontrada en formato xml
    @question = Question.find(params[:id])
    respond_to do |format|
      format.html
      format.xml {render :xml => @question}
    end
  end

  def new
    #instancia la variable @question como nuevo objeto pregunta
    @question = Question.new

    #envia como respuesta en new.html.erb, la pregunta sin datos en formato xml.
    respond_to do |format|
      format.html
      format.xml {render :xml => @question}
    end
  end

  def edit
    #coloca a la variable @question en el objeto encontrado a partir del metodo find de pregunta
    @question = Question.find(params[:id])
  end

  def create
    #se crea una nueva instancia de pregunta a la varible @question
    @question = Question.new(params_question)
    respond_to do |format|

      #si se puede grabar la pregunta se redirecciona a post de preguntas, con el msj
      if @question.save
        format.html {redirect_to(@question, :notice => 'Pregunta agregada exitosamente.')}
        format.xml {render :xml => @question, :status => :created, :location => @question}
      #si no fue posible el guardado de la pregunta se redirecciona a la accion new con msjs de error
      else
        format.html {render :action => 'new'}
        format.xml {render :xml =>@question.errors, :status => :unprocessable_entity}
      end
end
  end

  def update
    @question = Question.find(params[:id])
    respond_to do |format|
      #busca la pregunta y se la asigna a la varible @question si se puede actualizar, redirige el registro de opciones de pregunta con mensaje actualizacion exitosa.
      if @question.update_attributes(params_question)
        format.html {redirect_to(@question, :notice => 'Pregunta actualizada exitosamente.')}
        format.xml {head :ok}
        #si no puede actualizarse redirecciona a edicion
      else
        format.html {render :action => 'edit'}
        format.xml {render :xml =>@question.errors, :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    #busca la preguna y la asigna a la ariabe @question, posteriormente borra y retorna a la lista de preguntas
    @question = Question.find(params[:id])
    @question.destroy
    respond_to do |format|
      format.html { redirect_to(questions_url)}
      format.xml {head :ok}
    end
  end
  private
  def params_question
    #arreglo de parametros usados en la pregunta
    params.require(:question).permit(:text)
  end
end
