Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D521372;
	Thu, 10 Apr 2025 05:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744263481; cv=none; b=DtG4EIJL8gZqLn53hkh4AuNW+J3/kgHm1bZum42pMc9aaCvS0aYACBsiMzJWAIm+GIHhEA3h714CqYdosfC0olI4SrzgUm9uXW5VYAJsRklh3HPZ/sDfRvvPkQrTx5zBo4tyqXPvgScC/VmPw8B8Moj8vMw4iSLKPOMn6gvHgr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744263481; c=relaxed/simple;
	bh=9P+OL6icH0gotmK3pNM6A6PfTMy13MtkpH72Q3bkxmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uw+s+KSRcrkpjB+RK35UHo7269mbTNJ9upWCbHomcS+YW0wtnQpbGezlqWixSbzxT17IOJu9xhV3KTxk8zaQ5x9Wmi68zOqDglZg3hnHGPu8KuSFGEJH/OlYsZc+yCqgrWumkVrPh0XCFPV5iPAKPIFxQDbNw8vqbJZwR1OuzFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3uMI/q2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3uMI/q2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744263477; x=1775799477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9P+OL6icH0gotmK3pNM6A6PfTMy13MtkpH72Q3bkxmo=;
  b=D3uMI/q20JA1+vej7I2tVj6JFpy52/gJxOIoquqBhw4xH9FX8M3fMcOS
   v41W0zF6MetbUgfOHffOfHyFg5xp1i1aWX1j4yAx1/wI9OxycKbU70LYb
   JR0wAMO7RNIixo5O/w7vJKtQUgx5y0fOAAZTLvmL6jPb3vic8vUgGZM/c
   xzcbJ6tZHhKlS1AZJdooJHfukWf64Jn/2dZ/EUgHbvO76iIBvVNtkI5vm
   PT3Msf7J67CYUi+6afoH2owI//mHLrKqY+HkQfLTJo6jrGgpbKM4PWEng
   CmcQTC8xtw6r5fGnv6WOWgpwsIbuhpGW6u/OML96VpJmArQN1ezKmKZRb
   A==;
X-CSE-ConnectionGUID: iZoWUrYQSF2jHhmAi8ShuA==
X-CSE-MsgGUID: eYBNCVsXTWKb85+/+UMK/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68248867"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="68248867"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 22:37:57 -0700
X-CSE-ConnectionGUID: gsQTWaKeTsCC+p6EUXxGRg==
X-CSE-MsgGUID: bNsDITTlTO2F58SUEi5HLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133903701"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Apr 2025 22:37:56 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2kbp-0009dr-0x;
	Thu, 10 Apr 2025 05:37:53 +0000
Date: Thu, 10 Apr 2025 13:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 06/13] bpf: Move kfunc definitions out of
 verifier.c
Message-ID: <202504101343.eRiCSJes-lkp@intel.com>
References: <c73f939de0f6af022e009dda057b6f941c6fce59.1744169424.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c73f939de0f6af022e009dda057b6f941c6fce59.1744169424.git.dxu@dxuuu.xyz>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Xu/bpf-Move-bpf_prog_ctx_arg_info_init-body-into-header/20250409-114116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/c73f939de0f6af022e009dda057b6f941c6fce59.1744169424.git.dxu%40dxuuu.xyz
patch subject: [RFC bpf-next 06/13] bpf: Move kfunc definitions out of verifier.c
config: arm64-randconfig-002-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101343.eRiCSJes-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101343.eRiCSJes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101343.eRiCSJes-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c:320:9: error: call to undeclared function 'btf_distill_func_proto'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     320 |                 ret = btf_distill_func_proto(log, btf, t, tname, &tgt_info->fmodel);
         |                       ^
   kernel/bpf/core.c:339:7: error: call to undeclared function 'btf_check_type_match'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     339 |                     btf_check_type_match(log, prog, btf, t))
         |                     ^
   kernel/bpf/core.c:396:19: error: call to undeclared function 'btf_kfunc_is_modify_return'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     396 |                                         u32 *flags = btf_kfunc_is_modify_return(btf, btf_id,
         |                                                      ^
   kernel/bpf/core.c:396:11: error: incompatible integer to pointer conversion initializing 'u32 *' (aka 'unsigned int *') with an expression of type 'int' [-Wint-conversion]
     396 |                                         u32 *flags = btf_kfunc_is_modify_return(btf, btf_id,
         |                                              ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     397 |                                                                                 prog);
         |                                                                                 ~~~~~
   kernel/bpf/core.c:425:8: error: call to undeclared function 'btf_kfunc_is_modify_return'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     425 |                         if (btf_kfunc_is_modify_return(btf, btf_id, prog) ||
         |                             ^
   kernel/bpf/core.c:1638:33: error: use of undeclared identifier 'kfunc_desc_cmp_by_id_off'
    1638 |                        sizeof(tab->descs[0]), kfunc_desc_cmp_by_id_off);
         |                                               ^
>> kernel/bpf/core.c:1628:1: warning: no previous prototype for function 'find_kfunc_desc' [-Wmissing-prototypes]
    1628 | find_kfunc_desc(const struct bpf_prog *prog, u32 func_id, u16 offset)
         | ^
   kernel/bpf/core.c:1627:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1627 | const struct bpf_kfunc_desc *
         |       ^
         | static 
   kernel/bpf/core.c:1642:5: error: redefinition of 'bpf_get_kfunc_addr'
    1642 | int bpf_get_kfunc_addr(const struct bpf_prog *prog, u32 func_id,
         |     ^
   include/linux/bpf.h:3084:1: note: previous definition is here
    3084 | bpf_get_kfunc_addr(const struct bpf_prog *prog, u32 func_id,
         | ^
   1 warning and 7 errors generated.


vim +/find_kfunc_desc +1628 kernel/bpf/core.c

  1626	
  1627	const struct bpf_kfunc_desc *
> 1628	find_kfunc_desc(const struct bpf_prog *prog, u32 func_id, u16 offset)
  1629	{
  1630		struct bpf_kfunc_desc desc = {
  1631			.func_id = func_id,
  1632			.offset = offset,
  1633		};
  1634		struct bpf_kfunc_desc_tab *tab;
  1635	
  1636		tab = prog->aux->kfunc_tab;
  1637		return bsearch(&desc, tab->descs, tab->nr_descs,
  1638			       sizeof(tab->descs[0]), kfunc_desc_cmp_by_id_off);
  1639	}
  1640	EXPORT_SYMBOL_GPL(find_kfunc_desc);
  1641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
