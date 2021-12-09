Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A02768
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639059751; x=1670595751;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Y3dkc4QxDTBpYV0Hptiiq9+7mOa2IrjtYWZrE3J4iTs=;
  b=kXwHKD4O9nBGIgl4w8o+XfkXM6wa+L7n8R47eMluXUNNowjbk32RCmBw
   kdxTI+z1vvRcQ1hbjjKqY89M9WiHr4o1Jmvmba7GRqED4gBu5B8Tk3i6i
   iCLCMpsuRTVt/RUaoT6DIf2FEHZmgYmW2UTtcpGXuAQEo8OFhsXvYWrLL
   +1947hupYr7+0PhFsyGzO89fBcROKwENUjJSs5cp7reloebsOXyFwOC5i
   bBqByFxNfH6d0IMtXsDZiB1P7Y3r2U54q/3sN/WOMJ6vrp9LNQACrKF0c
   Zv06pQCTxCjQXZkQm3jwjGDqIfBjCNjOrPGKls/cT3uthmw9PxIKKtnXA
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235617256"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; 
   d="scan'208";a="235617256"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 06:22:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; 
   d="scan'208";a="516672354"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 09 Dec 2021 06:22:29 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvKJY-00020c-2X; Thu, 09 Dec 2021 14:22:28 +0000
Date: Thu, 9 Dec 2021 22:21:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [intel-tdx:guest 143/144] arch/x86/kernel/head_64.o: warning:
 objtool: verify_cpu()+0x4d: unreachable instruction
Message-ID: <202112092243.McNUP2KL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Andi Kleen <ak@linux.intel.com>
CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest
head:   41fe88a1b3c28543f49fa6ed9e0e9b6650ed7614
commit: 4844d5297235bef6b92fe9d0649d2f066f623d5a [143/144] [REVERTME] x86/tdx: Add CONFIG option for KVM SDV workarounds
config: x86_64-randconfig-a011-20211209 (https://download.01.org/0day-ci/archive/20211209/202112092243.McNUP2KL-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/4844d5297235bef6b92fe9d0649d2f066f623d5a
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest
        git checkout 4844d5297235bef6b92fe9d0649d2f066f623d5a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: warning: objtool: verify_cpu()+0x4d: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
