Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143EC2590
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 09:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646213879; x=1677749879;
  h=date:from:cc:subject:message-id:mime-version;
  bh=evUPQy3BIAgmZbhVKbFXRyHcDIl4BPqDh4rwJyQvzlc=;
  b=F+l0ALweOCuapof28bf0YhlBXvcArr1e8AC6iNqGRlWJuqb3EDK/mW5c
   EtO2ikDGQ0yiRWDZ2kcMqbbsorEr9QzJym4GOS2fZHaD/+zFZdOPg+2kx
   TrpsbnHzoM5Co9jHR0EKidubX8DvzDAsrpAO2nRxFfK4BaQNIe3s2dXtB
   L9ro0EzhxoxRs0RbpnmEqiSJJMKOV3I2N7vAJNNuDOXfnyk0ed6IM6+tD
   eB53/zmXED/cYKKMBAXgYfX6GIfeauQHBVYrJ6/v2YA/WuWVbtf7EAaWk
   W32uQlKGWFKR7UYoHAUA9arG4Oy29VYZ3oAhv/usOa11/PQCc/s2WW4Kc
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="250936417"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; 
   d="scan'208";a="250936417"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 01:37:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; 
   d="scan'208";a="535320071"
Received: from lkp-server02.sh.intel.com (HELO e9605edfa585) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Mar 2022 01:37:57 -0800
Received: from kbuild by e9605edfa585 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nPLQi-0001Hh-Mw; Wed, 02 Mar 2022 09:37:56 +0000
Date: Wed, 2 Mar 2022 17:37:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:x86/wip.ibt.ud1 54/64] arch/x86/entry/entry_64.o:
 warning: objtool: irq_entries_start()+0x7: unreachable instruction
Message-ID: <202203021713.r3VNPHZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/wip.ibt.ud1
head:   b39e18bc9a7e5f1212dbc59c526d7505af6a70af
commit: 411552ab5884b1b0b0a17d2f377d72d6e367e834 [54/64] objtool: Have WARN_FUNC fall back to sym+off
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220302/202203021713.r3VNPHZ7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=411552ab5884b1b0b0a17d2f377d72d6e367e834
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.ibt.ud1
        git checkout 411552ab5884b1b0b0a17d2f377d72d6e367e834
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/entry/entry_64.o: warning: objtool: irq_entries_start()+0x7: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
