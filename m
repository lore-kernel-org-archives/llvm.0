Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC9DA2D
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 17:07:06 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id q5so585338ljb.11
        for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 10:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fdSyI71UrcYnS9PD8/kYWAhaxlCUy9rY5QWg9D495Js=;
        b=UMiK2/ok9F3Y1Vp/549u0DOVZzjViy3UwowNqil5I+8duJSK5VCjRULxz4DWNeqgZF
         6LWHeeo8vrJHlW3B/3K4hzUWWJUG743p45kFw9pVv4k4JnBNVekIlq5NErSBvjU4WBCB
         QBoZrq1eVRM/sDhtQi08Q0aeugFk2iLHm9a89lv0lHSOn/ZUatgl8TbFYqVxQjft6Vzu
         YZEW0k6VyXfaLqJuQRIA6G5aLzK/iBpbDAc7gKNXoH1s2y4u8bk7OlBJTeCWPfMR3AEM
         4Wnii3Vn49DrVPkfReZaI6eDJL4MhyJXiu4LzSZ653tkbAPZ0ct8tRQXLiWVX/YmHneu
         netw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fdSyI71UrcYnS9PD8/kYWAhaxlCUy9rY5QWg9D495Js=;
        b=2o1GgIAYqsnsAMnuC7jDvFNwm/MDZdDBUXttu2Ce3t04KOgnS+jHNgealqGpSYCe8H
         HasDUuJzb0iIGs3++AcydamEjH7/HQvEth/8o+DYAr34+Xu/xytzWY5WddFklB66HH5H
         fsAi30kDfs4ldjVDw8jy6ouQUha9J5KRVhLP6OrT4u83ITKsjhLxyyS9cOwQ4PVK08xE
         4Se2GDE2KmAkbRD+wqBWrxKH321dZ6LVI+yCxKLN4dTskI6LXs7YWUBo2tpzL2tfdHPV
         zjpadQAmH80FYJGLIewfcuZyqO0RxlK1+dcWPzNbDDQjbqWeiyYYYlc/FeBrYBdRI6+p
         UT+g==
X-Gm-Message-State: AOAM5319+qalY0wcBALOzPoxlPV6/g8S+DTx0LoGjQw3fnz51rkt/zXh
	UI9KAn5UxNkGjrqT0Suw5unmaa+IO3lMGWWq3LU9Cw==
X-Google-Smtp-Source: ABdhPJw8Q/b4RlaadBwVkJ1YfXzyuHazNx9rPS5OzaHjywsX8MEzE4ECP5Xy/jh7hykLR2YuO0IcIF80exL3DqZ36as=
X-Received: by 2002:a2e:818f:0:b0:24a:7c17:7226 with SMTP id
 e15-20020a2e818f000000b0024a7c177226mr11014901ljg.472.1648746423660; Thu, 31
 Mar 2022 10:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203301412.MZ7wQvQz-lkp@intel.com> <YkTP/+jhhAX6xlAQ@carbon.dhcp.thefacebook.com>
 <YkV3bCqtLaVH+mC7@linux.ibm.com> <YkXSv8exRRUbT/oM@dev-arch.thelio-3990X>
In-Reply-To: <YkXSv8exRRUbT/oM@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 31 Mar 2022 10:06:52 -0700
Message-ID: <CAKwvOdksByffbydecdy_buXSmzM6Fx9T90Jse+84dOYX=QQZgA@mail.gmail.com>
Subject: Re: [ammarfaizi2-block:google/android/kernel/common/android12-trusty-5.10
 4036/5872] WARNING: modpost: vmlinux.o(.text+0x4111c4): Section mismatch in
 reference from the function memblock_bottom_up() to the variable .meminit.data:memblock
To: Tri Vo <trong@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@google.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	kernel test robot <lkp@intel.com>, Roman Gushchin <guro@fb.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, 
	linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Minchan Kim <minchan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 9:11 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Mar 31, 2022 at 12:42:04PM +0300, Mike Rapoport wrote:
