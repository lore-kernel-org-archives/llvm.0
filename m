Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C8478276
	for <llvm@lists.linux.dev>; Sun, 28 Jul 2024 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722198655; cv=none; b=ITEuDYzLRSaANyEulcPyPqdPQ3n83zWiGVFh17XLq+8u70BWh7Qe/4q2rRoDPooXJI0L1n2mIn1TxNJ/3yuucQocdZ+7n/GQdNdEVWlUBtQEjDOkDjUaQgpOeuMumFqWX+NzcC04wLg2BZ5ndw2xk8bbmWVGegXSUkqPqmS7RZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722198655; c=relaxed/simple;
	bh=FBqzozWJhNvJ4oM6y6ThYCUCO6Sc4TGcBQGQrbyCu+w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KNj1YhlKLTMTQSsx/zVxgEDF3c+FQXrDqKUGyXJdXbxQm2y7BqDZT4ZZrcYfqJDQDHOxKtO1OY9lAqooUJx1ogZB5qHl2XPdcWMVMHO3WWEPqkAv6CpYj9s9khqltSiYnV2VJZ2rmGpr2WT05SzzWh4NJXvS2p5Y3Ei+pdC1vV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HnvHsx8D; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HnvHsx8D"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e087ed145caso2544866276.3
        for <llvm@lists.linux.dev>; Sun, 28 Jul 2024 13:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722198653; x=1722803453; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dHGeCL3vH0qLBFDWm8avFROR6jr66E4NssJlgZilgo4=;
        b=HnvHsx8DTHwajUGipm7wxixPAUbYxseQK2iGS2bD0QhkYdzqGAIfoE+VbYl4K7RanK
         tpmVmbBg/NHGJhohhwPUUCkd266KWmFpJWd8RLe4klFNDm+611RbokJkCdOMqbOh79PL
         gH7JmyrJMi+rU7Cdo9sPJKXEY5Fl+F/FjqXoBsC0ikH2C5XjFv1TALuGtlk2OZXWgFPg
         71den+lsMYycTSR0O3gcqjy+l6ay02l6Opc2N8shF4c88vc4AbC4Fs/hSeyGukslvpoJ
         lfLndF7Z8MuK0POlntNERIQIgqXaFembg6QrWAoWcispwX9FNXEH/+7aMOERKu/FcBxu
         PuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722198653; x=1722803453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHGeCL3vH0qLBFDWm8avFROR6jr66E4NssJlgZilgo4=;
        b=ou6yR0YIw+E/4czb38wlJ4w6QCCr1xG6P0nYTUAF4QuCN214Ybi7pzFoCasePihnLF
         AG5H6ZZdo8a42jYdzN/W2BFJ1gHD6thPKAsGcrtvQ2Y3Tk6q52tze+ZUT+LEaJgtSxAw
         ZFMpPP7wraI5CK8MSNegbiiIOFwpd5Jh/np3VzGBbldlun3NFtlG3w2sZlgc0UBsbxEQ
         8RYOV2u4038lgw49h4doI76CKiTiYd7wxZuKmRRh2KPDJmMGXPbFmqHQCSE7XOSCPR0k
         yRZQHKwh6+aICyuVwtea4R7eNiR6uSoA94fdBlLwwNPCeFX4hQF08qZk3wZ8z0EepdCH
         0CRg==
X-Forwarded-Encrypted: i=1; AJvYcCWI9M0/IqQGbZhK+w7HxBXwYomcmTAt8Aevz0Jfn5ExtGqt0EJ1wVOzEe98vv57D+l0wr51qveeb+v4eKugU4C4WsGwcQ==
X-Gm-Message-State: AOJu0YxLghFeZlHokj837Q09O+BqzEJWDXaSeYsWbg2WjPoFQOPwsLcK
	SnCxMxoVQr9C4ezeqNLI5WueV4X0ovXD/ptB1TkNOc+/3a6l+vjnObPw59Qx7GnxGg==
X-Google-Smtp-Source: AGHT+IFbB1GtuSWiJ25Z5CJHBsZeUzd/7OcS+ZwDnzKKXYJCUjO8F45P4dz+nwWaMnszX5UCfblv1II=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:6902:1248:b0:e0b:10e9:88f8 with SMTP id
 3f1490d57ef6-e0b545590famr362781276.8.1722198652426; Sun, 28 Jul 2024
 13:30:52 -0700 (PDT)
Date: Sun, 28 Jul 2024 13:29:55 -0700
In-Reply-To: <20240728203001.2551083-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240728203001.2551083-1-xur@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240728203001.2551083-3-xur@google.com>
Subject: [PATCH 2/6] objtool: Fix unreachable instruction warnings for weak funcitons
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
 tools/objtool/elf.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 3d27983dc908..fa88bb254ccc 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -224,12 +224,15 @@ int find_symbol_hole_containing(const struct section *sec, unsigned long offset)
 	if (n)
 		return 0; /* not a hole */
 
-	/* didn't find a symbol for which @offset is after it */
-	if (!hole.sym)
-		return 0; /* not a hole */
+	/*
+	 * @offset >= sym->offset + sym->len, find symbol after it.
+	 * Use the first node in rb_tree when hole.sym is NULL.
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
2.46.0.rc1.232.g9752f9e123-goog

