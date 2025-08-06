Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474DC1FB3;
	Wed,  6 Aug 2025 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754468966; cv=none; b=cHqG3qQrTfpMy0dEiwVbgWINU0rbRlbEcJuhX954BAY32Mzak4IdwFpbQBbCJy34EFn5S5Uh8cbuAck17QgsoPLaxGtHVf9Ltbphr3h5cdBacx7EW8VaOLPNtDWo0QKvASGr9IHzyRkmFDxMom1+Fd2Tn1A1KgfE1WAO1Wu8veg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754468966; c=relaxed/simple;
	bh=3MkaBlYl7bbIXtBAkjgxrrPhozfRCcl/Q0O7Zrxyj1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScAWRJQqHk264V9parRzsHNUhgXiXM0AmgN4ebzUUyS20kLPOYrI6adX78pQ4TlxD8r8hH/medMcXbx+RIPm/fxDIenpDAigk3t/4HMrAEQMP2MFq+FUz7494zCXHB+Ewr2jPEMxmpnBVDEHEJAZsxHK/JU+rUBJHfBBbrFpz0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kl8qWr91; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kl8qWr91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754468965; x=1786004965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3MkaBlYl7bbIXtBAkjgxrrPhozfRCcl/Q0O7Zrxyj1k=;
  b=Kl8qWr91ws6p9XxzF0+UTHc8gDFjI4O18pEGoBSI2BY0VNt9rKH4YqIu
   J9Mwwv0xAwJ4PRokRvtraWxtFM0G5q4OK+0IOKiqgPfra+y0lPVLX7zLm
   9SROwj1PZrmNqc7XgE2z/b2xrGG8uhnbmdqHwR/d0SZGBKs/6hMGX2BGC
   J1feEJ3UFE4wyytB+z0G869OFPJsRhGE8VxyasxFj6/ycgyBlCveaZ3Cr
   GmxHoW51o68AMSc0nLEpUcCQ6DBvIcnMBZYd/sTTs9L11bx2k/6igHr7o
   zjMvPc5Um/y2kdCd8egqrYIWDh8Y1MHCzjh9NcXKqxX/Fl40fkHuwb+ip
   g==;
X-CSE-ConnectionGUID: hDthVb9qRpGybmEfwzP6HQ==
X-CSE-MsgGUID: /Kr3YYo4Tl6Ms3Pe8Nwn2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56646082"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56646082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 01:29:24 -0700
X-CSE-ConnectionGUID: B3tt9/kfQXiu955zNIwD9g==
X-CSE-MsgGUID: a1yu/jtsS4eyXQXK8kXSjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="195682167"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 06 Aug 2025 01:29:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujZVs-0001PC-2Z;
	Wed, 06 Aug 2025 08:28:47 +0000
Date: Wed, 6 Aug 2025 16:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/4] mm/kasan: make kasan=on|off take effect for all
 three modes
Message-ID: <202508061626.RDgkUhgE-lkp@intel.com>
References: <20250805062333.121553-5-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805062333.121553-5-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-kasan-add-conditional-checks-in-functions-to-return-directly-if-kasan-is-disabled/20250806-104340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250805062333.121553-5-bhe%40redhat.com
patch subject: [PATCH 4/4] mm/kasan: make kasan=on|off take effect for all three modes
config: i386-buildonly-randconfig-003-20250806 (https://download.01.org/0day-ci/archive/20250806/202508061626.RDgkUhgE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061626.RDgkUhgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061626.RDgkUhgE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kasan_flag_enabled
   >>> referenced by stackdepot.c
   >>>               lib/stackdepot.o:(__jump_table+0x8) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
