Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD0428E560;
	Thu, 29 May 2025 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516601; cv=none; b=BigP7iV3HO0Abyf+G3mhELLJiz20kYdYML7KPDt9B3wua6Z2BQVsOnJRApDRp+W10dROkOl+jscT0DyRILiV3Ixueg0y9M/8Bx7RRNdeFpGqLArL/KmNgoyTTxm5QGEqg072FbuvSmx1YLiLtXO2Pda7w5pAmoHu0XWb9gQysgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516601; c=relaxed/simple;
	bh=46C0qp1P9hdrqxlmHG8XRUpknU5CxmGRIZ3adtwxapI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f6Gm0u+4FGdD9ZhrNOk2VXoGypLerZt8bq63wA+Noq5SbTT0N0EVpMMVddP32g0z+ZqXCp0PfhWYCKuJwNV1xIv5m5QMshXgSOZlB9mLiLDu3iwEiIARoR35/mzgY0G4zXiMo4kLJOuf1IG8BAv48IQTbDYvr6UwqxfLiUSIKCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aeyuaQIp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aeyuaQIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516600; x=1780052600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=46C0qp1P9hdrqxlmHG8XRUpknU5CxmGRIZ3adtwxapI=;
  b=aeyuaQIpd0cwBHIzDkKxYz3E0P5D4DeNkv2XvvPh91kUE53/oE1zlOrL
   Ruf3xVNVwQlGb+KVpe3Uo3Jqh2MAjYGQTUD4Rx7chwE6iPP2ZAQcqkb64
   fLg6TAFN1/LimBvLgy6pw664bZZYPCnDUW1A/aoI1iVn1SBXvFQL83UNC
   M3bSP9Bw89M+4RE2odP3Lwh1aPEEtpcTtBo731vybVKJLl37d1uSkMVGB
   5X1JXOPBv0dei1mI4+sCfyAbz9tpc+NkknfoJRt82QbdWVVHUohjZRGmB
   PIK0wTgF+gJmexbrz7ZBjCa8G4QHOCcmuD4XDpNfX0TERFYWJZhPWkJbL
   w==;
X-CSE-ConnectionGUID: LXarnG1mQi6DhkqY/m3Fgg==
X-CSE-MsgGUID: z64wTY2XReSCZSYxiSUuBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="60830486"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="60830486"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:20 -0700
X-CSE-ConnectionGUID: jfd8lj0ZRGKBsOVHrdKHHw==
X-CSE-MsgGUID: bJ+qmBoLRNma6drRn0pzXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="143864577"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2025 04:03:18 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2a-0000WI-0w;
	Thu, 29 May 2025 11:03:16 +0000
Date: Tue, 27 May 2025 04:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: <instantiation>:7:11: error: expected an immediate
Message-ID: <202505270413.1AsTfH0q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3e406741b19890c3d8a2ed126aa7c23b106ca9e1
commit: 56651128e2fbad80f632f388d6bf1f39c928267a MIPS: Fix idle VS timer enqueue
date:   4 weeks ago
config: mips-randconfig-2006-20250514 (https://download.01.org/0day-ci/archive/20250527/202505270413.1AsTfH0q-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270413.1AsTfH0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270413.1AsTfH0q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:7:11: error: expected an immediate
    ori $26, r4k_wait_idle_size - 2
             ^
   <instantiation>:10:14: error: expected an immediate
    daddiu $26, r4k_wait_exit - r4k_wait_insn + 2
                ^
   <instantiation>:10:30: error: expected an immediate
    daddiu $26, r4k_wait_exit - r4k_wait_insn + 2
                                ^
>> <instantiation>:7:11: error: expected an immediate
    ori $26, r4k_wait_idle_size - 2
             ^
   <instantiation>:10:14: error: expected an immediate
    daddiu $26, r4k_wait_exit - r4k_wait_insn + 2
                ^
   <instantiation>:10:30: error: expected an immediate
    daddiu $26, r4k_wait_exit - r4k_wait_insn + 2
                                ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
