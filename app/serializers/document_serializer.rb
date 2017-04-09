class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :document_url

  def document_url
    object.document_url
  end
end
