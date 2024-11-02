Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88B1AC8A6
	for <llvm@lists.linux.dev>; Sat,  2 Nov 2024 17:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730569890; cv=none; b=a/xRVh0PxlfpLbXDuh+yySYu6TsP/J+ha85dRq5EFE6HYqukbZQ8km9JkaoxPuP8ZIv2aVuiE0SljY6QJfFDWml35f365o9/XNbAtmZzWKNcqb477yMLsvZpilUP81ORy4/4QHn6wMprzm2h3ROY9HknZT5kXvTCKEj96ig5RwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730569890; c=relaxed/simple;
	bh=jFwYnyb7tigSajd19rW2DCydq3TrhiVQ5UM0LYX9xvw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fE/PAMExcjYk5YFGnUYwdsLhAht1rL6Ausz+zEaLj+QcizMlx+BAb4+vhyR7rdxRUCZ6z8o00+8zyIiWyNUZXMBTWWQK6EO2n8gnNb1rnz6j3W/HolA8CQd0jDuT6HTpnMQlgwveC5n60u9BxL7G6XBzhfFZeFSMHjdk3gke8Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ayUjTNPf; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ayUjTNPf"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e35199eb2bso57268807b3.3
        for <llvm@lists.linux.dev>; Sat, 02 Nov 2024 10:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730569887; x=1731174687; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4QpqCo5VL/A1gi4WJVmFiZK/cYWrjSVIkBeaKcWmBc0=;
        b=ayUjTNPfBxyqv57iTksDvXI+fhyBb7h55cQ7vGMHeWndiQqtoMuIlBlCBByhUb4IQe
         FUrZhw1FTDl+PYG4EBSB3Gg2YZwHeAqjQ8EYv1BntC/4eSCkCcvVM/7wOYMhpoo/5+jo
         KffDNrsD9r/3bOYC4Hd7/6GSofhXwxhm/pWz5Upv9/bNbhFRjlFpeahh0whEhQWr5uhM
         pJD3UP6CWhUmAJIVFN0ZulWEjjIWJaOu5NUuSHpvv0wNKG6UjfSWLycrzoHfmI1lUTzk
         4up/dL0AP9GX5w6cYLel/f5lO5oyvKnuXTce1jx8Qjfr6EbU/5zFvEeOUXb7Vp+Ldkeb
         6v1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730569887; x=1731174687;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4QpqCo5VL/A1gi4WJVmFiZK/cYWrjSVIkBeaKcWmBc0=;
        b=sYis4D6OKwixq6R0dE2vIwRtTlMbGjq1uouOXxmMgftm8g7A8qsu1GT5cug0djXiUR
         g4rsJqsoZqzZZeSPW/KbrcAgoOli6yYbkYaZFD7zJKONCNzy1Ohic6njW8QumWmEYQd3
         No+PPUXvMQCHqu/v6MkOPg1kKRg1cu43Mp/ovE84tcCN5s8wDSV8UzCkYTCDy7chz+Hz
         nPQrbegA7x/lJuIt26y53LqlFzVpD94ZA6FJh5McPvNobwYRoQAH/1mda9fNt4sfqgRH
         85GLJEn+/rELENcR5U7uJaU8pmBILhj6e6rJRDbHfA6L+7bg79RLFUDkKhbMCQR7TfUP
         hAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC9/NAqpaQfO/rM1OUjgrdyQ65N7hy2VjXCk1PsVQ2k5D6gXVWHAgZwLKqZGzqjsKM0gxy@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6JBu3M5MI6etWJq4i4LV8on26oCAjnKYCDyZBhsyxqQsyi0E4
	fVu/ipgSBLygfFhAN3/Cy1S2UQgoMg2Ga97aaSTIJl6UNoyaQLdzgY3jwf/XyNZq8Q==
X-Google-Smtp-Source: AGHT+IF5G+zmOqlRK1XIvKNVbuR0PsUVfMeElYQBYMYT3SIwMppcFBcFE0Db9udSOOlWoIEvgv+WGKg=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:64c6:b0:6e3:c503:d1ec with SMTP id
 00721157ae682-6ea64c29ea7mr1040567b3.7.1730569886861; Sat, 02 Nov 2024
 10:51:26 -0700 (PDT)
Date: Sat,  2 Nov 2024 10:51:12 -0700
In-Reply-To: <20241102175115.1769468-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241102175115.1769468-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241102175115.1769468-6-xur@google.com>
Subject: [PATCH v7 5/7] AutoFDO: Enable -ffunction-sections for the AutoFDO build
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
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
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
Tested-by: Yonghong Song <yonghong.song@linux.dev>
Tested-by: Yabin Cui <yabinc@google.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 include/asm-generic/vmlinux.lds.h | 11 +++++++++--
 scripts/Makefile.autofdo          |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index e02973f3b4189..bd64fdedabd2f 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -95,18 +95,25 @@
  * With LTO_CLANG, the linker also splits sections by default, so we need
  * these macros to combine the sections during the final link.
  *
+ * With AUTOFDO_CLANG, by default, the linker splits text sections and
+ * regroups functions into subsections.
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
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index ff96a63fea7cd..6155d6fc4ca7f 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -9,7 +9,7 @@ ifndef CONFIG_DEBUG_INFO
 endif
 
 ifdef CLANG_AUTOFDO_PROFILE
-  CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE)
+  CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
-- 
2.47.0.163.g1226f6d8fa-goog

