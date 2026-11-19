Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123920;
	b=J6mZu1eRyjnvbz0UAfvDGraWjn734XVb+KZ8hDI6eq6fU8rimvY4dVW8OeQlM227P7fo
	 B3my1wy4bj+c4MWwwXnJ+jWCiaCTV85BfsTS1JJSF+rCy+LBhV2c3BtwhNpGuS+JW1j1z
	 PPnqdvXXiW+Y7oYre9YqdEfuJLKvGTYvn1vsWwyxqlLTw8WENYZt/K2bfw29QGPYCYu1e
	 ceYVRGSUiw3he3WGAJ/yqP6OsohNWR8e+6J8aEvEbz76VRMN/7YAEAljf50ShOsTFmuMi
	 MtWAkUNDW19vPrflJJn7Q6CHmcrPrqdin42VIhwR1NkjXYg4CtLjLHb6qNbT4YX2QcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123920;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z82Fi18D8IzxzM7snm4f0enJxLNYAonxvUBFSN19rNE=;
	b=WuNDdu7sO+J3xnan3UzfVDkwZol6RH3MuserpbZI0syVyVxo0LFa8uvAtBON66JZMSNO
	 BoQiyW1gujzTMsaTFnEkuEyGaBS0GdVHpfaW6Y1b8qTMd5B8Db7QWcw+uQIpswxizM7sO
	 2ltOlUGPoun7Op+hjpp/wE5PR2oL2xq86ktbc+1V2cvaE/zhn/jGEuv2tM4sPxg5lDGE4
	 iL/zHPRVZ9k0Iq0WUhOrwfnzzXjLqXBDwQhpqd8rxDocFOvm1Otyrj7gFP7e761UyeRAI
	 PV1OUdPS10o50aflNl8ucQ6jtQIrKlUoYyH8z1KcXaoqesnHK7PoZ6we0Q/ncK5d5+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qyZBAUrc;
	arc=none smtp.remote-ip=95.215.58.143
Received: from mta1.migadu.com (out-143.mta1.migadu.com [95.215.58.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA6606A333
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 21:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDBA6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qyZBAUrc
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=FQgocnJVGX/UOY3g+Sx9R6WdMZmKAPZnWIEEeOVH290=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795123917; v=1; x=1795728717;
 b=qyZBAUrciq0cRBwUw7Ly2XcqfONyylaAvv+F//yn+cysuEMD/kN1kAc4tmDFQvIS19JGpEuu
 dT6nWUk4lGhaEcEkl+bGD8eEspjxj6pmFPPkr75CTvkw+vymVZmizgexfhvNbUmATfIpIvHngK4
 vvQhC1Gd7W2lXc7dEKTFvbCI=
X-Envelope-To: llvm@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id a7fa74e5abb5802f;
	Thu, 19 Nov 2026 21:31:57 +0000
X-Mizu-Trace-ID: a7fa74e5abb5802f
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
Subject: [PATCH 1/2] x86/boot/startup: Disable kernel stack depth tracking
Date: Thu, 19 Nov 2026 13:31:07 -0800
Message-ID: <20261119213147.1094488-2-usama.arif@linux.dev>
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

