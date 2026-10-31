Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478646;
	b=XsWRmHud6G27APOjtdGws6iJxJjGvYLuQGoLPY3J+cJDmw6qrJ4orfGrYRD0osxOnvG5
	 zaoISNFvr8DpjF/dATTfkNUL2xPZ6Rf1kpQoBfL3/kgCSQUl0lflWp6yK23IFv99HlnIz
	 9GVMKJu1ryt9E//81FjWpEMPw95WpaxPnXXUltZkxOQyYoHI1/0DP/6DBnC+kir3QbFvA
	 7P/ZwCJduDw8BJzELJmSqC45oVWhL+ClaDm3sqjuFcV35TNI/MxN48aqANb3LDoRinwAL
	 47ja5aV6j+gGLVJhhvJY6miYFvOtw+txbqT5wL193fLg8GjU8iuq2DN0O32L7xpCLHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478646;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=etg8xIk7/mHuwznIV2LiEcwlbKyebNzAJOUuKQB92CY=;
	b=0+jBcu+A464Fb3xtK2d6bSFbyBbUisNN5qz7hhx+/7qWfK06oiJnl8CN7duwszSG1eqi
	 yIE+xu+ToZfBAZtC0RsOn0Vg9qbjyn+OxpOIMJbpWKaVMj8UB3y+t7n/xb3Rs53stzhmX
	 fjGCqF1J+2Tsi38MmyzENouj0rYDpDeBqNv6N01Ubv2pvpt1OPz1XNqjwZa9b712nDp7b
	 3YmgkAj+MYIHfW7KezURDlWDrGEONqoS4o6yfSiN0grzMCeLknlXJ2ypgy8sjIu9dlbw3
	 o4QzATRRHvXc84+GIy5XbnCckFOddPm6cEOMEJFl7fLKbly0/Z3JDjSWyHMkewA9x/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=emSACvfh;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEC1606A31D
	for <llvm@lists.linux.dev>; Sat, 31 Oct 2026 20:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECEC1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=emSACvfh
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E976440E02B7;
	Sat, 31 Oct 2026 20:30:42 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MWea6NI3gU-5; Sat, 31 Oct 2026 20:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793478639; bh=etg8xIk7/mHuwznIV2LiEcwlbKyebNzAJOUuKQB92CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=emSACvfhZ/bWvWkfjo+IyHx/2jJUgTQ5ygP74ijNKqAW5Qp6J7FOoNeVobf6teG4A
	 4bJ7/ULFGE72jby9mWZxWWPo1Tv/BOgeygSKuugTx4AdVpIKjrOXMFG80ESRvbtOnv
	 Rrk8JRAblvwOefy6PnMby7LoPgmZf+L6aQZ977m0H4NKfnFvsld2NCsTXcV0uJno1q
	 dcEyqWqbtWoaV95LZy67iu4HKjjErf0EsRtw8D5xlwREhp3zfsf6ovtywW5ZkZ7CGy
	 5F2gTL+n5BIryeVmdgOlzgvroAHWLUtGRMjO93+SYPQ5fy4XrjVojWRxmyajnqwqFu
	 rJBygOnuUotg5nR3THXe23k4FuZ2T2phziKPihZ3VNhwc+rD5gL/O27u5xBxMEK3+K
	 I/rTlbP7KtEoyINkatGHJObo3vm0qTOdoVD4KO/Ej3S/JaaVg8P2XJK7bboJToydsQ
	 SCt4rJi0bMmhTmMjmqLC9Vu6l2GV5Di2jT2ah1b70PLAaDP+TE/zInTEIxPP3613gz
	 KB/vGcwVx3U/E2NZaw2hB1yLy9vO/jjUyiFt984eLTB1cXqo4YMs7Aw7VCQM7XYW7e
	 jsEk6XVyXt/01GcuzshZdEdYX140LFbYQN3ZxOeDA2EIQ8Bhe9Syy5r7KfZJ2EXYN0
	 gMcOSk1c5qVPTUuG17atELuo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6EC8740E016C;
	Sat, 31 Oct 2026 20:30:22 +0000 (UTC)
