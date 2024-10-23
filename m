Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE99D200110
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723476; cv=none; b=dnH9JJl8vVuUxemaQtb5zzafqrf9547TF7jm/RsVCUiaQqO084+pqaAuSUITPZVOZX0YMW3eEsir8CmLKD4C27QYqTfO7vAz9q28iO/P6gl0MDYF8ep6by2FZXHUmgtYvSTeHzXGxp1Z+22AUayD9PO2GH7kiYtL+/HGWAddBMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723476; c=relaxed/simple;
	bh=3Jbi42B7MMxAUyKySYJN1PoZK89JNHXGH1zqEMYynH8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X4kMjnrDPD3dOWXgzJBJJZVbagXLgUIdw7xM4nSg0aBUMNNGCXMl4GUQXKA4r5xoRfCsBL9qYclxqo/sR6hITCqwopU2kb4zjIFObvTqkA1XjtMKJz1VGMFAxVveoRZ9deUdqClAmEyteAtfXf+GwaLQ+6cKNDXJpI6x7icwBns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZjOY1Zzi; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZjOY1Zzi"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e28edea9af6so600198276.3
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 15:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729723473; x=1730328273; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIBp2l/GHqrPAEiRmUPoNj56KvivSq7/gCNmPiHnCkQ=;
        b=ZjOY1ZziOx3Sn/BpA4H2MOOobUhpnGbj1MlivBR3mOQXr7cfFg8IewXlTLUPClgtk/
         JyAVvUssHvFdI7OTEFNuWQ2StQUMRShza8TwM3TlAWEehFBNznSnOTasJ/rALnH+nOb/
         dD69096IrusIZk+8Va/ntN0r8PuCeeiLrdt2ZcrGrBbitWPtYjfEFKw4J+4TcGtsdR2a
         cNOi3GXxh3Xdck2CAi43NYmGfZMDPe8ZYFUnCT9+zPyjMhY1F0nVqb1u6twOBNBKkArt
         KnvfCjAOnE4DaW545bAA7HwLWqtebcnBdHdm3Cem19LFvXZgVUkcGqNT1t5msqlxfOeL
         r8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723473; x=1730328273;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LIBp2l/GHqrPAEiRmUPoNj56KvivSq7/gCNmPiHnCkQ=;
        b=sSCC+EDJxVTj9wayoPRpWhta6qktvf3Uv61W6QYWpP1RNhzWvXVPnGvHkr68wzM5rv
         8zSw9YdephkMJe/7QyBxNkBG6lkbA0p9kYKaN/wf0cBST47Gl0N9O6O1iykRhRBjK0kw
         B3MnAP1bqZuXYnX1wSrIj/+dYhZJCT6zmvR5nRmxiz0pSE/76jO++al4kRUQK788RDhi
         EA98lzd979V945L+13daXQqVglaOjL5wLJc1mcw1VGzZK6f4uvVyN+p3FdnHHrLG8vTm
         ZPMLEPFl56xTmlUytdUuHxZJWG/jNF07FiOzOpWWuRWLNKANgByWbs6UWlNbkOMzMquy
         f9MA==
X-Forwarded-Encrypted: i=1; AJvYcCVWyz7r9VR4YjXndmAriDUw7AHXWQnhuhPQJLzkyp/JHJFP2a1tFhqsJa6dCnGn5lGibrTG@lists.linux.dev
X-Gm-Message-State: AOJu0YxKMhe1I2YT5CYAT24pdgOFsJU2B0HQUlYEto2xrmmmNP/+F9Dj
	vtvCQpjHeSMQsdfrSbYkF5Wv3YGMQyjx3/s9Fo1ViPWE/scZ9sApwKD/vmQCNf8ZZg==
X-Google-Smtp-Source: AGHT+IED6bhx75V0sSfMV/OQ93Tz4In7ZYA9aOg954NRkaZQI1kaQhNFY4eirsaXsu6I63QGL5SLgN8=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:26d0:0:b0:e28:f231:1aa8 with SMTP id
 3f1490d57ef6-e2e3a60a6f9mr6900276.2.1729723472853; Wed, 23 Oct 2024 15:44:32
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:44:02 -0700
In-Reply-To: <20241023224409.201771-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241023224409.201771-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023224409.201771-4-xur@google.com>
Subject: [PATCH v5 3/7] Change the symbols order when --ffunction-sections is enabled
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
section. Specifically, it repositions sections with certain fixed patterns
(for example .text.unlikely) before TEXT_MAIN, ensuring that they are
grouped and matched together. It also places .text.hot section at the
beginning of a page to help the TLB performance.

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
Tested-by: Yonghong Song <yonghong.song@linux.dev>
---
 include/asm-generic/vmlinux.lds.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index eeadbaeccf88..fd901951549c 100644
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
2.47.0.105.g07ac214952-goog

