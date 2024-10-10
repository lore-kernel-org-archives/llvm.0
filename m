Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6506D1E008C
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 19:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728588255; cv=none; b=We/e0ImUQuAhhYF1Xfarg9rji2RAUmotjJLPf57mbZKZ4ffboGahDpXusUq0/IckecwIM1HHTRcXcdFtPzKE4RZbx1lJLEU+UY9PuOfC5Llw63kp/xET5Smxd5+lxj/LCnaMb5wI75QoJYGWJPAHG2O9PAqfFEjM+KS4YIHkVmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728588255; c=relaxed/simple;
	bh=zVodnoYgNm1DYBK5hKpuTtqHMKwNmjLuCknrbH33Aow=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RvJgoeXyvbbDghoiqHorefcCHeEf93PdW/xQHwr+cOi2qxQ2T+TpSgfCsmaGM6TNcXNKvyDQARMUb9RGznGsbj9T2hXMOmtwx63gobHZBKuLn21Gd2VKUkc0W03d+eC7E2rCjjrwkTNZkVo07a1AeI8T4skvqYhbaT1Pyi+7NPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C6py1cRW; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C6py1cRW"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e2acec0109so23273307b3.3
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 12:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728588252; x=1729193052; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bXvfnp7Z+BLB7t8cyHpKNDqx6J3lf8zmPrAsIDA7Ieo=;
        b=C6py1cRWVR2DUkFwjPdIH/+8bMn6M/yNlU3rCfSfDUCP5yeQRgMFAjseFQQfXIC3YK
         RekXmLjOryYeOO30Tyir8BSRnsV2SiCC0+3wm1GEQ4BpXH1SeLfmeXksjTzExqJQAdf+
         4jf7IZ5/eYeneq9vPPruWTO5TJlcRpGQ4aVUz0HexhegWTPbhPqTN6jA9u9lE95dGDAF
         gyD3Lrg49mJ+pIcDetbQ/bpq8Y4F0Suqb5JO8x8b0AajOEpEOLTSHcO0AtEwZEIE586z
         dszjrevVMhDktN9FVnLLVcsp9vBZrZ3xAUFAwGWbloMiz6eqI5EjDeeFDtAwb0jWTQto
         DxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728588252; x=1729193052;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXvfnp7Z+BLB7t8cyHpKNDqx6J3lf8zmPrAsIDA7Ieo=;
        b=GFFHo6GUDvyNPHyOwNyJe9iYoXJfXr/zjDOMKgx724lNS71K5BEYjPmeCceAM9xITN
         Orf6xkY90qlStC2/4WkUeR2A0Ak3yMpAgLPI1e2TM3kg04RM90ppFOTYoi+ONnv6UONJ
         OylDRCzyO581w1xtaKZ7FhcpJ8gVREqo6n6pMLrb6zZJGkkVTequ6tBbkxrub56hDNSC
         xGSgRhm9FyQtvuq7LkK1QTkcyItuUgQ0wcS3pNQFDjFy3iIRrEUCpxJ3KcX7EGfrzs8x
         pWnMF13enc+HsjdBZZyG4ooQ39t+56PfwJ5SSMKBF6lBw63FMEDWXQhPhRrauz3baaUc
         zE5A==
X-Forwarded-Encrypted: i=1; AJvYcCVtH16I9iY0iPhVlTNh0gW4J80xr/aYxTXGTT6WuVosbzGq53g0dbKBwz8ZJ05ArwmY+bnJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw32njwN0GwHJaA/oD9FyRgkY9e/j64ap2UZoTEIeJLhNKe2DvD
	9RofThda3ZLp4eEhTQez86GpYhT9tuqU5I8mtp/BRrDx6jpyxdEPyoYAs/boDc5UXA==
X-Google-Smtp-Source: AGHT+IGMu32Wgj2a9dn+nhr1MFY2d/lT0LJJ8GMl/nvZiUcXkvZk1kPhfz7t2WYIwd1XNqtF7GeWJaE=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:d084:0:b0:e25:cea9:b0e with SMTP id
 3f1490d57ef6-e2919fe8406mr8276.9.1728588252247; Thu, 10 Oct 2024 12:24:12
 -0700 (PDT)
Date: Thu, 10 Oct 2024 12:23:56 -0700
In-Reply-To: <20241010192400.451187-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010192400.451187-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010192400.451187-5-xur@google.com>
Subject: [PATCH v3 4/6] AutoFDO: Enable -ffunction-sections for the AutoFDO build
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

