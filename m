Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456034;
	b=OKqWvfSHVSd+hfxUne1v72GaWYPj1lqdkxkv9iZy367uJuupO2pdWDEhceuvI5bqOS+U
	 MxEVs54oZjhFEPm3vUxGNbA/E585vm7y85Fu+w93qyyy/SSY+uNe8WIa3oqzbWQngqzyh
	 jxUQKeS9lnnYCUvS9pbE6/lTaOplqTIPEjr9wS86joFZsRq1HEv7pk3p0q5UbvGC2avLI
	 PottyiH63oE1bhqMS240FqeJYTpL4k7I/7SuhwAHE5B+D9AcAtlfm563OinlHr9wCVA6r
	 pRRQyeQY2SyqXPpT8FwvTjr8umMWs7VUaPxs18QMns4xvbZUOqMhz3hUOC6llq4RWEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456034;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/0wIduwgD559saA9vYvNpeyvjCNWou/2B18nwuhUQBo=;
	b=pq9Sq/jDGEFvH0Wo5xWZCZudIm0adoJ3dBUuImVjb9Aibt5EC6eA/SPqPbRR7Wexp/Y1
	 fD+w18/tNFBUu5CNt5DFeEp60RgZZ4uujsDYSPUB0d9DSh/M9XPbY5/LP+SD7r3D9Y+WZ
	 1TSjbrK0qtrdV1VIKxnbxbPxDf120g3J0vlWjyPb1sQ5xnlsZOJomwwRU8LX2UPFWHPqf
	 gfnUW6CEH8giJAPg7mjfiAJ5F1Ztohc1rDSCqIrB5Ofu7gSdj53RD5a2d5gs1nefWgur+
	 luj35CDnxyxI3Q0hW1mtoExNytGqmO8dVORjnHPJn1R5CIUrisA/o2g7wVnAqb9dAjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ngua6mHM;
	arc=none smtp.remote-ip=95.215.58.225
Received: from mta1.migadu.com (out-225.mta1.migadu.com [95.215.58.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88141606A33F
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 17:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88141606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ngua6mHM
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=886QTRaKDxxQKQoBIC5/8aa8b0vPRl0k0YvOJlSDRsU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795456031; v=1; x=1796060831;
 b=Ngua6mHMeoqLTu0Kju87bjEjDZDcJAoFLSM3eunL0Af/BFZ2FtBmzTMaYj5ooMDxU81UGr6W
 inQMzXA7y6+Wn8eYnpVGSa5SeVXzlLUtuiK247wHg35IpxfvrRG0FvnZdbsE7vFm8sypXGHS0bE
 6HTjLHY9sbMm5jsjNfiZ4JKE=
X-Envelope-To: llvm@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 98d5214fc65059dc;
	Mon, 23 Nov 2026 17:47:11 +0000
X-Mizu-Trace-ID: 98d5214fc65059dc
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	kees@kernel.org,
	peterz@infradead.org
Cc: hpa@zytor.com,
	gustavoars@kernel.org,
	ardb@kernel.org,
	hca@linux.ibm.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	rkeilty@meta.com,
	atish.patra@linux.dev,
	dgreid@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v2 2/2] x86/kstack_erase: Use memset64() for large stack fills
Date: Mon, 23 Nov 2026 09:46:39 -0800
Message-ID: <20261123174703.133167-3-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261123174703.133167-1-usama.arif@linux.dev>
References: <20261123174703.133167-1-usama.arif@linux.dev>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With KSTACK_ERASE, every return to user space poisons the part of the
task stack that was used since the previous return. The generic
__stackleak_poison() does that one word per loop iteration, so a syscall
that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hosts
running many small VMs, stackleak_erase() accounts for about 1.5% of
non-idle host kernel cycles.

Override __stackleak_poison() on x86-64, as s390 already does, through
the hook added by commit 491a78663e03 ("stackleak: allow to specify arch
specific stackleak poison function"). Fill spans larger than 512 bytes
with memset64(), which is a single REP STOSQ, and keep the word loop for
shorter ones, where the startup cost of REP STOSQ does not pay off. REP
STOSQ starts to win at about 320 bytes on Cooper Lake and 430 bytes on
Zen 5c, so on both no span gets slower.

stackleak_erase() is noinstr, so make memset64() __always_inline. With
KMSAN, x86 does not provide memset64() and the out-of-line lib/string.c
version would be called, so KMSAN kernels keep the generic loop.

In a Zen 5c KVM guest, stackleak_erase() got 32% cheaper per return to
user space (68 ns to 47 ns, scan included) over a futex, epoll, procfs
and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix socket
sendmsg()/recvmsg() ping-pong round trips got about 6% faster.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/x86/include/asm/processor.h | 21 +++++++++++++++++++++
 arch/x86/include/asm/string_64.h |  2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 77488ff5eb8c7c..3d205ae8566114 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -28,6 +28,7 @@ struct vm86;
 #include <asm/vmxfeatures.h>
 #include <asm/vdso/processor.h>
 #include <asm/shstk.h>
+#include <asm/string.h>
 
 #include <linux/personality.h>
 #include <linux/cache.h>
@@ -580,6 +581,26 @@ static __always_inline bool on_thread_stack(void)
 			       current_stack_pointer) < THREAD_SIZE;
 }
 
+#if defined(CONFIG_X86_64) && !defined(CONFIG_KMSAN)
+#define __stackleak_poison __stackleak_poison
+static __always_inline void __stackleak_poison(unsigned long erase_low,
+					       unsigned long erase_high,
+					       unsigned long poison)
+{
+	/* Short spans do not amortize the startup cost of REP STOSQ. */
+	if (erase_high <= erase_low + 512) {
+		while (erase_low < erase_high) {
+			*(unsigned long *)erase_low = poison;
+			erase_low += sizeof(unsigned long);
+		}
+		return;
+	}
+
+	memset64((u64 *)erase_low, poison,
+		 (erase_high - erase_low) / sizeof(u64));
+}
+#endif
+
 #ifdef CONFIG_PARAVIRT_XXL
 #include <asm/paravirt.h>
 #else
diff --git a/arch/x86/include/asm/string_64.h b/arch/x86/include/asm/string_64.h
index 2dae70c2b01465..73cc91254b1381 100644
--- a/arch/x86/include/asm/string_64.h
+++ b/arch/x86/include/asm/string_64.h
@@ -54,7 +54,7 @@ static inline void *memset32(uint32_t *s, uint32_t v, size_t n)
 }
 
 #define __HAVE_ARCH_MEMSET64
-static inline void *memset64(uint64_t *s, uint64_t v, size_t n)
+static __always_inline void *memset64(uint64_t *s, uint64_t v, size_t n)
 {
 	const auto s0 = s;
 	asm volatile (
-- 
2.53.1-Meta

