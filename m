Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D08186D
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 20:37:24 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id d188-20020a25cdc5000000b00648429e5ab9so8392608ybf.13
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 13:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=mgYY2lX+6A5TnPtbA+mhyQDA8k1F/8PITaCzkIIr+as=;
        b=YjpbUMEKsiPqXO7j5QaX9CEnteTNYermxAVj8vpBYNcU/DKnyhIaC+KAxIbQ0HMh50
         jZAmuGlryAzqWQgF7v18N9rzJ/FqqonqTEqQ/8zVqDbxRTv0LgoCJ6IGvArsgIrIU3Fc
         FuGRQz95g0YZ+nDn4YVpaZcNM/vIYbltZH6wh1xpHvNFyaOb+eq8KSDdMHNkV7zxuTUE
         jgEidlDR+yMW3OdmVRrZA4F/WUddh9IvCWCnqoGIW5ErpQkQ2PDPToXqhYoIN4XlOqhF
         nNy8Gp5x2LZn9OUz9m9EXN06xvPvfyCapJ6Il8ctGUGTDqd3GoZZddD4mn/UC3XWHeII
         RLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=mgYY2lX+6A5TnPtbA+mhyQDA8k1F/8PITaCzkIIr+as=;
        b=WCB2pQjca7Z16grFKIzTSxDKQlIRWvBULPmdsW/+rT68N6B209EjTiNyiL/O/dwp7u
         FGh5vi379pYOcRXzRgl8T+bcyZwKZNhka2NWM2Cy/So6W8+mOYc88HuaBWqVsTRz1Zar
         0tBg8oN03M9iPxdBTKDlqsi7OUtKsf2O3ft32fwe3lQnMqSDu784vxROqIeAuJA6IO76
         wgMvVjd0NwUykcMgfrnI+F1CFx67BANg3QaAZ3VMY+AJxgOA2g4vva1YK1xcOIVgsPAz
         829IOoPGlIhNK9CXl0Cehtov87Qm5zQN9roSvPf5643C4jsIJcyWdWmU6y59oaZ35zlL
         AqYA==
X-Gm-Message-State: AOAM532NDxc1Wgxqa49dt35NSN1b1FLhpg/rNmwbQPQNBCsLAA4wOJQU
	9zpSmAYP2Cb5SMTRw3d+4NV8UdPMxpDdhYIu2Kw=
X-Google-Smtp-Source: ABdhPJyambFdCnuhmSj7yilVaN1wZnPPJvyC6XgV07kwK6srYdBE5TrGTkmK5Jt3LNHtm046MZq4+WTcrii2u9VORI0=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:351:bea9:f158:1021])
 (user=samitolvanen job=sendgmr) by 2002:a25:6157:0:b0:645:8d0e:f782 with SMTP
 id v84-20020a256157000000b006458d0ef782mr1403212ybb.36.1651264643566; Fri, 29
 Apr 2022 13:37:23 -0700 (PDT)
Date: Fri, 29 Apr 2022 13:36:38 -0700
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>
Message-Id: <20220429203644.2868448-16-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3560; h=from:subject;
 bh=bFdr8KmKdxGKWmbD2cJi1nCiQhugbXkWJr6xn+4w/Vg=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBibExXTqTrMCKvJUQRO1SvugummwkQzb2swGsRRMku
 BRKSFeaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYmxMVwAKCRBMtfaEi7xW7pzWC/
 9n2bx+onwgeKynQ327/gYKyBj78JXPpfWB3IzaBiLs329WOK7TdsBUtqcjEop94O5lG3vUcXzch3sP
 RPbgoCCB4IVfV0NIpcBczH7oUNdurADR5O5bYK5KKFqphm81E7KU4PYHv5HLtfauMByN4QqVaOiuKj
 nb4s0SqLCSNGJ8NHnLtsdfz1ESGEY3UQ9Hf94PEgnLxMtxbVQnq4bSi3ArQDlpl2QFPcA3/U/ou/ir
 3ye/0/3VNdUfN6wx9MhGZRyUWfNrfsJCVH6LtgXxLk+sKB1dR7r2sJqxQLn0IXlpaGxI2oFll0L3W4
 9h0AFZpcu+A6kKeGZhi5v7qoeGrn6rv+iz76lwz2ARGx3q9Fqmfxl8sHSfrHkZUk6tl9dDbDglqQ76
 xWXwKlr62HVRv+4b0BefusoLDrdAFe4dl5+a0RR9NPa3RGsJBN0qGPaC+ZEqob2tNLJYOl103mi8Nq
 1z6e8gI84Cpj0HOxsEVgnM2XFp/xJq+9FZzznLF8NVshQ=
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [RFC PATCH 15/21] static_call: Use cfi_unchecked
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

