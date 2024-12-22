Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F11BE40;
	Sun, 22 Dec 2024 04:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734841771; cv=none; b=oBdnjJ22iq1y1VQn1jmHwXoFTPLGL2mshu8+xS0V7Q1TRAxTxp6NXhp83HMPXrwF+Zs6ADUGm8fUG4TN1Q/Oq6z1zHIrrUUm/xrDNXfbxV1PV+vk+Wv3QFden76prjrUS9uYWAhJUnJLAYL3EfvTbNw25pWkjT3l5ljtuNS9oi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734841771; c=relaxed/simple;
	bh=wxJZB31tzXEYe/W+Za1/hmN5Vyqc9LpWaG6482m3CC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBvr7Qqs5p75S5hnIY3+Lt54U7OTAsTaxpF+cEGMaQ1scMntabGw/iBArsK89H3mLOH8IfS1VzL+iF8xu44hRvypgwapqmfq4K8R2VNQ9oA5y3j1BnRsWSSWmH0VoVun9I905AQbB13JYOcu8N2o0MhAEA3om/PwatFDUKvD+yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtPGZe2h; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtPGZe2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734841769; x=1766377769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wxJZB31tzXEYe/W+Za1/hmN5Vyqc9LpWaG6482m3CC8=;
  b=gtPGZe2hKS/IZ3L/CNuXSfALo1wj3s3DR7vfaCi9w0GWMFdsIDMTVr7S
   Mtjbayy3ZCOhbxzYg1eDhhzx6Ou8Q7cXVQygSZ0T0gkqKOiz4SNfDqxlQ
   CdtF5/x0OwoFZqXbbFMmd7xHnmhxh9jVLMQOFtX7ip/UM4Vf4Irp0PMtC
   HnhAc5e0QIukkXvKkV9kvWE+a75HcGDxWJnbbu/E5Se2adYAqtBJJoLzV
   Q6vHpt0s7WHPxtQeigIGOQa8kHj7DrVxsls+io7sYMnV9i+ZZc49ZUm2X
   DbsqLA0qjev7/569ZsZsXtORcWYBZXPeO/XPKDWhqwrI4HWlfA9HeTnDg
   g==;
X-CSE-ConnectionGUID: g7Y6KPdcQYmvFkn0ReHUpA==
X-CSE-MsgGUID: SF+YLXKNQNmjXEM2RdIimw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35559933"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35559933"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 20:29:28 -0800
X-CSE-ConnectionGUID: QPDYs2+6RxC2QpPP3V9zNw==
X-CSE-MsgGUID: ToqDiGWeTWq5ruff7ypNNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99285725"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2024 20:29:22 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPDai-0002jD-0x;
	Sun, 22 Dec 2024 04:29:20 +0000
Date: Sun, 22 Dec 2024 12:28:59 +0800
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
Subject: Re: [PATCH v5] mm/memblock: Add memblock_alloc_or_panic interface
Message-ID: <202412221259.JuGNAUCq-lkp@intel.com>
References: <20241222030331.2704579-1-guoweikang.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222030331.2704579-1-guoweikang.kernel@gmail.com>

Hi Guo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Guo-Weikang/mm-memblock-Add-memblock_alloc_or_panic-interface/20241222-110513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241222030331.2704579-1-guoweikang.kernel%40gmail.com
patch subject: [PATCH v5] mm/memblock: Add memblock_alloc_or_panic interface
config: arm-randconfig-002-20241222 (https://download.01.org/0day-ci/archive/20241222/202412221259.JuGNAUCq-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221259.JuGNAUCq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221259.JuGNAUCq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memblock.c:1706: warning: Function parameter or struct member 'func' not described in '__memblock_alloc_or_panic'
>> mm/memblock.c:1706: warning: Excess function parameter 'fuc' description in '__memblock_alloc_or_panic'


vim +1706 mm/memblock.c

  1693	
  1694	/**
  1695	 * __memblock_alloc_or_panic - Try to allocate memory and panic on failure
  1696	 * @size: size of memory block to be allocated in bytes
  1697	 * @align: alignment of the region and block's size
  1698	 * @fuc: caller func name
  1699	 *
  1700	 * This function attempts to allocate memory using memblock_alloc,
  1701	 * and in case of failure, it calls panic with the formatted message.
  1702	 * This function should not be used directly, please use the macro memblock_alloc_or_panic.
  1703	 */
  1704	void *__init __memblock_alloc_or_panic(phys_addr_t size, phys_addr_t align,
  1705					       const char *func)
> 1706	{
  1707		void *addr = memblock_alloc(size, align);
  1708	
  1709		if (unlikely(!addr))
  1710			panic("%s: Failed to allocate %pap bytes\n", func, &size);
  1711		return addr;
  1712	}
  1713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
