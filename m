Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792457819;
	b=UMQDSRbt8L+EkfUTpUgOSC6My1DMlMpVN9nkvcYaiFouvxCA+dUTNF7l5b4oVKvtuLFf
	 6gJpecgyD6gNeZgvGje8FK3Lmg2SnP8FR9hbCO0RfNJvJ99zHK+737D6ODfnzSfWAJoMM
	 bTqag11nu6zHBEekieUTB/5gpZpdxEMNrLpJeOv2WhgkD4HYifhwI/rfsrHbpoisrgKCZ
	 DXEJ22ey6f2LcwunNHLe3TjBQ3ZzvyfQ7eFuPCK9CpaJm0MTxihRdLVk1Pe/dw6LEwVMc
	 9jGECmL7OsusPaTIoL1wpia50lF/tyerhFkFNTi/63IF0xGe4s1tvvOMh8wNeHZOBJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iAtqBowqzkjXyj3wz92DLNUCFjJ/T1beZVYNBRJ7vrY=;
	b=oht8X5TqNkus0X/DcqnyWCmZAhdpp7Oedqn0xWO2Pstx9dgEiD6tZ7XAbXoE+NBr6nL9
	 +t6RMSsV074aK513R+KIniWRDW8DQZSrmuS99gpUh8i/z033ZOFgQnICbk9+cOsjqViOE
	 rO8iHQFL30mmmoW/BRoPO7kBkVhZ1VKcy5A/GheYGAUwXT7eQjS6I8TbK1XqfFJYtrQl6
	 SSFHeTiykSApNe9qCXBbMWLpUx8AJyEnvA73gmLuw1gxOr7DXlvX3fKPtGaNq9ykJh2uQ
	 O9h97P8KGqctXGLxJQQv3j49sbBpNAMKLBD6PuwglYMDEkuvgXqf04YxVvIdFI04Wxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KUGdeX8f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB66606A31A
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 00:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB66606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KUGdeX8f
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1aa29e06bso4717007a12.2
        for <llvm@lists.linux.dev>; Mon, 19 Oct 2026 17:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792457817; cv=none;
        d=google.com; s=arc-20260327;
        b=NurF1ZygMSPQ00NXTq1VQC30BawGhxYhHpwOOcP/6nG771esFXxLbB8M2vek/LoWC9
         g31D3LzN8kORp0LqeqogeoL/0d8ocCRtlsSi3i+1wBDdMea8pl7z4vONborjICacPjHo
         zrZ3hfbqVsTQp+ePeLvzLAFgfO8ue7/vGBfMzfudjkSKSNnEGpc/rbAk6x1khFNrFYaV
         vV48sGiCdg18HLhmLbO4Y7OJeet9o9PEh/jYDNzvl391cxH4EShZ+ykuAejh7fZDEtYo
         IyNu1YBFScaKVXuAKbj6gocQNy9pysvb3Qy9HCegBMs4/Mg92N+2MYeaJ/rOeGaZd6R5
         ZLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iAtqBowqzkjXyj3wz92DLNUCFjJ/T1beZVYNBRJ7vrY=;
        fh=7S51IPgVQYuPCmoOVAn40zEywIc2UuMr5QNW0UubF0o=;
        b=Jg2chiT3nG04HopWzsQ6izsMt7jtTIks1i71GDfsZWbujYi8RJh8SXnIJg5ujRmIXo
         ufBmhsaVzKp+Aafvaxzatu8P/irR15iQ8OjquIKs/kBRTUb59vqFscZPQjGrLszDwgcM
         cLO3kq3Nhc/YI5jwQc/3gMGvC9TGnz6I2Dc3o0dFZpe8G1dBRAgihRO/2Rqbn6L0MSGw
         gHqZMGtlwXM6XLwJZ2zsyHwEIr+lH63myWZAaCnTsgl5X0iPANyQe5xy2MY8KagrhL5l
         7s6RXCAmqWABzAGEAqcypjNbs9uqjLmVloDJcWjTvFUp4cU2Jt7kfewOBoCDv3NOnieu
         vebw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792457817; x=1793062617; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iAtqBowqzkjXyj3wz92DLNUCFjJ/T1beZVYNBRJ7vrY=;
        b=KUGdeX8fRV+wH23P9qtbfmD3XRVAmJaK6GvPaXod6lZLBqu8zWALI1vg7mEhpq1FjL
         0am7Y8LgOQmEgkvoo9hXwh+AYEUrWeT1ef/6ZH/8p4CSP4AAfmxoUopr4Erl46IBCXSF
         xG7BfM8qPs3JQHqHB+qIkeX8iuXY4EiJIxJPPxlw3mVQLEyoyZS9y/gzgZVutudUnOLv
         FrAmgbE7mhddka5gUr5dCXK0Z3NKDmhGNxd+o/7QEcEt5xpesjietPdh40Zk/TBaPmSA
         rx+Z/fLYd2P1akH4A19SDSVCI+kt+GUZJPRplLqodaJxytnoI7EDdKnAy+c8s8jLXb3P
         7v1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792457817; x=1793062617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAtqBowqzkjXyj3wz92DLNUCFjJ/T1beZVYNBRJ7vrY=;
        b=FYPGWdm1QNBePYTEu9pTpiNBFJUhRXh4Y6+ku0lkAwCbN2Nt224yj427y6AOH9fYMT
         j230PLpdy1KVSSer8UygYdtMEjbWt7ZsHZoZMGt6mf3EzLrmkN8oX+azriFrNk4acY6u
         0UVtBFWmvo7Kw/CcuTNVgV6Ks9wW5ZqHJoRSQNEU6E0VAJgJyQmqIOFbHp7whrDoNlff
         gGNP56gskJhjRn1kyVHqRs5rYl2F/Dj8nKzyNAhC/fsHNMRecVjDJPfutBsHh+p4Zr2e
         4zM92Cac8+HwEwHReoW676KuVLeaYlflM5HUCZFf5/Qgebn/RLMBTrwiwW1ZYzT6yyyI
         rUOg==
