Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456362;
	b=SmpAEv4tle4Yb3jDCKAJSjNjk3Z87wES+bzBFbiVphNz/NsAeup3scVFOuyyhWYKr2xa
	 IKw/hnf0NGlf+Gvoyu26mVuRvFLUMOqa+3PdIEnk14l+aNkENN4wO4wgSQDdsXktC3dLU
	 5ZwlAMxy55qitWnKDMYEj1KnxIDU0moYdG/APMSHCQ6QBzF43IFKMf0gkPuvZowks8nvG
	 884fWSBML0uDZg6FB46Q7q4AOlp+ydwL3vduwvl97K00PMU/iuFZLW9UGFJu9KC64NSPd
	 xceQPIdfd1IzABWu4VajgNgWXbseuL4dAMmzl/KX1isTQ1/PjYn4KgPaAA3WYG65bcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456362;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W2RAx272TwMMTZt6ny/L4wP08fTIubsA745iSsxL0X4=;
	b=EHPdysF4ADagea3wv94YF8bLIRbPA7fVQdZB2XblSRGiZqRdVFAv8iLon+eU1DBAnGPd
	 WU9SutU2jAcLtdSR3WXt8TGQSTjepS/HNYDSQeRh4YgmVKtaj1eN0m10UMz+2g524fsi1
	 BnJAimfxc29+Gg5VjO2Ka0yHwxoEihvMdr66GmdC1BoOkZzdmdurwzYmKePZZ1RktIakz
	 VBb1IrK85XrC2qQsOVygMy9rdBnyLRig7OHGqE05sQ5FY5ncC9wda3XbWTNSAhhULT1nZ
	 3wI/mxuG5wjW0EBSHGIllWsQYifuZVbDk6f13zIWdgptr5gI37gZOAXWyDbziLyN5OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnLIPAzI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC60F606A31C;
	Tue, 20 Oct 2026 00:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnLIPAzI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C180E1F000C4;
	Tue, 20 Oct 2026 00:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792456361;
	bh=W2RAx272TwMMTZt6ny/L4wP08fTIubsA745iSsxL0X4=;
	h=From:To:Cc:Subject:Date;
	b=DnLIPAzIBhWmTkxEtnxyRCaOsX2rEPscN5ZLDdmV2Ex40YOW/GL/c4l2c+0v5K9ug
	 sqaJz9/AoFOEdHQwtsOhxeEYar8YFLv/hQPgCIdvV3w9q3Ta5ytUPICu5LjK2M7THV
	 RT+xeK7YFPLpPyfa1IMpOKOPSxi/rSnKVk1euHxVOjiWaBmtNhlQI4OVUo945KPcCN
	 GIIAWNIhblPSl2Q4n8RC5GRewsnk+feKMHUqWANaeRmKAYXwrKLVlzePjjV3fPcoPK
	 9lchgWUa96c6rhek2qUZ+yAAwBiUuwcXYAnIVh2EHA1HD1bcMVzaeGqc4JUFrx9Mv7
	 Dm+ZFU87gAdmQ==
From: Sasha Levin <sashal@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Florian Westphal <fw@strlen.de>,
	Julian Anastasov <ja@ssi.bg>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] x86/csum: Relax the len and proto constraints in 32-bit csum_ipv6_magic()
Date: Mon, 19 Oct 2026 20:32:38 -0400
Message-ID: <20261020003238.2823758-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Building an i386 allmodconfig kernel with clang fails since allmodconfig
started building netfilter with GCOV profiling:

  In file included from net/netfilter/nf_synproxy_core.c:7:
  In file included from ./include/linux/skbuff.h:26:
  In file included from ./include/net/checksum.h:21:
  In file included from ./arch/x86/include/asm/checksum.h:9:
  ./arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly requires more registers than available

The csum_ipv6_magic() asm needs five registers at once: the early-clobber
sum plus register-only inputs for saddr, daddr, htonl(len) and
htonl(proto). With frame pointers enabled, six general purpose registers
are left to choose from.

In synproxy_send_tcp_ipv6(), the GCOV instrumentation lets clang's
machine scheduler move the copies of two incoming register arguments,
EDX and ECX, below the asm. Both registers then stay live across the
asm, which leaves four registers for its five operands. This is LLVM
issue #206307. The error goes away without either GCOV or frame
pointers, and it reproduces with clang 19, 21 and 22.

Neither len nor proto has to be in a register: adcl also takes a 32-bit
memory or immediate source operand. Use "g" for both, so the asm needs
at most three registers whatever the caller looks like.

ASM_INPUT_G, which normally replaces "g" to avoid clang's poor handling
of it, is not enough here. It expands to "ir" for clang, so callers that
pass a variable protocol, like nf_ip6_checksum(), would still need five
registers. With "g", clang passes a non-constant len or proto through
the stack and still turns constants into immediates.

Fixes: 403cec8ab6d0 ("netfilter: add option for GCOV profiling")
Reported-by: kernelci.org bot <bot@kernelci.org>
Closes: https://dashboard.kernelci.org/build/maestro:6ad55fe255fda507603d2651
Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Closes: https://lore.kernel.org/a28df759-d0e9-41c0-97c7-5f89a18d54e2@oss.qualcomm.com
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org
Link: https://github.com/llvm/llvm-project/issues/206307
---
KernelCI's kbuild-clang-21-i386-allmodconfig job has failed on mainline
with this error since the 7.2 merge window, v7.3 included.

Tested on i386 with KernelCI's allmodconfig-based .config: with clang
19.1.7, 21.1.8 and 22.1.8, nf_synproxy_core.o fails before this change
and builds after it, and net/{netfilter,ipv4,ipv6,bridge}/ and
arch/x86/lib/ build without errors or warnings. The same directories
also build cleanly with GCC 16.2 (i386 allmodconfig). A 32-bit userspace
harness comparing the asm against a C reference over 2M random and
carry-edge inputs shows no mismatches with either compiler. No full
allmodconfig build or boot test.

 arch/x86/include/asm/checksum_32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/checksum_32.h b/arch/x86/include/asm/checksum_32.h
index 17da953879976..f74873a5e3510 100644
--- a/arch/x86/include/asm/checksum_32.h
+++ b/arch/x86/include/asm/checksum_32.h
@@ -159,7 +159,7 @@ static inline __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 	    "adcl $0, %0	;\n"
 	    : "=&r" (sum)
 	    : "r" (saddr), "r" (daddr),
-	      "r" (htonl(len)), "r" (htonl(proto)), "0" (sum)
+	      "g" (htonl(len)), "g" (htonl(proto)), "0" (sum)
 	    : "memory");
 
 	return csum_fold(sum);
-- 
2.53.0

