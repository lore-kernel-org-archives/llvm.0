Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070DE1ABECA
	for <llvm@lists.linux.dev>; Sat,  2 Nov 2024 17:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730569887; cv=none; b=Kyk6k7yscs2is1uDda/QB8IFSbo19lBtNWu65Tr3P0TxI7mMagRvg2UecxEoGLaReawux9gCOUIZbpOyryJnrcZsXrtbfK5H2Nx3XrGa2m/MALW0lMr1zGFI1UZJdCbQEAOPbwGI2YY+0EWYPQAsEKCu+LNfgFEpDDfz9RsXbwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730569887; c=relaxed/simple;
	bh=FPKyPXQZDul1ZksptEQY7pBtcpMHH9Arb5Mz1z5os1w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KSpPkrpen9dwUyjnYelkbJ+f/e2ADvxQD1svXMNbcZjOGub6m1KW3gIw2RcET7L8N5GiHLL0WNx1TVYhZ3lxwNZqvZJOD6yTJx1e25KLSTo9RL3mZyGnDnS4FEzTPC3ckUgKeYTyljeqPGIC7HNYaYMyOaQ2x07ErYa5HVEL+Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DF/RXlj9; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DF/RXlj9"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e3705b2883so62930517b3.3
        for <llvm@lists.linux.dev>; Sat, 02 Nov 2024 10:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730569884; x=1731174684; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGtzzK2Mgt1e1RFzyQB1x/jfiV7h76XR1pnUzYHJuws=;
        b=DF/RXlj9lOZcmipsMEar+sHU7Ja3MLDvccABNerIQTxk34s1R9Gz5hZ+npBiZ7lKFO
         7DfqONoJaWVUy7UFAvIv9yY+0KCnqXoUq0qJ7hEz07dyNfQqx47rgC+ZSp/Vslkh2fiX
         ujCJpiKh6pmeHZHocwOsO9A9a5cx5uyxBTDMG5dq+Sktk8A+IZvU5PCZr6dJ/dEgXsjt
         9uM5C6PQGhFmzFWj8ktUvRwq280ORWpqoUhOc7yKZ1L/jamgG6KH9gVBaemgNY9TKMWh
         jPKykRYkEAXep2bzPNOyf1AKZ05aLcIzV5B5jsj3Ea11L8G1HtgZ7sgZ7ZCEgE5NPQbs
         DomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730569884; x=1731174684;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zGtzzK2Mgt1e1RFzyQB1x/jfiV7h76XR1pnUzYHJuws=;
        b=AKf6AcyLANnClIOjtSUKp5NNAoVODF6NlsPAu/llZ6wq7DWH+M/ypGaamWR90gEXxd
         RFHA/BU9AVhM29N7ixtVGO7hYnbX4SQntZ0Yope8IEnHn4Ojnv+0E+XG7gAFjgG9+xsd
         KrhXlLiWxD6GRSiCUmBZsX7/QhJtgtBZ9aN6YmLmdo+DeepGdQFwwWkNYORorQUU+HFN
         o8JwQr36YvW3TgIgoYLrVmzZGOtAcWSNJ0AugxdLL8uw1HejZjI9Bi00A5iljwGvH+ou
         1Bfwb7nC9PPAtsKmEDocmwV56TVzFUsf0HByqLle1P0Ez+cSierEgHNKxnwl9atJkILg
         5mxA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Mpsn5hpIWjFz3Zuyv+jkNbOAycomC4y61bvWWFno4HnYjXkpRsAOQv4i8MT0XO81Fetf@lists.linux.dev
X-Gm-Message-State: AOJu0YxUpjVxF+rlVKMqSqM27cgtMwWQ2rUxG+jHvH2PoTwVlCejYIZC
	bJ5inQO4xb3VbOvxWqeCsFcvY4fg/8+uJw7i9ytWBpARCAo1/M8TV9pAS2iw1XorTQ==
X-Google-Smtp-Source: AGHT+IEvwg0QE/x7k999AZ0ljEk65daAHi3xwSh4xvBKBGQs6PiwWHkyniwX3qAJqons1DUpx3rkK9Q=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:3391:b0:62c:ea0b:a447 with SMTP id
 00721157ae682-6ea64a7db3fmr597937b3.2.1730569883860; Sat, 02 Nov 2024
 10:51:23 -0700 (PDT)
