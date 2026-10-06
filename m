Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5C468C11
	for <llvm@lists.linux.dev>; Tue,  6 Oct 2026 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294323; cv=none; b=qlRZns2ayMh0ssZS2JPeDg5Bfmq+LLn2CXwlBGQe4eevbnkuQhJ6FHyTcZhPyDpx9SWpMK+rmk8bwHswbfdD40xTDvJMMvjV9tAWClj/+q7+2hGywCxDpXbvVgCXLrJfVySdzz+bnKg9TuDzLQ7QyR/wp8fh4M45w72nodMU3Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294323; c=relaxed/simple;
	bh=IZ1KgkZ9HhibMzlDJkfocT5UZkP1G/dkdYUxLrk2pEo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lRq/o/PMxgL1j626yibLK/w4BTPgk7a+uSOiZHAn6ZCQujOOf25ls+B6ofez4XoS8vKmmjErDNfizGFzxIrqag2wsVWs0/pT8EwutaV3OdEnXq8lFWOWLFrvqGLfWh/R26/MbI8eCERgWyYPHPaHFk4wOlcBV5PEeP/5RzljAoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hWztcyrx; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hWztcyrx"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1971948a12.2
        for <llvm@lists.linux.dev>; Tue, 06 Oct 2026 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791294322; x=1791899122; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0cBA/5+tptwkOGCjlxa+cIEqx0sO9oAIjy8KYCtfpQ=;
        b=hWztcyrxM80y84UqJ2Tjgog6OO63LN0Y77em/EsezjnChb1v0PedxXcDMryTQMlIl3
         HFHbaBv75mCSGGsSddJtnDP8owlFpeMU1VwRf4vRjTaDLQjRDVDLIcW764gUrDMIDL6n
         DdV6OUyCHd7MTUzUy5FiuvLpZMBZv1BRwBwRNM2zSqFMg/BRwHkI9Ba7KXwjezmjnbf4
         cBiWeuvMizQ/aznUKG9l2Ivhb0T98qUI6xnwgflutHumxbF28yxCJUVCdMKLR33fvG+l
         AfqzK5X4Cc1klcKYd+2LlaYMWCsQhw/VQDH9iPEf8D+LYM0givraygTDhwoeTEVVlAlS
         fHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294322; x=1791899122;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0cBA/5+tptwkOGCjlxa+cIEqx0sO9oAIjy8KYCtfpQ=;
        b=qu0E/tnWhbHUyg17hsq2b4aPKCXTyBCdUEROUrfY1ZymvFxjQviPvZDSCnfPzd4Rqs
         gzd/YY6R7EUKzQxH9vNXYQhRmUkNV9wSf4rXeoy9ulcnQlOds1HI2kQ8zMmORTheXbOF
         I8wwCahkDzWWhx/S0y087LVeAA0q4z96z3cyDFBEUfgVQIxfNI+ousblJsobtZNFN4uv
         4KbnaGikX4cbieterpU2hj1rOVcmCbMvwhlkwmwCfAMNoY+BoX93mliXI0+UFJgZ32UW
         ojK2OAvejHNNQkSdPSNej0Rwvr6SjbTaNVvIrFLEC93SArxMhHzDwy3AtSTpvfusz2Qx
         I7Gg==
X-Forwarded-Encrypted: i=1; AKwUvBxT5y1nDCQs3UbbECiftbz2pjgGsqGGfodb5vpQBWrNd4h1ZTSI+Q/tn+VcLKTauxJxAbGa@lists.linux.dev
X-Gm-Message-State: AFuF++n1e3LAHmjBlmWsKTPBr+6UT7hSoMHtcnOTFj3IIUkA5EfbSVoj
	TntkwjivlOCwdcqgdRrBejGQcvK+d3JBANDExTA4siuJdTWuDAkEw8znPMX/mCDoUc7a8Ha2EtN
	e
X-Received: from pgby20-n2.prod.google.com ([2002:a05:6a02:6514:20b0:cc7:8224:dcaa])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:138c:b0:3de:60c1:fee7
 with SMTP id adf61e73a8af0-3e124890bb3mr1103292637.44.1791294321320; Tue, 06
 Oct 2026 06:45:21 -0700 (PDT)
Date: Tue,  6 Oct 2026 13:45:19 +0000
In-Reply-To: <20261005102518.2400984-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261006134519.3033941-1-morbo@google.com>
Subject: [PATCH v5] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: Kees Cook <kees@kernel.org>, ardb@kernel.org
Cc: gustavoars@kernel.org, nathan@kernel.org, ndesaulniers@google.com, 
	justinstitt@google.com, broonie@kernel.org, elver@google.com, 
	alan.maguire@oracle.com, namjain@linux.microsoft.com, peterz@infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

Code that runs outside the kernel proper, such as the EFI stub, gets
nothing out of the counted_by annotations: the bounds checks they feed
(FORTIFY_SOURCE, UBSAN_BOUNDS) are already disabled there.

The annotations can also break the build. A __counted_by_ptr() that
names a member declared after the pointer needs Clang's
'-fexperimental-late-parse-attributes', which the top-level Makefile
adds to 'KBUILD_CFLAGS'. The x86 EFI stub builds its own cflags and does
not get that flag, so it fails as soon as such a struct is pulled in
through a common header.

Overriding the macros from a Makefile doesn't work:
'compiler_types.h' is pulled in with '-include', which is processed
after all -D/-U options, so it re-establishes the definitions. Follow
the '__NO_FORTIFY' precedent instead: let a build define
'__NO_COUNTED_BY' to turn the corresponding annotation into a no-op.

Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
v2: Only specify __NO_COUNTED_BY_PTR. Leave __NO_COUNTED_BY until we need it.
v3: Add the version to the Subject line.
v4: Use __NO_COUNTED_BY to reduce churn later on.
v5: Probably good to add the logic in the correct place.
---
 include/linux/compiler_types.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c5921f139007..932e81e7630d 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -371,8 +371,13 @@ struct ftrace_likely_data {
  *
  * __bdos on clang < 19.1.3 can be off by 4:
  * https://github.com/llvm/llvm-project/pull/112636
+ *
+ * Code that runs outside the kernel proper (e.g. the EFI stub) can define
+ * __NO_COUNTED_BY to drop the annotation, since it gains nothing from the
+ * bounds checks. __NO_COUNTED_BY should be used sparingly, because there are
+ * better options for opting out of bounds checking.
  */
-#ifdef CONFIG_CC_HAS_COUNTED_BY
+#if defined(CONFIG_CC_HAS_COUNTED_BY) && !defined(__NO_COUNTED_BY)
 # define __counted_by(member)		__attribute__((__counted_by__(member)))
 #else
 # define __counted_by(member)
@@ -388,7 +393,7 @@ struct ftrace_likely_data {
  *   gcc: https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.html
  * clang: https://clang.llvm.org/docs/AttributeReference.html#counted-by-counted-by-or-null-sized-by-sized-by-or-null
  */
-#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
+#if defined(CONFIG_CC_HAS_COUNTED_BY_PTR) && !defined(__NO_COUNTED_BY)
 #define __counted_by_ptr(member)	__attribute__((__counted_by__(member)))
 #else
 #define __counted_by_ptr(member)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

