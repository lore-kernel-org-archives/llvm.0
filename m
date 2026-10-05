Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493F2235045
	for <llvm@lists.linux.dev>; Mon,  5 Oct 2026 19:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791228067; cv=none; b=sEgfgZOlpsgCEGO8cRPNphdaaQneIAP+RvFaaFxNsE25WK5ZcFTidONmsWPWl1j+RXaz3ibXEu/AOeZlhHoaPOXSlijqODUm06Lx98vrORcO5Uak4L1/k9xY7emsS5oSjqnkhqYnzHKmeUK1giUtDTLE0uFuU1FbDvCp2J/uS94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791228067; c=relaxed/simple;
	bh=YQ7/Ax0UxErTNnT63wTa7fRKhXKFuf3K2gplq2MDpb4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MfsQLtPC++/TioVdNWDWds+TM+OkLdylaT74he2dbegTbC4p9dWIlTTkH4Fwglh8XU+MbQAOW5Pv+JBqE7Yqne4XrMeRWbPTvFBqVhlnDxGP01AGp6xV4o1Lu24Xeuviyau8n6qIw8UAU2WKxYvb19vivabWBsVko0eiO3PU9tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BUs+X6oh; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BUs+X6oh"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e2d3a3ff86so29534365ad.0
        for <llvm@lists.linux.dev>; Mon, 05 Oct 2026 12:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791228066; x=1791832866; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrTypWKyXrNGtquOYVr8mPkgvP23qIJmTIldcFVC0/Y=;
        b=BUs+X6ohFPyz5OvzLSFVpjtUpSqo+9V7pI8vTu1v+b9zYgg8yYRZHmLGoDKYtvIqqZ
         N5zlb9E4i0B6TuUYqPgXz/XJjcpnJbCbucjT5EUsJ/KRwl2AFi3Xl18XDDkQRplxMVVL
         fM0FmbAzO1NBXwplE8koZ8TWnWToBMGwpBgUJSeOKd5cRKNo1IkK7j/1p521EyMCqlc/
         i2UuGEmmJpUO/YnF7mfKiA6GekFkMib8Jc5OHibxqrPm1fkxZnCEJsVAibeDhwEt4YJz
         W+oDnAqGVswXvQMNMSlE02XUOS9DQJO7ySrQciraQAFY0HVZVZsxjg5PJnHQFg6+LNCD
         QJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791228066; x=1791832866;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrTypWKyXrNGtquOYVr8mPkgvP23qIJmTIldcFVC0/Y=;
        b=xwv7c68+wF9uLz+mWL2VdwWC7VDnmdDLwkCStEKFSGBYxwTlZvenPQJxfdBHLPlsCK
         ljSpjEuagREAvUknqci24aO/yoHroYDX+w7Sihf1p16rV1yRcfUoeR2lDtAKQwlMqaTl
         F6mGb5O5wg1kuwrQSajLoHM2flcYIj8YxZ1dpQVm5V8PfNELPIj54CoO0NhO/MupEcpP
         r9FxuCJLUQr8N3Ffqoti9J7l9t2nT9qmuYJxOhEAYP7XIpO65uecfEFWuffXJHXHWRw2
         ICpEvID79xuQuZFJzt+vrviL8+0Q0gtYbEUXTj4M8V0K5MBDV1fbdVtK3cVoELfnopje
         INrw==
X-Forwarded-Encrypted: i=1; AKwUvBwUVBXoOOuMY3SS8S5V1DIqKsPUfWoviPFPqAr3UiLb50FDTy8yu+jP3HAUeW1dSVhB/ZDL@lists.linux.dev
X-Gm-Message-State: AFq9FYLtGQPi/vv4rmlHn0qCqDRJdBOY9Guo/OxbjWX6juh/QTytcsvR
	r0677/QL2rDjuaudJ27MuV0ohD2sdcYNnNZ82eiHQx69gSHJS3yefEZcSKWNMKJYxccfHANnMCz
	1
X-Received: from plbmh14.prod.google.com ([2002:a17:903:9ce:b0:2e2:cbb6:3b7d])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:9341:b0:2df:ab09:2656
 with SMTP id d9443c01a7336-2e49b6ad7famr81214365ad.44.1791228065326; Mon, 05
 Oct 2026 12:21:05 -0700 (PDT)
Date: Mon,  5 Oct 2026 19:20:52 +0000
In-Reply-To: <20261005102518.2400984-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261005192052.2589382-1-morbo@google.com>
Subject: [PATCH v3] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
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
v3: Add the version to the Subject line.
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

