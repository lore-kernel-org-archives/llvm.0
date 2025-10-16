Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEA3219319;
	Thu, 16 Oct 2025 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760637328; cv=none; b=JYCOjMiMO4VuGLUyBSVjQxf9gc5a1jlBmp48vvp1UShTVvl5FzfrnG34rfivUMGwAeSNK2tj+6XzuvRMkNjEsCcEa0lp9qCgB4aZSBPIbdGIDPtHVG22U9cfCnm+zw1hGSNduuP2Fvki1cKW6VpflHA/unRgabm3G/OviFNl8tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760637328; c=relaxed/simple;
	bh=jjzz+iSEZjZgpsEuP9MHGHgOWLemjrow3lAUbJatC60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYRfsttrYd4BJOyeWRAvghVDry10eocLRt0B9aDirWr5+iQSIY5YAsoHoyo4FdLCDyOzZ1OsWzMwHLgPxiVKfyStaRBqCj95TLvbUyTfnWoqyxUoDAFBmbRD1hf0TgCaJYxuyWFBxVLlf+R3v/Bp8qvbtLaR++WwDbQ+mznCmr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXgGXmmr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXgGXmmr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760637327; x=1792173327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jjzz+iSEZjZgpsEuP9MHGHgOWLemjrow3lAUbJatC60=;
  b=TXgGXmmrVQ/j5LAKasZzzIYyFSY5o2tmD2hwFv1U2FVDRwhOlavOQcPx
   kUpWm7yWLepaakxxbIWU4AlcAkHmElLC1qr3iA3XEgvEBPYGVRABG86d4
   hiaeDXJCOybaSYcrTPNPF3tJi2/e/682LtUhk3oKjPr7t4tNb8mFDDI0h
   ecBDITp305wlxvmy/7RhyB1yBf/Vta9kY9cLzBbKNMYNwNBkgcNTCnQsS
   LyWWpVWKz+UZjwmU8+DgjjnDbYN31LWj1lleAW0qTcBI1SvbAM3lIydXb
   SPjO4NSp5AmxJ62O3coZjgyVlqdNSm1ulecbKxCD0AZFK5LDrcREl5yJi
   g==;
X-CSE-ConnectionGUID: sHPtGtBrTjGyJNHtrGu5pA==
X-CSE-MsgGUID: t+NVXAMuSp6qjhnhZYTp5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66706862"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66706862"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 10:55:26 -0700
X-CSE-ConnectionGUID: Kp9f+v1kSi2sH6EPNNtPvQ==
X-CSE-MsgGUID: i9Rh4mXGQveq/Njehnw0fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="186537825"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Oct 2025 10:55:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9SC9-000579-1D;
	Thu, 16 Oct 2025 17:55:21 +0000
Date: Fri, 17 Oct 2025 01:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: wenxiong@linux.ibm.com, njavali@marvell.com, brking@linux.ibm.com,
	linux-scsi@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	wenxiong@us.ibm.com, Wen Xiong <wenxiong@linux.ibm.com>,
	Kyle Mahlkuch <Kyle.Mahlkuch@ibm.com>
Subject: Re: [PATCH 2/2] scsi/qla2xxx: enable/disable IRQD_NO_BALANCING
 during reset
Message-ID: <202510170145.mtDh1ZVp-lkp@intel.com>
References: <20251015205311.122963-3-wenxiong@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015205311.122963-3-wenxiong@linux.ibm.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.18-rc1 next-20251016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wenxiong-linux-ibm-com/scsi-ipr-enable-disable-IRQD_NO_BALANCING-during-reset/20251016-045452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20251015205311.122963-3-wenxiong%40linux.ibm.com
patch subject: [PATCH 2/2] scsi/qla2xxx: enable/disable IRQD_NO_BALANCING during reset
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251017/202510170145.mtDh1ZVp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170145.mtDh1ZVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170145.mtDh1ZVp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/qla2xxx/qla_os.c:7786 function parameter 'pdev' not described in 'qla2xxx_set_affinity_nobalance'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
