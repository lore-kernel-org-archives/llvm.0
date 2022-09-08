Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4263222
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 13:48:50 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-3450990b0aeso138453487b3.12
        for <llvm@lists.linux.dev>; Thu, 08 Sep 2022 06:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PrAW4wlGAMpC6dhne2p4JlSpdkZ+T0pQJSO4IRDJw/M=;
        b=a5V303Grb1g6aa5PgMU+1/uY4uV2n3uOGiPp76bKJ9bWe3LdiMpqRBpPZo+c/uNnWq
         K7ZfRZJS2lZWvmNNV0kI5GFGc5h/b/xvkqoVKy+t9ViefUqkXJxdmrSwwbRyS02bdg+r
         tU5wRW4XERHfPrif6/firZHorfdjp3DEyYBhp/KZj4Hi1Lvsfdt90h5sM6qgSP6ht6Xu
         4fN7L8vDAiYFG1+fTKKbogWRmCTkzMHKbK6j0Yj9Hut7K2y4L+YQxwT/E1WEN+habGT/
         i1rM5BbJl+DCQsKghDS3VegCGhKf8NCy/zYzyEeu0k2MYI66YkJwXyI4rQp1Z3NwwDYN
         fs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PrAW4wlGAMpC6dhne2p4JlSpdkZ+T0pQJSO4IRDJw/M=;
        b=1Hqph53Z5tRufsAtKKPgdEcNAsYRjw0bS7HGx8s29YAXNq78R/Ux4o6M30C0Njkh50
         cVpjN2CUHc8NWnbU2V2uqndT2bOBKOCjuxXwkZ/oC8KGjTHHLHlhzzyLq5/0KtdtFc2H
         FoUN8HXWSEEUJmUZZ5KBb8NkV7pkyqKdUgHWqvIlBcfBDnzjP9Ah/De/1OELlKUbcP27
         vgfEMQZe7NaVHNF3IWxN6eXPmIysT2Y1UMNRzS25jS/JKEPkSVekoff/6xd1/qdzoVOy
         4jvglF5c9wtq4VwBaWBJIhQatyUXIlua2D1um9/RKieXFv1/VqnMV0k2AhfUlRfVNKVC
         KmPQ==
X-Gm-Message-State: ACgBeo09KQXsQ3URfUYRD4WTFg0cmSp8FDv8Nd+NOFUE89eQqXq0heni
	nfVKuIRms2iwOhjzoCej12NUBSGCpjlzr+sttBfyvw==
X-Google-Smtp-Source: AA6agR5xKhbQw6oS6dDgQ+QgiFx+Piom7aCOd/755e8364yFiN8jf83N80N4aalNlJ+GmPBIfkCIg2Fx3l/i9T6y0Vw=
X-Received: by 2002:a0d:d607:0:b0:348:a519:fbb7 with SMTP id
 y7-20020a0dd607000000b00348a519fbb7mr1674379ywd.255.1662644929486; Thu, 08
 Sep 2022 06:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202209082025.QtFc63hS-lkp@intel.com>
In-Reply-To: <202209082025.QtFc63hS-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Thu, 8 Sep 2022 15:48:13 +0200
Message-ID: <CANpmjNN=Q_Ccr6Z9_1H2pz-yzFSiAD9ncx7efP=WkroBMtSedw@mail.gmail.com>
Subject: Re: ld.lld: error: undefined symbol: __tsan_memcpy
To: kernel test robot <lkp@intel.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"

This is being fixed:
https://lore.kernel.org/all/20220907173903.2268161-1-elver@google.com/T/#u

This is an extremely fresh version of Clang, which has no release yet.
So the report is not urgent.

On Thu, 8 Sept 2022 at 14:33, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0066f1b0e27556381402db3ff31f85d2a2265858
> commit: dd03762ab608e058c8f390ad9cf667e490089796 arm64: Enable KCSAN
> date:   9 months ago
> config: arm64-randconfig-r031-20220908
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dd03762ab608e058c8f390ad9cf667e490089796
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout dd03762ab608e058c8f390ad9cf667e490089796
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: __tsan_memcpy
>    >>> referenced by main.c
>    >>>               main.o:(do_one_initcall) in archive init/built-in.a
>    >>> referenced by main.c
>    >>>               main.o:(setup_command_line) in archive init/built-in.a
>    >>> referenced by initramfs.c
>    >>>               initramfs.o:(panic_show_mem) in archive init/built-in.a
>    >>> referenced 4283 more times
> --
> >> ld.lld: error: undefined symbol: __tsan_memset
>    >>> referenced by main.c
>    >>>               main.o:(init_setup) in archive init/built-in.a
>    >>> referenced by main.c
>    >>>               main.o:(rdinit_setup) in archive init/built-in.a
>    >>> referenced by do_mounts_rd.c
>    >>>               do_mounts_rd.o:(identify_ramdisk_image) in archive init/built-in.a
>    >>> referenced 6155 more times
> --
> >> ld.lld: error: undefined symbol: __tsan_memmove
>    >>> referenced by main.c
>    >>>               main.o:(repair_env_string) in archive init/built-in.a
>    >>> referenced by range.c
>    >>>               range.o:(add_range_with_merge) in archive kernel/built-in.a
>    >>> referenced by printk.c
>    >>>               printk/printk.o:(vprintk_store) in archive kernel/built-in.a
>    >>> referenced 252 more times
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
