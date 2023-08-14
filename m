Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC228F77;
	Mon, 14 Aug 2023 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692011048; x=1723547048;
  h=date:from:cc:subject:message-id:mime-version;
  bh=edaeCMNN534aoAOULq2XA6IZ7sttP5pimbiPy2R6fS8=;
  b=AYCJivyO8tTOkUG+eS8hgOtd2E0f6BXBiOdtSaPgpUdsQqjHrbAuaijx
   zRq0VgeenGHgxmh8ZKLGvfbnBYHclpdVVgiiEDruRZIoosGxIPRPGImMs
   3MXOlxW4Yctkj3bmJifSeof/2Fa3Nq2hxxwUEF17dYtENCqXHPwQZzqMS
   Qm6kH2zx/BpsX5jqhGoK1HPe8vcDmmcqxTcgkEJciyj56+BjQmaPK4JWe
   sriSHUTt/q12wlKfqQjjwK2ejv6Qp4QdBKEZuwjQRKXYqQITZhscdeCE1
   pbql9kupncfG5tmQ4wx1mRzSUJHBuIW1HTsfo5c1E1pPsO3icBFj7Kh87
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="370911958"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="370911958"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 04:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="857044412"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="857044412"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Aug 2023 04:04:05 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVVMj-00007A-0K;
	Mon, 14 Aug 2023 11:04:05 +0000
Date: Mon, 14 Aug 2023 19:03:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v2] net-memcg: Fix scope of sockmem pressure
 indicators
Message-ID: <202308141820.hYpWdKkL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20230814070923.35769-1-wuyun.abel@bytedance.com>
References: <20230814070923.35769-1-wuyun.abel@bytedance.com>
TO: Abel Wu <wuyun.abel@bytedance.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Johannes Weiner <hannes@cmpxchg.org>
TO: Michal Hocko <mhocko@kernel.org>
TO: Roman Gushchin <roman.gushchin@linux.dev>
TO: Shakeel Butt <shakeelb@google.com>
TO: Muchun Song <muchun.song@linux.dev>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Ahern <dsahern@kernel.org>
TO: Yosry Ahmed <yosryahmed@google.com>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
TO: Yu Zhao <yuzhao@google.com>
TO: Kefeng Wang <wangkefeng.wang@huawei.com>
TO: Yafang Shao <laoar.shao@gmail.com>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
TO: Martin KaFai Lau <martin.lau@kernel.org>
TO: Breno Leitao <leitao@debian.org>
TO: Alexander Mikhalitsyn <alexander@mihalicyn.com>
TO: David Howells <dhowells@redhat.com>
TO: Jason Xing <kernelxing@tencent.com>
TO: Vladimir Davydov <vdavydov.dev@gmail.com>
CC: Abel Wu <wuyun.abel@bytedance.com>
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org (open list:NETWORKING
CC: "(open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER \(MEMCG\))" <cgroups@vger.kernel.org>

Hi Abel,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Wu/net-memcg-Fix-scope-of-sockmem-pressure-indicators/20230814-151135
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230814070923.35769-1-wuyun.abel%40bytedance.com
patch subject: [PATCH net-next v2] net-memcg: Fix scope of sockmem pressure indicators
config: riscv-randconfig-r026-20230814 (https://download.01.org/0day-ci/archive/20230814/202308141820.hYpWdKkL-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308141820.hYpWdKkL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308141820.hYpWdKkL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_finish: .text+0x3d8): relocation R_RISCV_HI20 out of range: 528106 is not in [-524288, 524287]; references trace_trigger_soft_disabled.______f.20
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x588): relocation R_RISCV_HI20 out of range: 528106 is not in [-524288, 524287]; references trace_initcall_finish.______f.71
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x5b4): relocation R_RISCV_HI20 out of range: 528322 is not in [-524288, 524287]; references .LCPI40_0
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x5bc): relocation R_RISCV_HI20 out of range: 528322 is not in [-524288, 524287]; references .LCPI40_1
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x608): relocation R_RISCV_HI20 out of range: 528105 is not in [-524288, 524287]; references do_one_initcall.______f
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_level: .text+0x11e): relocation R_RISCV_HI20 out of range: 528105 is not in [-524288, 524287]; references trace_trigger_soft_disabled.______f
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_level: .text+0x138): relocation R_RISCV_HI20 out of range: 528106 is not in [-524288, 524287]; references trace_trigger_soft_disabled.______f.20
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_start: .text+0x2a8): relocation R_RISCV_HI20 out of range: 528105 is not in [-524288, 524287]; references trace_trigger_soft_disabled.______f
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_start: .text+0x2c2): relocation R_RISCV_HI20 out of range: 528106 is not in [-524288, 524287]; references trace_trigger_soft_disabled.______f.20
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_finish: .text+0x3be): relocation R_RISCV_HI20 out of range: 528105 is not in [-524288, 524287]; references trace_trigger_soft_disabled.______f
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