> > (added llvm folks)
> >
> > Hi,
> >
> > On Wed, Mar 30, 2022 at 02:47:43PM -0700, Roman Gushchin wrote:
> > > On Wed, Mar 30, 2022 at 02:53:14PM +0800, kbuild test robot wrote:
> > > > Hi Roman,
> > > >
> > > > FYI, the error/warning still remains.
> > > >
> > > > tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-trusty-5.10
> > > > head:   07055bfd3d810d41a38354693dfaa55a6f8c0025
> > > > commit: 0e0bfc41fdf4d79d39ebe929844cdee44f97366d [4036/5872] UPSTREAM: mm: cma: allocate cma areas bottom-up
> > > > config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220330/202203301412.MZ7wQvQz-lkp@intel.com/config)
> > > > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
> > > > reproduce (this is a W=1 build):
> > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         # https://github.com/ammarfaizi2/linux-block/commit/0e0bfc41fdf4d79d39ebe929844cdee44f97366d
> > > >         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
> > > >         git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-trusty-5.10
> > > >         git checkout 0e0bfc41fdf4d79d39ebe929844cdee44f97366d
> > > >         # save the config file to linux build tree
> > > >         mkdir build_dir
> > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> > > >
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > >
> > > > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > > >
> > > > >> WARNING: modpost: vmlinux.o(.text+0x4111c4): Section mismatch in reference from the function memblock_bottom_up() to the variable .meminit.data:memblock
> > > > The function memblock_bottom_up() references
> > > > the variable __meminitdata memblock.
> > > > This is often because memblock_bottom_up lacks a __meminitdata
> > > > annotation or the annotation of memblock is wrong.
> > >
> > > I guess this patch should fix it, however I fail to reproduce the original issue.
> > > Maybe it's up to the specific compiler version.
> > >
> > > --
> > >
> > > From b55a8dd19f4156d7e24ec39b18ede06965ce1c4f Mon Sep 17 00:00:00 2001
> > > From: Roman Gushchin <roman.gushchin@linux.dev>
> > > Date: Wed, 30 Mar 2022 14:42:12 -0700
> > > Subject: [PATCH] memblock: fix memblock_bottom_up() and
> > >  memblock_set_bottom_up() annotations
> > >
> > > memblock_bottom_up() and memblock_set_bottom_up() lack __meminitdata
> > > annotations causing compiler warnings like:
> > >   WARNING: modpost: vmlinux.o(.text+0x4111c4): Section mismatch in reference from the function memblock_bottom_up() to the
> > >   variable .meminit.data:memblock
> > >
> > > Fix it by adding the missing annotation and removing the wrong
> > > __meminit annotation.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Roman Gushchin <roman.gushchin@linux.dev>
> > > ---
> > >  include/linux/memblock.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > > index 50ad19662a32..536bc2fc31e6 100644
> > > --- a/include/linux/memblock.h
> > > +++ b/include/linux/memblock.h
> > > @@ -460,7 +460,7 @@ static inline void *memblock_alloc_node(phys_addr_t size,
> > >  /*
> > >   * Set the allocation direction to bottom-up or top-down.
> > >   */
> > > -static inline __init_memblock void memblock_set_bottom_up(bool enable)
> > > +static inline __initdata_memblock void memblock_set_bottom_up(bool enable)
> >
> > I think putting __initdata_memlock won't help here, because there should be
> > nothing wrong with __meminit function accessing __meminitdata data.
> >
> > My guesstimate would be that the compiler decided not to inline this and
> > still dropped section attribute because of 'inline'.
> >
> > If this is the case we I think we should
> >
> >       s/inline __init_memblock/__always_inline/
> >
> > >  {
> > >     memblock.bottom_up = enable;
> > >  }
> > > @@ -470,7 +470,7 @@ static inline __init_memblock void memblock_set_bottom_up(bool enable)
> > >   * if this is true, that said, memblock will allocate memory
> > >   * in bottom-up direction.
> > >   */
> > > -static inline __init_memblock bool memblock_bottom_up(void)
> > > +static inline __initdata_memblock bool memblock_bottom_up(void)
> > >  {
> > >     return memblock.bottom_up;
> > >  }
> > > --
> > > 2.30.2
> > >
> >
>
> For the record, I cannot reproduce this on mainline, which has commits
> 34dc2efb39a2 ("memblock: fix section mismatch warning") and a024b7c2850d
> ("mm: memblock: fix section mismatch warning again"). That first commit
> has the same exact warning as this report, which is against an Android
> tree (android12-trusty-5.10).
>
> While I do not see the commit that 34dc2efb39a2 claims to fix in
> android12-trusty-5.10, I do see the three commits in android12-5.10:
>
> a46e3fa13968 ("UPSTREAM: mm: memblock: drop __init from memblock functions to make it inline")
> 5f7ec0f4c383 ("UPSTREAM: memblock: fix section mismatch warning")
> 8cf5bb6946a2 ("UPSTREAM: mm: memblock: fix section mismatch warning again")

It sounds like trusty just needs to pull down from (or rebase onto)
android12-5.10 into android12-trusty-5.10.

>
> I think we can just discard this report for now, unless someone from
> Google's trusty team wants to address it in that branch.
>
> Cheers,
> Nathan



-- 
Thanks,
~Nick Desaulniers
