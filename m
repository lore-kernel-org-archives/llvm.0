Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA70291151
	for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728069; cv=none; b=nkkQwqqAjx/VGeX9UjqbIlmHMxzAAmTUdnmNUtAmQIYFj8+KDa6thYTmHTMzP2x681zim/tGlibEsplMjhoOgJ16t6W16Uh76nyDp7omMxFCFQEmScBm9t8H7MI3MDn3bkTOMxCsfaseUb0Z+nALlMbdi7VoeM5r9Ma5aVaCyTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728069; c=relaxed/simple;
	bh=x5b9bXTROINdeXk1seqdB1Qn+LEuqRYwpMzuZk4ROMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lB1LCMwIoEgUB9JKWnGvi20GrkyhUEuIWgs24zhFt1LLBV5etXGPzWpEfYvl5Y3RZ8sk+oUZUZzQpKG4Ko7Sw3mgJWp0z3jzZ8YW+nu7Ugf4w0beNbv1dpqNF0tx3DxNdSFaoM7JUVZlJ9jILgdPiVbblQb6yH7lluhIFM+vfrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ueDKNX+h; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ueDKNX+h"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30828fc17adso3797086a91.1
        for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744728067; x=1745332867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5b9bXTROINdeXk1seqdB1Qn+LEuqRYwpMzuZk4ROMw=;
        b=ueDKNX+htTRJlYNVIqtx5OrbzkRCEIzXwM3pEL193wbalHXhRTaYsNC/Y+S52rd07B
         soU/0xeJIRrijxKEiVTPwXHi1nj5c6lh6Vvc79/6Qb1bK8FLqfTjxGJNDKiMTRsC5zKD
         Isn0+fSwitzavI1G48DBbgyGmrZ2Y4E1KSbjeE98M59ADmSKQP+a77jBe8USRtW82TWr
         UJYbYPkLE/u/RK5AYT/l/g4FYl3qq/nOd7btBNUU+OEGAPUuh/9wTIbQ21Fn1lHwgvsH
         3maF8nX869t1ouZsowdCd+vq3El3j27TFIKigt3Eo5wR758oV453TkFJ8ABf7s/qqcV5
         A87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744728067; x=1745332867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5b9bXTROINdeXk1seqdB1Qn+LEuqRYwpMzuZk4ROMw=;
        b=mbEU5P+XkowwapFNk5whcD9NngjKikf3zSgxUFn3sleldaoUJ7PIjcSv8B2geedWKQ
         N+Jx2mZT5YvBYscY2M3hJc04it85PcKFl/EmjZ2ylvSsPe9ero9AcHm+WpR8deeCoMW1
         5MX0lZeylx0gEHB3ipZpxhegZ/JS3opo3U7FupbesrvtgxS+d8nB3SjrNoY/RvBDrt1h
         GErvA/wMhDr4t8xz7T4Zg0FoMENtHx75sPSKF/29cTGHROItacJ/kRnqjWEiZOhEHPNb
         776KqY25CnXFhFWCpjMnOvq4Yy/SjOMuLISLbrZArKWqRaJMjvRJJXP9NOaNB+xHahUn
         UtYg==
X-Gm-Message-State: AOJu0YzXKQZjuB0IwGkVFpiKr2k4WfjMHzV6PFef+b+oMgmlthjanhg7
	Qfb7dd9mei2abQToifqAXtlolHHEdMRDZu7V9F5nYc+/oApQpz5l2hoh1dhzdyqc82W93KUMz0+
	jvpoE4O+dfUXUmqS4QYIxunK9qJUYwKFlye1a
X-Gm-Gg: ASbGncsshwugS2S+FjfmyFd7cnFeh9zcLNkLOljieSCIjplwI5vPJf3vXipF1WdmPCx
	IxmJV45YIyBkVMb6vvUP+gKU+8l/EosmOT5u+S4It+ham6WHRWQCtRQym+wFQdHgTmuZ5CpJn5r
	asOHn+MBBxVtaPIZR8R9XGt/Md/GkR2zDe7WQzAoH3cm5+MAFe8CaN
