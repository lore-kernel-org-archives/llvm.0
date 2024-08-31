Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44BE78676;
	Sat, 31 Aug 2024 18:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725127643; cv=none; b=vBQMTzHg7xmvKOOTIz72xfzDy6cAJkrcpM1V5kXRqCvIS21TEFg0+HA9WWQfY4lB0LZ46mT7H4aP3XzAbV9qTk5Bj5BYk6N3rsyeSl0+/VUSp/m1+eO2ZACREUdXY2dzjJVn5zY2c+D2n00W2MKV7wdhoMnJx5bwurh8+LdGcfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725127643; c=relaxed/simple;
	bh=aarbNujcQJQu8cWevGdPTbcJJFKQH7w9HGZjr2sx000=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t3Un1uzBOGvFqEoZ0Mgda1UBrqmfXjdsmNT6wqldT/GpzAG0h9c5a3neF6XtLGVy8VmZKEWTaS40z+3fpVatGc804nYInIoRyyh7CdbRfwKO0aKTiDh6P4yODUbCxNINNjsJo9iwJw1mmGPaeviSJbnaQOQVOoc999jMbD+O95Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=By/I4Ok8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="By/I4Ok8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725127639; x=1756663639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aarbNujcQJQu8cWevGdPTbcJJFKQH7w9HGZjr2sx000=;
  b=By/I4Ok8eeb6hMjUSA3h8bfH2ya5C2BRa/avA7K3MRmmQ9LsitsMO4qP
   sGYmtsAOcN3rPec81pDUriyBeLTqoJo2kX24SWWtUlss6hg3V3ZOVpZCd
   s8/jJjedoA+6EhgBIi+qCgc8wzZB+C2mzmH7y/MJKECZoBN+1z/j7JNRd
   goRSyRyZeI1wy7ztJ9DKpdn9mxC+lhOwLdXEiu23aoSgLlkIbn+AP659F
   Y4TLpyzDs7IeL4YY1dTMNqjkn1cIXPk0giwJNgIhbolkcHLH/skuBFTff
   mXtfPtrm45JS/9pz94rpXv2qx3VuWPOPttvFmwytcfpARUC50rUTMjHNP
   g==;
X-CSE-ConnectionGUID: ttYhPwyzQjKqUzVn2DimwQ==
X-CSE-MsgGUID: JJNm55YaRkquF0ixwwmisA==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="35122299"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="35122299"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 11:07:16 -0700
X-CSE-ConnectionGUID: ZuQhqq6BRrOc43Oghc6LQg==
X-CSE-MsgGUID: GlbcVdAlRk23nCyW8b0BgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64203827"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Aug 2024 11:07:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skSVE-0002zI-2B;
	Sat, 31 Aug 2024 18:07:12 +0000
Date: Sun, 1 Sep 2024 02:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>
Subject: arch/x86/kernel/reboot.c:939:20: error: unused function
 'nmi_shootdown_cpus_on_restart'
Message-ID: <202409010207.jrH6sNV4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1934261d897467a924e2afd1181a74c1cbfa2c1d
commit: 261cd5ed934e6923187cf1c9eaa6cb63f2b81212 x86/reboot: Expose VMCS crash hooks if and only if KVM_{INTEL,AMD} is enabled
date:   1 year, 1 month ago
config: x86_64-sof-customedconfig-amd-defconfig (https://download.01.org/0day-ci/archive/20240901/202409010207.jrH6sNV4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010207.jrH6sNV4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010207.jrH6sNV4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/reboot.c:939:20: error: unused function 'nmi_shootdown_cpus_on_restart' [-Werror,-Wunused-function]
     939 | static inline void nmi_shootdown_cpus_on_restart(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/nmi_shootdown_cpus_on_restart +939 arch/x86/kernel/reboot.c

26044aff37a5455 Sean Christopherson 2022-11-30  938  
26044aff37a5455 Sean Christopherson 2022-11-30 @939  static inline void nmi_shootdown_cpus_on_restart(void)
26044aff37a5455 Sean Christopherson 2022-11-30  940  {
26044aff37a5455 Sean Christopherson 2022-11-30  941  	if (!crash_ipi_issued)
26044aff37a5455 Sean Christopherson 2022-11-30  942  		nmi_shootdown_cpus(NULL);
2ddded213895e41 Eduardo Habkost     2008-11-12  943  }
58c5661f2144c08 Hidehiro Kawai      2015-12-14  944  

:::::: The code at line 939 was first introduced by commit
:::::: 26044aff37a5455b19a91785086914fd33053ef4 x86/crash: Disable virt in core NMI crash handler to avoid double shootdown

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
