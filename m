Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0012CA0
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 09:09:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237763928"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="237763928"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 01:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="502513425"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 07 Dec 2021 01:09:51 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1muWTu-000MNo-Hv; Tue, 07 Dec 2021 09:09:50 +0000
Date: Tue, 7 Dec 2021 17:09:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: PLEASE submit a bug report to https://bugs.llvm.org/ and include the
 crash backtrace.
Message-ID: <202112071631.CBbW0V0o-lkp@intel.com>
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
TO: Matthew Auld <matthew.auld@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: 5740211ea442dbfd143093f8eea39faba186042f drm/i915/dmabuf: fix broken build
date:   6 weeks ago
config: x86_64-randconfig-a016-20211207 (https://download.01.org/0day-ci/archive/20211207/202112071631.CBbW0V0o-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f50be8eb0a12a61d23db6cda452c693001d76898)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5740211ea442dbfd143093f8eea39faba186042f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5740211ea442dbfd143093f8eea39faba186042f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %100)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %100, i64 %124)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %109)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %109, i64 %133)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %106)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %106, i64 %130)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %115)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %115, i64 %139)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %95)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %95, i64 %119)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %104)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %104, i64 %128)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %103)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %103, i64 %127)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %112)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %112, i64 %136)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %103)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %103, i64 %127)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %112)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %112, i64 %136)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %111)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %111, i64 %135)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %120)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %120, i64 %144)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %138)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %138, i64 %162)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %187)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %187, i64 %211)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %148)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %148, i64 %172)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %197)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %197, i64 %221)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %144)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %144, i64 %168)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %193)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %193, i64 %217)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %154)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %154, i64 %178)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %203)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %203, i64 %227)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %92, i64 %65)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %101, i64 %74)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %109)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %109, i64 %133)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %162)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %162, i64 %186)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %119)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %119, i64 %143)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 -1, i64 %172)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %172, i64 %196)
   LLVM ERROR: Broken module found, compilation aborted!
>> PLEASE submit a bug report to https://bugs.llvm.org/ and include the crash backtrace.
   %17)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %57, i64 %55)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 0, i64 %53)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 4096, i64 %26)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 928, i64 %4)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 32, i64 %17)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_const_cmp8(i64 32, i64 %32)
   inlinable function call in a function with debug info must have a !dbg location
     call void @__sanitizer_cov_trace_cmp8(i64 %11, i64 %1)
   LLVM ERROR: Broken module found, compilation aborted!
   Aborted

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
