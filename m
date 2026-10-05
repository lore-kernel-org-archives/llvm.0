Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897823F3288
	for <llvm@lists.linux.dev>; Mon,  5 Oct 2026 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195930; cv=none; b=Aiyh/UazIQxpujVJTNHCdiXFGmXI76jcMEho7ph/vqK8eBNrq9B3xGyu3Ts2uilkTgtUYG19/m/u5s50+m906FZUIWwFn0EkoDSCgZ7SiZysJGV1G0UugRrW5H/vdng3JM/mGghsDK6yCTaabBmtnlzK89Gyr8yFdhlufVwwc8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195930; c=relaxed/simple;
	bh=Io3fIF9BNss8Km6M0FV2tc7qcoWBH3l03OVkWOHzz8I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KlWvRUYVOV1fH1HIEBz7tsVMbCo6crhsEDm/nUx2Xh/4uhZ+4QM5o5H+RcP2q0NoiKg01y9W1qjDhzHDoOTh3y8aD4PFvvlUv+jPEArG8Cd2M7+JMIS4gIj3cshG1LdbhGbmQ9Z2tjbgSTPfgA4eg5zwC1ktAfHKx9CjKBmXFIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eNJ9xLsq; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eNJ9xLsq"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dc7337e2a7so17371635ad.0
        for <llvm@lists.linux.dev>; Mon, 05 Oct 2026 03:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791195926; x=1791800726; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cbnu3lsAhceXKSk5PsEBfDmDotO3raLGAh2+zkflZSo=;
        b=eNJ9xLsqQLdWe3CAsGoJ+0jPu7puQ1gW+TOjAZkuH2U78jGnDG9FopxXGzj4eVu68L
         fIti9meq6mFDX/EHGvIbJ1Fc3J0OADMzSfUzEr6CL/uZ2oBhueshMUfBLI0U1O+C7Vpu
         IDqVWnZRRxWVkze2bUpfZIqGaDnE9pzgoQixbMz2v8+jnU8fkE1u7pkJ7MHsUklSOCHJ
         R1ljvFnWDzY2iNObwZ7sJCAbVank1ql9yu16f0Fk1iFZsexp9kIZ0gwvoJgaTp8/dAxi
         aeLi2Sa3hmh2FapqMNe1URIKpwr3FNuxjRjQdwjJYR/3QruLDWNY54b7g2qTo3M19+o3
         s5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791195926; x=1791800726;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbnu3lsAhceXKSk5PsEBfDmDotO3raLGAh2+zkflZSo=;
        b=i2t0bmRIlXoLRhImCta97ajueqp8VvB5QF09asxVQ5aN6t3Rg/tWtw4mGAzuosK4EV
         KJBkVewHCcZR2pZbK5Oixf6E49pQ7o/kJuYqmKBne9MF4ElgmKWM18AeVzlzT4qPst0M
         uThTlGwfyXGFiRChhL+qHBzXwS1va3Bu7O7+IqPCgiGJkOAvRjyl1t7qHS51KkKUVF4Q
         AjvYhMEObVuz9H3GQcTKx3G3k+ss00dfjhEdTXmopiza4DuPlfCxHfSMzAL9u//BRdCW
         4TR8Or+3Jn0DtEJEulA++wIgtJMyPrMp9tO7557eqYCTEnyvdZOMNYQi7Gy+K32YT2/v
         oECg==
X-Forwarded-Encrypted: i=1; AKwUvBzNLVt7QTz4CLKAgLkXv+AX0/YIQJssH1KD+WdWlodHieG9Kbgd0z02vZh4KKFexKwENCEY@lists.linux.dev
X-Gm-Message-State: AFq9FYL+X4B5D0j4uRef7SDKy0SpOHlksIY5sYh0c8fb7Wigrmsm5hB1
	4HzPAV/CnohhlZLEUWAFoAR8VvkgStWkDmgeYsbrAGYsGy6FiGsVny/KTbZnN59ZZgrtS7jncCY
	J
X-Received: from plxb1.prod.google.com ([2002:a17:902:bd41:b0:2e5:64b0:3c92])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef09:b0:2db:2376:6e8a
 with SMTP id d9443c01a7336-2e510528670mr70048085ad.9.1791195926259; Mon, 05
 Oct 2026 03:25:26 -0700 (PDT)
Date: Mon,  5 Oct 2026 10:25:18 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261005102518.2400984-1-morbo@google.com>
Subject: [PATCH] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
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
'__NO_COUNTED_BY' or '__NO_COUNTED_BY_PTR' to turn the corresponding
annotation into a no-op.  The two are kept separate but parallel so they
can be folded together once all supported compilers handle
'__counted_by' on pointers.

Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/compiler_types.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c5921f139007..916a946f623c 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -371,8 +371,14 @@ struct ftrace_likely_data {
  *
  * __bdos on clang < 19.1.3 can be off by 4:
  * https://github.com/llvm/llvm-project/pull/112636
+ *
+ * Code that runs outside the kernel proper (e.g. the EFI stub) can define
+ * __NO_COUNTED_BY to drop the annotation, since it gains nothing from the
+ * bounds checks. Kept in step with __NO_COUNTED_BY_PTR below so the two can
+ * be folded together once __counted_by covers pointers on all supported
+ * compilers.
  */
-#ifdef CONFIG_CC_HAS_COUNTED_BY
+#if defined(CONFIG_CC_HAS_COUNTED_BY) && !defined(__NO_COUNTED_BY)
 # define __counted_by(member)		__attribute__((__counted_by__(member)))
 #else
 # define __counted_by(member)
@@ -387,8 +393,13 @@ struct ftrace_likely_data {
  *
  *   gcc: https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.html
  * clang: https://clang.llvm.org/docs/AttributeReference.html#counted-by-counted-by-or-null-sized-by-sized-by-or-null
+ *
+ * Code that runs outside the kernel proper (e.g. the EFI stub) can define
+ * __NO_COUNTED_BY_PTR to drop the annotation, as with __NO_COUNTED_BY. Such
+ * code may also lack the flag Clang needs to parse a reference to a
+ * later-declared member (-fexperimental-late-parse-attributes).
  */
-#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
+#if defined(CONFIG_CC_HAS_COUNTED_BY_PTR) && !defined(__NO_COUNTED_BY_PTR)
 #define __counted_by_ptr(member)	__attribute__((__counted_by__(member)))
 #else
 #define __counted_by_ptr(member)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

