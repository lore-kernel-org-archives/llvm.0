Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F828F1;
	Mon, 21 Apr 2025 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745238392; cv=none; b=j77BRonOy7V0Cp8+kTaCDk2TbeFvACSzTcOLMUQiLYKzEuTjt4wzxAElWN34SX3CN+q+BfurSzo0kwfNQDpkboXfmv0PwIFSyMgRSrFTUnSOEtHsa0G6cBo/zGAKgHjQUsE1oLLBkO2paZsg58xl3O9FsPKcRnjEbkTK+5ksNiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745238392; c=relaxed/simple;
	bh=VeykHOrzRl/NU33aBVnLmR9PAKtlL11sk1P3BYvuIR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkqXoBddrPjZSqyrfnF2EObEMsypd1OV0wkZsK+mC/oBLT5jcV3bM5xoDB5DiF85MBq16VsWqetZI8laOwcJ63LTOCWMxwq2Vbaez2mz4ftHQmjzqmkto+6RcIWwxXjbrZJAHJLDX7wvlyMToDJGvvauyB8ZA05G3mRAYGUvwUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHaJFj8t; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHaJFj8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745238391; x=1776774391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VeykHOrzRl/NU33aBVnLmR9PAKtlL11sk1P3BYvuIR4=;
  b=UHaJFj8tVshpW6eo4KD8E+E7UtkmQ8AajaXiUPH+w5/Yn/t6oFabT8Ut
   8PtwY/Rsff2epkVkaq56oWaCDNoN8DKcsHFSg4DQKQoYo5UADPDxA1t23
   w1ZyRbhkp71M+tx+1PtZpYtZqNh3uZPtMsvJ2hhjWY/nAEftek6/FUl1/
   f+2wwZxij19zvDUZq8qz+NgGLCrAXVm1C1C8NBfAp3CbElYlDvRFp8dJ0
   ThX80zozmUK8irnr1yDUNqGem1UTyqhl0HIGu0/Qt8W+ArpWflfcVM8ZM
   +vc6qFiB5lZKQOOOYxZ/FXrstpT90MZuwM16WEOMsSXCrWuuCmVaTqvsM
   A==;
X-CSE-ConnectionGUID: UF2Cm6dFQ9GDGEAfzaNQLw==
X-CSE-MsgGUID: YkZFdzanQ3GYvS7iXpzzWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="34387702"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="34387702"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 05:26:30 -0700
X-CSE-ConnectionGUID: DM+66G8WS0aUAReB8yVmrw==
X-CSE-MsgGUID: bDX798mTQZibSE18cF3M2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="168907659"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Apr 2025 05:26:23 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6qE8-00006p-24;
	Mon, 21 Apr 2025 12:26:20 +0000
Date: Mon, 21 Apr 2025 20:26:00 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Gerhorst <luis.gerhorst@fau.de>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Saket Kumar Bhaskar <skb99@linux.ibm.com>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Jiayuan Chen <mrpre@163.com>, Matan Shachnai <m.shachnai@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 05/11] bpf, arm64, powerpc: Add
 bpf_jit_bypass_spec_v1/v4()
Message-ID: <202504212030.IF1SLhz6-lkp@intel.com>
References: <20250421091802.3234859-6-luis.gerhorst@fau.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421091802.3234859-6-luis.gerhorst@fau.de>

Hi Luis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8582d9ab3efdebb88e0cd8beed8e0b9de76443e7]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Gerhorst/selftests-bpf-Fix-caps-for-__xlated-jited_unpriv/20250421-175926
base:   8582d9ab3efdebb88e0cd8beed8e0b9de76443e7
patch link:    https://lore.kernel.org/r/20250421091802.3234859-6-luis.gerhorst%40fau.de
patch subject: [PATCH bpf-next v2 05/11] bpf, arm64, powerpc: Add bpf_jit_bypass_spec_v1/v4()
config: arm-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250421/202504212030.IF1SLhz6-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504212030.IF1SLhz6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504212030.IF1SLhz6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.c:3037:13: warning: no previous prototype for function 'bpf_jit_bypass_spec_v1' [-Wmissing-prototypes]
    3037 | bool __weak bpf_jit_bypass_spec_v1(void)
         |             ^
   kernel/bpf/core.c:3037:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3037 | bool __weak bpf_jit_bypass_spec_v1(void)
         | ^
         | static 
>> kernel/bpf/core.c:3042:13: warning: no previous prototype for function 'bpf_jit_bypass_spec_v4' [-Wmissing-prototypes]
    3042 | bool __weak bpf_jit_bypass_spec_v4(void)
         |             ^
   kernel/bpf/core.c:3042:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3042 | bool __weak bpf_jit_bypass_spec_v4(void)
         | ^
         | static 
   2 warnings generated.


vim +/bpf_jit_bypass_spec_v1 +3037 kernel/bpf/core.c

  3031	
  3032	/* By default, enable the verifier's mitigations against Spectre v1 and v4 for
  3033	 * all archs. The value returned must not change at runtime as there is
  3034	 * currently no support for reloading programs that were loaded without
  3035	 * mitigations.
  3036	 */
> 3037	bool __weak bpf_jit_bypass_spec_v1(void)
  3038	{
  3039		return false;
  3040	}
  3041	
> 3042	bool __weak bpf_jit_bypass_spec_v4(void)
  3043	{
  3044		return false;
  3045	}
  3046	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
