Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912A146BB
	for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 21:41:12 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so8237751pjh.3
        for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 14:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=E7fyttjWXDvI+Nh4igxE5vTXF/dm3A6WscqBjfXxDFc=;
        b=YtQ5GFLymPsHxq9c5yK0qNnU7qPdI2crr9VRqh8rJZggYlU5LusqpdCK4y162UvGGQ
         RsnuHhfmS43W7s9YtaMJDMobXZS4Pr37nZYEUzkQhqbXq6qzZmLkg6YwnusBhvc79Kfw
         x7R4iRAjacE5C+n5PBc976/KStqQnyt8NUWhFvWQPXWR7kyn7duY7phUmNidZDxTolhZ
         1OMj39KucjSsyDfQ931fIDfgtP55Xl4D04OkilCttCQH3/hCblEJQXoAcDBEQnXUFR/K
         2XwS9r+I0pGCQnHHnrDqNiDqOGapgON+L3Js71KnP4NwVYqoLwfEg6zNO1YL0bkTWUDp
         IvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=E7fyttjWXDvI+Nh4igxE5vTXF/dm3A6WscqBjfXxDFc=;
        b=2Dwiu2BDdKJHM4MUJGutHTxg3wIbo0LNtGWoX2Ix/3z7gcj9jGkFKiBnc/xNdDp7zu
         vINLrHkgqWPoE8TfK9RM6Bjgt9IalFU0MVo2aMpUKgIIN/I/xAdfVWezGId+FkIXSDfU
         tHLI7t0Ke3yKSwwekeIRHsv3UYbhuZsP7RNFZNKDzXlyuKn6f47JFI/plpZxl9alzVSr
         6kN/jT4DTZGIbZHIxEqcGiZootQwFhCr6KKuD8KsKpl9xL6r9petnPYzBzagxeDQO7sD
         BLjp6/91z8Pq/GICOaunoNHKH9oYB+2Z/wxqlV+CVUs0JNUCfbxjYQtN2lLASTrzBkYP
         HGUg==
X-Gm-Message-State: ACrzQf1qHZfKSEy2pIKhJ3W6hpBH3vSlf2UUR0M23vEPwvIBVYMTDFXc
	qIbam47SoZGG7bCcwikunPfrcicWDZmZPpZiKiKCNQ==
X-Google-Smtp-Source: AMsMyM7ZvXJD30YyLq1Wy98Uom1ldZglXbcguk66Px/nAVmlE+H5+m08kvO0PEoKHhwCz0L90AMue/SgQcoxgSUZJAc=
X-Received: by 2002:a17:90b:33c9:b0:200:a0ca:e6c8 with SMTP id
 lk9-20020a17090b33c900b00200a0cae6c8mr804570pjb.147.1664228471880; Mon, 26
 Sep 2022 14:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
 <20220919170828.3718437-1-ndesaulniers@google.com> <CAK7LNARk74U8AWzOVHP1pPVy2PNSMsNiyPL8bmFcYs6DkheorA@mail.gmail.com>
 <CAK7LNAQRV_Z+0V9gB0=KWKpQE=sH-Y4QVhgSjxc==412U=_LBw@mail.gmail.com> <CAK7LNATqGJCKRmL=vhH1_Ms--7QYTT8YTFxExejDs0_bQD4Ptg@mail.gmail.com>
In-Reply-To: <CAK7LNATqGJCKRmL=vhH1_Ms--7QYTT8YTFxExejDs0_bQD4Ptg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 26 Sep 2022 14:41:00 -0700
Message-ID: <CAKwvOdmoHCwazcTpF=jDc_ghu09OCSkrSZ-ZP4rHNtO54n-aRw@mail.gmail.com>
Subject: Re: [PATCH v4] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 24, 2022 at 6:23 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > I noticed a small flaw now.
> >
> >
> >
> > $ make mrproper; make
> > /bin/sh: 1: [: -ge: unexpected operator
> > ***
> > *** Configuration file ".config" not found!
> > ***
> > *** Please run some configurator (e.g. "make oldconfig" or
> > *** "make menuconfig" or "make xconfig").
> > ***
> > Makefile:711: include/config/auto.conf.cmd: No such file or directory
> > make: *** [Makefile:720: .config] Error 1
> >
> >
> >
> >
> >
> >
> >
> >
> > This fails anyway, but it shows annoying
> >
> >    /bin/sh: 1: [: -ge: unexpected operator
> >
> >
> >
> > It is emit by this line:
> >
> >   KBUILD_CFLAGS-$(call gcc-min-version, 90100) += -Wno-alloc-size-larger-than
> >
> >
> >
> >
> > When $(CONFIG_GCC_VERSION) is empty, it becomes invalid shell code:
> >
> >      [ -ge $(1) ] && echo y
> >
> >
> >
> >
> >
> > Now I just recalled why I wrote the original code like this:
> >
> >
> >   cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ]  ...
> >
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
>
>
>
>
>
>
>
> I squashed the following code diff.
> Please let me know if there is a problem.

LGTM; thanks (again).

>
>
>
>
>
>
>
>
>
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 9d18fb91890e..20d353dcabfb 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -63,11 +63,11 @@ cc-disable-warning = $(call try-run,\
>
>  # gcc-min-version
>  # Usage: cflags-$(call gcc-min-version, 70100) += -foo
> -gcc-min-version = $(shell [ $(CONFIG_GCC_VERSION) -ge $(1) ] && echo y)
> +gcc-min-version = $(shell [ $(CONFIG_GCC_VERSION)0 -ge $(1)0 ] && echo y)
>
>  # clang-min-version
>  # Usage: cflags-$(call clang-min-version, 110000) += -foo
> -clang-min-version = $(shell [ $(CONFIG_CLANG_VERSION) -ge $(1) ] && echo y)
> +clang-min-version = $(shell [ $(CONFIG_CLANG_VERSION)0 -ge $(1)0 ] && echo y)
>
>  # ld-option
>  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
>
>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada
>


-- 
Thanks,
~Nick Desaulniers
