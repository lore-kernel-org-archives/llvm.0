Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9C27E
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 06:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BD2C385A4;
	Tue, 26 Apr 2022 06:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650956173;
	bh=tUoudyOyw/bf8Z+w9m+kTM5pokDjoOIhgz/jJmrp7tY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VRfOG5QL3OvM6vSCx2v+GonIZpx4KC8Ji2ICcFNrSccGZt+MWEJ5dhRPbnMaRopSU
	 bM5ystHBKFpaBjtstKQfMMGcQ0CCx6PtHq7MGV8VQtDdxx6F1ZxL4gx6Dpt4jug7vJ
	 sSmx3ndCtawoWRH9rxOKRUHuSXsOB8NrGcCK5WYPaweZYyUKvltn+hTEzUBUpupBUN
	 PlwFbAgKxS7PmteX9gKCb4Q4hNabqcnE8CSPlsqnMUWy1AIeaX4TG8ArfOYYsE7QRw
	 161B/e2kx5MJ2/bLE+3KVyt1wIi9+rRH6bjGdrIel2lC/N6MObO0PT/8S7Rk24GKN3
	 SsW2EHonqN6Pg==
Message-ID: <15dcf5b4-a5ee-66b8-2762-db7728c9928c@kernel.org>
Date: Tue, 26 Apr 2022 08:56:08 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [soc:arm/multiplatform-late 13/18]
 arch/arm/mach-s3c/s3c24xx.c:683:9: warning: The platform is deprecated and
 scheduled for removal. Please reach to the maintainers of the platform and
 linux-samsung-soc@vger.kernel.org if you still use it.Without such feedback,
 the platform will be removed...
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
References: <202204261130.D9GY2vp9-lkp@intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <202204261130.D9GY2vp9-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/04/2022 05:24, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/multiplatform-late
> head:   4894b187da71512fa656294ca916e7e73aa3243e
> commit: 6a5e69c7ddeacbfcab1ffe501c32e21d7989c0f8 [13/18] ARM: s3c: mark as deprecated and schedule removal
> config: arm-s3c2410_defconfig (https://download.01.org/0day-ci/archive/20220426/202204261130.D9GY2vp9-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=6a5e69c7ddeacbfcab1ffe501c32e21d7989c0f8
>         git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
>         git fetch --no-tags soc arm/multiplatform-late
>         git checkout 6a5e69c7ddeacbfcab1ffe501c32e21d7989c0f8
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    arch/arm/mach-s3c/s3c24xx.c:177:16: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
>            unsigned long tmp = 0;
>                          ^
>>> arch/arm/mach-s3c/s3c24xx.c:683:9: warning: The platform is deprecated and scheduled for removal. Please reach to the maintainers of the platform and linux-samsung-soc@vger.kernel.org if you still use it.Without such feedback, the platform will be removed after 2022. [-W#pragma-messages]
>    #pragma message "The platform is deprecated and scheduled for removal. " \

This pragma is in purpose, so -W#pragma-messages is not helpful. The
message will stay for 1 year here and ~2 years in s3c64xx.

Best regards,
Krzysztof
