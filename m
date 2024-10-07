Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686021D27A5;
	Mon,  7 Oct 2024 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312900; cv=none; b=uHJeCezrJaXoj3b5Y8E2R9WDpbK4UrWkKJk0WAclOl1LoZ65SomveLN1B5ZTJGz1MbnqLwbDkmc9ZM43miFFukTpNGR5hXGqIb0Wv1OKP4oZuwoIlKVxjOm4Fka/4qaiDJL4gfbH1c8hjtKsEOAz9j8CiF3eghmwQaKkR9rBR0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312900; c=relaxed/simple;
	bh=rR0zjfi5oHjSMD5bqI8KG9LjBdu4110whV7IabzSfDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJcijQZVgMEXBHtdxy59f1UxZyZq7cw/MjQhClsUlaiPoprZx8ocDPmP+M9+24XT4nekpYsZUDNIF5y3ppvu/v2zy5j6HtsOmEQ5upD0oENTvewF0pXrd2jRRfo9033OkgDUKpSq9M1O1EzZIyv2xTEftWbxIFhiE2rCB790gok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWc7uGyM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWc7uGyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728312899; x=1759848899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rR0zjfi5oHjSMD5bqI8KG9LjBdu4110whV7IabzSfDc=;
  b=LWc7uGyMhPJZi//CZIlLmh7JPje+1I92XO/cZ1dNi8IGM9q2RvFgcHKE
   T0WzqAA2UcC6b7jOQK/pQJCIpvK1rFioflq4kQ9AiiTJYeAcbxwKzv11N
   KonBeXh5jrdnrS/vlTUUyLr3eRAaLz8qAs/QqTx7NZme+L5Um17vMB2ZB
   Lg5qrIa4coEX6mIEAxlRvT3a+rqr43rJsfa4EA9VS6hdEGle7lop91iEP
   G2r/4atNjaBwbali4C4iU+3yAzNIZPMgWCu9fXviZ6L+dxT06a1wUOciO
   gTSIKoNd3yjML2i6VvXvKmUhMpv7L6q7G3l65p7X86s2HtFwuHcCm24xJ
   A==;
X-CSE-ConnectionGUID: BvDaRFepTqmiO9DEVZ1ahw==
X-CSE-MsgGUID: 0hkIWBxuQj+Tz94DrJk7oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31167833"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="31167833"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 07:54:58 -0700
X-CSE-ConnectionGUID: FcDIeRDUQ4mIIFXMWCAnBQ==
X-CSE-MsgGUID: wo7BPEroT4SXWYSP3l1FDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="98817453"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Oct 2024 07:54:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxp8Q-00057y-1C;
	Mon, 07 Oct 2024 14:54:54 +0000
Date: Mon, 7 Oct 2024 22:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Fontenot <nathan.fontenot@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] cxl: Update Soft Reserved resources upon region creation
Message-ID: <202410072203.uX5lXYkD-lkp@intel.com>
References: <20241004181754.8960-1-nathan.fontenot@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004181754.8960-1-nathan.fontenot@amd.com>

Hi Nathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on linus/master v6.12-rc2 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Fontenot/cxl-Update-Soft-Reserved-resources-upon-region-creation/20241005-021920
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20241004181754.8960-1-nathan.fontenot%40amd.com
patch subject: [RFC] cxl: Update Soft Reserved resources upon region creation
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241007/202410072203.uX5lXYkD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410072203.uX5lXYkD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410072203.uX5lXYkD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/e820.c:1311:42: warning: declaration of 'union acpi_subtable_headers' will not be visible outside of this function [-Wvisibility]
    1311 | static int __init e820_parse_cfmws(union acpi_subtable_headers *hdr, void *arg,
         |                                          ^
   arch/x86/kernel/e820.c:1361:9: error: call to undeclared function 'acpi_table_parse_cedt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1361 |                         rc = acpi_table_parse_cedt(ACPI_CEDT_TYPE_CFMWS,
         |                              ^
   arch/x86/kernel/e820.c:1361:9: note: did you mean 'acpi_table_parse'?
   include/linux/acpi.h:913:19: note: 'acpi_table_parse' declared here
     913 | static inline int acpi_table_parse(char *id,
         |                   ^
   1 warning and 1 error generated.


vim +1311 arch/x86/kernel/e820.c

  1310	
> 1311	static int __init e820_parse_cfmws(union acpi_subtable_headers *hdr, void *arg,
  1312					   const unsigned long unused)
  1313	{
  1314		struct acpi_cedt_cfmws *cfmws;
  1315		struct resource *res = arg;
  1316		struct resource cfmws_res;
  1317	
  1318		/* Validation check, remove when finished debugging */
  1319		if (!res->parent && res->end)
  1320			pr_err("CXL DEBUG Should insert %pr\n", res);
  1321	
  1322		if (res->parent || !res->end)
  1323			return 0;
  1324	
  1325		cfmws = (struct acpi_cedt_cfmws *)hdr;
  1326		cfmws_res = DEFINE_RES_MEM(cfmws->base_hpa,
  1327					   cfmws->base_hpa + cfmws->window_size);
  1328		pr_err("CXL DEBUG Found CFMWS: %pr\n", &cfmws_res);
  1329	
  1330		if (resource_overlaps(&cfmws_res, res)) {
  1331			pr_err("CXL DEBUG Found SOFT RESERVE intersection %llx - %llx : %llx - %llx\n",
  1332			       res->start, res->end, cfmws_res.start, cfmws_res.end);
  1333			e820__add_soft_reserve(res->start, resource_size(res),
  1334					       res->flags);
  1335			return 1;
  1336		}
  1337	
  1338		return 0;
  1339	}
  1340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
