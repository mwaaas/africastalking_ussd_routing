--
-- Created by IntelliJ IDEA.
-- User: francis
-- Date: 27/09/2017
-- Time: 08:26
-- To change this template use File | Settings | File Templates.
--

local ussd_routing_api = {}
ussd_routing_api['ussd_ke_africat'] = true

return {
  no_consumer = true,
  fields = {
    ussd_routing_api = {
      type = "table",
      default = ussd_routing_api
    },
  }
}
