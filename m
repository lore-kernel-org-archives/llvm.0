Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D448CAD25;
	Fri,  4 Nov 2022 19:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF6FC433C1;
	Fri,  4 Nov 2022 19:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667590601;
	bh=Z0bYXd1PXXR1duu7Os23/ytIJQhUy+2FFbwAjwuBUzg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nKnmSOwP9XUZYxIDrLBkVtgFcefi1qR7q/4w8rAslbwljlbQTH+7WImdYzthLm0Xa
	 17DZ2WLVysxGlcjShYeFp7utUCDLjYXhNDVh+iopmgywheX3kA+eAmRNBLDpZtGkG8
	 6J+rp3lzMMBM/KAsjFbxWrDMN5zmS41DpGanZJxl6PncE/EhVWNBsPd5S6a8vITXfI
	 JtPIrE+kqQlM8nMv5ebVHZcBApE3JyZqIj3WRhs8kQ28mD74rVic41urPf0OhLmMfr
	 esbt20nMyTQcA1ajha4VZKVEvxw8BACOEp7pgFBgNMYkNXpKMNdKkYoaNJ3gv/sGTE
	 tb+7pksHnci+Q==
Message-ID: <402e120a-044e-12ac-7d10-cf8b3b5a1404@kernel.org>
Date: Fri, 4 Nov 2022 15:36:39 -0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: ld.lld: error: undefined symbol: gpmc_omap_onenand_set_timings
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Roger Quadros <rogerq@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <202211050325.XVtPvMvy-lkp@intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <202211050325.XVtPvMvy-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2022 15:29, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ee6050c8af96bba2f81e8b0793a1fc2f998fcd20
> commit: 854fd9209b20837ab48c2e6714e5e44dd8ea33a2 memory: omap-gpmc: Allow building as a module
> date:   6 months ago
> config: arm-buildonly-randconfig-r004-20221104
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 2bbafe04fe785a9469bea5a3737f8d7d3ce4aca2)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=854fd9209b20837ab48c2e6714e5e44dd8ea33a2
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 854fd9209b20837ab48c2e6714e5e44dd8ea33a2
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>

+Cc Miquel,

Hm, I am pretty sure we already fixed it... but it seems not. I think
this needs dependency in MTD_ONENAND_OMAP2 - one is module, second
cannot be built-in.

Best regards,
Krzysztof

