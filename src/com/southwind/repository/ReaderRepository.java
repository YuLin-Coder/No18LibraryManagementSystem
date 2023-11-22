package com.southwind.repository;

import com.southwind.entity.Reader;

public interface ReaderRepository {
    public Reader login(String username,String password);
}
