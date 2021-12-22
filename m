Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD0429CA
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 11:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640172523; x=1671708523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/hv8OLX7GNJmLtUEX6huPZEpVLpf4UlvmqFkL7d/gB0=;
  b=YlMhsijcwh1zp+e7YgzFUrXr8N8AvSMXq4mfG+pvKtoD/Y+pi8/CLmUv
   9hJx77EcDRfez7EdEm/UEpjXgLncMAAhTsbFyW6bOnDVfspmJxkat6Ars
   7rOgmgit0LfMO8ewE7MMM60aNdZFmRIYBs3FfsMXUdZSB4K2/ULlzZzfA
   wNHbp5kWRCKto2HrcTVSZUiNnN/uX28olwmWumlzTuOctZghLU/+t3+/F
   YNobcKe/XFSR6slah8nOuXjYTcICz3czM9MRMc0B0Zi3cD2hdsv7+Efvo
   w6SFLo1okPsRmN88aOTbEHZw1MGpj6zEL7IpkE+FT7Q/YZycQN5hx1Dtx
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="221276745"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="221276745"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 03:28:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="508439080"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Dec 2021 03:28:41 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzznU-0000Ob-DB; Wed, 22 Dec 2021 11:28:40 +0000
Date: Wed, 22 Dec 2021 19:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Sisodiya <mukesh.sisodiya@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luca Coelho <luciano.coelho@intel.com>
Subject: [linux-next:master 4910/8895]
 drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:1265:6: warning: stack
 frame size (1056) exceeds limit (1024) in '_iwl_dbg_tlv_time_point'
Message-ID: <202112221942.1L410btU-lkp@intel.com>
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
head:   2850c2311ef4bf30ae8dd8927f0f66b026ff08fb
commit: 020cde4750c5b20be309e028dec9950520384c1e [4910/8895] iwlwifi: yoyo: support for DBGC4 for dram
config: mips-randconfig-r033-20211222 (https://download.01.org/0day-ci/archive/20211222/202112221942.1L410btU-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project de4e0195ae1c39f1c3b07834b8e32c113f4f20eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=020cde4750c5b20be309e028dec9950520384c1e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 020cde4750c5b20be309e028dec9950520384c1e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/net/wireless/intel/iwlwifi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:1265:6: warning: stack frame size (1056) exceeds limit (1024) in '_iwl_dbg_tlv_time_point' [-Wframe-larger-than]
   void _iwl_dbg_tlv_time_point(struct iwl_fw_runtime *fwrt,
        ^
   1 warning generated.


vim +/_iwl_dbg_tlv_time_point +1265 drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c

14124b25780db5 Shahar S Matityahu 2019-07-23  1264  
b8221b0f750a05 Johannes Berg      2021-08-02 @1265  void _iwl_dbg_tlv_time_point(struct iwl_fw_runtime *fwrt,

:::::: The code at line 1265 was first introduced by commit
:::::: b8221b0f750a05a7ae9cbca84932e2a36a3ee658 iwlwifi: prepare for synchronous error dumps

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Luca Coelho <luciano.coelho@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
