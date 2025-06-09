Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5230622F397;
	Mon,  9 Jun 2025 23:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512658; cv=none; b=b+NI2SlL2oIIi6e5vx+S3O23dzAjr6tOL9xFaVoH9v9G3Le7jsIkKHwSEtgbuFIR+MkR8V8ZrBPK/ggEdD4YCNjGnANgFaOTcFUPyBM5JDk2A5N1SmgMOzGNBV2tOqEHhRetzvty1FSgT8rs2kWfQisp/IXrMMnKs+B6zUljsHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512658; c=relaxed/simple;
	bh=3P/OUq5c6FfkUTEVJmzYt0vK/71w4SbGIIdb4llb41Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWvifHYOt3SZcWt7BhI9BquJTsRwIpI4DTWtUWZRkIEHZz5FWfgiz8yxsHnHJqRsBpblGg+a6IoneoTOE9nPMLYshz/PC5Sgk58Hyz685AjVZ2PQzGHbLxCly/QC0V8OWXV16LdFyybtOUIuTZ3iYITf5/3oYtBgRvbdCL4BzWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDxW1HyN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDxW1HyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749512656; x=1781048656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3P/OUq5c6FfkUTEVJmzYt0vK/71w4SbGIIdb4llb41Q=;
  b=bDxW1HyNiZ+/Z7KqjR4Le0nNdXPt6Zh8wsOJiHLw0TYDGRA+7nBt8oSk
   oxeEtdJ7E596xqFd4GNwD/S0r+FanmkqimEm34efrN3GkRNORlwdLwwWu
   3nBDjI9j7mezLpgi492Ok59YR0cQddrp446mUYE1iV1zkYZZqJKLM6K+w
   nM0EsgNVI68SypRZmtRsPOrFg4oNHOticDPukF4EB/GNlSkoXOrhpBW8Y
   YZ6acYHjm4uDtmPKAjiHc5p5OpbYDBnm/umSI4MAt1Jvw02aReTNbevBQ
   m/q1xbK68ICLDueS/1Gj8su3tKcqxp76o+k48MRYvlG4QwktNZ+JhnEJu
   Q==;
X-CSE-ConnectionGUID: uLXhP+9DRqWzTQbBzvUq0w==
X-CSE-MsgGUID: D1g1BZoQTEebk7LieuAcMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62959706"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="62959706"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:44:15 -0700
X-CSE-ConnectionGUID: OngE/0OIS7KGUaObBagp1A==
X-CSE-MsgGUID: 0RrVie8GRZiIgKcqj4QewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151658815"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2025 16:44:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOmA0-0007Wf-0g;
	Mon, 09 Jun 2025 23:44:12 +0000
Date: Tue, 10 Jun 2025 07:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 19/21] drm/i915/flipq: Add intel_flipq_dump()
Message-ID: <202506100721.2w919Dbq-lkp@intel.com>
References: <20250609141046.6244-20-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609141046.6244-20-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.16-rc1 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-dsb-Use-intel_dsb_ins_align-in-intel_dsb_align_tail/20250609-223955
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250609141046.6244-20-ville.syrjala%40linux.intel.com
patch subject: [PATCH v4 19/21] drm/i915/flipq: Add intel_flipq_dump()
config: x86_64-buildonly-randconfig-005-20250609 (https://download.01.org/0day-ci/archive/20250610/202506100721.2w919Dbq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100721.2w919Dbq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100721.2w919Dbq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915.o: warning: objtool: intel_flipq_dump(): unexpected end of section .text.intel_flipq_dump
   drivers/gpu/drm/i915/i915.o: warning: objtool: intel_flipq_add(): unexpected end of section .text.intel_flipq_add

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
