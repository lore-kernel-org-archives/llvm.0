Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99817BA2D
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 04:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741062751; cv=none; b=F+jS47nAmRPyLk1WpjN+4RZy7LKBRRrIkj73HgFR+s76fpI2jN2iDF70h/YEa9AGWuO30gOZmuKSYIb71rxCck2ijElgvbQdKBABHG+xwMS5gFTgr0+gyg8GzCnML/dspIzujhcpX9kApwKsxSmGWwhySxbjmc7mP8b1tqkfV6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741062751; c=relaxed/simple;
	bh=1xJFonuYu10o6X9NtlnrSriC1TOMrUWLKN543slokQw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GphSY/Z5Std/bdKf6Al2ppebtEIiDWFq/3Y1f5DIgDikDqv7Mnn8cwxOKeJ/GHf5yYWaY4NmUe9Grah3rDQ47Juz4ap78yi0OixgfKBmlgZP5ioJpAsRflOoo0bVOke3oCdM4zP3WaGI8lCgIP1eBsKdkKc0xKLdgkefDLMyuFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggsbp7Oe; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggsbp7Oe"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390e3b3d3bcso6158599f8f.3
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 20:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741062748; x=1741667548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irNhgdfJAZhtZIhntqjHcQ6MwbCCGgIec7BJQxAznL4=;
        b=ggsbp7Oe9G7TGQi1CXWb5jHh7i4vcY0/ThNZlOTzCW++grN5flrP8QMCMtcAM1qBJ2
         Uh28LqKYmv0cgGkQOLCPu4efiLovBCYsJVzkGBSsbwxgNqKUzcR9DKvBwiqc+7LRSVJW
         pwP5914dJbUDToXXl0WHJ9tVRjlBEXn4LtEMCnXsl7tmo3vnbfXbEiVBw7Qw9Eb9QPFG
         dexD5OLPfY0u5k1YETK84l8cQ5UguTXCClr0jOLjUo8Loey66GIIQrh5ITghpn7kE8wR
         giNeLrUzBsPkhx9oXSoXgbNFbz7JMlPiylZVIlmAAXZbRj6ZchgLneGDdIDIxiQ1OBt+
         x5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741062748; x=1741667548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irNhgdfJAZhtZIhntqjHcQ6MwbCCGgIec7BJQxAznL4=;
        b=K83Gg9JF8Kg3ikfvIj//gtq3xDUR8gH+b/qMp83c3ymq3L/VZuV/RYaHd/FO1wALi3
         eisOtLJkZxdLEoIjNPv4QKp0SWL3vByCakBiyiQkzotdjm0lU1tIq0GBYstukiAnJQY9
         uJT0DyeGGpeYelTH2G94G16OvkSg7m8Nvj/eEutxB+RrELR1eeUIdcelnq0vrPMpEV2d
         ZCXpEIhUYW4bGu0w8KZr2312V1N9Ug9oXJwkJfIdS52EaN23SAxaTckwSRYxpLavFDw/
         T8aoTs3yU/dvm+XuAXY0pRi2tHuGW39/sS74sF1rqm5j3MVstYugRY6VFO5y9TfV1umW
         nkkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDhG6HGDcsC8Thk1MkHukn9oTr4sFNUHb1gmw5Gv5xrO28lHBls+FJRBuVeYbxtS6knxAI@lists.linux.dev
X-Gm-Message-State: AOJu0YxG+o5cSW65o4ZyrFfuXlB22VD+K28mdFE9lPHtibrXX1HspbHi
	VQiRLUBPuBxqRG2z5c4nZEtgODcuNYE2PtKt6pwfwUjn1pFpVZnA
X-Gm-Gg: ASbGnct05gCFuzhi74XgGe25kkzoCzYxpoUHnSuvd64JEZX+3/g45ylH7E05sFFMnph
	hB/czfGqoNiNnjRW2iaTSZg74gXYPD/n3E/EiKdhQddSvUu1puBT33qx9g9QaMI/DhZ4KSl2x9F
	47OUypsx2gJwmHj207pDmTpozZRV8SCIEeu8b6OD7crbtROJIVniCl2dpfj5jxzxU+I2yzF6s3R
	sggtlRENshcHEaL4G4IhrbnzNBHK0vF2xqR/VDns+xLUHG85HvdJgUv/RZEtyWzSYXc64e+I8+V
	8XTMZ6W54+tyE17N8pQG7UrSGen+ig0Bh3ygZRPS/Bj1wmhSjIrPxBxHKPrT1UYWuBmdBtWpWIa
	2Kask+pw=
