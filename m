Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DEF522F;
	Sat, 14 Dec 2024 16:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734192536; cv=none; b=VBZDlC1OJA82dgem5aHXm+dVKR+OLkOzVrxWTL628cFYQpmJu3Twg/90WigBZIojThht2Ve1npf2gzJr0igq60XhcBsL6IkFZnYgzUPKm8ZWftO/a7EFPUhT2I68OcNp964JaNSX83YxCBgaO1GCDnd31OjPVxR2co7E930xqEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734192536; c=relaxed/simple;
	bh=mnQd6ByU2+8JCHjAjITNKcWCZkJwRLdPt4joM1QSIzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZPgknNaS0rZ6q71BSVIuEJKaOgNnk1ktcrUGaukRqde2bNPCxgK7Mvg47pCMVlC1GQaJoLrelwcoyMVwbwYhGIcNp6N03ffKlSbaZYXlb/3JHCHDEC8QtlhraIfSikclug9ZMcwPimHYto8bnPU8CDNClPvXfaQHeuFL/Xb08HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNDbaZIb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNDbaZIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734192534; x=1765728534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mnQd6ByU2+8JCHjAjITNKcWCZkJwRLdPt4joM1QSIzo=;
  b=fNDbaZIbNJKkk/gCTqGpG4ISyyvtXg4OCbHv5E6bwr1tC0QLFE9bBQRu
   uZUI6WTUZiMVto/JF6UUiNPVuynPGKxYOqY1qfR+R+BfTbLWtDG3JR+Os
   LXqfurYTTdYUezS6SaQcl/aeXr2f+T7nsrOBWj0EuaPbO+WMfVSIiDE4m
   BglExiWD+IA/0NO6YdEwoU8GEaioAG5u9xobDqCViTeVNBpiLjRlUUDvH
   PWvSAOqjq7azYnKDB6WVwycyaPTsEi7uetKY/dYr5nV+iT5SpX9Cf49bM
   RHmsgZ2EKm5trMoMXaHMJaZsq3WpHFfAT8zZS/DYz1yYC7OL9qcCRNBQH
   g==;
X-CSE-ConnectionGUID: Z+loCy73SL2shDC7lDhpjg==
X-CSE-MsgGUID: ZbyJTJojTwS9+NoXJ4myrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34536889"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34536889"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 08:08:53 -0800
X-CSE-ConnectionGUID: patRlHjqQKStWLbcVa0mUg==
X-CSE-MsgGUID: lCKSE+12SI+V4l/2cdyl3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96659621"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Dec 2024 08:08:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMUhF-000D2B-2n;
	Sat, 14 Dec 2024 16:08:49 +0000
Date: Sun, 15 Dec 2024 00:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-misc:asoc-6.14 4/25] WARNING: modpost: module snd-compress
 uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
Message-ID: <202412150026.EMUdbO09-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-6.14
head:   5ce3beed07b8145aff61f2cb41f1868f6221271f
commit: 24a01710f6271ec32b629d714e6a64a69665128b [4/25] ASoC: fsl_asrc_m2m: Add memory to memory function
config: i386-buildonly-randconfig-004-20241214 (https://download.01.org/0day-ci/archive/20241215/202412150026.EMUdbO09-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150026.EMUdbO09-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150026.EMUdbO09-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module snd-compress uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module snd-compress uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
