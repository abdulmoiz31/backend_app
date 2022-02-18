require 'securerandom'
class DbOperations
    def initialize
      @firestore = Google::Cloud::Firestore.new(
        project_id: "tutional-57797",
        credentials: "app/assets/dbkey/keyfile.json"
      )
    end

    def add_record(record)
      data = { name: record['name'], address: record['address'], phone: record['phone']}
      records_ref = @firestore.col 'records'
      records_ref.doc("#{SecureRandom.uuid}").set(data)
    end

    def get_records
        records = @firestore.col "records"
        records_array = []
        records.get do |record|
            tmp_record = {id: record.document_id, name: record['name'], phone: record['phone'], address: record['address']}
            records_array.push(tmp_record)
        end
        records_array
    end
end