X-Google-Smtp-Source: AGHT+IGYgxbLEpAh+2pH4UXqa/dCSPg0qpyzw7Hmn9iWGHFSbvWRkyjMgjyPpSCnU5pGwsJJ+eA2Ig==
X-Received: by 2002:a5d:64a6:0:b0:38e:d026:820 with SMTP id ffacd0b85a97d-390ec7cd2e8mr18827716f8f.16.1741062747542;
        Mon, 03 Mar 2025 20:32:27 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7d1dsm16558241f8f.56.2025.03.03.20.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 20:32:26 -0800 (PST)
Date: Tue, 4 Mar 2025 04:32:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Bill Wendling <morbo@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND
 64-BIT)" <x86@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt
 <justinstitt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>
Subject: Re: [PATCH v2] x86/crc32: use builtins to improve code generation
Message-ID: <20250304043223.68ed310f@pumpkin>
In-Reply-To: <CAGG=3QUnUQL2=YxN2ozwSba2A_x-S7sAEUP5oGhCWOzu4Q9SQA@mail.gmail.com>
References: <CAGG=3QVi27WRYVxmsk9+HLpJw9ZJrpfLjU8G4exuXm-vUA-KqQ@mail.gmail.com>
	<CAGG=3QVkd9Vb9a=pQ=KwhKzGJXaS+6Mk5K+JtBqamj15MzT9mQ@mail.gmail.com>
	<20250303201509.32f6f062@pumpkin>
	<CAGG=3QV1iDn2r39v5eroO+kCvpbmJNtSeqJS+fpwb4vBG67z=w@mail.gmail.com>
	<20250303224216.30431b1d@pumpkin>
	<7BC89461-A060-462A-9B42-7C0138AA0307@zytor.com>
	<CAGG=3QUnUQL2=YxN2ozwSba2A_x-S7sAEUP5oGhCWOzu4Q9SQA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Mar 2025 16:16:43 -0800
Bill Wendling <morbo@google.com> wrote:

> On Mon, Mar 3, 2025 at 3:58=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wro=
te:
> > On March 3, 2025 2:42:16 PM PST, David Laight <david.laight.linux@gmail=
.com> wrote: =20
> > >On Mon, 3 Mar 2025 12:27:21 -0800
> > >Bill Wendling <morbo@google.com> wrote:
> > > =20
> > >> On Mon, Mar 3, 2025 at 12:15=E2=80=AFPM David Laight
> > >> <david.laight.linux@gmail.com> wrote: =20
> > >> > On Thu, 27 Feb 2025 15:47:03 -0800
> > >> > Bill Wendling <morbo@google.com> wrote:
> > >> > =20
> > >> > > For both gcc and clang, crc32 builtins generate better code than=
 the
> > >> > > inline asm. GCC improves, removing unneeded "mov" instructions. =
Clang
> > >> > > does the same and unrolls the loops. GCC has no changes on i386,=
 but
