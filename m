Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F6B1F5EA;
	Sat, 28 Sep 2024 22:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727563325; cv=none; b=kzWm5dWO1h4Hyl2x9eeD7HJGsltppjXi9sKpyxv5qgODv/Ae3bmQV92l31oCGTLxfWOxiyCZta6N5tKd6dv7CpqhPzhLEAXNEBxej7PYYAF8fks5i18YY2iG+Al0F7d83dl2MIXpntKuZEbp9Ap3Or+v9XLThTCzOgDTVyBzIS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727563325; c=relaxed/simple;
	bh=oiX8NRg5BYtlUjho/OahMa4MAVitKLFKcKHUNYaIz2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cewo6aCDPAHmbvwOzaMheurmIBskpT50ln79dl8XACaRkouCnREN/YL1y2tUbu31pkqULpLZx5hA50XPgrELxdeJn3OXLkCxC8hp3bzqvQrGC2aeoiC4ef+WGC7swtR70JODMBxY3izg6wxAsYaQK72znVgqtiH7gs6MC68RjeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJWCCGmL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJWCCGmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727563323; x=1759099323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oiX8NRg5BYtlUjho/OahMa4MAVitKLFKcKHUNYaIz2w=;
  b=KJWCCGmL2PMhelHdb3Q92MXs8gKZf2f3LopNFDDxsq0fSdLTcu9wcX+I
   g401hSjrreRtMEMFm23EFr672dVl60w1gNv41Ts2eRcT0OvYJbsyM+iGJ
   LrLdciSr2WQzCzEUzEz5L1+pAycFWVT8AfCEpvdw2xaORCTvNwp+ZoaaR
   Q4C7h55bUpa4zDCLnZiPOWP/BIrXcXZThR/HFwDZLj4fTbKkH4xGnceuL
   vOyC458+YhkNvZu6ipy5HCOYoJXFD//fYLs5HfPxVG5jHoMd18TSxyHcK
   Aa2+yr+xSD5dZ/FukT0jLe5HkEwkLFB/t27qe9TEypFzxAQrE8wtQmYT4
   A==;
X-CSE-ConnectionGUID: smwtbgmYRtKWaqz6rz7WmA==
X-CSE-MsgGUID: qE5v9Z3TS5uoRsc3XOnsEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26149371"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26149371"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 15:42:02 -0700
X-CSE-ConnectionGUID: zifA+DfcT/GPnGTizeWSpw==
X-CSE-MsgGUID: kGPSL59nR1KYO31ka40nqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="96220809"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Sep 2024 15:42:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sug8V-000NjB-2J;
	Sat, 28 Sep 2024 22:41:59 +0000
Date: Sun, 29 Sep 2024 06:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:xen-pie 4/5] ld.lld: error: undefined symbol:
 xen_elfnote_hypercall_page_offset
Message-ID: <202409290625.RuWXkkZQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git xen-pie
head:   0750a3bcd116c2bd906929b07c6cec651f649f12
commit: 6beb8b36c2b250fc5cdf9b45ca2fa7356f43ad85 [4/5] x86/xen: Avoid relocatable quantities in Xen ELF notes
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240929/202409290625.RuWXkkZQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290625.RuWXkkZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290625.RuWXkkZQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xen_elfnote_hypercall_page_offset
   >>> referenced by arch/x86/kernel/head_64.o:(.note.Xen+0x54) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
