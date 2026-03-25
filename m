Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314193CFF49;
	Wed, 25 Mar 2026 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446378; cv=none; b=qY+b8MxKGjWtT30OS85sbF4MWSsuGtgfJtX5weQGm7ClwilWF/7pn3/ZPcecQJMMC0TnB4bGxqlccRVWA3eNYXGhzqYmC8IbAcT4MQLKgKM6vy7p28LOSAosO1PltwzLYgVY7q/HrVi31wceOC3OQpk3lOdN/LJuYNPIPn5s70s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446378; c=relaxed/simple;
	bh=K6An0K3Pofgp/hV5KO1Ax0ARKFYixoIb3EdwxkIM0d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqcciuiHjKFMRQSG15J+y3xfiI7zYwC51Uwq2rUiSVEeLLQQaskVwf0LTaVLmIEXuoSvKQ78GMvCbjPTquunWRtdnXxM5HF0RTOZYb2mvegOG2Pideend3376krgUrlPZItlGcWiVrQa4rxIh8bV6UgwWvFSHgFNQTrORkKd4dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Um5pgr+s; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Um5pgr+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774446377; x=1805982377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=K6An0K3Pofgp/hV5KO1Ax0ARKFYixoIb3EdwxkIM0d8=;
  b=Um5pgr+sB4yGj4Y1N9kYSeBdQe45eHI189bhLKpzezFTs2++EbVnCs6A
   cBFVz3g+/ohaVcB6v8kviL5g4Ap+Wo5Q/IxIeGtyVSeL30jkQHC2ZifaO
   gKSFtMDEgcklEaRd5cPvrh9uI9IC6NzqrC80V6JS/W/Avu6NmqJP1mCR6
   b33FX+xwR2+1kiO3m2x5mxNwAtf/DxDkauHBKfhJn93u0vHnJ1l/bQuu5
   wJSKs2oNRWggS5QTv0NEbVtd74UN5U4CQap0G8q9Jdgq/FIcwG03Zbw9K
   QtFqE8XNoHG8APAxqJWxa7CqZZ5odRxMlAfl8XnuwWCgS4hGQgY1YJFdQ
   A==;
X-CSE-ConnectionGUID: 7eyTGvY/TFuGlIgor3ik5w==
X-CSE-MsgGUID: PU0+Ja+FQcefq0RKGatomQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79082128"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79082128"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:36:52 -0700
X-CSE-ConnectionGUID: 4FJWrfOnRb6lB7EFcc4zLQ==
X-CSE-MsgGUID: SCtanwrKTzWi5iKApOEg+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="228749150"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Mar 2026 06:36:48 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5OPd-00000000705-2sLi;
	Wed, 25 Mar 2026 13:36:45 +0000
Date: Wed, 25 Mar 2026 21:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Subject: Re: [PATCH] ASoC: SDCA: Write init table on function status IRQ
Message-ID: <202603252109.uP5pmwdI-lkp@intel.com>
References: <20260324-sdca-function-status-init-irq-v1-1-bba49417a4e0@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324-sdca-function-status-init-irq-v1-1-bba49417a4e0@gmail.com>

Hi Cássio,

kernel test robot noticed the following build errors:

[auto build test ERROR on 834f16f74d88054df215eebef09ad864c7e5977c]

