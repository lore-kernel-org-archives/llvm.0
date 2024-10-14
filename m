Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9A01D5ADD
	for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 21:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728941636; cv=none; b=ArbP32IdSx9BzqUeFORb/PYGrB3sd+GlQqCI55CjygMB/3nDRlRqZCKBTKlW10L6ggQfQQQ+GhGBbm3+DpJq9XXBtKQkZeEbVTIp/vnnUYlhz0X5yhCDOSFWWFtmqJBjR7JL+4hc9jxs3oHqoMb8odLLQP8XTamu3MXxk8EpRDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728941636; c=relaxed/simple;
	bh=zVodnoYgNm1DYBK5hKpuTtqHMKwNmjLuCknrbH33Aow=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=vCiDJ9bsj/HVOVqH6lZ/u2/+FUMh/aiDQasb4oGJcqdA/ywxR0n5JdfznOR2/dMRf9iImEOm6i+r2nACm7dJljdFPkDUESif4ksTtsFa2Pd2YChEnSbHEeD2HAjpoBY8C+WPuIvq0NOTVwliaj8RhDUPiJjGcjmBNFktQaQ+S7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZD222gbO; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZD222gbO"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e3705b2883so27429297b3.3
        for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 14:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728941632; x=1729546432; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bXvfnp7Z+BLB7t8cyHpKNDqx6J3lf8zmPrAsIDA7Ieo=;
        b=ZD222gbOLQRmSWQAPAFU46bO+HOk5T/7bOxyDqlUtfc3dDbLfRJXKd6JakG8R0l5il
         7UYg9HigqXdjsYR3Mi8nD1jvnvNarh+QGqps/+5x6GITHscyX0mB2buS8xjr2i4E7jBs
         GWRjaw30mNO8/MhL0KusOVf4XscQVo9oywvQkPfZIFpwAEMZS5e3CLQPk5y9YHV0Wp3i
         bzPBLpMvcWOhDc/iU5x8BV3TAVOlEY5LLc+3ZG2MY7j60cux7gvUHDzpd6vZfMRLqRgF
         5QLV8MbXViyeWYrkkVRmtAYNfLo+qb8vrS48sZiCpmRWYpuxiXloXQpzgh4zUGYBrHzO
         aJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728941632; x=1729546432;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXvfnp7Z+BLB7t8cyHpKNDqx6J3lf8zmPrAsIDA7Ieo=;
        b=VldsS9LHb4jdh4cqfYgMpvJam0n5WKkwz93G0MzkXQOE+Y8tTNskY9MvAOjXPr3GUQ
         FN7yuUDDSzv0j+23LSCbJE0d5mn+Bz4l/eI4P3+WNnFRV066lJcBSYdRka/V5WQ219eW
         d7Ih+UpBw9U3kXqRslJeRZegzXW0QDlEYxDomj8Eoi3uuPhgLIb6aHQaCcG2x9VlWNWF
         2jJTXEVTXw7R7jbhEzCuoOff1VYmq+i6nkdjp4c826+FwnED+UvTHPgWlb7mqVMcyQME
         fKGDsqwnbbclLd+Vtknq+bbbeVJlvhdihumRzH9+HNT2XpbrNrb/ErWN7+OisbHnsHoj
         HC5g==
X-Forwarded-Encrypted: i=1; AJvYcCUwhQtO+7kPtLblTCQyMYStjRW73d6gREIwmZOt9DMZ+ioqcgCBElwh8FMMBNDIbB8UkCJQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ7goZcVvTx7wQ/rhgmQmuX760/AxSobJzS6OEqSoQOK97Jo9D
	KVyQm5Tjk8KoJR/bRJoWQHTz1dfNKEiXzAXnEXE0CFPJNBtP8y4ILj3a+mpfQt51UQ==
X-Google-Smtp-Source: AGHT+IFQWnw3ZdOqgZWAMJxktqzpq9SRiWxugma9YUkwUzna4spoduXnzDxe4alvNWAtDsGot17nUE8=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:670e:b0:6e3:19d7:382a with SMTP id
 00721157ae682-6e3477c0764mr2100477b3.1.1728941632207; Mon, 14 Oct 2024
 14:33:52 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:33:38 -0700
In-Reply-To: <20241014213342.1480681-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241014213342.1480681-5-xur@google.com>
Subject: [PATCH v4 4/6] AutoFDO: Enable -ffunction-sections for the AutoFDO build
From: Rong Xu <xur@google.com>
To: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>
Content-Type: text/plain; charset="UTF-8"

