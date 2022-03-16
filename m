Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7954698
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 01:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647394415; x=1678930415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xAHtXDDav9BrhYDuigVnMmC1A+VvTM+jKpTIjJx+T54=;
  b=No5L+gykqVV4ix9o2A3UnhQqKnpcLOp86V/EfF+gddP1uzAU8LFvivqW
   DXFpIA5jzXoToplYQxIgmJPuxmtx1I9zPK1z1ukSPTLJck6bhbE35MHQT
   iAgs89jrYnVLr4WyrmMhJ3JyKbqOY2fosNeL5utV1U9ujx5F7pLtSWSI3
   1aSZpgJb4ibd/HXI3OKJE5j7RZukpmqqSrVVn3EdDq52jfWBw55tbjnHW
   yuj3Eol49Jfkex9WLna8Uw2qVNSnPO1YpyuPUpDrEaho7D/JtNj0hMO7y
   9i36wYJKZKKsXx+BoZvBa1XkiXYmocW95JdpicibFfP8zgLxuqhieaIr4
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342890834"
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; 
   d="scan'208";a="342890834"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 18:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; 
   d="scan'208";a="646451611"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Mar 2022 18:33:31 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUIXa-000BlM-8n; Wed, 16 Mar 2022 01:33:30 +0000
Date: Wed, 16 Mar 2022 09:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Will Deacon <will@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"open list:AMD IOMMU (AMD-VI)" <iommu@lists.linux-foundation.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 2/2] thunderbolt: Use pre-boot DMA protection on AMD
 systems
Message-ID: <202203160904.VB4alCdg-lkp@intel.com>
References: <20220315162455.5190-2-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315162455.5190-2-mario.limonciello@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Mario,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on joro-iommu/next]
[also build test ERROR on arm-perf/for-next/perf linus/master v5.17-rc8 next-20220315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mario-Limonciello/iommu-amd-Add-support-to-indicate-whether-DMA-remap-support-is-enabled/20220316-002821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220316/202203160904.VB4alCdg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9b0b7079d348c607cba7af4c87eaae1a79e52d91
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mario-Limonciello/iommu-amd-Add-support-to-indicate-whether-DMA-remap-support-is-enabled/20220316-002821
        git checkout 9b0b7079d348c607cba7af4c87eaae1a79e52d91
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/thunderbolt/domain.c:9:
>> include/linux/amd-iommu.h:159:52: error: use of undeclared identifier 'ENODEV'
   static inline int amd_iommu_detect(void) { return -ENODEV; }
                                                      ^
   1 error generated.


vim +/ENODEV +159 include/linux/amd-iommu.h

6a9401a7ac13e6 arch/x86/include/asm/amd_iommu.h Joerg Roedel          2009-11-20  158  
480125ba49ba62 arch/x86/include/asm/amd_iommu.h Konrad Rzeszutek Wilk 2010-08-26 @159  static inline int amd_iommu_detect(void) { return -ENODEV; }
6a9401a7ac13e6 arch/x86/include/asm/amd_iommu.h Joerg Roedel          2009-11-20  160  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
