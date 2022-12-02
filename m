Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF881C2B
	for <llvm@lists.linux.dev>; Fri,  2 Dec 2022 09:43:00 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3bf4ade3364so43445917b3.3
        for <llvm@lists.linux.dev>; Fri, 02 Dec 2022 01:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2slbUiJmXoRmpNuRxOv1K083wWFnheMGIwwKztKIFzE=;
        b=tCQ5/XmgqkcfC40O80yasOYCKHkzhwgepZgGGTeZs9YXcUBntp9tjV3tXTdTKYhQjK
         GcHlOU0T2s/Va9He+t2YF8cAPY30g0D1vPR+g/ttoaY/k7op9dh3OTqtBVAdciWgI29w
         eyph+Px2wuhBix0loKUPb9CiHK/FkTD8P6/POuCMoWPfPSwGPUKLrBNM4q8hV+oAJ3xg
         pKure5WZ6hdoHpma0E9pQm0LusvTP+XGfqYzxX1548PbZvSL0SDYXxJxF+f4lpJSNOLd
         7a5GMX4XWeiIDy9MHRlTNBnR/pCZHoE4fzYmdlul6+h05Zw2DZ9Cjk3Cef+NfcTos9Bc
         CuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2slbUiJmXoRmpNuRxOv1K083wWFnheMGIwwKztKIFzE=;
        b=ov8jzWHOxQiAdNT1F31NHG1vF8xpofZZxidmZy69YHUXWkKjGVuiiyAugKuwYPhPTl
         yys3yxqP20nsl6lGgBiZWDT9fTeHbSQlMxfDitSc+FHrttq8ngTaE+MuwyydI80Gh2NM
         P6Ee6ITywDZ+WfS59sNu8+bHj8Uv2JwO/+m6rmfuytrwHIpzj32+92bwr7TBSmBvM+oW
         G+hNCm8deaxKv8hNA/bCrLHB7+Gl0CpgNRu8IPsaeWEJCkpJymSO+yZ/YXcFpK22yzpD
         F17VIchdHoIotkzp3Ap+7IBRXV5vt+gbEtNVAZ5ZRuXGbQIj1bIVGGX4AuTUp6bK+2Xr
         qVYQ==
X-Gm-Message-State: ANoB5plr4GYTp63C1xZiZZjMRxXcP5YvJVuVSbF2vt0pCNx2+tvxW+8h
	9qmGo3hsgnrUD5Utg+cSiKTzLTeY1WiiPSVCx0qLpurVK1j9xg==
X-Google-Smtp-Source: AA0mqf5kDX6jCDuPLbaGSMnRhNF04YeIJnTtrSOziYlU+zLnS0MyX9YTp0fIYld/VBvyePXysL6Zbyq7V5vq0UVO5gg=
X-Received: by 2002:a81:1915:0:b0:3bf:9e45:1139 with SMTP id
 21-20020a811915000000b003bf9e451139mr28525181ywz.267.1669974179263; Fri, 02
 Dec 2022 01:42:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212021713.p3N3pHkV-lkp@intel.com>
In-Reply-To: <202212021713.p3N3pHkV-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Fri, 2 Dec 2022 10:42:23 +0100
Message-ID: <CANpmjNNzkSVGeogm4fjHsENW52PEdwJey-=vz89QC9b5Fa-KGA@mail.gmail.com>
Subject: Re: ld.lld: error: undefined symbol: __tsan_memset
To: kernel test robot <lkp@intel.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Dec 2022 at 10:32, kernel test robot <lkp@intel.com> wrote:
>
> Hi Kefeng,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   a4412fdd49dc011bcc2c0d81ac4cab7457092650
> commit: dd03762ab608e058c8f390ad9cf667e490089796 arm64: Enable KCSAN
> date:   12 months ago
> config: arm64-randconfig-r006-20221201
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6e4cea55f0d1104408b26ac574566a0e4de48036)
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
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: __tsan_memset
>    >>> referenced by main.c
>    >>>               main.o:(init_setup) in archive init/built-in.a
>    >>> referenced by main.c
>    >>>               main.o:(rdinit_setup) in archive init/built-in.a
>    >>> referenced by main.c
>    >>>               main.o:(do_one_initcall) in archive init/built-in.a
>    >>> referenced 8519 more times
> --
> >> ld.lld: error: undefined symbol: __tsan_memcpy
>    >>> referenced by main.c
>    >>>               main.o:(do_one_initcall) in archive init/built-in.a
>    >>> referenced by initramfs.c
>    >>>               initramfs.o:(panic_show_mem) in archive init/built-in.a
>    >>> referenced by initramfs.c
>    >>>               initramfs.o:(do_collect) in archive init/built-in.a
>    >>> referenced 3922 more times
> --
> >> ld.lld: error: undefined symbol: __tsan_memmove
>    >>> referenced by main.c
>    >>>               main.o:(repair_env_string) in archive init/built-in.a
>    >>> referenced by range.c
>    >>>               range.o:(add_range_with_merge) in archive kernel/built-in.a
>    >>> referenced by core.c
>    >>>               bpf/core.o:(bpf_patch_insn_single) in archive kernel/built-in.a
>    >>> referenced 88 more times

The fix for this has been in -next (-rcu) for a while. Once it hits
mainline, it should also reach stable kernels since I attached Cc:
stable tags to the patches.

Given Clang 16 isn't even released yet, I think this is fair and does
not require urgency at this point.

Thanks,
-- Marco
