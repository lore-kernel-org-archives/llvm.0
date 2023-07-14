Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05341C3A;
	Fri, 14 Jul 2023 03:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689306509; x=1720842509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qud0wDzdzTShg/hLUn0gIUhHJLKjlH4u8Mu721IwsbE=;
  b=JhZTyrl3sikecLQXFbOm6OeRL7Uqv491dLx6IHReaX5QzAkflsgR9KXQ
   fPXh+UEUjB+PQzwG5+IXnjzSJxyVtDNqF5QmCjNbVYQJp/4Au9CCxORIl
   2iA843tZdhlmmKyn46n3DqApRxm4Sd4rqzM06hqWkor960QdcTesU43Na
   iu4KhJCnTZdwyx5zfqejGY+rNJpnPCMZFwyxGw3ye2LYDvQYDh7VZJZQc
   bMNRC8w8dSSIW9zK7BHLagUmCwtMcjo6JXvNtK3HV9ck4nqAscEn9kkWt
   x/TfWrqNUS5WDimqx0oBUYWpV7tVeqyZbz/frfIkp/k7JTvV22uXsgbkQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451746311"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="451746311"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 20:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792302595"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="792302595"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2023 20:48:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK9n2-00079O-2R;
	Fri, 14 Jul 2023 03:48:20 +0000
Date: Fri, 14 Jul 2023 11:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 25/57]
 arch/x86/kernel/apic/apic_common.c:47:6: warning: no previous prototype for
 function 'default_init_apic_ldr'
Message-ID: <202307141101.WNeAwKRr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   39d1f9d6ad3d4b9bf9c298db5685f22d8fe6e2c0
commit: e7719cffb7321ace1a049e51ea5c27e0e9744c47 [25/57] x86/apic: Nuke empty init_apic_ldr() callbacks
config: i386-randconfig-i003-20230713 (https://download.01.org/0day-ci/archive/20230714/202307141101.WNeAwKRr-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141101.WNeAwKRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141101.WNeAwKRr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/apic/apic_common.c:47:6: warning: no previous prototype for function 'default_init_apic_ldr' [-Wmissing-prototypes]
   void default_init_apic_ldr(void)
        ^
   arch/x86/kernel/apic/apic_common.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void default_init_apic_ldr(void)
   ^
   static 
   1 warning generated.


vim +/default_init_apic_ldr +47 arch/x86/kernel/apic/apic_common.c

    42	
    43	/*
    44	 * Set up the logical destination ID when the APIC operates in logical
    45	 * destination mode.
    46	 */
  > 47	void default_init_apic_ldr(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
