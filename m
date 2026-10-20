Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792517152;
	b=Ca8apLWr+Hav3ogqV0jPtU9cf6Zp+WgC5TpBFVBMJZ1TRDj4x012+ug7b1S3lKBmtJ2H
	 VBDSjuKhFRx+JDxgL7ZCYY276aeleIjr58X+94ZM/958ZLdYctBHfgU/Pf2WBvpmUiedC
	 Bxb20e5pajYxd78YRFAhuka24ciXgoRm4urpuG4MNyR0MWVYOUjQQLZ89PsumWYUVK2VG
	 PN8ZQnWDInIPJLp7LDCvqMRBj86HrTaSeYNaaoc4qNlAleWf27OQxza5Xr9Z8utwkqJbF
	 4Gud39tH/c0RixjRLAQKAExLSQOOStBabRIbVIdDCkNGS82wyvURT6U9ZNZBKwVQBsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EdK0UMmig/WdOrlqRQfL8+PLy1EV4ZbphI/FEkx+xD4=;
	b=fvUh9XwLKFqjrlg7DxlvgGHYkEN/ewanblYlqg7s51QIOCZ83mJjkur+PNOI/1K74+sT
	 Wo1fHkVJpqZBDg8yBeN8cPnRRdY/jjKEAAnzHpZD6HYKs9szsp+sxJOvrbPx0meSfoSLR
	 /ZWoA1BBoCRb0O1WeoTZ0qc2tREruu0FegKPX1QhbqWkbrcR56Ki4wBivQ1rbvlQqThI5
	 UCj/1o/QZCfR6aX+ziq/tImVK0ePMM9dsgh7AbMBbd5dvOAvyll1+EZWICpiXiX04JvwI
	 ttnY+YyAyuhuD8qDk2xXRGSWyJuHjDd99aRWS+oUY8eNZqC2CmOfKmE2Xva3ZWD6DmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rmPQnGd6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B252606A31D
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 17:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B252606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rmPQnGd6
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so683198f8f.0
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 10:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792517150; cv=none;
        d=google.com; s=arc-20260327;
        b=sf5EbSJ83OHCIZJwwiY8ttNiesXCsjyhXzQLgDKcRzy0O0y2hja/amuX78ACuvHQbN
         LAD6WG1izHo7PTk9SmMSbX7Bu/EurArUVNLtgAgQvCAAizCM3TkR4T9Yw7Y/hAI2fkjD
         t/r2Q8P7F6TTLBb/P6MbjHTigGtB8Le50xYwSbao0m1gBCwfJbsKDVZrI6+xZz1qXUD2
         vFTtSyryAMXqUJm8fJ5mdMJi/OHpjSvM6jEj8MgWpNe2VnCZBpLRsake5D1AksAlSudl
         MXn2QM11KV8vcwDKum4f7RvU0CSSQMUJUpBK+SVitgtGV+dHLLQz2b92WZoQRCs+V3aW
         jlXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EdK0UMmig/WdOrlqRQfL8+PLy1EV4ZbphI/FEkx+xD4=;
        fh=xkqIhvAD+eWjls5IOm+qi/YF4FFWZlvIQtlLosoQ/fY=;
        b=ag8c3CnBMSFtVpofKpnYquNXGjiuX5TDhgbJabgfPY462EUo1lXDP5Xgp7EGLx0CHh
         cex5sKrg2MIlAA8b1mL/p4+ZPkrJ1jHAQ7afYKQKc145fPJnNPTu6n9eNmRU5WFPaa84
         /5/DydDBgyZfqrQvl0SlMCZYRMet3a+R/2ffbyQ+RLZsybGnaO6cD+fWOK7wUdVgrkLw
         bXxhWR0K7WxJlP7rOW8FAkBNuuyduRcpPKuOYHNCZciFWmiyLuyJy+CiQl8Fjp63lhT1
         p2pJ9xQjxx5SPA/dEounWVjYjqvVp7qwTeCNuH3nDRpyzlbTeTkJUdsdIIwfKUlPHec2
         sxUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792517150; x=1793121950; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EdK0UMmig/WdOrlqRQfL8+PLy1EV4ZbphI/FEkx+xD4=;
        b=rmPQnGd64DWnBHL/erUY9p9QAdu5Ns7Fxq0Gz95wHfPHuF7KL/nuN6E0Wd4hE24ILu
         kj8foIn5lBUW3HpsvLvZU9slz39XbrY6yRPKDxEvy+qGQf/teh121ugo1P2OMv2qqq4G
         6/3IjgPDbSDhdxY2uIJlpBgH6KIaW+HjKtKlm87Y6IjgQzcgUYuhBr5mPBictNNuOUVZ
         fD+loams3n3SR7k48bLWFLje/3UhIl4UGH99YCYXeRtfr4yBM5c/Rg5OG4bFK1+AXmhK
         Q15toEyliXdOrFgyUnk6d2imwUu/Nwt38pMcnLSC0EoRndtiuooFM65Sn3DnR2nvPZi2
         BG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517150; x=1793121950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdK0UMmig/WdOrlqRQfL8+PLy1EV4ZbphI/FEkx+xD4=;
        b=DXKpD/nsMqlMutZpGoHozTQ2FhUPp0QYrEF1QAEa6EOl61KgNyfFtG41ilYvX2TroG
         /8ZyUkY7neNQi/haimQdJzW8e4ruvOBsOldDPwXn7fZCYDd22Xv3d+Cyg36VooyvRv7F
         zjAAkwhnjymrOSPAusVp5Np+6DLbnN5xYgn6tnSD+U6JAL6ywzS4dn6Z5/F0N5nSwXiD
         0ZJ9tqdsO29i/t1PSzGbeII4j28YY3H38eMfdgpGuyR/lcFW/dMKTizPhoAZ6x6LZsph
         ePpxLYvVRiLE1tKul7HO1wKhNEhMrxh+SP2UW6s2zvC2n2lGyth3iOstQoerqKJNCVnH
         Mnyw==
