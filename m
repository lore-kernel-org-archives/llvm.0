Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823957C
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 20:19:24 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-2eadd524e72so35492577b3.6
        for <llvm@lists.linux.dev>; Fri, 01 Apr 2022 13:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ATcdLAiyB0HmFVQDg4Xl7rvZSmepnr+daM3v/Y+LeMI=;
        b=EoyjCfGV3FCQpOkbXV+W3kTnXGO1Evzvf/ZY38A9M1NFlrIqtx1VS6qnTsGBd7BwjX
         WoMjEr/RMAn4q8VmBMj6mKCCSJYHInMMKdfBk6wZQvwoBizwF+NZ8BoF/h/iCTmyVqoC
         G7HNo6/dYJ2gtGhM3NTwMeNao+r+TProu7GExptuAVxeL/kk3ZIkTTOekXFAtNjuD2NU
         ma1hWOS5qp5Duz30EY9BFcZJwxIWP8vW/FC5lCWqXj8YNzw5RVfVB8q0U357R2cNp4mw
         hIbFGaH0dJMNrmMTAzN7dJIn2fB0mcgwx8f4VQjnqYm/fpUcfe0YQqEExQvrwoLFRu3/
         Rs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ATcdLAiyB0HmFVQDg4Xl7rvZSmepnr+daM3v/Y+LeMI=;
        b=PU1pbi7pCvkX9xRcDUMjq73WW2oWBi0C7gSz3nUIATs1Fatqy2m8PEmJ1BPpsALbAn
         BhWc4Wqkv40rEXdA7sNO1lcCtCJsNiQY9UtqbfZ6Idx37smG6rBVk/6LUncYjbsH0TZy
         n/IyL03cjV6ewFMlTjyc3Mo9MmYkdIgZeU9+Wh+N9tGCvCY49LEjB71mi4nGsII5OrFA
         8VS+SH/26aLGvpbIWIJPB5zRih7H1FWCFHZ7mNnJ5YaqmXIuAQ3fIgEgl33qFh7dErid
         cV8ldFrAfUWRY3p8EYzr0Km1MWfwg3XTFNNiblv31mvw2g6zyQia8qwT/fd8gWzws987
         Q1iQ==
X-Gm-Message-State: AOAM530dNrcFlHbLGQMr9iki+8wIADajKqzvIg/B3Icqm7875v5Bc/ND
	/gDjvfZMd0Wg/368DOPICbFZrrBxWOvUmDBpiOA=
X-Google-Smtp-Source: ABdhPJyew2kq+WRmdfIe6euP7IdAfz4Lf1J4a3hpbhDfzorQRebEdIXVNDbDfQueKfPJDVocv/gDvOOrkxzODDApak4=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ebe8:1acf:913c:f19e])
 (user=samitolvanen job=sendgmr) by 2002:a5b:90a:0:b0:634:15f3:871b with SMTP
 id a10-20020a5b090a000000b0063415f3871bmr10173555ybq.306.1648844363642; Fri,
 01 Apr 2022 13:19:23 -0700 (PDT)
Date: Fri,  1 Apr 2022 13:19:15 -0700
In-Reply-To: <20220401201916.1487500-1-samitolvanen@google.com>
Message-Id: <20220401201916.1487500-3-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220401201916.1487500-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056; h=from:subject;
 bh=TxU5yU7eF6HnJJtCowWe9icJOHczcBwSXoiV/s/cDrI=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBiR15CugMAC3++WEpyG4vENztHvLXakUUYXOQsyeYl
 rVPXFE2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYkdeQgAKCRBMtfaEi7xW7gliC/
 9FfQ7TZrKMqndhgdzS0eK9T5tspAJnIZpf3oeBTdH1yAeQIwZvHzFf76rSoqV6LrbI+gqMeIdHKr08
 UIVlKWpl6xs1zdEc+NvkBalo7cGuCVrQhcVyGSCHyr4qFrtFKg3hA4cA134xfBCef2dRq4OlcjlxyW
 noFvvInv0CUwZj+cCNYqM5+PjO39zKKvvYF0L6VlWVNn7Fa3UCbymDa6AcmA7O6TO7t+SExVQ1nE8W
 vTxJKJBAKAt1rgs3KjEFPVgalAUFnfhfNCCPeh/SC6LF5++tnbSJCjTFzzpyehcjyrrPscjSrGh7yZ
 pwQxCsuHKH3E7frUwQXCr1167ogQen62ZBUZKyJA3stmJfOtSXlUGXDLPyuNpWNM5SiuQxTE3I9b01
 ptlVlMGTab3Tl/kHLSb2PvyQA2hVbrgske+Vc7c0KZGmn1zs1kS+LUgKIU9z5d0Hu0XyCrg3psuddv
 BDIDadUv7bfb+ZZXkjWwR/kblPiEkSPZWT/MZkK6KiBf0=
X-Mailer: git-send-email 2.35.0
Subject: [PATCH 2/3] linux/compiler-clang.h: define function_nocfi
From: Sami Tolvanen <samitolvanen@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Use __builtin_function_start() to implement the function_nocfi() macro
when CONFIG_CFI_CLANG is selected.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/compiler-clang.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index babb1347148c..c84fec767445 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -69,6 +69,16 @@
 #define __nocfi		__attribute__((__no_sanitize__("cfi")))
 #define __cficanonical	__attribute__((__cfi_canonical_jump_table__))
 
+#if defined(CONFIG_CFI_CLANG)
+/*
+ * With CONFIG_CFI_CLANG, the compiler replaces function address
+ * references with the address of the function's CFI jump table
+ * entry. The function_nocfi macro always returns the address of the
+ * actual function instead.
+ */
+#define function_nocfi(x)	__builtin_function_start(x)
+#endif
+
 /*
  * Turn individual warnings and errors on and off locally, depending
  * on version.
-- 
2.35.0

