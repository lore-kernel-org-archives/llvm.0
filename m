Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7B519F132
	for <llvm@lists.linux.dev>; Wed,  2 Oct 2024 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861149; cv=none; b=HSnES7GblGzjxRVrFqV9nliTUulCLJlRJeKkNFjXux0H+b/Jsp6DbCLUPig7OSBZCKVoHJfMfi+BJ/RdLM56a93z9kptviy1dgPWAP9KUdxbO+hgzstlxr1+ZvE9zxvBebC71gcp8c+EKvi3ZGtoPxtMxPjbv+ToVfZklfX/KQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861149; c=relaxed/simple;
	bh=jkOhvIJFzwlypDxF5YYVCihy/SSMSVQh8E+lvmQS/3E=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XJJMUCnMpPQ6ktVWuRpgyLNGOHfRHFYngYVh0w7P47EABWChxmOw6ckrTeGpq761JYEhnMoHyvPK8v7fg8bpNb8AvtPfr/UK+554Blvnm/4Lv+6mbidUiY3sZL+lmKIMIl6vW3x60ZKdGs69wEfgJwuPJ7NuZcECLVxuCNVS3VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CS5rjRjE; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CS5rjRjE"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-a93d0b27d37so16952566b.0
        for <llvm@lists.linux.dev>; Wed, 02 Oct 2024 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727861146; x=1728465946; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ollbz8c+bB7Kyjb7uPuwWKRTLiK7jYrmwZYzwGbbGo=;
        b=CS5rjRjEYY+k65eIkSn6arKRIy8DH4Um+qEZKexj28zX1cYxFFOs/OvhACJH95xW/J
         GCi435bZaJ6WiwT16llKoASqD6hu/saku/tC0bVADxte3iigZsVP1uQiZGmtJOES5kKb
         vrgtd56LRZzQPmXpxEGC7BNk+fVtoSCayhRi5HPB5m7FxbcciDRZ/hHTtvYaS+BKG9b/
         H3arrk9HORTPne8RjIIVGdENhS1ZMrR440XLTNcEOotTKxGAybjVMEQj7tj0cI6Dmbj2
         oV1zI9A/2vnQOYo5YMvK16QgOCAbuIg5KkjP7G4tDCPmLwFQnbXb0liZTkuZJBueEq8n
         87rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727861146; x=1728465946;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ollbz8c+bB7Kyjb7uPuwWKRTLiK7jYrmwZYzwGbbGo=;
        b=bM3kBrVQrqkH3G40Z3j3cNp7BZYDZgjIsY5JvIqCwcq/m2wINhDd2pSSqh35h5+wIV
         /lGDVJBirUC6DbEowwkbJ1i2jRfrth9kVt4PKGbUSYSm//8PcaPVrAumxWBz4qPdCCcW
         FpTFo4pSgR6VXWk8VpyAlbzMmfrR28AGvT2P3YPYdF0BHzzfw90VaQjoaefYgiewRynj
         nF51DGH2spPedthHX5qj4kQioe0DaQN/GZEkzBeXnQ1KmcXy95u+67dtWe8itv6aq35O
         h+TQkz6Yp3OFLBpg/SeQJHrsi6MtNAt/Wv0CcyuAfXkCE9u3E4jpSxlcZ+H7bYcXgy5c
         4yKQ==
X-Gm-Message-State: AOJu0YyRTR16/OBknep/YaKlniwSZN1odo3/rSwqqU2tUFJPUldf7Eyc
	kqWAjKWWkw1Jtf2DjVNQaxKSsoz2b0RhXCYA7F5TVUyNj7uJiQAHzYROMduWSxwfG7+7zg==
X-Google-Smtp-Source: AGHT+IHxzYeJufPU4CpPO21AfUtt8gvJswNciwLBD+I3TZS2zkFMNpfb0MVOWY7y9Yyscz/1Az+gA+M/
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a17:906:52c8:b0:a7a:8eef:7640 with SMTP id
 a640c23a62f3a-a98f834bb5emr114566b.8.1727861145742; Wed, 02 Oct 2024 02:25:45
 -0700 (PDT)
Date: Wed,  2 Oct 2024 11:25:35 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4844; i=ardb@kernel.org;
 h=from:subject; bh=/9G5pIkj16wJJBC7+tVn5gr0UvoCw53qGK7jQPTaWb4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2vYH92D/PuQN6cg+ufHQztsLxp2WsleKvp1jrHM5YLd
 18/JJbfUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYS+oDhN8vXq9+2frum1+L5
 XUFiDs/Z7zt2R5blez9Nb/ef9uySSg3DX/G3u7kmHz9uY2BV0lIaxn6pbzqn73ObxLaftptuCfp rsAMA
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20241002092534.3163838-2-ardb+git@google.com>
Subject: [PATCH] x86/stackprotector: Work around strict Clang TLS symbol requirements
From: Ard Biesheuvel <ardb+git@google.com>
To: x86@kernel.org
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, stable@vger.kernel.org, Fangrui Song <i@maskray.me>, 
	Brian Gerst <brgerst@gmail.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

