Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3514C7A
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 19:32:39 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-31df2545d87so33623187b3.10
        for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 12:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ggjf+K0H7ybq/l0qljBb0+Tk7T+H1l+cTTvYCl+Hvf8=;
        b=ZjK/dLnG+bWAkhan7zhJo6JgAkt3LZvm33w7VI6P4fPEUmRnVdnDf0XejDiJsb1ho/
         hxnP6LqcgEw2aKHI4oyKoIIQ8eSdCyXITBs/jeN49evLTFcd5hM2gWl1GdemR6eme2ub
         ypAJLRWjWmjmESp7Cl9Oq4Q3sx7WW3DRAvK1wNmERNlwl4dHxeKbZOF81waDbCYBkSD0
         HQwzXLa4qNQ/ax8UTy17nDwNElSx6qnAYk7MAGYl6C28p1WZpk7qg6MGv7LCNP0QR6wA
         NwjXFSCd+YCUsfs8BwhCkbzeUWJ0D7+6lqv4yeuCufcvgWihgR3nGlBgb3TESIzvn67X
         sb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ggjf+K0H7ybq/l0qljBb0+Tk7T+H1l+cTTvYCl+Hvf8=;
        b=Lk2uFyq7PXTlsGi36fvTnWflf8/uEueMVkzvY7267a9rhlf+s63Sw5L7PMn4QXLj1b
         3Xnacr968N70DT7NzQj27FDZ7Ebqoq8mRgC/Zkn2kiZ4zIu3OqAZK9rmhQz5NgL/Kfuy
         XNa+Wwims3BFilVz2QIS80c6tl4b5svtQt0JO8oBc4EOK47t7jW0vyYM8Jk1+sH7aU2m
         bvt0UUVrjPj9kKaEYXo5rAU314EVZo5VkhOi7rH/DWHMwj0FsClCLpaaT3exUutBSZ0A
         vAMl4NUAISmEmCduNr05wy2LZGC20XNp4MTvwjHKt51FH0Oxvy0u2EfWkgQi4lFV75Er
         rAZQ==
X-Gm-Message-State: AJIora/J7iOxzThnGUiG37hmKx7t0FEf1UUC6Xa4aYrZ18NZGWAR4sRB
	KnIPGXOEemjIMKGhdSFEeiIzaPx0M2/t0PjVkr4=
X-Google-Smtp-Source: AGRyM1suTWaJWErLNACO630audVepqfSA/fId8GmMVKNmH2O0Sha+YJ4BK4v0cYDEwXaE58fOh8/OVtLFEr0PYOgn4Y=
X-Received: by 2002:a81:6783:0:b0:31c:8668:ed85 with SMTP id
 b125-20020a816783000000b0031c8668ed85mr17641742ywc.194.1657913553313; Fri, 15
 Jul 2022 12:32:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714185514.7d1a2ac9@canb.auug.org.au> <Ys/42uMzQy+CFTGI@debian>
 <YtA+127QgRifnRBZ@dev-arch.thelio-3990X> <CADVatmOTNA8uVqDEx6kp=+_O=wEhV2jbS9-frct-c4ZqBxcspg@mail.gmail.com>
 <CAKwvOdmS2SugAzRSmQzWAmRgz642KEgTtOw5O3TvZwFSHU-fPQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmS2SugAzRSmQzWAmRgz642KEgTtOw5O3TvZwFSHU-fPQ@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Fri, 15 Jul 2022 20:31:57 +0100
Message-ID: <CADVatmM7cRoaVR6cA=CBS4VreDjDHRZTLLcWCPHk5a+ArmBjLA@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 14
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Nick,

On Thu, Jul 14, 2022 at 7:52 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> (Moving Stephen, linux-next, and lkml to bcc)
>
> On Thu, Jul 14, 2022 at 9:22 AM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > Hi Nathan,
> >
> > On Thu, Jul 14, 2022 at 5:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > Hi Sudip,
> > >
> > >
> > > In the future, consider CC'ing our mailing list (llvm@lists.linux.dev)
> > > for any clang related issues so that we can get them taken care of ASAP,
> > > we have a MAINTAINERS entry for a reason :) thank you for testing with
> > > clang; the more people that use it, hopefully the easier it will be to
> > > get things unbroken.
> >
> > Sure. I run arm, arm64, powerpc and x86_64 allmodconfigs with clang
> > (along with gcc) every night for mainline, started with linux-next
> > from today. Trying to setup the mips build also, I will mail llvm list
> > asking for help with the mips build.
> > Currently I only monitor the clang output from x86_64 as thats the one
> > which builds. If you want I can send the other reports also.
>
> Hi Sudip!
> Right on, nice to hear from you.  Consider filing bugs in our issue tracker
> https://github.com/ClangBuiltLinux/linux/issues (consider taking a
> peak to see which are already known issues and commenting on those
> rather than filing new ones, time permitting), and joining our meeting
> (next one in two weeks) see https://clangbuiltlinux.github.io/ for
> calendar invite and meeting link.

Thanks for the calendar link. I will definitely try to join the next one,

>
> > I have added Lukas if you both think
> > it will be good to collaborate.
>
> Ah, yeah, Lukas is an old friend. Hi Lukas!

Small world.


-- 
Regards
Sudip
