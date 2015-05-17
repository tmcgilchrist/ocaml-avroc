open OUnit2
open Generic
open Value
open Errors
open Ctypes
open Foreign


let check_error msg error_no =
  if error_no != 0 then begin
      prerr_endline msg;
      prerr_endline ("Error message: " ^ avro_strerror ());
      exit 1
    end

let test_boolean test_ctxt = 
    let original = 0 in
    let updated = 0 in
    let boolean_ptr = allocate int 0 in
    let value_ptr = allocate_n avro_value ~count:1 in
    check_error "Failed to create double" (avro_generic_boolean_new value_ptr original);
    check_error "Failed to fetch double" (avro_value_get_boolean !@value_ptr boolean_ptr);
    assert_equal original !@boolean_ptr;
    check_error "Failed to reset double" (avro_value_reset !@value_ptr);
    check_error "Failed to fetch double" (avro_value_get_boolean !@value_ptr boolean_ptr);
    assert_equal 0 !@boolean_ptr;
    check_error "Failed to set double"  (avro_value_set_boolean !@value_ptr updated);
    check_error "Failed to fetch test_double" (avro_value_get_boolean !@value_ptr boolean_ptr);
    assert_equal updated !@boolean_ptr;
    avro_value_decref value_ptr



let test_double test_ctxt = 
    let original = 10.4 in
    let updated = 3.56 in
    let number_ptr = allocate double 0.0 in
    let value_ptr = allocate_n avro_value ~count:1 in
    check_error "Failed to create double" (avro_generic_double_new value_ptr original);
    check_error "Failed to fetch double" (avro_value_get_double !@value_ptr number_ptr);
    assert_equal original !@number_ptr;
    check_error "Failed to reset double" (avro_value_reset !@value_ptr);
    check_error "Failed to fetch double" (avro_value_get_double !@value_ptr number_ptr);
    assert_equal 0.0 !@number_ptr;
    check_error "Failed to set double"  (avro_value_set_double !@value_ptr updated);
    check_error "Failed to fetch test_double" (avro_value_get_double !@value_ptr number_ptr);
    assert_equal updated !@number_ptr;
    avro_value_decref value_ptr

let suit = "First Test" >:::
[
  "test_boolean" >:: test_boolean;
  "test_double" >:: test_double
]

let _ = run_test_tt_main suit