X-Forwarded-Encrypted: i=1; AKwUvBzXbL9I0FJ0riJ6k5KeTCaYK/OION48dYp2yxP3F1gAIvHzsgpaOIjRc3/ibAdIQFN9J/jG@lists.linux.dev
X-Gm-Message-State: AFq9FYIsGZvjF2ZcP/UEhLLd9vvGM2sk/9Jb/BBrwjj5333WgI3rljG6
	pkiQynDbJ6OizFso7xfgPwmrlTnHCw2HZJXTaiFfGPoXCAOO2MksfzrUFKDf9GH8YOTRE1CqjgN
	VRPUYT1kirBBqlzYOVScmqtsApy7txw0u4XsGWD3H
X-Gm-Gg: AYBFou0oYHqHE82ErFrO0ZSOiXipizLwR0zVrMc+mW28y3uNwUNhBbwxMMAzs9rykr8
	gAAuEjRxx4sYi+97FpJEvjiKHDHbqAN3sgzMa0BDyxPZ+PzSUvfY9R6xqGeUqVlXXiMkBaDrAuZ
	d4Mv0exLZzSEgo2bLeCr/BPc3QvXjrjnZVZQjn3E0k1jW6EPAcrDY/myW9XyjFK75eevNwgv9nr
	i3kxnGlK/OCygj9YKaEFF61FTzsXktmzueTTT0ZG6/dPk4wre9URDg/8L0OnYUqtnBAPqrF/+HH
	kcFr9gXhWbwJAr9H/hKp0QmrZB04pGhMfDTC3lGFKVXiwvCKljUxSfq9sBHhI+utTv2jIffviwO
	EpbGz/FEBC0G4exVQO2dvEz+fBrg4Xn1flvB0/JGLcigxaB0V1T9fH8dKwYyswLtMwFs6+YdbUK
	20yc9xqS7Ni2I3juav5wwqlQZL6Z9Gkdy1iiXlgibFSDscH9vMWQ==
X-Received: by 2002:a05:6000:238a:b0:48c:6756:dab3 with SMTP id
 ffacd0b85a97d-48e1e74f8dbmr7138106f8f.3.1792517149285; Tue, 20 Oct 2026
 10:25:49 -0700 (PDT)
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
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 20 Oct 2026 10:25:36 -0700
X-Gm-Features: AclHuK_fa_HbNaQnYqb-OZRkDYI-lx83Hg73A49l6-9Bv4sDG5IJipWqk7Uxofg
Message-ID: <CAKwvOdnZErT3FTMmCKkRrhZd6qsGancaMoAAx52pFua_3HqQ9w@mail.gmail.com>
Subject: Re: [PATCH] x86/csum: Relax the len and proto constraints in 32-bit csum_ipv6_magic()
To: Sasha Levin <sashal@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Florian Westphal <fw@strlen.de>, Julian Anastasov <ja@ssi.bg>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Rosen Penev <rosenp@gmail.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
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
> Link: https://github.com/llvm/llvm-project/issues/206307\

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

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
>
>         return csum_fold(sum);
> --
> 2.53.0
>


--=20
Thanks,
~Nick Desaulniers
