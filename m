Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261B96132;
	Sat, 22 Apr 2023 16:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682179671; x=1713715671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fqg6VUaZcnML1SvL2jRKALmKw7Edp+iiLo77zFqQBpE=;
  b=bQOu3M+FEkE5XJ+pvYmHus+U3SGBqxwgewm1Mo1goxCIL/KX7x9LDck4
   TT8xq7030s4b3ZE6WjlBsUqFJtNHAEIOakJH8FjlP0++NK67zzUI148EP
   aVDPPr+Z25Me8ReWWJR8P7igpcF5/nn9SO4z8wtE3Kng0hAkz+LDjfOSM
   39t8VeOM+SSPHKaEk3GkmQlrWivPMMvDD6daGoAH4bCQUaa8UUgUvBmYb
   T/MdifpPpO1LvLHM7oUp0TRA6Hpp+WvS3l8cI4VIjbvsfm3neXrMBbEZQ
   XGrTqHEhpz47oNAIyAZv+OdERpnZno3K81EF+JbTlVDtn8kCDPUKC3QXK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="346191144"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="346191144"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 09:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="723074523"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="723074523"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Apr 2023 09:07:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqFm7-000hNk-36;
	Sat, 22 Apr 2023 16:07:47 +0000
Date: Sun, 23 Apr 2023 00:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ofir Bitton <obitton@habana.ai>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Oded Gabbay <ogabbay@kernel.org>
Subject: [linux-next:master 9508/13717]
 drivers/accel/habanalabs/gaudi/gaudi.c:117:19: warning: unused variable
 'gaudi_irq_name'
Message-ID: <202304230014.YbScpx20-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89
commit: b207e166dbadc88f38d9550c592cc4f8413b7a15 [9508/13717] accel/habanalabs: remove Gaudi1 multi MSI code
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230423/202304230014.YbScpx20-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b207e166dbadc88f38d9550c592cc4f8413b7a15
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b207e166dbadc88f38d9550c592cc4f8413b7a15
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ drivers/accel/ drivers/gpu/ drivers/power/ drivers/vdpa/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230014.YbScpx20-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/habanalabs/gaudi/gaudi.c:117:19: warning: unused variable 'gaudi_irq_name' [-Wunused-const-variable]
   static const char gaudi_irq_name[GAUDI_MSI_ENTRIES][GAUDI_MAX_STRING_LEN] = {
                     ^
   1 warning generated.


vim +/gaudi_irq_name +117 drivers/accel/habanalabs/gaudi/gaudi.c

72d6625570c16b drivers/misc/habanalabs/gaudi/gaudi.c Ohad Sharabi 2021-08-01  116  
ac0ae6a96aa58e drivers/misc/habanalabs/gaudi/gaudi.c Oded Gabbay  2020-05-11 @117  static const char gaudi_irq_name[GAUDI_MSI_ENTRIES][GAUDI_MAX_STRING_LEN] = {
ac0ae6a96aa58e drivers/misc/habanalabs/gaudi/gaudi.c Oded Gabbay  2020-05-11  118  		"gaudi cq 0_0", "gaudi cq 0_1", "gaudi cq 0_2", "gaudi cq 0_3",
ac0ae6a96aa58e drivers/misc/habanalabs/gaudi/gaudi.c Oded Gabbay  2020-05-11  119  		"gaudi cq 1_0", "gaudi cq 1_1", "gaudi cq 1_2", "gaudi cq 1_3",
ac0ae6a96aa58e drivers/misc/habanalabs/gaudi/gaudi.c Oded Gabbay  2020-05-11  120  		"gaudi cq 5_0", "gaudi cq 5_1", "gaudi cq 5_2", "gaudi cq 5_3",
ac0ae6a96aa58e drivers/misc/habanalabs/gaudi/gaudi.c Oded Gabbay  2020-05-11  121  		"gaudi cpu eq"
ac0ae6a96aa58e drivers/misc/habanalabs/gaudi/gaudi.c Oded Gabbay  2020-05-11  122  };
ac0ae6a96aa58e drivers/misc/habanalabs/gaudi/gaudi.c Oded Gabbay  2020-05-11  123  

:::::: The code at line 117 was first introduced by commit
:::::: ac0ae6a96aa58eeba4aed97b12ef1dea8c5bf399 habanalabs: add gaudi asic-dependent code

:::::: TO: Oded Gabbay <oded.gabbay@gmail.com>
:::::: CC: Oded Gabbay <oded.gabbay@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
