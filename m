Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BC43D953F
	for <llvm@lists.linux.dev>; Tue,  6 Oct 2026 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279843; cv=none; b=B05FT6h0KYQRcf++qzVIW7SpgWatcHo7d3clqYgzT5Fhhb5VJoJ1JZylw6EXQFi6i+57XZF3H2KGeOUGBXwCu4QjoTtYX7q8ZzmPhchDfBBMotNYSzdZPfOYauqxVh24zdV8A2uFvuTy2QpS6Ipy9nLeUmOeduaP58LoXzVEOWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279843; c=relaxed/simple;
	bh=iLcbc1HzGTozKQw6QU5goIrH/E+sVR+cS+TOcPW2ZOg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tw7J3roPQ6zsFwjLwbnH+E1fdBgKd8xiIGXcx/nr2ui7+uwF5VLNl7xsMJcLVupzSItjsfLEGp+ox7jsbYiKs9HgBHz3lZC0EnMPSiHxgmH/Vufzae1aB/cSeGLqivA660fsHVwHpbe3RDgUFDB97YjXYmN8bm003mNQNdeGLvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mh/THlz8; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mh/THlz8"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so2131738a12.1
        for <llvm@lists.linux.dev>; Tue, 06 Oct 2026 02:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791279841; x=1791884641; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjGTgfZsDADCktmqdDXJCkHYgkEUNyCL+EFPGA5tSXE=;
        b=mh/THlz8cwYXfksA+xQC1dAdwV9ty6BH9EqZKcCr5T1oULh81vLOlNicyxkhRi5fy8
         NLCFxtBNWQP4j5oB3B/X2qXNqAx230FLAFDmO2xlfEFtxja5+zyzubGJAtgP2mzJiKxw
         3CjgiZN1Cfxu9PuNO+/EpBPknUBnMSonh99qvztsaZFRW3pcFhSdboEvjqo4uplv5GhI
         Jy/2OD8zgK/R7p/BhoezfIi6GLjsoJQ2s/ayT6dbQRIJZ7eg1vZDN0Ck2SaPoq33JzQS
         Lu/TvTnlxxfrQQcm2NeJaCgMBxCT6iwF5e3KVEuN2kGzmrDnl+NsHn2pMgl4IUr6zvJO
         fnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279841; x=1791884641;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjGTgfZsDADCktmqdDXJCkHYgkEUNyCL+EFPGA5tSXE=;
        b=T5Ui8xLaFE86JYCZDg2K5M4QsKx0tuCJARAHfHcoi8ihTGPJHF5vWgM8PAHZNGLgA0
         4MjanFBSzisBkgB8QdGbblxqOMTPzFMEd86GH1Kf19YL1eDrroRANRRxAhFdc/ax5OW0
         Tah2KmgR14ASkZZtvzdhEW3y59AkJPhcqfcz4fvBaOfJ6TJtYwFEbL45htzwPpm4UL2I
         LnIIgJrd70n9sL5rgzy5fWnsakKitZDOYeXZx3slBuwjtLTBU4nI7SDyxWYCuLvtkgGT
         wMsEwXx/2JdIe+Jg0uPdlV15hCsUJ8a3nxsxFFOwnKKHtnD7dTy80I79p7vVQ3c/5TTS
         8oGg==
X-Forwarded-Encrypted: i=1; AKwUvBzvwtqXk5Wtk0itTpbS7M6C5RdLCLKr/qX9ohFZvhXIKskXVrXb/jOGcQqhSSTu13pb7WED@lists.linux.dev
X-Gm-Message-State: AFuF++mPhTBHouwntwYqUiYJLAlJxCSt14ux1LZNti2uJMN5Zq1JO7hH
	wqiXLodwX+73jMXNIjbCMg+7DHUkyGGb+3So81ajbJ9YENiNnFOADvkd3dSRx/tgMQ7JY+1lpmX
	5
X-Received: from pgba19-n1.prod.google.com ([2002:a05:6a02:6453:10b0:cc8:1e8a:c8d0])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2c11:b0:3e0:dc12:890a
 with SMTP id adf61e73a8af0-3e1248398a9mr649187637.86.1791279840528; Tue, 06
 Oct 2026 02:44:00 -0700 (PDT)
Date: Tue,  6 Oct 2026 09:43:58 +0000
In-Reply-To: <20261005102518.2400984-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261006094358.2948476-1-morbo@google.com>
Subject: [PATCH v4] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
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
---
 include/linux/compiler_types.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c5921f139007..05e2b637f1cd 100644
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
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

