Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456032;
	b=lkbwvne+nqzF67GoUhq/m0+NsoOgJhkWtmG/Fdopr5d7uzuUgYFo1tRUkGSIx9VEQ+WV
	 Z/J5uX59/tIlJVFmaakVNhYOMoo1niVJfzDBOZHJ3R8p6gtVqhyNx6sS0Nn5RZpZC465i
	 1JSLoM11dtY0k/zzKzK8NP0cbv6w0Fdb1QI0T+iAyUGps/8DVRcHUqtlGV38d3XffLteT
	 359HPaSqsRfoBnghqyzE2NhY1aRxboTjAwVlNW84alkyswAOOLjgKinNMWqRzJfosYa36
	 LlYAy7lHEFslFkOoVCiCpo5mwKO+iRv/uXz2cCIKtR32K1xtzVjNMyjkcnWdJs71TEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456032;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0t8zKtZ6fbUUYbPPtktIppYZP4GIvXsyFuY7JtvY8tM=;
	b=LvyJGl5yW8cuvv5iZhDmXANsPovaNk5uLO84aSxLuKYB6+d0hHM7GSpu84FTB2ebq0y8
	 RqvEgod7v1OjdeSzlXXVaKTxh1b8vLPD0HPwh8SMhSQSzmIS/zqo8yykH5wXePPOTDdJA
	 WzvTIlvgJvWQNJ8mTPp8Um1j7cKxjtNIt3LwWh6U1TMkHF6btMLpJjtHvLh4uKAxBQfCN
	 dgcoy2c3tQmn2KjdfSYpVhKvf27fNRf9l6yobYwgCMLq3KhdK1oyhJwPQEYsqc5284NQx
	 EZRatbWt1u6JuQ3h55dTStlsZP0yHdvNDGx5lBX23XhzXkgdCxXY2IBvu917e/rUmsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xgqvIaD2;
	arc=none smtp.remote-ip=91.218.175.51
Received: from mta0.migadu.com (out-51.mta0.migadu.com [91.218.175.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2AE606A33F
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 17:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE2AE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xgqvIaD2
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=3Nw85x2cfbSPxOnqDEnKHg1gdA6E9NYWawWTXVjvbSw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795456029; v=1; x=1796060829;
 b=xgqvIaD2LrYAxWibzuWNcUp6S/pNNkYjKMeQoJvKIIk7f+4XbK+GgnC8sfSyET3v/r2ODoM4
 C/E0KrgsF6GV0fzcLBC99jGpWyPjOmpY8MvlDdtvSUCMjn8CoGpRChd9rna8ReHWU+WF9JDtoxa
 LMKad5snk9KbNxflCqDhurcI=
X-Envelope-To: llvm@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 24ffb119dd589146;
	Mon, 23 Nov 2026 17:47:09 +0000
X-Mizu-Trace-ID: 24ffb119dd589146
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
Subject: [PATCH v2 1/2] x86/boot/startup: Disable kernel stack depth tracking
Date: Mon, 23 Nov 2026 09:46:38 -0800
Message-ID: <20261123174703.133167-2-usama.arif@linux.dev>
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

Commit 57fbad15c2ee ("stackleak: Rename STACKLEAK to KSTACK_ERASE")
renamed DISABLE_STACKLEAK_PLUGIN to DISABLE_KSTACK_ERASE everywhere
except in arch/x86/boot/startup/Makefile. The old name now expands to
nothing, so the startup code is built with stack depth tracking enabled.

The startup code is linked with every symbol prefixed by __pi_, so that
it cannot call into the rest of the kernel by accident. It has no alias
for the tracking callback, and tracking stack depth there is of no use.

At the default KSTACK_ERASE_TRACK_MIN_SIZE of 100 no startup function is
large enough to be tracked, so this went unnoticed. With Clang,
CONFIG_AMD_MEM_ENCRYPT=y and a minimum below about 90 bytes,
pvalidate_4k_page(), snp_cpuid() and do_vc_no_ghcb() get a call to
__sanitizer_cov_stack_depth() and vmlinux fails to link:

  ld.lld: error: undefined symbol: __pi___sanitizer_cov_stack_depth

Use DISABLE_KSTACK_ERASE, which disables tracking with either compiler.

Fixes: 57fbad15c2ee ("stackleak: Rename STACKLEAK to KSTACK_ERASE")
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/x86/boot/startup/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index 5e499cfb29b5c0..0815105e7205c7 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -3,7 +3,7 @@
 KBUILD_AFLAGS		+= -D__DISABLE_EXPORTS
 KBUILD_CFLAGS		+= -D__DISABLE_EXPORTS -mcmodel=small -fPIC \
 			   -Os -DDISABLE_BRANCH_PROFILING \
-			   $(DISABLE_STACKLEAK_PLUGIN) \
+			   $(DISABLE_KSTACK_ERASE) \
 			   $(DISABLE_LATENT_ENTROPY_PLUGIN) \
 			   -fno-stack-protector -D__NO_FORTIFY \
 			   -fno-jump-tables \
-- 
2.53.1-Meta

