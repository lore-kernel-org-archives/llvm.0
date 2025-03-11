Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD1F252913;
	Tue, 11 Mar 2025 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741693361; cv=none; b=ZxJF6ktXahJdOv8eQxL6UNwpk8kXQBe49HL3M5yb/RZHXYr+YbvHcaislTX5Y/x/gNMeS83Wb49i8K81NY1FAoIg0SmeNJF47veOODK2PM1fItUjwpN8pXrmNnHUsfO9QnWIJfNSOgS28NE5qBbLU/SYx4IzMpBrFASf8D8J1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741693361; c=relaxed/simple;
	bh=l8FaLZ6JDtAkpyj8wNZTLUM0afVmWndjiwbIHZW7Ybw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EhNArabeLppAPYfTRXGodFP2obMDfFATzNtBFhQpWv49dB6Z0YPYKcUZDZVi7l2E5vNOBr/Fz/YPlqJt3CkXhHNJgRpgO8PCTpUu9q0hZvK6RgnWlrVIh94sKRt6gPtPnoOoavePr6Ee5v+InisQ7p8dkLxAdv+nniO9b6p9224=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PStKkaMD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PStKkaMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741693360; x=1773229360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l8FaLZ6JDtAkpyj8wNZTLUM0afVmWndjiwbIHZW7Ybw=;
  b=PStKkaMD9CDEIyPUu4y3hxUThLHgjzt6wJCwkiWlOlvZfAfXMuExdnYb
   9q9JKGE68ZVIFGpvenB5ZyvoiWsL56f2JEMZeYjg9I2T0khV69GrMSJAk
   vXA4XE3H5ZUPb/LCeLllyXcN8a5cS9StluQDaX8hGB+I/4c1dMR+rjiY8
   Myp8nhaaXprz5rTyPV8At7buV+Wc5+VH09rOUqq9ctaF/SZcn6jUkDwrj
   lUpNVBy/YTPDMwPUv1l2luppOMksHIzfTng2rIspKLPBhDzzqelmvqcv7
   fq3Sd2XR2Cv/7FODYacsQa4qGl9LWrsIeNykIptSQvESSdKTieiRJE6Xu
   A==;
X-CSE-ConnectionGUID: ivr7xGhmTrK8ihoe5rSm2A==
X-CSE-MsgGUID: trSvw8vVS9K7rTsllRmALg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="30299837"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="30299837"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 04:42:39 -0700
X-CSE-ConnectionGUID: cbrJEp84Q+adViJElAy6Jg==
X-CSE-MsgGUID: hfp0FvV2TeqjFVT4NOvTrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="157506381"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Mar 2025 04:42:38 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1try0J-0006cv-1F;
	Tue, 11 Mar 2025 11:42:35 +0000
Date: Tue, 11 Mar 2025 19:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Eugene Lepshy <fekz115@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [linux-next:master 5887/9634] ERROR: modpost:
 "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-visionox-rm692e5.ko]
 undefined!
Message-ID: <202503111928.qahtMzId-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: 7cb3274341bfa5977f3c90503b632986a82705fa [5887/9634] drm/panel: Add Visionox RM692E5 panel driver
config: i386-randconfig-017-20250311 (https://download.01.org/0day-ci/archive/20250311/202503111928.qahtMzId-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503111928.qahtMzId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503111928.qahtMzId-lkp@intel.com/

Note: the linux-next/master HEAD 0a2f889128969dab41861b6e40111aa03dc57014 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-visionox-rm692e5.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
