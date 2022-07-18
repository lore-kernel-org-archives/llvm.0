Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE02361
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 06:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658125889; x=1689661889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=okrjatJa1D0kwkWfKcg6m75U5AxWNXcokwAOov2aqRo=;
  b=h9aXLb082rHuCHCPDCN+HqtZwbne7PywCeH0MIVXuTehGbuTIvmx1Dss
   9chu7drrriBwfdlqVMp2brBBSF4blTYcXmcM2RUnHFNN75s0KIx9eorB2
   gonD4G8dxC6a8k6vMAmzd6o4VVTY520ovtBDgoPUGP8GbzoZDPQDatM+k
   Ncd4NkQ7w+ArZBRV2j/5JeAxBydD4mDRpfqBd2T0/ly48BUUr4Vr7KbTS
   flkYDHhzUiuA2ujvW1hy7ReZ9ogmaqcH4yvy9ak59rU+T1QXz6zq0qufM
   bZI4L5PwmL36WNSVgFxZrxM5WgMGwDYHa31JdFaEfCKdHAn+1KkdbMWAo
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="287291481"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="287291481"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2022 23:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="572277405"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Jul 2022 23:31:27 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDKHu-00046A-Ui;
	Mon, 18 Jul 2022 06:31:26 +0000
Date: Mon, 18 Jul 2022 14:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [bvanassche:f2fs 4/4] fs/f2fs/segment.h:417:21: warning: comparison
 of distinct pointer types ('typeof (start + (4096 / sizeof(struct
 f2fs_sit_entry))) *' (aka 'unsigned int *') and 'typeof ((unsigned
 long)(SM_I(sbi)->main_segments)) *' (aka 'unsigned long *'))
Message-ID: <202207181452.urqB2dj0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux f2fs
head:   787811ac4178b6f0a77923aa25c58b4041a52f05
commit: 787811ac4178b6f0a77923aa25c58b4041a52f05 [4/4] f
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220718/202207181452.urqB2dj0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/787811ac4178b6f0a77923aa25c58b4041a52f05
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche f2fs
        git checkout 787811ac4178b6f0a77923aa25c58b4041a52f05
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/file.c:31:
>> fs/f2fs/segment.h:417:21: warning: comparison of distinct pointer types ('typeof (start + (4096 / sizeof(struct f2fs_sit_entry))) *' (aka 'unsigned int *') and 'typeof ((unsigned long)(SM_I(sbi)->main_segments)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           unsigned int end = min(start + SIT_ENTRY_PER_BLOCK,
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.
--
   In file included from fs/f2fs/segment.c:22:
>> fs/f2fs/segment.h:417:21: warning: comparison of distinct pointer types ('typeof (start + (4096 / sizeof(struct f2fs_sit_entry))) *' (aka 'unsigned int *') and 'typeof ((unsigned long)(SM_I(sbi)->main_segments)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           unsigned int end = min(start + SIT_ENTRY_PER_BLOCK,
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> fs/f2fs/segment.c:4070:22: warning: comparison of distinct pointer types ('typeof (start_segno + (4096 / sizeof(struct f2fs_sit_entry))) *' (aka 'unsigned int *') and 'typeof ((unsigned long)(SM_I(sbi)->main_segments)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                   unsigned int end = min(start_segno + SIT_ENTRY_PER_BLOCK,
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   2 warnings generated.


vim +417 fs/f2fs/segment.h

068c3cd8586678 Yunlei He 2018-01-25  410  
068c3cd8586678 Yunlei He 2018-01-25  411  static inline void seg_info_to_sit_page(struct f2fs_sb_info *sbi,
068c3cd8586678 Yunlei He 2018-01-25  412  				struct page *page, unsigned int start)
068c3cd8586678 Yunlei He 2018-01-25  413  {
068c3cd8586678 Yunlei He 2018-01-25  414  	struct f2fs_sit_block *raw_sit;
068c3cd8586678 Yunlei He 2018-01-25  415  	struct seg_entry *se;
068c3cd8586678 Yunlei He 2018-01-25  416  	struct f2fs_sit_entry *rs;
068c3cd8586678 Yunlei He 2018-01-25 @417  	unsigned int end = min(start + SIT_ENTRY_PER_BLOCK,
068c3cd8586678 Yunlei He 2018-01-25  418  					(unsigned long)MAIN_SEGS(sbi));
068c3cd8586678 Yunlei He 2018-01-25  419  	int i;
068c3cd8586678 Yunlei He 2018-01-25  420  
068c3cd8586678 Yunlei He 2018-01-25  421  	raw_sit = (struct f2fs_sit_block *)page_address(page);
81114baa835b59 Chao Yu   2018-04-09  422  	memset(raw_sit, 0, PAGE_SIZE);
068c3cd8586678 Yunlei He 2018-01-25  423  	for (i = 0; i < end - start; i++) {
068c3cd8586678 Yunlei He 2018-01-25  424  		rs = &raw_sit->entries[i];
068c3cd8586678 Yunlei He 2018-01-25  425  		se = get_seg_entry(sbi, start + i);
068c3cd8586678 Yunlei He 2018-01-25  426  		__seg_info_to_raw_sit(se, rs);
068c3cd8586678 Yunlei He 2018-01-25  427  	}
068c3cd8586678 Yunlei He 2018-01-25  428  }
068c3cd8586678 Yunlei He 2018-01-25  429  

:::::: The code at line 417 was first introduced by commit
:::::: 068c3cd85866785303f18960a4c00a182515b963 f2fs: rebuild sit page from sit info in mem

:::::: TO: Yunlei He <heyunlei@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
