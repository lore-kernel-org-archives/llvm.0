Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03661537A7;
	Sun, 22 Jun 2025 06:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750574118; cv=none; b=n22bQppuKke0IqJfWSPzp5Yoy6qpAhnKsfBwme6GI0LKN9KKusNuY3Ch1Jbx9tasTO1iFwEeB2bYBX3FHsj+Vv6dNrf3GvjrOT5gjxNtiyt7CbAQGY48OC6R6qWOfbR7QzjkWSAQ2hN3Fxgk3l30K09xMWag9nzoweyP3lQNNDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750574118; c=relaxed/simple;
	bh=X+4NonwxQ7FSI4oPird4/yYjeLxkAh01ISjyqZ/lXF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c4+P0xjCFL02lPcNLQdxVnBYh3CjS/AIyE8Ja375sg4w4E1BxWLOIDCUwbQX+rhzTOrcEELB4NmUh1hBT/365RNKpG73N75whrKX8EzGap6VDZ8TQHVA9YLSP6DDk/mRwQz+gNzJYfoR7hJs8QLSuXTnJ8874dZuc0niNivXo9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkquhiWo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkquhiWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750574117; x=1782110117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X+4NonwxQ7FSI4oPird4/yYjeLxkAh01ISjyqZ/lXF8=;
  b=PkquhiWoEKm+1JkqrU3nQzPsd42r+iN0HE5YItDlzP0FZQdND5slnEK5
   iLH84vQ2G85+Jr6Rv3Xu3e2103Zvv9b5h9QSoopKU8rRBBrK5K5f//9Ig
   7FQq24vIuIEzls8vjqVEhFdcrlZ8CwTfmt/Smj/S1mhuLrdKCxi9e+c+Y
   HvqDQ9ONRpo1nlBFzcAbhGKi0NBNLRji7JkdgN7nVKGVBA3uoeLmQNOE4
   ifyPvLhqLyKPwB26phoOJXwImVVOTITLQZni4/P1RnUWsB4nmPi5ERYIs
   hpv7KEHBRCyRtqX7ww63v4kVm7fEtSTHV8tJpUhc097BUEyw/R4d8B1ny
   w==;
X-CSE-ConnectionGUID: Nyu83T1QT1GUP5KrVLT4Hw==
X-CSE-MsgGUID: cn5aAh4KQz62l5DesuSvhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52666132"
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="52666132"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 23:35:15 -0700
X-CSE-ConnectionGUID: a0phMcSET++o6bwKQU6xlg==
X-CSE-MsgGUID: M1Ht4aAzRxi041/0AlSdZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="155840607"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jun 2025 23:35:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTEIJ-000N6g-1k;
	Sun, 22 Jun 2025 06:35:11 +0000
Date: Sun, 22 Jun 2025 14:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvm_exports_for_kvm 3/3] ERROR: modpost: module
 ptp_vmclock uses symbol check_tsc_unstable from namespace
 module:kvm,kvm-amd,kvm-intel, but does not import it.
Message-ID: <202506221447.EJhKcLH9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/kvm_exports_for_kvm
head:   66216b2b147f76a917fa9ae28d99d81454d96a59
commit: 66216b2b147f76a917fa9ae28d99d81454d96a59 [3/3] x86: Restrict KVM-induced symbol exports to KVM modules where obvious/possible
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250622/202506221447.EJhKcLH9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221447.EJhKcLH9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506221447.EJhKcLH9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module ptp_vmclock uses symbol check_tsc_unstable from namespace module:kvm,kvm-amd,kvm-intel, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
