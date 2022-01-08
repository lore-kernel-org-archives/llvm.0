Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B7D2CA2
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 18:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641668107; x=1673204107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ml5eujxwJHgiC6ldIM7BXvyX5snHPcmM3NTrSThHIs0=;
  b=FZCsooCBvYlzrhYDcYJHUr7+gjD21VOE/4Gv4O9LyHkfRMOHQiT9pdfh
   G/2KGHADqWsm0GPgYiYLGLaIy4ebxAV7wKIbXZmi5rq0o4/AWIIumnCH3
   lTt7VJhh5GT/dPrNQRdir6AkgQX2MxpBnpy7s1NW5hyI3UGko1ITKftmG
   IZpaf4hyR2BmAPNfv2HaXdpFtuLE7azWlVv/50d854dx3N76kNsncanpP
   5MjKeZIxXesSD3YMZI6yXyVimz5DdwTaJqSpqJbxBZfR8T3boObuEt0ku
   TBoCVV1J4upQTgruUfVOfVCBTCThbWwsliov6EYpcuuyhN4aCmB42sP7C
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10221"; a="306393459"
X-IronPort-AV: E=Sophos;i="5.88,273,1635231600"; 
   d="scan'208";a="306393459"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2022 10:55:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,273,1635231600"; 
   d="scan'208";a="690140050"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Jan 2022 10:55:04 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n6Gro-0000vr-Az; Sat, 08 Jan 2022 18:55:04 +0000
Date: Sun, 9 Jan 2022 02:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Message-ID: <202201090203.kgCw6bSd-lkp@intel.com>
References: <20220107234456.148389-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107234456.148389-1-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hans,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on v5.16-rc8 next-20220107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hans-de-Goede/pinctrl-baytrail-Clear-direct_irq_en-flag-on-broken-configs/20220108-074637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: i386-randconfig-c001-20220107 (https://download.01.org/0day-ci/archive/20220109/202201090203.kgCw6bSd-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/fc9eb527f62b0bebde64745ec5b0a838fde7ef41
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hans-de-Goede/pinctrl-baytrail-Clear-direct_irq_en-flag-on-broken-configs/20220108-074637
        git checkout fc9eb527f62b0bebde64745ec5b0a838fde7ef41
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/pinctrl/intel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/intel/pinctrl-baytrail.c:1483:58: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
                   dev_dbg(vg->dev, "Pin %i: uses direct IRQ %ld\n", pin, match - direct_irq);
                                                             ~~~          ^~~~~~~~~~~~~~~~~~
                                                             %d
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1483 drivers/pinctrl/intel/pinctrl-baytrail.c

  1468	
  1469	static bool byt_direct_irq_sanity_check(struct intel_pinctrl *vg, int pin, u32 value)
  1470	{
  1471		u8 *match, direct_irq[16];
  1472	
  1473		if (!(value & (BYT_TRIG_POS | BYT_TRIG_NEG))) {
  1474			dev_warn(vg->dev,
  1475				 FW_BUG "pin %i: direct_irq_en set without trigger, clearing\n", pin);
  1476			return false;
  1477		}
  1478	
  1479		memcpy_fromio(direct_irq, vg->communities->pad_regs + BYT_DIRECT_IRQ_REG,
  1480			      sizeof(direct_irq));
  1481		match = memchr(direct_irq, pin, sizeof(direct_irq));
  1482		if (match)
> 1483			dev_dbg(vg->dev, "Pin %i: uses direct IRQ %ld\n", pin, match - direct_irq);
  1484		else
  1485			dev_warn(vg->dev, FW_BUG "pin %i: direct_irq_en set but no IRQ assigned, clearing\n", pin);
  1486	
  1487		return match;
  1488	}
  1489	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
