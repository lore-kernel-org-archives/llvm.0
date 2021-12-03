Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA982CA0
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 16:40:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="234514654"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="234514654"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 08:40:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="603652557"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Dec 2021 08:40:16 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtBbb-000HoX-N4; Fri, 03 Dec 2021 16:40:15 +0000
Date: Sat, 4 Dec 2021 00:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [lee-mfd:for-mfd-next 10/17] drivers/mfd/atmel-flexcom.c:108:32:
 warning: unused variable 'atmel_flexcom_pm_ops'
Message-ID: <202112040029.Dop6RXrq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   54d4c88b37595173d7039ea9a57913edfee48f47
commit: 5d051cf94fd5834a1513aa77e542c49fd973988a [10/17] mfd: atmel-flexcom: Use .resume_noirq
config: i386-randconfig-a011-20211203 (https://download.01.org/0day-ci/archive/20211204/202112040029.Dop6RXrq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d30fcadf07ee552f20156ea90be2fdb54cb9cb08)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=5d051cf94fd5834a1513aa77e542c49fd973988a
        git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
        git fetch --no-tags lee-mfd for-mfd-next
        git checkout 5d051cf94fd5834a1513aa77e542c49fd973988a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/mfd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mfd/atmel-flexcom.c:108:32: warning: unused variable 'atmel_flexcom_pm_ops' [-Wunused-const-variable]
   static const struct dev_pm_ops atmel_flexcom_pm_ops = {
                                  ^
   1 warning generated.


vim +/atmel_flexcom_pm_ops +108 drivers/mfd/atmel-flexcom.c

   107	
 > 108	static const struct dev_pm_ops atmel_flexcom_pm_ops = {
   109		.resume_noirq = atmel_flexcom_resume_noirq,
   110	};
   111	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
