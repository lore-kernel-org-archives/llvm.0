Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037B44B7A22
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 08:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719666; cv=none; b=aPl0x+PIv39JE4tYB1rh8DYitExNoZSpX83yrRuCoQG9fN4C5v4rsluSHWcPanJzMc0yTEkMt375l8E+9lEd2m8ms05nxxLGHDBwRJGiiSXEXL4Y//rX4D3mWpMe4C7y9/RrgzgtUj7+98pO6OmSqUgBNM9WiSkOhZqHtK6Lt/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719666; c=relaxed/simple;
	bh=HeLnCknZ+TSZgDhQmxawImQU5Dg4oiPLJvxMHfUxsA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVWdUpHN7Ze4FRNqEx4YEdn0KriaQZa3tSAngd8omrD3t0O044YMBBeroItug8j8xULbE+w6IdrCy5w995fYgatPTSja+s9av0zNFIct+71/ZzOrY7cD2/rHCzbfr8mh2GwAZNkisdINcMyeRaEGppGwqh6puZF44jvAH3U5mFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=Zq4bepT9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Zq4bepT9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856CB1F0089A
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 08:21:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Zq4bepT9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1789719659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NvJo/K0ciOcyrgQ0/1OJD95RUnfQjfhLNofRIhjBDuY=;
	b=Zq4bepT9gaY0GJoRB8kuOjTeegM9Ou7zkwuyAYzmaDY2B2HT8EcwuM6I5RZ3w/dHqnEaEl
	p2Jl4xNkr9MWCUPa8uzJrMkCiQmKrxh83tuOT4wEIdmr+fV9G5NjVbBifYR4VfeRPrHp9O
	cWU24kjGpobeofxa4TqU+c2hCP4yCqg=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 8383156b (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <llvm@lists.linux.dev>;
	Fri, 18 Sep 2026 08:20:59 +0000 (UTC)
Received: by mail-ej2-f37.google.com with SMTP id a640c23a62f3a-c294af0caa8so62735666b.1
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 01:20:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzplcHKn9FR3mm4jlE+4vg+dSYCKBIsE/ChxsbkxZoJ9l8hQmo12dzwzioWELMFDmnwdKAF@lists.linux.dev
X-Gm-Message-State: AFuF++lzUgwe+14PRNsbdV+5fUTievkYsposxSm/MiyVPF+ib3aFDbxR
	ZttL+6EjyxPYG2CZRtH9OKeTk7ol8TlZqUb6ovFUMI01boQP70TIGSWMitpMXntP2IgAcI+TMNr
	J01lb/4DqxIewF3hVElhS9BQ/OS784fM=
X-Received: by 2002:a17:906:f597:b0:c15:f26a:3438 with SMTP id
 a640c23a62f3a-c2a157fc0demr163720366b.24.1789719657303; Fri, 18 Sep 2026
 01:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
 <aquyVkdYceiWdckX@zx2c4.com> <20260917173920.GB356152@ax162> <CAKwvOdkHsw132XEY2zLxO-V4=_RyqBatavQDvLY-MpZ16ZSAdQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkHsw132XEY2zLxO-V4=_RyqBatavQDvLY-MpZ16ZSAdQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 18 Sep 2026 10:20:45 +0200
X-Gmail-Original-Message-ID: <CAHmME9pcvUdkvYmeUs+Wi+v5Cy5QG=Wo48FmRCdQdL8x1ykDKA@mail.gmail.com>
X-Gm-Features: AcwNN1Wn_7bGtOQBOx5F9oYJ3x4qxu2evo0ekIW7v2J3QmTXphAtN1QLJtF-uGY
Message-ID: <CAHmME9pcvUdkvYmeUs+Wi+v5Cy5QG=Wo48FmRCdQdL8x1ykDKA@mail.gmail.com>
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 6:49=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Sep 17, 2026 at 10:39=E2=80=AFAM Nathan Chancellor <nathan@kernel=
.org> wrote:
> >
> > On Thu, Sep 17, 2026 at 11:26:46AM +0200, Jason A. Donenfeld wrote:
> > > I don't suspect this is the right change. On x86_64, this changes to
> > > code from:
> > >
> > >     rep stosq
> > >
> > > into:
> > >
> > >     loc_2D9:
> > >     mov     dword ptr [rbx+rax*4+0Ch], 0
> > >     add     rax, 1
> > >     cmp     rax, 0Ch
> > >     jbe     short loc_2D9
>
> /me nods
>
> > >
> > > Which is a lot less compact. It seems like the actual solution is for
> > > gcc&clang to emit this inline memset mnemonic when the platform has a
> > > good one, and otherwise not. But disabling optimizations for all
> > > platforms, because it's broken on one, seems bad.
>
> Ideally, yeah.
> Pragmatically:
> the compiler doesn't know what you will link against or not; so it
> just emits relocations that the linker will (hopefully) resolve.  I've
> definitely looked at how llvm decides when to emit libcalls to
> compiler-rt/libgcc ("the compiler runtime") and thought "I wonder how
> this works with compiler runtime version N-1?"
>
> There's also the requirement gcc and clang have about memcpy, memmove,
> memset, memcmp always being available (-ffreestanding or not) noted
> below.
>
> > > In this case, the compiler is being smart: it identifies a loop and
> > > rightly turns it into memset. But if this isn't a compilation
> > > environment that has an outline function, it should do something else=
.
> >
> > As I mentioned in the commit message, compilers require all environment=
s
> > (hosted or not) to provide memset(), so the "doing something else" is
> > nothing :)
> >
> >   GCC requires the freestanding environment provide memcpy, memmove,
> >   memset and memcmp.
>
> +1
>
> >
> > I guess another option is to just include a basic memset() like the one
> > in lib/string.c so that it is only used if the compiler makes this sort
> > of transformation, while leaving all other architectures alone.
>
> It's also possible to get GCC to emit the libcall, even in the
> presence of -ffreestanding: https://godbolt.org/z/6hTrYq9z8
>
> And it's not the first time this code in particular has had this issue;
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Db7bad082e113640fc81200ff869e5c2d7a9c29a2
>
> (is this patch a Fixes: for that?)
>
> Clang has __builtin_memset_inline to avoid explicit libcalls; AFAICT
> GCC does not.  So we could use that here to provide such a guarantee
> with clang; the code would remain brittle and likely break again with
> GCC.

It sounds like this is broken currently only on clang on riscv, right?
So maybe we can use __builtin_memset_inline, and get something similar
into gcc, before a future gcc version also breaks? That way it doesn't
break in the future.
