Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBD3369
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 02:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661914041; x=1693450041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ht5B9ekbboe/7VOB1RjUCJ2PQ112/BvA7EJ9QDcm+rM=;
  b=Iqo/jqYVsP7vwA7P9T4q97prlxZFGyE203QykB4QI7+Alb72iIoMxTIY
   h14a1BPfhGE2gSF3/7qek0yQsU6DNa4+jeRXy3tQffzQwtGx0HFR2Bbz/
   SXi/cGdYjr+nHd4vxN4iFhfBzs2/q31xlMjT86LH2UOyjLe4yHGij8tT/
   iIk9d5GJOUiXbfpVc8kulMyNtyK0GS04MHNuIlrP/Pp3ETvQJ+nf9O/pO
   fm815DzjYCkWE9TC1pGQFdN9gMCB7NmzA3TTvkQkqYIuJmP5yPplFk0p0
   Bwj6V6vLD6FV2y5b4e7G5XhjCyNVEYpDXvuM8Vt4zCUCpRtNEHTNk/7/p
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="278373858"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="278373858"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 19:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="680273529"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Aug 2022 19:46:49 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTDke-0000uN-1O;
	Wed, 31 Aug 2022 02:46:48 +0000
Date: Wed, 31 Aug 2022 10:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 28/30] Improved symbolic error names
Message-ID: <202208311028.RMa7Foh1-lkp@intel.com>
References: <20220830214919.53220-29-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830214919.53220-29-surenb@google.com>

Hi Suren,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.0-rc3]
[cannot apply to vbabka-slab/for-next tip/sched/core xen-tip/linux-next next-20220830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/Code-tagging-framework-and-applications/20220831-055155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dcf8e5633e2e69ad60b730ab5905608b756a032f
config: s390-randconfig-r044-20220830 (https://download.01.org/0day-ci/archive/20220831/202208311028.RMa7Foh1-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1c66bacd6cde1f37d6ac96c45b389666a1334ec0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8b71efada47e1ca3e6cb45ef71f3421ecff787df
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Suren-Baghdasaryan/Code-tagging-framework-and-applications/20220831-055155
        git checkout 8b71efada47e1ca3e6cb45ef71f3421ecff787df
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390x-linux-ld: DWARF error: invalid or unhandled FORM value: 0x23
   lib/errname.o: in function `errname_init':
>> errname.c:(.init.text+0x26): undefined reference to `codetag_register_type'
   s390x-linux-ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem':
   cistpl.c:(.text+0x82): undefined reference to `iounmap'
   s390x-linux-ld: drivers/pcmcia/cistpl.o: in function `pcmcia_read_cis_mem':
   cistpl.c:(.text+0x19a): undefined reference to `ioremap'
   s390x-linux-ld: cistpl.c:(.text+0x21c): undefined reference to `iounmap'
   s390x-linux-ld: cistpl.c:(.text+0x22e): undefined reference to `ioremap'
   s390x-linux-ld: cistpl.c:(.text+0x2ee): undefined reference to `ioremap'
   s390x-linux-ld: cistpl.c:(.text+0x37a): undefined reference to `iounmap'
   s390x-linux-ld: cistpl.c:(.text+0x3ec): undefined reference to `iounmap'
   s390x-linux-ld: cistpl.c:(.text+0x3fe): undefined reference to `ioremap'
   s390x-linux-ld: drivers/pcmcia/cistpl.o: in function `pcmcia_write_cis_mem':
   cistpl.c:(.text+0x546): undefined reference to `ioremap'
   s390x-linux-ld: cistpl.c:(.text+0x5c2): undefined reference to `iounmap'
   s390x-linux-ld: cistpl.c:(.text+0x5d4): undefined reference to `ioremap'
   s390x-linux-ld: cistpl.c:(.text+0x692): undefined reference to `ioremap'
   s390x-linux-ld: cistpl.c:(.text+0x728): undefined reference to `iounmap'
   s390x-linux-ld: cistpl.c:(.text+0x758): undefined reference to `iounmap'
   s390x-linux-ld: cistpl.c:(.text+0x76a): undefined reference to `ioremap'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
