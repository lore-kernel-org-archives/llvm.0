Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54263168
	for <llvm@lists.linux.dev>; Tue, 28 Dec 2021 08:37:23 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id c36so5314525uae.13
        for <llvm@lists.linux.dev>; Tue, 28 Dec 2021 00:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQlFNR8cZsfmJYOadbGaTb/yUlOB1dRG6fgInli2WVA=;
        b=42RQDfbSkQW6jADhhI7F4N4p3I1CMrpGdjahPQlLkdSWdTAsE0hgqv4DOg1sJGbxX+
         2HkiK26AxN7Efg1Axx97HSG41EbloYpBAYjc7ft/u2+03BfdKNvXccVz1k+pTLgWWCKD
         s79ub8QhQPAgaPbutzDn9Dtm3Salg+X3WM2qpdQRZIdWps7H55XaYx8iKPf4Lz0iyQ2v
         xNmPNq157t3ou+65ns/gl8sa0FfsEybFrNImIqd8+h/LpLsZODGXK3VRMM+r0KIpbEaP
         fiGeoG3TUsyHFAoc2WNA8hM/APZ68AHH/+yOq5GDcTFexxgW12NoYD3I6khRQeY40TN9
         uQMA==
X-Gm-Message-State: AOAM531GIhuK94WJLAFU8Qu/w40Aa4GVxgWwdPvCZbPqTexMOoowC1C5
	tUpObRCyInU95N9k9G6Hm9ywh9vwQCtQQg==
X-Google-Smtp-Source: ABdhPJx4BcjOV0COsw6x9yH85GDJTVxliTT32E5rEiDW5gW0UxEu3HOpmLf9fK+N7VeiJYu+31XEDg==
X-Received: by 2002:a05:6102:3f04:: with SMTP id k4mr5476064vsv.3.1640680641757;
        Tue, 28 Dec 2021 00:37:21 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id d15sm3497956vsb.18.2021.12.28.00.37.21
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Dec 2021 00:37:21 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id r15so30937340uao.3
        for <llvm@lists.linux.dev>; Tue, 28 Dec 2021 00:37:21 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr6096810uae.122.1640680640883;
 Tue, 28 Dec 2021 00:37:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202112280309.fgjGevFd-lkp@intel.com>
In-Reply-To: <202112280309.fgjGevFd-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Dec 2021 09:37:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdXMqUDjeXsvFbSNk8hKcDAms-Z5JK+pGAcYvykyCzwg@mail.gmail.com>
Message-ID: <CAMuHMdVdXMqUDjeXsvFbSNk8hKcDAms-Z5JK+pGAcYvykyCzwg@mail.gmail.com>
Subject: Re: [atishp04:isa_ext_support 3/4] arch/riscv/kernel/cpufeature.c:82:24:
 warning: address of array 'edata->dtprop' will always evaluate to 'true'
To: kernel test robot <lkp@intel.com>
Cc: Atish Patra <atishp@rivosinc.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Atish Patra <Atish.Patra@wdc.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 28, 2021 at 9:21 AM kernel test robot <lkp@intel.com> wrote:
> tree:   https://github.com/atishp04/linux isa_ext_support
> head:   cf2f3fa532aa7c672f681ca0685046c738bfb45f
> commit: ae97a995345b68c472f3a904fc8fbefaa97ae26a [3/4] RISC-V: Provide a framework for parsing multi-letter ISA extensions
> config: riscv-randconfig-c006-20211226 (https://download.01.org/0day-ci/archive/20211228/202112280309.fgjGevFd-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 0c553cc1af2e4c14100df6cf4a6fc91987e778e6)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://github.com/atishp04/linux/commit/ae97a995345b68c472f3a904fc8fbefaa97ae26a
>         git remote add atishp04 https://github.com/atishp04/linux
>         git fetch --no-tags atishp04 isa_ext_support
>         git checkout ae97a995345b68c472f3a904fc8fbefaa97ae26a
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> arch/riscv/kernel/cpufeature.c:82:24: warning: address of array 'edata->dtprop' will always evaluate to 'true' [-Wpointer-bool-conversion]
>            if (!edata || !edata->dtprop)
>                          ~~~~~~~~^~~~~~
>    1 warning generated.
>
>
> vim +82 arch/riscv/kernel/cpufeature.c
>
>     76
>     77  int riscv_isa_ext_list_add(struct riscv_isa_ext_data *edata)
>     78  {
>     79          struct device_node *node, *enode;
>     80          int eid;
>     81
>   > 82          if (!edata || !edata->dtprop)

if (!edata || !edata->dtprop[0])

>     83                  return -EINVAL;
>     84
>     85          node = of_find_node_by_path("/cpus");
>     86          if (!node) {
>     87                  pr_err("No CPU information found in DT\n");
>     88                  return -ENOENT;
>     89          }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
