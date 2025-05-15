Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB1E298C12;
	Thu, 15 May 2025 11:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310199; cv=none; b=un/PSrmq/DRD6JnJEqfTlMTXD+lneALpK4ILJBP8w7ot/mtOOv+KIMsKajr2UHBXWIWi+8R0I5c0fG4IBR9toAnn+xwm4GfwnJs1+tiyocAnXxRKrGumlboHFIB3t9r4h+YVqboa4djHOTRtw9RzDWX//KCvlJWV7OGnbrpesiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310199; c=relaxed/simple;
	bh=4OMtFolFinzHjPn84LWrbolxTZ1uAQxqAFjktiYUlmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdgyxIfP/NUBwFxHGLncy3A32iMxLfNKzZ81q6XNEyZGRrv8h2H1ozgAoZFMgpREKA2hNKLSA8K8EF0NQqqHwKA3UL7v1QnOUGaVfQZMTK2Noh6LftEbYAP0pocGBS5pArLa0325tNe8+ln9KKxSNn6LxpSV1EIHM2ImzaSob74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOmWOguC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOmWOguC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747310197; x=1778846197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4OMtFolFinzHjPn84LWrbolxTZ1uAQxqAFjktiYUlmA=;
  b=XOmWOguCa80NJ/fRzIBiFI4WeIbiNsHee7bzyv17cRB7CYDrxIu6dm8P
   VYugrrbk4mtp2LyxXtHxSh8n4cweHy6UXo/m9DVI8SVVI8ZaEFPMe3+xX
   +IX8ZAlLr8AMkDLMNknukKpLO4a6VqT7qxesjSJj+O6MLmS3qk+ojI6Dl
   +AOuss6g9cKJ3ev7Uzq0i/WC52C1vh3ignXMQt1ZmL9FaFOJJBkZg3PvP
   1KtfMyvz/5ioubqqKgWmudCkYIGBxXOoF8CAdLPGD40gGXArvpIr4xuIv
   9o1y/uzdZuwFh4IUokajnV+rLwEE4K9/w/1k5cIuENvZlFRt0ui2/9FMl
   A==;
X-CSE-ConnectionGUID: thDdjwfIQkyvkoS1P13kiw==
X-CSE-MsgGUID: jr84m3EkQyeF2xanATJ2BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="71751075"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="71751075"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:56:35 -0700
X-CSE-ConnectionGUID: Ks7bc7QnQ2afVXoKwHVa6w==
X-CSE-MsgGUID: c2s/ErsQR3O0ZPXF80q0AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143454434"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2025 04:56:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFXCR-000IL9-2n;
	Thu, 15 May 2025 11:56:31 +0000
Date: Thu, 15 May 2025 19:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 12/12] rv: Add opid per-cpu monitor
Message-ID: <202505151926.d7bhoonn-lkp@intel.com>
References: <20250514084314.57976-13-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514084314.57976-13-gmonaco@redhat.com>

Hi Gabriele,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on aa94665adc28f3fdc3de2979ac1e98bae961d6ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/tools-rv-Do-not-skip-idle-in-trace/20250514-164745
base:   aa94665adc28f3fdc3de2979ac1e98bae961d6ca
patch link:    https://lore.kernel.org/r/20250514084314.57976-13-gmonaco%40redhat.com
patch subject: [RFC PATCH v2 12/12] rv: Add opid per-cpu monitor
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250515/202505151926.d7bhoonn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151926.d7bhoonn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151926.d7bhoonn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/rv/monitors/opid/opid.c:42:30: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      42 | static void attach_vector_irq() { }
         |                              ^
         |                               void
   kernel/trace/rv/monitors/opid/opid.c:43:30: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      43 | static void detach_vector_irq() { }
         |                              ^
         |                               void
   2 errors generated.


vim +42 kernel/trace/rv/monitors/opid/opid.c

    39	
    40	#else
    41	/* We assume irq_entry tracepoints are sufficient on other architectures */
  > 42	static void attach_vector_irq() { }
    43	static void detach_vector_irq() { }
    44	#endif
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
