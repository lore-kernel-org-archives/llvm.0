Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8631D150C;
	Mon, 14 Oct 2024 22:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728946274; cv=none; b=K4a44jJ2ol64XgQAEc+uXJ41EDZ3rBKG8X7Mi2R/0htDFt9AfqcxrQlyJavYRx44lHo9IKrs084idaiHMtGx7C9hdU1Ld5gQYHVxbicdpQc6I1gUrKanBA1hNaP11mCzBpHgVTOOJmfNBO5zmcsrRe/pgckD6iOeq8JMGkGlnPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728946274; c=relaxed/simple;
	bh=I8iZwc13wwROx2qHWE8aH5AmC/hTBF6so8r1yE+XYzo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DIUoubwqxK7I8tVGfzJHUkapW8TgE7llFwUr1a4zPVn8a/G/O3tdrIkWjXpDFs1VtmX1x/MxprK3NIpujy0/3p1Vi3ftvfPJtm73ZUMgPoHmE+CsbJscMnHT8n4O43/qYyeKqYcFIPcZyLDHR2hpTSG5VetPNyB5nIDZ+jTUphA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAzdMmrN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAzdMmrN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728946273; x=1760482273;
  h=date:from:cc:subject:message-id:mime-version;
  bh=I8iZwc13wwROx2qHWE8aH5AmC/hTBF6so8r1yE+XYzo=;
  b=LAzdMmrNeCdWoKH137q5OsSuzEjO3O7nj0ePqCFMOlQ90Dg6LWbh7TLC
   n3BPzUOmIRWwxbRthJ/q0ax+wofYTV77vzU/f75w1f9v3fIZ9uL/y7q5l
   jGW2pXBn23htl91uvFll6+chcu34GS4zZBASvyd4DJFHjb/FG0EzHlXRe
   Qs4MSTRQq8JcK3WC8XM+0fI9QJk9ZEnxV6W46S9JLCnpc1KMNkHis/f4P
   noZ0MZxvfE6Kvzjo3nVG984JCgbKbnwQgwIZS6eTEKBV3/XUQ/0UspwxQ
   79dlqRZ3vnYQzGJ3m1p0xExhd6S9fr5h4eCcvMAh0oaS56jbeH6IvXFJH
   g==;
X-CSE-ConnectionGUID: iy7uOTBDRXCBNN3OkRoTAw==
X-CSE-MsgGUID: PdGOiMyYTjGmyEViT21d1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27803626"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="27803626"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 15:51:12 -0700
X-CSE-ConnectionGUID: x0DFjZB5Qtq1MAI+NOlDjw==
X-CSE-MsgGUID: KGVvjLV8RDenOyrs/JiiZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82489053"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Oct 2024 15:51:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Tu8-000HHj-2q;
	Mon, 14 Oct 2024 22:51:08 +0000
Date: Tue, 15 Oct 2024 06:50:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: clang: error: linker command failed with exit code 1 (use -v to see
 invocation)
Message-ID: <202410150637.wr8rQn2A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Peter Foley <pefoley2@pefoley.com>
CC: Richard Weinberger <richard@nod.at>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eca631b8fe808748d7585059c4307005ca5c5820
commit: 83e913f52aba69149261742aa9ea4ceea7bf182d um: Support LTO
date:   1 year, 8 months ago
config: um-randconfig-001-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150637.wr8rQn2A-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150637.wr8rQn2A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150637.wr8rQn2A-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: ../lib/LLVMgold.so: cannot open shared object file: No such file or directory
>> clang: error: linker command failed with exit code 1 (use -v to see invocation)
--
>> llvm-objcopy: error: 'arch/x86/um/vdso/vdso.so.dbg': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
