Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995C280A5A;
	Mon, 26 Jan 2026 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438999; cv=none; b=oBBk8cKwvSjZl1mSaTSSoN+ulcWgTrjeYoPu0xWLrOa7Z9N3+SMl+caENnjieaofRhtNzDHyD4wFjN+dhkvp2iqhKW5J1kdj3BSSwPbSiV454Eh2pGxwknTbqMRo5SR/xHbA1k0lREOCE3HFj6nMV/9ANWxGGA9wVRBmrc5bcRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438999; c=relaxed/simple;
	bh=147+yooa9M+i1b/hpx7ac4jjSG75zpJGm7LYFi7ffb8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gATaUZCon6Y6MrGsLet45jpR9rhhitCylJog0tVOvga4NrpEcO+S1qmAY9Rjz18/zKgCOE9X/1TNSv6Ycwxy7qiEs1q0u/57UiSu0KdeVF+7yxPc6RUtvWJcTMKKL0/dF8JrIITQYdJEwh+/ZKCzzspd3464elYdOghhGPRj1GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEzm4Uuy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEzm4Uuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769438997; x=1800974997;
  h=date:from:to:cc:subject:message-id;
  bh=147+yooa9M+i1b/hpx7ac4jjSG75zpJGm7LYFi7ffb8=;
  b=FEzm4Uuyc4kXqRWzuATBgOxvp5EOjl9oUzIkKLqFDjb30DR9r45vOcWg
   p/63iEQQW13xi7+uaOSfOiZ+/dPvKKAErRGuF9zpgmdSwmx/FoTTH8lvb
   yJNpswZelNXdIs0ZyQ8A4boWWdGzMDZoVKleiFG7mNrOiaY4MH5U2+r1l
   1i3TWBmvs11HZsBf41dR/hJxM4DBF1+CuQ3vaw6eWVxe61V3LN639ak05
   BYI0eiYVSJ4JFvVpt+oRKWPkqjk24gQbn6yMCn/tJxsAk/KzhqGZl0mEX
   7n6eiSqfrL5pHNpbZrGW3wI24/xzr9wHHgpnYBWKet+FZO9R5seI9Nldh
   A==;
X-CSE-ConnectionGUID: triHSFwPTTGvZVZjunXFzQ==
X-CSE-MsgGUID: QtgECa+/SYejEK4UX/JvpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="58189628"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="58189628"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:49:57 -0800
X-CSE-ConnectionGUID: +Zdcdl1mQDqWdSlxIDcWdA==
X-CSE-MsgGUID: YlkyLuJ2S6G+g3taRw/iBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="238947023"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jan 2026 06:49:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkNua-00000000XPQ-34bq;
	Mon, 26 Jan 2026 14:49:52 +0000
Date: Mon, 26 Jan 2026 22:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mike Rapoport <rppt@kernel.org>, Nikita Kalyazin <kalyazin@amazon.com>
Subject: [rppt:uffd+guestmemfd/missing/v0 15/17] ERROR: modpost:
 "filemap_remove_folio" [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202601262218.lYHympVp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd+guestmemfd/missing/v0
head:   4ef69952db49cd0d355a1485070765e8b7006397
commit: 6ae245b55ecaeb75e0cfd85588706057b3a699d3 [15/17] KVM: guest_memfd: implement UFFD missing
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260126/202601262218.lYHympVp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262218.lYHympVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601262218.lYHympVp-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "filemap_get_entry" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "folio_alloc_mpol_noprof" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "filemap_remove_folio" [arch/x86/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
