Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861302F2B;
	Thu, 27 Apr 2023 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682605594; x=1714141594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vE9yH8Pnoh2lIEjE7J3XKAtcEDV+VRSxVAQiS3UaYmo=;
  b=VWROsukxEb51h0Tk9pPkwu8YvoXYIJwF7UXmmxnZWyZSPYV4Blza0wtn
   SQS06GEWR1280s1YeCZgJArjPvf7C/c1leOU2zfjgfMT+ZUgi6jZ2BUQ5
   IYxDRtTeTQnbnOCDzfpIyZlwY8INlotX6vLnCgdHFgCbi/zaXGzvgoe9H
   U9ztY9P19AGtDySxSlOPEr0u6XepV05LJ/0iIsO7eprgg91z60oHMbQtm
   UTbu2nUwgzlDNVcSyZSw6ynD8DE72A93jol0qcDa2US++mO0E/Uw+IXUv
   MxWZlA9DwYepVIS6QkBvdYIRCOTeEkO0r8qE7fNwDLO+FCWj9uSlU3SAD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="331728748"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="331728748"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 07:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="694399592"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="694399592"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Apr 2023 07:16:23 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps2Q2-0000GL-2Y;
	Thu, 27 Apr 2023 14:16:22 +0000
Date: Thu, 27 Apr 2023 22:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:mutex 1/1] ld.lld: error: undefined symbol:
 rust_build_error
Message-ID: <202304272258.ahjFX3FV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux mutex
head:   01ae567f6c192bdef2e6e5997769ee2314ff78cd
commit: 01ae567f6c192bdef2e6e5997769ee2314ff78cd [1/1] WIP: lock guard split
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230427/202304272258.ahjFX3FV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/nbdd0121/linux/commit/01ae567f6c192bdef2e6e5997769ee2314ff78cd
        git remote add nbdd0121 https://github.com/nbdd0121/linux
        git fetch --no-tags nbdd0121 mutex
        git checkout 01ae567f6c192bdef2e6e5997769ee2314ff78cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304272258.ahjFX3FV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rust_build_error
   >>> referenced by spinlock.rs:143 (rust/kernel/sync/lock/spinlock.rs:143)
   >>>               rust/kernel.o:(<kernel::sync::lock::spinlock::SpinLockIrqSaveBackend as kernel::sync::lock::Backend<kernel::sync::lock::spinlock::SpinLockBackend>>::init) in archive vmlinux.a
--
>> warning: missing documentation for a struct
   --> rust/kernel/sync/lock/spinlock.rs:100:1
   |
   100 | pub struct SpinLockIrqSaveBackend;
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: requested on the command line with `-W missing-docs`
--
>> warning: missing documentation for an associated type
   --> rust/kernel/sync/lock.rs:78:5
   |
   78 |     type IrqSaveBackend: Backend<Self>;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
