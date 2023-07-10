Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A89134D1
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 18:35:58 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-579dd7e77f5so59391057b3.0
        for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 11:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689014157; x=1691606157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aa5lQRof/F8cmDC3HRDbQ84WnKxCQ1duxxw+zC9cpn4=;
        b=23a/BYJOg6q/fOh8fzxml3B4m2aOP1zFQvS2kQGJ08o95ldNeS0IPbiHDbR9gH9Fp6
         kR6Sl8+BgYjzrFsG6yb+Rkk6MNGZW8hEsapNMPKNtCJKuk6nYjCRdQQ+uQb3B9UfB++f
         utBahDQJYg1o4JuRkSh968uQqvT98b9OmdJjbsrIk3o42Fk2d/ok29nfEUL7UUhqzHJv
         prPYLaV/c2enA8e2PLnR/POxy31CGGLrstg7H7frJDcw+SCozmYUGTbmwg1dBvxg2NPq
         3w+buPLo/MfK/E/uNGpXJFH28p0Ada1smGQG/jSaDr/sxTRRhtnyAA/kKPGymQX7nGfJ
         8FSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689014157; x=1691606157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aa5lQRof/F8cmDC3HRDbQ84WnKxCQ1duxxw+zC9cpn4=;
        b=SVrM4eHtofM51QjrcUwKc7rOgsC+hbdjM+YRfXQK6+zVWGkhGVcy/DkHp3QtKblfzE
         qQcmehAjCR24POyWiZBcmKOp177c5euJeRZfMN92bSmkBtOeMZ8KSaatsBF4JcGvasbA
         HNUIhG0ATDHhyQCDUT9Q7Y5lA0UgfFnbZsprNkdZuQEerqvW68KDilMObT1hbEwzHqt2
         bkFfuaWvxiEACp95O0lWlLG7t5M8T0qrTIO55E0/zZLgMe2JCRl3RYfVWTdVZ9Aia8uT
         ugIWFP1RZQsscejdlRYlD1LbLrEEUAMqwzlUTxVegE49eeasbBShQXTgTdMmNrpASTmc
         QkBg==
X-Gm-Message-State: ABy/qLZOnhFZmoc7eRAe2eUW2gwcgK8PoxtlfLnHi+AS3KkjnKTFuDdv
	5hYMl4HnCdgN1kQjoekPhSy+CSsSDpWsHT/zJBg=
X-Google-Smtp-Source: APBJJlF1HS/nqxQGVVm7Sw+Lyqck7QIthyrJFOTZrHwkstg/4ASzhXm/9W1XHOsTeD182p89+d7OuhX8FazlF9+8Pwg=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a81:b3c3:0:b0:569:e04a:239d with SMTP
 id r186-20020a81b3c3000000b00569e04a239dmr97416ywh.0.1689014157245; Mon, 10
 Jul 2023 11:35:57 -0700 (PDT)
Date: Mon, 10 Jul 2023 18:35:50 +0000
In-Reply-To: <20230710183544.999540-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230710183544.999540-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=820; i=samitolvanen@google.com;
 h=from:subject; bh=kymeq10zoWFqiY+GAwwmAwqNZBv1fmNg5qliMfkaSfY=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBkrE+BqQqqxzq7jHsOZNuj+FFSkh4kaftmf8PyY
 jDkFEmsHKSJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZKxPgQAKCRBMtfaEi7xW
 7hR1DACL7wNpbhOW9RbbJ6wgRvYcoTTSZDHUgsClXupLaaeipyUO9QC9zsPf4Q1iemCy/NFGNyC
 JF7AS7FxhKhD5Cc5XVhwyColrHi1xcvd6H9jUoiE6UhKSdLbDa11uc/dH6nMQk1B7K8bUV8dq7y
 BTGqNZBzFvNBEXKspIzcxH+1qhZUKR5L+PcoVhaM1MPO22DQXRL7bBhknQ68Q4DNRNN/fEhIFd/
 x1VO+WAhzdrmbt0UsBsYs8Iins8w4y3rr5takR5uFJjejP9YWDAusk8aDsuvoWfbYgMEh5xbCxa
 1Fj/kfCx+v2CLL5VbmgP5kseMz5eTtbE1oxt4oMWlYHEMHcUwrS7+8W2qXt0k99dOtQnHVRZRuP
 8luFpa8IutHZkKTVnPrLhUyCkK1TJjo4EjU8L589pXW39fW/up+mozwX985Km0FeB3Z220FUTGL zfFr01PoMwotR0AcrDE2aotdqMYL1mWrkB1IF3Umg3PtPxFoKaU+zURdOn13bxn/CxtbI=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230710183544.999540-13-samitolvanen@google.com>
Subject: [PATCH v2 5/6] riscv/purgatory: Disable CFI
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Filter out CC_FLAGS_CFI when CONFIG_CFI_CLANG.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/purgatory/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index dc20e166983e..9e6476719abb 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -77,6 +77,10 @@ ifdef CONFIG_STACKPROTECTOR_STRONG
 PURGATORY_CFLAGS_REMOVE		+= -fstack-protector-strong
 endif
 
+ifdef CONFIG_CFI_CLANG
+PURGATORY_CFLAGS_REMOVE		+= $(CC_FLAGS_CFI)
+endif
+
 CFLAGS_REMOVE_purgatory.o	+= $(PURGATORY_CFLAGS_REMOVE)
 CFLAGS_purgatory.o		+= $(PURGATORY_CFLAGS)
 
-- 
2.41.0.255.g8b1d071c50-goog

