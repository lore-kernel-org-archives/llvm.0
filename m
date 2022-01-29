Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5A12CA2
	for <llvm@lists.linux.dev>; Sat, 29 Jan 2022 20:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B013C340E5;
	Sat, 29 Jan 2022 20:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643487781;
	bh=ibfNrnDd+VmWeyoly0lQUrC025/BUGr3gbVTET9B04U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fay9tk8OjFXVk8vdBucFW8q9Lae+bmmvVnF+NZk2vUuCFrD1LhEIZ+xhKsX/cmjBw
	 byAdYx7nhRN2gpaSNxhehoU6ddWrV/7C2K6bm6YAVygo9VGhlKYjEzMrjcelsIU4oN
	 BefZ0+fqcC+pwugYwINovryHY3EBFY+0/K9vC/2ClF4V4kvPTdLb2J5xibyhp4HX17
	 MRTPWKZG2wOZw/DEeYB20W77WnJfMXea2zz6/7Jix67Yl0Y590atXG3y6h6IM+irbB
	 YI8MTa/BDGqcN91XQPLybQgd8yVc2l6yJydPx5HzDb57DBzuRCdU7FUmEM3xjczwJa
	 v91eGA2cnfY0w==
Date: Sat, 29 Jan 2022 13:22:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "Justin M. Forbes" <jforbes@fedoraproject.org>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	"Jason A. Donenfeld" <zx2c4@kernel.org>
Subject: Re: arch/arm/lib/xor-neon.c:30:2: warning: This code requires at
 least version 4.6 of GCC
Message-ID: <YfWiIZ9QZuWRTYRy@dev-arch.archlinux-ax161>
References: <202201291408.Pkylyt75-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202201291408.Pkylyt75-lkp@intel.com>

On Sat, Jan 29, 2022 at 03:02:58PM +0800, kernel test robot wrote:
> Hi Justin,
> 
> First bad commit (maybe != root cause):

Yeah, this commit definitely does not introduce this warning, it has
been one of our longest tracked warnings.

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   169387e2aa291a4e3cb856053730fe99d6cec06f
> commit: e56e18985596617ae426ed5997fb2e737cffb58b lib/crypto: add prompts back to crypto libraries
> date:   11 days ago
> config: arm-randconfig-r004-20220128 (https://download.01.org/0day-ci/archive/20220129/202201291408.Pkylyt75-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e56e18985596617ae426ed5997fb2e737cffb58b
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout e56e18985596617ae426ed5997fb2e737cffb58b
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least version 4.6 of GCC [-W#warnings]
>    #warning This code requires at least version 4.6 of GCC
>     ^
>    1 warning generated.

https://github.com/ClangBuiltLinux/linux/issues/496

https://lore.kernel.org/r/20220127081227.2430-3-ardb@kernel.org/

Cheers,
Nathan
