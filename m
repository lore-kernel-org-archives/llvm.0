Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E08221D96;
	Mon,  9 Jun 2025 21:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504001; cv=none; b=Ml89j+UJrtQC2bRhA0B4Htf03PbFye6OU/U2SOw4I9YnCSb/YH7GWiojUc6vMbapknqmRSHtjZOU6Gr7rnHDQZGedhlPwbbyFCa0FL3hIyuePYaSySQLWN+Z3Si3s+WuD+t+d2trz7VvVqIHwrI+f84neMsjP2FuvgQsYyxbpgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504001; c=relaxed/simple;
	bh=3OO1rBaAEpphzjEYCRVOU9Nr33M7bIyVwr0EgDIFx10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAA2RLjJrg63voe3EYF2D2jEtebQwWaKbKjtEUqFa4Ew/maQei3kM+Ohmnw1lOIbIYii0gEYoQsI6y3IRqkRqTtBYOLNBva0b0S1u+Jsv1Vn5ONDLPv1UcvX0/CeDKcvoK6Cmn1nVAnVW4V+ZLGFEX2FvtMVKXbBGvYFU2BKY7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtX/RDXv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtX/RDXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749503999; x=1781039999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3OO1rBaAEpphzjEYCRVOU9Nr33M7bIyVwr0EgDIFx10=;
  b=FtX/RDXvXQF6owIeyoOKbXQMroGTwQqzYUOHzh1FWKZ38XcZg3ounMFe
   n29FlKE25bivYfhvqgIbVlzThk/8UKDA8+i7iEkyLIcML+R++UDJSmCcS
   HUMlDkCNGFQnjuS1cmyr/wlsjfS3K7h0Vuy3jIrgsByY72z6cSIzPhf+n
   1AzdQy3CmhWkECiPB5LKspGjIoPnyGxPv4oxsHlyEjkxd9rVYbtFoYB72
   xt0jpbQYtFy5VrQah3uOT7L3kUtbL8n3JJE65Zzvay+XBXoypvXx8rTLD
   fzfBVU5o4DfvZEuXBbozfNOn/R1j51hKdKaobpd0uqQ1rTCm2qMcf1k2b
   w==;
X-CSE-ConnectionGUID: 9SnTzWX+RGG6sG18pkBV9w==
X-CSE-MsgGUID: YTqNKsM0SuGKayD+pGHI+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62211119"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="62211119"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 14:19:58 -0700
X-CSE-ConnectionGUID: qVAFcne8QkC7Zlb+Lhtx5A==
X-CSE-MsgGUID: umQU35o3TNmuaDL+h4UGuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151628255"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2025 14:19:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOjuN-0007Qz-0U;
	Mon, 09 Jun 2025 21:19:55 +0000
Date: Tue, 10 Jun 2025 05:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 15/21] drm/i915/flipq: Provide the nuts and bolts code
 for flip queue
Message-ID: <202506100537.aqJUNf0d-lkp@intel.com>
References: <20250609141046.6244-16-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609141046.6244-16-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.16-rc1 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-dsb-Use-intel_dsb_ins_align-in-intel_dsb_align_tail/20250609-223955
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250609141046.6244-16-ville.syrjala%40linux.intel.com
patch subject: [PATCH v4 15/21] drm/i915/flipq: Provide the nuts and bolts code for flip queue
config: x86_64-buildonly-randconfig-005-20250609 (https://download.01.org/0day-ci/archive/20250610/202506100537.aqJUNf0d-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100537.aqJUNf0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100537.aqJUNf0d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915.o: warning: objtool: intel_flipq_add(): unexpected end of section .text.intel_flipq_add

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
