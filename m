Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776696;
	b=QQ3ajKyqTOZoEMUR32z7vS4vuonAF/8kL4w3Rg04drQcG3n6/hoW3oMy69dLHMxefbpU
	 8BH4Qf3+eS1ZRdSY79ZUVedPb/GCyhgIVzBmUp0NQ35RPDEQGDigpUaZtZVHzOs5bT65s
	 XlXqdP4OwiycT8WJRirvuGHxtQlDFAPYEGz+/zCIq5uqCEkLEa8I/if3t66WtQqjCIWRp
	 ffqXvo+UBKF6ufElv5TblZyKcCx3EgEl9iix2Lrlws+0mEAZSS5sWXCJhl5riK0yRm4uZ
	 L7dq7pRue/bxEdur+3A2kClZCVlDtN1YZ1lCyRIdkKI/sMh6mFK3XABjjWE43oFM3Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kpKiQOyrEGQjSkMvaeYi/FA//UJ8PVEGtqBN975yHSg=;
	b=LyIUbAWxzFtC9/Xxu04aa8M6WtBO3edyAaHWGf3bnRcbzUm//jD3gmxPZ5mtBfu/Udyb
	 ljDpVbVnWIVIYGee/O56uqIFqJ2B1/vGQqefP/7/AniOnJuHV+xq/LhRtWcXI2uaO2Tyn
	 BsmfLpnWGIfJ7FJM5+TxDmDLbdGWBM7U9uKuMy05eqmH7Kk1XcpPP8+W606fV7RPKGqKn
	 zhISmX+Gi+HN9J1Ct3ivmvqWDo/EBQ5ND9q1xwCdV7C4Jl3MVjuhEP4PTkjFP34KVE6Ff
	 oNxDYgHL+d3Y8siJrHF7qurMZW2Bc4VjYI/RpqvK/2OFqeVLBG7l/v1NMc8KEkPU8yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mkfwKF7x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB456606A328
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 07:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB456606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mkfwKF7x
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c418e215671so53957566b.0
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 23:18:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793776694; cv=none;
        d=google.com; s=arc-20260327;
        b=r+LhV/3mGvGx0pPmNsp3oO057RLtkdU/vJXWs1rLCRUQc8CZx8N7t726XaKeH5rZTF
         h0/GlzjpZ6R0f2A2BB/d9Uc3xdkdbwOWhUo17pb0vnw5eE8CTHYYmxL8D2rhmPO7WA6E
         GtD4O3igVpiHFZkjZilkYSY+DIQxGD5BPMq5JnpeS3Tbusl4chXaWg2pj0GUij/WUzlv
         qTwrI9wwEOXydS+Hq92mti8PsX0JcyK5uBk16wesW02LcbwGUjJczomiduUi8nqtyv72
         mKiTXGua1iXfTG3FAT3EyTBdtMNsH+jmne1Kv3vvLmNInp72I5gkMk4u/SuSwlFLzhXL
         anJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kpKiQOyrEGQjSkMvaeYi/FA//UJ8PVEGtqBN975yHSg=;
        fh=aHXmtyukycHktfd4TNqqdCgOMLh5dJAh2PwyBCf21EQ=;
        b=rnga9998jHpkZKU2TZL1BtYQhhjxb2Fdhjgxcd8I4LUxzok08wrrI+7TGjrSdK2phI
         F16XfX3LhgwpGGDvIPeCOlfzTBry4jKkZ0W5A7Orw4o3FewLCzBQ9NJjob3d+5MFifDl
         GkuumCR4Qh7AYM2fRLc1vpT68D+numDhedi/L0VpzhfO2PhKrD4ptS1a7IPhwb8rEopB
         jsVXVJiNlmOJNYRP8dFc1Viojf79k8xZgmlY5g20NluzQvjyVATKDdER4RcOxOBZxsLo
         5t2uwJMYcKl0HUcENRBCxIiS8xhiDdanRq9jaK8CRsY6BcHbb8tS9zmm1uxDRirnTjnT
         JNxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793776694; x=1794381494; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpKiQOyrEGQjSkMvaeYi/FA//UJ8PVEGtqBN975yHSg=;
        b=mkfwKF7xDxMQMyD72wubGvj4alCvlna6Kl906dWGpK+F2ADXiClH3XfGJOp2eT1yWz
         oFXpoecR7Pz9zjqaXid1hB0CyYDedLfZ/XcK9o7X5zgZqAxvhxmAzJ/iORKiqfLzI23w
         iDJtCduLf8/u5SEPQupELwWpvwex91QvC9Bm9qjnWCccAAPFfSOA+EKPwfoTpFS7LzjJ
         rxSVqSJceC/+sqL4CucgSyJzDawZdJArgppjwDFWrO/Y42KDn5sebNEXXfVjkyaSlQ1X
         fMXmAyTDs7ZFlrdOwxTCFs9PmclCFgDo5luv4OL1wSsr6x3rqiOsosMmkpyYiHwlcksP
         zTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776694; x=1794381494;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpKiQOyrEGQjSkMvaeYi/FA//UJ8PVEGtqBN975yHSg=;
        b=GTnJNWh6nGg60U67LpNvqF/Q/ObfLkIgB+xbZ1j/in6UJwxygsn18QAEJzLucHh0ls
         ga8ekRrkLBft0HtqgSEtOeOM+JxC63ksAIXwl12w01dLNDUBOj8H8GJMYR480HW53lws
         JSyCQS8H9wYaeGnIYdHJB2YQfMj/eYva6w8pAGD78j5OvpmhZGxDDrO9I1YWPiGR+7Yp
         ycApOFDOfobaRzlAx0i7oFBG7H20XVcjEPCcOHBzfoahpA0wsvVgek2YOHMeUuLoqIiK
         FZtGeQGYf+CKLGH7FHJ6XjiBneoHYN43fN4ajsx7zYRL9gMvVtG1jtsuV14oKJtAoCZJ
         qwgA==
