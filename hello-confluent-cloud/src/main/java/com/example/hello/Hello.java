package com.example.hello;

import java.time.LocalDateTime;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Hello {

    private String saudacao;
    private LocalDateTime agora;

}
