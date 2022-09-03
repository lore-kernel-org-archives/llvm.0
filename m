Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD317E
	for <llvm@lists.linux.dev>; Sat,  3 Sep 2022 14:31:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8348E848E7;
	Sat,  3 Sep 2022 16:31:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1662215471;
	bh=JahiYkuQtdXX+xs/59sW9IFMIGdWvTGUyT+A+Y0gD4g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=esa3eVwCO0HGOcU4PiY/tH4xMKn4fo8/oI3Zx1bfwHZpHTrL1t8Be9O5idpOShUEk
	 Ilw6QU+tjTV5UgZviD+SY/VYogUWIPtyYhEjSKqFD+s0uG+mD9PkV3o+g8QnF5kma6
	 qHvMX7x30yT5vP0gl+FU5cVRj034yTPYoWNb/3QElCFC/xSHa4XV07rXeXCSiQ84VJ
	 iSbw4MTJvP4TsH+pIyiVJ/0mcyV0qBAAzUL//X7vqLUIilE06Y3+rOtMJLAhb5qzbK
	 u73ZFjw0aJsHlDeQpZwVjybXzCMlTSQv5yK1oScG0YRlTVpb3PuXKPhyb9YMkvEKx8
	 OYeB6zregcv4Q==
Message-ID: <92d78ac2-c32a-cd19-891c-7bac77725b84@denx.de>
Date: Sat, 3 Sep 2022 16:31:10 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [linux-next:master 2262/4736]
 drivers/extcon/extcon-usbc-tusb320.c:19: warning: expecting prototype for
 drivers/extcon/extcon-tusb320.c(). Prototype was for TUSB320_REG8() instead
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?Q?Alvin_=c5=a0ipraga?=
 <alsi@bang-olufsen.dk>
References: <202209030755.eB4SkwGE-lkp@intel.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <202209030755.eB4SkwGE-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean

On 9/3/22 01:21, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
> commit: 822a6200734c94ccbfc9ae7acc5da5505b991515 [2262/4736] extcon: usbc-tusb320: Add USB TYPE-C support
> config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220903/202209030755.eB4SkwGE-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=822a6200734c94ccbfc9ae7acc5da5505b991515
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>          git fetch --no-tags linux-next master
>          git checkout 822a6200734c94ccbfc9ae7acc5da5505b991515
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/extcon/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/extcon/extcon-usbc-tusb320.c:19: warning: expecting prototype for drivers/extcon/extcon-tusb320.c(). Prototype was for TUSB320_REG8() instead
> 
> 
> vim +19 drivers/extcon/extcon-usbc-tusb320.c
> 
>      18	
>    > 19	#define TUSB320_REG8				0x8
>      20	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE	GENMASK(7, 6)
>      21	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_USB	0x0
>      22	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_15A	0x1
>      23	#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_30A	0x2
>      24	#define TUSB320_REG8_CURRENT_MODE_DETECT	GENMASK(5, 4)
>      25	#define TUSB320_REG8_CURRENT_MODE_DETECT_DEF	0x0
>      26	#define TUSB320_REG8_CURRENT_MODE_DETECT_MED	0x1
>      27	#define TUSB320_REG8_CURRENT_MODE_DETECT_ACC	0x2
>      28	#define TUSB320_REG8_CURRENT_MODE_DETECT_HI	0x3
>      29	#define TUSB320_REG8_ACCESSORY_CONNECTED	GENMASK(3, 2)
>      30	#define TUSB320_REG8_ACCESSORY_CONNECTED_NONE	0x0
>      31	#define TUSB320_REG8_ACCESSORY_CONNECTED_AUDIO	0x4
>      32	#define TUSB320_REG8_ACCESSORY_CONNECTED_ACC	0x5
>      33	#define TUSB320_REG8_ACCESSORY_CONNECTED_DEBUG	0x6
>      34	#define TUSB320_REG8_ACTIVE_CABLE_DETECTION	BIT(0)
>      35	

I still believe this is a false positive, is it not ?
