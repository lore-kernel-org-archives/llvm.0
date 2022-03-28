Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A0617E9
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 07:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648453846; x=1679989846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bwSBRAa8HA0GcfpqH7w9Fxj5P+yjLJt7tgYCifEKSMM=;
  b=FJsfS5l6xQ3ZXQ+Hcw+GDeGxksmXdAmXLOuNfJ6wjqpwtqHhXQfRCFPC
   gnbLIZmyMCTjA0cn1It0HIlqXLSN72ttf1ey0IqnwAh0m/oyceY4ctt8X
   8kOETujyHNM/StOLjUD66JHfxpyj2+u/4lx0b00xfcQOg7O04dmObyaq7
   lTuyM1wAGhUw9+EGT59hV3j2JxpZTJxTR2JoLGEtBOo1x3iMXFtSOIFmw
   7ZHpeHebfKxCrQSPGMGsZugCAVZSrz4RXWKOXKfzlEFxrCa5UVt/4p61B
   RYM5zj2KPXRyUH+xeg/lrew5y3BrSP/C2d+qMOcqLK8bjO/g6BmUTDPgP
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="256513928"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="256513928"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2022 00:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="603910700"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Mar 2022 00:50:40 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYk99-0001qx-Ny; Mon, 28 Mar 2022 07:50:39 +0000
Date: Mon, 28 Mar 2022 15:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Haowen Bai <baihaowen@meizu.com>, dave.hansen@linux.intel.com,
	luto@kernel.org, peterz@infradead.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Haowen Bai <baihaowen@meizu.com>
Subject: Re: [PATCH] x86/mm: Directly return instead of using local ret
 variable
Message-ID: <202203281559.hHXuSFrA-lkp@intel.com>
References: <1648433573-25735-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648433573-25735-1-git-send-email-baihaowen@meizu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Haowen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tip/x86/mm]
[also build test ERROR on v5.17 next-20220325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Haowen-Bai/x86-mm-Directly-return-instead-of-using-local-ret-variable/20220328-101514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git b64dfcde1ca9cb82e38e573753f0c0db8fb841c2
config: i386-randconfig-a014-20220328 (https://download.01.org/0day-ci/archive/20220328/202203281559.hHXuSFrA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/852ab1aec48033b3a4df180698ab9c29aca0b248
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Haowen-Bai/x86-mm-Directly-return-instead-of-using-local-ret-variable/20220328-101514
        git checkout 852ab1aec48033b3a4df180698ab9c29aca0b248
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/mm/pf_in.c:138:2: error: use of undeclared identifier 'rv'
           CHECK_OP_TYPE(opcode, reg_rop, REG_READ);
           ^
   arch/x86/mm/pf_in.c:122:4: note: expanded from macro 'CHECK_OP_TYPE'
                           rv = type; \
                           ^
   arch/x86/mm/pf_in.c:139:2: error: use of undeclared identifier 'rv'
           CHECK_OP_TYPE(opcode, reg_wop, REG_WRITE);
           ^
   arch/x86/mm/pf_in.c:122:4: note: expanded from macro 'CHECK_OP_TYPE'
                           rv = type; \
                           ^
   arch/x86/mm/pf_in.c:140:2: error: use of undeclared identifier 'rv'
           CHECK_OP_TYPE(opcode, imm_wop, IMM_WRITE);
           ^
   arch/x86/mm/pf_in.c:122:4: note: expanded from macro 'CHECK_OP_TYPE'
                           rv = type; \
                           ^
   3 errors generated.


vim +/rv +138 arch/x86/mm/pf_in.c

8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  118  
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  119  #define CHECK_OP_TYPE(opcode, array, type) \
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  120  	for (i = 0; i < ARRAY_SIZE(array); i++) { \
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  121  		if (array[i] == opcode) { \
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  122  			rv = type; \
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  123  			goto exit; \
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  124  		} \
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  125  	}
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  126  
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  127  enum reason_type get_ins_type(unsigned long ins_addr)
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  128  {
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  129  	unsigned int opcode;
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  130  	unsigned char *p;
611b1597680dd4a arch/x86/mm/pf_in.c               Pekka Paalanen 2008-07-21  131  	struct prefix_bits prf;
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  132  	int i;
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  133  
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  134  	p = (unsigned char *)ins_addr;
611b1597680dd4a arch/x86/mm/pf_in.c               Pekka Paalanen 2008-07-21  135  	p += skip_prefix(p, &prf);
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  136  	p += get_opcode(p, &opcode);
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  137  
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12 @138  	CHECK_OP_TYPE(opcode, reg_rop, REG_READ);
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  139  	CHECK_OP_TYPE(opcode, reg_wop, REG_WRITE);
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  140  	CHECK_OP_TYPE(opcode, imm_wop, IMM_WRITE);
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  141  
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  142  exit:
852ab1aec48033b arch/x86/mm/pf_in.c               Haowen Bai     2022-03-28  143  	return OTHERS;
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  144  }
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  145  #undef CHECK_OP_TYPE
8b7d89d02ef3c6a arch/x86/kernel/mmiotrace/pf_in.c Pekka Paalanen 2008-05-12  146  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