Date: Sat,  2 Nov 2024 10:51:10 -0700
In-Reply-To: <20241102175115.1769468-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241102175115.1769468-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241102175115.1769468-4-xur@google.com>
Subject: [PATCH v7 3/7] Adjust symbol ordering in text output section
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
a suffix to "..".

This patch modifies the order of subsections within the text output
section. Specifically, it changes current order:
  .text.hot, .text, .text_unlikely, .text.unknown, .text.asan
to the new order:
  .text.asan, .text.unknown, .text_unlikely, .text.hot, .text

Here is the rationale behind the new layout:

The majority of the code resides in three sections: .text.hot, .text,
and .text.unlikely, with .text.unknown containing a negligible amount.
.text.asan is only generated in ASAN builds.

The primary goal is to group code segments based on their execution
frequency (hotness).

First, we want to place .text.hot adjacent to .text. Since we cannot put
.text.hot after .text (Due to constraints with -ffunction-sections,
placing .text.hot after .text is problematic), we need to put
.text.hot before .text.

Then it comes to .text.unlikely, we cannot put it after .text (same
-ffunction-sections issue) . Therefore, we position .text.unlikely
before .text.hot.

.text.unknown and .tex.asan follow the same logic.

This revised ordering effectively reverses the original arrangement (for
.text.unlikely, .text.unknown, and .tex.asan), maintaining a similar level
of affinity between sections.

It also places .text.hot section at the beginning of a page to better
utilize the TLB entry.

Note that the limitation arises because the linker script employs glob
patterns instead of regular expressions for string matching. While there
is a method to maintain the current order using complex patterns, this
significantly complicates the pattern and increases the likelihood of
errors.

This patch also changes vmlinux.lds.S for the sparc64 architecture to
accommodate specific symbol placement requirements.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
Tested-by: Yonghong Song <yonghong.song@linux.dev>
Tested-by: Yabin Cui <yabinc@google.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/sparc/kernel/vmlinux.lds.S   |  5 +++++
 include/asm-generic/vmlinux.lds.h | 19 ++++++++++++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/sparc/kernel/vmlinux.lds.S b/arch/sparc/kernel/vmlinux.ld=
s.S
index d317a843f7ea9..f1b86eb303404 100644
--- a/arch/sparc/kernel/vmlinux.lds.S
+++ b/arch/sparc/kernel/vmlinux.lds.S
@@ -48,6 +48,11 @@ SECTIONS
 	{
 		_text =3D .;
 		HEAD_TEXT
+	        ALIGN_FUNCTION();
+#ifdef CONFIG_SPARC64
+	        /* Match text section symbols in head_64.S first */
+	        *head_64.o(.text)
+#endif
 		TEXT_TEXT
 		SCHED_TEXT
 		LOCK_TEXT
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index eeadbaeccf88b..fd901951549c0 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -553,19 +553,24 @@
  * .text section. Map to function alignment to avoid address changes
  * during second ld run in second ld pass when generating System.map
  *
- * TEXT_MAIN here will match .text.fixup and .text.unlikely if dead
- * code elimination is enabled, so these sections should be converted
- * to use ".." first.
+ * TEXT_MAIN here will match symbols with a fixed pattern (for example,
+ * .text.hot or .text.unlikely) if dead code elimination or
+ * function-section is enabled. Match these symbols first before
+ * TEXT_MAIN to ensure they are grouped together.
+ *
+ * Also placing .text.hot section at the beginning of a page, this
+ * would help the TLB performance.
  */
 #define TEXT_TEXT							\
 		ALIGN_FUNCTION();					\
+		*(.text.asan.* .text.tsan.*)				\
+		*(.text.unknown .text.unknown.*)			\
+		*(.text.unlikely .text.unlikely.*)			\
+		. =3D ALIGN(PAGE_SIZE);					\
 		*(.text.hot .text.hot.*)				\
 		*(TEXT_MAIN .text.fixup)				\
-		*(.text.unlikely .text.unlikely.*)			\
-		*(.text.unknown .text.unknown.*)			\
 		NOINSTR_TEXT						\
-		*(.ref.text)						\
-		*(.text.asan.* .text.tsan.*)
+		*(.ref.text)
=20
=20
 /* sched.text is aling to function alignment to secure we have same
--=20
2.47.0.163.g1226f6d8fa-goog

