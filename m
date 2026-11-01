Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793540041;
	b=cidjMuWWJev2rBMHJAKav/eAjZIsyNbBc1mcmCyPz91AK6D22IfgB7BFmz5Fwihdc+Wq
	 Fd72G4jg0gnJkFd8ppM769bzNmiv2e+jsSv7AynWhjltF8yqIDohuRT8Zkqfru4fW4rBR
	 GUBNbyKV0jjNfBSLc9YPct066WsvqBs0s5vfrf9Y+lDVbZIpHSLkq0QP4lCPKKSJb8gQm
	 UcMDiWi2ZxjTbcJ8Dj+yaRAcPPr2Pnf4IznOF+qcCBBarC9mvlPpj5aTAS7p/4XGpOFpa
	 +MK8pQMxkavi2P/oKb/60f1ORo7XVjzSXxfUtXzqPyPRtFUBHcEgofo8kerYBWVPfow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793540041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4FoSNuo4120zGj2L29GeDCwMhfV0RCk5eABERU3r5fE=;
	b=qzRqE6RfBwO04Q2etvUJ2Yk+hX/pledi6jfyxVeSI3LMDLajalwuR2vrsDjxRqErXgOr
	 Nc5G4Eo6NFYnviBbf6PPeQR1khl6RHN8btAFZUx17RH3xoHbSWZC+TNr1JnKqn2+ahOGB
	 tNIvCqbdGSChPaHgJs5Ic7dHr0RTIrAcRRBJ5kDyNtd4a1bRCX1/e/5e/NulYikqDN4W6
	 VKiclmR+hgo3dOsqxPnhjaSdCBEJaBAXlhkPFxDTAmnG66uHTE1/iz+NQbEh+ak/xeuBk
	 9EBx01lb6Cr9T5VOgwXjx3RNaEF8UFirzKPbtRItetXyZe5dGXp1vf5G7IRkwMKndsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSuacvDG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87686606A326
	for <llvm@lists.linux.dev>; Sun,  1 Nov 2026 13:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87686606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSuacvDG
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15943c9c005so434788c88.1
        for <llvm@lists.linux.dev>; Sun, 01 Nov 2026 05:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793540040; cv=none;
        d=google.com; s=arc-20260327;
        b=CfUJFbWqwXU8Pi1RKF1OvD6vETn9pl66W7XHQT6ek81ZdLNy1E12uO1tqEo3p1g41i
         qfLi1+1Fy04n1aK6rQh0EmhfYIqECWi40EkmrkLFogbA/+qvkNbYXMQSmnSSVHvSggDT
         btYysNvxveCK+X5DakaeGhBVEbJaoHePk/O1JSd7VO1s/oJ2/2lUz5tMHrXJj/GllMht
         ViqQ15lQMQbxa0sEvgWeU0GZdProGLvUbaP2whSqSnHsqQA52WZWLTRljD3g7GCNU1xd
         MiPWKvTTMFzn5I+cKHr0mHQaZOOLUzJQO9c3rDiVaBBwKgXg0Qv33Sna/W7vMroQiWtS
         TxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4FoSNuo4120zGj2L29GeDCwMhfV0RCk5eABERU3r5fE=;
        fh=N/LN1jek1l9CDNmErP0wzR5wAaarnoZu4ZPVGlkQkG8=;
        b=nUN6cIddT0XKxUmkqINsOAo31zaPyHs2IZ/sBg2WtEZpfbIX1Cml2Y8iLJqjQPG8g8
         l9bGOEONxdJ/OB71Jn1SiAZlp/XiIIAtLHjcY0Mhmi/y2cG0hvlbHgleB6DL8nwkUj2W
         5LghFWqfSA54ikZykgj4pz7LOeruA6O/d5lI4IX2N9qO+ePGtuSWNhsU5ZPiO6nD3bxg
         HMhQK2R+Hu6xcr0ka6Elbtk4QMhJ5RL4tNoO+rTRuyLV4QsR6dWPClWUk/RcGO78o/uX
         TOexCTjlCsoqDmC0RmdDliQD7phu4T9524VUlZie6ZI4Q9oAsQ43QnDuvg3qSe3MRJ62
         rkNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793540040; x=1794144840; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FoSNuo4120zGj2L29GeDCwMhfV0RCk5eABERU3r5fE=;
        b=DSuacvDG2w1gNYJLnhB5FLmF0hwghu/S8Rr9FGLr9XvNkD0L+AD8rEjlyl4Z4/EjU1
         b7N1XNKcLDdZD8JCM+d7h37XTUaa5H2G6y/ujfr3xG66HdEbypN+TluOWDoSbEmtof+f
         BfZkaA7k9mNLF/GdtTGE5h+Rh1FUinPtybAOs+nekq7lO65tf0BiI6UjmiDSb7BU7J1F
         P1Kq7XHW+QxNcLZhJtEaTLznDLBcv7Qhb3Wo3hqto+2tNeH0g8mD8kSfzZXYex6P0ns/
         fTEF1gK+Vbgq4jxBPSqaGNTApSFggh+KFRM/Gb893zRDFFldcmSCRDWWM8GZQNNuK7+V
         gD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793540040; x=1794144840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FoSNuo4120zGj2L29GeDCwMhfV0RCk5eABERU3r5fE=;
        b=EPEXqaQY7ByCU1NeBqywV8FM+2uU61KZdSYO6Rp5VVyG0Qr5SNoCzpafKHpANaqkpl
         yJzeeVQd8hLCf9XjrpYZk4dr5Fi0N374Hhhzvf7PHtergqHaQTzvAiEXVZ5voqgqfsgi
         QZ3E5Zw7BMv95jQEkMW92R8R2x5Azq7ESGZXgqhTYO1D7Q43+X4okMAkDkaMjzqBCIWU
         sMRSejS1Ryn97zmo301qKP/F19VUvUhHzVEIC3BWHXYvy51kZF+XrOrepxucz1+hdh4r
         Uzoac9yWvztcr8jrXzQY1+C+nJJLJCJ7FJJaNJMrnByFQ15ETn8apSGLnDPK7atN2LoU
         8fEQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4+xjurNrs88e8j9jP4XPgCngn1gUhLdRuQEduYfnmJYZbK6vGxnzFFs7qdclm3bU+PVwD@lists.linux.dev
