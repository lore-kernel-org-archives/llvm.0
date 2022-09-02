Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5046E10E5
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 03:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662089212; x=1693625212;
  h=date:from:cc:subject:message-id:mime-version;
  bh=74GATzlt1pPW3yBjcdGa+59iz7hUdaaBHdAbgFNCHPo=;
  b=HgLbQuI9UmEJRUXo0TqU6i7AlfnKvfrvTVz4quSAU4cU8y5FVOvyD5uf
   EA6oCa2mBHLt0V1vlsjxgKKKJhB7hPA+eIkq7UwbKNQE6b6lJ+Q1+OKF9
   CZYpQoAk2wCzHLt+gBId+R42gDApZaSmhr1pM6RnUJHqkphbWqZWJhj/T
   gHjW0quaBItInuduahKibPTMpc19zB2htRtppZsQ429X+K3aU+HtdvsRw
   iRVDavRkS2QIXtvhoFzDNXSnWJ9HVH8GJUL6widU9mJO5JWIS8Sw4mlQu
   REbGOblwM77uyhLkgBsYqLpKAj/nMUrURR5H4EMlSO9TEk0W6iPCdoOGW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="382183745"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="382183745"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 20:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="642710551"
Received: from lkp-server02.sh.intel.com (HELO fccc941c3034) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 01 Sep 2022 20:26:50 -0700
Received: from kbuild by fccc941c3034 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTxKT-00004d-31;
	Fri, 02 Sep 2022 03:26:49 +0000
Date: Fri, 2 Sep 2022 11:26:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 4627/4736] ld.lld: error:
 vmlinux.o:(.debug_info+0x2096020d): relocation R_AARCH64_ABS32 out of range:
 4295813883 is not in
Message-ID: <202209021113.imFYddaU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
commit: 12c674aa7e797864f36a4e9dbc2cf20930c1f6fe [4627/4736] kbuild: add debug level and macro defs options
config: arm64-randconfig-r021-20220901 (https://download.01.org/0day-ci/archive/20220902/202209021113.imFYddaU-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=12c674aa7e797864f36a4e9dbc2cf20930c1f6fe
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 12c674aa7e797864f36a4e9dbc2cf20930c1f6fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.o:(.debug_info+0x2096020d): relocation R_AARCH64_ABS32 out of range: 4295813883 is not in [-2147483648, 4294967295]
   >>> referenced by xarray.c; consider recompiling with -fdebug-types-section to reduce size of debug sections

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
