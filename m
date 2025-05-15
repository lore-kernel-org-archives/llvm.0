Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBA3154C17;
	Thu, 15 May 2025 14:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317711; cv=none; b=Icf952Rp6KQOjkeUaKgvK01PWk3Bv77NhiGVAmhDlj9W2N3W6NqK/LbOo9J4aOgm2Hax+QJ9TKfd7lTyvVdkQ/qs6lMnNp2d+ZiSl5q0zVSt23F7K+jah2RZ+RYKMy10E1S4bnMHgH/O6aSPo846ZBxM7wDMJkSclpJLzbghrbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317711; c=relaxed/simple;
	bh=fk1uLT1wPCcG2cvtZ2es4p0iml5DX/aZLkk2OIxKWHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lans1VXT2P2Ml+4f2Rt0ODEWHOOnjVHyTYlHTtcqCBREH7PbHNfNrwod2P1gKvFsDTCnXRJ5KYsh29SorJpgZ7mCqAi6XelhGXh+ueh48TNFeq2UPlynTV5vEskA2DhYVrji+d4RPoQGNi00h8+iPVEfRqKzv0gu026srg1h1DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZrD8WCH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZrD8WCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317709; x=1778853709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fk1uLT1wPCcG2cvtZ2es4p0iml5DX/aZLkk2OIxKWHo=;
  b=AZrD8WCHbBPK4joH7eWbhlQVqL8a1Lu7jEz3gcK2wxDij/f3SBaJFEKd
   0lZgFf71Lx7FrRxWwMLhZEtD7SOSh3DhlNPBcydOxb/BB4R/AtZhf/sbu
   jjWf7n+/NA/XHNS1ai4UvI3C4/dNjjtf+PCG9qfU5dsNqfc8yfZwKOz4r
   XWbB50Ra77R3y+hXqrCFWyVgfMZQWNQHlMk3s1O8yNf9uB/uSxEqKVGKs
   vemL6Uzafhou2FlZV1X0OS7S2WTzBQtyxH/pDG79LUJ4I8Sqlpvy/xkBP
   TXwXgQfWfOCYKxRv1UxkA7ZtJQSqsBihsW8bS7PbwRLchWhig8vq0VV2x
   A==;
X-CSE-ConnectionGUID: PSGEAeDCTwi6Nk/YiggDcw==
X-CSE-MsgGUID: gHp6TVJaR4OKiMDMGHHZRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59908716"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="59908716"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:01:47 -0700
X-CSE-ConnectionGUID: E9Y0py5IQ5a4i+aVeoGyBA==
X-CSE-MsgGUID: motb8SYRTjK27Julcgo1tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143267467"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 May 2025 07:01:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZ9b-000IRH-2K;
	Thu, 15 May 2025 14:01:43 +0000
Date: Thu, 15 May 2025 22:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Norris <briannorris@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 2/2] genirq: Add kunit tests for depth counts
Message-ID: <202505152136.y04AHovS-lkp@intel.com>
References: <20250514201353.3481400-3-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514201353.3481400-3-briannorris@chromium.org>

Hi Brian,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v6.15-rc6 next-20250515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Norris/genirq-Retain-depth-for-managed-IRQs-across-CPU-hotplug/20250515-041533
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250514201353.3481400-3-briannorris%40chromium.org
patch subject: [PATCH v2 2/2] genirq: Add kunit tests for depth counts
config: i386-buildonly-randconfig-004-20250515 (https://download.01.org/0day-ci/archive/20250515/202505152136.y04AHovS-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505152136.y04AHovS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505152136.y04AHovS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ucs2_string.o
ERROR: modpost: "irq_domain_alloc_descs" [kernel/irq/irq_test.ko] undefined!
ERROR: modpost: "irq_to_desc" [kernel/irq/irq_test.ko] undefined!
ERROR: modpost: "irq_shutdown_and_deactivate" [kernel/irq/irq_test.ko] undefined!
>> ERROR: modpost: "irq_activate" [kernel/irq/irq_test.ko] undefined!
>> ERROR: modpost: "irq_startup_managed" [kernel/irq/irq_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
