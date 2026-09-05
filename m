Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432B1377ABF;
	Sat,  5 Sep 2026 21:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643328; cv=none; b=p4m8ifnCOooO4WcHqyPNXtDiF49EeHkz2L57NWCpoweK9XlGi3oGnDOWVUmd7ZenocxbUiPpQuhf3dbjdWG+yHF4Aspcfc5s5GSW3LN9nnOBHMHeKY647eionoRC+gL4hyedNYTEWouv2LC/Z9R4rz7HF45NlgU6IDp0B9pfd5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643328; c=relaxed/simple;
	bh=mLmlJvqUwLopDXz9zrmzSQ2cRga7h33hTayA8pdKtHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ra6kpbRFjAVH5RJPbJun1w2GVAjQnAmFDrbRGUGeiszd6XZivvkZVvOOnFkz1okED3QtUwCnJrmZPnbUX+TXD3ApGYttC2m0ZzF3f/V9MRdYq18R86drw50PRiNCWEqjhmDebkRgSKidlPbeDAulVRMM48duSv8EjHnS6BwrRGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZoI8ONvE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZoI8ONvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788643325; x=1820179325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mLmlJvqUwLopDXz9zrmzSQ2cRga7h33hTayA8pdKtHc=;
  b=ZoI8ONvE99Qt+bx1wcLBEwx0LUbc418Z3slenm7E5T007Thqd7rwBS0l
   haaFsIG6Njs+nSH5J5yrEd687q9br445LCyq6fcBrfVwIPIpRJd7xLnFV
   kJNPv3YJiuj04gugOBAvf+TGHABfV1QA6Y5ZNYMtwbuHuIM+fN3HRg4Ye
   Usfbcwa9scJpgFAxSAxb+77/vAuwZMtbRSbvCu5Ajf0eSVnmcfeLRsWGB
   jvnoqUZirDU3f/aP1KdONJIdpbvYMjRRZj2/75XUxlI0ed8H8aAlmBU/g
   IDIFl6vXf3Ae92CBjS1HpsLQWgC1kLN9XrfIJw2gNIkdC6KlsIhPPxuq9
   g==;
X-CSE-ConnectionGUID: JjBXdNbVSAebCZPvxqVPJw==
X-CSE-MsgGUID: TrivahjCQ1yqxNIWWg+aNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="100625368"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="100625368"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 14:22:04 -0700
X-CSE-ConnectionGUID: uzkxX0XpS8ChnlJZWnyLEA==
X-CSE-MsgGUID: lE3ZbeXrSaWCFu0K3f2taQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="269037291"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Sep 2026 14:22:04 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2xpp-0000000016p-3D2j;
	Sat, 05 Sep 2026 21:22:01 +0000
Date: Sun, 6 Sep 2026 05:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with
 low swapcache
Message-ID: <202609060532.n2Xnaxg0-lkp@intel.com>
References: <20260903040131.4016290-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903040131.4016290-1-zhangbo56@xiaomi.com>

Hi Bo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Zhang/mm-vmscan-avoid-anon-scanning-for-GFP_NOIO-with-low-swapcache/20260903-120131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260903040131.4016290-1-zhangbo56%40xiaomi.com
patch subject: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260906/202609060532.n2Xnaxg0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260906/202609060532.n2Xnaxg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609060532.n2Xnaxg0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:396:40: error: use of undeclared identifier 'NR_SWAPCACHE'
     396 |         swapcache = lruvec_page_state(lruvec, NR_SWAPCACHE);
         |                                               ^
   1 error generated.


vim +/NR_SWAPCACHE +396 mm/vmscan.c

   384	
   385	static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
   386			int nid, struct scan_control *sc)
   387	{
   388		struct lruvec *lruvec = get_lruvec(memcg, nid);
   389		unsigned long anon_pages, swapcache;
   390	
   391		if (!sc || (sc->gfp_mask & __GFP_IO))
   392			return false;
   393	
   394		anon_pages = lruvec_page_state(lruvec, NR_INACTIVE_ANON) +
   395			     lruvec_page_state(lruvec, NR_ACTIVE_ANON);
 > 396		swapcache = lruvec_page_state(lruvec, NR_SWAPCACHE);
   397	
   398		return swapcache < min(anon_pages >> 6, SWAP_CLUSTER_MAX);
   399	}
   400	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
