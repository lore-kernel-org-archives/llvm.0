Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477DA1869
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655921581; x=1687457581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kWllMF9oZEgWO456YfAB4Nn12pwMbxEk0EnZ7zp587k=;
  b=D5fUFBd8i9bhlxif0jJ8SeHmA2KU+Hvhk/W4y0PS/GyJzExLWrNzo433
   0W3Hnz6z8L70vTq/Kor8B+Uni6BHS/Kbxgh3NplqHhapnDjUykenAeX4s
   JW4crvUnqiW2Lb/lQ5SbCCG7uSR+Rgy2/scDYn60gYDS6kSFpaDVW3sfv
   EVaq2GYGn1obPtixGL3OaQQuhUt/lw5s58QWp1R+6GC5y9FLpIaqtBHXy
   AsqiGZymZhxrNX8J/89AEYDjHI0ikjsqbJbDzHF84ukgjmwFBSOgFe/8j
   Yd74+gw6BqmwO8EBJVZd2KPbjEjJxwGMFNYgB9EXd7hfrtE+rhz2QhHVM
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="269220344"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="269220344"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 10:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="588286532"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Jun 2022 10:47:56 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o44SJ-0001XX-DB;
	Wed, 22 Jun 2022 17:47:55 +0000
Date: Thu, 23 Jun 2022 01:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Subject: [jirislaby:lto 32/45] arch/x86/kernel/paravirt.c:123:15: warning: no
 previous prototype for function 'native_steal_clock'
Message-ID: <202206230120.YLCB69tS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git lto
head:   8047611082d70c5263114fabce8c80a4c3d251fa
commit: b2efc66d269d1bb2b1b2a8aac7e873ed266678ba [32/45] x86/paravirt/lto: Export native_steal_clock
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220623/202206230120.YLCB69tS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8b8d126598ce7bd5243da7f94f69fa1104288bee)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?id=b2efc66d269d1bb2b1b2a8aac7e873ed266678ba
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git
        git fetch --no-tags jirislaby lto
        git checkout b2efc66d269d1bb2b1b2a8aac7e873ed266678ba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/paravirt.c:123:15: warning: no previous prototype for function 'native_steal_clock' [-Wmissing-prototypes]
   __visible u64 native_steal_clock(int cpu)
                 ^
   arch/x86/kernel/paravirt.c:123:11: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __visible u64 native_steal_clock(int cpu)
             ^
             static 
   1 warning generated.


vim +/native_steal_clock +123 arch/x86/kernel/paravirt.c

   122	
 > 123	__visible u64 native_steal_clock(int cpu)
   124	{
   125		return 0;
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