X-Forwarded-Encrypted: i=1; AKwUvBxrhUOZ+/370T9D20KcAko/qa4HIdLlgpfRaGO+LLanh6AIG7CSveNRtOY9auzcwasLC1M2@lists.linux.dev
X-Gm-Message-State: APuU4Z/NzrxoI1FZzM+sf8b6F/bM5MxqKc5B1gt3cV+r96RcSONs2Fm0
	2Gmx9Io3OSYlzsHKXiBt2GaWCPqEMoPr3dtgo+Rp81t58QjiEC/iiUzuOgyjG6pP29k+v9F3hOZ
	rflQ5LFsCbmlJ2OiX2BnycB/fykb6SqQ=
X-Gm-Gg: AYBFou116DHlVRJoQPAQ6IThmfYBNSYPh1mg1qUq6dDyXlU6h8bxXg3cuCDiFPd/gvN
	IOi89UyyiuQyTrW34a9oQflKUSbqOryhKt1Lo3WGwMthXNdlZ6vj2rXVCJ1+PxzIl4mj38tNHdT
	NDdCMSwolMBt+SlVkdQflBNfaoA6o1wue9VgImQOdfwehv5nwH9eEjUlBS59Gtc+Cdj4olKTN2o
	9YINctTu24q7MTuV77vLFmr/P8RHnw9RxWRKtw23f4DKP5R5WxaHVO+9hes9szIHv7WEzB+8qWw
	HTVf93+C1bhA1J4so1jQ4m4zQFK/iAQ1E+QNK6evkl9ExcHR4K/soArJ3GQX2RSjGsEdk1EzDpF
	K3XF+MeT8KvnmdIFAYafAfTJbe3mr1f2d6YywR3MJwvMrlZkIevzndq+26a38WQwcB3swAA==
X-Received: by 2002:a17:906:ef0b:b0:c25:91bc:ff55 with SMTP id
 a640c23a62f3a-c4ca7a878bamr1390172766b.23.1793776693850; Tue, 03 Nov 2026
 23:18:13 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103060658.696994-1-martin.ankerl@gmail.com> <auqNT3yNeA1ujmW3@tassilo>
In-Reply-To: <auqNT3yNeA1ujmW3@tassilo>
From: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
Date: Wed, 4 Nov 2026 08:18:01 +0100
X-Gm-Features: AclHuK9zC-OrowJyDsUEWnW6UL1USeGbybY_wgM3WfrYF13CrvohZ2o801ipwC8
Message-ID: <CAAFOosbXR=eF=sj9Ap7y3odVgLEPx83rXPE0dWwf-=+f3VH9Qg@mail.gmail.com>
Subject: Re: [PATCH] x86/cpu: Use prefetcht0 for prefetch() on 64-bit
To: Andi Kleen <ak@linux.intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Youling Tang <youling.tang@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Youling Tang <tangyouling@kylinos.cn>, Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"

> One thing you should check if the inline assembly pessimizes the code on
> gcc. Normally builtins can be better optimized. Or keep using the builtin
> on gcc to be safe.

I built an x86-64 defconfig vmlinux with and without the patch with
gcc 16.2.1, and
compared them function by function. The .text size is exactly the same, both
have exactly 62 prefetcht0 in the binary, and instruction count differs by just
one: 7365619 without the patch, 7365620 with it

23 functions of 130789 actually differ: 21 only in the order of instructions,
where prefetcht0 comes mostly 1-4 instructions earlier, and tcp_ack() and
e1000_clean_rx_irq_ps() differ in register allocation, the latter has
an extra mov.

I timed system calls that reach 8 of the 23 functions in a KVM guest with one
CPU, 10 boots per kernel. The differences are very small and within
the noise, in
range from -0.7% to 0.0%. So the asm might be slightly faster, but
it's too close to
say for sure.

So I'd keep one prefetch() for both compilers. The other 15 functions
that differ
are mostly NIC receive paths, which would require real hardware to measure.

Martin
