Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E342C290B
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 08:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E5CC3411C
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657786906;
	bh=cM75EalaE+G14WuLgMcrVWjKyhz/7cDyHwijh6Jtasg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OhHh5uUe638RHZec3dbAmSHIQiyvnWpzF7rtrOCIUu+Hrqc81Yc0/a3NypvXCW37P
	 f8uqoz7cIIqIbq59K4rHU6ig4DgxpYXaBKKNVcQLaptb6Tu+zOql3jLJLiIJ+IEGBy
	 rNphs3jpuXEk91sS6FBEUrC2kcfzF5NJcnlieamAkq7yDpyQ5Tg6zdYkaWha8QYTpD
	 lBM7Pw6o87DA72ZIy3+aDkwqr3Zxp6AOAfp0h0Rf5kHUGKdf8/WKDu8gqDRspu9wS1
	 soN/Iw723SbFC0v3bVVVa7NVeBX1TwHy2z4zGZwgcgA+oNMvEPoCKPkJCcwsCnTQJ8
	 lMm+zq+hNXGlg==
Received: by mail-yb1-f170.google.com with SMTP id i14so2015659yba.1
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 01:21:46 -0700 (PDT)
X-Gm-Message-State: AJIora+UY3u5Klr9in+zRWuirU/oN9IFoQ+MSfQpmp6bZvfOaMUc7xnb
	8LyYKsLCgoNWQHCBF0MMk0/toa7dhO7MPtrh97I=
X-Google-Smtp-Source: AGRyM1vNAsuZTeUDqx1iRB/kszrma7xNtlq70IydZXwh7aO+rcZXmioVzIDb5iN8TdenLJrWOpQ35WoR4SNoswx+7ig=
X-Received: by 2002:a25:73d1:0:b0:66e:aee4:feb3 with SMTP id
 o200-20020a2573d1000000b0066eaee4feb3mr7674687ybc.452.1657786905666; Thu, 14
 Jul 2022 01:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207141406.IF2aPRxC-lkp@intel.com>
In-Reply-To: <202207141406.IF2aPRxC-lkp@intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 14 Jul 2022 10:21:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Hg3WX=hf3yjH-w_zF0GKE+ygDdDR7BY6GhORTOvibOw@mail.gmail.com>
Message-ID: <CAK8P3a0Hg3WX=hf3yjH-w_zF0GKE+ygDdDR7BY6GhORTOvibOw@mail.gmail.com>
Subject: Re: [linux-next:master 4365/10347] drivers/net/dsa/microchip/ksz_spi.c:132:34:
 warning: unused variable 'ksz_dt_ids'
To: kernel test robot <lkp@intel.com>
Cc: Arun Ramadoss <arun.ramadoss@microchip.com>, clang-built-linux <llvm@lists.linux.dev>, 
	kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 8:16 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4662b7adea50bb62e993a67f611f3be625d3df0d
> commit: 4658f2fe8fbcb12c1db0577ad9c46b67f10d09f1 [4365/10347] net: dsa: microchip: common ksz_spi_probe for ksz switches
> config: hexagon-randconfig-r023-20220714 (https://download.01.org/0day-ci/archive/20220714/202207141406.IF2aPRxC-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4658f2fe8fbcb12c1db0577ad9c46b67f10d09f1
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 4658f2fe8fbcb12c1db0577ad9c46b67f10d09f1
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/dsa/microchip/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/net/dsa/microchip/ksz_spi.c:132:34: warning: unused variable 'ksz_dt_ids' [-Wunused-const-variable]
>    static const struct of_device_id ksz_dt_ids[] = {
>                                     ^

The problem is the extraneous of_match_ptr() when referencing the ID
table, just remove that.

       Arnd
