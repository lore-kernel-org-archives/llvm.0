Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1042457ED84
	for <llvm@lists.linux.dev>; Wed, 23 Sep 2026 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194533; cv=pass; b=A1BpNWX6QaW7Lf7zRFvovTvoJbvWXjqz76Jp4BwpJCIUetmZox80+vPNLu5EtI52VcYxmPjNUcqV0ZTv/Hstc4XdUrnurLI7BD3eNwkvydougom5VPUA3xhOCZ9waFM1aBDmPh1f6TNwF38t3v6IXJ4WN+tTu6xWpWN9Ae322Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194533; c=relaxed/simple;
	bh=AG+velq+P1x1sJHq2Eyj+yYuHBfJGE1bCcGBCBjr5A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V20b42nJ+LPoZ1gTQ1sGUH22O9LzTLSp3t7CNoDkQISkVd6SZCrVyipmz+iAzjsf8aGWWUgBiEfmXhctBfJetblyRYHuFPt5p5nVX/RGLmuUtSHjUzbs4YRUIGwQf5rum/vn/Da7YfB7sckTXramAYRZ8/W5kAoSAzmh9kcNaJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WR1CJfYG; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WR1CJfYG"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so1106933f8f.0
        for <llvm@lists.linux.dev>; Wed, 23 Sep 2026 13:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790194526; cv=none;
        d=google.com; s=arc-20260327;
        b=NHKhNH/Bb4LQam41rGi2LGsXAxY8TMtr5NF83YiRxvOtyV+ljeDoDyDvyuZomxjmM6
         i0pRP2Ey3M1fIORmrDdJ40uZhs5mQ22pv0TwJAtHgdHiK98c6xR+vfWVXoEtkOj/jBR6
         +nzn3ByiCsfhj0bVs7PW0VULxnno/6WmwnVJWFd5zhudUpCHrttRhN9PrEMp9CbDwALa
         OxpRdnQYfAIx532L8P09xkiL88mQgViObi7uhm9TVJJcDGnVXaF95yXKU/yCcVTiEJ+q
         CbalVC46Y2IIv3EAEReW+paoeOpm4AyhFpAr9g7T81Wr4z+ut+eVAdt6CszfhcPknorX
         /Mcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kOoYO2x0ceYQoltgnReOSIDMz30qflbKcG3KVK6oiAM=;
        fh=H5l1ZASWh7spN17xwbs8RqgwkgdTBdgx7cHb8RHCI1o=;
        b=aZGGXqnSxpGdbUUEMwq+uIJepquTEBxu1pPL7zpn2iAoaUgRNabGnNquMtDRnGb7lk
         xSHXoXPOzJHH69NVO3QMHp9VluSUPkxlwAg40BQVTE2YG8lCnVzbpzsHTTv4papJQAQC
         AkPGTq+MQf2J0uGs0RZav1Q18t5fbB7CmlBd9Ve6G5nd95jC7pTCgmeuhX242kiVO/sU
         +qcxZc8UWe+YAMOuRO81wXK1q2MDuZMZ1CKelGYI/D1l74LeUIIpk94+gUmJPXa+Y5+f
         mCLfojC0CSxewPvLQkXk+rLDPu3JJ7nK4MsxLHDvgCGRlGG47R/ekdhLKHD0DMcb1IBf
         /RjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790194526; x=1790799326; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOoYO2x0ceYQoltgnReOSIDMz30qflbKcG3KVK6oiAM=;
        b=WR1CJfYGluYZ4Ozv2fHOuIYTmIvZUTW1dySz8G735AU4jnDTcY6UPGK5ptsQ11t5Jh
         19I1Mr3JTlWjkvYmrNgfeCPl8Kyqq48gqtOLr0Lgf2TICzE7DiHfknGfUdMEwKkoOMsK
         jPTxyEDot/A0seqH878x6CgEhd9ltD5ta1Y0PDelxk1wra6P92LHdAW3MBpyDGv+d9y3
         E8p1Q+hqM7vMqbsjz+/kK5WqVU7ps4M6UlAm0D/JB3QsHYi1tR1mVU8a2xek15D/BH0S
         3UGL03aMinEpPUm0QRWt3kQOowrloL+mBXAArKxucNR1G8dKkV+JeCbxx/n26srPjlv/
         X7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194526; x=1790799326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOoYO2x0ceYQoltgnReOSIDMz30qflbKcG3KVK6oiAM=;
        b=d3tZo77QPz4hkFLc5igPFx05JpOQkhhMdXkvy5+bGu5d8a57oGGSyCRhtic8cMyYLN
         0sN8tMB0AoT2MkbIRb7HEK4n2hf92TLkQDlbOTNdu+oA6bSPd2vaOtU78X0KbJjHXEIl
         mT9DA8wfGlqRwshIpSn/2uo3C3Bqz32iHINTl6+KLQw/+pD+1p1jcf2R415eFocgbefl
         Z7FyRU1Oj72ct5TRjaCiykgciXRwTd5jy1aSqg8fQJ7cQNEPIWZM/gTRPHhrjBNhQk4i
         F0a2dFU7bnrE5E/7lIoqvHnUZ9cS9AR6MXIJS/yNXd+PXN8jj9agB4xEkMg9XAobiUqg
         08uA==
