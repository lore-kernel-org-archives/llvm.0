Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0016B1392;
	Sat,  5 Apr 2025 00:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743814226; cv=none; b=uZ9a1hnu1bMZmwWwawpWWw0+u4ga4jFLy01TBzqCTWzV6BwomM/lKAwHhJTvWWmi+oQNPrF43eV6YNCynHPGeScusLckuSer7KO0v7dH5AVNOWXblFUGfWP1wlnov0Szitf6Wyb+WMbHmIDXj7rgIZvTfLuhlG84WwIFZdC9RJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743814226; c=relaxed/simple;
	bh=vOfN5XJttGW94CR5WtlykB41mEqgNLji6/BjugXrIks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=khTGt7Owe4ZsoU23ted5WZG2QCC/AlXzTFO509OsEO4o6Y3opX3FiqMgOjo4LOrOtdqIKzRhl9S9NqNMpihEs14d5UOkA/nvrGsVYHiu4UodzmEdnNR3UWSmxiB6vMRqhulQTgucOngkmpD6Hfs5JbrDs4kZdNzkhv7D1VJhwMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXLlT1Vm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXLlT1Vm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743814224; x=1775350224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vOfN5XJttGW94CR5WtlykB41mEqgNLji6/BjugXrIks=;
  b=EXLlT1VmekuWGQblDJa/VWynNRpfKfkPWJ0uAo0ThqmHFBDCe4kZQi/u
   WYDGG+u/lbbPwB7DRRb5wJfMupL+iEYimM6apKQcstLk8UU0MlLiq65tT
   9m6qm1F8tnoFYTZ26iyZDKOd8LFzHUpdncDR57R3Q5OHdUP4o26TK9Gr7
   NSzcPc2vl1ZkPOFzPmpENJ9YkmzR1FU/wrYsceWpsgIPHyeOEF5ckiOgY
   OxN0BU455SMNnv2R9zOeBpGcwv/jOrhH77N8jBOzTIHyP5CgTb2XTaaqD
   8JROh/d3ejVLIoL6oRUvYBkp62OAWSHj+T9z7NjF/T+scAbhaK6c5Y2tz
   A==;
X-CSE-ConnectionGUID: UNPp4Q+CSQ2ZWSTzHfMxCQ==
X-CSE-MsgGUID: JBbHIHgxTA6onb1x2VHvhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="44988070"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="44988070"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 17:50:23 -0700
X-CSE-ConnectionGUID: 6o9MRrErTaC6r2bzaQHtAA==
X-CSE-MsgGUID: F+PixOhkTY2DIk0agcXJOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="132659010"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Apr 2025 17:50:23 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0rjo-0001hx-1L;
	Sat, 05 Apr 2025 00:50:20 +0000
Date: Sat, 5 Apr 2025 08:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 2/3] drivers/xen/privcmd.o: warning:
 objtool: privcmd_ioctl+0x245: unreachable instruction
Message-ID: <202504050809.Vwphay5s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   449363264d269ad1a7708447c2ed718e7170143c
commit: 81f7881931314b305515aecb95c4b50bda105f02 [2/3] objtool: Remove CLAC/STAC annotations
config: x86_64-buildonly-randconfig-003-20250405 (https://download.01.org/0day-ci/archive/20250405/202504050809.Vwphay5s-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050809.Vwphay5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050809.Vwphay5s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/xen/privcmd.o: warning: objtool: privcmd_ioctl+0x245: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
