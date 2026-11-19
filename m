Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123922;
	b=mda/RQAO/otQ+q+JwwScWDAaTi6yMvOkBjiD9Py9uOoW8ZA20TbPWMLp0cf/ge/lLWFO
	 4O/R1nDZ0IFcBNZ2ch5nkRG7PfAl8jWw5fKSkaMrX+ACfhZiTRsYToRnoo6yStTiQ0fMo
	 pFVR9GHtyjjoVfKwn737LvZ8GNoh3l5QasVu1TEIETjmkp+81SxL5WY4GrTU53DV694EH
	 WHuD80g4eOGbnsOeJbM3nQrL9NVGoz9WyVfOTEUjSEinaA8rOXtwvliMprnr1IoLOKx7z
	 85ff2uJZExxWy5sH605gdGl5CsCa8Jex/c1rD/D+DJYI/c5ID6WebUJ3yk+q9Q/vLuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123922;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z0f12Fhq47yJ0K7JFq0vMJwpWMgJuv95hRHiFmZI46Y=;
	b=5ArTBJ/z7pn0JK8pML5wRtP+12stEDR1mx1gkqnh6EBZMEi+t2bXfF9vJa2VNkx4Bo6O
	 ZIDVmHbEji+OqiM1GYJY90HQ+z9toMJ4EtQxzLk0oMliwjOn2RH85eM+TlxI0YDupWcVs
	 0AENG8amixfLRcU7tT1aaxF1Yn0hRsS972K0btq7xtFoHcyN90huK+vOxb0vutUxn8Lrh
	 cGwd91fa5/eVEQshjnnVVDOKzqVrLZ5woT/qTCa23Xo/gl4+hdCMuzP4tghjJ5fScH6nN
	 rN0AH8UPZImr+3Tq7Axpzj80uu7H3WP95VTVYW2LwXYuWtAK/EfV1SSPgQChC6wygbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dsXxke9j;
	arc=none smtp.remote-ip=95.215.58.153
Received: from mta1.migadu.com (out-153.mta1.migadu.com [95.215.58.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52046606A32C
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 21:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52046606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dsXxke9j
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=9gahvkdbVvSIQ2Nc7cy9eg/+EHh2j7Wk8/IBr2Sw/HE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795123920; v=1; x=1795728720;
 b=dsXxke9jDjDaayZnT2i6cjDgJx4pretLtMzLCtep7qGIFtPyB156VAZblwMyRNz2t3Tb39/d
 JYNLOh09C/DhyeCuT3HGthDFWZ7JwnU/UMn0vGqcvtGGTGKGNA+fFxpSyKijQKhe2Ia7P+AJbaW
 rakmw/pLcM+GON982DEbI1zI=
X-Envelope-To: llvm@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 2ff727b0e57761ec;
	Thu, 19 Nov 2026 21:32:00 +0000
X-Mizu-Trace-ID: 2ff727b0e57761ec
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	kees@kernel.org
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
Subject: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack fills
Date: Thu, 19 Nov 2026 13:31:08 -0800
Message-ID: <20261119213147.1094488-3-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261119213147.1094488-1-usama.arif@linux.dev>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
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
with REP STOSQ and keep the word loop for shorter ones, where the fixed
startup cost of REP STOSQ does not pay off. REP STOSQ starts to win at
about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span gets
slower.

The fill is inline asm, so the noinstr function still makes no calls.
memset64() would be the same instruction, but it is only static inline,
and with KMSAN it is an out-of-line function.

In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per return
to user space (71 ns to 46 ns, scan included) over a futex, epoll, procfs
and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix socket
sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 77488ff5eb8c7c..049231d484ad0e 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(void)
 			       current_stack_pointer) < THREAD_SIZE;
 }
 
+#ifdef CONFIG_X86_64
+#define __stackleak_poison __stackleak_poison
+static __always_inline void __stackleak_poison(unsigned long erase_low,
+					       unsigned long erase_high,
+					       unsigned long poison)
+{
+	unsigned long count;
+
+	/* Short spans do not amortize the startup cost of REP STOSQ. */
+	if (erase_high <= erase_low + 512) {
+		while (erase_low < erase_high) {
+			*(unsigned long *)erase_low = poison;
+			erase_low += sizeof(unsigned long);
+		}
+		return;
+	}
+
+	count = (erase_high - erase_low) / sizeof(unsigned long);
+	asm volatile("rep stosq"
+		     : "+D" (erase_low), "+c" (count)
+		     : "a" (poison)
+		     : "memory");
+}
+#endif
+
 #ifdef CONFIG_PARAVIRT_XXL
 #include <asm/paravirt.h>
 #else
-- 
2.53.1-Meta

