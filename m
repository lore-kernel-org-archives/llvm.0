Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3DE7C
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 20:19:26 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id y193-20020a25dcca000000b00636d788e549so3062434ybe.5
        for <llvm@lists.linux.dev>; Fri, 01 Apr 2022 13:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=0tGuel8F0TPZ4i19LuuPjmtXqje2ywWglhe/oIdo5VQ=;
        b=DvT1jTf5TrMmdo+R/peAXWEcfaqI0CTKicq9NuxiQwsvogqT0Q7+PBVGIhAGw7TCNy
         XA1nEIo1hupZyhsJi7y7q+P4m0gAF8th3hcbD65r/heuupKFyJDtGA12HtiIjbdav1ey
         sVWYyVhWomxLYHu+i7sugSFeoTNYJEOmyG5m6bTQ6seZzFdlEpk1qzvgrstj0l0TVQFF
         tN9WCc0YVeZxkyot8V/nyOPv5ANKSaRz7nai4h+sm6dg0N6lPkfTE3H3tlzoPg1I9Rpn
         uWDSC6HUsm6sS1p7G+wlB+eFzpwqTg/wqs6qP7IZwULuwoda474t5/bUAv5m+YSl1wVs
         lrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0tGuel8F0TPZ4i19LuuPjmtXqje2ywWglhe/oIdo5VQ=;
        b=apfFKXNZZMT+KnsXvkpOB225ZntAG3kfoZz1MF6K88fUlgdzoHOjU54bUSsTUjz68R
         qb/lQw6K7yfR8XE+9tKPzgn2sLE7fIF0pPT9JcpcW8EZg2vazDNw4sH/YAPTEMv8VPwp
         QXI8sWGNs4mVLw8HmX4nYXqSnUZ5sq/G23Ycll0R1YIOiRqVbCkWkaZtF61YlSQciceN
         vw9c3YePY1I1urXlm7tN3t1bB+tMYM81I+FxX9La1kdjFiafIeQSyMrgP9H5WuL6zvqL
         ssOT8l+qrhB0kTNcsaQKsv2LzLMskNW32R95rytpMnaF6zG/DGlZCJTDGlqiZ5Z/+61X
         pVkw==
X-Gm-Message-State: AOAM531S8oyR4ZyjN5mSDyJSvlY7w2NgXewh2JzIZUPZdgfpPpFZwH/n
	TSd2H+XQnmXM/zSV0DnnjjOM1VNDXqekhTx3uQ4=
X-Google-Smtp-Source: ABdhPJyczPJlHMZJ5SsOuDzCQ5Zx+moZV8jK12RncbXJNK4fa4a+uQlY5m3JXXqTHzfRGUCmkCBHysLhBLexKAAxzfU=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ebe8:1acf:913c:f19e])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:1546:b0:63b:7960:ca83 with
 SMTP id r6-20020a056902154600b0063b7960ca83mr10524407ybu.52.1648844366067;
 Fri, 01 Apr 2022 13:19:26 -0700 (PDT)
Date: Fri,  1 Apr 2022 13:19:16 -0700
In-Reply-To: <20220401201916.1487500-1-samitolvanen@google.com>
Message-Id: <20220401201916.1487500-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220401201916.1487500-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278; h=from:subject;
 bh=NtSOtkaS5YpGAma/5363kop1E6xEpoqT3+yVgUVR148=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBiR15Duaw2orP2Ch7LgRIVD7zbYKWzx4lyqqoSUycA
 4hFov6yJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYkdeQwAKCRBMtfaEi7xW7kgxC/
 94YUjQ86qg2QNFo0zOZpLNhNoZrYE9N6UoYuptrK2s5ExRrYLkKkCJoTnZNYg0eD7UR34ThbeM4glC
 bbR7KAIpU4pqZdu44ILdIuLEloNjk8r8i73R/bhhkGEL3DIwo/9qH0kSgPuP7DEN+IKySjZ97vyS1z
 NyepXAChV+OV4sD49Id45jxlRHS5iSZdqpYbxBAulqyymOJq33VhikVIpQkJYEwNqyXhNVoLm42hc8
 Oxo6tsOZhVOPg3XajU/BUx3V/Em7l2Nn31FA/kc0g58a4tBA6JdFV2WjVKUysyRkoL6X0PthHKB09I
 wrp0dKq+MSBAbBfCz/OSVubvE9y0n1Lk+HjUqw8GoGvbbETpcUKMLIzlGucOC6W1bvqy+50alyII+c
 T84eYNyRKv1EoVYra6OF4ul6fnhwOsGJ54+HHdXF81AiQD3jDyKVI/0ZiOYm8KYfa1FSKYzdmfoIby
 tfiURTStJhv2wmBp9Mpjwe7Qbno/3uqLiRsfcLEBiWiPQ=
X-Mailer: git-send-email 2.35.0
Subject: [PATCH 3/3] arm64: Drop the inline assembly implementation of function_nocfi
From: Sami Tolvanen <samitolvanen@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Drop the inline assembly version of function_nocfi() now that
CONFIG_CFI_CLANG depends on __builtin_function_start(), which allows
this macro to be implemented more cleanly and in a way that works also
with static initializers.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/include/asm/compiler.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm64/include/asm/compiler.h b/arch/arm64/include/asm/compiler.h
index dc3ea4080e2e..6fb2e6bcc392 100644
--- a/arch/arm64/include/asm/compiler.h
+++ b/arch/arm64/include/asm/compiler.h
@@ -23,20 +23,4 @@
 #define __builtin_return_address(val)					\
 	(void *)(ptrauth_clear_pac((unsigned long)__builtin_return_address(val)))
 
-#ifdef CONFIG_CFI_CLANG
-/*
- * With CONFIG_CFI_CLANG, the compiler replaces function address
- * references with the address of the function's CFI jump table
- * entry. The function_nocfi macro always returns the address of the
- * actual function instead.
- */
-#define function_nocfi(x) ({						\
-	void *addr;							\
-	asm("adrp %0, " __stringify(x) "\n\t"				\
-	    "add  %0, %0, :lo12:" __stringify(x)			\
-	    : "=r" (addr));						\
-	addr;								\
-})
-#endif
-
 #endif /* __ASM_COMPILER_H */
-- 
2.35.0