X-Gm-Message-State: AFq9FYJEtK+n8sVw9enIR2HWq8295GgeiLM6b1EVoSZJ34GAosd/8J+g
	dFzCm/sXEEcmEnW9WZ21UibJXftY4rtLQCAL8LnVtJhrtf4l5upM1sJM7YRpu8/Nbd/TDREnibC
	CGlg5uq+T5xT3y7l0vkvP3TB8f4dNAwc=
X-Gm-Gg: AYBFou1cWlDqf9I0nSdNq8m5MdHcOgDMR6PGLHQ06YZBK3e4/2PmZUXmXCHaFRco5rH
	mAzw9I/zls/R/+Snt5CM9DI0BbMhuYupteJIHZSo1ZpVo6OO4mUzIHX7evG2IbLFbW/TPb7KB0X
	Y7QjIATkGEWGgJ/X9TQ/ABW0hcPjeh7hLg2axifO0GKcRv9HM5Sivie/6QyuPVj5xslXCB5wpEg
	pVMiyAwGlWtNUDnaRX33VePpN8ACmfsdt2OG0yX+TPOnqeOVh/8nQPcl2b0de2Cf3wITaZ/73JI
	bRiGPTPeSTX7S3BRWjnYp78tgQKwWW7mbXccRmim0BgdceHPHrCJDFKXpi0rzL+MGALC8G7iBLD
	vrcyt6gaFnVMEWQ8KVW2iRUctHOx5fYpKfMr60x0TuNwVmL8tW4SB66o2EOOUYtf/Rx3AdQ3D
X-Received: by 2002:a05:7022:b047:20b0:1a3:bfb6:44ad with SMTP id
 a92af1059eb24-1ac5da797d4mr12358096c88.32.1793540040375; Sun, 01 Nov 2026
 05:34:00 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260927131838.6774-1-demyansh@gmail.com> <20260927184414.6c0c8867@pumpkin>
In-Reply-To: <20260927184414.6c0c8867@pumpkin>
From: Demian Shulhan <demyansh@gmail.com>
Date: Sun, 1 Nov 2026 14:33:49 +0100
X-Gm-Features: AclHuK-VTVK2Zx9itCVd1q2fYcmda4QQ21q-m0eczAKCyG7Q3SKFRADCEFBZaD8
Message-ID: <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: David Laight <david.laight.linux@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow <davidgow@google.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

Sorry for the delay, I was in the middle of a company change.

