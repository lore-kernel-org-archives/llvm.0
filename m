Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C881FF7B9
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 22:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723475; cv=none; b=Yu6nGbOf8j0z21lsN+gQOcra2m7aek9g8P+kSgmBfC3MhOQnUDgB5529E38LoGy9zaENPv4Uwe3VkfM5zWgeAD2JPqUo48iUrakzkNyC2YLpN9Ez9jOqyh2gGzWzTLKAp5EB1Ap82bHpwpZ6lgdSpKe011BWgBZDgg3npQ652e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723475; c=relaxed/simple;
	bh=XCT6aaTLHKjPcWknzKtL2kN2dgyL7VsWQXuDCGu+eS8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z0KmW3GEMWEn5qS3baRzxYHdjuZVewUIQXtZ1KMJGZKbSFwOJU3OYt7kB5uH5+lEiLs1PCZJq2nzz6Y2M3/C9Rp6bAGDt3iuTGlYgGlwtegtsysn0qYlf3ZSwN9vNpEfMFUHcWgHBRJ79Yy5O/y+LUq9M3pM6fwOiFld5Q1MSQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jdV7VXrZ; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jdV7VXrZ"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2954ada861so633941276.3
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 15:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729723471; x=1730328271; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/vLG0anO7BwgfLeQ/LDy3VoS1eB3+zLyO2ls8DxPK6U=;
        b=jdV7VXrZOPBuHWHHCRw4no7413ilsTB3CUU3mmNOCxk/8GgfBWtwuEey0bPRAgRamV
         Hiayj4JnJ+SW93fb85eaJfRspjJ+kOSN3czFs3fhvjZq6QvcGtu7DgvxhJDIrsP3XKS/
         8j34wpHWoMtPSUA9VvamZTROT28XEJtqtJ18AOCkgZM4b+FZMZYbPI97KrW16W+f0lFI
         D1bzRD9nEU9fZG0z1GY7CGDsSzdxclb0HeXV/fBl1NlkBCiEZ6kQqHwUnpDRUvEGdzs/
         jjBqZgZ7n9iyXUMvAVhH1lejRUBLccVfIORYslhUX3BwTJQhFOKx+pAzJNWi1/5OpQF0
         igIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723471; x=1730328271;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vLG0anO7BwgfLeQ/LDy3VoS1eB3+zLyO2ls8DxPK6U=;
        b=fEpmzGkfY7CfIM92z2eFEZOtJLDI/GvATjx+mYP3XbMurOwFinf6cyuGuR1LBUpHcr
         FCFkhwCUly5TQ846SP8ahF+9u8j47m1Em4fwYAYT4GCIEyVWhX+U4sp4euSpS7DdlVW2
         UShz3Q6DqJSpgla5AzDjoVINlrKg0qHGyWzUMsHavLygIGDvS6zNcl5+LCSWnAv2qk+F
         qM530QLiHtHMZ0OEB5JQAMU712PeKfxViR5JQQbRY9uvJo0f76EWW6ba851Q9leE7jdn
         SK6ae/cXSxgpBMMSp4Hft+Kw5srj/u6SAnAEDGPNg9fVWUVdwTFwKyzECeR1HiVhiiTq
         IyIw==
X-Forwarded-Encrypted: i=1; AJvYcCUj8z1yS+59frHSR7kyWmKxXGaFehipew5k3/g4Z4f9LB/nnDxMYPIqZS3kc4Otqz+syuuP@lists.linux.dev
X-Gm-Message-State: AOJu0YxvzNfKRQmxo1eTB6X+oGasWOcQcxq2+Gxoh57nIdMsza0uGAmu
	AJD1YZOi192wbsQExTjM445WWAYlc59MEWZT7XrQvQtJsWPEyL/T1CIL0X5+sMsLxQ==
X-Google-Smtp-Source: AGHT+IFVfeyPxqRI2j0ASqUhKvoQx2zCQAV5DC4JpUQnoNgn6IsLNLrBhRCJGUXKM0TlEVsIqSS9Uj8=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:b307:0:b0:e25:6701:410b with SMTP id
 3f1490d57ef6-e2e3a652cf0mr7023276.5.1729723471236; Wed, 23 Oct 2024 15:44:31
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:44:01 -0700
In-Reply-To: <20241023224409.201771-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241023224409.201771-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023224409.201771-3-xur@google.com>
Subject: [PATCH v5 2/7] objtool: Fix unreachable instruction warnings for weak functions
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
2.47.0.105.g07ac214952-goog

