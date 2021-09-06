Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83472
	for <llvm@lists.linux.dev>; Mon,  6 Sep 2021 18:11:55 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id h1so12538868ljl.9
        for <llvm@lists.linux.dev>; Mon, 06 Sep 2021 11:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4/XxjtcwY9C34CiufMPdWiPHxUpCQ41YPVeJpbHXsEo=;
        b=aXJR99ishZmS0NLJzcIl7b22JdllM6L1T9ntyP9veJPfscOLnpuTWz0n9AT48yIZiJ
         cVL0co87uk5nLMDWONfpkQhA7k4EPdq6AwMECAK1GkKY92gZiYCIT+KPe1uPLPTT7xaf
         jzNOTdupwh3hyL1FNCDe1F/OJ5xpmpgQ5eAzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4/XxjtcwY9C34CiufMPdWiPHxUpCQ41YPVeJpbHXsEo=;
        b=IE8Al1ZjZonjkKCM7bbhGVtAFhQRA+yf5/9sVpRYCEvlP9lwJ9fezwsUnlo4uQaCCL
         5Az4wpphSYmHxIm5Jb4niUA6Ep+RZ+DmlIOBcxRYD49O53wb5dOiQPI3xJXxiVb7HFjP
         d/1bpzBGbD/kXVYgjO2yBNaQ8W64ehMGFoPNQGMbnre6GMXENp4UZX92uzVGpw0MEoWO
         5Y6kZaZ6trHUtxgTrrGvy6qdn0M64BXGm7/OLlJp8fwsrrhaPTVPlFLgUskLe7ImGqSH
         1nLwVg4nm+zGlRmyb7IZRv4vpMjKt1pFH+rG8BAuuByHXbTgFpHH8WwRizITs/ZZlYWt
         rR5g==
X-Gm-Message-State: AOAM533pxyni02vLflfLSfIBxKVYRPcAyfhblXqzqHQjIp3q32Zb2Ca3
	xW7OuJwE3u7piEHTizGDsLrIeVpWQyOiXogCdP8=
X-Google-Smtp-Source: ABdhPJwdeDvdXlsnmVkw78xYWShJ178aCLjFG6YX882e2VMCdXDmIZ68W8dgr6R4EgRwjI61y/B6rg==
X-Received: by 2002:a2e:2283:: with SMTP id i125mr11783713lji.485.1630951913190;
        Mon, 06 Sep 2021 11:11:53 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id v13sm797111lfe.201.2021.09.06.11.11.51
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 11:11:51 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id y6so12560393lje.2
        for <llvm@lists.linux.dev>; Mon, 06 Sep 2021 11:11:51 -0700 (PDT)
X-Received: by 2002:a2e:8185:: with SMTP id e5mr11265751ljg.31.1630951911139;
 Mon, 06 Sep 2021 11:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com>
 <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org> <878s0c4vng.fsf@oldenburg.str.redhat.com>
 <20210904131911.GP1583@gate.crashing.org> <871r644bd2.fsf@oldenburg.str.redhat.com>
 <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
 <20210904191531.GS1583@gate.crashing.org> <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
 <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
 <20210906172701.GX1583@gate.crashing.org>
In-Reply-To: <20210906172701.GX1583@gate.crashing.org>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 6 Sep 2021 11:11:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
Message-ID: <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Florian Weimer <fweimer@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, llvm@lists.linux.dev, 
	linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 6, 2021 at 10:30 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> But this whole thread is about removing uses of <stdarg.h>, and
> eventually removing the
>   -nostdinc -isystem $(shell $(CC) -print-file-name=include)

Yes.

But your argument against it was based on that past argument of it
being compiler-specific, in ways that are not true any more.

Happily, it clearly is the case that compilers have standardized their
internal implementation of this in ways that means that we actually
_could_ do this for <stdarg.h>.

Exactly the way we do it for pretty much every other header file.

IOW, <stdarg.h> is no longer the special thing it used to be.

We use the compiler intrinsics without the C library header files for
everything else, so doing so for <stdarg.h> seems to actually be a
clarification and improvement.

             Linus