Date: Sat, 31 Oct 2026 13:30:19 -0700
From: Borislav Petkov <bp@alien8.de>
To: Sasha Levin <sashal@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Florian Westphal <fw@strlen.de>, Julian Anastasov <ja@ssi.bg>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/csum: Relax the len and proto constraints in 32-bit
 csum_ipv6_magic()
Message-ID: <20261031203019.GBauZP25b7gS7rmv21@fat_crate.local>
References: <20261020003238.2823758-1-sashal@kernel.org>
 <CAKxU2N9paXhCuNknUzKx5dYxhXitLZ=OVVY7Sym1HV8Mow6cSQ@mail.gmail.com>
 <20261020011140.GCata_zHOTeTXLdlr2@fat_crate.local>
 <atbBFRU1Wm94oYB7@laps>
 <20261020012844.GDatbDzDp1zC0NtI6k@fat_crate.local>
 <20261031133638.580496-1-sashal@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261031133638.580496-1-sashal@kernel.org>

On Sat, Oct 31, 2026 at 09:36:38AM -0400, Sasha Levin wrote:
> Gentle ping on this one, I don't see it in tip yet. The clang i386
> allmodconfig build of mainline is still failing on it.

Yah, lost in the avalanche of mail. :-\

I have queued this below, it should appear next week, when the MW is over.

---

commit e0837307007837088ce417d8f061f90105f1b20c (HEAD -> refs/heads/queue)
Author: Rosen Penev <rosenp@gmail.com>
Date:   Mon Oct 19 20:32:38 2026 -0400

    x86/csum: Relax the len and proto constraints in 32-bit csum_ipv6_magic()
    
    Building an i386 allmodconfig kernel with clang fails since allmodconfig
    started building netfilter with GCOV profiling:
    
      In file included from net/netfilter/nf_synproxy_core.c:7:
      In file included from ./include/linux/skbuff.h:26:
      In file included from ./include/net/checksum.h:21:
      In file included from ./arch/x86/include/asm/checksum.h:9:
      ./arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly requires more registers than available
    
    The csum_ipv6_magic() asm needs five registers at once: the early-clobber sum
    plus register-only inputs for saddr, daddr, htonl(len) and htonl(proto). With
    frame pointers enabled, six general purpose registers are left to choose from.
    
    In synproxy_send_tcp_ipv6(), the GCOV instrumentation lets clang's machine
    scheduler move the copies of two incoming register arguments, EDX and ECX,
    below the asm.
    
    Both registers then stay live across the asm, which leaves four registers for
    its five operands. This is LLVM issue #206307. The error goes away without
    either GCOV or frame pointers, and it reproduces with clang 19-22.
    
    Neither len nor proto has to be in a register: ADCL also takes a 32-bit memory
    or immediate source operand. Use "g" for both, so the asm needs at most three
    registers whatever the caller looks like.
    
    ASM_INPUT_G, which normally replaces "g" to avoid clang's poor handling of it,
    is not enough here. It expands to "ir" for clang, so callers that pass
    a variable protocol, like nf_ip6_checksum(), would still need five registers.
    With "g", clang passes a non-constant len or proto through the stack and still
    turns constants into immediates.
    
      [ bp: Make Rosen Penev the author because of a previous identical submission
        https://lore.kernel.org/all/20260904000833.2058186-1-rosenp@gmail.com/ and
        Sasha graciously agreeing and giving his much more detailed commit message
        explaining the background of why this exists. ]
    
    Fixes: 403cec8ab6d0 ("netfilter: add option for GCOV profiling")
    Closes: https://dashboard.kernelci.org/build/maestro:6ad55fe255fda507603d2651
    Closes: https://lore.kernel.org/a28df759-d0e9-41c0-97c7-5f89a18d54e2@oss.qualcomm.com
    Reported-by: kernelci.org bot <bot@kernelci.org>
    Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
    Assisted-by: LLM
    Signed-off-by: Rosen Penev <rosenp@gmail.com>
    Signed-off-by: Sasha Levin <sashal@kernel.org>
    Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
    Acked-by: Nick Desaulniers <ndesaulniers@google.com>
    Cc: stable@vger.kernel.org
    Link: https://github.com/llvm/llvm-project/issues/206307

diff --git a/arch/x86/include/asm/checksum_32.h b/arch/x86/include/asm/checksum_32.h
index 17da95387997..f74873a5e351 100644
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
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
