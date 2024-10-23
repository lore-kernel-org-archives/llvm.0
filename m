Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805B5200BAB
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 22:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723480; cv=none; b=XeAOvdf3KFQoYndRYDssiBTxhvCuYd6apjDYK/e94DAbB8Yle2HxjRCjetKtgkQYfIVQPvk+YrbYOKGHwZQv2XRQNmjH4PTwVUgG6JHDpMykXY+Md4jVpfI0Dg2iLLpVfoxa7pxu3wFXQBBwOdLQbZpmlX7iKVcFNzZ5sGLND/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723480; c=relaxed/simple;
	bh=GQ83ywusdX8FSxm29bbJdclqT2d6vsgU+PEBocsitO0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fvHZLg7wHSb1N1bTQJ7yd9OonH24LSFoiMFW6tXFX3ZNlKOtU35PIpz1qYI5lsb25RAVpugXbXNZVcIbwMdAxfGFS1NMJJhO/Hto9c7wjcuDShQajSxDCHY2k9NpWHQ0bT378KYuwA4qAEC6zi8xwlC8QIJvLF49Icu/LcAHZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k2/qjaaH; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k2/qjaaH"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e28fc8902e6so631240276.0
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 15:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729723476; x=1730328276; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kTuJsSOv0TXKkgOZ/uTNzVesPzJyNiyzzwDXk3hx600=;
        b=k2/qjaaHcqN6l4H7CN8s1HoQGQNL8xKiusjZyr1pmv0SSKhR3oyZkSoG4SkeEo8nYG
         1F3T8l8V5Ba9O0J3Fvb9p27XB1EMAdXup93b1JZnwFIThBGV2WPr7tHqxsnxm8eYZe0M
         VIWW1+COg7bhJUjN440CWMi3BHs0Gachoq6BkqBS3E2gFkttj7HlUrNL14p+tD9+vXIQ
         JzLLoTbcpnCCJzO66PdWmpvY8/xaHHdcL6wesAn1NmiWGP9C44ND3z8R0BPt/+/E49fh
         FZ7jTI4mobTZ3KdvJZ1bxh3OTN+J59KScOifdr25iCSjR6JY1JKT2cPdaiDljeebnbcV
         oqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723476; x=1730328276;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTuJsSOv0TXKkgOZ/uTNzVesPzJyNiyzzwDXk3hx600=;
        b=dOwf5YzQMQIIGt0XvfHeRM5RAOSYIPzD0Bf+ePfF02HERbqUxa6JR1SAoV8w36ib5/
         CnOYohLY1pgHRePjrlwIm0AewaxAQfVERADIdw/8t+Xang6mOulpQ+r462js/L1tWK8Y
         6WEOmNTu/CR1HklUEgzRnERXl9MAQiajnTVwwODz27z+bbSY40djfFmG/rD0z0KIH/ec
         v+1Waad20aUUxvTa5k9xCogAs7VjbmA0vJlL9vD96NtChmiZllyMeXbYOqdn0SWUBEIM
         6soUQxQrrSYzHX/jA7SCuCQdTkpz3bbyfXGZUZs9kqyWwM1JciPhR6SstFccAZ75qD11
         yKhg==
X-Forwarded-Encrypted: i=1; AJvYcCVq8+cVvovZQnc14bMUwKYH2mWGKHrQgfnvXIqpbvmXP8lLF+UrB0/s324tKAOiGHQb6O0N@lists.linux.dev
X-Gm-Message-State: AOJu0YxCQ5kMRVgbLyM2R3xkSIgBlsHuGuPB34nTM9G7tO9toZyD2OLe
	D5W9Zx5jIY4QhbuKaP74ztoALtfHNgJYOv2doPhMGboClXzB2lzN1W2wgFgDn4orXw==
X-Google-Smtp-Source: AGHT+IFpQ/G7EWyoYT60RN1you6Dj+hT6prCnRF/AChpGyawG8i/BJxIIfyzyg2vkyXeHhpEwaCtalg=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:2604:0:b0:e28:fb8b:9155 with SMTP id
 3f1490d57ef6-e2e3a6d71fcmr3638276.9.1729723476306; Wed, 23 Oct 2024 15:44:36
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:44:04 -0700
In-Reply-To: <20241023224409.201771-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241023224409.201771-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023224409.201771-6-xur@google.com>
Subject: [PATCH v5 5/7] AutoFDO: Enable -ffunction-sections for the AutoFDO build
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
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
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
---
 include/asm-generic/vmlinux.lds.h | 11 +++++++++--
 scripts/Makefile.autofdo          |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index e02973f3b418..bd64fdedabd2 100644
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
index ff96a63fea7c..6155d6fc4ca7 100644
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
2.47.0.105.g07ac214952-goog

