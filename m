Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D867E1A0708
	for <llvm@lists.linux.dev>; Wed,  2 Oct 2024 23:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727912065; cv=none; b=RLbbw0jI/U3uOQw4xAPZajTdJxDZqAm1GqgrDl54RmFcPjlzyqzk8dhBIq+8lj4g4xdNn7DOk6Mdfzt/y4epYk8cG4Ih8NCOlqzatNZRY1eCO6jRCuHSETcJlb6F/gGEz9ttkJxMRvGXrV6Mn+w7v4sDwBJHaTQy/TqLZRj3ZQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727912065; c=relaxed/simple;
	bh=MJusZT5SU1zAmoXsj3BVQuj0Qp9hPOCt3MKAiX5TJpk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=baoeW3Roeskj/5+l7ZbFmZ6tG2R3gVFNLtnya4VLrkKfyr5LZ9Eo/4qUCnzhTXpqdFYAgDPWGTeGVJyacHsP/kaIcy5rYXKqUpYcdh12kANRcnlhpo1bX0D2ikNhKuij6Xw7YGRmdlkeyM/8k2t+OkeFjWKkTGaqtdfbYRklRTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HomQJIv3; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HomQJIv3"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0b8fa94718so609688276.0
        for <llvm@lists.linux.dev>; Wed, 02 Oct 2024 16:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727912063; x=1728516863; darn=lists.linux.dev;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDJQx6+NqQEMtRG5A8ZzhqTLfwfDzLHdvQlCAg24+ko=;
        b=HomQJIv3fM8uIjOqch4hJW5eYXWMpd1qLi3f7J7iPNB3uVDjD+kYJ/bwdxk7EnhEHe
         44jLT2wdrzFPMFp2x5pq+L0/Fu5pmr6ynjIdV7tfoeFPnrIq0VcyC+tpX9V09FWBjV4X
         1pTaadwCS1gNTudgzOp9whTSwlZW5xRfw8X/ic0a+0v+JSFDnO55ECPHGirY5PHY3Duk
         8uK6LOA/xA2BCl7dEONXEKaGkrF5RtHV652VTnemir+JgBTpEp45orRfDtnKr0gXF22i
         ZLhT8MBrlbxadj4F9nPmC4MzlfQMek/XhPKePBIi4hllR2tZlZmqxeZqyunGL0yqmT2L
         sLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727912063; x=1728516863;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IDJQx6+NqQEMtRG5A8ZzhqTLfwfDzLHdvQlCAg24+ko=;
        b=I+SpGcxeYRQYlQUi8xxwv6HsPeUmRZnkAUhEhgDjJjt6Jn9gF1/MQvRc4eAoKY4YE3
         pSEZyJbC3fOJIrXfzM3wbUGM8dr0ckbTxVykcvu/jY+UkorHK0LCY3Vbr9AMiarExVsv
         iiPjLFcJi6quNlaD/kgqnzB2E+3eBQFbupgCKAlAa24bYvbB7EsNGs3FLE91fsD5ekZt
         DkibS9v9Y/I0IrSS7HH9C9Zz6/JzbmKCKxkPAMiBCFBjYd0POFd1y7+DC0U0LF9XtjAj
         eVyFXL9tLnJeXwYY5xOaVNGEOlPSg/vc13nKMiDcZ64+AFzAPeiFO1/d1mrhRpAoS9JC
         xHJw==
X-Forwarded-Encrypted: i=1; AJvYcCUSRhqypzj3JUAKQ33bl1mU/GDciOEcMUFzOtLCM7esZadLQxO6FKUocFLKBQfRPlhPIVoL@lists.linux.dev
X-Gm-Message-State: AOJu0YwqFpihyAFFJ+AWWO1H9GTpjnzpzrZhBtiA+MewmixqVAU8SX6B
	W6keCQoHjI/LGOyC2w0XTeXh7zv/TcIxxKh3azvLQmscWp2srtuqXkfBYoA9lr/Svw==
X-Google-Smtp-Source: AGHT+IFNUFPkKsM/GwGBb2O2n7BjNQboPuqSWiDTY7/JXcmWwhOx3Fzua6Sfxz92XF91oinyvvfA5m0=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:a509:0:b0:e25:d596:484c with SMTP id
 3f1490d57ef6-e26383818aemr13450276.2.1727912062857; Wed, 02 Oct 2024 16:34:22
 -0700 (PDT)
Date: Wed,  2 Oct 2024 16:34:02 -0700
In-Reply-To: <20241002233409.2857999-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20241002233409.2857999-4-xur@google.com>
Subject: [PATCH v2 3/6] Change the symbols order when --ffuntion-sections is enabled
From: Rong Xu <xur@google.com>
To: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, x86@kernel.org, 
	"Xin Li (Intel)" <xin@zytor.com>
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
2.46.1.824.gd892dcdcdd-goog

