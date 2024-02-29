DECLARE
    TYPE arr_type IS TABLE OF PLS_INTEGER;
    l_arr arr_type := arr_type(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    l_num_of_numbers PLS_INTEGER := l_arr.COUNT;
    l_itteration PLS_INTEGER := 0;
BEGIN
    << generating_random_values >>
    BEGIN
        FOR i IN 1 .. l_num_of_numbers LOOP
            l_arr(i) := DBMS_RANDOM.VALUE(1, 100);
        END LOOP;
    END;

    << print_initial_state >>
    BEGIN
        dbms_output.put_line('Initial array:');
        FOR i IN 1 .. l_num_of_numbers LOOP
            dbms_output.put_line(l_arr(i));
        END LOOP;
    END;

     << insertion_sort_with_linear_search >>
    DECLARE
        l_j PLS_INTEGER;
        l_key NUMBER;
    BEGIN
        FOR i IN 2 .. l_arr.COUNT LOOP
            l_key := l_arr(i);
            l_j := i - 1;

            WHILE l_j >= 1 AND l_arr(l_j) > l_key LOOP
                l_arr(l_j + 1) := l_arr(l_j);
                l_j := l_j - 1;
                l_itteration := l_itteration + 1;
            END LOOP;

            l_arr(l_j + 1) := l_key;
        END LOOP;
    END;

    << print_end_state >>
    BEGIN
        dbms_output.put_line('Sorted array:');
        FOR i IN 1 .. l_arr.COUNT LOOP
            dbms_output.put_line(l_arr(i));
        END LOOP;
        dbms_output.put_line('average num of itterations = ' || l_itteration/l_num_of_numbers);
    END;

END;