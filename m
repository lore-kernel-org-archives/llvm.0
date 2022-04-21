Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90771FA1
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 08:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F5BC385A5;
	Thu, 21 Apr 2022 08:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650529306;
	bh=NAqSDobntwkqjwaH/qn/17ndbF/l0boIVwfnhiCCuc4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bGfqzJCqbJEw44bWcYwnWRbt+w6g8CkUtrfJwyL2e52pfLYkr0DtOSaOLEtLAn8KC
	 3dagNFleFPJFO0RZ20OcooLXeS0WVS91BGQ0lBaWOVXF0k3fLYpd/G9Rcb1x2GKAIR
	 x7mNdg4DiJfnOr6LkpDAM/U4beTd8Yhnah1KrM+WqGleGMZ1D63hHYkcUBRBHcJ7nJ
	 aUzHXJYcfxIfqBOHrMRQP0ondAnQouU5W/8clBqmBToxduazM4Qz4gesHOL7kWkoRd
	 ECy+X5zLCdCmwbk4Q9fRq1zgD6stN53+hylweY54IVXuZDqTRJQLW2mLkrzo6j1mYU
	 qRn13geZzhX5A==
Date: Thu, 21 Apr 2022 10:21:42 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: kernel test robot <lkp@intel.com>, 
    "Daniel J. Ogorchock" <djogorchock@gmail.com>
cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
    linux-kernel@vger.kernel.org
Subject: Re: drivers/hid/hid-nintendo.c:403:29: warning: unused variable
 'JC_RUMBLE_ZERO_AMP_PKT_CNT'
In-Reply-To: <202204211058.3UoweQuz-lkp@intel.com>
Message-ID: <nycvar.YFH.7.76.2204211021050.30217@cbobk.fhfr.pm>
References: <202204211058.3UoweQuz-lkp@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Apr 2022, kernel test robot wrote:

> Hi Daniel,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b253435746d9a4a701b5f09211b9c14d3370d0da
> commit: dad74e18f72a852ae40ad7b4246841a1b7e196b5 HID: nintendo: prevent needless queueing of the rumble worker
> date:   6 months ago
> config: s390-randconfig-c005-20220420 (https://download.01.org/0day-ci/archive/20220421/202204211058.3UoweQuz-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dad74e18f72a852ae40ad7b4246841a1b7e196b5
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout dad74e18f72a852ae40ad7b4246841a1b7e196b5
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ drivers/gpu/drm/amd/display/dc/ drivers/hid/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>                    ^
>    drivers/hid/hid-nintendo.c:51:17: warning: unused variable 'JC_SUBCMD_STATE' [-Wunused-const-variable]
>    static const u8 JC_SUBCMD_STATE                 /*= 0x00*/;

[ ... snip ... ]

Daniel, could you please send a patch that'd comment out the unused ones? 
(i.e. keep them for documentation purposes, but avoid the warning).

Thanks,

-- 
Jiri Kosina
SUSE Labs

