connection: "lookml_demo"

include: "/views/**/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: store_master {
  join: sales_data {
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_master.store_id} = ${store_id} ;;
  }}
  explore: budget_master {
    join: sales_data {
      type: left_outer
      relationship: many_to_one
      sql_on: ${budget_master.store_id} = ${store_id} ;;
    }}
  explore: product_master {
    join: sales_data {
      type: left_outer
      relationship: many_to_one
      sql_on: ${product_master.product_id} = ${product_id} ;;
    }
  }
  explore: category_master {
    join: product_master {
      type: left_outer
      relationship: many_to_one
      sql_on: ${category_master.category_id} = ${category_id} ;;
    }
    }
  explore: member {
    join: sales_data {
      type: left_outer
      relationship: many_to_one
      sql_on: ${member.customer_id} = ${customer_id} ;;
    }
  }