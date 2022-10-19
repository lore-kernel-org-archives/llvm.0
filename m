Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF1F7E
	for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 07:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE8DC433D6;
	Wed, 19 Oct 2022 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666166140;
	bh=RTY/trpj8Py1PZUWZvYNvUTGJi8ec+vO0y7IVSJA1FI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pD0kdoEX/NVCadYyetvdBt4/GCPaFHDtJEUwkNCuRKG7t4Xip48FEq1Ozqekr7Xie
	 JrAf617uyaCQwkPcfG1G2+7qD7xjO/bUuJ78S17VAzLTtq96bDZ2rCCg7yRYAq0naJ
	 l0ywEEA4EuMphT1VSzyCnV7nb72cJwZtOw++dkPZYS/aB3CoEjZ+WuCNc/qdr6vaHK
	 fYka47lD4jW5TkmYOB67E6nBxelC551FIBpNV1V5/y1djpzuTeN4HOd2iUvJdjWfDV
	 kCIL5dtGpeYRpjR+AKGjNuIgWG5OxWhDHA+0iVI/vMXXsLp3b5ljHglFBms8JEPuME
	 67ku+ZCJ+Iu0A==
From: Kalle Valo <kvalo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Tomislav =?utf-8?Q?Po=C5=BEega?= <pozega.tomislav@gmail.com>,
  llvm@lists.linux.dev,  kbuild-all@lists.01.org,
  linux-kernel@vger.kernel.org,  Daniel Golle <daniel@makrotopia.org>,
 Jason A. Donenfeld <Jason@zx2c4.com>,
    linux-wireless@vger.kernel.org
Subject: Re: drivers/net/wireless/ralink/rt2x00/rt2800lib.c:9439:15: warning: result of comparison of constant -7 with expression of type 'char' is always false
References: <202210191553.vO9rtKe5-lkp@intel.com>
Date: Wed, 19 Oct 2022 10:55:35 +0300
In-Reply-To: <202210191553.vO9rtKe5-lkp@intel.com> (kernel test robot's
	message of "Wed, 19 Oct 2022 15:46:42 +0800")
Message-ID: <87pmeol020.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

+ jason, linux-wireless

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   aae703b02f92bde9264366c545e87cec451de471
> commit: dab902fe1d29dc0fa1dccc8d13dc89ffbf633881 wifi: rt2x00: add TX
> LOFT calibration for MT7620
> date:   4 weeks ago
> config: arm64-allmodconfig
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project
> 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         #
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dab902fe1d29dc0fa1dccc8d13dc89ffbf633881
>         git remote add linus
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout dab902fe1d29dc0fa1dccc8d13dc89ffbf633881
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
> O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/
> drivers/net/wireless/ralink/rt2x00/ drivers/staging/media/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/net/wireless/ralink/rt2x00/rt2800lib.c:9439:15: warning:
>> result of comparison of constant -7 with expression of type 'char'
>> is always false [-Wtautological-constant-out-of-range-compare]
>            gerr = (gerr < -0x07) ? -0x07 : (gerr > 0x05) ? 0x05 : gerr;
>                    ~~~~ ^ ~~~~~
>    drivers/net/wireless/ralink/rt2x00/rt2800lib.c:9443:15: warning: result of comparison of constant -31 with expression of type 'char' is always false [-Wtautological-constant-out-of-range-compare]
>            perr = (perr < -0x1f) ? -0x1f : (perr > 0x1d) ? 0x1d : perr;
>                    ~~~~ ^ ~~~~~
>    2 warnings generated.

I believe this patch should fix it:

https://patchwork.kernel.org/project/linux-wireless/patch/20221018202734.140489-1-Jason@zx2c4.com/

Jason, is my understanding correct?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
