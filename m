Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE0D2F36
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 19:03:42 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id i16so182908ioa.6
        for <llvm@lists.linux.dev>; Wed, 08 Jun 2022 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=uHvO6lASenJXAwmtol028iE9jl3QIf1MGNf5sYAD2mI=;
        b=mCzgaJ5RtUYhEB7TvHlxTBehiR1oOVyn5iAnL2NYhYfUTBEpRGyLQQIlfu/Pkjp41N
         d+ToihCuCXnhN/EOcOn4VXOJd0D2nUFMx8b2ynE7wq8VLYDAbts2Fqlsypxa0BjUGTJI
         OC2AzPMxMVPfXZVcC1kngUyf8XdkfJfMcx2BeyhsBP/8eVfjWejkDpY6R4G8wQjBo9C0
         u6pGK9zoPI39Shrk2R7FLhiQDdA59H3KPEPk1ubgMoO9ml86fC98s5w5UNeXe96sMU7X
         UA0kJzEDY0GdGSyTDxFv7l1QzrGPLcGEIgCeipt6Lnf/ExBnQ3zWOEWw1OJIuSicWkD7
         0mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=uHvO6lASenJXAwmtol028iE9jl3QIf1MGNf5sYAD2mI=;
        b=V/9THIwMuz7i/n0sApYDrhB8P42fo+aSSXyk5O2U57lauo045rg1LeBKE9PKEmHVnD
         RfqkTXsa8Zt0ehtK1tSEDKVqO2M40wMlJLygOoNuMltsm7yae+Wqb/FXy9I/VAKexUb3
         NGapjDpeWqDXusDINjYK8d5g4StcinVXzR44hrSj0k7SUKUeWfWq5rLcDPuIwHOaq/6W
         q3+/MCfAf70SDm+Y1+3+nwZVABX3ZZl1P5Xj6OtURDyA6A3FDv9PN7sznZmVxmGet7rx
         w8qu69niMY9mQ8qK2FJJf//k3dMMEOpHFH0+fVWCvNTI2yWdtTgEyqSaoWi0UrvIMOmv
         mklg==
X-Gm-Message-State: AOAM530Btl9e+Z8/euu/YW1q/ouF1Zw0SRifZ5yjjxgGbJcUzVGzH1f6
	Ao7w7Fw7HjE+NxPNwqfQBEU5axhO4OsYSkLdD20=
X-Google-Smtp-Source: ABdhPJyPfBPW81UGtdc6N58+KH5F9Ju0Yh1bhwA/dhd1CNQBi4oFOkgVajdsRbnFlopI7Jcb7mSItJulOzBqKQr6Sc0=
X-Received: by 2002:a05:6638:2188:b0:331:cf8b:af23 with SMTP id
 s8-20020a056638218800b00331cf8baf23mr5436095jaj.80.1654715021475; Wed, 08 Jun
 2022 12:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607164000.447941-1-masahiroy@kernel.org> <CAKwvOdk5ZrcSmQSPrFzreZ-z_Hpi4Lc-D-Y4NDuHPiUWpXdwzA@mail.gmail.com>
In-Reply-To: <CAKwvOdk5ZrcSmQSPrFzreZ-z_Hpi4Lc-D-Y4NDuHPiUWpXdwzA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 8 Jun 2022 21:03:05 +0200
Message-ID: <CA+icZUUZ0_92vDofYkgG3QzyuhC3wABwdT16ZPbH=92_0pGoRQ@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/check-local-export: avoid 'wait $!' for
 process substitution
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Michael Ellerman <mpe@ellerman.id.au>, 
	Wang Yugui <wangyugui@e16-tech.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 8:42 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Tue, Jun 7, 2022 at 9:41 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Bash>=4.4 supports 'wait $!' to check the exit status of a process
> > substitution, but some people using older bash versions reported an
> > error like this:
> >
> > Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> > Reported-by: Wang Yugui <wangyugui@e16-tech.com>
> > Tested-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Tested-by: Jon Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Acked-by: Nick Desaulniers <ndesaulniers@google.com>
>

Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM-14 (x86-64)

-Sedat-

> Some comments below.
>
> > diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> > index 34415ae1af1b..19c286c23786 100644
> > --- a/Documentation/process/changes.rst
> > +++ b/Documentation/process/changes.rst
> > @@ -32,6 +32,7 @@ you probably needn't concern yourself with pcmciautils.
> >  GNU C                  5.1              gcc --version
> >  Clang/LLVM (optional)  11.0.0           clang --version
> >  GNU make               3.81             make --version
> > +bash                   4.2              bash --version
>
> /usr/bin/env bash
> and definitely /bin/bash
> both show up a lot in kernel sources. At this point, I think bash is a
> requirement at this point, so it's good to document it finally.
>
> > +# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
> > +# 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
> > +# '2>/dev/null'. However, it suppresses real error messages as well. Add a
> > +# hand-crafted error message here.
> > +#
> > +# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
> > +# binutils to 2.37, llvm to 13.0.0.
>
> Might be nice to include `TODO:` in the comment block. Vim will
> highlight these in comments.
>
> --
> Thanks,
> ~Nick Desaulniers