X-Forwarded-Encrypted: i=1; AKwUvBy6W3c61Ki1bzN8hEGKb3UTnZanjiiE3zD6Avs1Ns3IBy4XMosCBNGyu/Cl8/oBcb/YhiS6@lists.linux.dev
X-Gm-Message-State: AFuF++nUG5BCCzJtZCqtXucUloSUsl/dL/DqwodLH5fOjBCS5pVb3tWX
	CCrLtZCpi/+C8qx/vYXKR5mgRbjBsJj7T27qamq0Ves8UbE3wWZJPT+yPYVDcdixXohZpSi5G7Y
	RBLrFBFvHdMbTeIUf4TP4KmHXDkPQbLv5kGFrl1Yp
X-Gm-Gg: AYBFou2vjZ2iWZJA1IHSxkrpHrw8rH3w+89iapPL33Pg06wY3O3DtThaCMC6YUeaesh
	bUZB2Pkt0JcwrCU7/IQwuwBA9oiMAHisCNQv3k8nTan2oguAd/1QTz/JB5UUzkgbt0HmkP4e1CM
	thaBR2Q1WpZim+t+/OTIPvASUXECcAqj+NNRwoiNrbyT2I0GKcEE7ziF81ozrW3hZOkEPfscUsV
	Apv8dlqkw0gXZBnSJA28XaU0xjph09r3CoI1pEGeJ5v9mIAUmD/OqvYyHvEtLS7jPpZ4RX3TfUE
	LC3gq2QxdOnVe0WplsaiiAbEURyY+n9kweb9r/X+A0ka8okgmdbkWYljXLzQdLF/cZpydXupZBo
	rh64o7GYgYTqoAl4Fij9MyV8qQbmVFjn4WO+eG4R91yJbHpvNUlJ93qFkPsKGCur1E+5CTHG+p2
	gd2A==
X-Received: by 2002:a05:6000:2383:b0:485:ad55:208d with SMTP id
 ffacd0b85a97d-488716c8d48mr511088f8f.18.1790194525443; Wed, 23 Sep 2026
 13:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911084211.3149957-1-jgross@suse.com> <20260923193619.1408940-1-shreshth.srivastava@intel.com>