With CONFIG_HAVE_STATIC_CALL, static calls are patched into direct
calls. Disable indirect call CFI checking for the call sites with the
cfi_unchecked macro.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/static_call.h             |  6 ++++--
 include/linux/static_call_types.h       |  9 ++++++---
 tools/include/linux/static_call_types.h | 13 ++++++++-----
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/include/linux/static_call.h b/include/linux/static_call.h
index 7f1219fb98cf..f666c841b718 100644
--- a/include/linux/static_call.h
+++ b/include/linux/static_call.h
@@ -204,7 +204,8 @@ extern long __static_call_return0(void);
 	};								\
 	ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)
 
-#define static_call_cond(name, args...)	(void)__static_call(name)(args)
+#define static_call_cond(name, args...)					\
+	(void)cfi_unchecked(__static_call(name)(args))
 
 #define EXPORT_STATIC_CALL(name)					\
 	EXPORT_SYMBOL(STATIC_CALL_KEY(name));				\
@@ -246,7 +247,8 @@ static inline int static_call_init(void) { return 0; }
 	};								\
 	ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)
 
-#define static_call_cond(name, args...)	(void)__static_call(name)(args)
+#define static_call_cond(name, args...)					\
+	(void)cfi_unchecked(__static_call(name)(args))
 
 static inline
 void __static_call_update(struct static_call_key *key, void *tramp, void *func)
diff --git a/include/linux/static_call_types.h b/include/linux/static_call_types.h
index 7e1ce240a2cd..faebc1412c86 100644
--- a/include/linux/static_call_types.h
+++ b/include/linux/static_call_types.h
@@ -81,13 +81,16 @@ struct static_call_key {
 
 #ifdef MODULE
 #define __STATIC_CALL_MOD_ADDRESSABLE(name)
-#define static_call_mod(name, args...)	__raw_static_call(name)(args)
+#define static_call_mod(name, args...) \
+	cfi_unchecked(__raw_static_call(name)(args))
 #else
 #define __STATIC_CALL_MOD_ADDRESSABLE(name) __STATIC_CALL_ADDRESSABLE(name)
-#define static_call_mod(name, args...)	__static_call(name)(args)
+#define static_call_mod(name, args...) \
+	cfi_unchecked(__static_call(name)(args))
 #endif
 
-#define static_call(name, args...)	__static_call(name)(args)
+#define static_call(name, args...) \
+	cfi_unchecked(__static_call(name)(args))
 
 #else
 
diff --git a/tools/include/linux/static_call_types.h b/tools/include/linux/static_call_types.h
index 5a00b8b2cf9f..faebc1412c86 100644
--- a/tools/include/linux/static_call_types.h
+++ b/tools/include/linux/static_call_types.h
@@ -81,13 +81,16 @@ struct static_call_key {
 
 #ifdef MODULE
 #define __STATIC_CALL_MOD_ADDRESSABLE(name)
-#define static_call_mod(name)	__raw_static_call(name)
+#define static_call_mod(name, args...) \
+	cfi_unchecked(__raw_static_call(name)(args))
 #else
 #define __STATIC_CALL_MOD_ADDRESSABLE(name) __STATIC_CALL_ADDRESSABLE(name)
-#define static_call_mod(name)	__static_call(name)
+#define static_call_mod(name, args...) \
+	cfi_unchecked(__static_call(name)(args))
 #endif
 
-#define static_call(name)	__static_call(name)
+#define static_call(name, args...) \
+	cfi_unchecked(__static_call(name)(args))
 
 #else
 
@@ -95,8 +98,8 @@ struct static_call_key {
 	void *func;
 };
 
-#define static_call(name)						\
-	((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
+#define static_call(name, args...)					\
+	((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))(args)
 
 #endif /* CONFIG_HAVE_STATIC_CALL */
 
-- 
2.36.0.464.gb9c8b46e94-goog

