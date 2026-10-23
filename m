Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738210;
	b=lr6aa0peoBcSbS5u+UjBNIYgE9SaPXXYxJI+JiNxROl90dbXb1Y9QmvXC2OBAXzeQCJq
	 IN/NncFEIaZzJFZrydPlEoWLOv3EtS16M0QqOh8z+BBWGb4F61yXbqSqcWAyAnyk6TJNj
	 eCvxLlCoi7yJAwGZEF95qeTnp1jmGkzih3dsO0z74K37PPglEhSzCVguViet0v5qcnlsH
	 r0pwy2IzUgU+WRlBlRfLbet00a7v2nuSfgPjOK4+2sCKGRBgFsJn5bkRWLJzeiGklX/3D
	 6gq6hu9rU4HCdRToMjp5DarK+k+1S291xYgp5Omsgh5aPK/jz094O4lcWS07+tG/MXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738210;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=nejDhtc2zH2a53Zk+nPufLr4yM9hyCL0i6pc5nIr6t4=;
	b=IiIUcL/o5kK+qhJjsFXeq4S6E8GRxYxQElNKVL1EpXozyKJdZzQUyrttidRRu5s3y+cF
	 iLItUbNM6gB4hXo2oe3TIAw4ZnDJVviVSoHDPqRTeNpjPoCFYrQ5n2AfwkjU6B+w+VFkm
	 jKEc+izcfE+fahme6wKsD1f3Km+3OutbbmlxNmEW00XzFJQftzw8N6gJ4shKj/T2VUhEj
	 XXUpvq+z37YVZrwH55KXu3mOaRYDAIG5DNYJLRtGLMyoDW4UNPk96w64qlZhA6jDwGlqj
	 typ2kwgrsChC1HtxZ0SHDCs0yS740M0hAHTSp7uZRxqROkByOhiSTWIkgRfB5cYnA/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L93k96hr;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16613606A31A
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 06:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16613606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L93k96hr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nejDhtc2zH2a53Zk+nPufLr4yM9hyCL0i6pc5nIr6t4=;
	b=L93k96hr4nNAymEL8Fj0gE+NVEmxupZjkxuA+PVcEIiFDyNJH0I61QYWa5rBKINB3DniaQ
	lilfXoyj9av05UM/PYsWNw42GThxQo1DxQcb0z+tHYaAoWV+rD74Ynl+ePGLS4ljlP4NLg
	fUKt+VQRqmyJZugUnXpUnO1hGJQtd+Y=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-NzagMRgUO46jbLwDG4cMhQ-1; Fri,
 23 Oct 2026 02:50:04 -0400
X-MC-Unique: NzagMRgUO46jbLwDG4cMhQ-1
X-Mimecast-MFC-AGG-ID: NzagMRgUO46jbLwDG4cMhQ_1792738203
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E514A19560BE;
	Fri, 23 Oct 2026 06:50:02 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 074231956095;
	Fri, 23 Oct 2026 06:49:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Brian Cain <bcain@kernel.org>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hexagon@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 08/13] hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
Date: Fri, 23 Oct 2026 08:48:45 +0200
Message-ID: <20261023064908.66707-9-thuth@redhat.com>
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>
References: <20261023064908.66707-1-thuth@redhat.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: SJiwBycRLfCaIjxIRQstDHe5EDVemRtRHyshhEZGYo0_1792738203
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

