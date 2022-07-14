Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808B74C64
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 16:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAE4C341C6;
	Thu, 14 Jul 2022 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657817691;
	bh=Cng392Dex3y54h/Q+nS54+LMNemu3TLY+4940766zV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qu9BpfEz3fuIE3p9A7wxrCkJW0wXTyTk4ge/UnO/t6MKdsaVRWIvNWN/8TTF9fJRN
	 WjzzIwRhiFg6yhiVpHaPhpjefIk+g6vZjesNkOCWPKfIq+LwSpY/vt8FdV28NoRmlf
	 L8NZ3MdXrHFbj4hRAJvlJn2uB3arEA6lpjBwP2mUb2T36Hv+ktTR8gfsHK75Z1Hqp3
	 hwgKEE0PSeXldSilx1qW68KuKcJwpWklrUPqVsVbRFxTmXeTiqSOoEXRPs7sEDCSFg
	 sIcWBHBCV4fcm3cCn4L3RxwEpvGiPR0ez+H+l7V6s4/eP8ERyqBrAWFi62/rc59fa1
	 9SDDoJa2Z24uw==
Date: Thu, 14 Jul 2022 09:54:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Robert Foss <robert.foss@linaro.org>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [linux-next:master 7409/10678]
 drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is not a
 compile-time constant
Message-ID: <YtBKWDIaU9Z59CEm@dev-arch.thelio-3990X>
References: <202207150057.s8huMpLd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202207150057.s8huMpLd-lkp@intel.com>

On Fri, Jul 15, 2022 at 12:52:49AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
> commit: 160758b05ab1679dae83c7facf312b60dd263308 [7409/10678] clk: qcom: add support for SM8350 GPUCC
> config: arm-randconfig-r023-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150057.s8huMpLd-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=160758b05ab1679dae83c7facf312b60dd263308
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 160758b05ab1679dae83c7facf312b60dd263308
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is not a compile-time constant
>            gpu_cc_parent,
>            ^~~~~~~~~~~~~
>    drivers/clk/qcom/gpucc-sm8350.c:126:2: error: initializer element is not a compile-time constant
>            gpu_cc_parent,
>            ^~~~~~~~~~~~~
>    2 errors generated.

https://lore.kernel.org/20220711174004.3047516-1-nathan@kernel.org/

Cheers,
Nathan
