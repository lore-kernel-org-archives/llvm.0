Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF9B1FC4
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 17:15:23 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-63cf6b21035so12339316d6.1
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 10:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690218922; x=1690823722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZbFk+J10UfrSL79sLzSpmwWLT2vd0Fn58aGqpzLT8o=;
        b=1YX+L3Xe0aw2sI4aL9zKBZpgaUsr2Ctra2kvfpc4vm/95W5cBbAqlRMy/pafQG3Xzl
         qZ0M46rf5pk8owvuPj2Dw9lavv0H6EUwUEzlaBeHzUSiAalhQ7xHxuBfxhc7Uv3UvSbt
         lWlCz5UixM8IChuz9leknxceOxLi8L+DYFM3/ev+Myw11xmMaZAi086GwgmHK2qMCn4W
         +8q6jWsQ+anYbABIjhNkOGC7s/Lm3+ACQKF54VA8b0bprRpUUF9HoLSmy09pucbBLtkZ
         eU6bIGOfY4C3rzFQOsuNU58ZEFv5NiEXEjP08H+L+QKnYVkmIkxC36hkO8yX6msWa3yV
         gc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690218922; x=1690823722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZbFk+J10UfrSL79sLzSpmwWLT2vd0Fn58aGqpzLT8o=;
        b=Bqc1iPY0Fe7ThlIgQdznYRkVzWmt8n1w9Mgvze9IQKW9B2UzmR1EgNbi4M0mUrj8RU
         +CEfbIqL5EIkNL6VdF7E78UZyRA9xnvCLQIyRkiT7XSs5XMpbwrPxJDYh2eUmkR06GoW
         nwLL661kc1aoPAkLk7AoOeAcnD0Y46J+YrLoLDm8q7BWf4H851L6SanNsln3Z0CDrjZr
         bxOCmzdv8mwF64yrARh4xO7BDn/JUIMnsP3aCIiziCL29r+AbN258SJiG6epPKVbO3ts
         vXIuvP5Sjs17iHBd3OaNCB+fj+NXTm12OSLkilHPhexSy+sfJooOP2t515cG+xR1JGzi
         rrkQ==
X-Gm-Message-State: ABy/qLbUWb/WYDrl67muOFNimwIA4iezejVsLnwGD3cPXYBHf1goeLS8
	SJxshteUjJHSd6XC/3fDn7Xx/v7MvjJX+2hSc0v75A==
X-Google-Smtp-Source: APBJJlGuQHP0+90mVT4qcBd9dPz8oFWvD/tzPplwF+p3o6wvZcQTX7zpY+HRYiSDThs0KxIrd2j2Bgyzc1UAIzMCNek=
X-Received: by 2002:a0c:8dc9:0:b0:63c:f8af:5aa9 with SMTP id
 u9-20020a0c8dc9000000b0063cf8af5aa9mr384655qvb.26.1690218922055; Mon, 24 Jul
 2023 10:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307211945.TSPcyOhh-lkp@intel.com> <ZLsXAdjFuKLpd3ig@google.com>
In-Reply-To: <ZLsXAdjFuKLpd3ig@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Jul 2023 10:15:11 -0700
Message-ID: <CAKwvOdm3mg5kHTNYx6ROaY8G0wf6o_OXiPGwkYs9sU+5qqa=WQ@mail.gmail.com>
Subject: Re: arch/powerpc/kvm/e500mc.c:95:15: error: invalid instruction
To: Sean Christopherson <seanjc@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 4:38=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, Jul 21, 2023, kernel test robot wrote:
> > Hi Sean,
> >
> > FYI, the error/warning was bisected to this commit, please ignore it if=
 it's irrelevant.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   f7e3a1bafdea735050dfde00523cf505dc7fd309
> > commit: e83ca8cfa286c9fc78b585b0e66df7f542bcbcf2 KVM: PPC: booke: Mark =
three local functions "static"
> > date:   4 months ago
> > config: powerpc-randconfig-r001-20230721 (https://download.01.org/0day-=
ci/archive/20230721/202307211945.TSPcyOhh-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.gi=
t 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce: (https://download.01.org/0day-ci/archive/20230721/2023072119=
45.TSPcyOhh-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202307211945.TSPcyOhh-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> arch/powerpc/kvm/e500mc.c:95:15: error: invalid instruction
> >       95 |         asm volatile("tlbilxlpid");
>
> I assume this is a binutils bug?  I ran into a similar problem on PPC a w=
hile
> back where I couldn't cross-compile even relatively basic PPC code.
>

No, I think that LLVM is perhaps missing support for this instruction
Filed https://github.com/ClangBuiltLinux/linux/issues/1891 to track this.

--=20
Thanks,
~Nick Desaulniers
