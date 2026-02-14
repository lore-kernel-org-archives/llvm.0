Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431E7221F1F;
	Sat, 14 Feb 2026 16:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771085982; cv=none; b=dZGRCckv+dZkWZXiPQ2cdA57ctUCVit7s+NDXO90rSAKfkVptBLDgcW5z4/kVtu3EyOqaFThCaHNb/F5UHRRau/jiFOOgSy1JSxtJwvH+KdXjn04CAB1bspHHun8S32zJ4iJJCWSJFXlco95qojVzJiohyNLAWsLIXUeMNe6i/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771085982; c=relaxed/simple;
	bh=OcaDc7hfywvDYdnMkHJ+tAPVdLXfWDHXW4EoX88aoq8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UF3iIvpfK12pryig9gr5sF2tmjdA4Dea6yL0AojChhQieSNMS3acCxTzrmC+yuUgMvQP0ZsZx6kqd8BWbL37WMcPplSYjZlGXZ9Gt1Px4ikulT72TY7OXKpsbryqgxtMnoWGCgCabm6C65Lv5dovWKF33jEOgVILOdqCyyrYhNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D97CDKKw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D97CDKKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771085980; x=1802621980;
  h=date:from:to:cc:subject:message-id;
  bh=OcaDc7hfywvDYdnMkHJ+tAPVdLXfWDHXW4EoX88aoq8=;
  b=D97CDKKwxbvf4Yxb6T9nolJM8b5kEUT42o3QS31SvIdOAiOAB66W3ZH5
   +Y+Km5qPM7hxDih2Pvej8dR0d6+Kt5daNUtLpDMJ/DgEtFrCR8t51ycks
   ctmKocvvSKEg4xsDl1UVY1hBu3oPHbLpd3YnKwxoGWtBs2en89LgHSzrK
   WXeFzDbK2idMms3O2WcAm0R73bAMpjvI/s6LPnQNxX+I35tbuyCqY6YvX
   sBSbOhzg64mrgdsj9t4bxtpdmIRqQCxZ3CFxqceVUXP7aI2CAf9Qop8AL
   vd2O3MU5hUQw0J+krYbpiYHRvYyXcg5in0sgB9zE1iNZPI1pVxMg45WTg
   g==;
X-CSE-ConnectionGUID: YPiWhFUoR2O1eM9556UUsA==
X-CSE-MsgGUID: BwFPmSaZS52KYGclUUefCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="71440262"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="71440262"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 08:19:40 -0800
X-CSE-ConnectionGUID: Zw9nVcoTTKmxOj6ahjUP3w==
X-CSE-MsgGUID: 1sAOVhG4SlCldEMNBitIug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="250862262"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Feb 2026 08:19:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrIMp-00000000wiy-3Rgy;
	Sat, 14 Feb 2026 16:19:35 +0000
Date: Sun, 15 Feb 2026 00:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 17/19] ld.lld: error:
 ./arch/loongarch/kernel/vmlinux.lds:19: symbol not found: PTE_SIZE
Message-ID: <202602150040.nZyumlPP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Kiryl,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   c8cade07a55a710c48535164d08894878eeee29f
commit: de93b4195b8a9ad80cd71e4e05bbe3e2a3c14ff8 [17/19] treewide: The rest of the owl
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260215/202602150040.nZyumlPP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602150040.nZyumlPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602150040.nZyumlPP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:19: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:61: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:61: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:61: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:73: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:73: symbol not found: PTE_SIZE
>> ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:19: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:61: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:61: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:61: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:73: symbol not found: PTE_SIZE
   ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:73: symbol not found: PTE_SIZE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
