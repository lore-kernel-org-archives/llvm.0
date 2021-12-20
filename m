Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4522CA0
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640013612; x=1671549612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l8AMP3pMeTOE0Bebgw47YiCbv8lrzVYPL5lB+0HCag0=;
  b=dI47COJoc11mqQJke4x1Vj0BYkAofR1MZ29O0FoNr0/fdUAbqYQF7bM3
   NSWMjbz3sU2ZkB6i4Ddz9ZZXRv25s7i2r6GhrSjIfJ9cd+s8RJOnn1o0Z
   RkW+Z2FsPDlpIsejJNeXXeNFsLEE03Bvd9nZUM2dote+ZAJr/0d0INzYN
   U3LW5vOyesacM84J/Hu/smKV0af/tMbZiSG6eIR+UFAI1T0uaqUI941ak
   pu/5CIpn5StVrGUJi40EWPGxIrcvlt4HLkI6QA7QyXNqhwCqhe3+pSg39
   xCk0UZ1QWUVsKoWz+FQ2Onc1+5+YqyYjNalNJHhaziGFh3zO0W0IZUFx0
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="264378457"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="264378457"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 07:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="757330263"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 20 Dec 2021 07:20:10 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzKSP-0007ug-H5; Mon, 20 Dec 2021 15:20:09 +0000
Date: Mon, 20 Dec 2021 23:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [chao:feature/dax 5/9] fs/f2fs/data.c:4178:9: error: implicit
 declaration of function 'dax_writeback_mapping_range'
Message-ID: <202112202302.OWA4emnZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/dax
head:   d08999836fd60ab725eee1f5a5fb3b00f7bcefd3
commit: 2908c6445a36c37b0af40ba94f72c957a87d8fd8 [5/9] f2fs: support dax address space operation
config: mips-randconfig-r002-20211220 (https://download.01.org/0day-ci/archive/20211220/202112202302.OWA4emnZ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 683cbc12b33e5c8dc8d29bf5ed79fbf45763aadd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?id=2908c6445a36c37b0af40ba94f72c957a87d8fd8
        git remote add chao https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
        git fetch --no-tags chao feature/dax
        git checkout 2908c6445a36c37b0af40ba94f72c957a87d8fd8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/f2fs/data.c:4178:9: error: implicit declaration of function 'dax_writeback_mapping_range' [-Werror,-Wimplicit-function-declaration]
           return dax_writeback_mapping_range(mapping, sbi->s_daxdev, wbc);
                  ^
   1 error generated.


vim +/dax_writeback_mapping_range +4178 fs/f2fs/data.c

  4169	
  4170	static int f2fs_dax_writepages(struct address_space *mapping,
  4171						struct writeback_control *wbc)
  4172	{
  4173		struct f2fs_sb_info *sbi = F2FS_I_SB(mapping->host);
  4174	
  4175		if (unlikely(f2fs_cp_error(sbi)))
  4176			return -EIO;
  4177	
> 4178		return dax_writeback_mapping_range(mapping, sbi->s_daxdev, wbc);
  4179	}
  4180	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
