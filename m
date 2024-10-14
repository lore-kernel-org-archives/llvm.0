Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993DC1D2B3D
	for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 21:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728941633; cv=none; b=WX6/FIHnztWJG1uq2xDjlAfcRcqASrDesMwrUEtAWrCaOsLanAcReLirc17IXRkKK9DhxBq/Qbr/MC76S/eHDhIaSmfZDIYKKf9DHSAh7X8C2joOuWRaIfHGo8WB72o4sgPXp6w1iWaSLFLZ95Kjmue7P0BtAo5pS5NZ7Uh7b9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728941633; c=relaxed/simple;
	bh=LqcsOVQmv5GpC5shRDpw1q19kzqKid+XE2EfW/9oI3s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ck0UF0ZGHNa8X+7vd+7r6VwC3Byt4GpIiYMMMaaXwC5T45+S4bZfxePivD1Bgf2BOZrke1QJXdo3ZeW8maIDKr/rymRTqUU0GB2uf36VvlZqBZSxdmDzBUrztwSrLDx3lskf8ed6xdHMlU6f7Q++DzLjYQuMr8lvYNoPIyKX0ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N+wnsmpR; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N+wnsmpR"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2928d9e615so4376606276.0
        for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 14:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728941630; x=1729546430; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BOqTSYvoekh3ysMWFRZqW1diZJBhOLc/W4rCwg+Ukg=;
        b=N+wnsmpR7dPp9uFSAr7mvmoMvv1OPxCl7Lu42HtHfIZqI4UEoG6MFKsq3T6rFQmIHB
         tGL68myc2FT7icDhEITWKoAUYPgNra+4zrPUMYnbnDp2v75mfqhpW2489/Ifw4j0yVum
         e8MWkWtwJPnr7mhRntugixeNzY0YVfdjykh8bkD8iukXpwXA9oxAXe5yyXdAxOU5EfAg
         yr+EEgA0qbxm9vuZtJ1nAdkWG392613Y/fkaGE3VwhjYXvaLh3U37LTFssfO/dPWAUJV
         a+GVNbcVMnos3Z+qqbs/RNCLpqo014uG/oA8cPwHTsMBwEe1b4qqlb6XAGYtfY/BqGWT
         oiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728941630; x=1729546430;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3BOqTSYvoekh3ysMWFRZqW1diZJBhOLc/W4rCwg+Ukg=;
        b=mw978YkHafdhH3NGpXCYkE/Ltu6ParWnzUVqgF49J2GRUAxzV+zK30XA/xYsn/0f/3
         UAnuWlwaSa2mcnLMPZpBhW7uEVhI1CXFdzUAeSmSR4jzE24nHKMMY5L2qCfFW+jBQf3e
         d9P5GjYbsaIGhgKrvemtsTMctiMvTPSvHwDgFQwKEixaTOFNDjBcviYifkcV5IgjJp5t
         bocseBegfqxw6MwSQsagMVSgqGaUmHdjNWWbY6ryl3kL5U7ujrEDgUKXmdPkzKU8l4Ut
         8543sKN9QStr0Gl8lGYtfPRSVffdTKCX6FM7fr4b5jGlLR1gx8rhrHtFLJ2qChVJpR+e
         TVkA==
X-Forwarded-Encrypted: i=1; AJvYcCXPrRIYo2LPDD4WWL8LGaobnpflmf8QruVhsno7GpojMRz7ttuiHmJ8A0soF/+4qZA0kVsq@lists.linux.dev
X-Gm-Message-State: AOJu0YxK+zN1/A13dJBprm3ZWpXhWrkPnAgcvL9XO6jdLM6uYKosi67H
	0oZ7bjKoXdSDjan9nAQ7BdUp9NlMoqc8Yu0/+CQduGKyR9jcehD0Zu/x7pF3FYi5qg==
X-Google-Smtp-Source: AGHT+IGJAf1dyn6T0B9hkA7jpV9sHV0gdw83rZtNGaxxQS6w9BKyM0bMWv36PdPXm3t7rejUADUFc3c=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:3607:0:b0:e28:e74f:4cb with SMTP id
 3f1490d57ef6-e2918e5347amr56303276.0.1728941630550; Mon, 14 Oct 2024 14:33:50
 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:33:37 -0700
In-Reply-To: <20241014213342.1480681-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241014213342.1480681-4-xur@google.com>
Subject: [PATCH v4 3/6] Change the symbols order when --ffuntion-sections is enabled
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
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When the -ffunction-sections compiler option is enabled, each function
is placed in a separate section named .text.function_name rather than
putting all functions in a single .text section.

However, using -function-sections can cause problems with the
linker script. The comments included in include/asm-generic/vmlinux.lds.h
note these issues.:
  =E2=80=9CTEXT_MAIN here will match .text.fixup and .text.unlikely if dead
   code elimination is enabled, so these sections should be converted
   to use ".." first.=E2=80=9D

It is unclear whether there is a straightforward method for converting
a suffix to "..". This patch modifies the order of subsections within the
text output section when the -ffunction-sections flag is enabled.
Specifically, it repositions sections with certain fixed patterns (for
example .text.unlikely) before TEXT_MAIN, ensuring that they are grouped
and matched together.

Note that the limitation arises because the linker script employs glob
patterns instead of regular expressions for string matching. While there
is a method to maintain the current order using complex patterns, this
significantly complicates the pattern and increases the likelihood of
errors.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
---
 include/asm-generic/vmlinux.lds.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index eeadbaeccf88..5df589c60401 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -554,9 +554,21 @@
  * during second ld run in second ld pass when generating System.map
  *
  * TEXT_MAIN here will match .text.fixup and .text.unlikely if dead
- * code elimination is enabled, so these sections should be converted
- * to use ".." first.
+ * code elimination or function-section is enabled. Match these symbols
+ * first when in these builds.
  */
+#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CL=
ANG)
+#define TEXT_TEXT							\
+		ALIGN_FUNCTION();					\
+		*(.text.asan.* .text.tsan.*)				\
+		*(.text.unknown .text.unknown.*)			\
+		*(.text.unlikely .text.unlikely.*)			\
+		. =3D ALIGN(PAGE_SIZE);					\
+		*(.text.hot .text.hot.*)				\
+		*(TEXT_MAIN .text.fixup)				\
+		NOINSTR_TEXT						\
+		*(.ref.text)
+#else
 #define TEXT_TEXT							\
 		ALIGN_FUNCTION();					\
 		*(.text.hot .text.hot.*)				\
@@ -566,6 +578,7 @@
 		NOINSTR_TEXT						\
 		*(.ref.text)						\
 		*(.text.asan.* .text.tsan.*)
+#endif
=20
=20
 /* sched.text is aling to function alignment to secure we have same
--=20
2.47.0.rc1.288.g06298d1525-goog

