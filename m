Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EAC36F429
	for <llvm@lists.linux.dev>; Mon,  5 Oct 2026 19:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791227989; cv=none; b=G6Rgegk+NpiJucdSV5mcKCBiY9cTadcQzQpMSTwberwUJH2+hRTlGoG0sTK2j/IEeJcvRGn0koGi6scHvVxA+gvJ7r0o64Yqk+Hq7p5M4LoHEptM6wSjGyjcVdt+kXD+7S5qPlD12RELoqnhrFme5kBMlOh+e+ecb+iWTu5unL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791227989; c=relaxed/simple;
	bh=bnlqihMoP+OehsOX4Qu9na8XM6RJuc5xI2jSiqejPOU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BOgfR4+4wTny+sn8gFKnIJ+dt1gX4l1kHIk303p0iMbAU6n6TBC4/fyvlp8gXDybOmkkijXgUXQ9GzC/xnttDdYrBQO0hCBL9nqYciLeo4F234651dTUMFyKy07GGYIREWx++pBpDBB5e75E53Un/sS/6yfbu0GJeicf4etcrHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lXE7PjYV; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lXE7PjYV"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2c785aa62so31712005ad.3
        for <llvm@lists.linux.dev>; Mon, 05 Oct 2026 12:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791227986; x=1791832786; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7eLGK4KvBHDJUYriBrlxQjC7HPa3mfoBvjU5hS2xzk=;
        b=lXE7PjYVxg4TPhdrmhPPUq+v2X7ZDSxTa+CjsB+SM8sIAXzooiRhpOLONDXpdGMTpy
         pIpmmX+E05XhV73of/9RXGYufPQOXoF1og0up4yWM0SkPpBJGIfjiFKRi1vWJfIwR72K
         YAn40oU8jfvLZet48Vu59aLKzt/BS85c1ffIcAV7J4Y4hZSbp2Im+aYvQqHAm6vx3vTd
         xFHsUO6mU0mP4fPiYTWarq4QWTepyBCZAMgcGEDeoNIMRHetuS+F+zqcKDlkC1sgBCLk
         0TjKYyqxrSH2BfXf0x1+6TVU8+A/ShXAfnVm3t06J3A0y5C44UOW5KYtLijyF2q1u+rh
         PIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791227986; x=1791832786;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7eLGK4KvBHDJUYriBrlxQjC7HPa3mfoBvjU5hS2xzk=;
        b=Qtt+C4U7OtOxQM0VnMA44JhMsy/S4Fw7L3kFuVAvJ7LpnFqkA0SUtNEyhkJvt4iIae
         bGJDopyvNa9dDL5i8OF2wr4L93TFdq9axP7aYTO5HcRtLyXmMMQNWLK/mxTaHCQLwaYl
         5ZIcFDR3c+PivImN5sW/m4ijWXQ+NFM0zHUmicmaqehNkwoolHrnnZRQf1rQPemxLx1X
         ZfuQpo6kCJvYke2r9cX5udCFxb+oaHkEriXle0Fi9xLbgR/cd1zIkQodVX6QeNcRZXFW
         ZuTSSwHYaQMLrzL7YRbSPUh6m3maPucCqys1stTW7oPbiOH1lDi2CekdIKL6Nl02djOs
         1j1g==
X-Forwarded-Encrypted: i=1; AKwUvBw4nMi41FFcg2EKttiw9TZ08LYOaIfGyEcQWdJooWZk+/Mw3H+wQ/6Tw6XCRZQRw6LLkc8s@lists.linux.dev
X-Gm-Message-State: AFq9FYJE1VNcfPEEU5cFGKysO0Z93hZFsq7DFo9O1K8JqExXhHaja7aO
	XMhKYMn1/AN8lmeLDh5IpyKFCK7NfFxN3/856BD4MXrfq2M4T+pVA3w6I05rElcf/QEtHS7as9k
	2
X-Received: from plic14.prod.google.com ([2002:a17:903:370e:b0:2e4:90ac:5fc4])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f682:b0:2dd:ad73:c936
 with SMTP id d9443c01a7336-2e49b60bf8emr102328605ad.23.1791227985632; Mon, 05
 Oct 2026 12:19:45 -0700 (PDT)
Date: Mon,  5 Oct 2026 19:19:43 +0000
In-Reply-To: <20261005102518.2400984-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261005191943.2588899-1-morbo@google.com>
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

Overriding the __counted_by_ptr macro from a Makefile doesn't work:
'compiler_types.h' is pulled in with '-include', which is processed
after all -D/-U options, so it re-establishes the definitions. Follow
the '__NO_FORTIFY' precedent instead: let a build define
'__NO_COUNTED_BY_PTR' to turn the corresponding annotation into a no-op.

Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
v2: Only specify __NO_COUNTED_BY_PTR. Leave __NO_COUNTED_BY until we need it.
---
 include/linux/compiler_types.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c5921f139007..8bde6798b4ec 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -387,8 +387,13 @@ struct ftrace_likely_data {
  *
  *   gcc: https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.html
  * clang: https://clang.llvm.org/docs/AttributeReference.html#counted-by-counted-by-or-null-sized-by-sized-by-or-null
+ *
+ * Code that runs outside the kernel proper (e.g. the EFI stub) can define
+ * __NO_COUNTED_BY_PTR to drop the annotation. Such code may also lack the flag
+ * Clang needs to parse a reference to a later-declared member
+ * (-fexperimental-late-parse-attributes).
  */
-#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
+#if defined(CONFIG_CC_HAS_COUNTED_BY_PTR) && !defined(__NO_COUNTED_BY_PTR)
 #define __counted_by_ptr(member)	__attribute__((__counted_by__(member)))
 #else
 #define __counted_by_ptr(member)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

