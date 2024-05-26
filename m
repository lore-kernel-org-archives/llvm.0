Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C63E947A;
	Sun, 26 May 2024 15:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716735741; cv=none; b=Npk8IB6QTQSNdwT9+NhbJOzsQTi08JM6FlCZDBdWYcKwHo+pEVRdd4F7ZuNG/QL+FdsVQCkcrLhlz4jFWE7Jc0ukzYdwxTwg9wzc1K0n98IjjBJ9OlV6gsxL7AfPduZ2+08zEGvuxJpl1dvVz6N1VuJnJPh/1kAqc0PxM533RTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716735741; c=relaxed/simple;
	bh=c5REudBpUud8+aJWjhA9zCkJnDhPVOtaLNPLaJCkDVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8EExPcrRZM5UWAg5KO9EG6a4bVtwWYRjpsDB+KvYCGTAsMp5knie4SOJcyCA8ZRySofWCczdLN85nWYAjQxZ5rJmTPicdux9XB7uOI/3b5LvS6aYvuiwnUraIp0LthME8XpkByKdQLA/6MfNC4/OZ+wWGkwm2HFdX6dvPSeouM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzpX7G/G; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzpX7G/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716735739; x=1748271739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c5REudBpUud8+aJWjhA9zCkJnDhPVOtaLNPLaJCkDVQ=;
  b=hzpX7G/GVr4Ijs8kpckJ7D8QRWLNzpBQb0e404qGBld8tUUvAB9zONCI
   fJB2ejwahm6oW7yK5hirM62/rzfZS7U7o8Y2THW3j8JpF/kWYxw1RdliS
   8nTKYtpdO1UOw5HLuzxNoc28KDXqyqlMqlUhFtvB+pHaEEVKzRnpIrMNf
   a8/N0ADMNKKtaplpHBRop4G8lLkH1Z8uTCrOO38mdCL/04aVBdKlBZOy8
   HIfeYUDeKogU3I0P5RBPpzxk6AGHhmzk/1QdXwZlTNGRXG3Pm0gkoJShG
   e4g2klsMiu7Cp2ltkJSRmdWAAsWGM+YNsRiEaTGqECD7PDsvFLjYy0dqX
   w==;
X-CSE-ConnectionGUID: JS3IatDoRUOEEYdh5ywHew==
X-CSE-MsgGUID: 55Nw2R32Swidu5PwKL5xtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="23717966"
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="23717966"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 08:02:19 -0700
X-CSE-ConnectionGUID: wCqTuoA2RNe9yknGkLOEOA==
X-CSE-MsgGUID: NuwN8uA5QTCgApOEM3Is0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="39080247"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 May 2024 08:02:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBFO4-00087r-1X;
	Sun, 26 May 2024 15:02:16 +0000
Date: Sun, 26 May 2024 23:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 05/16] powerpc/mm: Fix __find_linux_pte() on 32
 bits with PMD leaf entries
Message-ID: <202405262205.rweOWRhx-lkp@intel.com>
References: <aa54834e9ee5e40179def32ff5834a8a2a02c413.1716714720.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa54834e9ee5e40179def32ff5834a8a2a02c413.1716714720.git.christophe.leroy@csgroup.eu>

Hi Christophe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes arm64/for-next/core v6.9]
[cannot apply to akpm-mm/mm-everything s390/features linus/master next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-64e-Remove-unused-IBM-HTW-code-SQUASHED/20240526-172511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/aa54834e9ee5e40179def32ff5834a8a2a02c413.1716714720.git.christophe.leroy%40csgroup.eu
patch subject: [RFC PATCH v3 05/16] powerpc/mm: Fix __find_linux_pte() on 32 bits with PMD leaf entries
config: powerpc-randconfig-001-20240526 (https://download.01.org/0day-ci/archive/20240526/202405262205.rweOWRhx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405262205.rweOWRhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405262205.rweOWRhx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/mm/pgtable.c:503:18: warning: variable 'pdshift' is uninitialized when used here [-Wuninitialized]
     503 |                 *hpage_shift = pdshift;
         |                                ^~~~~~~
   arch/powerpc/mm/pgtable.c:392:18: note: initialize the variable 'pdshift' to silence this warning
     392 |         unsigned pdshift;
         |                         ^
         |                          = 0
   1 warning generated.


vim +/pdshift +503 arch/powerpc/mm/pgtable.c

a00196a27216133 Nicholas Piggin   2019-06-07  475  
0caed4de502c769 Christophe Leroy  2019-04-26  476  	if (pmd_trans_huge(pmd) || pmd_devmap(pmd)) {
0caed4de502c769 Christophe Leroy  2019-04-26  477  		if (is_thp)
0caed4de502c769 Christophe Leroy  2019-04-26  478  			*is_thp = true;
0caed4de502c769 Christophe Leroy  2019-04-26  479  		ret_pte = (pte_t *)pmdp;
0caed4de502c769 Christophe Leroy  2019-04-26  480  		goto out;
0caed4de502c769 Christophe Leroy  2019-04-26  481  	}
d6eacedd1f0ebf0 Aneesh Kumar K.V  2019-05-14  482  
bd18b688220c722 Peter Xu          2024-03-05  483  	if (pmd_leaf(pmd)) {
0caed4de502c769 Christophe Leroy  2019-04-26  484  		ret_pte = (pte_t *)pmdp;
0caed4de502c769 Christophe Leroy  2019-04-26  485  		goto out;
fab9a1165bcda99 Christophe Leroy  2019-04-26  486  	}
d6eacedd1f0ebf0 Aneesh Kumar K.V  2019-05-14  487  
fab9a1165bcda99 Christophe Leroy  2019-04-26  488  	if (is_hugepd(__hugepd(pmd_val(pmd)))) {
0caed4de502c769 Christophe Leroy  2019-04-26  489  		hpdp = (hugepd_t *)&pmd;
fab9a1165bcda99 Christophe Leroy  2019-04-26  490  		goto out_huge;
fab9a1165bcda99 Christophe Leroy  2019-04-26  491  	}
fab9a1165bcda99 Christophe Leroy  2019-04-26  492  
0caed4de502c769 Christophe Leroy  2019-04-26  493  	return pte_offset_kernel(&pmd, ea);
26e66b08c3376b6 Christophe Leroy  2019-04-26  494  
fab9a1165bcda99 Christophe Leroy  2019-04-26  495  out_huge:
0caed4de502c769 Christophe Leroy  2019-04-26  496  	if (!hpdp)
0caed4de502c769 Christophe Leroy  2019-04-26  497  		return NULL;
0caed4de502c769 Christophe Leroy  2019-04-26  498  
0caed4de502c769 Christophe Leroy  2019-04-26  499  	ret_pte = hugepte_offset(*hpdp, ea, pdshift);
0caed4de502c769 Christophe Leroy  2019-04-26  500  	pdshift = hugepd_shift(*hpdp);
0caed4de502c769 Christophe Leroy  2019-04-26  501  out:
0caed4de502c769 Christophe Leroy  2019-04-26  502  	if (hpage_shift)
0caed4de502c769 Christophe Leroy  2019-04-26 @503  		*hpage_shift = pdshift;
0caed4de502c769 Christophe Leroy  2019-04-26  504  	return ret_pte;
0caed4de502c769 Christophe Leroy  2019-04-26  505  }
0caed4de502c769 Christophe Leroy  2019-04-26  506  EXPORT_SYMBOL_GPL(__find_linux_pte);
6eac1eaf2105dd8 Anshuman Khandual 2022-07-11  507  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
