Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AD7A
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 05:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644642265; x=1676178265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VhrzjzWd0KRHnH6sECEr1v/JWOY6DXDxNmHVJypyHeE=;
  b=NiVUYKrNhTWih6WACySQaTztSTSgQu1FSnmy02w+uel7EoFOY7KqCG3u
   u9j9uesT/Ufn+Ixar0BEHL5MnvJSJFqqJWrh18BXhxmaBuOLi6NmCCCq6
   Ydp8v5QvM7mPghEWgxGUi9u2MI9LlCFum4s509t9bdZGsrH7ulWHFkJDJ
   aEKFG/LDBtb/VJ1C8CzNyQPym55Rahi8KEW9wwUzcCO1JYD0UyJ53/mrq
   EqKbg8XQtem2mB//yYezSzaOTrQgBMKwpRdvKDdEzUAooaig5UneOO/wd
   bXgdYBe8R/n5XYf6GjWIqTcXMqNf3CukoYqNAt7Zx4ueeH15Ffp88N8Jg
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="233406430"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="233406430"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 21:04:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="679699925"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2022 21:04:23 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIka7-0005de-1J; Sat, 12 Feb 2022 05:04:23 +0000
Date: Sat, 12 Feb 2022 13:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Oskolkov <posk@posk.io>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] RFC: sched: UMCG: episode IV: A New Hope
Message-ID: <202202121124.uAuI6YJb-lkp@intel.com>
References: <20220211191346.280415-1-posk@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211191346.280415-1-posk@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Peter,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master linus/master v5.17-rc3]
[cannot apply to tip/x86/core arnd-asm-generic/master tip/x86/asm tip/core/entry next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Peter-Oskolkov/RFC-sched-UMCG-episode-IV-A-New-Hope/20220212-031635
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git c8eaf6ac76f40f6c59fc7d056e2e08c4a57ea9c7
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220212/202202121124.uAuI6YJb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/64a46b86ef2bb15a0a1bc7566b6ca87f5e0492dd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Peter-Oskolkov/RFC-sched-UMCG-episode-IV-A-New-Hope/20220212-031635
        git checkout 64a46b86ef2bb15a0a1bc7566b6ca87f5e0492dd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/umcg.h:110:2: error: unknown type name 'u64'
           u64     worker_id;
           ^
>> ./usr/include/linux/umcg.h:111:2: error: unknown type name 'u32'
           u32     worker_event_type;
           ^
   ./usr/include/linux/umcg.h:112:2: error: unknown type name 'u32'
           u32     counter;
           ^
   3 errors generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
