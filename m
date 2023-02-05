Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815482F21;
	Sun,  5 Feb 2023 20:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5E1C433AA;
	Sun,  5 Feb 2023 20:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675628964;
	bh=2XLhCfU33F7h/XYjf0FFaOiiQ5t8CUWt6rrK+wz+RBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nLmPcLpzrmdEtVW/CaFqMRFuM24LEfD7W6s8U49flwz6pVEK4+Ub7+VrySxh9g54F
	 EWhhiwxL/Kq8MqSaDQm9dCIKt0qsikBWI7HKCPShW3ZT9OBq7VF02SFaB9Mfxgizem
	 J7aR7fhxK8G8opR6Fs0hSHqklozeyczCBVGNI6dneJvyUYGiWaxUZ7kWEyANp637j4
	 3Zo0P9mmW+Z2R220Yz4ovLGz1fvk4Oss+k/uV5VIlDBlig3SVbY+i5HXiMrdtGLLjW
	 xAJg46aPuOyQkJTqAxOGjBS7JK4oE50zWP0Sg6JYLaEp9HH8+WtowSYg14QsQPA3KB
	 7zxz3zypnAoyg==
Date: Sun, 5 Feb 2023 13:29:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [linux-next:master 8959/10357] ld.lld: error: no machine record
 defined
Message-ID: <Y+ARoumDpY4+1aj/@dev-arch.thelio-3990X>
References: <202302051805.Ki6cIpbV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302051805.Ki6cIpbV-lkp@intel.com>

On Sun, Feb 05, 2023 at 07:07:37PM +0800, kernel test robot wrote:
> Hi Nathan,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4fafd96910add124586b549ad005dcd179de8a18
> commit: 5eb6e280432ddc9b755193552f3a070da8d7455c [8959/10357] ARM: 9289/1: Allow pre-ARMv5 builds with ld.lld 16.0.0 and newer
> config: arm-shannon_defconfig (https://download.01.org/0day-ci/archive/20230205/202302051805.Ki6cIpbV-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5eb6e280432ddc9b755193552f3a070da8d7455c
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 5eb6e280432ddc9b755193552f3a070da8d7455c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: no machine record defined
> >> ld.lld: error: no machine record defined
> >> ld.lld: error: no machine record defined

I am not sure why my patch would cause this problem, I assume it is
merely exposing an existing build failure because it is allowing
configurations to be selected that were previously not selectable.

However, I note that this defconfig is going away so I am guessing this
is not really worth looking into:

https://git.kernel.org/soc/soc/c/9a9e1be12c6d49e15429311714c4b1cc4ddcfe55

Cheers,
Nathan