X-Forwarded-Encrypted: i=1; AKwUvBwGXAO0V9o+qvtcW6tIOXoM4fNAohNOfCd8xgEvAinLDNiHxORer1bMmobeY+tAWsuuT9vl@lists.linux.dev
X-Gm-Message-State: AFq9FYLpoDEnTXM6dSwsAwG8J3wBjNhhl/oMBX1W/qZWruMfp+BKtUky
	66qDEeMrIRt6hL3s6ZBHvySw+XNJnrFEWaW35CzLhulnfECd0hmyMMp8CNs0WMT3U5CYpzRoxWi
	Ns3piFWk3InkXUQNG/Ig27aByQjJCWbY=
X-Gm-Gg: AYBFou2b0G+YRSDyfNfKLMf/nYVKMEPAu3Ba6kta8BDc6dgcVvngyWiVdFq+wTlgXwT
	h1BDd10dQxNKdMOHTWPiF6OMNHfuWKWwCUVLxcrgf8Os9NKHjT/s8Z0SFPW5Ck+UaaVJMVnILpy
	iM1Dz5VpoEi8E/DjTyQfCei+koZRYwa9FrCvdmsBbb8geB2TqjJp1VGTx22wFG9rccc5x5vPH1r
	wy7OMjL43Jo+M5qqqFEJCdYL7GbFXGs1q0nWDfu4CSj/mXKRSl5TSi1N4UR1y5pmQ4gs3Lk0oaG
	/qAk6huI1hX94FLYnMDljTBUgP8CgHH1/SgILVldtyQlNw7W8G/eoVqcsG8qcJNFsXZNLdz6TsU
	91OonK6dYN6iGeK1rYtlEvrlo3zixz9zQHt+ujw5E/TbK41pBwAljR1TRc4CalE07rsM5h3tsYY
	TOepCx5FbXqi9u8oOJ33/H4Q9rI8DFwPV9kQhCwhxmrdc1rikeqI+ELslUHY5hwMdQxODnjrmK0
	G7i+PW2NoIKfacZw7OXNbJVInnrCSIoz4/epV5FQvefY+y+5ks=
X-Received: by 2002:a05:6402:3217:b0:6ac:765e:def6 with SMTP id
 4fb4d7f45d1cf-6b3a80e3881mr5814280a12.2.1792457816790; Mon, 19 Oct 2026
 17:56:56 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261020003238.2823758-1-sashal@kernel.org>
