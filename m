Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C5BA47;
	Tue, 29 Aug 2023 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693280816; x=1724816816;
  h=date:from:cc:subject:message-id:mime-version;
  bh=w+oqeIKOCQszQbYPvuCX5twmJ+ekHnH2XenvbmGFI8c=;
  b=PTZnmMNsr2VEzpbE2CgOnnFoGXSWmJLfTkj95v2dpFO+KwNpZbBX22Fd
   EQLO7x/h34k6m2ralzYOyqMP+gJi5x2u0+3a2FK1DjpmszsJgtW5GPhTh
   CKFK2dFi2B+ElJ7WvfgJdmWg7w5bPO8gW/O5bmeWSvnnbu4P7fURrMz1T
   Y2Tk15KYjrfvkoVmOc2BWFAvALDjeWtfTcLg7uHI7QWyXfhQtSNR8Anj9
   NBmSOTbUqV8kymT0En63vwkiWQyhfhYMhkr/8YdWL4RsIQCtvAHpCWMYo
   Xw5yt3A1j/oMyoZm82tlIFhmNtQKIngH+P7eEW7FdjBYGl626x6Hb3aR/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="355593218"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="355593218"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 20:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="803939190"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="803939190"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2023 20:46:54 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qapgs-0008MC-0a;
	Tue, 29 Aug 2023 03:46:54 +0000
Date: Tue, 29 Aug 2023 11:46:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH net v3 2/3] ipv6: ignore dst hint for multipath routes
Message-ID: <202308291103.hzyzyCB5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20230828113221.20123-3-sriram.yagnaraman@est.tech>
References: <20230828113221.20123-3-sriram.yagnaraman@est.tech>
TO: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
CC: netdev@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: "David S . Miller" <davem@davemloft.net>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: David Ahern <dsahern@kernel.org>
CC: Ido Schimmel <idosch@nvidia.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Petr Machata <petrm@nvidia.com>
CC: Sriram Yagnaraman <sriram.yagnaraman@est.tech>

Hi Sriram,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sriram-Yagnaraman/ipv4-ignore-dst-hint-for-multipath-routes/20230828-203216
base:   net/main
patch link:    https://lore.kernel.org/r/20230828113221.20123-3-sriram.yagnaraman%40est.tech
patch subject: [PATCH net v3 2/3] ipv6: ignore dst hint for multipath routes
config: riscv-randconfig-r033-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291103.hzyzyCB5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291103.hzyzyCB5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291103.hzyzyCB5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0xc1c): relocation R_RISCV_HI20 out of range: 529094 is not in [-524288, 524287]; references .L.str.17
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function perf_trace_initcall_level: .text+0x3d8): relocation R_RISCV_HI20 out of range: 531219 is not in [-524288, 524287]; references __per_cpu_offset
   >>> referenced by main.c
   >>> defined in vmlinux.a(mm/percpu.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function perf_trace_initcall_start: .text+0x620): relocation R_RISCV_HI20 out of range: 531219 is not in [-524288, 524287]; references __per_cpu_offset
   >>> referenced by main.c
   >>> defined in vmlinux.a(mm/percpu.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function perf_trace_initcall_finish: .text+0x848): relocation R_RISCV_HI20 out of range: 531219 is not in [-524288, 524287]; references __per_cpu_offset
   >>> referenced by main.c
   >>> defined in vmlinux.a(mm/percpu.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function rcu_read_unlock: .text+0x9b8): relocation R_RISCV_HI20 out of range: 529605 is not in [-524288, 524287]; references rcu_lock_map
   >>> referenced by main.c
   >>> defined in vmlinux.a(kernel/rcu/update.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
