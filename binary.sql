DECLARE
    TYPE arr_type IS TABLE OF PLS_INTEGER;
    l_arr arr_type := arr_type(1, 2, 5, 4, 3, 9, 8, 6, 7);
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

    FOR i IN 2 .. l_arr.COUNT LOOP
        << insertion_sort_with_binary_search_algorithm >>
        DECLARE
            l_key NUMBER := l_arr(i);
            l_insert_position INT;
            l_left INT := 1;
            l_right INT := i - 1;
            l_mid INT;
        BEGIN
            WHILE l_left <= l_right LOOP
                l_mid := TRUNC((l_left + l_right) / 2);
                IF l_arr(l_mid) < l_key THEN
                    l_left := l_mid + 1;
                ELSE
                    l_right := l_mid - 1;
                END IF;
            END LOOP;
            l_insert_position := l_left;
            
            FOR l_j IN REVERSE l_insert_position..i-1 LOOP
                l_arr(l_j + 1) := l_arr(l_j);
            END LOOP;
            l_arr(l_insert_position) := l_key;
            l_itteration := l_itteration + i - l_insert_position; -- Calculating iterations for moving elements
        END;
    END LOOP;

    << print_end_state >>
    BEGIN
        dbms_output.put_line('Sorted array:');
        FOR i IN 1 .. l_arr.COUNT LOOP
            dbms_output.put_line(l_arr(i));
        END LOOP;
        dbms_output.put_line('average num of itterations = ' || l_itteration/l_num_of_numbers);
    END;

END;
