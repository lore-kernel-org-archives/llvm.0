Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C24228E8;
	Mon,  7 Nov 2022 08:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0197EC433D6;
	Mon,  7 Nov 2022 08:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667810590;
	bh=c9Fcsd9awmFUgXdUD43LmU8VxDOSHmhYtxezPOps+vg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V/tkCup0quN9nI3tyC7fZUTz0crQvZoq3VcI5mZucS5nZKwSxUgFqMGcN0VpMFsDM
	 Ckp/xG+cs/B4Ra2qPen9jJgoFmSLHXD0DvI+zw6R5Kbze8dIfDo6Cf2QS87kOADHep
	 nn5Mm2QS0UdBqH0jx89HF+ILw/+8qPFPMnvb2UvYbkuG1rITXNpb/wEx+qg5FvohWL
	 T+eBK0KGalhJ8b9wrcuzOzbym4iWk/WKa6Msm/QeXm6MDg+syextl+ctRzr8W4bepX
	 wZYVY8UQh5/qehVIT/GqzqzX+sBTaCR8JQOa82YgZQodjkBvdFrwSKuqBnc9IEf8Ai
	 3CkY8pNqpS0BA==
Message-ID: <ebc2fb50-39d1-4e3e-b108-8907af4853d1@kernel.org>
Date: Mon, 7 Nov 2022 10:43:06 +0200
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
 <1937d7b5-89f4-0cb2-957a-bda2dcbbdb37@kernel.org>
 <118ef884-de2e-3bd3-4888-f9154e5a300e@kernel.org>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <118ef884-de2e-3bd3-4888-f9154e5a300e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/11/2022 10:42, Krzysztof Kozlowski wrote:
> On 07/11/2022 09:41, Roger Quadros wrote:
>>
>>
>> On 04/11/2022 21:36, Krzysztof Kozlowski wrote:
>>> On 04/11/2022 15:29, kernel test robot wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>>> head:   ee6050c8af96bba2f81e8b0793a1fc2f998fcd20
>>>> commit: 854fd9209b20837ab48c2e6714e5e44dd8ea33a2 memory: omap-gpmc: Allow building as a module
>>>> date:   6 months ago
>>>> config: arm-buildonly-randconfig-r004-20221104
>>>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 2bbafe04fe785a9469bea5a3737f8d7d3ce4aca2)
>>>> reproduce (this is a W=1 build):
>>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>>         chmod +x ~/bin/make.cross
>>>>         # install arm cross compiling tool for clang build
>>>>         # apt-get install binutils-arm-linux-gnueabi
>>>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=854fd9209b20837ab48c2e6714e5e44dd8ea33a2
>>>>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>>         git fetch --no-tags linus master
>>>>         git checkout 854fd9209b20837ab48c2e6714e5e44dd8ea33a2
>>>>         # save the config file
>>>>         mkdir build_dir && cp config build_dir/.config
>>>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
>>>>
>>>> If you fix the issue, kindly add following tag where applicable
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> +Cc Miquel,
>>>
>>> Hm, I am pretty sure we already fixed it... but it seems not. I think
>>> this needs dependency in MTD_ONENAND_OMAP2 - one is module, second
>>> cannot be built-in.
>>
>> We fixed MTD_NAND_OMAP2 but missed this MTD_ONENAND_OMAP2.
>>
>> I'll send out a patch soon.
> 
> I already sent a patch for this. Can you review it?

Just saw it after I replied to this one :)
Thanks! I'll review it.

cheers,
-roger
