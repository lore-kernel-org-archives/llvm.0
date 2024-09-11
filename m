Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8102C859
	for <llvm@lists.linux.dev>; Wed, 11 Sep 2024 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726067042; cv=none; b=TVHde2Bs6JcnyPDI4uoCvnicvfBssz4+WsplgXhvDqxPb+PeL5WWXRfj+NMKdoxUZiWJnDhRaFK2TFUcfgLAIqkogxzs516WiV9aoATVmKEQ3HtFXis4yJr69qLT4Q8VpK1zb8J8hSyWkki6iSyX9JdP0qXO+H6u9OAnbac5ik4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726067042; c=relaxed/simple;
	bh=ypMnOp61n8Gx9VHy/03XF4NXk3UFkB12wmroUy5FVPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0fG58Ikrg6PjbbPASc3vO+0dXqxHkb1cH5X1oa2ET0Rpk0ntKzUknHwumCGF7hMJLopI6UVrJwXB7qA9sys9jLoOdNyvcQM8QUTLp1N10v7zUusAX4n23DNKE0fhXzEvByenaQ3P/j9C1iwO6wE7h7VepHITFIMw4q5F+GazvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVGygn8d; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVGygn8d"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6cdae28014dso7095487b3.1
        for <llvm@lists.linux.dev>; Wed, 11 Sep 2024 08:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726067040; x=1726671840; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moeq6ger2QwGp9K4wxCsV0yx2pNLlzVd93ofj9YZDVs=;
        b=EVGygn8dAsCNGvDrs4WJ/FhQftFuaXovQS+hoZotq3HH+UhmjhRUbpOPKkwPIMZnqx
         qDkKtM17ar3TvLRfg4LDYsgqjP9UyRTaIjDHmqS0aa6cgsmN1MzAPj+zYL38dhyd6A2+
         9C3qNb/WlMDTNq7Cq7wi2mOJ7s5behS58fEX6T2WAm64u5ejCSCZ+iaGEGWHvSn5ZGDh
         KIEp8jAvBlH/OAiFJFEOD0EvIf2cZbfAC8QJqWdNKaYBGL+lOfmdO/Yut0YKwp83HidJ
         OkAh7sevupMH2xPy9onllbhF1KOkqT3k9LWb5gg0Vwjs67pUsgD4GMOZNvwAOwwNxbTM
         qX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726067040; x=1726671840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moeq6ger2QwGp9K4wxCsV0yx2pNLlzVd93ofj9YZDVs=;
        b=JkO2jW14vrdmH82FaZk69xu1e8NTNCNqNZSEsOMeW4kYs07Ia55B9e9EqAVKtwmYyC
         WPyyrTWzjL131ffOEFHNgD93vi43SOeU6liQOqMos9XekPSxK8CgxWdIBZuAGN5UnvVS
         K/1P3cRf5C3cri7v/sSZi3QhGPLP21e5Ty0oTVec/hf0M0IBOuiioQ4TSHBOMXt3lUij
         fuM0eK72W6X5amutg8MqA/F006l28yjHkue2eUX03qEwKOQxdHKu1N90pUjylqmDja8T
         LS5MB2xpdntg+wuDA4WIdBXgzwiUCrxf+C491zwyYf1rFf8QNkbwuAx1D9JXeNdHjs9l
         CNfQ==
X-Forwarded-Encrypted: i=1; AJvYcCULvkGK0CScQon5QmMDiqjd7NfdWiIrab5TtacGoydAsLPxZImDu1B/S05nGHv3Ylgtr8G7@lists.linux.dev
X-Gm-Message-State: AOJu0YwbBLG8iuAmwuTM2OO8gKjUatv6jIWrsSyybNrxpio3j4y0OQRP
	Jz18J+GLh18HAdyL+jLQSPVfpNDyUM/vKL5TfaSYDHbvbDXvEVmWRi4Q1aRl7mfWCG8w7pFN6YA
	2XXBs8Xk+BWon8Te2IBMzRzGAmqM=
X-Google-Smtp-Source: AGHT+IGw8eA4GFtgyE1g5jRpuRKwNZBgjoAHs4DBVwEvLjX64XRsY3nA8+nR4YbzJWguT2BgXKBEY8IJTXyZH4aameQ=
X-Received: by 2002:a05:690c:498c:b0:6d6:afe9:d818 with SMTP id
 00721157ae682-6db9535bab1mr55661257b3.6.1726067039593; Wed, 11 Sep 2024
 08:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87sev78dnz.fsf@all.your.base.are.belong.to.us>
 <ZuFteQ3t8K4h2-kJ@Andys-MacBook-Air.local> <87v7z2dzo6.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87v7z2dzo6.fsf@all.your.base.are.belong.to.us>
