Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBA2168
	for <llvm@lists.linux.dev>; Tue,  4 Jan 2022 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641289786; x=1672825786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MThFPCVO6VOY7QqD0gaF1AAzZ1oNn5DbpKCax1Pytic=;
  b=cguniy/lzmyDrUz/+nlCpV30KJKwusttaVygnt6C6n7ZHRwtghJf0ztu
   1OXtAohcAuXeDYLOBlh6EcEQVi4H2E+Txt9Xnfsi6XLqnU9dkbyZxzUdI
   I2bnmMOuwcFPEIsFh147SzLvoy0m02lFF0eO1+Oxm31fugpxfFRoQias4
   EDYk28RZIx1yDrvW6UmEK9SR3nokMjtNJaniwg3NZd9SWcgMxl02K8Nf0
   10Z+xunvkmSk4fT7+XWrFPWn+Hq1b5zekPti4yMcfGbpMz11J+/KD3tkn
   PJw0inhPkXvE0dD9p7AK1+DDpKVT4Qj4NLzm3wd5JQK3866kNusZQB0A4
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="222186243"
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="222186243"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 01:49:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="620590003"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Jan 2022 01:49:43 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n4gRq-000FAx-Kv; Tue, 04 Jan 2022 09:49:42 +0000
Date: Tue, 4 Jan 2022 17:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>, Jay Chen <jkchen@linux.alibaba.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [linux-next:master 6432/9897] drivers/perf/arm_smmuv3_pmu.c:889:34:
 warning: unused variable 'smmu_pmu_of_match'
Message-ID: <202201041700.01KZEzhb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ea586a076e8aa606c59b66d86660590f18354b11
commit: 3f7be43561766b7ad91661580376913c997613d6 [6432/9897] perf/smmuv3: Add devicetree support
config: x86_64-buildonly-randconfig-r001-20220102 (https://download.01.org/0day-ci/archive/20220104/202201041700.01KZEzhb-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 104a827ea6de0cbe0f5faef4407552ede31d165c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3f7be43561766b7ad91661580376913c997613d6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3f7be43561766b7ad91661580376913c997613d6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/perf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/perf/arm_smmuv3_pmu.c:889:34: warning: unused variable 'smmu_pmu_of_match' [-Wunused-const-variable]
   static const struct of_device_id smmu_pmu_of_match[] = {
                                    ^
   1 warning generated.


vim +/smmu_pmu_of_match +889 drivers/perf/arm_smmuv3_pmu.c

   888	
 > 889	static const struct of_device_id smmu_pmu_of_match[] = {
   890		{ .compatible = "arm,smmu-v3-pmcg" },
   891		{}
   892	};
   893	MODULE_DEVICE_TABLE(of, smmu_pmu_of_match);
   894	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
