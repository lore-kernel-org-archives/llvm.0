Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30E9157A67;
	Mon,  9 Jun 2025 02:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749436537; cv=none; b=ACwHYYPFY4xfpdX+tzuzRDoWQuBiPnGsnROsMHy45JjiKQKSkWEj3Pk+GPYZNlLMrKUbkcBZXWfUgrtnSZK3Y3UlXvS4G7eS/6Tt0ljkhwMWmdtqrTlK1rktZ/0NV/q/uUWcflDoYy9RhCvHjMnEPnvArQJzlBqWpps/ot30MMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749436537; c=relaxed/simple;
	bh=xKMYj937iHvtVNeHWyYP3/MrdkI4JHPSk8bThsmDkRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mCdWGDyPsi2ZFVxPqwVddidRgAjS9MB4BH5gdXFUhPB589sTy0vmw38r/H/vtUybx4+riL5IE8cpUH1CQAml7QZSAW5ckCBWU6hcZ0pb4aBPD5rT1AREZpAT0hawsSagzEJk485C1niqrgc+94K6kzm4f7l6tqO1LFYbI0CsIzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiJZWRzp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiJZWRzp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749436535; x=1780972535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xKMYj937iHvtVNeHWyYP3/MrdkI4JHPSk8bThsmDkRY=;
  b=GiJZWRzp/Xy3psgqaJ90kUWf1T91Vhk+H/mpAFbsVuYCiGyxEZJ/9GoF
   3ugApZ1kaGrZjtFy1g4yHaFwyFRbpYw+HF13biMxbZD0I48lKPIjAAZ6F
   XuoXgjJB2J1nWhlsUimrm7zfmBn/5Sl/YUyW+ekIdMbH0ZJYauZpZsWjj
   +1doeUDB6HCT859sOJ7uzcJ19ZTAytEwOLVu40d9dfJjlnDVb/qZD/88o
   7BbDWiwmjTIGRGDZo7Wkhf3Ym66N5vbBkCHBer/6KkoIfNniXazsg1uXu
   fFghTpqgd8k22pJKnyDYqUxNMtIjbguPjrWRKtswlOFlBPMTbvZt98ZFz
   w==;
X-CSE-ConnectionGUID: lHPCsBw7R+uIlXtnZRproQ==
X-CSE-MsgGUID: 1lXScn0iQOyEMomAIUaRJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62860831"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="62860831"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 19:35:33 -0700
X-CSE-ConnectionGUID: uPhRchAyQQGutS3BUhT+9w==
X-CSE-MsgGUID: UF33dw+RSBu5v28ODxCs8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="151537186"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2025 19:35:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOSMC-0006jl-1X;
	Mon, 09 Jun 2025 02:35:28 +0000
Date: Mon, 9 Jun 2025 10:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [trace:sorttable/core 2/3] ld.lld: error: undefined symbol:
 __tracepoint_swiotlb_bounced
Message-ID: <202506091015.7zd87kI7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace sorttable/core
head:   6ff69a9fcc809b9fe23a55e798f1d8fa96cd618c
commit: 2c3b6203399993766be7756222c812e1b63e84f2 [2/3] tracing: sorttable: Add a tracepoint verification check at build time
config: i386-randconfig-006-20250609 (https://download.01.org/0day-ci/archive/20250609/202506091015.7zd87kI7-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506091015.7zd87kI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506091015.7zd87kI7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __tracepoint_swiotlb_bounced
   >>> referenced by dma-iommu.c
   >>>               drivers/iommu/dma-iommu.o:(__do_trace_swiotlb_bounced.__trace_check) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
