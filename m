Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0501E990E;
	Fri, 21 Mar 2025 06:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742537651; cv=none; b=gEvMrqH530f0r6K0Q9QHlAjl9gXW5hiAa0jn6aYJrYCD940rqrN8nLaYy7rTIzkBrPq0Ckr84ZZcU+ne1zVvNSE+rJ3+GWOFZARNbTgAuA3UqM62dE12Ow8yJmEwU7j5c+8LSFQc5ogUu+ajDpWviwACLvTZqLyFiHULA4pTJ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742537651; c=relaxed/simple;
	bh=gPewbbVgRuOlKvneWv7ERQTNcx8yFZRrOEwjlo4GIGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yc5jIJG3/A1Vt1uUlKbgtfpxSA2AnYRf8feMiuXrM4kMlXqntWWbwa0U0frObr0KRBJAb70pdn//mva/MK78FGyPRKrDonqxJh2/uJ53lbJFpjKIaETbTkfut4Ftbh6X/riHvGfLd+Z25V5FOUR0WXwkCwh2sFFbuIIsPGqx3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0hIwvgQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0hIwvgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742537649; x=1774073649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gPewbbVgRuOlKvneWv7ERQTNcx8yFZRrOEwjlo4GIGo=;
  b=n0hIwvgQp3Tk/cezBwwuEvI+285g7j5ugoN9e3AgwWgQbWoemsbf2ebH
   9LZwRcDf3ycV6kdTE3SwIHl5fPyRYXhx/RS5jzomRZMtE+F6PYJaQ6IW3
   v1R/U46n1O1K/4shfqCeylNqBm8Uwkde0rRZytGBuv0ZqDcyFPvJ7udLo
   BH8CG8UPbZ2haEjmAPw4zCQ5gy12BceuXbxUAPp/i8kEDDnFuwuzopt1G
   4tv8SzAR1i6PfUSTkl70hP+KwQ8mOTB/XltvJqftl57OrL6/U0Ix1xLIN
   ASCUd0fZU1GAMrNo1e6r/TaHr4J1lfCuvSf6QCgTE0At9+NfYDHKAGkAQ
   A==;
X-CSE-ConnectionGUID: ZlQiOyMwQc+e+/d5A40pMw==
X-CSE-MsgGUID: k54pzxtPQ4yIbdGft/sw9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54460209"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="54460209"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 23:14:09 -0700
X-CSE-ConnectionGUID: OWrTXGSaQtin2askx3z5uA==
X-CSE-MsgGUID: TBZPduSxRa6e1/pBL2R9gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="154317058"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 Mar 2025 23:14:07 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvVdp-00015N-0W;
	Fri, 21 Mar 2025 06:14:02 +0000
Date: Fri, 21 Mar 2025 14:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/3] mm: integrate GCMA with CMA using dt-bindings
Message-ID: <202503211329.lucpLTfc-lkp@intel.com>
References: <20250320173931.1583800-4-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320173931.1583800-4-surenb@google.com>

Hi Suren,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 40caf747267c18b6206e26a37d6ea6b695236c11]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-implement-cleancache/20250321-014107
base:   40caf747267c18b6206e26a37d6ea6b695236c11
patch link:    https://lore.kernel.org/r/20250320173931.1583800-4-surenb%40google.com
patch subject: [RFC 3/3] mm: integrate GCMA with CMA using dt-bindings
config: arm64-randconfig-004-20250321 (https://download.01.org/0day-ci/archive/20250321/202503211329.lucpLTfc-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211329.lucpLTfc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211329.lucpLTfc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: gcma_alloc_range
   >>> referenced by cma.c:829 (mm/cma.c:829)
   >>>               mm/cma.o:(__cma_alloc) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: gcma_free_range
   >>> referenced by cma.c:1012 (mm/cma.c:1012)
   >>>               mm/cma.o:(cma_release) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: gcma_register_area
   >>> referenced by cma.c:174 (mm/cma.c:174)
   >>>               mm/cma.o:(cma_activate_area) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
