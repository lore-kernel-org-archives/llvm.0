Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDDB28853A;
	Wed, 10 Sep 2025 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757507973; cv=none; b=KMyjRyDlqm/bkUck9j3p7VOW0jMNKYx6rrciHTU0hfmxgyGiceWas21sDsOEpRNMFhqDW/OgInrqb66T8VUrY1qwpr99NrhVQKGmnMPovipLGjZC0aUVRlvZ8BYFClf8gczgiONPnYs9QepRrqf5p+T3UERkyqGkmp/+XSaIaeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757507973; c=relaxed/simple;
	bh=hjPl/kivd8rKY7NW9S7vBLylc64b1IKZDxEQXLdzBQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUIR+/wG9OLCTdAt2iLEQOf3GFhmsNDN+rTQcNrdgJT+Bpnl8+p0n5qq+ya7tYirQGJcOUALJvtLBu+Q7ArHucSv5GQ2vjuGDUXvourM/OU0y/LjtuzVDNyOWsgg4OaG5vEVUrbhJoRWbpwclGCgFx3ATZIkcw2aQBWv4eLoSrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTmpz25i; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTmpz25i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757507973; x=1789043973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hjPl/kivd8rKY7NW9S7vBLylc64b1IKZDxEQXLdzBQg=;
  b=TTmpz25i4uCoCXrB696qCSLyyXKImSUALAEwdAMLV51YgxkxUgsP2Umo
   5ba2GOIIPty/yeNHB3Uh9ty/7BXtvLsKxn0W6SBM83IG6Yv0G6ND8K+vN
   XGcEJpFUPxfrFyVkP+wCZAwPHhYbe1g6si77/Qh5tSvW+iuwy/99yeBmn
   JPFqUXtp+tzZpCDl4S4k0kyi60lMcB+4ixN1rM1VP8tkWaAIfYlYO5fiO
   bRQ+YHqxIjyMtP2/rayK9IwHqifMQTnFYRAg+t8XKpwOM/a7K9ivb2yWi
   fi8DVkczK4+i0JDrRS88RC9wF+sCkBAnR5GGhfqPOQKBwgufPwR9HaDmF
   w==;
X-CSE-ConnectionGUID: EbEiE0PvRxCOlRXEbCJngw==
X-CSE-MsgGUID: EdNV5FYTTN28vcHWecJxxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77271537"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="77271537"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 05:39:16 -0700
X-CSE-ConnectionGUID: NnBKEI4DTfq1U5XR1tu2jA==
X-CSE-MsgGUID: T3Yj0Vm7QRKP9yoqgnhh7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="197052739"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2025 05:39:14 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwK6R-0005vl-29;
	Wed, 10 Sep 2025 12:39:11 +0000
Date: Wed, 10 Sep 2025 20:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>
Subject: [chanwoo-extcon:extcon-next 13/14] ERROR: modpost:
 "fwnode_typec_switch_get" [drivers/extcon/extcon-ptn5150.ko] undefined!
Message-ID: <202509102038.MUz1UwM6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-next
head:   e6f75eba4a860cc419ed632313523e25689fd144
commit: 0d6a9aca15c987b4774f7fdb34114ab0d483766a [13/14] extcon: ptn5150: Add Type-C orientation switch support
config: i386-buildonly-randconfig-006-20250909 (https://download.01.org/0day-ci/archive/20250910/202509102038.MUz1UwM6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509102038.MUz1UwM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509102038.MUz1UwM6-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fwnode_typec_switch_get" [drivers/extcon/extcon-ptn5150.ko] undefined!
>> ERROR: modpost: "typec_switch_set" [drivers/extcon/extcon-ptn5150.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
