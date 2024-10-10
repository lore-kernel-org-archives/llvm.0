Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEF11CF2A6
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728588251; cv=none; b=XWd35K44G7xCWwBBA4j0nJCEJAoh338otD5y75kQuDudFfVDLCXYYBk4qNTzDJ+/t975Twgh/xHWP6RgioEx/9tEemCezIVb6pEdKy/RxlZ2ZFfkvxY4LKKJb93QupEebVehwtcY5L64NFsoFUoqDQJLmetRM5FUQFfL97FPtBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728588251; c=relaxed/simple;
	bh=B/fTpCzd8QlJMQ3iEfz2aTZvNZTM1lTyUzt5b6yEoHA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yy6XZw4KoRqdOFWvhGuFSpS3TNH7T451kTLqFugg9siqAqOr0r8Rm6Y7WFYQnqo3mOMib3F78vE+JGN7U9gWEoKjdSdRD05aiwuSkmD7JhRnjVLGv7pi3LLYFr8VkyCtuCu/pxsLsXMUyz42wf4kgDX2dA9hFRWKlh2B038KKog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p2Pvlrox; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p2Pvlrox"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e1159159528so3705931276.1
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 12:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728588249; x=1729193049; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pwVGeNhEiYELCNV51bxA2EzTaJbA2K5Fr027Br3jO4Q=;
        b=p2PvlroxSAe0qF1thlzd9se3Gyg18Gvc/YiYZKKNyE9j/2VkxI2j3Vja69JxJsynDT
         4ltaPFKTGS+7rDtlzqVxoEwxJfm5Imncuym2/C5DTJ8geCl9CqAUIHiXe+TbV3/0oGEj
         QRRmJrHzdgMevB089otoH5wEycIBwfxodhmlwzR23PU/x350/8kflwajCXg4lEFVeuZs
         Tw4bXclhKUjk5V0rBb45nNB+cq54oCT6HSpWBHbieJeoZvGLsbNF110IWYBJBVYXNlDp
         gImhD76HiBADGOR0p8mibp8OGuWohT23BfFZX1hgqFu7VB/5Zf4FzzrVpwJHNMLsCdOT
         mEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728588249; x=1729193049;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pwVGeNhEiYELCNV51bxA2EzTaJbA2K5Fr027Br3jO4Q=;
        b=Hh3sYv8PVOp/95AiR3LoVyMaM/G5Xp/Q8lihjFKtaA3f3BAoClnAMl1zS4oULBhv7J
         hyxepfgMrqfFeouHZKj75OwTgNJFmFFCp4mgYOOo0ZLR7d+f0obnTQHpN1pl9eTywpIA
         CYLRxz9oUGxBd0tO3hEwr+4XdgQ6z60EA3cQ9q5FYeEA0+UzUt2MJJ3RxiinC7A1bXbJ
         +8aZH8l8jwVwQfJWyDd80Pyb9gK4ALsyRTYufIQPUkfOSY0Ralsp9gKnLfakQpUg1fny
         znNrmx3CoZ6viLs4KHyH8NvI7tV8DAIP5pQGxqwr8qytFFQtnQo9z4/A9TZqMK/35SIM
         ioFw==
X-Forwarded-Encrypted: i=1; AJvYcCVhr69zdfvJ16FvtuTSl7EL7ketUfgy9HdnbKgzC/OlIFpga2qeuCnrpFLNW1dgXZ4FfH+3@lists.linux.dev
X-Gm-Message-State: AOJu0YyaMfpWWpW9oeOAX9nyZY5D3rzZOlS9h7E3RpdRjwkcLCouxPnw
	2CZh4piMRnXCtmv982CZ7kcYX5qdTXY2ssLpS+xxHv1KimzWt3MT65fQeuzNZK/QLg==
X-Google-Smtp-Source: AGHT+IET7ynYxoh2WLaFTqujq1dsN8li9OFmo1T7KNB2xR5JtuPPo+YvvfF+NvnbjuFxvNf7cf4DObk=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:b104:0:b0:e29:a86:fd0d with SMTP id
 3f1490d57ef6-e290bb40627mr73646276.5.1728588248551; Thu, 10 Oct 2024 12:24:08
 -0700 (PDT)
Date: Thu, 10 Oct 2024 12:23:54 -0700
In-Reply-To: <20241010192400.451187-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010192400.451187-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010192400.451187-3-xur@google.com>
Subject: [PATCH v3 2/6] objtool: Fix unreachable instruction warnings for weak funcitons
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

In the presence of both weak and strong function definitions, the
linker drops the weak symbol in favor of a strong symbol, but
leaves the code in place. Code in ignore_unreachable_insn() has
some heuristics to suppress the warning, but it does not work when
-ffunction-sections is enabled.

Suppose function foo has both strong and weak definitions.
Case 1: The strong definition has an annotated section name,
like .init.text. Only the weak definition will be placed into
.text.foo. But since the section has no symbols, there will be no
"hole" in the section.

Case 2: Both sections are without an annotated section name.
Both will be placed into .text.foo section, but there will be only one
symbol (the strong one). If the weak code is before the strong code,
there is no "hole" as it fails to find the right-most symbol before
the offset.

The fix is to use the first node to compute the hole if hole.sym
is empty. If there is no symbol in the section, the first node
will be NULL, in which case, -1 is returned to skip the whole
section.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
---
 tools/objtool/elf.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 3d27983dc908..6f64d611faea 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -224,12 +224,17 @@ int find_symbol_hole_containing(const struct section *sec, unsigned long offset)
 	if (n)
 		return 0; /* not a hole */
 
-	/* didn't find a symbol for which @offset is after it */
-	if (!hole.sym)
-		return 0; /* not a hole */
+	/*
+	 * @offset >= sym->offset + sym->len, find symbol after it.
+	 * When hole.sym is empty, use the first node to compute the hole.
+	 * If there is no symbol in the section, the first node will be NULL,
+	 * in which case, -1 is returned to skip the whole section.
+	 */
+	if (hole.sym)
+		n = rb_next(&hole.sym->node);
+	else
+		n = rb_first_cached(&sec->symbol_tree);
 
-	/* @offset >= sym->offset + sym->len, find symbol after it */
-	n = rb_next(&hole.sym->node);
 	if (!n)
 		return -1; /* until end of address space */
 
-- 
2.47.0.rc1.288.g06298d1525-goog