Acked-by: Brian Cain <brian.cain@oss.qualcomm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/hexagon/include/asm/hexagon_vm.h  |  4 ++--
 arch/hexagon/include/asm/mem-layout.h  |  6 +++---
 arch/hexagon/include/asm/page.h        |  4 ++--
 arch/hexagon/include/asm/processor.h   |  4 ++--
 arch/hexagon/include/asm/thread_info.h | 12 ++++++------
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/hexagon/include/asm/hexagon_vm.h b/arch/hexagon/include/asm/hexagon_vm.h
index 9aa2493fe7863..e1e702eb9e12a 100644
--- a/arch/hexagon/include/asm/hexagon_vm.h
+++ b/arch/hexagon/include/asm/hexagon_vm.h
@@ -39,7 +39,7 @@
 #define HVM_TRAP1_VMGETREGS		22
 #define HVM_TRAP1_VMTIMEROP		24
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 enum VM_CACHE_OPS {
 	hvmc_ickill,
@@ -178,7 +178,7 @@ static inline long __vmintop_clear(long i)
 
 #else /* Only assembly code should reference these */
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /*
  * Constants for virtual instruction parameters and return values
diff --git a/arch/hexagon/include/asm/mem-layout.h b/arch/hexagon/include/asm/mem-layout.h
index e2f99413fe56e..8bad920d8928a 100644
--- a/arch/hexagon/include/asm/mem-layout.h
+++ b/arch/hexagon/include/asm/mem-layout.h
@@ -25,7 +25,7 @@
  */
 
 #ifdef CONFIG_HEXAGON_PHYS_OFFSET
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 extern unsigned long	__phys_offset;
 #endif
 #define PHYS_OFFSET	__phys_offset
@@ -44,7 +44,7 @@ extern unsigned long	__phys_offset;
 #define STACK_TOP			TASK_SIZE
 #define STACK_TOP_MAX			TASK_SIZE
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 enum fixed_addresses {
 	FIX_KMAP_BEGIN,
 	FIX_KMAP_END,  /*  check for per-cpuism  */
@@ -101,7 +101,7 @@ extern int max_kernel_seg;
  * and pkmap_base begins.
  */
 #define VMALLOC_END (PKMAP_BASE-PAGE_SIZE*2)
-#endif /*  !__ASSEMBLY__  */
+#endif /*  !__ASSEMBLER__  */
 
 
 #endif /* _ASM_HEXAGON_MEM_LAYOUT_H */
diff --git a/arch/hexagon/include/asm/page.h b/arch/hexagon/include/asm/page.h
index 6d82572a7f210..3379b7a700fec 100644
--- a/arch/hexagon/include/asm/page.h
+++ b/arch/hexagon/include/asm/page.h
@@ -48,7 +48,7 @@
 #include <vdso/page.h>
 
 #ifdef __KERNEL__
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * This is for PFN_DOWN, which mm.h needs.  Seems the right place to pull it in.
@@ -127,7 +127,7 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
 /* XXX Todo: implement assembly-optimized version of getorder. */
 #include <asm-generic/getorder.h>
 
-#endif /* ifdef __ASSEMBLY__ */
+#endif /* ifdef __ASSEMBLER__ */
 #endif /* ifdef __KERNEL__ */
 
 #endif
diff --git a/arch/hexagon/include/asm/processor.h b/arch/hexagon/include/asm/processor.h
index 0cd39c2cdf8f7..b93c2cc4be22e 100644
--- a/arch/hexagon/include/asm/processor.h
+++ b/arch/hexagon/include/asm/processor.h
@@ -8,7 +8,7 @@
 #ifndef _ASM_PROCESSOR_H
 #define _ASM_PROCESSOR_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/mem-layout.h>
 #include <asm/registers.h>
@@ -124,6 +124,6 @@ struct hexagon_switch_stack {
 	unsigned long		lr;
 };
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif
diff --git a/arch/hexagon/include/asm/thread_info.h b/arch/hexagon/include/asm/thread_info.h
index e90f280b9ce3e..a0da6c694c87b 100644
--- a/arch/hexagon/include/asm/thread_info.h
+++ b/arch/hexagon/include/asm/thread_info.h
@@ -10,7 +10,7 @@
 
 #ifdef __KERNEL__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <asm/processor.h>
 #include <asm/registers.h>
 #include <asm/page.h>
@@ -20,7 +20,7 @@
 #define THREAD_SIZE		(1<<THREAD_SHIFT)
 #define THREAD_SIZE_ORDER	(THREAD_SHIFT - PAGE_SHIFT)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * This is union'd with the "bottom" of the kernel stack.
@@ -47,13 +47,13 @@ struct thread_info {
 	unsigned long		sp;
 };
 
-#else /* !__ASSEMBLY__ */
+#else /* !__ASSEMBLER__ */
 
 #include <asm/asm-offsets.h>
 
-#endif  /* __ASSEMBLY__  */
+#endif  /* __ASSEMBLER__  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define INIT_THREAD_INFO(tsk)                   \
 {                                               \
@@ -73,7 +73,7 @@ struct thread_info {
 register struct thread_info *__current_thread_info asm(QUOTED_THREADINFO_REG);
 #define current_thread_info()  __current_thread_info
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /*
  * thread information flags
-- 
2.56.0