You are right about SG and TX csum, but only when the traffic goes
straight to a NIC that offloads them. There is another side: software
GSO (skb_segment() with !sg && !csum) hits this path on 100% of TCP
payload over WireGuard (wg_xmit() -> skb_gso_segment(skb, 0)), and on
drivers without SG/TX csum (u_ether/f_ncm, cdc_ncm, mt76, rtw88/89,
ath9k).

So in general the software copy+csum path is still alive.

On the other hand, NEON is useless here. skb_segment() splits GSO
packets into 1-MSS segments before copying, so on these paths calls
never exceed 1448 bytes (1368 on WireGuard). At that size
kernel_neon_begin()/end() costs more than NEON saves, on real hardware
v1 was ~3% slower in cycles/byte than the scalar loop on the slower
cores. So that part can go.

I would prefer to keep only the scalar version of the fused copy+csum.
It reads the data once instead of twice, and on real Armv9 hardware it
cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
depending on the core (+6-8% throughput). It uses only general-purpose
registers, so there is no FPSIMD state to save and it is safe in any
context.

If you are OK with the scalar path, I can send v2 with NEON dropped,
the scalar path only, and the KUnit fix for the x86 zero-length case
Jakub reported.

Thanks,
Demian

=D0=BD=D0=B4, 27 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:44 Davi=
d Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 27 Sep 2026 15:17:56 +0200
> Demian Shulhan <demyansh@gmail.com> wrote:
>
> > arm64 currently uses the generic csum_partial_copy_nocheck(), which
> > performs memcpy() followed by a second pass for csum_partial(). This
> > double pass exerts unnecessary pressure on the L1 cache.
>
> Which workload actually needs this?
> Most modern ethernet MAC support checksum setting on transmit and
> checking on receive.
> So the software checksum shouldn't be needed very often.
>
> IIRC there is also code to defer UDP checksum validation until the
> copy_to_user().
> I'd bet (a few pints of beer) that the complication this adds isn't
> actually worth while.
> Even Linus can't remember why it was done, my guess is it improved the
> performance of the userspace NFS (over UDP) daemon that would be
> doing 8k UDP send/receive (fragmented by IP).
>
> There is certainly still code to checksum data during copy_from_user()
> in send().
> Last time I looked I couldn't see why send on TCP sockets didn't go throu=
gh it.
> On x86 (in particular) copies can be done far faster than ones that
> include a checksum.
>
> David
>
> >
> > Replace it with a single-pass implementation. The new implementation
> > provides a general-purpose register path for short buffers and atomic
> > contexts, and a kernel-mode NEON path for lengths >=3D 1024 bytes.
> >
> > Measured in-kernel on an Ampere Altra (Neoverse-N1):
> > - Scalar path: 1.2x-1.6x faster for lengths < 1024 bytes.
> > - NEON path: 1.2x faster at 1024 bytes, scaling up to 1.6x-1.8x at
> >   4096 bytes.
> > On Apple M-series cores, gains are 1.3-1.7x below 1024 bytes and
> > 1.6-2.4x above. No length or alignment regresses on either
> > microarchitecture.
> >
> > Patch 1 implements the fused routines and the dispatcher.
> > Patch 2 adds KUnit test coverage for the new API and internal paths.
> >
> > Tested: in-kernel benchmark module on Neoverse-N1 with both
> > implementations cross-checked (0 mismatches); KUnit suite under QEMU
> > (with/without KASAN, with PREEMPT_RT), exhaustive and random userspace
> > testing of both routines against a naive reference with PROT_NONE guard
> > pages, gcc 13 and clang 18 W=3D1 builds, checkpatch --strict.
> >
> > Demian Shulhan (2):
> >   arm64: csum: Add fused copy and Internet checksum
> >   lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()
> >
> >  arch/arm64/include/asm/checksum.h |   3 +
> >  arch/arm64/lib/Makefile           |   7 +-
> >  arch/arm64/lib/csum-copy-neon.c   | 168 +++++++++++
> >  arch/arm64/lib/csum-copy.c        | 108 +++++++
> >  arch/arm64/lib/csum-copy.h        |  84 ++++++
> >  arch/arm64/lib/csum.c             |  54 ++++
> >  lib/Kconfig.debug                 |  10 +
> >  lib/tests/checksum_kunit.c        | 463 ++++++++++++++++++++++++++++++
> >  8 files changed, 896 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/lib/csum-copy-neon.c
> >  create mode 100644 arch/arm64/lib/csum-copy.c
> >  create mode 100644 arch/arm64/lib/csum-copy.h
> >
> >
> > base-commit: 93f51579e7df248780214094418f205253383cc5
>
