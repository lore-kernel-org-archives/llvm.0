Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1208B2CA9
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643013389; x=1674549389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wGMxF+c6CA6XbZj+hG6y0ZML5wA7ZQmrneegWvMtmuM=;
  b=aVTNGTnTaOnLZBIgMcq1WRIhwnRA4fbJNZlRh36z7NWpiz1+nIMbXBFG
   y09fOw8/vE1ucXh41VxlGSUqdYXLs7J/IkOqqljIjjnA5V6DISgMhKamC
   8oeGlaqyPR3lq2zQ6szrzf0bGGR2g2d+6quDt+M39KOkH1Fi2qtP1zTBh
   ELtwsJNFAg9dI1rSBzlApUsyyIXWaIppwCxmAdgAcgkZKW5BP9HQybuJl
   27zg/A2uW5eriOY9MzsgtaXUNl6UmzeYSA532v2l7ZDZX5wK8e7JvzKCH
   GZtCxhtZK5OUE9ChGMkG6VahZQDz+SpmITPiTKa67R9J1NsDnv0vZgH6x
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="245941738"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="245941738"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 00:36:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="768608766"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jan 2022 00:36:23 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBupr-000I1W-8s; Mon, 24 Jan 2022 08:36:23 +0000
Date: Mon, 24 Jan 2022 16:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Shych <michaelsh@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Vadim Pasternak <vadimp@nvidia.com>
Subject: [groeck-staging:hwmon-next 32/33] drivers/hwmon/powr1220.c:185:2:
 warning: unannotated fall-through between switch labels
Message-ID: <202201241605.pf50OsUm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   9b9f1e670d2c61c676039474fd2d98ca0a54ff75
commit: 19d8ebde288924d3385763832ea99396c8b4fe8c [32/33] hwmon: (powr1220) Upgrade driver to support hwmon info infrastructure
config: hexagon-randconfig-r032-20220123 (https://download.01.org/0day-ci/archive/20220124/202201241605.pf50OsUm-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9006bf424847bf91f0a624ffc27ad165c7b804c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=19d8ebde288924d3385763832ea99396c8b4fe8c
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout 19d8ebde288924d3385763832ea99396c8b4fe8c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/powr1220.c:185:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/hwmon/powr1220.c:185:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +185 drivers/hwmon/powr1220.c

   169	
   170	static umode_t
   171	powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
   172			    attr, int channel)
   173	{
   174		switch (type) {
   175		case hwmon_in:
   176			switch (attr) {
   177			case hwmon_in_input:
   178			case hwmon_in_highest:
   179			case hwmon_in_label:
   180				return 0444;
   181			default:
   182				break;
   183			}
   184	
 > 185		default:
   186			break;
   187		}
   188	
   189		return 0;
   190	}
   191	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
