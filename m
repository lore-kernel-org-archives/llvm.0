Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A083C3B;
	Tue,  7 Feb 2023 19:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2CFC433EF;
	Tue,  7 Feb 2023 19:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675796532;
	bh=lSMpcoGYsjZ3A/sSsABLKEIdxHqvf2/rD9Wt7vnKRlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzSwgPqEOF9ZwxQGIJMH+LXGDqdDwOxAlCh8eshUUyPm2QeNOjNP2d3sP+USnB/OP
	 RFuWUiNivOoR6LDhWL9SPYkqt/xnpzA5jL1X91koxsOZU2ic7R5sKURnLzmDqcJbpV
	 wiVFRIeBAVqb3lUvha3VDLLl2kopqxT5mPOAYqIQJlPdvly9A0NcudY2+h2urayRDP
	 HZPHBOTw5Apg6h4455rzCZ5gwqjsyhPi4lpkHkDgbtOfMQUp0rWqqgAZqHoa/MOi1p
	 B9YXpoYxnjdznDsbEjmrqrf9tG2/lh/OqMw9N3wv7X9j4vc5dWjWXjZEZzDc+9D/gA
	 AcHV/yBkBUM+A==
Date: Tue, 7 Feb 2023 12:02:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Patrisious Haddad <phaddad@nvidia.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>,
	Mark Zhang <markzhang@nvidia.com>
Subject: Re: include/linux/fortify-string.h:414:4: error: call to
 '__read_overflow' declared with 'error' attribute: detected read beyond size
 of object (1st parameter)
Message-ID: <Y+KgMv3Coc4gnV2p@dev-arch.thelio-3990X>
References: <202302080231.ZqOmpanX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302080231.ZqOmpanX-lkp@intel.com>

On Wed, Feb 08, 2023 at 02:59:05AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
> commit: 925d046e7e52c71c3531199ce137e141807ef740 RDMA/core: Add a netevent notifier to cma
> date:   8 months ago
> config: mips-buildonly-randconfig-r006-20230207 (https://download.01.org/0day-ci/archive/20230208/202302080231.ZqOmpanX-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=925d046e7e52c71c3531199ce137e141807ef740
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 925d046e7e52c71c3531199ce137e141807ef740
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/infiniband/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/infiniband/core/cma.c:9:
>    In file included from include/linux/completion.h:12:
>    In file included from include/linux/swait.h:7:
>    In file included from include/linux/spinlock.h:55:
>    In file included from include/linux/preempt.h:78:
>    In file included from ./arch/mips/include/generated/asm/preempt.h:1:
>    In file included from include/asm-generic/preempt.h:5:
>    In file included from include/linux/thread_info.h:60:
>    In file included from arch/mips/include/asm/thread_info.h:16:
>    In file included from arch/mips/include/asm/processor.h:15:
>    In file included from include/linux/cpumask.h:12:
>    In file included from include/linux/bitmap.h:11:
>    In file included from include/linux/string.h:253:
> >> include/linux/fortify-string.h:414:4: error: call to '__read_overflow' declared with 'error' attribute: detected read beyond size of object (1st parameter)
>                            __read_overflow();
>                            ^
>    1 error generated.

This is tentatively a bug in clang, although I do not see KASAN enabled:

https://github.com/ClangBuiltLinux/linux/issues/1687

I do see CONFIG_UBSAN_BOOL=y though, so this could be a generic
sanitizer problem.

Cheers,
Nathan
