Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C2810784
	for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 23:42:59 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-666ee6aeddbso794575b3a.3
        for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 16:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688082179; x=1690674179;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9Xlw8wqmc7m2gTD7N39tQeUlWC1WXyQLWb4QZRUB8Y=;
        b=p3VLofC9uBlj4VqikzkpTVhIEDvSp6dp7csrh8LTmsJ2AioG7ohNPCyZXFqNRY4xl2
         67M3uESl94bLO1M1ieHMv3cFZxN3FFyNQ0yWBa3oxuxiEFwLMPd34J+muGl+kMjVt8sZ
         IaP7ZZcHfBi6OBW/hhL8waRnsfqbeMv3qP1yH2A1MZMIWsagGhMutscPGf6/l0CtmEJC
         eH4izIvergiWXqGTOpw9Vsbk5iEj4hbcxvhKT+YPCyTIG/cK4TBss9B64FaAeElrkph/
         /FmsTHj9LxHPV+CVsN5UMIBeeHMoz+ubIgnc4AlwKuZkWfAvt5iWCuI+vv7VU5neuWXL
         aJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688082179; x=1690674179;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9Xlw8wqmc7m2gTD7N39tQeUlWC1WXyQLWb4QZRUB8Y=;
        b=ITjiwS7Qa5GMCH3/V7zwC5J8H6nhFXyIXraqEKn22uc5eQXE53bugBcoSLJmD8mwVE
         9gRkIETjo2feuVHHxYKciXAjE4dz2+Rq6ayPuQlVkKpoSvY6DouDqfL4br2XMwtZoLIW
         hKUSQYFUwRtB1gLr/f9hfYI4oxFXtAcgyTzgsTuwkmlfkXtXqrojSkCzUCY+2+gBs0KY
         9W7FMajDtGLLKnGaD3tG+vB3I+XXxkA95Or/N+4x6usf/p6RGwNJZD6gFq5mVDc5rI7G
         AIf+CAqkjk3SqykmazuOXdICEah+gwqXI/jsmDwjGmAAS6vUA8/33mdIQws1LWrNfU7i
         SLmA==
X-Gm-Message-State: ABy/qLZUHWXYeXW7cJlysGAEVkf8Fvlpmegs6AlLCAX+DFtnix5s6LNm
	f1YMOlzPOktNr3rn05Slc7MjSmuNwhKk2QQHOoY=
X-Google-Smtp-Source: APBJJlFHLSu7NeB6EU8tOB3/UHptwEsU/4w39fszUoslEvKjGXk+rTe4axHVWR092ZKjtQWWIfnwLK3jAyxYC69lOLA=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:1783:b0:668:69fa:f795 with
 SMTP id s3-20020a056a00178300b0066869faf795mr751698pfg.2.1688082178828; Thu,
 29 Jun 2023 16:42:58 -0700 (PDT)
Date: Thu, 29 Jun 2023 23:42:50 +0000
In-Reply-To: <20230629234244.1752366-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230629234244.1752366-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=722; i=samitolvanen@google.com;
 h=from:subject; bh=gs+HqEOxqge1JD2H3C2OtV2QqbKbTGj0I3LUMBMWFOw=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBknhb1mBbGJYC+ijqffqvxPbBoNNe723klVhBkW
 m8HhCBORNaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZJ4W9QAKCRBMtfaEi7xW
 7nW7DACWpElrAA2aMey2/F1+uNsTn4cuQjvpzYjhSgMneDZUzTvG9j2obc9IHVDVv2V35NZZ4Rx
 qYnhvOXv6ow3iGv+8NVoRor2ccyLXINBkBk/bdzyJ+g5Iz6AutmOsyLdDODLa+au96lNnKDLqq+
 Txok6LqZKNvnTtmBO01sSp+NaX0Fhils37JKcU6zNe4QxFb9dq6jTzowqNUjIX5wJ5zoAHL2T0s
 tLymrEt+OZ5ON9rDFrhMSYiF/P47V6jz8+j2F6hEFzx/c06i14VwYtWoLPoOv/HD6BOPuit+m3q
 W9JWzrIJwcyWdDLlG9ukewzXluZOrbvAQVgin2f6Le7Y2mvWOHldJvFbUa8nYeErwxYpRjXoIFy
 8tVOHkO6lNvnaruOkuaq0Szw25ktCiQV0nrgU30ZQ/JnEO6BozZdXZC/CZ6K3n3QL1cUDQqAgHg I0w0CpD9whXokITAv8X6e6UXd4zEDbwHvv3Zk7/XIwHjMo0Doyr1T55fqBfmjLc35Zmb0=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230629234244.1752366-13-samitolvanen@google.com>
Subject: [PATCH 5/6] riscv/purgatory: Disable CFI
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Filter out CC_FLAGS_CFI when CONFIG_CFI_CLANG.

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