> > >> > > Clang's code generation is vastly improved, due to Clang's "rm"
> > >> > > constraint issue.
> > >> > >
> > >> > > The number of cycles improved by ~0.1% for GCC and ~1% for Clang=
, which
> > >> > > is expected because of the "rm" issue. However, Clang's performa=
nce is
> > >> > > better than GCC's by ~1.5%, most likely due to loop unrolling. =
=20
> > >> >
> > >> > How much does it unroll?
> > >> > How much you need depends on the latency of the crc32 instruction.
> > >> > The copy of Agner's tables I have gives it a latency of 3 on
> > >> > pretty much everything.
> > >> > If you can only do one chained crc instruction every three clocks
> > >> > it is hard to see how unrolling the loop will help.
> > >> > Intel cpu (since sandy bridge) will run a two clock loop.
> > >> > With three clocks to play with it should be easy (even for a compi=
ler)
> > >> > to generate a loop with no extra clock stalls.
> > >> >
> > >> > Clearly if Clang decides to copy arguments to the stack an extra t=
ime
> > >> > that will kill things. But in this case you want the "m" constraint
> > >> > to directly read from the buffer (with a (reg,reg,8) addressing mo=
de).
> > >> > =20
> > >> Below is what Clang generates with the builtins. From what Eric said,
> > >> this code is only run for sizes <=3D 512 bytes? So maybe it's not su=
per
> > >> important to micro-optimize this. I apologize, but my ability to
> > >> measure clock loops for x86 code isn't great. (I'm sure I lack the
> > >> requisite benchmarks, etc.) =20
> > >
> > >Jeepers - that is trashing the I-cache.
> > >Not to mention all the conditional branches at the bottom.
> > >Consider the basic loop:
> > >1:     crc32q  (%rcx), %rbx
> > >       addq    $8, %rcx
> > >       cmp     %rcx, %rdx
> > >       jne     1b
> > >The crc32 has latency 3 so it must take at least 3 clocks.
> > >Even naively the addq can be issued in the same clock as the crc32
> > >and the cmp and jne in the following ones.
> > >Since the jne is predicted taken, the addq can be assumed to execute
> > >in the same clock as the jne.
> > >(The cmp+jne might also get merged into a single u-op)
> > >(I've done this with adc (for IP checksum), with two adc the loop takes
> > >two clocks even with the extra memory reads.)
> > >
> > >So that loop is likely to run limited by the three clock latency of cr=
c32.
> > >Even the memory reads will happen with all the crc32 just waiting for =
the
> > >previous crc32 to finish.
> > >You can take an instruction out of the loop:
> > >1:     crc32q  (%rcx,%rdx), %rbx
> > >       addq    $8, %rdx
> > >       jne     1b
> > >but that may not be necessary, and (IIRC) gcc doesn't like letting you
> > >generate it.
> > >
> > >For buffers that aren't multiples of 8 bytes 'remember' that the crc of
> > >a byte depends on how far it is from the end of the buffer, and that i=
nitial
> > >zero bytes have no effect.
> > >So (provided the buffer is 8+ bytes long) read the first 8 bytes, shift
> > >right by the number of bytes needed to make the rest of the buffer a m=
ultiple
> > >or 8 bytes (the same as reading from across the start of the buffer an=
d masking
> > >the low bytes) then treat exactly the same as a buffer that is a multi=
ple
> > >of 8 bytes long.
> > >Don't worry about misaligned reads, you lose less than one clock per c=
ache
> > >line (that is with adc doing a read every clock).
> > > =20
> For reference, GCC does much better with code gen, but only with the buil=
tin:
>=20
> .L39:
>         crc32q  (%rax), %rbx    # MEM[(long unsigned int *)p_40], tmp120
>         addq    $8, %rax        #, p
>         cmpq    %rcx, %rax      # _37, p
>         jne     .L39    #,

That looks reasonable, if Clang's 8 unrolled crc32q is faster per byte
then you either need to unroll once (no point doing any more) or use
the loop that does negative offsets from the end.

>         leaq    (%rsi,%rdi,8), %rsi     #, p

That is gcc being brain-dead again.
It pretty much refuses to use a loop-updated pointer (%rax above)
and recalculates it from the count.
At least it is a single instruction here and there are the extra
register don't cause a spill to stack.

> .L38:
>         andl    $7, %edx        #, len
>         je      .L41    #,
>         addq    %rsi, %rdx      # p, _11
>         movl    %ebx, %eax      # crc, <retval>
>         .p2align 4
> .L40:
>         crc32b  (%rsi), %eax    # MEM[(const u8 *)p_45], <retval>
>         addq    $1, %rsi        #, p
>         cmpq    %rsi, %rdx      # p, _11
>         jne     .L40    #,
>=20
> > >Actually measuring the performance is hard.
> > >You can use rdtsc because the clock speed will change when the cpu get=
s busy.
> > >There is a 'performance counter' that is actual clocks.
> > >While you can use the library functions to set it up, you need to just=
 read the
> > >register - the library overhead it too big.
> > >You also need the odd lfence.
> > >Having done that, and provided the buffer is in the L1 d-cache you can=
 measure
> > >the loop time in clocks and compare against the expected value.
> > >Once you've got 3 clocks per crc32 instruction it won't get any better,
> > >which is why the 'fast' code for big buffers does crc of 3+ buffers se=
ctions
> > >in parallel.
> > > =20
> Thanks for the info! It'll help a lot the next time I need to delve
> deeply into performance.
>=20
> I tried using rdtsc and another programmatic way of measuring timing.
> Also tried making the task have high priority, restricting to one CPU,
> etc. But the numbers weren't as consistent as I wanted them to be. The
> times I reported were the based on the fastest times / clocks /
> whatever from several runs for each build.

