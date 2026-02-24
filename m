Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECE42874FE;
	Tue, 24 Feb 2026 18:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959250; cv=none; b=SdhIWU9mSoNDhUN0EtK0fhzPvDgyflxtNn+0iAYRwJQt89joZSQI9W1YvrL93gea+FWsmXfatgZO+HfgDc5y9SCGBZbafMsVZpBwGwouMvYJ6f/kRDscTbwt4CxUTOTSfKm1XFeNjomLN3h7dTz/NtDgyCYMQe4DW2NugVOwBp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959250; c=relaxed/simple;
	bh=pA3DPEAcwnPXpmcsvOzdGsmazxFwvvrygWXsa6rpajk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8l2r79ofw5sHyJ9dUSRzV5fTpkTxYHGqu2olWmIIyIL+uii9AkLsV27dx9eHRAB/CQsQObw0OADkGKDjuuODQNBuaH0Jf5WH8CdAfhH1wVTLX8VOE0RFE+E866Ks6CJ+Ovo4+MchJNahXA8ghcKxl2VadiJI/o9OTCd902mNgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3wMHSgf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3wMHSgf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771959249; x=1803495249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pA3DPEAcwnPXpmcsvOzdGsmazxFwvvrygWXsa6rpajk=;
  b=l3wMHSgfXacsGGqMqPuZU84RcVQ48CZjiMYv5qq3t30HNl8tJ+37wbBq
   u8kC9K6ASgcREWrJPjDKbeo+szqWxftH0BcqTNIiXEc8DH7IIfd/PRbWd
   /gH33gJ+o3pL1TRYkTz6uGN3Y6K659sunGUmdRwSzLG++RAK/O8yFyus4
   2VCmgSEh5lUsCGB7qCmPBd3Qq3AdNTQoA+luN/xr47nMLAR7ob8BKg8PQ
   oLe+tpHGakZVXWF+AO0w284PjF4riDnn7b8homekipoP26J9oQIuxU/rn
   QTn9X6Miy+5aH7NSlHqj/PAYSMQl7NJryi3uX9Le4tKTT7WJJMetWy2Hh
   w==;
X-CSE-ConnectionGUID: mRelGBOdRdO5vnomWNIVbQ==
X-CSE-MsgGUID: moc788QTR9mr3pijNjmXFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="95600912"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="95600912"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 10:54:08 -0800
X-CSE-ConnectionGUID: PZ0PD4OjRaGO0XoD1U21dg==
X-CSE-MsgGUID: oOuji2MwSO6qVUbEwY8SOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="219455954"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Feb 2026 10:54:05 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuxXn-000000002MX-207S;
	Tue, 24 Feb 2026 18:54:03 +0000
Date: Wed, 25 Feb 2026 02:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, vbabka@suse.cz,
	harry.yoo@oracle.com, 00107082@163.com, cl@gentwo.org,
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/1] mm/slab: mark alloc tags empty for sheafs allocated
 with __GFP_NO_OBJ_EXT
Message-ID: <202602250250.n38q74JK-lkp@intel.com>
References: <20260224165250.1322946-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224165250.1322946-1-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7dff99b354601dd01829e1511711846e04340a69]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-slab-mark-alloc-tags-empty-for-sheafs-allocated-with-__GFP_NO_OBJ_EXT/20260225-005422
base:   7dff99b354601dd01829e1511711846e04340a69
patch link:    https://lore.kernel.org/r/20260224165250.1322946-1-surenb%40google.com
patch subject: [PATCH 1/1] mm/slab: mark alloc tags empty for sheafs allocated with __GFP_NO_OBJ_EXT
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260225/202602250250.n38q74JK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250250.n38q74JK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250250.n38q74JK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:2787:3: error: call to undeclared function 'mark_objexts_empty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2787 |                 mark_objexts_empty(sheaf);
         |                 ^
   1 error generated.


vim +/mark_objexts_empty +2787 mm/slub.c

  2783	
  2784	static void free_empty_sheaf(struct kmem_cache *s, struct slab_sheaf *sheaf)
  2785	{
  2786		if (s->flags & SLAB_KMALLOC)
> 2787			mark_objexts_empty(sheaf);
  2788	
  2789		kfree(sheaf);
  2790	
  2791		stat(s, SHEAF_FREE);
  2792	}
  2793	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
