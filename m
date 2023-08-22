Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DBE7F;
	Tue, 22 Aug 2023 04:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692677032; x=1724213032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qVa2mz+7SAMK1AI7G5hf54O0co/nPIRYwI1Xu5ZS7iI=;
  b=mS8dyGjerqMu+ZQz4oImEOdAg04NJKkqsQgLX1ffyoVmx9Upcdz4n8WS
   tXSJRv5DEQ8goBmUzsIk1Pg6GzE4m/4SsyDd6vc2c19Ob7SDvEMpNG2UY
   ySOfxci8T8Kk4Mk4phwFgagN1akOk84Q6HC9jCD05ppcyCXi0HVJOlAH5
   f8QBkws3FMyLls9mIV3YkWJz+6YejKD645uWX7mZrUjJ/+LaHWFrhO7Me
   C56I8DA0n3Fai2g4a6C6GumsvKhKq/kQG1Z7M+t4xWV2/2LAOy7vEaHG+
   NDr4FIQTUkxoHJxbcvC7vyuNmlHhRZAAdSSRwuA2jSvRVsdZnrThq3ZA1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354101228"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="354101228"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 21:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="909949302"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="909949302"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Aug 2023 21:03:26 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYIc2-0001Ka-0X;
	Tue, 22 Aug 2023 04:03:26 +0000
Date: Tue, 22 Aug 2023 12:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: include/linux/gpio/driver.h:31:19: error: field has incomplete type
 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
Message-ID: <202308221127.sHuxETLk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f7757129e3dea336c407551c98f50057c22bb266
commit: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver
date:   11 months ago
config: i386-buildonly-randconfig-006-20230821 (https://download.01.org/0day-ci/archive/20230822/202308221127.sHuxETLk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221127.sHuxETLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221127.sHuxETLk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/leds/leds-lp8788.c:16:
   In file included from include/linux/mfd/lp8788.h:13:
   In file included from include/linux/gpio.h:62:
   In file included from include/asm-generic/gpio.h:11:
>> include/linux/gpio/driver.h:31:19: error: field has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
           msi_alloc_info_t        msiinfo;
                                   ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
   typedef struct irq_alloc_info msi_alloc_info_t;
                  ^
   1 error generated.
--
   In file included from drivers/leds/leds-pca9532.c:19:
>> include/linux/gpio/driver.h:31:19: error: field has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
           msi_alloc_info_t        msiinfo;
                                   ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
   typedef struct irq_alloc_info msi_alloc_info_t;
                  ^
   drivers/leds/leds-pca9532.c:352:6: warning: variable 'gpios' set but not used [-Wunused-but-set-variable]
           int gpios = 0;
               ^
   1 warning and 1 error generated.
--
>> drivers/base/platform-msi.c:26:20: error: field has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
           msi_alloc_info_t                arg;
                                           ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
   typedef struct irq_alloc_info msi_alloc_info_t;
                  ^
   1 error generated.
--
   In file included from drivers/mmc/host/dw_mmc.c:38:
   In file included from include/linux/of_gpio.h:14:
>> include/linux/gpio/driver.h:31:19: error: field has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
           msi_alloc_info_t        msiinfo;
                                   ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
   typedef struct irq_alloc_info msi_alloc_info_t;
                  ^
   drivers/mmc/host/dw_mmc.c:3040:33: warning: shift count >= width of type [-Wshift-count-overflow]
                           if (!dma_set_mask(host->dev, DMA_BIT_MASK(64)))
                                                        ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   drivers/mmc/host/dw_mmc.c:3042:13: warning: shift count >= width of type [-Wshift-count-overflow]
                                                         DMA_BIT_MASK(64));
                                                         ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   2 warnings and 1 error generated.
--
   In file included from drivers/char/tpm/st33zp24/i2c.c:9:
   In file included from include/linux/gpio.h:62:
   In file included from include/asm-generic/gpio.h:11:
