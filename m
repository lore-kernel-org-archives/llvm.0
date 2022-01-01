Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C4029CA
	for <llvm@lists.linux.dev>; Sat,  1 Jan 2022 02:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641004644; x=1672540644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sBc1JS2cF6Qa2rTqvZdc4ZE0cVXxhO0M6fDNq8YEhKc=;
  b=EOevUbBvW4Ac9hq+hUinKrA/J/MjZ0rpufhG6UoEHwmVgqq7EGyHelBs
   OVhIDB9APLMyBVBRmwQ2R7G6b7JQg/bbBb39pqZvo33ujKDFtHiq5c9oE
   Uo2O4jwCHin4v0WNdnZ53SXzE7VWhSP5GndI4yjSL8dLN2Ys+MQC70WaH
   eY23cin1ivvrEu4SwuEkkCjKFusaZ3/A4mSrZus1WpilL0owLeHRzawQb
   JCjA1g+4cAET7pPZTmnA6dfeyICXtO6rYXeaSDmf21im7jdMtSIoFdTKA
   qs/Bj1T8HihnrnCnzcE75+a0vshsThW+DOHUx0fvPK4QGwm40J3v9qary
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10214"; a="222536056"
X-IronPort-AV: E=Sophos;i="5.88,252,1635231600"; 
   d="scan'208";a="222536056"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2021 18:37:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,252,1635231600"; 
   d="scan'208";a="666920883"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 Dec 2021 18:37:22 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n3UGo-000BuI-0u; Sat, 01 Jan 2022 02:37:22 +0000
Date: Sat, 1 Jan 2022 10:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 1/2] RISC-V: Provide a framework for parsing
 multi-letter ISA extensions
Message-ID: <202201011012.ZeiwqIeg-lkp@intel.com>
References: <20211224211632.1698523-2-atishp@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224211632.1698523-2-atishp@rivosinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Atish,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on robh/for-next linus/master v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Atish-Patra/Provide-a-fraemework-for-RISC-V-ISA-extensions/20211225-051801
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 136057256686de39cc3a07c2e39ef6bc43003ff6
config: riscv-randconfig-r024-20220101 (https://download.01.org/0day-ci/archive/20220101/202201011012.ZeiwqIeg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c054402170cd8466683a20385befc0523aba3359)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/30cc2f98601a733995aadbd52fbcefbb5c37511d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Atish-Patra/Provide-a-fraemework-for-RISC-V-ISA-extensions/20211225-051801
        git checkout 30cc2f98601a733995aadbd52fbcefbb5c37511d
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
