Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B42C9D;
	Sun, 13 Aug 2023 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691933618; x=1723469618;
  h=date:from:cc:subject:message-id:mime-version;
  bh=3fsuS2cZrrxQ+GJ05ci/tzz/A5l/7RVo4L3JP/TY5hQ=;
  b=mmBnWyKGFNW2aULQvodQ8ywWBsMQBQmAWAOJgyVbAKYZ3r3cZC1qfA27
   Exz0NM9GluvpYw0UqLm0Tip55z0aOez7y4BGATrxauBtm3t00Lp7Ykbyg
   IeipkvDVtmCngSiN82je0lF/mHreytiou17BXI8zSWrir9GbP9027oA92
   ACTNWxifPZskpyugYaIBteKBNLD3DUNKwGrgyv3OAXXZIVxY+q1VU9uo/
   HScbnBz9XXbfBqD2/3fD1EE+lMp0iXXMd9jJuIVjAwxrdpSyfqwVA97LH
   t1TOGFLS2zrjXCLGGJBQ0NCaopBQC8iFpTicRzTDajc1/oGGmhR8El2v8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="356856800"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="356856800"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 06:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="762687984"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="762687984"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Aug 2023 06:33:36 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVBDs-00095g-0B;
	Sun, 13 Aug 2023 13:33:36 +0000
Date: Sun, 13 Aug 2023 21:33:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] platform: sps: Fix an unsigned comparison that can
Message-ID: <202308132112.y4njrGsc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20230813110122.129793-1-coolrrsh@gmail.com>
References: <20230813110122.129793-1-coolrrsh@gmail.com>
TO: coolrrsh@gmail.com
TO: Shyam-sundar.S-k@amd.com
TO: hdegoede@redhat.com
TO: markgross@kernel.org
TO: platform-driver-x86@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: linux-kernel-mentees@lists.linuxfoundation.org
CC: Rajeshwar R Shinde <coolrrsh@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc5]
[cannot apply to next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/coolrrsh-gmail-com/platform-sps-Fix-an-unsigned-comparison-that-can/20230813-190307
base:   linus/master
patch link:    https://lore.kernel.org/r/20230813110122.129793-1-coolrrsh%40gmail.com
patch subject: [PATCH] platform: sps: Fix an unsigned comparison that can
config: riscv-randconfig-r005-20230813 (https://download.01.org/0day-ci/archive/20230813/202308132112.y4njrGsc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308132112.y4njrGsc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308132112.y4njrGsc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(lib/dynamic_queue_limits.o):(function dql_completed: .text+0x54): relocation R_RISCV_HI20 out of range: 527922 is not in [-524288, 524287]; references 'jiffies'
   >>> referenced by dynamic_queue_limits.c:31 (lib/dynamic_queue_limits.c:31)
   >>> defined in ./arch/riscv/kernel/vmlinux.lds:4
--
>> ld.lld: error: vmlinux.a(lib/dynamic_queue_limits.o):(function dql_reset: .text+0x19c): relocation R_RISCV_HI20 out of range: 527922 is not in [-524288, 524287]; references 'jiffies'
   >>> referenced by dynamic_queue_limits.c:34 (lib/dynamic_queue_limits.c:34)
   >>> defined in ./arch/riscv/kernel/vmlinux.lds:4
--
>> ld.lld: error: vmlinux.a(lib/dynamic_queue_limits.o):(function dql_init: .text+0x1d4): relocation R_RISCV_HI20 out of range: 527922 is not in [-524288, 524287]; references 'jiffies'
   >>> referenced by dynamic_queue_limits.c:37 (lib/dynamic_queue_limits.c:37)
   >>> defined in ./arch/riscv/kernel/vmlinux.lds:4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