url:    https://github.com/intel-lab-lkp/linux/commits/C-ssio-Gabriel/ASoC-SDCA-Write-init-table-on-function-status-IRQ/20260325-094213
base:   834f16f74d88054df215eebef09ad864c7e5977c
patch link:    https://lore.kernel.org/r/20260324-sdca-function-status-init-irq-v1-1-bba49417a4e0%40gmail.com
patch subject: [PATCH] ASoC: SDCA: Write init table on function status IRQ
config: x86_64-randconfig-003-20260325 (https://download.01.org/0day-ci/archive/20260325/202603252109.uP5pmwdI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603252109.uP5pmwdI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603252109.uP5pmwdI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sdca/sdca_interrupts.c:148:3: error: cannot jump from switch statement to this case label
     148 |                 case SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET:
         |                 ^
   sound/soc/sdca/sdca_interrupts.c:127:4: note: jump bypasses initialization of variable with __attribute__((cleanup))
     127 |                         guard(mutex)(interrupt->init_lock);
         |                         ^
   include/linux/cleanup.h:419:2: note: expanded from macro 'guard'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:300:3: note: expanded from macro 'CLASS'
     300 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:65:1: note: expanded from here
      65 | class_mutex_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:71:1: note: expanded from here
      71 | __UNIQUE_ID_unlock_454
         | ^
   sound/soc/sdca/sdca_interrupts.c:127:4: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/cleanup.h:419:15: note: expanded from macro 'guard'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:59:1: note: expanded from here
      59 | __UNIQUE_ID_guard_453
         | ^
   sound/soc/sdca/sdca_interrupts.c:147:3: error: cannot jump from switch statement to this case label
     147 |                 case SDCA_CTL_ENTITY_0_STREAMING_STOPPED_ABNORMALLY:
         |                 ^
   sound/soc/sdca/sdca_interrupts.c:127:4: note: jump bypasses initialization of variable with __attribute__((cleanup))
     127 |                         guard(mutex)(interrupt->init_lock);
         |                         ^
   include/linux/cleanup.h:419:2: note: expanded from macro 'guard'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:300:3: note: expanded from macro 'CLASS'
     300 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:65:1: note: expanded from here
      65 | class_mutex_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:71:1: note: expanded from here
      71 | __UNIQUE_ID_unlock_454
         | ^
   sound/soc/sdca/sdca_interrupts.c:127:4: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/cleanup.h:419:15: note: expanded from macro 'guard'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:59:1: note: expanded from here
      59 | __UNIQUE_ID_guard_453
         | ^
   sound/soc/sdca/sdca_interrupts.c:146:3: error: cannot jump from switch statement to this case label
     146 |                 case SDCA_CTL_ENTITY_0_INTS_DISABLED_ABNORMALLY:
         |                 ^
   sound/soc/sdca/sdca_interrupts.c:127:4: note: jump bypasses initialization of variable with __attribute__((cleanup))
     127 |                         guard(mutex)(interrupt->init_lock);
         |                         ^
   include/linux/cleanup.h:419:2: note: expanded from macro 'guard'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:300:3: note: expanded from macro 'CLASS'
     300 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:65:1: note: expanded from here
      65 | class_mutex_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^


vim +148 sound/soc/sdca/sdca_interrupts.c

b126394d9ec6f9 Maciej Strozek 2025-06-24   91  
b9ab3b61824190 Charles Keepax 2025-06-24   92  static irqreturn_t function_status_handler(int irq, void *data)
b9ab3b61824190 Charles Keepax 2025-06-24   93  {
b9ab3b61824190 Charles Keepax 2025-06-24   94  	struct sdca_interrupt *interrupt = data;
dfe7c3401ed3d3 Charles Keepax 2025-10-20   95  	struct device *dev = interrupt->dev;
907364ea3db475 Charles Keepax 2025-10-20   96  	irqreturn_t irqret = IRQ_NONE;
b9ab3b61824190 Charles Keepax 2025-06-24   97  	unsigned int reg, val;
b9ab3b61824190 Charles Keepax 2025-06-24   98  	unsigned long status;
b9ab3b61824190 Charles Keepax 2025-06-24   99  	unsigned int mask;
b9ab3b61824190 Charles Keepax 2025-06-24  100  	int ret;
b9ab3b61824190 Charles Keepax 2025-06-24  101  
907364ea3db475 Charles Keepax 2025-10-20  102  	ret = pm_runtime_get_sync(dev);
907364ea3db475 Charles Keepax 2025-10-20  103  	if (ret < 0) {
907364ea3db475 Charles Keepax 2025-10-20  104  		dev_err(dev, "failed to resume for function status: %d\n", ret);
907364ea3db475 Charles Keepax 2025-10-20  105  		goto error;
907364ea3db475 Charles Keepax 2025-10-20  106  	}
907364ea3db475 Charles Keepax 2025-10-20  107  
b9ab3b61824190 Charles Keepax 2025-06-24  108  	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
b9ab3b61824190 Charles Keepax 2025-06-24  109  			   interrupt->control->sel, 0);
b9ab3b61824190 Charles Keepax 2025-06-24  110  
dfe7c3401ed3d3 Charles Keepax 2025-10-20  111  	ret = regmap_read(interrupt->function_regmap, reg, &val);
b9ab3b61824190 Charles Keepax 2025-06-24  112  	if (ret < 0) {
b9ab3b61824190 Charles Keepax 2025-06-24  113  		dev_err(dev, "failed to read function status: %d\n", ret);
907364ea3db475 Charles Keepax 2025-10-20  114  		goto error;
b9ab3b61824190 Charles Keepax 2025-06-24  115  	}
b9ab3b61824190 Charles Keepax 2025-06-24  116  
b9ab3b61824190 Charles Keepax 2025-06-24  117  	dev_dbg(dev, "function status: %#x\n", val);
b9ab3b61824190 Charles Keepax 2025-06-24  118  
b9ab3b61824190 Charles Keepax 2025-06-24  119  	status = val;
b9ab3b61824190 Charles Keepax 2025-06-24  120  	for_each_set_bit(mask, &status, BITS_PER_BYTE) {
b9ab3b61824190 Charles Keepax 2025-06-24  121  		mask = 1 << mask;
b9ab3b61824190 Charles Keepax 2025-06-24  122  
b9ab3b61824190 Charles Keepax 2025-06-24  123  		switch (mask) {
b9ab3b61824190 Charles Keepax 2025-06-24  124  		case SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION:
d5a290177c76b9 Cássio Gabriel 2026-03-24  125  			dev_dbg(dev, "write initialization\n");
d5a290177c76b9 Cássio Gabriel 2026-03-24  126  
d5a290177c76b9 Cássio Gabriel 2026-03-24  127  			guard(mutex)(interrupt->init_lock);
d5a290177c76b9 Cássio Gabriel 2026-03-24  128  
d5a290177c76b9 Cássio Gabriel 2026-03-24  129  			ret = sdca_regmap_write_init(dev, interrupt->device_regmap,
d5a290177c76b9 Cássio Gabriel 2026-03-24  130  						     interrupt->function);
d5a290177c76b9 Cássio Gabriel 2026-03-24  131  			if (ret) {
d5a290177c76b9 Cássio Gabriel 2026-03-24  132  				dev_err(dev, "failed to write initialization: %d\n", ret);
d5a290177c76b9 Cássio Gabriel 2026-03-24  133  				goto error;
d5a290177c76b9 Cássio Gabriel 2026-03-24  134  			}
b9ab3b61824190 Charles Keepax 2025-06-24  135  			break;
b9ab3b61824190 Charles Keepax 2025-06-24  136  		case SDCA_CTL_ENTITY_0_FUNCTION_FAULT:
b9ab3b61824190 Charles Keepax 2025-06-24  137  			dev_err(dev, "function fault\n");
b9ab3b61824190 Charles Keepax 2025-06-24  138  			break;
b9ab3b61824190 Charles Keepax 2025-06-24  139  		case SDCA_CTL_ENTITY_0_UMP_SEQUENCE_FAULT:
b9ab3b61824190 Charles Keepax 2025-06-24  140  			dev_err(dev, "ump sequence fault\n");
b9ab3b61824190 Charles Keepax 2025-06-24  141  			break;
b9ab3b61824190 Charles Keepax 2025-06-24  142  		case SDCA_CTL_ENTITY_0_FUNCTION_BUSY:
b9ab3b61824190 Charles Keepax 2025-06-24  143  			dev_info(dev, "unexpected function busy\n");
b9ab3b61824190 Charles Keepax 2025-06-24  144  			break;
b9ab3b61824190 Charles Keepax 2025-06-24  145  		case SDCA_CTL_ENTITY_0_DEVICE_NEWLY_ATTACHED:
b9ab3b61824190 Charles Keepax 2025-06-24  146  		case SDCA_CTL_ENTITY_0_INTS_DISABLED_ABNORMALLY:
b9ab3b61824190 Charles Keepax 2025-06-24  147  		case SDCA_CTL_ENTITY_0_STREAMING_STOPPED_ABNORMALLY:
b9ab3b61824190 Charles Keepax 2025-06-24 @148  		case SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET:
b9ab3b61824190 Charles Keepax 2025-06-24  149  			break;
b9ab3b61824190 Charles Keepax 2025-06-24  150  		}
b9ab3b61824190 Charles Keepax 2025-06-24  151  	}
b9ab3b61824190 Charles Keepax 2025-06-24  152  
dfe7c3401ed3d3 Charles Keepax 2025-10-20  153  	ret = regmap_write(interrupt->function_regmap, reg, val);
b9ab3b61824190 Charles Keepax 2025-06-24  154  	if (ret < 0) {
b9ab3b61824190 Charles Keepax 2025-06-24  155  		dev_err(dev, "failed to clear function status: %d\n", ret);
907364ea3db475 Charles Keepax 2025-10-20  156  		goto error;
b9ab3b61824190 Charles Keepax 2025-06-24  157  	}
b9ab3b61824190 Charles Keepax 2025-06-24  158  
907364ea3db475 Charles Keepax 2025-10-20  159  	irqret = IRQ_HANDLED;
907364ea3db475 Charles Keepax 2025-10-20  160  error:
907364ea3db475 Charles Keepax 2025-10-20  161  	pm_runtime_put(dev);
907364ea3db475 Charles Keepax 2025-10-20  162  	return irqret;
b9ab3b61824190 Charles Keepax 2025-06-24  163  }
b9ab3b61824190 Charles Keepax 2025-06-24  164  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
