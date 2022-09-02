Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294136713
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 16:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4B1C433C1;
	Fri,  2 Sep 2022 16:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662136152;
	bh=EJSuKIdA6Kl9vAbkgwbqUPmQeQi48xSUtx/YrpyZeVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VySbP786tIIlHzoJHKsAGA+EXRZJ7zxPsG1gWbQpgabStWZTeuqmv2zdYF/6vEWx/
	 7rLcZ/r8D3QUM6ONZY3YRiVPHcjFEh8W48OdI+E4NFO50XljQjCmyTZEs94zMzcCGk
	 2DFwgPVjE0ulPLL27RaUqE2k9OHHiX83eMB9IKtoFl6XfLxpKlvQxBpkd96DrolURg
	 qoT9QlCtpae1XjSjYnVaUGOsQKjxSddnneu/BRzWXDvM7Tqt9AxzCcqvVx3AQMHhLo
	 HopSlwy1I6Y9kqmlAm/WQMbnLZtMsILNc6FrvVmZChVCPWKBZXBLv4muSkX1Q/2hnj
	 L5seHaFAAIcmw==
Date: Fri, 2 Sep 2022 09:29:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 4627/4736] ld.lld: error:
 vmlinux.o:(.debug_info+0x2096020d): relocation R_AARCH64_ABS32 out of range:
 4295813883 is not in
Message-ID: <YxIvVmJcKzJrIRzD@dev-arch.thelio-3990X>
References: <202209021113.imFYddaU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209021113.imFYddaU-lkp@intel.com>

+ Andrew, Dmitrii, and Nick

On Fri, Sep 02, 2022 at 11:26:27AM +0800, kernel test robot wrote:
> CC: Linux Memory Management List <linux-mm@kvack.org>
> TO: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
> CC: Andrew Morton <akpm@linux-foundation.org>
> CC: Linux Memory Management List <linux-mm@kvack.org>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
> commit: 12c674aa7e797864f36a4e9dbc2cf20930c1f6fe [4627/4736] kbuild: add debug level and macro defs options
> config: arm64-randconfig-r021-20220901 (https://download.01.org/0day-ci/archive/20220902/202209021113.imFYddaU-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=12c674aa7e797864f36a4e9dbc2cf20930c1f6fe
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 12c674aa7e797864f36a4e9dbc2cf20930c1f6fe
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: vmlinux.o:(.debug_info+0x2096020d): relocation R_AARCH64_ABS32 out of range: 4295813883 is not in [-2147483648, 4294967295]
>    >>> referenced by xarray.c; consider recompiling with -fdebug-types-section to reduce size of debug sections

It seems like CONFIG_DEBUG_MACRO_DEFINITIONS can blow up the size of the
kernel image significantly. Perhaps it should be marked with a

    depends on !COMPILE_TEST

to avoid having all{mod,yes}config and randconfigs trip over it?

Cheers,
Nathan
