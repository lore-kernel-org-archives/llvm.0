Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C516A2F26
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 15:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644420653; x=1675956653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zauU5vkXPysXVgTYyd3mR2l2ZQGaxYzjdyZI9mEhceI=;
  b=AxNvWUFNs8iO2uaND36hOAeaBPHEqvQ66x3JgnbDSrwIaX8+O2ZfQovY
   LVLHhMXYsVPlHzFpt4LlY65iLZQK7BM8LVzy2oSkAAUOp95mHUVCGPFMM
   QL4oLVWPppdgVDKp0h4YSJM0OQul2lDc4KMIQtTzatqxNQG29UT8qu+QZ
   KGgl/b9doupWe9f9FnHnyVGO7CwBVPSgWVCOEHbUG0hbC8/8q4St8aN65
   KOr84FwSLgQEwVmblwUBzKGk1eWwMfbegKEn705bTTWdFWd999PgSvY9y
   CV0pHva2VLdrTfosEEt4HGuMvMreQNIqnBdJyN1JpedG+ixQWzEct8kx/
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249176214"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="249176214"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 07:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="485277870"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Feb 2022 07:30:52 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHovj-0001yX-AT; Wed, 09 Feb 2022 15:30:51 +0000
Date: Wed, 9 Feb 2022 23:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [norov:bitmap-20220204 10/48]
 drivers/net/ethernet/qlogic/qed/qed_rdma.c:332:7: error: use of undeclared
 identifier 'idx'
Message-ID: <202202092311.nsDv5MPD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/norov/linux bitmap-20220204
head:   6be3158022466595db078b4091472d0541e04bdc
commit: 8bca8c2ba1a83d9ebf601431dab6c4ab05d9ca27 [10/48] qed: rework qed_rdma_bmap_free()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220209/202202092311.nsDv5MPD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/norov/linux/commit/8bca8c2ba1a83d9ebf601431dab6c4ab05d9ca27
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov bitmap-20220204
        git checkout 8bca8c2ba1a83d9ebf601431dab6c4ab05d9ca27
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/ethernet/qlogic/qed/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/qlogic/qed/qed_rdma.c:332:7: error: use of undeclared identifier 'idx'
           for (idx = 0; idx < bmap->max_count; idx += 512) {
                ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:332:16: error: use of undeclared identifier 'idx'
           for (idx = 0; idx < bmap->max_count; idx += 512) {
                         ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:332:39: error: use of undeclared identifier 'idx'
           for (idx = 0; idx < bmap->max_count; idx += 512) {
                                                ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:333:37: error: use of undeclared identifier 'idx'
                   b =  bmap->bitmap + BITS_TO_LONGS(idx);
                                                     ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:334:33: error: use of undeclared identifier 'idx'
                   nbits = min(bmap->max_count - idx, 512);
                                                 ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:334:33: error: use of undeclared identifier 'idx'
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:338:30: error: use of undeclared identifier 'idx'
                                     "line 0x%04x: %*pb\n", idx / 512, nbits, b);
                                                            ^
   7 errors generated.


vim +/idx +332 drivers/net/ethernet/qlogic/qed/qed_rdma.c

   318	
   319	void qed_rdma_bmap_free(struct qed_hwfn *p_hwfn,
   320				struct qed_bmap *bmap, bool check)
   321	{
   322		unsigned int pos, weight, nbits;
   323		unsigned long *b;
   324	
   325		if (!check || !(weight = bitmap_weight(bmap->bitmap, bmap->max_count)))
   326			goto end;
   327	
   328		DP_NOTICE(p_hwfn,
   329			  "%s bitmap not free - size=%d, weight=%d, 512 bits per line\n",
   330			  bmap->name, bmap->max_count, weight);
   331	
 > 332		for (idx = 0; idx < bmap->max_count; idx += 512) {
   333			b =  bmap->bitmap + BITS_TO_LONGS(idx);
   334			nbits = min(bmap->max_count - idx, 512);
   335	
   336			if (!bitmap_empty(b, nbits))
   337				DP_NOTICE(p_hwfn,
   338					  "line 0x%04x: %*pb\n", idx / 512, nbits, b);
   339		}
   340	
   341	end:
   342		kfree(bmap->bitmap);
   343		bmap->bitmap = NULL;
   344	}
   345	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
