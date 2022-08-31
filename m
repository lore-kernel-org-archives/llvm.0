Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013B4635
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 03:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661916472; x=1693452472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mkKVLN1FVgy7KEGj++OA1lU9Vke7gXhaiVMcLeNz+f8=;
  b=kSX0ZTrpqIXB5zlX+XC6ANOtRxSLul1BYXy28HbL3ZCbejYTcDpoWhIg
   JDexw9USp0aF+syW+hKZpWouwsrZJyZv35jQYhtRw+o/JBkE7iBkA1Bfi
   6yIZ8rU3gYr3u4HtKBzFDGFw/AKg9S48Tu0Mcs1BDKw3SJqHNTLmcra8I
   XuqdnS4kvseVtjDH8DZ76CumK13wc5YoO2wcuCWBm8yPbEItEAOMcZRrg
   Jo/b4qXtc+Xa6hSFqpGyYeCqqn7kw6bqjpLcVE6qcVxmjR0ByIs4rZ9xc
   NqGqEGkUkx7ElEJg+0KranIg2M5o0sXKgiaNLFmiDKMW0D9DBSLJ/Oavm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="357079866"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="357079866"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 20:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="562901092"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Aug 2022 20:27:50 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTEOL-0000wK-2X;
	Wed, 31 Aug 2022 03:27:49 +0000
Date: Wed, 31 Aug 2022 11:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 29/30] dyndbg: Convert to code tagging
Message-ID: <202208311143.j4frhpVO-lkp@intel.com>
References: <20220830214919.53220-30-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830214919.53220-30-surenb@google.com>

Hi Suren,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.0-rc3]
[cannot apply to vbabka-slab/for-next tip/sched/core xen-tip/linux-next next-20220830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/Code-tagging-framework-and-applications/20220831-055155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dcf8e5633e2e69ad60b730ab5905608b756a032f
config: hexagon-randconfig-r041-20220830 (https://download.01.org/0day-ci/archive/20220831/202208311143.j4frhpVO-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1c66bacd6cde1f37d6ac96c45b389666a1334ec0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9a1f562c47c288adda951dac5342df8d6c8f20f5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Suren-Baghdasaryan/Code-tagging-framework-and-applications/20220831-055155
        git checkout 9a1f562c47c288adda951dac5342df8d6c8f20f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: codetag_lock_module_list
   >>> referenced by dynamic_debug.c
   >>>               dynamic_debug.o:(ddebug_exec_queries) in archive lib/built-in.a
   >>> referenced by dynamic_debug.c
   >>>               dynamic_debug.o:(ddebug_exec_queries) in archive lib/built-in.a
   >>> referenced by dynamic_debug.c
   >>>               dynamic_debug.o:(ddebug_exec_queries) in archive lib/built-in.a
   >>> referenced 9 more times
--
>> ld.lld: error: undefined symbol: codetag_init_iter
   >>> referenced by dynamic_debug.c
   >>>               dynamic_debug.o:(ddebug_exec_queries) in archive lib/built-in.a
   >>> referenced by dynamic_debug.c
   >>>               dynamic_debug.o:(ddebug_exec_queries) in archive lib/built-in.a
   >>> referenced by dynamic_debug.c
   >>>               dynamic_debug.o:(ddebug_proc_open) in archive lib/built-in.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: codetag_next_ct
   >>> referenced by dynamic_debug.c
   >>>               dynamic_debug.o:(ddebug_exec_queries) in archive lib/built-in.a
   >>> referenced by dynamic_debug.c
   >>>               dynamic_debug.o:(ddebug_exec_queries) in archive lib/built-in.a
   >>> referenced by dynamic_debug.c
   >>>               dynamic_debug.o:(ddebug_exec_queries) in archive lib/built-in.a
   >>> referenced 3 more times
--
>> ld.lld: error: undefined symbol: codetag_register_type
   >>> referenced by dynamic_debug.c
   >>>               dynamic_debug.o:(dynamic_debug_init) in archive lib/built-in.a
   >>> referenced by dynamic_debug.c
   >>>               dynamic_debug.o:(dynamic_debug_init) in archive lib/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
