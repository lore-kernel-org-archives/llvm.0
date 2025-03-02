Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876E81CAA7F;
	Sun,  2 Mar 2025 06:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740896730; cv=none; b=pnKruohvujNU3b73126PgLdbweOhK0PuCFrDZrP/Y7428ELF4DWB0LCScqDb3FwqNmcN9Szb8yf2Lx8/BSjPaOADL92bnPrMJEDnGDRCUUAujeNDGTe5f9W3eOfrs9ZpERM3vQ90GhCFpmxwscBZlJbQwWQBr6Jqeh5SNuW4fjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740896730; c=relaxed/simple;
	bh=mhhVzqwnYuRELiyOy2GFAyYuwUCmZwpABiv+2apeI7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n8PdIUFGKxTspe0A+26HyKG52SxrClIAEGsove5mMAFgEpsRwCK0fPpX6jIO5MKAN1OZYO6mKc9GvahGBTSBVQgAfNZNr7NUIF5oq+JCWu+GyLeY3p+wepRq70wxuhG+qLDiBBU+AEhjAQR+Uly+mttPWXDEC7+LJilG4pFVspg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8m+cgN/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8m+cgN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740896729; x=1772432729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mhhVzqwnYuRELiyOy2GFAyYuwUCmZwpABiv+2apeI7k=;
  b=X8m+cgN/iyPUQQR6+TXyPwjTGSrndWE36OFK22mgo/7PspoQ/j8A+v35
   G3FGbrANdVBJEQ3Ah/kUPbFZp2SAEIqKGs+xDkLRnX5Ey6xdNkI+enbJ7
   wroNZcPwXfz0bGiWdOQjbClGQ600cAOfLOhxrzwSuNwLFkdYuTwrgWYZN
   4NMWwJskZGftUdCrszdCX2Agm8Ur7YUXzU7DnG9DsKpkjXn/7Ao6BMhO/
   kNHmURXqB3zULur/bvoUNkuETfPSxDDfLRu0rMbry3VBNXOFFNzYREKKm
   iXkqZg6aZHaUEvqLwxfMWN+JzwZ4X1+FfFlG2u/XviGnETIb5PjKUvt8W
   w==;
X-CSE-ConnectionGUID: VoVHKEbwTGOSTpPBYcJn3A==
X-CSE-MsgGUID: 1VkmAvf6Sm6WnUu/vhSsXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="59330180"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="59330180"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 22:25:26 -0800
X-CSE-ConnectionGUID: F2Ipzb8iS3yqwzTn2OdeSw==
X-CSE-MsgGUID: b5LMBuvORbm/4blfCsz/rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="117489578"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Mar 2025 22:25:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toclN-000H7s-2I;
	Sun, 02 Mar 2025 06:25:21 +0000
Date: Sun, 2 Mar 2025 14:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kvm@vger.kernel.org, Farrah Chen <farrah.chen@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: [kvm:kvm-coco-queue 20/127] ERROR: modpost: "enable_tdx"
 [arch/x86/kvm/kvm-intel.ko] undefined!
Message-ID: <202503021436.STomlZOE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm-coco-queue
head:   9fe4541afcfad987d39790f0a40527af190bf0dd
commit: a58e01fec9ad144302cd8dfc0b6524315cdb2883 [20/127] KVM: TDX: Add placeholders for TDX VM/vCPU structures
config: x86_64-randconfig-077-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021436.STomlZOE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021436.STomlZOE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021436.STomlZOE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "enable_tdx" [arch/x86/kvm/kvm-intel.ko] undefined!
ERROR: modpost: "tdx_cleanup" [arch/x86/kvm/kvm-intel.ko] undefined!
ERROR: modpost: "tdx_bringup" [arch/x86/kvm/kvm-intel.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