I'll find the code loop I use - machine isn't powered on at the moment.

>=20
> > >       David
> > > =20
> > >>
> > >> -bw
> > >>
> > >> .LBB1_9:                                # =3D>This Inner Loop Header=
: Depth=3D1
> > >>         movl    %ebx, %ebx
> > >>         crc32q  (%rcx), %rbx
> > >>         addq    $8, %rcx
> > >>         incq    %rdi
> > >>         cmpq    %rdi, %rsi
> > >>         jne     .LBB1_9
> > >> # %bb.10:
> > >>         subq    %rdi, %rax
> > >>         jmp     .LBB1_11
> > >> .LBB1_7:
> > >>         movq    %r14, %rcx
> > >> .LBB1_11:
> > >>         movq    %r15, %rsi
> > >>         andq    $-8, %rsi
> > >>         cmpq    $7, %rdx
> > >>         jb      .LBB1_14
> > >> # %bb.12:
> > >>         xorl    %edx, %edx
> > >> .LBB1_13:                               # =3D>This Inner Loop Header=
: Depth=3D1
> > >>         movl    %ebx, %ebx
> > >>         crc32q  (%rcx,%rdx,8), %rbx
> > >>         crc32q  8(%rcx,%rdx,8), %rbx
> > >>         crc32q  16(%rcx,%rdx,8), %rbx
> > >>         crc32q  24(%rcx,%rdx,8), %rbx
> > >>         crc32q  32(%rcx,%rdx,8), %rbx
> > >>         crc32q  40(%rcx,%rdx,8), %rbx
> > >>         crc32q  48(%rcx,%rdx,8), %rbx
> > >>         crc32q  56(%rcx,%rdx,8), %rbx
> > >>         addq    $8, %rdx
> > >>         cmpq    %rdx, %rax
> > >>         jne     .LBB1_13
> > >> .LBB1_14:
> > >>         addq    %rsi, %r14
> > >> .LBB1_15:
> > >>         andq    $7, %r15
> > >>         je      .LBB1_23
> > >> # %bb.16:
> > >>         crc32b  (%r14), %ebx
> > >>         cmpl    $1, %r15d
> > >>         je      .LBB1_23
> > >> # %bb.17:
> > >>         crc32b  1(%r14), %ebx
> > >>         cmpl    $2, %r15d
> > >>         je      .LBB1_23
> > >> # %bb.18:
> > >>         crc32b  2(%r14), %ebx
> > >>         cmpl    $3, %r15d
> > >>         je      .LBB1_23
> > >> # %bb.19:
> > >>         crc32b  3(%r14), %ebx
> > >>         cmpl    $4, %r15d
> > >>         je      .LBB1_23
> > >> # %bb.20:
> > >>         crc32b  4(%r14), %ebx
> > >>         cmpl    $5, %r15d
> > >>         je      .LBB1_23
> > >> # %bb.21:
> > >>         crc32b  5(%r14), %ebx
> > >>         cmpl    $6, %r15d
> > >>         je      .LBB1_23
> > >> # %bb.22:
> > >>         crc32b  6(%r14), %ebx
> > >> .LBB1_23:
> > >>         movl    %ebx, %eax
> > >> .LBB1_24: =20
> > >
> > > =20
> >
> > The tail is *weird*. Wouldn't it be better to do a 4-2-1 stepdown?

Well, provided the branches aren't mispredicted it'll be limited by
the crc32b - so three clocks per byte, max 27
The 4-2-1 stepdown needs the extra address update but that may not cost
and is then max 9 clocks. Also a lot less I-cache.
The code logic may not matter unless the buffer is short.
I think the cpu will be executing the tail instructions while many
of the crc32 from the main loop are still queued waiting results
from earlier instructions (especially if you get a loop that would
run in two clocks with (say) addq instead of crc32q.

> Definitely on the weird side! I considered hard-coding something like
> that, but thought it might be a bit convoluted, though certainly less
> convoluted than what we generate now. A simple loop is probably all
> that's needed, because it should only need to be done at most seven
> times.

The byte loop should be limited by the crc32b. So probably as fast
as that unrolled mess, although it will always have a mispredicted
branch (or two) - I suspect all loops do.

	David

