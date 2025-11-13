Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AEE3168EE;
	Thu, 13 Nov 2025 19:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062685; cv=none; b=L9UMEDAK31WON+NsGGt1rZvJ2Q/7IhWNaY37DsTuoeISgyxv3QE2UTVpQuUFShLFIyfOEjh5rT8W5q65jXEYsXj7qyQt4EqhzySc2KzVwyEPwSQesvGhIhWpyiDzf2Y3tr8nnzy3FKuWtYVFK4pgePqnHAOL37wFRpRQXIywh/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062685; c=relaxed/simple;
	bh=HEJSaA71TuXh1QUGrm04DbY3CyzCazML7OWPoC5lA1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoXUST0eVS6jBz4JckggnZJ64fGshgMDSicfp9FELPjx4EnJF0v+3fpO0PTJ1fNp13ZbcI8xqbLutcOrJBpg6MpQz0L/Kby7i4KXMW+oMoQgns7m9flobua0MTnpvEreD4EQyU5gb8iRaVolRnZ8Z/miTXaa7hPKr19lobALKto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUjI+89y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUjI+89y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763062683; x=1794598683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HEJSaA71TuXh1QUGrm04DbY3CyzCazML7OWPoC5lA1M=;
  b=hUjI+89ymFiVFh4M1yN+jVh0+LiZzqrN/S035FwwecO/2gENFsdWGwmW
   Etr43TmVhhJgiP3nywIViEqucfeU+6LXx0cAbO4+2WSAwzg+cqHs4towE
   Mh3qzra2Iss3oTGJWKnCT/Aay1RdWOQSFfgftXhghRkbcb9IjKez9gAqf
   OfEhJRZr25qUPzJm1/3FqRHOw+BTniYvwm4RJGVBo5piTWJVsOeIH6vTT
   mnKevSO1vb6drYmR6wbHDdDMA/0X3V5iqUxTQpqVNtgtA+H9F7AN09qte
   uoECHAezIGiD6nyD+oUzvROo2WqiYVfTkVVhNn2cSZM+Bec8AkprxEdkJ
   g==;
X-CSE-ConnectionGUID: yxUq/Xd2SwW5obqTv/KW1g==
X-CSE-MsgGUID: S8j4wKOJRfaPyS5WuG/jrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65250467"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="65250467"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 11:38:02 -0800
X-CSE-ConnectionGUID: soxY0Zs6Ty2frP213V6FJQ==
X-CSE-MsgGUID: CcjC+fnwTheaokIWwwZZ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="193858615"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2025 11:37:58 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJd8l-0005nn-2B;
	Thu, 13 Nov 2025 19:37:55 +0000
Date: Fri, 14 Nov 2025 03:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yuntao Wang <yuntao.wang@linux.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Baoquan He <bhe@redhat.com>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Geoff Levand <geoff@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Alexander Graf <graf@amazon.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yuntao Wang <yuntao.wang@linux.dev>
Subject: Re: [PATCH v2 6/7] of/reserved_mem: Simplify the logic of
 __reserved_mem_reserve_reg()
Message-ID: <202511140307.Th0UqUd9-lkp@intel.com>
References: <20251113155104.226617-7-yuntao.wang@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113155104.226617-7-yuntao.wang@linux.dev>

Hi Yuntao,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuntao-Wang/of-fdt-Consolidate-duplicate-code-into-helper-functions/20251114-004121
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251113155104.226617-7-yuntao.wang%40linux.dev
patch subject: [PATCH v2 6/7] of/reserved_mem: Simplify the logic of __reserved_mem_reserve_reg()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251114/202511140307.Th0UqUd9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140307.Th0UqUd9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140307.Th0UqUd9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/of/of_reserved_mem.c:175:31: error: incompatible pointer types passing 'phys_addr_t *' (aka 'unsigned int *') to parameter of type 'u64 *' (aka 'unsigned long long *') [-Wincompatible-pointer-types]
     175 |                 of_fdt_read_addr_size(prop, &base, &size);
         |                                             ^~~~~
   include/linux/of_fdt.h:62:60: note: passing argument to parameter 'addr' here
      62 | extern void of_fdt_read_addr_size(const __be32 *prop, u64 *addr, u64 *size);
         |                                                            ^
   drivers/of/of_reserved_mem.c:175:38: error: incompatible pointer types passing 'phys_addr_t *' (aka 'unsigned int *') to parameter of type 'u64 *' (aka 'unsigned long long *') [-Wincompatible-pointer-types]
     175 |                 of_fdt_read_addr_size(prop, &base, &size);
         |                                                    ^~~~~
   include/linux/of_fdt.h:62:71: note: passing argument to parameter 'size' here
      62 | extern void of_fdt_read_addr_size(const __be32 *prop, u64 *addr, u64 *size);
         |                                                                       ^
   2 errors generated.


vim +175 drivers/of/of_reserved_mem.c

   150	
   151	/*
   152	 * __reserved_mem_reserve_reg() - reserve all memory described in 'reg' property
   153	 */
   154	static int __init __reserved_mem_reserve_reg(unsigned long node,
   155						     const char *uname)
   156	{
   157		phys_addr_t base, size;
   158		int len;
   159		const __be32 *prop;
   160		bool nomap;
   161	
   162		prop = of_fdt_get_addr_size_prop(node, "reg", &len);
   163		if (!len)
   164			return -ENOENT;
   165	
   166		if (len < 0) {
   167			pr_err("Reserved memory: invalid reg property in '%s', skipping node.\n",
   168			       uname);
   169			return -EINVAL;
   170		}
   171	
   172		nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
   173	
   174		while (len-- > 0) {
 > 175			of_fdt_read_addr_size(prop, &base, &size);
   176	
   177			if (size && early_init_dt_reserve_memory(base, size, nomap) == 0) {
   178				/* Architecture specific contiguous memory fixup. */
   179				if (of_flat_dt_is_compatible(node, "shared-dma-pool") &&
   180				    of_get_flat_dt_prop(node, "reusable", NULL))
   181					dma_contiguous_early_fixup(base, size);
   182				pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
   183					uname, &base, (unsigned long)(size / SZ_1M));
   184			} else {
   185				pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
   186				       uname, &base, (unsigned long)(size / SZ_1M));
   187			}
   188		}
   189		return 0;
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
