Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F9628F9
	for <llvm@lists.linux.dev>; Mon, 30 May 2022 11:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA97C3411E
	for <llvm@lists.linux.dev>; Mon, 30 May 2022 11:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653908475;
	bh=hN3WhjxTaLGcWaPjo+wfUUJbxsQKSn8GzQyB50jE1NE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RzBEYqXAospaesRdrFkbtXeqU/aRiGdtqN+kDSkCBQphbq73ZJaVahwEO1osQHyoO
	 yViZFIFuF1VqpNYps1UO9+AmI5MsxRU5ULTOg7s7Yjt/WKTDgeqmSrJ4h7rhDMlNRh
	 9q+XnBWDhw+iZ7l1OMk4wlegw8juNERC7jarq/fJE6X/J8jM2j3QHKk8YIT6cMkLJs
	 L1nOeVfEU1SAeYuldAiKXd+Vh7A82ilSzGxTWZtqxvrhAKUppsVZ9e6bExEvDX5DP3
	 OSyLzz/eyPMkFYUqriZC4hnu+Yq9MlwgaK+4P4R/2cFmbWkNWn0W1u3wN5eUkqzbo6
	 aydEiMkIgy92g==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-e5e433d66dso13865516fac.5
        for <llvm@lists.linux.dev>; Mon, 30 May 2022 04:01:15 -0700 (PDT)
X-Gm-Message-State: AOAM531lGMO6v1iphkRw/8IYVK0tgvMmPPYz/6/qQuwt3zor4dGNZW3O
	tYck/ajUgX4nMf1zMmsQZSKrrcXkjY/O7a1rUXs=
X-Google-Smtp-Source: ABdhPJyzW7d1LkreDf+LUIXe7xFKiCNXCUok/909StaPbqBsgVbN30QvM8IqHtyc0AELA7POe0pA0ixwjUs0fdPnOxc=
X-Received: by 2002:a05:6870:eaa5:b0:da:b3f:2b45 with SMTP id
 s37-20020a056870eaa500b000da0b3f2b45mr10318942oap.228.1653908474755; Mon, 30
 May 2022 04:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202205290805.1vZLAr36-lkp@intel.com>
In-Reply-To: <202205290805.1vZLAr36-lkp@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 30 May 2022 13:01:03 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEBT=y+_4JHe=i-5c59YXg6MReK2cHxf0ufWYQUq5GsJQ@mail.gmail.com>
Message-ID: <CAMj1kXEBT=y+_4JHe=i-5c59YXg6MReK2cHxf0ufWYQUq5GsJQ@mail.gmail.com>
Subject: Re: <instantiation>:2:2: error: out of range pc-relative fixup value
To: kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

(cc Nathan and Nick)

On Sun, 29 May 2022 at 02:22, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
> commit: 508074607c7b95b24f0adf633fdf606761bb7824 ARM: 9195/1: entry: avoid explicit literal loads
> date:   9 days ago
> config: arm-randconfig-r005-20220529 (https://download.01.org/0day-ci/archive/20220529/202205290805.1vZLAr36-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f3f486e01448121f7931a4ca29fac1504ab)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=508074607c7b95b24f0adf633fdf606761bb7824
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 508074607c7b95b24f0adf633fdf606761bb7824
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> <instantiation>:2:2: error: out of range pc-relative fixup value
>     ldr tsk, =__current
>     ^
>

This log snippet is a bit terse. I managed to narrow this down to
arch/arm/kernel/entry-common.S but having a bit more context from the
build log would be useful here.

The commit in question reorganizes some variable loads from asm code
by switching to the ldr_va macro, which avoids literals in most cases,
but not when CONFIG_COMPILE_TEST=y as is the case here. (This is due
to the fact that allyesconfig produces a vmlinux image whose size
exceeds the 256 MB range of ARM group relocations used by ldr_va, and
so group relocations are not used in this case)

This means that those ldr_va macros evaluate to literal loads such as
the 'ldr tsk, =__current' reported above, and the literal pool entry
carrying the address of __current can no longer be emitted close
enough to the LDR instruction itself, due to the way those literal
loads have been slightly reshuffled by that commit.

This is easily fixed by putting a .ltorg directive in the appropriate
location (I'll send out the patch right away) but it does beg the
question whether or not we need to keep allyesconfig building, given
that it cannot actually boot on a real (or emulated) system.