GCC and Clang both implement stack protector support based on Thread
Local Storage (TLS) variables, and this is used in the kernel to
implement per-task stack cookies, by copying a task's stack cookie into
a per-CPU variable every time it is scheduled in.

Both now also implement -mstack-protector-guard-symbol=, which permits
the TLS variable to be specified directly. This is useful because it
will allow us to move away from using a fixed offset of 40 bytes into
the per-CPU area on x86_64, which requires a lot of special handling in
the per-CPU code and the runtime relocation code.

However, while GCC is rather lax in its implementation of this command
line option, Clang actually requires that the provided symbol name
refers to a TLS variable (i.e., one declared with __thread), although it
also permits the variable to be undeclared entirely, in which case it
will use an implicit declaration of the right type.

The upshot of this is that Clang will emit the correct references to the
stack cookie variable in most cases, e.g.,

   10d:       64 a1 00 00 00 00       mov    %fs:0x0,%eax
                      10f: R_386_32   __stack_chk_guard

However, if a non-TLS definition of the symbol in question is visible in
the same compilation unit (which amounts to the whole of vmlinux if LTO
is enabled), it will drop the per-CPU prefix and emit a load from a
bogus address.

Work around this by using a symbol name that never occurs in C code, and
emit it as an alias in the linker script.

Fixes: 3fb0fdb3bbe7 ("x86/stackprotector/32: Make the canary into a regular percpu variable")
Cc: <stable@vger.kernel.org>
Cc: Fangrui Song <i@maskray.me>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Uros Bizjak <ubizjak@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>
Link: https://github.com/ClangBuiltLinux/linux/issues/1854
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/Makefile             |  5 +++--
 arch/x86/entry/entry.S        | 16 ++++++++++++++++
 arch/x86/kernel/cpu/common.c  |  2 ++
 arch/x86/kernel/vmlinux.lds.S |  3 +++
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index cd75e78a06c1..5b773b34768d 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -142,9 +142,10 @@ ifeq ($(CONFIG_X86_32),y)
 
     ifeq ($(CONFIG_STACKPROTECTOR),y)
         ifeq ($(CONFIG_SMP),y)
-			KBUILD_CFLAGS += -mstack-protector-guard-reg=fs -mstack-protector-guard-symbol=__stack_chk_guard
+            KBUILD_CFLAGS += -mstack-protector-guard-reg=fs \
+                             -mstack-protector-guard-symbol=__ref_stack_chk_guard
         else
-			KBUILD_CFLAGS += -mstack-protector-guard=global
+            KBUILD_CFLAGS += -mstack-protector-guard=global
         endif
     endif
 else
diff --git a/arch/x86/entry/entry.S b/arch/x86/entry/entry.S
index d9feadffa972..a503e6d535f8 100644
--- a/arch/x86/entry/entry.S
+++ b/arch/x86/entry/entry.S
@@ -46,3 +46,19 @@ EXPORT_SYMBOL_GPL(mds_verw_sel);
 .popsection
 
 THUNK warn_thunk_thunk, __warn_thunk
+
+#ifndef CONFIG_X86_64
+/*
+ * Clang's implementation of TLS stack cookies requires the variable in
+ * question to be a TLS variable. If the variable happens to be defined as an
+ * ordinary variable with external linkage in the same compilation unit (which
+ * amounts to the whole of vmlinux with LTO enabled), Clang will drop the
+ * segment register prefix from the references, resulting in broken code. Work
+ * around this by avoiding the symbol used in -mstack-protector-guard-symbol=
+ * entirely in the C code, and use an alias emitted by the linker script
+ * instead.
+ */
+#ifdef CONFIG_STACKPROTECTOR
+EXPORT_SYMBOL(__ref_stack_chk_guard);
+#endif
+#endif
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 07a34d723505..ba83f54dfaa8 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2085,8 +2085,10 @@ void syscall_init(void)
 
 #ifdef CONFIG_STACKPROTECTOR
 DEFINE_PER_CPU(unsigned long, __stack_chk_guard);
+#ifndef CONFIG_SMP
 EXPORT_PER_CPU_SYMBOL(__stack_chk_guard);
 #endif
+#endif
 
 #endif	/* CONFIG_X86_64 */
 
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 2b7c8c14c6fd..a80ad2bf8da4 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -490,6 +490,9 @@ SECTIONS
 . = ASSERT((_end - LOAD_OFFSET <= KERNEL_IMAGE_SIZE),
 	   "kernel image bigger than KERNEL_IMAGE_SIZE");
 
+/* needed for Clang - see arch/x86/entry/entry.S */
+PROVIDE(__ref_stack_chk_guard = __stack_chk_guard);
+
 #ifdef CONFIG_X86_64
 /*
  * Per-cpu symbols which need to be offset from __per_cpu_load
-- 
2.46.1.824.gd892dcdcdd-goog

