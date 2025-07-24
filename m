Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACB624BBEE
	for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 23:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400250; cv=none; b=WHqCjIAOXnBcL7J4qmWviN3wurP5TtjJCySgpR9MdF7ygVwlxL6r6KRUGooKjCs+zpYu55P3tFbhhbxWt5dJaMIauRqeVWWVO9HGfdTtgKIrsHxrjsbR2C0nFQCoweTfg6+jDeq+6ar+SFSNmGIEAhUXYDp4MaFo8EYUSC0A9X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400250; c=relaxed/simple;
	bh=r7Hy9gi7nORQZAig+hEOF4zSbnrKY8DTDlN8xa1//dY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hf0dOWxTcfSBe2xoGx7WFwC+sSbHaPXzggbkVY5N71GA18os/mjSsIbnQRV1DRcxec2XsMcJBmHcxgp/JNtdC1U9v30p0mx4/JR3wk3FDdHRjzhJ2m+L2GjdqbaFHcdhPEhaP+bMmh13t9OdYcCnYOUX+ff/HdJeb6UxIR+LRvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=NhpzA24B; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NhpzA24B"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2349f096605so17993885ad.3
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 16:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400248; x=1754005048; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnGfibRKNEJZsKsgrkgY/LkGeimQVZTGPU49pFGQkew=;
        b=NhpzA24Bk4HuuBb46pBEdgn8ockqpOltLWjDO31v8GB+y/56vF4w+ksiTHgM/oXj+4
         K7vCEzwvNGcZJPmEb16TrrGtGbapauMWoCgLYi8dflyz5n80p9s6whBJODm5PM0l20Mp
         ufVYVPFGGw5MKVTz2k6A1QvabHM5cyPha0UczaYZsvOJXMwcbcXSTXCbUSnuSMocau8t
         UrcxxYX3sRzJ9bteFs4b69ydTfOZUXfuU2bQOVJ6kOiNL8nXJjvI8hFetepBkuP+FbWb
         Nu2zoXJMer2ETnjXtEmvgB4LrOw1Lw+mRGSUjMPe7LFKa1xeWRMI8SgWqsOmbhjHWH2r
         zvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400248; x=1754005048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnGfibRKNEJZsKsgrkgY/LkGeimQVZTGPU49pFGQkew=;
        b=otzG1pXKLrsZZ8tFwzBsrwEoh77ze3qATNKMOTKOQHBFVI+6WlPgSXiTbzkWWDd6SD
         NHoX0PGzz0XNbnKCNP6ES8tXAeH3pFAS+igaMvOm5+EDFDZ8XodTpsIxlv+s8BkA9aPr
         NlfwXaivoUW7bX5IMvcwH9uR7bOuGO5DEQTjz79TYtqqS8oG4KU1uoN9bc4ItSfLRtpO
         bX6oq/7NSCiuHAfWh75X/zFvf7m7cTSgt8TfUtueLduVttO0/ZXTyJvjOfTOl4hS7SKq
         wWpTJSPfsA+uXmStrKdfJEGsXgxT7Jvyw2pdRUCjYHzI8Ab96+Aw7LnzPTKLMdka9Lio
         uVMw==
X-Forwarded-Encrypted: i=1; AJvYcCVhxoB4tcmvRi7uuTzcwTNP2Ogx/SzPWlY+575XCKpzUd0Gt8+rURvDC/XE7lPyDl8sOZFs@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4rZaRo5wJCETW4jylRf8HNlt5LUqRj+rq6X6belVKIBQiFMDB
	OaK9e60iGEMFi5abENtprRJa5O0DddrKX7PODddBYrL9myljWY170FlvUPtFF4pu6C4=
X-Gm-Gg: ASbGncvmuCwvs/XMVsaF2UYvIaKZM6WSeicF0OOA37yCLyo6WWzFQr1Tujf302cQy9a
	NFqpoMW0dPwpYlo5LdNekdGsJjBmNOb0M2fnBRL2LiHBynR5pw6Ba3GL8i/3HKXe72u+7+oiyca
	hsvwZPaTdsKnuPvGSj9jLJBN7YO17I+SHOZNl+RvZqGTJh5Hri9X2SyvILkh4XPmp9WOkOBm4y/
	sCZwjADub7lUoxYRHlceGp12qt0CUNegWzmz7bgLkQn10Y8XfYnq1BFaJ7iEee7rAYxyxyeOkPc
	Kgp+jRyTf8yA5uY6k5iZaoSjrrSZKZrRkCUQ7hwr1qY/Nd1S5M8OfVaJXIM3kKWiz2tklt8VMNI
	XCtgzCHjueTUOuMLNe0semklI7uXerWTl
X-Google-Smtp-Source: AGHT+IGkF9wRjCt3t8wgcEzoS0u0I/CZsVHEJO+NVtX/XmjUgLckj9jfIg2rldjVpQc+NplTKJU2kw==
X-Received: by 2002:a17:902:f707:b0:235:c781:c305 with SMTP id d9443c01a7336-23f981932f0mr136844375ad.24.1753400248250;
        Thu, 24 Jul 2025 16:37:28 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:27 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:37:03 -0700
Subject: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

