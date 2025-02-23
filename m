Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F24D1FC3;
	Sun, 23 Feb 2025 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740306488; cv=none; b=Yn7gi11uP1elnLMSC3q4ajSpqtRpCUvPoIfivt13cDhnxO4/7jvnB5f+5gaSOr804FVD1t/fyawEmpr3IGwLiQOLEBGYIxi5OGf29up8c8gXuEpA1dCmUWuqlSTN6EzPZ4B29U0ZZ154knV+q4mbNaP7nRaQB6TXEGatKc408Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740306488; c=relaxed/simple;
	bh=Ken/L3rWMKKj/scAQLpd48IW+i/Mq/pZqP0HMB6eq7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QWSCkxic9+5DfZXm/p+/kBPJbVOXT3NhPUw/9JdQaPtX5vfNn0PlCTBuG54CvFpBHKVvIXzPjSpv3BEFMSQRrRerJNHCSmnhJkDxVoh0GQ1DPQN9XUVEWxMO9yDcPubN8yQQ1vD6a2SluJLETBMgRAibCDXYibCdBprSXUOccgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNO6A90R; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNO6A90R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740306486; x=1771842486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ken/L3rWMKKj/scAQLpd48IW+i/Mq/pZqP0HMB6eq7c=;
  b=kNO6A90RGNgM+1o9PD5z0RPTB/C1eHVfvncNmEuSKbCNc/DEh+HjyLKS
   HL9cGFRxjGHRUOhZnZh1Zchb/xV1lLt2GroTjqy9+PoxrmNLmjD2/lnUf
   r2DrQagpt1bfs2RzGtAqYCEPUzXZEkaH4UOeQl6XM88OQ0yNfONpxCXmE
   oLV5RW/uvooCfx00b22LXuo20Ij6YAtWrjx4OCHLpW3DpWaE/HkqEqTrl
   rX4OfhRxWyZJqDi+HN1PpPge1P6plKz4LkFpjx9hmlr/W/ds+gJd3X46+
   jJDoYERxu5TkaAd6GtCSbcyv7ejsXK865wd1NEhNzCSVc8l+5ZgglP3qF
   g==;
X-CSE-ConnectionGUID: U12C4irsSBKHZbUkG63ZBg==
X-CSE-MsgGUID: n3Mja9q4SEOy/RByZ84g9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="51287369"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="51287369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 02:28:05 -0800
X-CSE-ConnectionGUID: +mQfIymCR3+9wK1tHlEfIQ==
X-CSE-MsgGUID: zkN3fNZvSrWYFeCcWZ2gmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116710355"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Feb 2025 02:28:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm9DO-0007Gf-0b;
	Sun, 23 Feb 2025 10:28:02 +0000
Date: Sun, 23 Feb 2025 18:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Mak <makb@juniper.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kees Cook <kees@kernel.org>
Subject: [kees:for-next/execve 1/2] ld.lld: error: undefined symbol:
 get_dump_page
Message-ID: <202502231818.fP8cuxmf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
head:   9a3e62e7aff182403c9cf21e7dc523a42ed66ea1
commit: ff41385709f01519a97379ce7671ee4e91e301e1 [1/2] coredump: Only sort VMAs when truncating or core_sort_vma sysctl is set
config: hexagon-randconfig-002-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231818.fP8cuxmf-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231818.fP8cuxmf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231818.fP8cuxmf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: get_dump_page
   >>> referenced by coredump.c
   >>>               fs/coredump.o:(dump_vma_snapshot) in archive vmlinux.a
   >>> referenced by coredump.c
   >>>               fs/coredump.o:(dump_vma_snapshot) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
