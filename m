Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6481D61A3
	for <llvm@lists.linux.dev>; Wed, 12 Mar 2025 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741775268; cv=none; b=BR3PTsTZ4QNiI7PmxJeiVDIbHLDVjRfBkUyaRmCjB8ZWKDtIvLm2X6IwbwSlHL6t3/U8kkgM4awv9vhJwR5Y4lWZMArkvZREEUvc729oA86dp1HZlyktmUF6H1EbtgHIzT0cWgEzHLAZb+58Kpzh9h7iHtzLo6C3bnNVlKzxNdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741775268; c=relaxed/simple;
	bh=+R/nfa+6sr/q7ce+eZjlkJdFAJtHGVCAAGgYI45Hb2Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=N7yRLL1FiCX1xWuUiRSWXkyItZG5vK+BqEFtBUuCsOKwVukxbORGCx2yuPZuB5ttOek27/dfjz6mYezI7srnz0Tk+C5YQzVv2fEdFCYzu74MA6PA4X5dhbmjjC7TFiQMLSfmnyD0rOxyBCVybJo1HsgEm08UFIGH7H8ms0rZeJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rJ+hRj4M; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rJ+hRj4M"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso14525705e9.0
        for <llvm@lists.linux.dev>; Wed, 12 Mar 2025 03:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741775265; x=1742380065; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NEJPr0RAeLicfIPWbYkCZmxmoGwmaoBCPjUbsG9foM0=;
        b=rJ+hRj4MrtiAmy0/TpoT50OoW6EOTntpkPQWmqlQk7v6sAfiWmB5cqdJB3VOW/nFlp
         tr2pCBVFir98+teb0wQ1P9zIxmSsKJmYUKp1TMhS8i+jRkD+LR9R/uGpZrPQQGEkaCkm
         FIi/xUzFYx2C/IG7JECsrTFtyc6NYXqg712mMMm+rt8ckL5SiqbmrpYLXaX7w2aQFyvC
         JVpUWGZWJvPFbJj9lhKop2JCT1/bF+0gv3dkLosdD9kI9aVFYgJe5Uo5V3P23JvOsQAt
         lOlc1vtSUlSzYdIJ6JjAnJE4xCioR97TMUJssyjRl9dLK1bQogwtsfQ+FoXMjPV4fl6i
         qabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741775265; x=1742380065;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NEJPr0RAeLicfIPWbYkCZmxmoGwmaoBCPjUbsG9foM0=;
        b=OIZ1+GLWBJd0Kl1H2GNf9h1HkGFcHRzb7N9wN+EGBbp7NLdSxyqa+jQnZJTfZxX1VJ
         foUpDiy+MI6z6riy7cyP97SZHAqmA4bY65zxaNRpyh1BBQ/hNRBSKNu8upapRHbsbTxm
         GWL9hvhwDvVNHwXnsnJ3Z7IDT8ENIcj9HB/y0VzpVFXv5IJjevCj+2MMRXZAM91NjDMj
         091FkzgU7y36NCuGL+DEnAlIFQklas3SzqRsrozxvjGu6wX3lZnqz/YHrXV6+tofu3ZI
         eNIAlZnU8iySBD9ks5ctfGZOUnrdoByZO6EIwr99vMLqWhRJI8vc7/1Kzfnk0B67/q5q
         cg9w==
X-Gm-Message-State: AOJu0YxVsHuxHPwjqnNA8CcE4jN+XZrXDZsie82Tgv4MPvs3zCZoq67P
	/fkYHf4MElKc4Vepf91cVAffMYG2mmph8k/klMzLMVJMSUIfxc7FAa8g28ba6mF8antGQQ==
X-Google-Smtp-Source: AGHT+IGDa+BSdAbGTt2M+zzG1cRtau9tLWxQrf2jnl0EBkYcFyFDHgA4nWjWnbkPR59rqmT7w2yN6Hyt
X-Received: from wmbay38.prod.google.com ([2002:a05:600c:1e26:b0:43d:1c3:bf33])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3586:b0:43c:ec4c:25b1
 with SMTP id 5b1f17b1804b1-43cec4c26d2mr115743225e9.23.1741775264936; Wed, 12
 Mar 2025 03:27:44 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:27:41 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2530; i=ardb@kernel.org;
 h=from:subject; bh=gFdtL5JFQVUCKEBUAsZ/feLWQgtFaoLOAgy2VQ1UqH8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf1i4lwL5plvtTRb/R/fNOWoCJdd5zdzroj20lfMy4o/i
 kcy77LuKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABP5qcTIcJWbe6ttaU6tY1Ny
 u/D3PbvdX+9r0PldEXe63Dz5pvuvOIb/5WyuJiodS1ynGbHcs+O9z2LlklK9WHDyn+TtB38c21H KBQA=
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312102740.602870-2-ardb+git@google.com>
Subject: [PATCH] x86/head/64: Avoid Clang < 17 stack protector in startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Clang versions before 17 will not honour -fdirect-access-external-data
for the load of the stack cookie emitted into each function's prologue
and epilogue, and will emit a GOT based reference instead, e.g.,

  4c 8b 2d 00 00 00 00    mov    0x0(%rip),%r13
          18a: R_X86_64_REX_GOTPCRELX     __ref_stack_chk_guard-0x4
  65 49 8b 45 00          mov    %gs:0x0(%r13),%rax

This is inefficient, but at least, the linker will usually follow the
rules of the x86 psABI, and relax the GOT load into a RIP-relative LEA
instruction.  This is still suboptimal, as the per-CPU load could use a
RIP-relative reference directly, but at least it gets rid of the first
load from memory.

However, Boris reports that in some cases, when using distro builds of
Clang/LLD 15, the first load gets relaxed into

  49 c7 c6 20 c0 55 86 	mov    $0xffffffff8655c020,%r14
  ffffffff8373bf0f: R_X86_64_32S	__ref_stack_chk_guard
  65 49 8b 06          	mov    %gs:(%r14),%rax

instead, which is fine in principle, as MOV may be cheaper than LEA on
some micro-architectures. However, such absolute references assume that
the variable in question can be accessed via the kernel virtual mapping,
and this is not guaranteed for the startup code residing in .head.text.

This is therefore a true positive, that was caught using the recently
introduced relocs check for absolute references in the startup code:

  Absolute reference to symbol '__ref_stack_chk_guard' not permitted in .head.text

Work around the issue by disabling the stack protector in the startup
code for Clang versions older than 17.

Fixes: 80d47defddc0 ("x86/stackprotector/64: Convert to normal per-CPU variable")
Cc: Borislav Petkov <bp@alien8.de>
Cc: Brian Gerst <brgerst@gmail.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/init.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
index 0e82ebc5d1e1..8b1b1abcef15 100644
--- a/arch/x86/include/asm/init.h
+++ b/arch/x86/include/asm/init.h
@@ -2,7 +2,11 @@
 #ifndef _ASM_X86_INIT_H
 #define _ASM_X86_INIT_H
 
+#if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 170000
+#define __head	__section(".head.text") __no_sanitize_undefined __no_stack_protector
+#else
 #define __head	__section(".head.text") __no_sanitize_undefined
+#endif
 
 struct x86_mapping_info {
 	void *(*alloc_pgt_page)(void *); /* allocate buf for page table */
-- 
2.49.0.rc0.332.g42c0ae87b1-goog

