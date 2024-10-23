Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8E201114
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 22:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723482; cv=none; b=TIKlN46KRgxafKOtSmfyTJGbdTIDqpTNETRL1MsZCJId64s3Xgitkejy78LHubLezii70Azp2/WdYBCevtHZynwSglIc6F98G0H3Yk2FbqqpatWiy9DBOG0DNDK2ALtQKIhFAF91d0P5PBi5avz86WaFsJUtV4ohugH7kTeGi4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723482; c=relaxed/simple;
	bh=H4lcvNRWWp5Lvo05ibGrfHme5e5tOfikXGSVIBw0qWc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QLFVDcLYqk/G4VRurFyemobqtr0S9qLIu3NHFWa3PLS38nRMh7CxB/cKOIdQ5vAH3bML7p1NdbZN5f6DwzgA+FbSB0KX4xiZLwPFVDOjctBIiw+gYB1Mp0XWCjPI0mtrR0QuyA0KfHKP8GaGU2FosUqDG6I2q8vBgKDdaDH7brY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NWKM9Tvy; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NWKM9Tvy"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e29135d1d0cso567613276.1
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 15:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729723478; x=1730328278; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/o6/DndgQ3P7eudJq9ncllOp+Irl9ebDBBJXtIKGGvg=;
        b=NWKM9Tvy/KQglZl3umpLUPP666cNEVFf2k9hn2c0T6j973koNeZfqH/mLHDTjYqLCF
         Z2NWGDDtmBNLv4hQWQfMbx22jzSk9uszxbKvKOcRlNMfsEgVVeetJHryCWCPvDcwhCUu
         Qic9stZH7kvI9T6WIkl8+ekf7O/HJnpuUNxCuD7fT2cz4qIQ4zJ6yahtDFhSkZQD1W6f
         AJETNCN0nsrdT9jZ7lsOVIuFEbs8a/QqmuMD687otAXDV2Y5nZwr1FBA1YM1zyyg3+7P
         IDu8lAWyQD+B9KGd79zbE8DU3VY1B13Fc2PTR1XEQ5TbEZRr/4k7xMrUxaX24o8v26HW
         D4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723478; x=1730328278;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/o6/DndgQ3P7eudJq9ncllOp+Irl9ebDBBJXtIKGGvg=;
        b=EH+XhgUc+JmkyibBfLrWeBEtW2plAZ+Pwm5cuNkcMbQUG8i+1GDoDTUJbM/ACyj1Xm
         6Hn/INP+BW/lQaNCdhPwEYKjqbYpIzygTzuGcPMP0YwaPsqBQ5HebwVAIZR/X3YvxbEp
         ftNE5rdmyZMSVBTF4lzKwNCN7SZOGF24P6HFx749uYKVylnhVx9CMvVQkLn9fdTeUIZL
         pPWZQfctHiwfG+JlreB0Fj0USRgWhjGsn1VbF34aH0ssHhr8HmWN/nszJm3b9/R1156X
         /mS49QvMnFy0nKY1MZuxZAySPUO9gpHM6QM9q1ucApGfUXI9Onszet6+VZMPAuyFq451
         138w==
X-Forwarded-Encrypted: i=1; AJvYcCUypp8YuzQ1BUk8sviZY8zMDv0F3DJmQTiYiHp7sdqZQIiPVQO6w5If0M1UohgUnK3JK/8N@lists.linux.dev
X-Gm-Message-State: AOJu0YxIrmKVUtBpSELzATqbn0bvdu94XutSDKGD8GPrfZaDC+F1Wyu9
	/plWJLRIcYFXF1ztnoVDJIEZi0dV9qHXSnm4vqdrUkbbsfZulb6X9dWnDXqIIPbNSg==
X-Google-Smtp-Source: AGHT+IEZ2bJZoc3fE0PnlkpIXazq/Jm9LegpEpa1x+gCSUhRMhoSRkZxAdl7JyNNZ/Ll96oGjpgocA4=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:904:0:b0:e28:fdfc:b788 with SMTP id
 3f1490d57ef6-e2e3a6dd6damr2088276.9.1729723478113; Wed, 23 Oct 2024 15:44:38
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:44:05 -0700
In-Reply-To: <20241023224409.201771-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241023224409.201771-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023224409.201771-7-xur@google.com>
Subject: [PATCH v5 6/7] AutoFDO: Enable machine function split optimization
 for AutoFDO
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

Enable the machine function split optimization for AutoFDO in Clang.

Machine function split (MFS) is a pass in the Clang compiler that
splits a function into hot and cold parts. The linker groups all
cold blocks across functions together. This decreases hot code
fragmentation and improves iCache and iTLB utilization.

MFS requires a profile so this is enabled only for the AutoFDO builds.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
Tested-by: Yonghong Song <yonghong.song@linux.dev>
---
 include/asm-generic/vmlinux.lds.h | 7 ++++++-
 scripts/Makefile.autofdo          | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index bd64fdedabd2..8a0bb3946cf0 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -556,6 +556,11 @@ defined(CONFIG_AUTOFDO_CLANG)
 		__cpuidle_text_end = .;					\
 		__noinstr_text_end = .;
 
+#define TEXT_SPLIT							\
+		__split_text_start = .;					\
+		*(.text.split .text.split.[0-9a-zA-Z_]*)		\
+		__split_text_end = .;
+
 #define TEXT_UNLIKELY							\
 		__unlikely_text_start = .;				\
 		*(.text.unlikely .text.unlikely.*)			\
@@ -582,6 +587,7 @@ defined(CONFIG_AUTOFDO_CLANG)
 		ALIGN_FUNCTION();					\
 		*(.text.asan.* .text.tsan.*)				\
 		*(.text.unknown .text.unknown.*)			\
+		TEXT_SPLIT						\
 		TEXT_UNLIKELY						\
 		. = ALIGN(PAGE_SIZE);					\
 		TEXT_HOT						\
@@ -589,7 +595,6 @@ defined(CONFIG_AUTOFDO_CLANG)
 		NOINSTR_TEXT						\
 		*(.ref.text)
 
-
 /* sched.text is aling to function alignment to secure we have same
  * address even at second ld pass when generating System.map */
 #define SCHED_TEXT							\
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 6155d6fc4ca7..1caf2457e585 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -10,6 +10,7 @@ endif
 
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
+  CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
@@ -17,6 +18,7 @@ ifdef CONFIG_LTO_CLANG_THIN
     KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
   endif
   KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
+  KBUILD_LDFLAGS += -plugin-opt=-split-machine-functions
 endif
 
 export CFLAGS_AUTOFDO_CLANG
-- 
2.47.0.105.g07ac214952-goog