If shadow stack have memory protections from underlying cpu, use those
protections. arches can define PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
stack pages. Hw assisted shadow stack pages grow downwards like regular
stack. Clang based software shadow call stack grows low to high address.
Thus this patch addresses some of those needs due to opposite direction
of shadow stack. Furthermore, hw shadow stack can't be memset because memset
uses normal stores. Lastly to store magic word at base of shadow stack, arch
specific shadow stack store has to be performed.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/scs.h | 26 +++++++++++++++++++++++++-
 kernel/scs.c        | 38 +++++++++++++++++++++++++++++++++++---
 2 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/include/linux/scs.h b/include/linux/scs.h
index 4ab5bdc898cf..6ceee07c2d1a 100644
--- a/include/linux/scs.h
+++ b/include/linux/scs.h
@@ -12,6 +12,7 @@
 #include <linux/poison.h>
 #include <linux/sched.h>
 #include <linux/sizes.h>
+#include <asm/scs.h>
 
 #ifdef CONFIG_SHADOW_CALL_STACK
 
@@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
 	 * Reset the shadow stack to the base address in case the task
 	 * is reused.
 	 */
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
+#else
 	task_scs_sp(tsk) = task_scs(tsk);
+#endif
 }
 
 static inline unsigned long *__scs_magic(void *s)
 {
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	return (unsigned long *)(s);
+#else
 	return (unsigned long *)(s + SCS_SIZE) - 1;
+#endif
 }
 
 static inline bool task_scs_end_corrupted(struct task_struct *tsk)
 {
 	unsigned long *magic = __scs_magic(task_scs(tsk));
-	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
+	unsigned long sz;
+
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
+#else
+	sz = task_scs_sp(tsk) - task_scs(tsk);
+#endif
 
 	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
 }
 
+static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
+{
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	arch_scs_store(s, magic_val);
+#else
+	*__scs_magic(s) = magic_val;
+#endif
+}
+
 DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
 
 static inline bool scs_is_dynamic(void)
diff --git a/kernel/scs.c b/kernel/scs.c
index d7809affe740..5910c0a8eabd 100644
--- a/kernel/scs.c
+++ b/kernel/scs.c
@@ -11,6 +11,7 @@
 #include <linux/scs.h>
 #include <linux/vmalloc.h>
 #include <linux/vmstat.h>
+#include <asm-generic/set_memory.h>
 
 #ifdef CONFIG_DYNAMIC_SCS
 DEFINE_STATIC_KEY_FALSE(dynamic_scs_enabled);
@@ -32,19 +33,31 @@ static void *__scs_alloc(int node)
 {
 	int i;
 	void *s;
+	pgprot_t prot = PAGE_KERNEL;
+
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	prot = PAGE_KERNEL_SHADOWSTACK;
+#endif
 
 	for (i = 0; i < NR_CACHED_SCS; i++) {
 		s = this_cpu_xchg(scs_cache[i], NULL);
 		if (s) {
 			s = kasan_unpoison_vmalloc(s, SCS_SIZE,
 						   KASAN_VMALLOC_PROT_NORMAL);
+/*
+ * If software shadow stack, its safe to memset. Else memset is not
+ * possible on hw protected shadow stack. memset constitutes stores and
+ * stores to shadow stack memory are disallowed and will fault.
+ */
+#ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
 			memset(s, 0, SCS_SIZE);
+#endif
 			goto out;
 		}
 	}
 
 	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
-				    GFP_SCS, PAGE_KERNEL, 0, node,
+				    GFP_SCS, prot, 0, node,
 				    __builtin_return_address(0));
 
 out:
@@ -59,7 +72,7 @@ void *scs_alloc(int node)
 	if (!s)
 		return NULL;
 
-	*__scs_magic(s) = SCS_END_MAGIC;
+	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
 
 	/*
 	 * Poison the allocation to catch unintentional accesses to
@@ -87,6 +100,16 @@ void scs_free(void *s)
 			return;
 
 	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL);
+	/*
+	 * Hardware protected shadow stack is not writeable by regular stores
+	 * Thus adding this back to free list will raise faults by vmalloc
+	 * It needs to be writeable again. It's good sanity as well because
+	 * then it can't be inadvertently accesses and if done, it will fault.
+	 */
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));
+#endif
+
 	vfree_atomic(s);
 }
 
@@ -96,6 +119,9 @@ static int scs_cleanup(unsigned int cpu)
 	void **cache = per_cpu_ptr(scs_cache, cpu);
 
 	for (i = 0; i < NR_CACHED_SCS; i++) {
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+		set_memory_rw((unsigned long)cache[i], (SCS_SIZE/PAGE_SIZE));
+#endif
 		vfree(cache[i]);
 		cache[i] = NULL;
 	}
@@ -122,7 +148,13 @@ int scs_prepare(struct task_struct *tsk, int node)
 	if (!s)
 		return -ENOMEM;
 
-	task_scs(tsk) = task_scs_sp(tsk) = s;
+	task_scs(tsk) = s;
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	task_scs_sp(tsk) = s + SCS_SIZE;
+#else
+	task_scs_sp(tsk) = s;
+#endif
+
 	return 0;
 }
 

-- 
2.43.0

