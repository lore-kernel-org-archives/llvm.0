Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3514C17C8;
	Sun, 29 Jan 2023 00:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674953227; x=1706489227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1xLZJrP1WOhAOE8tSf2rctG3P9HMqo0HdKAtGrHT2uo=;
  b=FVxYjvZ42Sev2uMfZ/UNg9G2lhMyw/Zb7STJhL29gCa6DEh9MSVgC9kp
   EMMlFOVIJjYwXGBA2Iatxxq3mUy9FIXVIKmfXquPUn1B6vDF60ugxn7rD
   CLc1ccPTE8Nbi0ZMzGn7qmvIC5O+sNUNFMESciLQCMH+jheqNY8TPKfxb
   SduBnn+KrEPwkdeQn+fD4NssBxRxy5z9mRiDwX9IzU5FYukfh95eMVs6m
   QDjf7TbPZSSLB6N1tjWvTxoli7LMUGgOcDR7vfdwFKD2HYfLPdgd9w6AY
   2N12O7Hmx0gh5oDWAKeJEtSI8RlxoJVDdLqw3JBp0J75z3oz+i9Ew8PSz
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="329478146"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="329478146"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 16:47:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="752390875"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="752390875"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2023 16:47:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLvqW-0001H6-03;
	Sun, 29 Jan 2023 00:47:00 +0000
Date: Sun, 29 Jan 2023 08:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Price <steven.price@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 05/28] arm64: RME: Define the user ABI
Message-ID: <202301290828.qs1XtUBs-lkp@intel.com>
References: <20230127112932.38045-6-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127112932.38045-6-steven.price@arm.com>

Hi Steven,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.2-rc5 next-20230127]
[cannot apply to kvmarm/next kvm/queue kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Price/arm64-RME-Add-SMC-definitions-for-calling-the-RMM/20230128-180035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230127112932.38045-6-steven.price%40arm.com
patch subject: [RFC PATCH 05/28] arm64: RME: Define the user ABI
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230129/202301290828.qs1XtUBs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8ea2cfe90a1d6ee4dff4fdedef77ac12daf037d1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Steven-Price/arm64-RME-Add-SMC-definitions-for-calling-the-RMM/20230128-180035
        git checkout 8ea2cfe90a1d6ee4dff4fdedef77ac12daf037d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/kvm.h:1177:29: warning: // comments are not allowed in this language [-Wcomment]
   #define KVM_CAP_ARM_RME 300 // FIXME: Large number to prevent conflicts
                               ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
