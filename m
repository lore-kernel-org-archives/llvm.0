Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21F82F26
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 05:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644210363; x=1675746363;
  h=date:from:cc:subject:message-id:mime-version;
  bh=8eMaB1UsaDDV6lk1KVgtoyDCuSQA37RzvCFXmny/pqk=;
  b=POJ46N2JtjODDiUqmqeruElUW646/IpwyCag/Ttpp2UHN+LxeqoBshCq
   9Dz9jH2u9O4QLtXde2JUoiZG1R0UeMl5GcvpQqHOJiXyx6vMErYB4E/d9
   1YrPd39BSHDqZJiSU4S6/uXydVao+oF50Uz0wT42b0j9lK+XGbPfD2Nly
   tTJ6kfsQ6EXhCT0U7DdxmMBsZGzmyw4cBKk5I3+tTkzlto+gkUAuZ/VPw
   dhGtmqPL7lun8qKk0B9+upAStEJkd89UMBvVcA3wGMcPDFvsSTia+iU0g
   rTl6OPvMDD1+EnjkABQW7tyzlh+VIK0E5bIq3Ra7IYEZXI2f1V2ny48zw
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="232207239"
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; 
   d="scan'208";a="232207239"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2022 21:06:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; 
   d="scan'208";a="700336615"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Feb 2022 21:06:01 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nGwDw-000070-Qo; Mon, 07 Feb 2022 05:06:00 +0000
Date: Mon, 7 Feb 2022 13:05:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: drivers/regulator/da9121-regulator.o: warning: objtool:
 da9121_i2c_probe() falls through to next function da9121_i2c_remove()
Message-ID: <202202071329.ZqR5zNYZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Adam Ward <Adam.Ward.opensource@diasemi.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dfd42facf1e4ada021b939b4e19c935dcdd55566
commit: 013592be146a10d3567c0062cd1416faab060704 regulator: da9121: automotive variants identity fix
date:   10 months ago
config: x86_64-buildonly-randconfig-r005-20220207 (https://download.01.org/0day-ci/archive/20220207/202202071329.ZqR5zNYZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=013592be146a10d3567c0062cd1416faab060704
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 013592be146a10d3567c0062cd1416faab060704
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/regulator/da9121-regulator.o: warning: objtool: da9121_i2c_probe() falls through to next function da9121_i2c_remove()

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
