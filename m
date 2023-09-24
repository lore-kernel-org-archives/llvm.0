Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A66C19B;
	Sun, 24 Sep 2023 03:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695525812; x=1727061812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=99UbLRtfDufZJEkr/jAlLaUdBuJEET9RLedyrsC5b1M=;
  b=TH6ML2H/9MEcjus5kEEi8nt8bD7wlStnI0wU4mMHF60ioiaJ3norZZjZ
   R2ynuCmOHM77KYd8xchyFxGSaun1e8fUCaE+uVPKP8GYt9g0/8Ssw5Spi
   FEYSO6WmFYUprGTXuSChb1A08FiwwEEtygaTj+khHaJSQA9+MwHW4i9s7
   H9cYfkU+N7us6bj1raud8tltWX+slFeLO77flgsPF3YqsXjSOd3yg80GV
   BEJtVHW9fBpwByCRF+n6npuG8X6AvWhTq9iA5Sa4rgthkUMIBWC10HNA0
   gpA/z/XKiZ255rd4/lgwlcZD9lgSWf203Dk2/V5+BtCxFXut615i7m1sv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="361322596"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="361322596"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 20:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="724617530"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="724617530"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 23 Sep 2023 20:23:29 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkFiR-0003BB-2Y;
	Sun, 24 Sep 2023 03:23:27 +0000
Date: Sun, 24 Sep 2023 11:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: thinker.li@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v3 07/11] bpf, net: switch to storing struct_ops
 in btf
Message-ID: <202309241144.PiijQmZj-lkp@intel.com>
References: <20230920155923.151136-8-thinker.li@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920155923.151136-8-thinker.li@gmail.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/thinker-li-gmail-com/bpf-refactory-struct_ops-type-initialization-to-a-function/20230921-000546
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230920155923.151136-8-thinker.li%40gmail.com
patch subject: [RFC bpf-next v3 07/11] bpf, net: switch to storing struct_ops in btf
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230924/202309241144.PiijQmZj-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241144.PiijQmZj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309241144.PiijQmZj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> net/ipv4/bpf_tcp_ca.c:300:15: error: call to undeclared function 'register_bpf_struct_ops'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = ret ?: register_bpf_struct_ops(&bpf_tcp_ca_ops_mod);
                        ^
   1 error generated.
--
>> kernel/bpf/bpf_struct_ops.c:252:8: error: call to undeclared function 'register_bpf_struct_ops'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = register_bpf_struct_ops(&bpf_testmod_struct_ops);
                 ^
>> kernel/bpf/bpf_struct_ops.c:258:5: warning: no previous prototype for function 'register_bpf_struct_ops' [-Wmissing-prototypes]
   int register_bpf_struct_ops(struct bpf_struct_ops_mod *mod)
       ^
   kernel/bpf/bpf_struct_ops.c:258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int register_bpf_struct_ops(struct bpf_struct_ops_mod *mod)
   ^
   static 
   1 warning and 1 error generated.


vim +/register_bpf_struct_ops +300 net/ipv4/bpf_tcp_ca.c

   292	
   293	static int __init bpf_tcp_ca_kfunc_init(void)
   294	{
   295		int ret;
   296	
   297		BTF_STRUCT_OPS_TYPE_EMIT(tcp_congestion_ops);
   298	
   299		ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS, &bpf_tcp_ca_kfunc_set);
 > 300		ret = ret ?: register_bpf_struct_ops(&bpf_tcp_ca_ops_mod);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
