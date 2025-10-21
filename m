Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E03024A049;
	Tue, 21 Oct 2025 05:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761025219; cv=none; b=tHrS9tJd5Go/eCOMAFIao3d+BVv6fXXXXf0vbMsVowV5XQBiT2gomoyhADLwfjMxIsDFND1iVey47GusAcg94d3elGIinHvMtR/LJaxh5+gMg0UVGl5/rNksfZT5QzoOTWzLk2togROiZ6zTKmDEw9euk0luIIR1pn4twwDBAGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761025219; c=relaxed/simple;
	bh=oujJ85PWaD6IiI9Q4IAq1iPNCbePA6PPEN2RiT5yEZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nrGf9c0lfgzH3M9YhbVfaqLdXm1JqjwVTIXtLLYLfi0WY594KkXtTMqoDiNNAXv2fFy0aDVXcSzvXgK+zYo20w4PWN2q8AhJnp6yG7GBmDj+GltS26Ol7Mldd55hbT3/AwtgBdxS5Kc3Z1wk0+YWM1BAgMj/lU2PGtLwN7hqhF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ij1hAUW/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ij1hAUW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761025217; x=1792561217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oujJ85PWaD6IiI9Q4IAq1iPNCbePA6PPEN2RiT5yEZE=;
  b=Ij1hAUW/1g9/9rf/qGQX5fU8RA3239GovHoU/xsCkADXH2R2SOG7pP7Q
   f2OsaFysLPmBZ5K7moX/MpYjG96i8J4V1E03Aa7khZmHolbEJL2ECCTR5
   RCKhHNIAuVJer5TTXog72grhZlKHAzZ8h8pIJQIdlN/StqYiJCVSkpbM2
   gfPob4ZgNCyJ9njkxVmQh7orVawwAwV/0Tvf9dAvEG++VAPxJLj9EBujV
   jxfnDPMAPS0KUvX1ITv0rsW/tzgaZ4sTQTEzRfoVrkemj/UkjFVaARAiD
   bTwCAYsZnjFbbtONvyCuCqgtiAUdtEs4IAsAMynu4HwXEgY1idAm0vw4g
   Q==;
X-CSE-ConnectionGUID: tFhTrrwpRjSjvHEXqRVMpw==
X-CSE-MsgGUID: W4dwQZavQhqHlAx8oqkb8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65760711"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="65760711"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 22:40:16 -0700
X-CSE-ConnectionGUID: gvZ9rWllSbi1MTVZ3O5xLA==
X-CSE-MsgGUID: a4XL5PLQT9WRB+sPgCp8Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="183988210"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 20 Oct 2025 22:40:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB56T-000AWb-1v;
	Tue, 21 Oct 2025 05:40:13 +0000
Date: Tue, 21 Oct 2025 13:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:balloon 6/25] ld.lld: error: call to
 __compiletime_assert_453 marked "dontcall-error": BUILD_BUG failed
Message-ID: <202510211311.Aj6KFHnF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux balloon
head:   0a0c3fe6c8f5ce25ff3a6db7a788916f0ddbabfb
commit: 5c97fbdec1af55077cb5ca8637506aa5418f907d [6/25] mm/balloon_compaction: centralize basic page migration handling
config: loongarch-randconfig-002-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211311.Aj6KFHnF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211311.Aj6KFHnF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211311.Aj6KFHnF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_453 marked "dontcall-error": BUILD_BUG failed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
