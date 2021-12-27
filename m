Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CD72C82
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 19:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640632836; x=1672168836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5qPmzy9sn+NRM9Zgy3Od0b1mCgeekHEPWxTmGO+1g28=;
  b=aRvyP8f73D7SBVRdBn0NKAAAg+MiRRpUg0I4eH5EwrwsDf3rFw/PCpSh
   YMcua+n1uLbmY+d/783zOm9fN2hLF3ddGQW8w2XuQWGfWkWptRwRpFJ0F
   SxH6GmESB747aGmU3rFCWxGBCTMjtn7m2ziR5gpUF0PQpV+UGvjFmebFN
   FkNdNJ/v7r4yfwmSwXbb3AiJUGDozRVCVAd2EvEi7jy+oaAzleRDmM2Hb
   4NUVuBbp6zhZL1pneaSzs7Kr2cPvWJ8QamFU1sCBEbL4et/8DyZAWvdfs
   73Al+jz9LVDEmXlRdmSeEnAJwGY/R4jN/XfSDwlut11qe1N2f7DQlHU82
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="241211963"
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; 
   d="scan'208";a="241211963"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 11:20:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; 
   d="scan'208";a="686375600"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Dec 2021 11:20:33 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1vXt-0006ir-8b; Mon, 27 Dec 2021 19:20:33 +0000
Date: Tue, 28 Dec 2021 03:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Atish Patra <Atish.Patra@wdc.com>, linux-kernel@vger.kernel.org
Subject: [atishp04:isa_ext_support 3/4] arch/riscv/kernel/cpufeature.c:82:24:
 warning: address of array 'edata->dtprop' will always evaluate to 'true'
Message-ID: <202112280309.fgjGevFd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/atishp04/linux isa_ext_support
head:   cf2f3fa532aa7c672f681ca0685046c738bfb45f
commit: ae97a995345b68c472f3a904fc8fbefaa97ae26a [3/4] RISC-V: Provide a framework for parsing multi-letter ISA extensions
config: riscv-randconfig-c006-20211226 (https://download.01.org/0day-ci/archive/20211228/202112280309.fgjGevFd-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 0c553cc1af2e4c14100df6cf4a6fc91987e778e6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/atishp04/linux/commit/ae97a995345b68c472f3a904fc8fbefaa97ae26a
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 isa_ext_support
        git checkout ae97a995345b68c472f3a904fc8fbefaa97ae26a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/cpufeature.c:82:24: warning: address of array 'edata->dtprop' will always evaluate to 'true' [-Wpointer-bool-conversion]
           if (!edata || !edata->dtprop)
                         ~~~~~~~~^~~~~~
   1 warning generated.


vim +82 arch/riscv/kernel/cpufeature.c

    76	
    77	int riscv_isa_ext_list_add(struct riscv_isa_ext_data *edata)
    78	{
    79		struct device_node *node, *enode;
    80		int eid;
    81	
  > 82		if (!edata || !edata->dtprop)
    83			return -EINVAL;
    84	
    85		node = of_find_node_by_path("/cpus");
    86		if (!node) {
    87			pr_err("No CPU information found in DT\n");
    88			return -ENOENT;
    89		}
    90	
    91		enode = of_get_child_by_name(node, "riscv,isa-ext");
    92		if (!enode) {
    93			pr_err("No riscv-isa-ext found in DT\n");
    94			return -ENOENT;
    95		}
    96	
    97		eid = edata->isa_ext_id;
    98		if (eid < RISCV_ISA_EXT_BASE || eid >= RISCV_ISA_EXT_MAX)
    99			return -EINVAL;
   100	
   101		if (!of_property_read_bool(enode, edata->dtprop)) {
   102			pr_err("The ISA extension %s is not present in DT\n", edata->dtprop);
   103			return -ENODEV;
   104		}
   105	
   106		/* Enable the extension id in the riscv_isa for easier probing */
   107		riscv_isa[0] |= 1 << eid;
   108		list_add(&edata->node, &riscv_isa_ext_list);
   109		pr_info("RISC-V ISA extension '%s' available\n", edata->uprop);
   110	
   111		return 0;
   112	}
   113	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
