Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B1A1DE2D7;
	Mon, 25 Aug 2025 22:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756162799; cv=none; b=ip01z/rxZkqHcjrm4PSZPwkU7Lv+IPGsvEsB3JD6w5UWXkx91T9fceSZnrW0Z7Pa1nzf1o6DLWrnce4TnoupYCSpBkhaKFCMe0i2auaM9twVpYpCyneyG7iWMp5b7ZTzs7JzzvOI9K/AmEmbL246saCJYY6GLl+1xl5l9dpFZw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756162799; c=relaxed/simple;
	bh=mRRKgjKMyvpCzk18ydfgoZX5u+mr51mF2sVn28BYaig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kaSQl3lOmfVljcliN8rWeqH3+lCCBrnfmF1bAIvZzo0sM0Sid6RhDQ/0adMYIswk14p6oFMXuLcEC+kCFwcouzMhGtOsSlk6WDNhrGNdsBkM2DJFllxcQAN031+tJEj7Zu32WarHo37jDC25Q/kP/pnCAIRBhbRh0cXEhBT5dv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQb8rG2S; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQb8rG2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756162798; x=1787698798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mRRKgjKMyvpCzk18ydfgoZX5u+mr51mF2sVn28BYaig=;
  b=CQb8rG2SaPmHpA0W7FRox80DerUmUZdyl/cq+9XyFWZFOnMBLgY7TrfE
   /iBi/PAfwAxANrngUddTfnDczx9O9nU4LipYdR4vPwxnw64NzhJsXmF5B
   qar9A2x2poEHA6jg8QDzbZJGCYKsL89VljnMkuMhSxCfEaw/Oeot1UB+K
   VcqAiAgqlWtoJVZeoV8gH/k7m5PFUtWws9mf/uOMDqjFfS0D23c+tIgCY
   RxFKj9RoLg8DRPSGm0a1vICTR8mbIF+HVF2xCP0SSg8JZusSDvIgBcBTB
   fWBVIFwhcZU/gS3cb2ShjLF1z59S5OKcetmGuBBK046RIKDSOd7KPdDH7
   w==;
X-CSE-ConnectionGUID: OB25opRRSaCbOmiKCt48Vw==
X-CSE-MsgGUID: wfkybadLTe2PUuwSV9z7Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58306455"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58306455"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 15:59:57 -0700
X-CSE-ConnectionGUID: VszVHAz3RYGaXoO3yjfUFw==
X-CSE-MsgGUID: fzwol7PbRWinD5JwzBss+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="168625154"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Aug 2025 15:59:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqgAM-000O3X-1c;
	Mon, 25 Aug 2025 22:59:54 +0000
Date: Tue, 26 Aug 2025 06:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:nth_page 23/36] ERROR: modpost:
 "page_range_contiguous" [fs/ecryptfs/ecryptfs.ko] undefined!
Message-ID: <202508260617.FWetJFVm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux nth_page
head:   40aae5778d339c4665481ad44d0c3c71b434fa93
commit: 18758b891cba728a11ddbc87a1f75adbb6d318c0 [23/36] scatterlist: disallow non-contigous page ranges in a single SG entry
config: i386-buildonly-randconfig-003-20250826 (https://download.01.org/0day-ci/archive/20250826/202508260617.FWetJFVm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250826/202508260617.FWetJFVm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508260617.FWetJFVm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "page_range_contiguous" [fs/ecryptfs/ecryptfs.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [crypto/tcrypt.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [crypto/essiv.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [drivers/tty/serial/pch_uart.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [drivers/char/agp/intel-gtt.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [drivers/gpu/drm/xe/xe.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [drivers/crypto/hifn_795x.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [drivers/hwtracing/intel_th/intel_th_msu.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [drivers/hwtracing/intel_th/intel_th_msu_sink.ko] undefined!
WARNING: modpost: suppressed 2 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
