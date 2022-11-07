Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157D1259B;
	Mon,  7 Nov 2022 08:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633EFC433C1;
	Mon,  7 Nov 2022 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667810464;
	bh=vPUGMuhh4vwQGB7vfUji7HjpKe37cpDybwv17Ul9VtQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YYuq9IMfO07xQLYKc2hx3hnNFfrUJ/+/sleJ97Dle7Ns8hhjLRcK63ToCi8CgoDf3
	 /Bw11E/uMCl/DLpOl80Dpp7QYahrHRqkKntfbvN+MfOkVkyLuaPr+HAJlW40/90oQ1
	 dYRXlDGnPVrGiwx/tJc8B0H22yIVD6ZnUDBfeiiJC9tZGHsiqlFT8wmcUDjLN+m3wO
	 lQVRfcU1xF0bxwnG6Lhq5qbR1zXf5QQoqePpzqXWOl7dH3m7VHMrt8oV9c+rim3Fio
	 9fWydxw8xC6s/4IB3Uf+ehCneK07TV7im9D8ZGtWwrP1ITNSJhanMHq/2iDvcrCSWi
	 jDPBPSXy3NY6w==
Message-ID: <1937d7b5-89f4-0cb2-957a-bda2dcbbdb37@kernel.org>
Date: Mon, 7 Nov 2022 10:41:00 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: ld.lld: error: undefined symbol: gpmc_omap_onenand_set_timings
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, kernel test robot <lkp@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <202211050325.XVtPvMvy-lkp@intel.com>
 <402e120a-044e-12ac-7d10-cf8b3b5a1404@kernel.org>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <402e120a-044e-12ac-7d10-cf8b3b5a1404@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/11/2022 21:36, Krzysztof Kozlowski wrote:
> On 04/11/2022 15:29, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   ee6050c8af96bba2f81e8b0793a1fc2f998fcd20
>> commit: 854fd9209b20837ab48c2e6714e5e44dd8ea33a2 memory: omap-gpmc: Allow building as a module
>> date:   6 months ago
>> config: arm-buildonly-randconfig-r004-20221104
>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 2bbafe04fe785a9469bea5a3737f8d7d3ce4aca2)
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # install arm cross compiling tool for clang build
>>         # apt-get install binutils-arm-linux-gnueabi
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=854fd9209b20837ab48c2e6714e5e44dd8ea33a2
>>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>         git fetch --no-tags linus master
>>         git checkout 854fd9209b20837ab48c2e6714e5e44dd8ea33a2
>>         # save the config file
>>         mkdir build_dir && cp config build_dir/.config
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
> 
> +Cc Miquel,
> 
> Hm, I am pretty sure we already fixed it... but it seems not. I think
> this needs dependency in MTD_ONENAND_OMAP2 - one is module, second
> cannot be built-in.

We fixed MTD_NAND_OMAP2 but missed this MTD_ONENAND_OMAP2.

I'll send out a patch soon.

cheers,
-roger