From: Tao Chiu <andybnac@gmail.com>
Date: Wed, 11 Sep 2024 23:03:48 +0800
Message-ID: <CAFTtA3PYsdSio0EqkUKQpyLiMuY9iynOdWQAkebAPjL6THEaMQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] riscv: ftrace: prepare ftrace for atomic code patching
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: alexghiti@rivosinc.com, andy.chiu@sifive.com, aou@eecs.berkeley.edu, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, mark.rutland@arm.com, mhiramat@kernel.org, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	palmer@dabbelt.com, palmer@rivosinc.com, paul.walmsley@sifive.com, 
	puranjay@kernel.org, rostedt@goodmis.org, zong.li@sifive.com, 
	yongxuan.wang@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=881=
1=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8810:37=E5=AF=AB=E9=81=93=EF=
=BC=9A

>
> Andy Chiu <andybnac@gmail.com> writes:
>
> > On Wed, Aug 14, 2024 at 02:57:52PM +0200, Bj=C3=B6rn T=C3=B6pel wrote:
> >> Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> writes:
> >>
> >> > Andy Chiu <andy.chiu@sifive.com> writes:
> >> >
> >> >> We use an AUIPC+JALR pair to jump into a ftrace trampoline. Since
> >> >> instruction fetch can break down to 4 byte at a time, it is impossi=
ble
> >> >> to update two instructions without a race. In order to mitigate it,=
 we
> >> >> initialize the patchable entry to AUIPC + NOP4. Then, the run-time =
code
> >> >> patching can change NOP4 to JALR to eable/disable ftrcae from a
> >> >                                       enable        ftrace
> >> >
> >> >> function. This limits the reach of each ftrace entry to +-2KB displ=
acing
> >> >> from ftrace_caller.
> >> >>
> >> >> Starting from the trampoline, we add a level of indirection for it =
to
> >> >> reach ftrace caller target. Now, it loads the target address from a
> >> >> memory location, then perform the jump. This enable the kernel to u=
pdate
> >> >> the target atomically.
> >> >
> >> > The +-2K limit is for direct calls, right?
> >> >
> >> > ...and this I would say breaks DIRECT_CALLS (which should be impleme=
nted
> >> > using call_ops later)?
> >>
> >> Thinking a bit more, and re-reading the series.
> >>
> >> This series is good work, and it's a big improvement for DYNAMIC_FTRAC=
E,
> >> but
> >>
> >> +int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
> >> +{
> >> +    unsigned long distance, orig_addr;
> >> +
> >> +    orig_addr =3D (unsigned long)&ftrace_caller;
> >> +    distance =3D addr > orig_addr ? addr - orig_addr : orig_addr - ad=
dr;
> >> +    if (distance > JALR_RANGE)
> >> +            return -EINVAL;
> >> +
> >> +    return __ftrace_modify_call(rec->ip, addr, false);
> >> +}
> >> +
> >>
> >> breaks WITH_DIRECT_CALLS. The direct trampoline will *never* be within
> >> the JALR_RANGE.
> >
> >
> > Yes, it is hardly possible that a direct trampoline will be within the
> > range.
> >
> > Recently I have been thinking some solutions to address the issue. One
> > solution is replaying AUIPC at function entries. The idea has two sides=
.
> > First, if we are returning back to the second instruction at trap retur=
n,
> > then do sepc -=3D 4 so it executes the up-to-date AUIPC. The other side=
 is
