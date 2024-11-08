Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EDF13FEE;
	Fri,  8 Nov 2024 01:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731030949; cv=none; b=CZMgY4uozyaXR1I0X75ew2vFNv9Ev5rP1N6XdwnbCgw+IFRvbNmHKJu0NvPaIYhllz1uEjCctWR5TdW+Thz9yJLHkfAaGG3L2xpd2hSqFR2o7Lynjp2jZEjbzATcjzu53f0fN0b0wVc/rFcFvm7ITKTiZVBgMl0MEc9T/naTde0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731030949; c=relaxed/simple;
	bh=wGy1Wsb1E4yL+Ca1HhWlwyNDxjAwf6T3rfN5JIN+Aag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GU5BC7XGKpCIwb18XbIP15CuV2xIj1+H1UbaY3dyoLR0qZ/6FZW2i6QM8R9nnOydqP9XkqVy9f4Ar8/Hgkzi3a3L1ePZza1z7STCD2ZyFFapGtpxBTNFn8gFPWHJsnx65JgE+SOEUiO5yBfhwqN9NQP/GUCFTGqqRWPnY0YDZFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEAkgZU6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEAkgZU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731030948; x=1762566948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wGy1Wsb1E4yL+Ca1HhWlwyNDxjAwf6T3rfN5JIN+Aag=;
  b=mEAkgZU6oVMWJYw0Kwa5n/S8JrLLAwlN4rbjEX/XuAZhjptThQy4LIFA
   znsDz/Dc5WeswocTdoHFScPoiXhHm+6yOhvMrdjaf1zUcERsL4cFaxzrU
   dEwIuTwtJwprCoczi5VAz7RrB4zgWBBuy9fQ95OBg2+6pLbqNwtj073jV
   8GygoP+Kf39EdLCTJWILRQdeFqN7vJp1Oe7yYlTW81rNDZf1Ag5DqS6bi
   CtTn8zoe6Yy/jM/EVwYwH5UkPQMTgh2UH5rYMYEO55PdyzyB/4/oBx3+N
   c5VDg1lYP+UuwHcQq1jkp7YAevDnGsjSaIQ95h23MX8JkAbMn4sYcC9F/
   Q==;
X-CSE-ConnectionGUID: SMUidyeCSUGYk94AhYQNig==
X-CSE-MsgGUID: gHDwuq5eQTORoqTBWWi2cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31072765"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31072765"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 17:55:45 -0800
X-CSE-ConnectionGUID: ONa7SasNTeOWSey1f7g4xg==
X-CSE-MsgGUID: LubL3y6hQCGM3Ch3OhWJZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="89865669"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Nov 2024 17:55:41 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9EDr-000qtU-0g;
	Fri, 08 Nov 2024 01:55:39 +0000
Date: Fri, 8 Nov 2024 09:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Mykola Lysenko <mykolal@fb.com>, Jakub Kicinski <kuba@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, x86@kernel.org,
	bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [PATCH bpf-next v4 1/4] bpf: add bpf_get_cpu_cycles kfunc
Message-ID: <202411080912.TtCTNymw-lkp@intel.com>
References: <20241107211206.2814069-1-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107211206.2814069-1-vadfed@meta.com>

Hi Vadim,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/bpf-add-bpf_cpu_cycles_to_ns-helper/20241108-051950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241107211206.2814069-1-vadfed%40meta.com
patch subject: [PATCH bpf-next v4 1/4] bpf: add bpf_get_cpu_cycles kfunc
config: arm-randconfig-003-20241108 (https://download.01.org/0day-ci/archive/20241108/202411080912.TtCTNymw-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080912.TtCTNymw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080912.TtCTNymw-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/helpers.c:3029:18: warning: extra tokens at end of #ifdef directive [-Wextra-tokens]
   #ifdef IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY)
                    ^
                    //
>> kernel/bpf/helpers.c:3032:9: error: call to undeclared function '__arch_get_hw_counter'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           return __arch_get_hw_counter(1, NULL);
                  ^
   kernel/bpf/helpers.c:3128:18: warning: extra tokens at end of #ifdef directive [-Wextra-tokens]
   #ifdef IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY)
                    ^
                    //
   2 warnings and 1 error generated.


vim +/__arch_get_hw_counter +3032 kernel/bpf/helpers.c

  3028	
  3029	#ifdef IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY)
  3030	__bpf_kfunc u64 bpf_get_cpu_cycles(void)
  3031	{
> 3032		return __arch_get_hw_counter(1, NULL);
  3033	}
  3034	#endif
  3035	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
