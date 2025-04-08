Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EBE256D;
	Tue,  8 Apr 2025 17:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744133553; cv=none; b=Zje/eghCNLUjUVAnEDl7wCL6GGkOmY1oAhPPkulBpq+asN0bWrxlgWzJhSY/fT2zYe7B00D+O3TziJ4ss8kM6sXtCbyb9sqm9o8gFYQGXpomBWT9eR98sesc4Wd4nVX6IT/N8FiNvkwF9MuzvKUyU5xx6Hcqwl8FVQf+MzxF6Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744133553; c=relaxed/simple;
	bh=tjSc94/4bjwOshFL9Y6vCxLLFEy9rAr7faiz3N4gFnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=myYLUGHfuaCFgSnwGfvxrvL6awHUbZ28T5bQVT2SdiTFB5Sf+v3eP7KEEZ/fWIlh4xWjmKwAeEEMzlolZ9i9HmhSxtd0F4B+XJrmmj+6W1Autj4miotm/SMXbYqYSIuK4/IaojC6En8678GC0oQmqe0L63T1xBgxYSHcnoIgzKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvSC8fxl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvSC8fxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744133552; x=1775669552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tjSc94/4bjwOshFL9Y6vCxLLFEy9rAr7faiz3N4gFnA=;
  b=CvSC8fxl3YVX9oJ3iLHlP5jBsLevizkM3lfMeYHyTWepR685URCEEEHp
   MmQttEVvObqQjLvDQgnMpUwE+hqBeSlVCY2CZxO9FmBYrmjtHoknaekGz
   eG4RTo7bo+GOekDi26fny6FFRZId12xWmgpSfDO2phwXMJBTYzwnaZEhL
   c3TziqFGGySJm6N9HyOucas7haCRlb/UcdkLNHNK5ecWreKUtHvE0wJeA
   8R/q/I2FLmvouvNRCacQnHtHYMURFFqBzbfFUnDVHhjTuyWwVJQUWDwG5
   sktao/qX2fR0TbG3daarLjc3vfMtfl2PvgeLnrKrxIPdYaocdyUjqfG4V
   g==;
X-CSE-ConnectionGUID: /XW7tvG6QWWr4jI9VPQHDQ==
X-CSE-MsgGUID: 6olBHzoXScWPhomaN9KgHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62982276"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="62982276"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 10:32:31 -0700
X-CSE-ConnectionGUID: 829BBS74TEGuU32cPdlvEQ==
X-CSE-MsgGUID: tl3oDdd7SVKVvJRLa9IePQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="132469463"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Apr 2025 10:32:30 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2CoF-0007lz-1W;
	Tue, 08 Apr 2025 17:32:27 +0000
Date: Wed, 9 Apr 2025 01:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:task/work 7/7] ERROR: modpost: "folio_batch_add"
 [drivers/gpu/drm/drm.ko] undefined!
Message-ID: <202504090117.IHJghNLG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git task/work
head:   70ba79c14bf8ec8761e30fa594bc7ecdf9e39941
commit: 70ba79c14bf8ec8761e30fa594bc7ecdf9e39941 [7/7] mm: Drain LRUs upon resume to userspace on nohz_full CPUs
config: riscv-randconfig-002-20250408 (https://download.01.org/0day-ci/archive/20250409/202504090117.IHJghNLG-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090117.IHJghNLG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090117.IHJghNLG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "folio_batch_add" [drivers/gpu/drm/drm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
