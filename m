Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E80820E4
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 05:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647669184; x=1679205184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yuADXnKduv0kOgjoUJDULg6RZg5iTvyiFoxcwZ3hmrc=;
  b=AiNW/51BcDLEaC3aD/xJHWEzgKf99LuWrxy5G+8Jb3ecIZOHEueyWhgA
   oViorLFF/XQZS9NlKzGlK6gra6rFkIKixgTO9EsRN0rhOMH3wcNfnwlQM
   tl3FZbqsn7FYcA37LMGuV2gn+cy2unt/ec80+X6N8D/0RpWg1PWnRnyb9
   CNPAO/imlPQWLlfsDm0rqA555uEcZY/tMETEkYbZ5WoGEYlrM6xhi6QZO
   MawSUwEqGknAXFzgfO5LgmjRHHaG12id+vVFfU/IZzYuEWrjDD/6RIale
   7N+u4lXb9Ier8BFhyYEQUS3hBfMnnaBwuAq0vfNvyULIDxVXdGJFx1909
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="257471804"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="257471804"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 22:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="715795071"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 18 Mar 2022 22:53:02 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVS1N-000Fdx-EY; Sat, 19 Mar 2022 05:53:01 +0000
Date: Sat, 19 Mar 2022 13:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@suse.de>
Subject: [intel-tdx:guest-upstream 6/32] arch/x86/coco/tdx/tdx.c:33:6:
 warning: no previous prototype for function '__tdx_hypercall_failed'
Message-ID: <202203191320.LNIsYlbh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/intel/tdx.git guest-upstream
head:   8e1641a390cef993022d8c7fcd7e212e06ba7cd3
commit: 414852218596d11d52aa9f51f8484450c7a23712 [6/32] x86/tdx: Extend the confidential computing API to support TDX guests
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220319/202203191320.LNIsYlbh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/414852218596d11d52aa9f51f8484450c7a23712
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-upstream
        git checkout 414852218596d11d52aa9f51f8484450c7a23712
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx.c:33:6: warning: no previous prototype for function '__tdx_hypercall_failed' [-Wmissing-prototypes]
   void __tdx_hypercall_failed(void)
        ^
   arch/x86/coco/tdx/tdx.c:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __tdx_hypercall_failed(void)
   ^
   static 
   arch/x86/coco/tdx/tdx.c:18:19: warning: unused function '_tdx_hypercall' [-Wunused-function]
   static inline u64 _tdx_hypercall(u64 fn, u64 r12, u64 r13, u64 r14, u64 r15)
                     ^
   2 warnings generated.


vim +/__tdx_hypercall_failed +33 arch/x86/coco/tdx/tdx.c

3878b00acc0802 Kuppuswamy Sathyanarayanan 2021-02-21  31  
3878b00acc0802 Kuppuswamy Sathyanarayanan 2021-02-21  32  /* Called from __tdx_hypercall() for unrecoverable failure */
3878b00acc0802 Kuppuswamy Sathyanarayanan 2021-02-21 @33  void __tdx_hypercall_failed(void)
3878b00acc0802 Kuppuswamy Sathyanarayanan 2021-02-21  34  {
3878b00acc0802 Kuppuswamy Sathyanarayanan 2021-02-21  35  	panic("TDVMCALL failed. TDX module bug?");
3878b00acc0802 Kuppuswamy Sathyanarayanan 2021-02-21  36  }
414852218596d1 Kirill A. Shutemov         2022-02-18  37  

:::::: The code at line 33 was first introduced by commit
:::::: 3878b00acc0802659680a4f4ed957d30a364961b x86/tdx: Add __tdx_module_call() and __tdx_hypercall() helper functions

:::::: TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
:::::: CC: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
