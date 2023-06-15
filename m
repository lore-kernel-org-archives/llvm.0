Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09D2378;
	Thu, 15 Jun 2023 00:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B468AC433C8;
	Thu, 15 Jun 2023 00:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686789689;
	bh=zINlbOLcmi23A8TvOB0XNKacGTc7QtrfnEwM7KVFRys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ki29Z04tlzlrWAIoT+H7bcz5fa+cAliXqfWIrs2kw+AasRXJneuc01CSJBuZlAEGF
	 Fn70rT4qsge5m/8aq0hsQr07xMHvntgEWsxU/IwQPph7eGlNUB4oWG0sm/ZPlCnhKE
	 HRVTN70LnFyCZ6oxVUL2n3gNZSqJ5W5qYLw9h7VWhExBvIaCNKCD6/SmA1ZSsQldc3
	 rdb5m0bocYqcw8BW6YNIR2N8m+9CeehfsfBX+f/Ketz6NXoOmWIcZHtglxRWBTKqZl
	 tkhqMMkJKRZf6hf7c89Bp4Ib9Cf5wsSojHABzgPAwNFRtPN1sIjtrbVXsHm6yaE3c+
	 YYbfetHu609EA==
Message-ID: <9be724b6-9b3c-51fd-ca20-634603a9145e@kernel.org>
Date: Thu, 15 Jun 2023 09:41:27 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [linux-next:master 9063/9793] drivers/ata/pata_octeon_cf.c:835:7:
 error: call to undeclared function 'of_property_read_reg'; ISO C99 and later
 do not support implicit function declarations
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>
References: <202306141702.ZaO9V2lk-lkp@intel.com>
 <ff92e980-a531-d37e-448d-c85a106a725a@kernel.org>
 <CAL_JsqLjp-hSULp8xFb1zpwdO7OdYDwH+XtgRjhsKfG2R-0Z3g@mail.gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <CAL_JsqLjp-hSULp8xFb1zpwdO7OdYDwH+XtgRjhsKfG2R-0Z3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/15/23 00:26, Rob Herring wrote:
> On Wed, Jun 14, 2023 at 3:41 AM Damien Le Moal <dlemoal@kernel.org> wrote:
>>
>> On 6/14/23 18:23, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   b16049b21162bb649cdd8519642a35972b7910fe
>>> commit: d0b2461678b12c08d43eaf6740485e2f2c3aeac6 [9063/9793] ata: Use of_property_read_reg() to parse "reg"
>>> config: mips-randconfig-r016-20230614 (https://download.01.org/0day-ci/archive/20230614/202306141702.ZaO9V2lk-lkp@intel.com/config)
>>> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
>>> reproduce (this is a W=1 build):
>>>         mkdir -p ~/bin
>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>         chmod +x ~/bin/make.cross
>>>         # install mips cross compiling tool for clang build
>>>         # apt-get install binutils-mips64-linux-gnuabi64
>>>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d0b2461678b12c08d43eaf6740485e2f2c3aeac6
>>>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>>         git fetch --no-tags linux-next master
>>>         git checkout d0b2461678b12c08d43eaf6740485e2f2c3aeac6
>>>         # save the config file
>>>         mkdir build_dir && cp config build_dir/.config
>>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
>>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/ata/
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202306141702.ZaO9V2lk-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> drivers/ata/pata_octeon_cf.c:835:7: error: call to undeclared function 'of_property_read_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>>      835 |         rv = of_property_read_reg(node, 0, &reg, NULL);
>>
>> Rob,
>>
>> I guess this is missing:
>>
>> diff --git a/drivers/ata/pata_octeon_cf.c b/drivers/ata/pata_octeon_cf.c
>> index 57b2166a6d5d..ff538b858928 100644
>> --- a/drivers/ata/pata_octeon_cf.c
>> +++ b/drivers/ata/pata_octeon_cf.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/slab.h>
>>  #include <linux/irq.h>
>>  #include <linux/of.h>
>> +#include <linux/of_address.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>>  #include <scsi/scsi_host.h>
>>
>> I can add that if you want. Or you can send a fix and I will queue it,
>> whichever is fine.
> 
> If you can fix it up, that would be great.

Done.

> I'll look into whether this can be made easier to reproduce. These
> patches had been on a branch and picked up by 0-day. There must be
> some implicit include of of_address.h somewhere.

I looked into enabling compile test with removing the MIPS dependency to make
sure this driver also goes through my regular compile tests (I am lazy, I do
x86_64 only :)).

Something like this works for ahci_octeon:

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index 4572f837e504..6b115685a86e 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -239,7 +239,7 @@ config AHCI_MVEBU

 config AHCI_OCTEON
        tristate "Cavium Octeon Soc Serial ATA"
-       depends on SATA_AHCI_PLATFORM && MIPS && (CAVIUM_OCTEON_SOC || COMPILE_TEST)
+       depends on SATA_AHCI_PLATFORM && ((MIPS && CAVIUM_OCTEON_SOC) ||
COMPILE_TEST)
        default y
        help
          This option enables support for Cavium Octeon SoC Serial ATA.
diff --git a/drivers/ata/ahci_octeon.c b/drivers/ata/ahci_octeon.c
index 5021ab3ede49..2e6b28bf43f4 100644
--- a/drivers/ata/ahci_octeon.c
+++ b/drivers/ata/ahci_octeon.c
@@ -15,8 +15,13 @@
 #include <linux/platform_device.h>
 #include <linux/of_platform.h>

+#ifdef CONFIG_MIPS
 #include <asm/octeon/octeon.h>
 #include <asm/bitfield.h>
+#else
+#define cvmx_readq_csr(csr)            (0)
+#define cvmx_writeq_csr(csr, cfg)      do { } while (0)
+#endif

 #define CVMX_SATA_UCTL_SHIM_CFG                0xE8

But it is not that simple for pata_octeon...

> 
> Rob

-- 
Damien Le Moal
Western Digital Research

