Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367F638F8
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 16:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78472C340EC;
	Wed, 16 Mar 2022 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647449558;
	bh=Ms3SdtmMym/ZVvEz4Mg4AybfC+tKlik66Ih1Bu21854=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmuGaGhTGM5RYI2B9+oSJZh4e7mtQ1SFXZJrZogBfAXcD9biIa9xDYy/KOQMcWPbd
	 i/kkhaK7UHmbyozcQ0ijSECPu2YfQrvVPOfH20XdFZ2GTt+hK7hZXNA9oD1kSoJOwK
	 9inXxeyumVktucHUxypg9gZHY/Wu5NV+ZvLUCD8dwo+56BUGqy6qIxSHhFSPKccgmM
	 AHpkzbYz/B3S/mIKnYDuIf43thvB01QuPup0dUAnRpHGPJQ+JBhVljEhpz0byXuQIP
	 sMnYOTlwk+36bPgyYCQ5KzFoqP1jmLB7dl/p2pt49a4L62Z0oTw0RsfFN/Gpjw61uv
	 yDfVhIPKKLI0g==
Date: Wed, 16 Mar 2022 09:52:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: Re:
 [ammarfaizi2-block:google/android/kernel/common/android-4.19-q-release
 5202/7636] ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line
 argument '-stack-alignment=8'.  Try: 'ld.lld --help'
Message-ID: <YjIVzw4JdSY4NcLz@dev-arch.thelio-3990X>
References: <202203160848.kydLIYip-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202203160848.kydLIYip-lkp@intel.com>

On Wed, Mar 16, 2022 at 08:30:29AM +0800, kernel test robot wrote:
> tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-q-release
> head:   1a3500dc59324a85c20f025cfa6485a1a0debbdf
> commit: 205cde74877d624ef7d24a6692e6e9337b19a541 [5202/7636] ANDROID: x86: add support for CONFIG_LTO_CLANG
> config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220316/202203160848.kydLIYip-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/ammarfaizi2/linux-block/commit/205cde74877d624ef7d24a6692e6e9337b19a541
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-q-release
>         git checkout 205cde74877d624ef7d24a6692e6e9337b19a541
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.  Try: 'ld.lld --help'
>    ld.lld: Did you mean '--stackrealign=8'?
> --
>    lib/irq_regs.o: no symbols
> >> ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.  Try: 'ld.lld --help'
>    ld.lld: Did you mean '--stackrealign=8'?

Already fixed:

https://android.googlesource.com/kernel/common/+/c1baa3321020cdd2ea9248d9b1ec512abf6f1c24

Bisecting an old tree with a new compiler is probably going to show
quite a few issues, given how often we have to add changes to the kernel
to get newer compilers to work.

Cheers,
Nathan
