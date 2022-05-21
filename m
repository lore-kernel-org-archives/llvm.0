Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE60A2F24
	for <llvm@lists.linux.dev>; Sat, 21 May 2022 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653132398; x=1684668398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qY8A58FBRynvfBVJJesxTQj/JFqbODeNA1UtNGWQik8=;
  b=cKVMqakb7h8AbPF80L40awh7IE1xp+IKpbF7plyFc0CIRK12FpZ2AtyD
   AhRHNtDh+6n2qJFk2X3VsloPn2EDAgY5V0ENQHCArrFUgYBxx9fILheS7
   U6sqmnb5H5SQc8saHvVzB1gyd+2JI8gi12SC1y0hvWtCbeMhcHRRJTm7X
   wYS1IpAhTplt4VpZiNQnLnRcSE/lKWVYTlWqbB/ZH27+1etJic2UACi2f
   uh+yOgnsaVZ5YquhUXEwAzTdzgz2xAcpjcJUs8KpXMbHgTE+IHDvZzcIm
   NeiA+J5IsCuayibdRYXaRTzikp4G7+24jupbt5+6O4Yb45vP2XoiAo8+u
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="252726384"
X-IronPort-AV: E=Sophos;i="5.91,242,1647327600"; 
   d="scan'208";a="252726384"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 04:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,242,1647327600"; 
   d="scan'208";a="628577363"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 21 May 2022 04:26:37 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nsNFk-0006Ec-Kc;
	Sat, 21 May 2022 11:26:36 +0000
Date: Sat, 21 May 2022 19:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC Patch v4 1/2] bpf: introduce skb map
Message-ID: <202205211934.3kyV1wYU-lkp@intel.com>
References: <20220520174616.74684-2-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520174616.74684-2-xiyou.wangcong@gmail.com>

Hi Cong,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master horms-ipvs/master net/master net-next/master linus/master v5.18-rc7 next-20220520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/net_sched-introduce-eBPF-based-Qdisc/20220521-014934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: riscv-randconfig-r016-20220519 (https://download.01.org/0day-ci/archive/20220521/202205211934.3kyV1wYU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/771d03ba8e035ead53334c0dea1d181eb6e9e27d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cong-Wang/net_sched-introduce-eBPF-based-Qdisc/20220521-014934
        git checkout 771d03ba8e035ead53334c0dea1d181eb6e9e27d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/skb_map.c:264:36: warning: unused variable 'bpf_skb_map_pop_proto' [-Wunused-const-variable]
   static const struct bpf_func_proto bpf_skb_map_pop_proto = {
                                      ^
>> kernel/bpf/skb_map.c:287:36: warning: unused variable 'bpf_skb_map_push_proto' [-Wunused-const-variable]
   static const struct bpf_func_proto bpf_skb_map_push_proto = {
                                      ^
   2 warnings generated.


vim +/bpf_skb_map_pop_proto +264 kernel/bpf/skb_map.c

   263	
 > 264	static const struct bpf_func_proto bpf_skb_map_pop_proto = {
   265		.func		= bpf_skb_map_pop,
   266		.gpl_only	= false,
   267		.ret_type	= RET_INTEGER,
   268		.arg1_type	= ARG_CONST_MAP_PTR,
   269		.arg2_type	= ARG_ANYTHING,
   270	};
   271	
   272	BPF_CALL_3(bpf_skb_map_push, struct bpf_map *, map, struct sk_buff *, skb, u64, key)
   273	{
   274		struct bpf_skb_map *rb = bpf_skb_map(map);
   275		unsigned long flags;
   276	
   277		if (atomic_inc_return(&rb->count) > rb->map.max_entries)
   278			return -ENOBUFS;
   279		skb = skb_get(skb);
   280		skb_map_cb(skb)->rank = key;
   281		raw_spin_lock_irqsave(&rb->lock, flags);
   282		skb_rb_push(&rb->root, skb);
   283		raw_spin_unlock_irqrestore(&rb->lock, flags);
   284		return 0;
   285	}
   286	
 > 287	static const struct bpf_func_proto bpf_skb_map_push_proto = {
   288		.func		= bpf_skb_map_push,
   289		.gpl_only	= false,
   290		.ret_type	= RET_INTEGER,
   291		.arg1_type	= ARG_CONST_MAP_PTR,
   292		.arg2_type	= ARG_PTR_TO_CTX,
   293		.arg3_type	= ARG_ANYTHING,
   294	};
   295	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
