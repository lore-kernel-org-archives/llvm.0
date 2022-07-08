Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D57A
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 00:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657238594; x=1688774594;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4pnh6u/Th2OWmbYptilPO7fuupk51rgY9liFBuBuWVI=;
  b=MuYjCF66nrExPDOFprUq1S7i0EDUvCBytYWpIgP3Y0vAFTxyW8leYN1Z
   7TZChflxcnIC9P4D9M5A4IoJIl6z09Rh89B5jizJ7eaw/8V7Hb6Zzp0l2
   OEc+2wqU5df/+Q0DQipjTRYDDnIVKin8eZUNf12WdYVp7jWMGgHTEREV4
   XlC/t/wZ7F2WxB9eMHQw3UOzwLQmZLSo99q72XvkU85Z4Xf6iOBokhAh7
   SAyisRMGCcPm7ZmKEklgM4iEzmHfFd7i8AuXyD+klR5HfDZYjFa9fNpgp
   OvsLph7B8j05Bm/WH3BMRRcUoXCYCgUTI+THBclqNnxD86Yt3+W8g5hAV
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="284889600"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="284889600"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 17:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="736151570"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2022 17:03:12 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9bSi-000Mdu-4s;
	Fri, 08 Jul 2022 00:03:12 +0000
Date: Fri, 8 Jul 2022 08:02:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [intel-tdx:guest-hardening-rebased 10/23] vmlinux.o: warning:
 objtool: pv_ops[1]: native_write_msr
Message-ID: <202207080721.jEHxtC8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Andi Kleen <ak@linux.intel.com>
CC: Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-hardening-rebased
head:   64a4c4e66ca9cce1ca55de6d801f32284fbf7c8e
commit: 4a852dcd0f95fe90d005c6bceefb3376a99389d2 [10/23] x86/tdx/paravirt: Move wrmsrl outside PARAVIRT_XXL
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220708/202207080721.jEHxtC8x-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 66ae1d60bb278793fd651cece264699d522bab84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/4a852dcd0f95fe90d005c6bceefb3376a99389d2
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-hardening-rebased
        git checkout 4a852dcd0f95fe90d005c6bceefb3376a99389d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: pv_ops[1]: native_write_msr
>> vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x155: call to pv_ops[0]() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x2f: call to memset() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
