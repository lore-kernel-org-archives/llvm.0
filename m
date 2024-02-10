Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F803DBAE;
	Sat, 10 Feb 2024 12:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707567262; cv=none; b=U+hCY3LEYQV8OiuPFIl+yfxFzwp53VOk1Jc72VmWa+1CwVKoxudsKRfrF0H4Vt10VBl/w+kWQjy32mFmap4iUIZpbzSY3jCcdWW3PHwvq4weoRPE/G/LFfPc5/tSpDQ0n6H6vLM+d6QYLvHAwCdKN76YA4WdzN66/WU5/1eb6w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707567262; c=relaxed/simple;
	bh=N+mT2rq0SmwY4I44Z/BEvfh2CiGTN5fhq20HbwmOuXU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oWpDhiIa1nYWUBooQr/Oh3/NQFxfPv5cl60b08i9W7uaITg+UPFEoUzpMv92oULBLhx7knSiZkqaC4Q/ql/O7/3LLCPX0dP3gOg7Hc+3RlwZ71B/OJ8JFzIgBZbaCyKH2mT3u48tegeaZLYS6Xe2dT++d6SzZ/Z8EFz8+p/Wygc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQSMJNKk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQSMJNKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707567260; x=1739103260;
  h=date:from:cc:subject:message-id:mime-version;
  bh=N+mT2rq0SmwY4I44Z/BEvfh2CiGTN5fhq20HbwmOuXU=;
  b=kQSMJNKkkXpkVnBMWituYsbCmZpSrrqYSccQE23jAbggrHv/0/7wGaRb
   v+XrVDpGDLdW6coa1Byi+PuuIpuXULQQTlo7/qZJY4bPg6B+a5m8j0WNB
   4rf4KUi2O/3MO9F0kHYBNCzwMdqYoXp0XdGBtk2nSLdpgavOg5Xg46bSw
   hloFVjDDX/A/GzgnV+N4j9pFh93r6FJy2Auf0kZzOW10oQPt5MOTpe6XM
   /eccggGZOF0Kc31CJVkoMmp35gT6jiKnOSm+7no74szsdXigohnS3uclb
   9mQJQ0RGBK1sBL/PSrlSr0toikTsLqQAlbBVHXstkAaaoRVjTl1u7jofM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12645407"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="12645407"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 04:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2550627"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2024 04:14:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYmFM-0005dQ-1h;
	Sat, 10 Feb 2024 12:14:16 +0000
Date: Sat, 10 Feb 2024 20:14:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: ip_vs_protocol_init() falls through to
 next function __cfi_ip_vs_rr_init()
Message-ID: <202402102007.mWVYAfR0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a7bbe7519b6a5d189feeba1d417c8ce9f7e852b
commit: 55c84a5cf2c72a821719823ef2ebef01b119025b fortify: strcat: Move definition to use fortified strlcat()
date:   9 months ago
config: x86_64-randconfig-073-20240210 (https://download.01.org/0day-ci/archive/20240210/202402102007.mWVYAfR0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402102007.mWVYAfR0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402102007.mWVYAfR0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ip_vs_protocol_init() falls through to next function __cfi_ip_vs_rr_init()
   vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to !ENDBR: machine_kexec+0x3f

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
