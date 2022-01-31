Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3018029CA
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 13:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643635767; x=1675171767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mTHet3M2bB7k0+QvIY/q1lc6c6OhysfBl9wk//GtD8g=;
  b=OMEVmcSkvSLePCdyVk4AI1zU+zTx+0w1NXn88If03EvO3FN9Zch/UbdZ
   t2J7u7BiHrLMTLwN/uXHvRvOs3zouqdGWU2b0LFXuD1Ae/d04S93XExIY
   /66HUeWZaIZ7pN/eQWoN1o2f2CjPvw222dV6H7ShoFquL55iXAiVfQO16
   P8KS47FST+IsWdUIfVLdix3yWqBtmQ+S3lKJuZ5L48rFIoBFGHNGF97dI
   7/44l7q4ebr5LhYpQrcmYVeNer5/PuAHaVHhMZlnx6+QKkanF+ZMRkNeC
   yTtv81bGBybhcUfnMw3gHfjp2OKkUjnUq38dhrQXY/yXtajEKYyxAWVsO
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="308191471"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="308191471"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 05:29:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="768589581"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2022 05:29:25 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEWkG-000RxJ-Tj; Mon, 31 Jan 2022 13:29:24 +0000
Date: Mon, 31 Jan 2022 21:28:26 +0800
From: kernel test robot <lkp@intel.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RESEND 1/4] hwmon: (sch56xx) Autoload modules on platform
 device creation
Message-ID: <202201312123.4IfI3lGh-lkp@intel.com>
References: <20220131093756.8075-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131093756.8075-2-W_Armin@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Armin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on v5.17-rc2 next-20220131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Armin-Wolf/hwmon-sch56xx-Automatically-load-on-supported-hardware/20220131-173922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: x86_64-randconfig-a016-20220131 (https://download.01.org/0day-ci/archive/20220131/202201312123.4IfI3lGh-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/fca8c6c3e08b173fb6ac72499933662f18332d95
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Armin-Wolf/hwmon-sch56xx-Automatically-load-on-supported-hardware/20220131-173922
        git checkout fca8c6c3e08b173fb6ac72499933662f18332d95
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/sch5636.c:505:40: warning: unused variable 'sch5636_device_ids' [-Wunused-const-variable]
   static const struct platform_device_id sch5636_device_ids[] __initconst = {
                                          ^
   1 warning generated.


vim +/sch5636_device_ids +505 drivers/hwmon/sch5636.c

   504	
 > 505	static const struct platform_device_id sch5636_device_ids[] __initconst = {
   506		{
   507			.name = "sch5636",
   508		},
   509		{ }
   510	};
   511	MODULE_DEVICE_TABLE(platform, sch5636_device_ids);
   512	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