Enable -ffunction-sections by default for the AutoFDO build.

With -ffunction-sections, the compiler places each function in its own
section named .text.function_name instead of placing all functions in
the .text section. In the AutoFDO build, this allows the linker to
utilize profile information to reorganize functions for improved
utilization of iCache and iTLB.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
---
 include/asm-generic/vmlinux.lds.h | 37 ++++++++++++++++++++++++-------
 scripts/Makefile.autofdo          |  2 +-
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 5df589c60401..ace617d1af9b 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -95,18 +95,25 @@
  * With LTO_CLANG, the linker also splits sections by default, so we need
  * these macros to combine the sections during the final link.
  *
+ * With LTO_CLANG, the linker also splits sections by default, so we need
+ * these macros to combine the sections during the final link.
+ *
  * RODATA_MAIN is not used because existing code already defines .rodata.x
  * sections to be brought in with rodata.
  */
-#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG)
+#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG) || \
+defined(CONFIG_AUTOFDO_CLANG)
 #define TEXT_MAIN .text .text.[0-9a-zA-Z_]*
+#else
+#define TEXT_MAIN .text
+#endif
+#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG)
 #define DATA_MAIN .data .data.[0-9a-zA-Z_]* .data..L* .data..compoundliteral* .data.$__unnamed_* .data.$L*
 #define SDATA_MAIN .sdata .sdata.[0-9a-zA-Z_]*
 #define RODATA_MAIN .rodata .rodata.[0-9a-zA-Z_]* .rodata..L*
 #define BSS_MAIN .bss .bss.[0-9a-zA-Z_]* .bss..L* .bss..compoundliteral*
 #define SBSS_MAIN .sbss .sbss.[0-9a-zA-Z_]*
 #else
-#define TEXT_MAIN .text
 #define DATA_MAIN .data
 #define SDATA_MAIN .sdata
 #define RODATA_MAIN .rodata
@@ -549,6 +556,20 @@
 		__cpuidle_text_end = .;					\
 		__noinstr_text_end = .;
 
+#ifdef CONFIG_AUTOFDO_CLANG
+#define TEXT_HOT							\
+		__hot_text_start = .;					\
+		*(.text.hot .text.hot.*)				\
+		__hot_text_end = .;
+#define TEXT_UNLIKELY							\
+		__unlikely_text_start = .;				\
+		*(.text.unlikely .text.unlikely.*)			\
+		__unlikely_text_end = .;
+#else
+#define TEXT_HOT *(.text.hot .text.hot.*)
+#define TEXT_UNLIKELY *(.text.unlikely .text.unlikely.*)
+#endif
+
 /*
  * .text section. Map to function alignment to avoid address changes
  * during second ld run in second ld pass when generating System.map
@@ -557,30 +578,30 @@
  * code elimination or function-section is enabled. Match these symbols
  * first when in these builds.
  */
-#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG)
+#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG) || \
+defined(CONFIG_AUTOFDO_CLANG)
 #define TEXT_TEXT							\
 		ALIGN_FUNCTION();					\
 		*(.text.asan.* .text.tsan.*)				\
 		*(.text.unknown .text.unknown.*)			\
-		*(.text.unlikely .text.unlikely.*)			\
+		TEXT_UNLIKELY						\
 		. = ALIGN(PAGE_SIZE);					\
-		*(.text.hot .text.hot.*)				\
+		TEXT_HOT						\
 		*(TEXT_MAIN .text.fixup)				\
 		NOINSTR_TEXT						\
 		*(.ref.text)
 #else
 #define TEXT_TEXT							\
 		ALIGN_FUNCTION();					\
-		*(.text.hot .text.hot.*)				\
+		TEXT_HOT						\
 		*(TEXT_MAIN .text.fixup)				\
-		*(.text.unlikely .text.unlikely.*)			\
+		TEXT_UNLIKELY						\
 		*(.text.unknown .text.unknown.*)			\
 		NOINSTR_TEXT						\
 		*(.ref.text)						\
 		*(.text.asan.* .text.tsan.*)
 #endif
 
-
 /* sched.text is aling to function alignment to secure we have same
  * address even at second ld pass when generating System.map */
 #define SCHED_TEXT							\
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 1c9f224bc221..9c9a530ef090 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -10,7 +10,7 @@ ifndef CONFIG_DEBUG_INFO
 endif
 
 ifdef CLANG_AUTOFDO_PROFILE
-  CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE)
+  CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
-- 
2.47.0.rc1.288.g06298d1525-goog

