Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73611BB41
	for <llvm@lists.linux.dev>; Wed,  9 Aug 2023 16:02:36 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-586a684e85aso258447b3.2
        for <llvm@lists.linux.dev>; Wed, 09 Aug 2023 09:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691596955; x=1692201755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tKqb+VoRgkyWgmeNFWtovmLOzkdpjBGuYz84vUiz14=;
        b=cl7uddFcOnIu7w5QvmJMhCP2TPFmiphgljl8sVLW/3ITHXYcm/LktBT9ux/A//kZiu
         un4f8rp9dwj3cuQtYLJIUHG1syEnmGSDYzfMPJCfF/OSy4fxtKDjL9GKdTfSXWmsEOvN
         GTFgF0K5M1ohSMMb1wW4YwKbZiorHYgGeaDkZaaOvcz06Ac1VK1ybzJIr6y6Mt/IO/tR
         bnSUSuVmI0ykkbKhIQ9T5j33CSb4aoNHCJhGP2tYn0BRjabqvsxkgbsyNh4nE6QUeoTA
         Y9rddU2ramsLU6puvtuuxbYo7WPSeI2clkh7j591ikQCVFJEgiAbl4T3+V+eTNW3MIJo
         MidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691596955; x=1692201755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tKqb+VoRgkyWgmeNFWtovmLOzkdpjBGuYz84vUiz14=;
        b=Orkn+aSd0fpGpSWUprSwPrC4+oOpncmm/E85qXgMzqEOhCO9qdwPlBPhfj3R0bXrzB
         hbXlf1V+u8VuqRF/8H7+ZUdK7vutZnejqt5MBRGMF8sESsGRys4c7GeaARNp85l7lVbn
         IcsG92ZIXJ++9MvRcXyUPozAHjOuTHFaO8N/RI5q34tYxZ1DDTXKLM51blOhee47VY7i
         RrSoMukn6Fj8z1frZy1mafzVv3PsjDjQPKHmSon+cQTC3CZ8i6TRMz+A5tuVxStmayk0
         jKSKCqJQLVk3WyCtb0IdW5RqYr3UxoZliyPE9N0JGKVoqkYz1dk5aoYviI7sTTB6Wpig
         9W9Q==
X-Gm-Message-State: AOJu0Yz6Zj9AvHeQnSJ9VIAayi7VH1QVYsDnmpY//f6r9ygq7yFlq013
	kLwNm7cMav5+s+DA18dlENiTHnV2IvGti/UjCeLwAg==
X-Google-Smtp-Source: AGHT+IEJHCBuYvPAfDXNsCccpldXJM7/ZZSeEoKWg7p0fPwNbnjMZI1B07adbpNP2nm2kJgA6JxwZjQDo9BOL/0iL1s=
X-Received: by 2002:a0d:fc84:0:b0:579:f8f2:b5b5 with SMTP id
 m126-20020a0dfc84000000b00579f8f2b5b5mr3512624ywf.41.1691596955218; Wed, 09
 Aug 2023 09:02:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308091820.0dPY7D6f-lkp@intel.com> <ZNN1WdZ5J/e5OPAt@elver.google.com>
 <CAKwvOd=hgqas-kMxvOgviff43XBmwgERrfGi-ZO45DOcEuG_yw@mail.gmail.com> <CANpmjNNjzeKyB7V7r73qW9zzqYeMEEK27pfFV9aBm6yfLjJeng@mail.gmail.com>
In-Reply-To: <CANpmjNNjzeKyB7V7r73qW9zzqYeMEEK27pfFV9aBm6yfLjJeng@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 9 Aug 2023 09:02:24 -0700
Message-ID: <CAKwvOd=0WV0aTMhLya3gxdm+i761iXyhUMgDRa96riEDh2NyFQ@mail.gmail.com>
Subject: Re: [linux-next:master 8173/8441] include/linux/list.h:53:13:
 warning: '__preserve_most__' calling convention is not supported for this target
To: Marco Elver <elver@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 9:01=E2=80=AFAM Marco Elver <elver@google.com> wrote=
:
>
> On Wed, 9 Aug 2023 at 17:53, Nick Desaulniers <ndesaulniers@google.com> w=
rote:
> >
> > On Wed, Aug 9, 2023 at 4:15=E2=80=AFAM Marco Elver <elver@google.com> w=
rote:
> > >
> > > On Wed, Aug 09, 2023 at 06:27PM +0800, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git master
> > > > head:   21ef7b1e17d039053edaeaf41142423810572741
> > > > commit: fee8feb67f0b2954eb7a2a259122e43a15cf3a52 [8173/8441] list_d=
ebug: introduce CONFIG_DEBUG_LIST_MINIMAL
> > > > config: hexagon-randconfig-r041-20230808 (https://download.01.org/0=
day-ci/archive/20230809/202308091820.0dPY7D6f-lkp@intel.com/config)
> > > > compiler: clang version 15.0.7 (https://github.com/llvm/llvm-projec=
t.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> > > > reproduce: (https://download.01.org/0day-ci/archive/20230809/202308=
091820.0dPY7D6f-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202308091820.0dPY7D=
6f-lkp@intel.com/
> > > >
> > > > All warnings (new ones prefixed by >>):
> > > >
> > > >    In file included from arch/hexagon/kernel/asm-offsets.c:12:
> > > >    In file included from include/linux/compat.h:14:
> > > >    In file included from include/linux/sem.h:5:
> > > >    In file included from include/uapi/linux/sem.h:5:
> > > >    In file included from include/linux/ipc.h:5:
> > > >    In file included from include/linux/spinlock.h:56:
> > > >    In file included from include/linux/preempt.h:12:
> > > > >> include/linux/list.h:53:13: warning: '__preserve_most__' calling=
 convention is not supported for this target [-Wignored-attributes]
> > > >    extern bool __list_valid_slowpath __list_add_valid_or_report(str=
uct list_head *new,
> > > >                ^
> > > >    include/linux/list.h:44:39: note: expanded from macro '__list_va=
lid_slowpath'
> > > >    # define __list_valid_slowpath __cold __preserve_most
> > > >                                          ^
> > > >    include/linux/compiler_types.h:132:49: note: expanded from macro=
 '__preserve_most'
> > > >    # define __preserve_most notrace __attribute__((__preserve_most_=
_))
> > >
> > > To silence this warning, we can just guard it based on known-supporte=
d architectures:
> >
> > As a band-aid, sure.
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Long term, perhaps we can fix in clang what __has_attribute evaluates
> > to for this attribute depending on the target.  Filed:
> > https://github.com/ClangBuiltLinux/linux/issues/1908
> > ^ Consider adding a comment linking to that in the sources.
>
> I will fold it into patch 1/3 of the original series. May I apply your
> Reviewed-by there?

Sure! Thanks for checking.

> I think there needs to be a v4, also because of some other change request=
s, too.
>
> Andrew, please shout if you'd rather have them as fix patches.
>
> Thanks!



--=20
Thanks,
~Nick Desaulniers