> > to fire synchronous IPI that does remote fence.i at right timings to
> > prevent concurrent executing on a mix of old and new instructions.
> >
> > Consider replacing instructions at a function's patchable entry with th=
e
> > following sequence:
> >
> > Initial state:
> > --------------
> > 0: AUIPC
> > 4: JALR
> >
> > Step1:
> > write(0, "J +8")
> > fence w,w
> > send sync local+remote fence.i
> > ------------------------
> > 0: J +8
> > 4: JALR
> >
> > Step2:
> > write(4, "JALR'")
> > fence w,w
> > send sync local+remote fence.i
> > ------------------------
> > 0: J +8
> > 4: JALR'
> >
> > Step3:
> > write(0, "AUIPC'")
> > fence w,w
> > send sync local+remote fence.i (to activate the call)
> > -----------------------
> > 0: AUIPC'
> > 4: JALR'
> >
> > The following execution sequences are acceptable:
> > - AUIPC, JALR
> > - J +8, (skipping {JALR | JALR'})
> > - AUIPC', JALR'
> >
> > And here are sequences that we want to prevent:
> > - AUIPC', JALR
> > - AUIPC, JALR'
> >
> > The local core should never execute the forbidden sequence.
> >
> > By listing all possible combinations of executing sequence on a remote
> > core, we can find that the dangerous seqence is impossible to happen:
> >
> > let f be the fence.i at step 1, 2, 3. And let numbers be the location o=
f
> > code being executed. Mathematically, here are all combinations at a sit=
e
> > happening on a remote core:
> >
> > fff04 -- updated seq
> > ff0f4 -- impossible, would be ff0f04, updated seq
> > ff04f -- impossible, would be ff08f, safe seq
> > f0ff4 -- impossible, would be f0ff04, updated seq
> > f0f4f -- impossible, would be f0f08f (safe), or f0f0f04 (updated)
> > f04ff -- impossible, would be f08ff, safe seq
> > 0fff4 -- impossible, would be 0fff04, updated seq
> > 0ff4f -- impossible, would be 0ff08f (safe), or 0ff0f04 (updated)
> > 0f4ff -- impossible, would be 0f08ff (safe), 0f0f08f (safe), 0f0f0f04 (=
updated)
> > 04fff -- old seq
> >
> > After the 1st 'fence.i', remote cores should observe (J +8, JALR) or (J=
 +8, JALR')
> > After the 2nd 'fence.i', remote cores should observe (J +8, JALR') or (=
AUIPC', JALR')
> > After the 3rd 'fence.i', remote cores should observe (AUIPC', JALR')
> >
> > Remote cores should never execute (AUIPC',JALR) or (AUIPC,JALR')
> >
> > To correctly implement the solution, the trap return code must match JA=
LR
> > and adjust sepc only for patchable function entries. This is undocument=
ly
> > possible because we use t0 as source and destination registers for JALR
> > at function entries. Compiler never generates JALR that uses the same
> > register pattern.
> >
> > Another solution is inspired by zcmt, and perhaps we can optimize it if
> > the hardware does support zcmt. First, we allocate a page and divide it
> > into two halves. The first half of the page are 255 x 8B destination
> > addresses. Then, starting from offset 2056, the second half of the page
> > is composed by a series of 2 x 4 Byte instructions:
> >
> > 0:    ftrace_tramp_1
> > 8:    ftrace_tramp_2
> > ...
> > 2040: ftrace_tramp_255
> > 2048: ftrace_tramp_256 (not used when configured with 255 tramps)
> > 2056:
> > ld    t1, -2048(t1)
> > jr    t1
> > ld    t1, -2048(t1)
> > jr    t1
> > ...
> > 4088:
> > ld    t1, -2048(t1)
> > jr    t1
> > 4096:
> >
> > It is possible to expand to 511 trampolines by adding a page
> > below, and making a load+jr sequence from +2040 offset.
> >
> > When the kernel boots, we direct AUIPCs at patchable entries to the pag=
e,
> > and disable the call by setting the second instruction to NOP4. Then, w=
e
> > can effectively enable/disable/modify a call by setting only the
> > instruction at JALR. It is possible to utilize most of the current patc=
h
> > set to achieve atomic patching. A missing part is to allocate and manag=
e
> > trampolines for ftrace users.
>
> (I will need to digest above in detail!)
>
> I don't think it's a good idea to try to handle direct calls w/o
> call_ops. What I was trying to say is "add the call_ops patch to your
> series, so that direct calls aren't broken". If direct calls depend on
> call_ops -- sure, no worries. But don't try to get direct calls W/O
> call_ops. That's a whole new bag of worms.
>
> Some more high-level thoughts: ...all this to workaround where we don't
> want the call_ops overhead? Is there really a use-case with a platform
> that doesn't handle the text overhead of call_ops?

Sorry for making any confusions. I have no strong personal preference
on what we should do. Just want to have a technical discussion on what
is possible if we want to optimize code size.

>
> Maybe I'm missing context here... but I'd say, let's follow what arm64
> did (but obviously w/o the BL direct call optimization, and always jump
> to a trampoline -- since that's not possible with RISC-V branch length),
> and just do the call_ops way.
>
> Then, as a second step, and if there are platforms that care, think
> about a variant w/o call_ops.
>
> Or what I wrote in the first section:
>
> 1. Keep this patch set
> 2. ...but add call_ops to it, and require call_ops for direct calls.
>
> Just my $.02.
>
>
> Bj=C3=B6rn
