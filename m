Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B02723A0
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 20:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650572746; x=1682108746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SQgqDQzbQI90mASehWeKiklm60MKpj1pVexG2Vkd0s0=;
  b=gNyNz9Vg3XJFtU4HoY6zt5SGsw1JEOjcbwEGMtPwjNr+K1WGUaUaynhM
   MSW6EXsNiv4v++RPTy8UX5Q3vNvPxKpRi+Y6VxJKM9dqNGOGb8rY1ic7l
   SVO2WHYJ2YrCMwAB8gpeO1ZZhfXvPNGnT6xr/MI4TIakqiRJpdrH7dwM0
   liHGOZZyYdm8hFCrxmWj3zlh9J6xRm9Sxkc5uC4IjVSulEs5FpLwwbN80
   mPlKyCtNgbCZSmgXjsB9Q09piu/IWCdToPfFWxNwuY2VeRTk0gOywpZ37
   54Bd2j+myrmPQ6OgEzUuRmBSMF4yIQjNLtAXSX1B0fY3atz4q7hapuPui
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="324920635"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="324920635"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 13:25:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="703235799"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Apr 2022 13:25:44 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhdN1-0008ku-IY;
	Thu, 21 Apr 2022 20:25:43 +0000
Date: Fri, 22 Apr 2022 04:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: drivers/base/topology.c:158:38: error: use of undeclared identifier
 'boot_cpu_data'
Message-ID: <202204220442.JKPnWIAg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220422-002853/Luck-Tony/topology-sysfs-Fix-allnoconfig-build-breakage/20220421-235053
head:   8aad1c48b8885d9febd55ecbc5915032cfe857bc
commit: 8aad1c48b8885d9febd55ecbc5915032cfe857bc topology/sysfs: Fix allnoconfig build breakage.
date:   4 hours ago
config: hexagon-randconfig-r041-20220421 (https://download.01.org/0day-ci/archive/20220422/202204220442.JKPnWIAg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8aad1c48b8885d9febd55ecbc5915032cfe857bc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review UPDATE-20220422-002853/Luck-Tony/topology-sysfs-Fix-allnoconfig-build-breakage/20220421-235053
        git checkout 8aad1c48b8885d9febd55ecbc5915032cfe857bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/base/topology.c:158:38: error: use of undeclared identifier 'boot_cpu_data'
           if (attr == &dev_attr_ppin.attr && !boot_cpu_data.ppin)
                                               ^
   1 error generated.


vim +/boot_cpu_data +158 drivers/base/topology.c

   154	
   155	static umode_t topology_is_visible(struct kobject *kobj,
   156					   struct attribute *attr, int unused)
   157	{
 > 158		if (attr == &dev_attr_ppin.attr && !boot_cpu_data.ppin)
   159			return 0;
   160	
   161		return attr->mode;
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
