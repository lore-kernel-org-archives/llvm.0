Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437181AB538
	for <llvm@lists.linux.dev>; Sat,  2 Nov 2024 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730569885; cv=none; b=k3ojOQH1tx4ZNKd9psvVXpiFAM0IxoPQHlQ0pQ0af67GFOEcx8KafvaX+m5Fbmuhx4JYhR2jNc0wprBvHLz/I8Hfp9JIMrE84fD1PS0CH3yG4e50sZRReFV3Gsp1ZNZOjH+6jpIAOMLuy5AycogFVVW404xQJEc13WFg83GK0N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730569885; c=relaxed/simple;
	bh=Qds4NA90wa7TDHswITaOk/cdYok8wTYQZzXcL+D4NoI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oB0aLT/CUK3tKJs0W11e8IPi0eodxwkSVAxdTJ7bqK6G7xygnADFp0ukpH0zWln/NWtsvtW0Xtagc4b+E0tyAyjf0gkn9bNO8WN9hFedx42N4trP5EWnSPGjO7Ujl50WWVtajNXCQEw6VFvC7K1lOubrKvPJkcAfiwcBvA5mxNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CuC+N5F7; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CuC+N5F7"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e293b3e014aso5259928276.3
        for <llvm@lists.linux.dev>; Sat, 02 Nov 2024 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730569882; x=1731174682; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AdNJKHFZmgNekvTR2PzJwqsJcKVDg6QKteiEhFTxb0g=;
        b=CuC+N5F7frKtjSPeCbZM6KK2yvOQpRCTUxc9EQ1fCAba09QVHhanz+aKEcMpmZECtP
         22ptNU9Ie/x9wiikwO1X4lfdqUENxMowM6AKQTaRkmq35IsJ8/zm29CfZXMmAOeUfbl4
         S/9NcDCrsb/VNX1ti+M7lyRB8SKy3W7iKMA7FbTESC5rWZSLws+XuoNawOXT/jTf6Y/d
         jU7J74TqFxsAD09ApZVOEQKh4lmoemi5D3wg9UCIvqbVjtcvWh5CVhFcWZW4rMJG19ly
         osaSgIVoEUDh0RmzEmWow5cdvl3yYLE4LTrYGe4qGUUXxY80dzP9PrVcFmTKoErVzmkk
         ZSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730569882; x=1731174682;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdNJKHFZmgNekvTR2PzJwqsJcKVDg6QKteiEhFTxb0g=;
        b=PDq1U5NbjBdSeG1ik0r6z82XgzMnSru49NtK5V2P1KDQIDbEhiU4kDH/VSoGrIfx9q
         QKUlfDItQu653aRcBLoeuPh1I0/ltGBjkOZWYPqHJgh8jbrLLe0JQZkVLB1TTVgRGqHY
         O6g+2gy9E9VUcLwAP3hndQrFj/S2xs0W0JA17uPyUnPKPxtAyKrS2coaOS4n03mGhv6O
         gNeJdDnz/v6FFl78vHPnycq4kUIKLpXzLDEcjDWo305W8HkYTRmgEjbssTFsUFyp+TOd
         ZGF69j/dDi5UEr9S1UFb7Nmvd1E55j+56qOfDK1B9AZh28unlyN0vfdJWUQt/fEXP/jU
         /PVw==
X-Forwarded-Encrypted: i=1; AJvYcCXGBHddp5CXA5AgB5FAHYmhcfFSAjH7TAoz6SZK0eFs+ubEkDk+yDdpQ2wdLSzuATh110fM@lists.linux.dev
X-Gm-Message-State: AOJu0YzPcmL1n2qBIKUrJyeMqvK/T0emSj7+bZdKDhYT6hsSwANBlmwC
	im7TtDBN99BZm8b/dni1+Nbi2orkCBS9Ik9VVFXvrPCi58zIz2xusEMwwPXyyDnF5A==
X-Google-Smtp-Source: AGHT+IFrvTh9yGQeIC99rDaSyohlIWmY/cd98cXWXWBBtOnvULrh4CKCoiBDwd6yf44KtAXaT7swZbs=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:a291:0:b0:e28:e510:6ab1 with SMTP id
 3f1490d57ef6-e33026b3c56mr4382276.8.1730569882127; Sat, 02 Nov 2024 10:51:22
 -0700 (PDT)
Date: Sat,  2 Nov 2024 10:51:09 -0700
In-Reply-To: <20241102175115.1769468-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241102175115.1769468-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241102175115.1769468-3-xur@google.com>
Subject: [PATCH v7 2/7] objtool: Fix unreachable instruction warnings for weak functions
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
Tested-by: Yonghong Song <yonghong.song@linux.dev>
Tested-by: Yabin Cui <yabinc@google.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/elf.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 3d27983dc908d..6f64d611faea9 100644
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
2.47.0.163.g1226f6d8fa-goog

