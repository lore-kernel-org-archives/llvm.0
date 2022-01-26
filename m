Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16882CA3
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 18:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643223278; x=1674759278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1p0cblke1yExFuE7116c1ku2DF+OVoMFfwOVJEjFF1M=;
  b=MfSMou7ChWpEXDdEblL60DbOoscw/7a9VmuVwC4jbGvrrCGXW03ca7Al
   Up8tkiQkqXM83n9r7EM9ORynFYvan70x1nl10EJwISEl8I7FYMeYK//fI
   ZJj/fPML5GWP6FNuEz2kNnGcReeQqrzziVxVAOE3Mi4byMql8nuFAK4Nb
   BDDMr5ogSsjstaWJcynFiXbKO1QnXVZbfvS8bWFPIOav8LkDuK2DL/MkW
   vxDF8g7+1dG6W2Sd5GxVJzZ0n9CB025cGHBBNK4CvmUfO7t3zXdNoacbC
   swqiaZPiKSiS0OJ7jIs7vDRjZOYF153HIj1Ty6/OXNXPjDBIXtaWd+4Mu
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309936327"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="309936327"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 10:53:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="628397799"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Jan 2022 10:53:10 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCnPp-000LWg-NG; Wed, 26 Jan 2022 18:53:09 +0000
Date: Thu, 27 Jan 2022 02:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [intel-tdx:host-upstream 7/18] arch/x86/kernel/cpu/tdx/tdx.c:148:30:
 warning: variable 'err' is uninitialized when used within its own
 initialization
Message-ID: <202201270252.bK9LlDe7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/intel/tdx.git host-upstream
head:   6806a9874cdac7e51e15c056986098bf94a062aa
commit: b9feae73d1b45e81a7d573531ee2e594ccea51b5 [7/18] x86/cpu: Do logical cpu level TDX module initialization
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220127/202201270252.bK9LlDe7-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/b9feae73d1b45e81a7d573531ee2e594ccea51b5
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx host-upstream
        git checkout b9feae73d1b45e81a7d573531ee2e594ccea51b5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/cpu/tdx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/tdx/tdx.c:148:30: warning: variable 'err' is uninitialized when used within its own initialization [-Wuninitialized]
           atomic_t *err = (atomic_t *)err;
                     ~~~               ^~~
   1 warning generated.


vim +/err +148 arch/x86/kernel/cpu/tdx/tdx.c

   144	
   145	/* SMP call function to run TDH.SYS.LP.INIT */
   146	static void smp_call_tdx_cpu_init(void *data)
   147	{
 > 148		atomic_t *err = (atomic_t *)err;
   149	
   150		if (tdh_sys_lp_init())
   151			atomic_set(err, -1);
   152	}
   153	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
