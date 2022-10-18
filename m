Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68D44C64
	for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 13:50:36 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id k2so32340819ejr.2
        for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4wB631nR2ufn98xkxwjeGkfg7tpbIY9DF7gaZqGQ2F0=;
        b=FyhgUOcqf/42Eom8h+I3ww7dlLGs6xqifW84EHyBBYE/gEVk4Te1j/d5t0QM1xH4+4
         cB5ELfFR0pqlmYyATk1VUARWb4Pidq8hi5zGl/HCDz3DZaT0ShTH9IzsFKjT2sP+pH1r
         alK81IFzQs9RzZ3L7Mryp5pCouUg7FlptsP0pp+hPeN5gMGU7NgKbVKHccqUbFfaLqDo
         v0icfKu7ER24FtnyIbZFl4VP0ndR+rh8E7O2qN1T3cDT7eWzvz/hPNWVgVDLVZfjBA77
         Q4AzFkbtwlbBYnUCiRVJR34iZ71nem0YCDAMuPyVxbSKnlUXhZ1xkiUIhtL9JYgaqGcD
         mM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wB631nR2ufn98xkxwjeGkfg7tpbIY9DF7gaZqGQ2F0=;
        b=4RyCR8gUFGoaspCaACCoacI/fPwikV+ksmVeceZ0rcpZ6eIDzFSOw9Mm5MvwfpVIz2
         H5pJAPv/p674e9ZU/zm4koetl0q36ycAjw7/FgWgXJ9tBH4rn5NJ2c55aBQuNlX61mHS
         w0us51KR0+ekBJS+y8sBNUkvCMSTzlZ43R0l/i+HgwhPrHttxM2X405jrlmphPrIzrLs
         tKn5F6bOkT9qr9uYnC1qfrWH7OXGLkDbXhipFu5jfPm5I3oavfz78DbpeXT185+iVw6d
         4GTgNxpHJgNe+0GZckRjDq4owvOweF/BYpvNn+3zA8hFcbaYUCTS+mL9OUaPwNKs57YM
         Iejg==
X-Gm-Message-State: ACrzQf3I1BmjsV5ZS8+w2HpluoqRplqyHiT08tlaAQAXXoTtSaySKe9s
	2vJSmAvblAUmk9rucKZIutpW8XAvI+EAn6AZNBU=
X-Google-Smtp-Source: AMsMyM4M2kkaTjQaNSIcEbJSJ8+b27Nmni5Q4FPGnKfiZeWEyp32D1sTPdMjC+G0iSohUSx9aKDtfLeypPfBnuReInk=
X-Received: by 2002:a17:906:9be9:b0:78d:2f63:10dd with SMTP id
 de41-20020a1709069be900b0078d2f6310ddmr2492010ejc.479.1666101034690; Tue, 18
 Oct 2022 06:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210181318.WUNV3QRv-lkp@intel.com> <CAD-N9QX8tHSePqzQ8QZEYmAy6XTV5DN1Q3C-s7YYeu304hi=YA@mail.gmail.com>
 <a3d141c0-0737-8653-03ef-95e09e122c51@oracle.com>
In-Reply-To: <a3d141c0-0737-8653-03ef-95e09e122c51@oracle.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 18 Oct 2022 21:48:33 +0800
Message-ID: <CAD-N9QXhfdsnA372=Pt=sq=006asFKfgw7vYSa1x0KUwkBozOw@mail.gmail.com>
Subject: Re: [linux-next:master 1304/1443] fs/jfs/jfs_dmap.c:196:23: warning:
 result of comparison of constant 8796093022201 with expression of type 'int'
 is always false
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 18, 2022 at 9:39 PM Dave Kleikamp <dave.kleikamp@oracle.com> wrote:
>
> On 10/18/22 3:11AM, Dongliang Mu wrote:
> > On Tue, Oct 18, 2022 at 1:50 PM kernel test robot <lkp@intel.com> wrote:
> >>
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> >> head:   4ca786ae6681b90b0ec3f4c55c89d12f835f8944
> >> commit: 920f4b7e923b35fd9d117fd3cb616b310cd41010 [1304/1443] fs: jfs: fix shift-out-of-bounds in dbAllocAG
> >> config: mips-randconfig-r005-20221017
> >> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> >> reproduce (this is a W=1 build):
> >>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>          chmod +x ~/bin/make.cross
> >>          # install mips cross compiling tool for clang build
> >>          # apt-get install binutils-mipsel-linux-gnu
> >>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=920f4b7e923b35fd9d117fd3cb616b310cd41010
> >>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >>          git fetch --no-tags linux-next master
> >>          git checkout 920f4b7e923b35fd9d117fd3cb616b310cd41010
> >>          # save the config file
> >>          mkdir build_dir && cp config build_dir/.config
> >>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/jfs/
> >>
> >> If you fix the issue, kindly add following tag where applicable
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >>>> fs/jfs/jfs_dmap.c:196:23: warning: result of comparison of constant 8796093022201 with expression of type 'int' is always false [-Wtautological-constant-out-of-range-compare]
> >>             if (bmp->db_agl2size > MAXMAPSIZE - L2MAXAG) {
> >>                 ~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
> >>     1 warning generated.
> >
> > Hi Dave,
> >
> > I did not double check the upper bound of db_agl2size. It seems the
> > upper bound should be L2MAXL2SIZE - L2MAXAG, other than MAXMAPSIZE -
> > L2MAXAG.
> >
> > And L2MAXL2SIZE = L2BPERDMAP + 3 * L2LPERCTL = 13+3*10 = 43.
> >
> > I will send a fixes commit.
>
> Thanks for fixing that correctly. This was my mistake, since that's the
> value I asked you to use.
>
> I'll use your new patch.

It's fine. I should double-check all my changed code in the patch.

>
> Shaggy
