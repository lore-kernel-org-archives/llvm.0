Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144D1EA8;
	Sun, 16 Apr 2023 03:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681616403; x=1713152403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WhecO7hnp8yw5aPPRqoljMDg5SnBa4Lqqs+G1tvSfnc=;
  b=FOW7XECioNQPZ4Lnr9fqDoSBd+Ew1gU4pHNF7tPl0gaj33CTNT3UeyQ0
   YPVaHkVfyGA42PXf8t9F/Yb2uQETeF2JP2dxlKNxCF5XUOlFjAel+bURG
   TOPh/zKl7zdd/lYkrIrsxIfcvidr/7mMd+d2vSLHY77YrMT/O3SgXu+yb
   iRsa1oQ1e/oBdNpaL2EC9nmcLvIIx02/r9fN9chEHALjjzi4hRhQ1YQES
   W3shzryABHevECMsa7/ryum5GLFknTNeFh01YoAC8rvEsjnp5tWmOmYiE
   q7Bk3HxnIRgTXWkHNzWA7qKkQsKPgYSES0KV1RRXmuV13YGOYPRNdrsWT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="328856640"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="328856640"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 20:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="1020020964"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="1020020964"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Apr 2023 20:40:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pntFA-000bVf-1U;
	Sun, 16 Apr 2023 03:40:00 +0000
Date: Sun, 16 Apr 2023 11:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:mutex 1/1] warning: missing documentation for a struct
Message-ID: <202304161129.ejzZ4Zmj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux mutex
head:   6e4c596edf0c2bca7ac08122e75a30385f2824a9
commit: 6e4c596edf0c2bca7ac08122e75a30385f2824a9 [1/1] WIP: guard type split
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230416/202304161129.ejzZ4Zmj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/nbdd0121/linux/commit/6e4c596edf0c2bca7ac08122e75a30385f2824a9
        git remote add nbdd0121 https://github.com/nbdd0121/linux
        git fetch --no-tags nbdd0121 mutex
        git checkout 6e4c596edf0c2bca7ac08122e75a30385f2824a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304161129.ejzZ4Zmj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: missing documentation for a struct
   --> rust/kernel/sync/lock/spinlock.rs:99:1
   |
   99 | pub struct SpinLockIrqSaveBackend;
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: requested on the command line with `-W missing-docs`
--
>> warning: missing documentation for a trait
   --> rust/kernel/sync/lock.rs:16:1
   |
   16 | pub unsafe trait EffectiveBackend {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> warning: missing documentation for an associated type
   --> rust/kernel/sync/lock.rs:87:5
   |
   87 |     type IrqSaveBackend: EffectiveBackend<State = Self::State>;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
