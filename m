Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BC3DDDC;
	Sun, 22 Dec 2024 02:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734836185; cv=none; b=ECkQOGDfSeVZlrtN/6J/aKcc5c1rYKmzhfQPL2w5s+q0MPCPaiIyyL/v1bQgYgSkClXMw1EOEq3IPcGr4C9s3l3srtnpomtMs5ndZj2mDFKGW7Q9J/xAKTZB/lm4okhVE5i0JaI5yFnMDy7LApBgpcy10CPclOFl8gda4VSHZF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734836185; c=relaxed/simple;
	bh=3GwEwSmiimyYpUL1Gi/dHxqnPjCnHfyAZQzn9UQqAuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQaAdt0K/1gin4EpaNGOIp8AyHkTbd57Pkv4vxw4OftQ/Hl0rYbyVYtM+IeoP1VcIsOD4UGd3O59FrXwzKmjFJUQwhn/vtZkdWxTvSZqVOWzd2rwJuPV3c7efbvrr/1a9kgy+RZL97OUBSaegAhxG7rD1J0BOejR6mQezSjC9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qzp43Akz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qzp43Akz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734836183; x=1766372183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3GwEwSmiimyYpUL1Gi/dHxqnPjCnHfyAZQzn9UQqAuI=;
  b=Qzp43Akzt528yONDXUfoTKOdMsUUVwt0IBAuzYw3ChsVmIpkwAb94gl/
   ang8qXGGqy7StxcK6izAwbExSPwqwW+G46JpZfKHDIbMy5ud9yUKOHwRr
   p2Fzx23S77PmSgY2g8SvMVU5yM0WCY+dM90s7vI5VwAQeDN233ahbEBvK
   YEOd/k29PwclKdOXKMgb4Rjs2Tb2gGLGdMEShy9V1AXlM7WYTm4tIwNLx
   ygkcF2qQL6DpVrkakv005S+gWRSF9nDtKiHn4MSW3T2YYpMCEobWKuaWi
   9NjBiiK2AI2do3kMXJmQc+9DjWQWIsUGMtCY5e4o1i6X3rcXw1K8Vh32l
   g==;
X-CSE-ConnectionGUID: OV0XtrMWTWGf0GWRUqCkcg==
X-CSE-MsgGUID: XvHvUxH+So6MLWVbww6jPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35052131"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35052131"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 18:56:23 -0800
X-CSE-ConnectionGUID: FwNqQCOjTq+Zqzhzz0WiAw==
X-CSE-MsgGUID: cph02Uu/S6CHo1Xt74HxPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="103848812"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Dec 2024 18:56:16 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPC8b-0002hT-2s;
	Sun, 22 Dec 2024 02:56:13 +0000
Date: Sun, 22 Dec 2024 10:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Weikang <guoweikang.kernel@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sam Creasey <sammy@sammy.net>, Huacai Chen <chenhuacai@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Ingo Molnar <mingo@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH v4] mm/memblock: Add memblock_alloc_or_panic interface
Message-ID: <202412221000.r1NzXJUO-lkp@intel.com>
References: <20241222012628.2703802-1-guoweikang.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222012628.2703802-1-guoweikang.kernel@gmail.com>

Hi Guo,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Guo-Weikang/mm-memblock-Add-memblock_alloc_or_panic-interface/20241222-092858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241222012628.2703802-1-guoweikang.kernel%40gmail.com
patch subject: [PATCH v4] mm/memblock: Add memblock_alloc_or_panic interface
config: i386-buildonly-randconfig-002-20241222 (https://download.01.org/0day-ci/archive/20241222/202412221000.r1NzXJUO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221000.r1NzXJUO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221000.r1NzXJUO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:29:
>> include/linux/memblock.h:421:29: error: expected ';' after top level declarator
     421 |                                        const char *func)
         |                                                         ^
         |                                                         ;
   1 error generated.


vim +421 include/linux/memblock.h

   419	
   420	void *__memblock_alloc_or_panic(phys_addr_t size, phys_addr_t align,
 > 421					       const char *func)
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
