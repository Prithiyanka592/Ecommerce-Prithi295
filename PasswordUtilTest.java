package com.ecommerce;

import com.ecommerce.util.PasswordUtil;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class PasswordUtilTest {

    @Test
    void passwordIsHashedAndCanBeVerified() {
        String password = "DemoPassword123";
        String hash = PasswordUtil.hash(password);

        assertNotEquals(password, hash);
        assertTrue(PasswordUtil.verify(password, hash));
        assertFalse(PasswordUtil.verify("wrongPassword", hash));
    }
}
