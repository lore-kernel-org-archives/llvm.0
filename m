Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19037A
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 08:08:59 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 22M88c9J013495
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 17:08:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 22M88c9J013495
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1647936519;
	bh=EI+hlrVn+LE4qzsUPEbMCxX9jVyiWn1MGHB7wLYIoFI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=neZ3ohv1K9ZhyWBK1fxFKy6diS5ndnW5IzHkvAwUCgJ6qiP6gmrMPg+oZhW3dLk1C
	 J/qoQrd3b4QwRE79gBdtrRr4D6ufynEIMQiyPNvDpYQPEUoFakpxUyIytmD04WgK/I
	 5ZfS9cHbZeJ0jflzFxr31ZuWf09qKo6wmF/Gb0w79l3OtkswK6QVZYyOHFpg81B/mA
	 UgqCJ7YUsh/46YMjLNpjgC/niyIUmZOQhoPO6tdMgg4SzAweLFZhCCfQjQ+RsgW1r5
	 wwjuMenBQrtl6PscHb8XkjR5xpHfpIFgFXrk+DkZpWF6gV8P5HG19PHmOpnDvB05XI
	 QeQi1I9KVzPjA==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id p5so11427534pfo.5
        for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 01:08:38 -0700 (PDT)
X-Gm-Message-State: AOAM533IGFT6uEETmMhvUXnRVNZuNJUR+W5E4F+iOhXgMUDe/HVlTdki
	1ExxWa5MQECpLbyg6/t0uKaXVryzWTfgiqLhs/s=
X-Google-Smtp-Source: ABdhPJwhTLFGwfJDoT569BIcUH2vIsmqs0aBripoaSbi4GiW/rhR73Mh3hX8ZTelV66PmEcdj+guBjgcHrWUCNKxhzg=
X-Received: by 2002:a63:ec47:0:b0:382:692a:dc04 with SMTP id
 r7-20020a63ec47000000b00382692adc04mr9332997pgj.352.1647936518120; Tue, 22
 Mar 2022 01:08:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203141621.9GAoyWx1-lkp@intel.com> <CAK8P3a0FwEPBBSar1t0BDgOBCZr6sxBDdOAMAFC4Cn0Gam2dxQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0FwEPBBSar1t0BDgOBCZr6sxBDdOAMAFC4Cn0Gam2dxQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 22 Mar 2022 17:07:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNATsFvD6sLr57nE0+ZK_B_vfvQE_C7DaWy5ubgdLarX72g@mail.gmail.com>
Message-ID: <CAK7LNATsFvD6sLr57nE0+ZK_B_vfvQE_C7DaWy5ubgdLarX72g@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:for-next 3/5] arch/arm/mm/copypage-v4mc.c:70:3:
 error: implicit declaration of function '__flush_dcache_page' is invalid in C99
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 14, 2022 at 6:19 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Mar 14, 2022 at 9:06 AM kernel test robot <lkp@intel.com> wrote:
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> arch/arm/mm/copypage-v4mc.c:70:3: error: implicit declaration of function '__flush_dcache_page' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
> >                    __flush_dcache_page(page_mapping_file(from), from);
> >                    ^
> >    arch/arm/mm/copypage-v4mc.c:70:3: note: did you mean 'flush_dcache_page'?
> >    arch/arm/include/asm/cacheflush.h:292:13: note: 'flush_dcache_page' declared here
> >    extern void flush_dcache_page(struct page *);
> >                ^
> > >> arch/arm/mm/copypage-v4mc.c:74:2: error: implicit declaration of function 'set_top_pte' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>
> I checked this, and found that the configuration was already broken,
> what changed is just the
> exact error message that gcc produces, so lkp flags it as a regression.


Agree.

Clang shows a slightly different error message with -std=gnu89/11.



Old error message     (with -std=gnu89):
  implicit declaration of function '__flush_dcache_page'
[-Werror,-Wimplicit-function-declaration]

New error message   (with -std=gnu11)
  implicit declaration of function '__flush_dcache_page' is invalid in
C99 [-Werror,-Wimplicit-function-declaration]



This was already broken before.









> This is a NOMMU StrongARM1100 config, which has been broken for a long time,
> and already have a patch to disallow that configuration because we ran
> into another
> issue with NOMMU classic processors last week.
>
>          Arnd





-- 
Best Regards
Masahiro Yamada
