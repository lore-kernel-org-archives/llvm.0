Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3FE26B64;
	Tue, 25 Jul 2023 18:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690310008; x=1721846008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lHu070qdOlmao2HpMQK4UwMR3TBVpbXHGDo70GsXpic=;
  b=YOVcqmJ9gBk2rpBA5YxTcFhQeN/jyHqwTFntv2zGAN1jMFP0HZc66fl6
   PMp9WsIm2D+ladsN71AhCYoV66kmeuX+Hy7++gd7b702CagYSkyudI5Fk
   xQouWJDaw+4wVn10tL06ZMDAB59G/s9OEI6Pp8D81F3qSuYth98XSXCys
   Iwk90wUbnn2Qm29yOYBBxf9Pd8XRBN6sqSVs5fGiQjjGSrkehjzUMzZbQ
   Hsn8U/q5Px3LkBJNERZ0Fc9WInpHuzTvodqoRR3N3mHhetbpe9IayxRI/
   PBxL7/pZaJlhmlJlmDyn4HCAFiUrPYq8ug9k5UyMpfkAHjTQ/uPZJp45B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352716712"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="352716712"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 11:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="900055988"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="900055988"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Jul 2023 11:33:24 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOMqZ-0000Dr-2y;
	Tue, 25 Jul 2023 18:33:23 +0000
Date: Wed, 26 Jul 2023 02:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <David.Laight@aculab.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
	'Andrew Morton' <akpm@linux-foundation.org>,
	"'Matthew Wilcox (Oracle)'" <willy@infradead.org>,
	'Christoph Hellwig' <hch@infradead.org>,
	"'Jason A. Donenfeld'" <Jason@zx2c4.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307260256.nzImScXA-lkp@intel.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
config: mips-randconfig-r016-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260256.nzImScXA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260256.nzImScXA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260256.nzImScXA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-mips-cpu.c:288:1: error: call to undeclared function '__typecheck'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     288 | IRQCHIP_DECLARE(cpu_intc, "mti,cpu-interrupt-controller", mips_cpu_irq_of_init);
         | ^
   include/linux/irqchip.h:37:38: note: expanded from macro 'IRQCHIP_DECLARE'
      37 |         OF_DECLARE_2(irqchip, name, compat, typecheck_irq_init_cb(fn))
         |                                             ^
   include/linux/irqchip.h:24:3: note: expanded from macro 'typecheck_irq_init_cb'
      24 |         (__typecheck(typecheck_irq_init_cb, &fn) ? fn : fn)
         |          ^
>> drivers/irqchip/irq-mips-cpu.c:288:1: error: initializer element is not a compile-time constant
     288 | IRQCHIP_DECLARE(cpu_intc, "mti,cpu-interrupt-controller", mips_cpu_irq_of_init);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqchip.h:37:2: note: expanded from macro 'IRQCHIP_DECLARE'
      37 |         OF_DECLARE_2(irqchip, name, compat, typecheck_irq_init_cb(fn))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1493:3: note: expanded from macro 'OF_DECLARE_2'
    1493 |                 _OF_DECLARE(table, name, compat, fn, of_init_fn_2)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1481:2: note: expanded from macro '_OF_DECLARE'
    1481 |         _OF_DECLARE_STUB(table, name, compat, fn, fn_type)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1470:16: note: expanded from macro '_OF_DECLARE_STUB'
    1470 |                      .data = (fn == (fn_type)NULL) ? fn : fn }
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/irqchip/irq-mchp-eic.c:275:1: error: call to undeclared function '__typecheck'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     275 | IRQCHIP_MATCH("microchip,sama7g5-eic", mchp_eic_init)
         | ^
   include/linux/irqchip.h:45:17: note: expanded from macro 'IRQCHIP_MATCH'
      45 |                                     .data = typecheck_irq_init_cb(fn), },
         |                                             ^
   include/linux/irqchip.h:24:3: note: expanded from macro 'typecheck_irq_init_cb'
      24 |         (__typecheck(typecheck_irq_init_cb, &fn) ? fn : fn)
         |          ^
>> drivers/irqchip/irq-mchp-eic.c:275:1: error: initializer element is not a compile-time constant
     275 | IRQCHIP_MATCH("microchip,sama7g5-eic", mchp_eic_init)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqchip.h:45:17: note: expanded from macro 'IRQCHIP_MATCH'
      45 |                                     .data = typecheck_irq_init_cb(fn), },
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqchip.h:24:2: note: expanded from macro 'typecheck_irq_init_cb'
      24 |         (__typecheck(typecheck_irq_init_cb, &fn) ? fn : fn)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/__typecheck +288 drivers/irqchip/irq-mips-cpu.c

0916b46962cbcac arch/mips/kernel/irq_cpu.c     Gabor Juhos       2013-01-31  281  
afe8dc254711b72 arch/mips/kernel/irq_cpu.c     Andrew Bresticker 2014-09-18  282  int __init mips_cpu_irq_of_init(struct device_node *of_node,
0f84c305351c993 arch/mips/kernel/irq_cpu.c     Andrew Bresticker 2014-09-18  283  				struct device_node *parent)
0f84c305351c993 arch/mips/kernel/irq_cpu.c     Andrew Bresticker 2014-09-18  284  {
0f84c305351c993 arch/mips/kernel/irq_cpu.c     Andrew Bresticker 2014-09-18  285  	__mips_cpu_irq_init(of_node);
0916b46962cbcac arch/mips/kernel/irq_cpu.c     Gabor Juhos       2013-01-31  286  	return 0;
0916b46962cbcac arch/mips/kernel/irq_cpu.c     Gabor Juhos       2013-01-31  287  }
892b8cf06d8a1e7 drivers/irqchip/irq-mips-cpu.c Paul Burton       2015-05-24 @288  IRQCHIP_DECLARE(cpu_intc, "mti,cpu-interrupt-controller", mips_cpu_irq_of_init);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
