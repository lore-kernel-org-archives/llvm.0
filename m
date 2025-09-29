Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647E7218AAF;
	Mon, 29 Sep 2025 05:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122532; cv=none; b=MgIoFW3kA5nMZUzum//rP4nVbox3JlF4UiprGAj+SlYyqjfrxSh4eUkqGTpdkQM0eyaD+HSGkb6Km+XHJVHdaMNlIgjHFLnmzHYNkTiZ1xp0LYMVozPV+UFCu6+0yv3GyylgGTt2fbPsCWhBnE3z2lY4B8DDfKnOODg/JwSpVzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122532; c=relaxed/simple;
	bh=vmFbXJ9eYjUySXUsugcD51LX03MeJy5R0X82xdmLJM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZn8DV2tXwyE+I5gIQ3Da1VMuHIzJAeO8NjE2xGuLSjAls0o0qlXq02Bu+wn1sOSQkYmC0MPCMUz1yB2en7tIyx5o+5+VkgZQW3gg0sg8LuYk/+rNTFkAZqPbgf9USsEYHt3V8R/rKputPQsQD3WWEohrIqm+3qG1gUgYSeiBzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byVcFew5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byVcFew5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759122531; x=1790658531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vmFbXJ9eYjUySXUsugcD51LX03MeJy5R0X82xdmLJM8=;
  b=byVcFew5J/UEUnmwW19MJlgDpQh9bn+uI+cvsyGACNAFDYDJShibIYOP
   e1AuSsUSeEOy3xKKLvBiXmMSbFMnJzjb2wcXXV7OWtNaqp6ouhs635d7V
   fNUA60aVEGa1Wjb7PwXXhIDBeykfeawsH+TwGVhjw2qRK6IXVEBOPiOej
   IwZ2s6iFhJyAGREvcv1V2fK0i80ntMx2yxYZuqYFGpwdEDPQzilFwjTKR
   g+FGuG4Jx/OSB6ggdWYxr1bGo2czkTK1G1GqLXEZyweqrKQwu5YwpG5is
   pyIbXcIAFg0RCmtyBq9WaXwskWqdMmTh6CRDgixxzE8NrZ88VFB+waBNV
   g==;
X-CSE-ConnectionGUID: NFw+ehNdSbm2RjcZpAVtTg==
X-CSE-MsgGUID: Kol6wV4dT7a8plXZia6WdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="65207093"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="65207093"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 22:08:50 -0700
X-CSE-ConnectionGUID: sAtN4XetTSupzn1SmhgAUA==
X-CSE-MsgGUID: f8cccFq0TT+DSZ1Reu7tdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="177712173"
Received: from lkp-server01.sh.intel.com (HELO a2c9da549b7f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2025 22:08:48 -0700
Received: from kbuild by a2c9da549b7f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v367x-00003D-0N;
	Mon, 29 Sep 2025 05:08:45 +0000
Date: Mon, 29 Sep 2025 13:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Haiwei Li <haiwei.li@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Yifan Liu <yifan1.liu@intel.com>
Subject: [acrn:6.12/linux 10/10] ./usr/include/linux/acrn.h:14:10: fatal
 error: 'asm/acrn.h' file not found
Message-ID: <202509291226.ht0UC5ED-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/projectacrn/acrn-kernel 6.12/linux
head:   a3634b1a933e80ff672cc47bd32d2f036cfbe755
commit: a3634b1a933e80ff672cc47bd32d2f036cfbe755 [10/10] PM: ACRN: add s3 support for User VM
config: i386-buildonly-randconfig-002-20250929 (https://download.01.org/0day-ci/archive/20250929/202509291226.ht0UC5ED-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509291226.ht0UC5ED-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509291226.ht0UC5ED-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/acrn.h:14:10: fatal error: 'asm/acrn.h' file not found
      14 | #include <asm/acrn.h>
         |          ^~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
