Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A127A
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 19:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6C0C340E7;
	Sat, 12 Feb 2022 19:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644695676;
	bh=/Vo6fc/uRQL1PLlL1zWke4rVepn22GpSm1QDaHKkrk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arLvw22b40mDW5P1WItw9Gs18lxFhcCMumBfjELjhsHZ0+Z3HR6x02Ms/vZWWh82l
	 2zOf0iIaed4OCs4zasn53YzK1cAk8YPhRiLYGfDc4m+PlpTaf7YKUIa+sqFDJMpYvd
	 ofF/ktvEnPP7BwMYgRjc0jR+bJ6deQ5ML8A4VQwZcxO/onr4mDmS+HwZ5yj2566BQb
	 cVXDQxzV84PLbDdx7ECokukvYZfpO69/kSogigjUUWRJhqforkrOezlNtOaCE5keA2
	 5Z2IaBJlJ7bECbJqgG0S9EtIjAfusrbM5mukyIOy2Rpgb/H5oXODJTRpxONQtzCHwc
	 Up2aYFy96KHow==
Date: Sat, 12 Feb 2022 12:54:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Wedson Almeida Filho <wedsonaf@google.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>, rust-for-linux@vger.kernel.org
Subject: Re: [ojeda-linux:rust-next 18/20] ld.lld: error:
 drivers/built-in.a(gpio/gpio_pl061_rust.o) is incompatible with aarch64elfb
Message-ID: <YggQeC0PuAseqtpQ@archlinux-ax161>
References: <202202121743.YbGELjcY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202202121743.YbGELjcY-lkp@intel.com>

+ Miguel, Wedson, rust-for-linux, since it looks like this did not get
sent to you all.

Possibly some incompatibility with Rust + aarch64be?

Cheers,
Nathan

On Sat, Feb 12, 2022 at 06:39:33PM +0800, kernel test robot wrote:
> CC: linux-kernel@vger.kernel.org
> TO: Wedson Almeida Filho <wedsonaf@google.com>
> CC: Miguel Ojeda <ojeda@kernel.org>
> 
> Hi Wedson,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://github.com/ojeda/linux.git rust-next
> head:   ced9f62ec4355bbb92226ac3f019da468a5c996b
> commit: 5c1fec092f967b9b4722f6d91c9bcbe8222098fd [18/20] [RFC] drivers: gpio: PrimeCell PL061 in Rust
> config: arm64-randconfig-r033-20220212 (https://download.01.org/0day-ci/archive/20220212/202202121743.YbGELjcY-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/ojeda/linux/commit/5c1fec092f967b9b4722f6d91c9bcbe8222098fd
>         git remote add ojeda-linux https://github.com/ojeda/linux.git
>         git fetch --no-tags ojeda-linux rust-next
>         git checkout 5c1fec092f967b9b4722f6d91c9bcbe8222098fd
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    ld.lld: error: rust/built-in.a(core.o) is incompatible with aarch64elfb
>    ld.lld: error: rust/built-in.a(compiler_builtins.o) is incompatible with aarch64elfb
>    ld.lld: error: rust/built-in.a(alloc.o) is incompatible with aarch64elfb
>    ld.lld: error: rust/built-in.a(kernel.o) is incompatible with aarch64elfb
> >> ld.lld: error: drivers/built-in.a(gpio/gpio_pl061_rust.o) is incompatible with aarch64elfb
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
