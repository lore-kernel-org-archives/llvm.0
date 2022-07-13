Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1191015A9
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 05:48:54 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id i14so17601428yba.1
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 22:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rhM/e4XBSEkBD2tivmKYNlYW3s30ER85YqJ+omVIlu0=;
        b=UZc+bPYo9uokwvO+pjnLkvNtJZa9nhgoBmxNsXj3KQq+rio0g9bT/1fuzhRii2CfY6
         ECxGq+trkZvIt5nMZ0yGplUHIsGCW415Z8fG8QrZMm+ptg1vtcS4yoftcnLaRmrvplbQ
         +IHRUcCAjjusS7ucxi+992qF2hvf7tdsg8DeweerEBkYXX6QXu+LrklcbYFsXSicKGpr
         1QCe1ZVMO5+BsLpGB07U3aCEBenSNrxWsvdhbMGgN+lBVNTyXLQQQyCU852ocoYih6E0
         PIO8g3OS9zPGQodMxhhYRYmhyR19zJR6LTphgYCNv1M3KCVHqGbFuJpCXNa0k0D0YEvp
         IjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rhM/e4XBSEkBD2tivmKYNlYW3s30ER85YqJ+omVIlu0=;
        b=sz7aVCZhuWztiOkp2AxuDy4ehxkIlZ3SVf86lh20J5R7vhoyKP7QuoFOHd/lODFfk8
         JOL7KZfYqZJ3h+fV7GvFSonbanapHBgPxsveH+xrGPHhC+64gpmi9wYHGK7yIiWK1j8k
         yWdMksfCycqI9+n2vSbL2LFS34+olNSoUFNfOmedjy7TM6lrRn6E8tHB8KYidjk9AMCE
         5zHXV+kw85ldaIbFXXrHo7as0SaUYSLykrm5HUrKC5VbLeBOF3dH/uxXGhJ8w/5g4Ts6
         ZzVaokfuQdMsxMLoOh7gJYuqxVVDs37LcsFVXWb0O7Ff5R6TESKVZmoSQBy/qKlAEsiz
         SAVw==
X-Gm-Message-State: AJIora/WvTaWWhB13EaQeW5TQBAaUd7jNsby3AvKQlrhsA8+zpU/6x6k
	i5kaAf50AsJbvFfr8hOPf28sT1Ga7jGax4AfgfmFVuGQ/Dc=
X-Google-Smtp-Source: AGRyM1u7SBDxdDaBuLBElJOq3WlRhPehQVDtKExX3l6eqlzr789w/VZYz/i0MHd6oQFEbGrsG5dfrbKavauN0DWSRmg=
X-Received: by 2002:a5b:58e:0:b0:66f:2c4f:e542 with SMTP id
 l14-20020a5b058e000000b0066f2c4fe542mr1995206ybp.572.1657691333769; Tue, 12
 Jul 2022 22:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207131251.9wFgtqfN-lkp@intel.com>
In-Reply-To: <202207131251.9wFgtqfN-lkp@intel.com>
From: Fangrui Song <maskray@google.com>
Date: Tue, 12 Jul 2022 22:48:42 -0700
Message-ID: <CAFP8O3JXbg1HNRwO_b5bbg8iUqa1-Md8XPdmobUp7R8XzV2cYg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Pass -mno-relax only on lld < 15.0.0
To: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 12, 2022 at 9:16 PM kernel test robot <lkp@intel.com> wrote:
>
> BCC: lkp@intel.com
> In-Reply-To: <20220710071117.446112-1-maskray@google.com>
> References: <20220710071117.446112-1-maskray@google.com>
> TO: Fangrui Song <maskray@google.com>
> TO: Paul Walmsley <paul.walmsley@sifive.com>
> TO: Palmer Dabbelt <palmer@dabbelt.com>
> TO: Albert Ou <aou@eecs.berkeley.edu>
> TO: linux-riscv@lists.infradead.org
> CC: Khem Raj <raj.khem@gmail.com>
> CC: linux-kernel@vger.kernel.org
> CC: llvm@lists.linux.dev
> CC: Fangrui Song <maskray@google.com>
>
> Hi Fangrui,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.19-rc6 next-20220712]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Fangrui-Song/riscv-Pass-mno-relax-only-on-lld-15-0-0/20220710-151301
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b1c428b6c3684ee8ddf4137d68b3e8d51d2a700f
> config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20220713/202207131251.9wFgtqfN-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e60b4fb2b777118c0ff664a6347851df14fcf75b)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/9abe0b92e612c5b6c53d4658b46c60b75bbd39d3
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Fangrui-Song/riscv-Pass-mno-relax-only-on-lld-15-0-0/20220710-151301
>         git checkout 9abe0b92e612c5b6c53d4658b46c60b75bbd39d3
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: fs/built-in.a(nfs/nfs3xdr.o):(function decode_wcc_data: .text+0x2ec4): relocation R_RISCV_RVC_JUMP out of range: -1079 is not in [-1024, 1023]; references decode_fattr3
>    >>> referenced by nfs3xdr.c
>    >>> defined in fs/built-in.a(nfs/nfs3xdr.o)
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>

This exposed an issue about imprecise branch distance computation when
checking a call instruction referencing the same input section.
I'll fix lld.