In-Reply-To: <20261020003238.2823758-1-sashal@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 19 Oct 2026 17:56:44 -0700
X-Gm-Features: AclHuK_gmL5ntpzJBqKaW4eMlZNeLIH7jBbTmZLvss7NzP2JfQGi4qJnNJqFwWE
Message-ID: <CAKxU2N9paXhCuNknUzKx5dYxhXitLZ=OVVY7Sym1HV8Mow6cSQ@mail.gmail.com>
Subject: Re: [PATCH] x86/csum: Relax the len and proto constraints in 32-bit csum_ipv6_magic()
To: Sasha Levin <sashal@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Florian Westphal <fw@strlen.de>, Julian Anastasov <ja@ssi.bg>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:32=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Building an i386 allmodconfig kernel with clang fails since allmodconfig
> started building netfilter with GCOV profiling:
>
>   In file included from net/netfilter/nf_synproxy_core.c:7:
>   In file included from ./include/linux/skbuff.h:26:
>   In file included from ./include/net/checksum.h:21:
>   In file included from ./arch/x86/include/asm/checksum.h:9:
>   ./arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly requ=
ires more registers than available
>
> The csum_ipv6_magic() asm needs five registers at once: the early-clobber
> sum plus register-only inputs for saddr, daddr, htonl(len) and
> htonl(proto). With frame pointers enabled, six general purpose registers
> are left to choose from.
>
> In synproxy_send_tcp_ipv6(), the GCOV instrumentation lets clang's
> machine scheduler move the copies of two incoming register arguments,
> EDX and ECX, below the asm. Both registers then stay live across the
> asm, which leaves four registers for its five operands. This is LLVM
> issue #206307. The error goes away without either GCOV or frame
> pointers, and it reproduces with clang 19, 21 and 22.
>
> Neither len nor proto has to be in a register: adcl also takes a 32-bit
> memory or immediate source operand. Use "g" for both, so the asm needs
> at most three registers whatever the caller looks like.
>
> ASM_INPUT_G, which normally replaces "g" to avoid clang's poor handling
> of it, is not enough here. It expands to "ir" for clang, so callers that
> pass a variable protocol, like nf_ip6_checksum(), would still need five
> registers. With "g", clang passes a non-constant len or proto through
> the stack and still turns constants into immediates.
>
> Fixes: 403cec8ab6d0 ("netfilter: add option for GCOV profiling")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://dashboard.kernelci.org/build/maestro:6ad55fe255fda507603d=
2651
> Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Closes: https://lore.kernel.org/a28df759-d0e9-41c0-97c7-5f89a18d54e2@oss.=
qualcomm.com
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Cc: stable@vger.kernel.org
> Link: https://github.com/llvm/llvm-project/issues/206307
> ---
> KernelCI's kbuild-clang-21-i386-allmodconfig job has failed on mainline
> with this error since the 7.2 merge window, v7.3 included.
>
> Tested on i386 with KernelCI's allmodconfig-based .config: with clang
> 19.1.7, 21.1.8 and 22.1.8, nf_synproxy_core.o fails before this change
> and builds after it, and net/{netfilter,ipv4,ipv6,bridge}/ and
> arch/x86/lib/ build without errors or warnings. The same directories
> also build cleanly with GCC 16.2 (i386 allmodconfig). A 32-bit userspace
> harness comparing the asm against a C reference over 2M random and
> carry-edge inputs shows no mismatches with either compiler. No full
> allmodconfig build or boot test.
>
>  arch/x86/include/asm/checksum_32.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/checksum_32.h b/arch/x86/include/asm/ch=
ecksum_32.h
> index 17da953879976..f74873a5e3510 100644
> --- a/arch/x86/include/asm/checksum_32.h
> +++ b/arch/x86/include/asm/checksum_32.h
> @@ -159,7 +159,7 @@ static inline __sum16 csum_ipv6_magic(const struct in=
6_addr *saddr,
>             "adcl $0, %0        ;\n"
>             : "=3D&r" (sum)
>             : "r" (saddr), "r" (daddr),
> -             "r" (htonl(len)), "r" (htonl(proto)), "0" (sum)
> +             "g" (htonl(len)), "g" (htonl(proto)), "0" (sum)
>             : "memory");
Same as https://lore.kernel.org/all/20260904000833.2058186-1-rosenp@gmail.c=
om/
>
>         return csum_fold(sum);
> --
> 2.53.0
>
