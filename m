Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BD178C92
	for <llvm@lists.linux.dev>; Sun, 28 Jul 2024 20:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722198659; cv=none; b=EC7PU+mH/M1EcwPYoN57IMvAaMkyYllF4KR3rEoDFrIU3a90G4qM9CPtRkxOaIj8bC5+YiOnRAQk5UgvJivVXthnNx+goYnLMnsZivQbVyHBWp6+dOKplB7U/8BmgEyZZTSPcdJsaOdLuqYJn99MGPwFfuEA+P1oqPrRlHXhnwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722198659; c=relaxed/simple;
	bh=5P/ds+u1Nc4DlKNiDUD6ZuYs75VWIvFx1DNGM0tCz1Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PYjWZ8w2WegXSN0PCVTl8lMz9E5e61xTxE+7VHUINgMXrSqu1U4Fa72/ho4fh99l2IVlyw7X4e63VxKjqejdW42apWbqVsBBTDpkEvH38Nvefnq/ZoSHE9sAN1qAH2lNU/9k+CcHqbSUiu287IJo5Ud6+bfPDSgC0nVc8l1kPYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ywW+5Lhg; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ywW+5Lhg"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-71a43a07997so1958848a12.3
        for <llvm@lists.linux.dev>; Sun, 28 Jul 2024 13:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722198656; x=1722803456; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2mnjrwU8q3IWuUcbnv2YL1wGLUV3JerNGbL3ta/V8U=;
        b=ywW+5LhgliFNNjMJPbYiFXhbICPVf4DNktX0jMtSHuWUctpkbenXiuaAUS1RxKAyk/
         lb6tlD0WS0xGlPpexWKho32WddZP7VuGKpJjHYgCU9F6DNR0KW/g3KL+5xrExipbvVaR
         RQEV/eybEtx+fBNJe5A9O/6lmUF9YJb/WJmH/BMvfiaD1z+CLYicfcr+T4wcrJ9xknD6
         Nq1imyHlIRATdt2sCSJHuaSjHBfUVuCzemkVlW8799KioWGzpOLLekLg1AyVq84eHEe9
         R5jPqkTm3M+IybS8j7hT0zoiyeNKlQmdLn6u4mMJ+quayw5xzvZTQSI6g1i1J54p4dne
         Ustw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722198656; x=1722803456;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o2mnjrwU8q3IWuUcbnv2YL1wGLUV3JerNGbL3ta/V8U=;
        b=jIUfrQGIQo79vBCg96KWgmwP0alXX5Ia3y3f1RVUROKZGhPqfTc4w1foWjrrNT1CGd
         ehS28AB5JLmhptzjJo9mYSrTJDnajdtHzPGA0Dh+kf5DWZgKAzzzQ0BY8wZdEpFPlr3B
         9tgYhAt+erIAiNU4QQIPtlTPFOQMcqa7Ajr/Mg8yQRgIR9C0YK1wyibbEBxuVb7jTXm3
         2hWHt1KA+UtNNQZQrDVj//G+IcQ3ktUOMo0gIAF0JK9F12czr042TOsMPOb92fQQ0lwh
         Z3kfBP1la3OO2ZF2wxXGrOE5rUY9my126rDmmb8disT04aFlqTZpfZCvKviXIAdhCKCR
         Co9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUWwyo4JGPdTUGfN+SuexOsUZDqr8fJ1uS4wleDKMoJIV9Ryj+Ak8UzG/vWJiG3ug+kKPwaLX9/ACIJRkdoumPqQHJog==
X-Gm-Message-State: AOJu0YzsoNUcBlfhyROvFOsbiG+G/7t4gWimt6hO8T2Gft8u5VHQ7kTf
	qqRbcYhCs9+BvkkXGPGvBJcZy+i5CoGa5lBmcnIT7FAGW+rBRW9+Kdb5JC/n7FOYWg==
X-Google-Smtp-Source: AGHT+IF+cnWDEef0AOr5iV5UnZQ0Nmg6qihUgkJJVOtSeHchBxmd2+NRGmp/GGHZSyrSRRs3cz4mBGg=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a63:e903:0:b0:75c:49a4:2a2c with SMTP id
 41be03b00d2f7-7ac8f942a86mr12318a12.7.1722198655784; Sun, 28 Jul 2024
 13:30:55 -0700 (PDT)
Date: Sun, 28 Jul 2024 13:29:56 -0700
In-Reply-To: <20240728203001.2551083-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240728203001.2551083-1-xur@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240728203001.2551083-4-xur@google.com>
Subject: [PATCH 3/6] Change the symbols order when --ffuntion-sections is enabled
From: Rong Xu <xur@google.com>
To: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	John Moon <john@jmoon.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Mike Rapoport <rppt@kernel.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Rafael Aquini <aquini@redhat.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Eric DeVolder <eric.devolder@oracle.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Benjamin Segall <bsegall@google.com>, 
	Breno Leitao <leitao@debian.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Brian Gerst <brgerst@gmail.com>, Juergen Gross <jgross@suse.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Jan Kiszka <jan.kiszka@siemens.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
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
 include/asm-generic/vmlinux.lds.h | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index 5703526d6ebf..f3de66bda293 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -582,9 +582,21 @@
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
+		*(.text.asan.* .text.tsan.*)				\
+		*(.text.unknown .text.unknown.*)			\
+		*(.text.unlikely .text.unlikely.*)			\
+		ALIGN_FUNCTION();					\
+		*(.text.hot .text.hot.*)				\
+		*(TEXT_MAIN .text.fixup)				\
+		NOINSTR_TEXT						\
+		*(.ref.text)						\
+	MEM_KEEP(init.text*)
+#else
 #define TEXT_TEXT							\
 		ALIGN_FUNCTION();					\
 		*(.text.hot .text.hot.*)				\
@@ -594,7 +606,8 @@
 		NOINSTR_TEXT						\
 		*(.ref.text)						\
 		*(.text.asan.* .text.tsan.*)				\
-	MEM_KEEP(init.text*)						\
+	MEM_KEEP(init.text*)
+#endif
=20
=20
 /* sched.text is aling to function alignment to secure we have same
--=20
2.46.0.rc1.232.g9752f9e123-goog