>> include/linux/gpio/driver.h:31:19: error: field has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
           msi_alloc_info_t        msiinfo;
                                   ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
   typedef struct irq_alloc_info msi_alloc_info_t;
                  ^
   In file included from drivers/char/tpm/st33zp24/i2c.c:17:
   In file included from drivers/char/tpm/st33zp24/../tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
   1 warning and 1 error generated.
--
>> kernel/irq/msi.c:585:12: error: incomplete definition of type 'struct irq_alloc_info'
           return arg->hwirq;
                  ~~~^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
   typedef struct irq_alloc_info msi_alloc_info_t;
                  ^
>> kernel/irq/msi.c:591:23: error: invalid application of 'sizeof' to an incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
           memset(arg, 0, sizeof(*arg));
                                ^~~~~~
   arch/x86/include/asm/string_32.h:195:52: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                                                      ^~~~~
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
   typedef struct irq_alloc_info msi_alloc_info_t;
                  ^
   kernel/irq/msi.c:598:5: error: incomplete definition of type 'struct irq_alloc_info'
           arg->desc = desc;
           ~~~^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
   typedef struct irq_alloc_info msi_alloc_info_t;
                  ^
>> kernel/irq/msi.c:858:19: error: variable has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
           msi_alloc_info_t arg = { };
                            ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
   typedef struct irq_alloc_info msi_alloc_info_t;
                  ^
   4 errors generated.
--
>> arch/x86/kernel/hpet.c:520:39: error: incomplete definition of type 'struct irq_alloc_info'
           irq_domain_set_info(domain, virq, arg->hwirq, info->chip, NULL,
                                             ~~~^
   arch/x86/include/asm/io_apic.h:90:8: note: forward declaration of 'struct irq_alloc_info'
   struct irq_alloc_info;
          ^
   arch/x86/kernel/hpet.c:521:28: error: incomplete definition of type 'struct irq_alloc_info'
                               handle_edge_irq, arg->data, "edge");
                                                ~~~^
   arch/x86/include/asm/io_apic.h:90:8: note: forward declaration of 'struct irq_alloc_info'
   struct irq_alloc_info;
          ^
>> arch/x86/kernel/hpet.c:550:6: error: use of undeclared identifier 'x86_vector_domain'
           if (x86_vector_domain == NULL)
               ^
   arch/x86/kernel/hpet.c:577:16: error: use of undeclared identifier 'x86_vector_domain'
           if (parent != x86_vector_domain)
                         ^
>> arch/x86/kernel/hpet.c:598:24: error: variable has incomplete type 'struct irq_alloc_info'
           struct irq_alloc_info info;
                                 ^
   arch/x86/include/asm/io_apic.h:90:8: note: forward declaration of 'struct irq_alloc_info'
   struct irq_alloc_info;
          ^
>> arch/x86/kernel/hpet.c:600:2: error: call to undeclared function 'init_irq_alloc_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           init_irq_alloc_info(&info, NULL);
           ^
>> arch/x86/kernel/hpet.c:601:14: error: use of undeclared identifier 'X86_IRQ_ALLOC_TYPE_HPET'
           info.type = X86_IRQ_ALLOC_TYPE_HPET;
                       ^
   7 errors generated.


vim +31 include/linux/gpio/driver.h

fdd61a013a24f2 Linus Walleij 2019-08-08  27  
91a29af413def6 Marc Zyngier  2022-07-07  28  union gpio_irq_fwspec {
91a29af413def6 Marc Zyngier  2022-07-07  29  	struct irq_fwspec	fwspec;
91a29af413def6 Marc Zyngier  2022-07-07  30  #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
91a29af413def6 Marc Zyngier  2022-07-07 @31  	msi_alloc_info_t	msiinfo;
91a29af413def6 Marc Zyngier  2022-07-07  32  #endif
91a29af413def6 Marc Zyngier  2022-07-07  33  };
91a29af413def6 Marc Zyngier  2022-07-07  34  

:::::: The code at line 31 was first introduced by commit
:::::: 91a29af413def677495e447fb9a06957ebc8bed5 gpio: Remove dynamic allocation from populate_parent_alloc_arg()

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