In-Reply-To: <20260923193619.1408940-1-shreshth.srivastava@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 23 Sep 2026 13:15:14 -0700
X-Gm-Features: AclHuK-BmScte-vitIZ7FKAidjIiegIYr2tRDSSJKsz3-ZO8Fal-vgtzUYiiixY
Message-ID: <CAKwvOdnKS+E9R3QaFk98dPNNh7uW=8yuJpYWGPHbY7k40Fk=rw@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] x86/msr: Inline rdmsr/wrmsr instructions
To: Shreshth Srivastava <shreshth.srivastava@intel.com>, Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, llvm@lists.linux.dev, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	xin@zytor.com, nathan@kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:36=E2=80=AFPM Shreshth Srivastava
<shreshth.srivastava@intel.com> wrote:
>
> On 11.09.26 10:41, Juergen Gross wrote:
> > When building a kernel with CONFIG_PARAVIRT_XXL the paravirt
> > infrastructure will always use functions for reading or writing MSRs,
> > even when running on bare metal.
>
> Hi Juergen,
>
> This doesn't build with CONFIG_PARAVIRT_XXL=3Dy. 16/17 and 17/17 are wher=
e
> it breaks, but the cause is the .byte fallbacks: ASM_WRMSRNS_IMM from
> 08/17 and ASM_RDMSR_IMM from 10/17 don't end in a separator, unlike the
> .insn variants above them.
>
>   #define ASM_RDMSR_IMM                         \
>         " .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]"
>
> That worked while they were only ever the last argument of an
> ALTERNATIVE(), which appends its own newline. 16/17 concatenates them
> with ASM_CLRERR:
>
>         ASM_RDMSR_IMM ASM_CLRERR, X86_FEATURE_MSR_IMM,  \
>
> so the .long operand runs into the xor. From
> make arch/x86/kernel/cpu/common.s:
>
>         .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long 266xor %rdx,%rdx
>
>   paravirt-msr.h:165: Error: junk at end of line, first unrecognized char=
acter is `x'
>
> clang reports "error: unexpected token" in the same place. 71 objects
> fail, the same 71 either way, no vmlinux.
>
> msr.h chooses between the .insn form and the .byte fallback with:
>
>         #if defined(CONFIG_AS_IS_GNU) && CONFIG_AS_VERSION >=3D 24100
>
> Two kinds of toolchain end up on the .byte side of that test:
>
>   - GNU as older than 2.41. RHEL 9 and CentOS Stream 9 ship 2.35, and
>     Documentation/process/changes.rst sets the minimum at 2.30, so this
>     is a supported configuration rather than an old outlier.
>   - clang, any version. CONFIG_AS_IS_GNU is never set for clang, so the
>     && short-circuits and the version comparison is never reached. Your
>     08/17 comment already notes that clang has no .insn support.

Indeed, looks like we're missing support for .insn for x86.
Filed https://github.com/llvm/llvm-project/issues/225916.
(Please do file bugs against the toolchain when you encounter issues
like this, and cc someone from kernel development).

>
> gcc with binutils 2.41 or newer takes the .insn path, where both macros
> do end in a separator, and is unaffected.
>
> Reproduced on v7.3-rc2 with your v3 00/13, v2 0/5 and v5 00/17 applied in
> that order, x86_64 defconfig plus HYPERVISOR_GUEST, PARAVIRT, XEN and
> XEN_PV. gcc 11.5.0 with GNU as 2.35.2, and clang 21.1.7.
>
> Terminating both fallbacks fixes it, and both toolchains then build
> vmlinux with no errors or warnings:
>
> diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
> index eba325ecfe4c..529c13553c63 100644
> --- a/arch/x86/include/asm/msr.h
> +++ b/arch/x86/include/asm/msr.h
> @@ -78,9 +78,9 @@ static inline void do_trace_rdpmc(u32 msr, u64 val, int=
 failed) {}
>   * form MSR access instructions reference %rax as the register operand.
>   */
>  #define ASM_RDMSR_IMM                          \
> -       " .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]"
> +       " .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]\n\t"
>  #define ASM_WRMSRNS_IMM                                \
> -       " .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]"
> +       " .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]\n\t"
>  #endif
>
>  #define RDMSR_AND_SAVE_RESULT                  \
>
> ASM_WRMSRNS needs no change, _ASM_BYTES() already emits a semicolon.
>
> The WRMSRNS line belongs in 08/17 and the RDMSR line in 10/17.
>
> Thanks,
> Shreshth



--=20
Thanks,
~Nick Desaulniers