X-Google-Smtp-Source: AGHT+IEEuxZ9Ez7Pf5xxXYr095dz+gXGePFitbmr+YgBxVP/x8bp7n0djoupHSFJ7sU9w8VeRATFXDQaIim1FemxDEk=
X-Received: by 2002:a17:90b:51cc:b0:2ee:f440:53ed with SMTP id
 98e67ed59e1d1-30823680b7amr22912689a91.31.1744728066884; Tue, 15 Apr 2025
 07:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANp29Y4FmGDXm3LWvW6D+JR8CWf=fvuiAseFb1h2HQSDjFKO2A@mail.gmail.com>
 <20250414151611.GA3404099@ax162>
In-Reply-To: <20250414151611.GA3404099@ax162>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 15 Apr 2025 16:40:55 +0200
X-Gm-Features: ATxdqUHED0agX36CFPDCX7wOV3Y-ridV6j5zFeIUFybXnI-dGsik_IS1V6kGSKI
Message-ID: <CANp29Y4GGCkaW+YHAeGtvTA0XQh6c+5FaiXTvZcZtXH1D0G4WA@mail.gmail.com>
Subject: Re: Latest clang versions fail to compile CONFIG_X86_X32_ABI=y
To: Nathan Chancellor <nathan@kernel.org>, thomas.weissschuh@linutronix.de
Cc: llvm@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas and Nathan,

Thank you for your very quick replies!
I've tried to run "make LLVM=3D1" instead of passing CC=3D and LD=3D, and i=
t
worked well.

On Mon, Apr 14, 2025 at 5:16=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Mon, Apr 14, 2025 at 04:11:15PM +0200, Aleksandr Nogikh wrote:
> > Hi,
> >
> > I've been trying to build a Linux kernel using newer llvm toolchain
> > versions (18, 19, 20), but it consistently fails with the following
> > errors:
> >
> > ld.lld: error: arch/x86/entry/vdso/vgetrandom-x32.o:(.note.gnu.property=
+0x0):
> > data is too short
> > ld.lld: error: arch/x86/entry/vdso/vgetcpu-x32.o:(.note.gnu.property+0x=
0):
> > data is too short
> > ld.lld: error: arch/x86/entry/vdso/vclock_gettime-x32.o:(.note.gnu.prop=
erty+0x0):
> > data is too short
> >
> > The steps to reproduce:
> > $ git checkout v6.15-rc2
> > $ make defconfig
> > $ ./scripts/config -e X86_X32_ABI
> > $ make CC=3Dclang LD=3Dld.lld -j48
> >
> > The versions used:
> > $ clang --version
> > Debian clang version 20.1.2
> > (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97)
> > $ ld.lld --version
> > Debian LLD 20.1.2 (compatible with GNU linkers)
> >
> > Is this a known clang/Linux issue?
>
> I am not aware of this but it is likely because as Thomas pointed out,
> this invocation is only using clang/the integrated assembler and ld.lld,
> not the entire LLVM toolchain, which is generally what we encourage
> people to use unless there is a problem with doing so.
>
> > There's a kernel commit that addresses a similar problem:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Daaeed6ecc1253ce1463fa1aca0b70a4ccbc9fa75
> >
> > but the error is slightly different there and the added Kconfig
> > condition apparently did not kick in.
>
> What version of binutils is being used here ('objcopy --version')? I can
> try and look into this and see if the Kconfig checks should be expanded
> to include other tools/versions. I highly doubt anyone building with
> LLVM would notice lack of x32 support, as I believe only Debian and
> Gentoo have support for it and some x86 folks have tried to put it on
> the chopping block before.

$ objcopy --version
GNU objcopy (GNU Binutils for Debian) 2.40

I'd say that the lack of x32 support is not a big problem by itself;
it was more of a surprise to figure out that the compilation failed
for the combination of newer clang versions + the syzbot kernel
configs. It worked well with clang-15.

We'll switch to LLVM=3D1, so it will hopefully prevent such problems in
the future.

--=20
Best,
Aleksandr

>
> Cheers,
> Nathan
