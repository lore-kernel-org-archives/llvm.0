Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A449F28EC
	for <llvm@lists.linux.dev>; Sun,  1 May 2022 22:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651444231; x=1682980231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTpaTEN2r/J6s4XisfUsH2CvcJKBnF900FPluiBMKy4=;
  b=jOakhZEUqzI/CpKR7rTU/0YmosAsooSCyFGwyNDsLcKtxcVAjUD9alSH
   3rx78xMSQKwUAncDd/6/QV9T6Y0qHCh61GIcWTImYfbBTQ7lGUJIGaiyV
   yyPDg7nMhDKhWxN+TuaYXLotvC/5/dAfU9VxNiXpxt1VAtmzndZsDW8YB
   HVUuyDSwvyyZjA4YUUUzlE1RWIm2uWE4HCaCgB5WZ4b0ipSY5ZQ5zPT1F
   uvQyscLnkicBQ8J8o+m0yG47y9D5a9fOzstWeFlKuu8gy8kHEAPX1X18/
   Bb5ghxnmstn4OqjXBwmZYmFGRqj52k8BWP/JNIaJNb8XE2lypHrsn6roh
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="266938603"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="266938603"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 15:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="733153395"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 May 2022 15:30:28 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlI5E-00095r-03;
	Sun, 01 May 2022 22:30:28 +0000
Date: Mon, 2 May 2022 06:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: ld.lld: error: inline assembly requires more registers than
 available at line 523
Message-ID: <202205020637.JVJo3blw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
commit: ba1f77c546966c12d86220d078e5838dcaeab348 x86/kvm: Fix compilation warning in non-x86_64 builds
date:   2 months ago
config: i386-randconfig-a012-20220502 (https://download.01.org/0day-ci/archive/20220502/202205020637.JVJo3blw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ba1f77c546966c12d86220d078e5838dcaeab348
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ba1f77c546966c12d86220d078e5838dcaeab348
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: inline assembly requires more registers than available at line 523
>> ld.lld: error: inline assembly requires more registers than available at line 523

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
