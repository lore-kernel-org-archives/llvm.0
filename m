Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F17A
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 07:19:29 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 75so16585616ybf.4
        for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 00:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HyJsR8RZ7AyXv8e801jKuabl2zWRfVP1YrI7f5FTJO8=;
        b=YzGNvs8posRLbFdR5G4kuRjrYsgmtP+o0QPOCcfYVF7aX1fFOUawnIIFtbKTCVGm89
         OFLY5MX+erKjQ4f210z1iUfaf2aqiUbt9eG9c4w0NPNI2BN5Jmn6tMKhe+WRmhxXkX77
         ff77U3Gh7wyN/mH2OrcixDohQ2/MMPttDRhQ1ZUVmvuZnhLrLAubYsBu8IQzED9Vi+Jm
         96Es14ypsmXVWB2tifn2yeECQHJds/yrtddLUnJxOFC0EvP/0aXlnRuYNjdvOJLBRxgJ
         nYEiIzDWxRP4AOT/ocmn4h1m1DXTT/mIG5QXk12QCUphDDh+Y6rnhhTBrRmVldi9s7Jd
         uWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HyJsR8RZ7AyXv8e801jKuabl2zWRfVP1YrI7f5FTJO8=;
        b=2dfaR1qEhLkAhW4jN6d5/TSsGPKsv8MStlRFevDTK3jxIP+vfO3BnRjw0D4+cIoCNc
         d8K90RrG5wLLkd2LOzVE5AC+d9EOBI/CUVPJI6caGLlFMmLINuma/YuDrH/yjosXKVYI
         FYbEQVQJlkhBFHQDwX0PjyFQvgBwrxmFan78pj68gHVxizr09JntOk6v/ZtuT3UfvVZ5
         lgTrJKJkhu86jRdXVRNY0bV1PXoo/76qSKXqgrqwtd1LRHX8yERWlT1Hi/je4z4SqVDJ
         ZD7a/LhU7uYYj6V+lsHCFLo7jdPAEc4UGJE4iYk1wz49e6x97EV71Lo3H1OuFw3SiY1H
         TNCQ==
X-Gm-Message-State: AJIora+G2E+b6KR1ufjJnAa6QsNrOGV4/BCxN+OAXvJJCTKy+jAVUo2M
	Btv0rmBdC6nsjO2q19Qc+MBenqCuC7VTTpTG5V2NrQ==
X-Google-Smtp-Source: AGRyM1s00VBi0SUotB0d4Pqpeid40B5yNRLv0YgE7oSjhXLZ7hyBdKL092F72TsJeiadw2fjEA0OW2cbWkHWFq3DMh4=
X-Received: by 2002:a25:4053:0:b0:66e:6a1d:c3b6 with SMTP id
 n80-20020a254053000000b0066e6a1dc3b6mr2355220yba.111.1657696768911; Wed, 13
 Jul 2022 00:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207131251.9wFgtqfN-lkp@intel.com> <CAFP8O3JXbg1HNRwO_b5bbg8iUqa1-Md8XPdmobUp7R8XzV2cYg@mail.gmail.com>
In-Reply-To: <CAFP8O3JXbg1HNRwO_b5bbg8iUqa1-Md8XPdmobUp7R8XzV2cYg@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Wed, 13 Jul 2022 00:19:17 -0700
Message-ID: <CAFP8O3Lp91VJwnNuUzmKuDi9va8-L2Z_O8hNr4mifkD7xC9aOg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Pass -mno-relax only on lld < 15.0.0
To: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 12, 2022 at 10:48 PM Fangrui Song <maskray@google.com> wrote:
>
> On Tue, Jul 12, 2022 at 9:16 PM kernel test robot <lkp@intel.com> wrote:
> >
> > BCC: lkp@intel.com
> > In-Reply-To: <20220710071117.446112-1-maskray@google.com>
> > References: <20220710071117.446112-1-maskray@google.com>
> > TO: Fangrui Song <maskray@google.com>
> > TO: Paul Walmsley <paul.walmsley@sifive.com>
> > TO: Palmer Dabbelt <palmer@dabbelt.com>
> > TO: Albert Ou <aou@eecs.berkeley.edu>
> > TO: linux-riscv@lists.infradead.org
> > CC: Khem Raj <raj.khem@gmail.com>
> > CC: linux-kernel@vger.kernel.org
> > CC: llvm@lists.linux.dev
> > CC: Fangrui Song <maskray@google.com>
> >
> > Hi Fangrui,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v5.19-rc6 next-20220712]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Fangrui-Song/riscv-Pass-mno-relax-only-on-lld-15-0-0/20220710-151301
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b1c428b6c3684ee8ddf4137d68b3e8d51d2a700f
> > config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20220713/202207131251.9wFgtqfN-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e60b4fb2b777118c0ff664a6347851df14fcf75b)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install riscv cross compiling tool for clang build
> >         # apt-get install binutils-riscv-linux-gnu
> >         # https://github.com/intel-lab-lkp/linux/commit/9abe0b92e612c5b6c53d4658b46c60b75bbd39d3
> >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> >         git fetch --no-tags linux-review Fangrui-Song/riscv-Pass-mno-relax-only-on-lld-15-0-0/20220710-151301
> >         git checkout 9abe0b92e612c5b6c53d4658b46c60b75bbd39d3
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> ld.lld: error: fs/built-in.a(nfs/nfs3xdr.o):(function decode_wcc_data: .text+0x2ec4): relocation R_RISCV_RVC_JUMP out of range: -1079 is not in [-1024, 1023]; references decode_fattr3
> >    >>> referenced by nfs3xdr.c
> >    >>> defined in fs/built-in.a(nfs/nfs3xdr.o)
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://01.org/lkp
> >
>
> This exposed an issue about imprecise branch distance computation when
> checking a call instruction referencing the same input section.
> I'll fix lld.

This was an issue in the R_RISCV_CALL lld patch. I just fixed it in
https://github.com/llvm/llvm-project/commit/6b1d151fe3dc530195d8802f1ecc247c8235dd3a
.

It's unnecessary to adjust the commit message since riscv32/riscv64
kernels should work with the very first R_RISCV_ALIGN lld patch.
