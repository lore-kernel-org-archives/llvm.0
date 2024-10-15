Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF9F21364;
	Tue, 15 Oct 2024 02:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728958764; cv=none; b=QXoaTpmlhU9KlFGJ9pS11tJaPEsaoSZilptjYjaV4bVflYxXlejdifEUCWc8RSbW9gjntdZ31WsHudbeULa479pC7GoJy6OjYCc+lsupZDbp/BsJwMZTUnFOh0lXIB0Ivy4KxMjWZq06czWvb9mpWrFWyqHNbdG2ID05dFKZ9Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728958764; c=relaxed/simple;
	bh=MLijm7P+agI/Y/4yGRV26PteXBvdyAeM5umiBG0GT5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lV9ie2r+ah3zEdavcXA8w1a1Yk7a2sO8qPyVlSY+t57NMdhmIEKaZEicH2g3GKbhjPrmedRGjuOGAMvDdcJqK5rgJFMIz5N6pIKYgiN5HN7PdeQcOhvOn8L6FgTPiA8bfJA5idejqZgvsuNHO2y7uvlOb9txOnYJAgZz9ihc/68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4DD+XD+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4DD+XD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728958762; x=1760494762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MLijm7P+agI/Y/4yGRV26PteXBvdyAeM5umiBG0GT5U=;
  b=O4DD+XD+7AtNKG1ZI4MGGwHVZvObIURgsWy8ObqlLnOk06T9ycuJt6F4
   nayQeN0sBSbWvwXG0xObW3HEMNFoCbOCIN/iZ70K7SIXODkC/+0E0I4E9
   atM+oV4CN9ppKQt7264rgW1BeozayymytBIpuGpYCxZxrDvegMPiPcMXy
   9Y/FCoVBkdEtsrBYiuxTkO+h8NbIiQHU5vUrebYXGNGENoqm6gCF9+EnP
   vlfCpvZa6kYZfugGfTmfhGhXnBMPbzSu0DEpxjUc1FcruoKf6bf+Zryw+
   8f0eDMxT5en4jSN7XYNqvkdEVrjieplbMn6tuDNc2lwbu5K/VMcChmkS3
   w==;
X-CSE-ConnectionGUID: jMuRAgA6T9mEv8uyKJ74uQ==
X-CSE-MsgGUID: a674dSW9TQeHJNnaychgXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28214639"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28214639"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 19:19:22 -0700
X-CSE-ConnectionGUID: c5pWGJ6LTwmItODdjNVOhw==
X-CSE-MsgGUID: 7edhttlTQmCs/L+Hh7bc8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77361914"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Oct 2024 19:19:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0X9a-000HU9-2C;
	Tue, 15 Oct 2024 02:19:18 +0000
Date: Tue, 15 Oct 2024 10:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [rt-devel:linux-6.1.y-rt-rebase 11/51]
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c:16:21: warning: unused variable
 'mutex_request_dram'
Message-ID: <202410151059.MeUuTMS2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.1.y-rt-rebase
head:   90d96fee668dc306dd748393383c0fc74b798eee
commit: 4f334c6ed61305826ccc33c2281cf2a43146e4fc [11/51] x86: Allow to enable RT
config: x86_64-buildonly-randconfig-001-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151059.MeUuTMS2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151059.MeUuTMS2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151059.MeUuTMS2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/mediatek/mt8186/mt8186-afe-clk.c:16:21: warning: unused variable 'mutex_request_dram' [-Wunused-variable]
      16 | static DEFINE_MUTEX(mutex_request_dram);
         |                     ^~~~~~~~~~~~~~~~~~
   include/linux/mutex.h:149:15: note: expanded from macro 'DEFINE_MUTEX'
     149 |         struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
         |                      ^~~~~~~~~
   1 warning generated.


vim +/mutex_request_dram +16 sound/soc/mediatek/mt8186/mt8186-afe-clk.c

55b423d5623ccd Jiaxin Yu 2022-05-23  15  
55b423d5623ccd Jiaxin Yu 2022-05-23 @16  static DEFINE_MUTEX(mutex_request_dram);
55b423d5623ccd Jiaxin Yu 2022-05-23  17  

:::::: The code at line 16 was first introduced by commit
:::::: 55b423d5623ccd6785429431c2cf5f3e073b73ba ASoC: mediatek: mt8186: support audio clock control in platform driver

:::::: TO: Jiaxin Yu <jiaxin.yu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
