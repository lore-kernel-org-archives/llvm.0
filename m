Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E8A2C81
	for <llvm@lists.linux.dev>; Wed, 24 Nov 2021 22:02:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="259278635"
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800"; 
   d="scan'208";a="259278635"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 14:02:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800"; 
   d="scan'208";a="497839054"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2021 14:02:02 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mq0L4-0005Mt-8x; Wed, 24 Nov 2021 22:02:02 +0000
Date: Thu, 25 Nov 2021 06:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mcgrof-next:20211124-sysctl-cleanups 20/41]
 include/linux/sysctl.h:228:30: error: unused function
 'register_sysctl_mount_point'
Message-ID: <202111250521.fMsBjd43-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20211124-sysctl-cleanups
head:   be58d35fd7e6bfac6e48e3188ab9f4d0b5ac4af7
commit: 81e9e1fdc7a64b2745a2c11769eb3864121eedc0 [20/41] sysctl: add helper to register a sysctl mount point
config: hexagon-randconfig-r005-20211124 (https://download.01.org/0day-ci/archive/20211125/202111250521.fMsBjd43-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 67a1c45def8a75061203461ab0060c75c864df1c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=81e9e1fdc7a64b2745a2c11769eb3864121eedc0
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next 20211124-sysctl-cleanups
        git checkout 81e9e1fdc7a64b2745a2c11769eb3864121eedc0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=hexagon 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:9:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:9:
>> include/linux/sysctl.h:228:30: error: unused function 'register_sysctl_mount_point' [-Werror,-Wunused-function]
   static struct sysctl_header *register_sysctl_mount_point(const char *path)
                                ^
   1 error generated.


vim +/register_sysctl_mount_point +228 include/linux/sysctl.h

   227	
 > 228	static struct sysctl_header *register_sysctl_mount_point(const char *path)
   229	{
   230		return NULL;
   231	}
   232	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
