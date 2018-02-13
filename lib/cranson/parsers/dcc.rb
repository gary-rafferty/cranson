require 'csv'

module Cranson
  module Parsers
    class Dcc
      include Observable

      def parse(file)
        each_row(file) do |row|
          @current_object = build_planning_application(row)
          notify
        end
      end

      private

      def notify
        changed
        notify_observers(@current_object)
      end

      def each_row(file)
        CSV.foreach(file, headers: true, encoding: 'windows-1251:utf-8') { |row| yield row }
      end

      def build_planning_application(data)
        Cranson::PlanningApplication.new.tap do |plan|
          plan.planning_reference = data["Plan_Ref"].strip
          plan.description = data["PROPOSAL"]
          plan.location = data["LOCATION"]
          plan.current_status = data["STAGE"]
          plan.more_information = "http://www.dublincity.ie/swiftlg/apas/run/WPHAPPDETAIL.DisplayUrl?theApnID=#{data["Plan_Ref"]}".strip
          plan.registration_date = data["REGDATE"]
          plan.decision_date = data["DECDATE"]
          plan.lat = data["Northing"]
          plan.long = data["Easting"]
        end
      end
    end
  end
end
