Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA39817B4EC
	for <llvm@lists.linux.dev>; Sat, 26 Oct 2024 05:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729919664; cv=none; b=TUgeqQaTWFIPENLsxG6QOAJ6MkgT7c2ywQBUZvTh48rXtkxjS8DlSG+tvepBSBnwum5Z++0ZFMxCW3Ckgqn8QdsJ9JFVlHd5vNT85CPI0QufN4e0QB3hSYFYHVlBQJkuuk0/Wkpojf4uIV3b5eWFWlU0YBYStKLluLNj1fwyPfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729919664; c=relaxed/simple;
	bh=1XrUOxm67YWKXJl5eYiSXjUO7TsxxJAwupJPPiPx+ik=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y7xFbI8lLzTj7VZYQ1vSGpNbp/cul+QHQ/0Rg+UfkrR25LcEMAp3zDoEQ5GzA+O9ifJWBXPGQQb86N8XmjSYRLJHP08ZkEIjHuHQucTJyRLE0SiIPHVEg7bKyoW9ifPEcwr8jJ7JG7KHyGo92YrPuUQF5pfLwnxzw9uwSZQIUtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aMkJV4Mc; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aMkJV4Mc"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6dbbeee08f0so49257877b3.0
        for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 22:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729919660; x=1730524460; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwocKGHgUXdsFOwFTTEG/FtIpm0PRyvg4LHAdc+/Z6Y=;
        b=aMkJV4McGKZTSIbKpuyOh6JFIAagg76R0A5CZdKvctg+lm4/+GeoDfKnH+I4jtVKMD
         iAu+Oi++XfF5uk8SDekjB0PBRu0KANInVa6T/469bkuCTQ5o0j1tseFxNjpso0pvzAKg
         rS8qa2pOwI31eaQ1vDTTvR39aJh704tJLXJHVr0XX3olAG+PqHrT/gipRpXseX6jqevZ
         KRnWqPWSpymq1VvxHOJzCkWjbCSgSIe4wr+pUa+6GHlFgPtTwcMpRBTOcYYBAtyN0sgO
         w48xaCecZtD8noW+W1vHQud5Skn7bp7WnAO1CcEL14BnzST1acKt6Ek8lLlahkgUTKPu
         LC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729919660; x=1730524460;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CwocKGHgUXdsFOwFTTEG/FtIpm0PRyvg4LHAdc+/Z6Y=;
        b=fff6M5aBXdwU8bVQkd7S13EUaCc820B3UYthDlLkExBV+/J/TxufwrM1kraUUVK0/z
         EubywzT9XyGVqMa5f+gAbhPVlaZzG0H8rFHSoNq1SdLqeAH9l/7pmvNzeWetwUnqwHn8
         Gs4eRb8RovSA9L7Xc5V7/V7sNqcNOWwaZ/R8rbZA/gZWEuRraj4ioNjWWP2tj5daMiMa
         e628RCArJaMU86Pvjd7SvpTPFCFxUXaE8QSzdMHvEnmpatlOuhOsZ1mqnx/krT/8YWfB
         Js5Br8Ih+VUsHjwwYvALuTAuPzeBRSIOzAad4SeZJHZd7uftCozlAo/cSZyEQWzTqQyz
         6vKA==
X-Forwarded-Encrypted: i=1; AJvYcCWYfYAe7SJ0r8quLPO0jPUR0CpOrkIPWDZn8EW2AcCBFCu3+5g0ORVBlTlk8DfvagF7l8x1@lists.linux.dev
X-Gm-Message-State: AOJu0YwWFO+DRBDhTNms+bWBU9D1d015XjgXkTPZiU5kdG2E9g+s4ZJ4
	bX6DnFSq/QwWQCVPGVDPFOUNSEOsWtdOsyBwvWtPsShowWlBu3gEi53WlgWkJbo47w==
X-Google-Smtp-Source: AGHT+IHOybZXxhNpcWagz27422zYFTJPt6BbXSY6n3vTTmRzykMssE9klEXOQCWXoubA4ZID9e6yGv8=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:74c4:0:b0:e29:9c5:5fcb with SMTP id
 3f1490d57ef6-e2eb86c806dmr64101276.4.1729919659655; Fri, 25 Oct 2024 22:14:19
 -0700 (PDT)
Date: Fri, 25 Oct 2024 22:14:05 -0700
In-Reply-To: <20241026051410.2819338-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241026051410.2819338-4-xur@google.com>
Subject: [PATCH v6 3/7] Adjust symbol ordering in text output section
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
section. Specifically, it repositions sections with certain fixed patterns
(for example .text.unlikely) before TEXT_MAIN, ensuring that they are
grouped and matched together. It also places .text.hot section at the
beginning of a page to help the TLB performance.

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
Change-Id: I5202d40bc7e24f93c2bfb2f0d987e9dc57dec1b1
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

