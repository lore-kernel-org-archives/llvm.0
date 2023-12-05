Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A1315EBC;
	Tue,  5 Dec 2023 07:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIPqVrUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701760695; x=1733296695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1/H5a4fYOah864VWf7Otp532KU2D/WLsDxcCiPM4jxY=;
  b=jIPqVrULKkf2awcNA2ENhi55l7x9s24Y1fPIVvCb6Wu5bgS4gYiT9dnq
   gWo7NEZBrAHGNsRjTYzH3Z1aR6D7EEoBBPzIfWpmBeuhiJXXwnDDAvUey
   RlMgU3MijibZDj8hxglXerlvUdJ8CsWiJOBwt3N7nAEl07ZsCNpxIqhHc
   UQ0alCAog/4XLR03QH+d5goNDUe+sagQSNt+ryQIT9l5/fO5pFvYkBY+T
   pFghXGJ2cDF7U0/2Ie8uY3z7BPE/ZbEWEEXSpA5Oe0e0gKXWq5HUVtAyD
   dGZS8uc9GtcatwEM3R5+ubjZuKTIU2yOzSZNOJ7UZGe+tqMfwRrv8sTIQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7195045"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="7195045"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 23:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="894278135"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="894278135"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Dec 2023 23:18:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAPh0-0008Ua-32;
	Tue, 05 Dec 2023 07:18:06 +0000
Date: Tue, 5 Dec 2023 15:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lee Jones <lee@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	syzbot+97a4fe20470e9bc30810@syzkaller.appspotmail.com,
	bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@chromium.org>,
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>
Subject: Re: [PATCHv3 bpf 1/2] bpf: Fix prog_array_map_poke_run map poke
 update
Message-ID: <202312051557.5OKOsVGa-lkp@intel.com>
References: <20231203204851.388654-2-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203204851.388654-2-jolsa@kernel.org>

Hi Jiri,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/bpf-Fix-prog_array_map_poke_run-map-poke-update/20231204-045204
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20231203204851.388654-2-jolsa%40kernel.org
patch subject: [PATCHv3 bpf 1/2] bpf: Fix prog_array_map_poke_run map poke update
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231205/202312051557.5OKOsVGa-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051557.5OKOsVGa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051557.5OKOsVGa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/net/bpf_jit_comp.c:3029:6: warning: no previous prototype for function 'bpf_arch_poke_desc_update' [-Wmissing-prototypes]
   void bpf_arch_poke_desc_update(struct bpf_jit_poke_descriptor *poke,
        ^
   arch/x86/net/bpf_jit_comp.c:3029:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void bpf_arch_poke_desc_update(struct bpf_jit_poke_descriptor *poke,
   ^
   static 
   1 warning generated.
--
>> kernel/bpf/arraymap.c:1015:13: warning: no previous prototype for function 'bpf_arch_poke_desc_update' [-Wmissing-prototypes]
   void __weak bpf_arch_poke_desc_update(struct bpf_jit_poke_descriptor *poke,
               ^
   kernel/bpf/arraymap.c:1015:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak bpf_arch_poke_desc_update(struct bpf_jit_poke_descriptor *poke,
   ^
   static 
   1 warning generated.


vim +/bpf_arch_poke_desc_update +3029 arch/x86/net/bpf_jit_comp.c

  3028	
> 3029	void bpf_arch_poke_desc_update(struct bpf_jit_poke_descriptor *poke,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
