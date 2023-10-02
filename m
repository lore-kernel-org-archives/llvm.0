Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF4F383;
	Mon,  2 Oct 2023 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696229134; x=1727765134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v1u0anrRvVEPJUnapEKNRocb+wtE31egSqxRrvBixJU=;
  b=I1ehGLi6L0ZvMiKSpI7xw+ao86MdwvSvUPhNH3G6CTr/wTifYhB0+Tni
   arWzjU+h4mqcSzuL/iFKUlT+0OBdo2LT+0mxWQNoZJNW9d0DwMN8zzrpN
   4ddG2I9DDdtbYMMQKayfmQxtD+F4EUybI9i+awm4GXdxKFQxoldGSL3o3
   YmmLHjuzUNOWh6qIg/CPLSc7rs/Qj0wJP33UMCV5Mwz4I44GHqS8vokYL
   pze0fsatc1SlkOdZnh4lU5aRoat0tua/wPnBnzf6DHKJgenPtofvF+yFb
   ZdT/dGlr9Q1am6gUmsXFpjMDpEGJJteQzXib6IPnyFAnu55CV2V2LppTu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="4168022"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="4168022"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 23:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="866411293"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="866411293"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2023 23:45:30 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnCgK-0005pV-2i;
	Mon, 02 Oct 2023 06:45:28 +0000
Date: Mon, 2 Oct 2023 14:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/4] pinctrl: add pinctrl_gpio_get_config()
Message-ID: <202310021413.po8zef5g-lkp@intel.com>
References: <20231002021602.260100-3-takahiro.akashi@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002021602.260100-3-takahiro.akashi@linaro.org>

Hi AKASHI,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next brgl/gpio/for-next robh/for-next linus/master v6.6-rc4 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AKASHI-Takahiro/pinctrl-define-PIN_CONFIG_INPUT/20231002-101835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20231002021602.260100-3-takahiro.akashi%40linaro.org
patch subject: [RFC 2/4] pinctrl: add pinctrl_gpio_get_config()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231002/202310021413.po8zef5g-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310021413.po8zef5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310021413.po8zef5g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/core.c:941:8: error: call to undeclared function 'pin_config_get_for_pin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = pin_config_get_for_pin(pctldev, pin, config);
                 ^
   1 error generated.


vim +/pin_config_get_for_pin +941 drivers/pinctrl/core.c

   928	
   929	int pinctrl_gpio_get_config(unsigned int gpio, unsigned long *config)
   930	{
   931		struct pinctrl_gpio_range *range;
   932		struct pinctrl_dev *pctldev;
   933		int ret, pin;
   934	
   935		ret = pinctrl_get_device_gpio_range(gpio, &pctldev, &range);
   936		if (ret)
   937			return ret;
   938	
   939		mutex_lock(&pctldev->mutex);
   940		pin = gpio_to_pin(range, gpio);
 > 941		ret = pin_config_get_for_pin(pctldev, pin, config);
   942		mutex_unlock(&pctldev->mutex);
   943	
   944		return ret;
   945	}
   946	EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
   947	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
