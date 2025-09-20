Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AABD1D416E;
	Sat, 20 Sep 2025 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758363165; cv=none; b=MymITQW6IrU2/Xl0CYkO5D3uYFkhkRe0HN7f/gNYdjwr15wLGk6mMYnzNBhSXFP8VL+LZJ4W0TGoxEK20U/r0FN80lBfy9h0qruaR4UTKGpuG8YVNKAr98Z99M20ApQ7T1PJ4bHsBfJ1iEfpPiejzJBT5dhFXjENl2cX+pXXu8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758363165; c=relaxed/simple;
	bh=Slq1OqfREod0qUrep6lG9Ifqsr+62JezuU5BDmOdsn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA+NHIyJCCQWvMV2/7A3EzZx14q2PFV54Tg8Ab17qmfrtUTHKbwGwk3YrMNrXECa84v1JjjDKcjbv7xnWMLnwqdiuIoHbv7lLgfGPQCA0mUwbE5cTv9mZCdi+/a5+NEItEJiP1W3Tri+I4vOkBv5gfiA7FTw5YJWVv4O5c1tnmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3EtkvD7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3EtkvD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758363163; x=1789899163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Slq1OqfREod0qUrep6lG9Ifqsr+62JezuU5BDmOdsn8=;
  b=n3EtkvD7Wib8PxC56vKPBbKVelSFiArLsnMhHrRcE9xhVng2c/LeYsR1
   /ygqLEqvvpfvLEMD4G2HuhIK9+2LlfX7NmVeFJK5GI0B1hwbwgoukLn54
   t3NE5uaaaxZWJhK+XHJTru5QijJTqaqly9XR0F80MHn3EkllpfjurQf+N
   b6VRTzp/CgBAypx96AWfBlrBoaLly//P5cW7ucHPANYeed7BRsyHRTYHR
   nec8os0i6fX2nzQFxKeL5dHNasZM5ELZSHgSyC7E8QEASYjCindy4AWjP
   ZqXf+kVywYCT38M/qI9zobL+yJbw8LURIt3zkUdhZgdgj33ZsItPVITC3
   g==;
X-CSE-ConnectionGUID: Oc7v8gdYTuuvnkbJHBo2AQ==
X-CSE-MsgGUID: C1uWPVOtShafHsFqQEPmAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="78302671"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="78302671"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 03:12:42 -0700
X-CSE-ConnectionGUID: tpr3mw+QQiGpiwEbeOLiVw==
X-CSE-MsgGUID: ylcvbokjRJixLAq+XdFAdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="199760583"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Sep 2025 03:12:41 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzua7-0005Df-1J;
	Sat, 20 Sep 2025 10:12:39 +0000
Date: Sat, 20 Sep 2025 18:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] namei: fix revalidate vs. rename race
Message-ID: <202509201712.p8sGr76y-lkp@intel.com>
References: <20250919081843.522786-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919081843.522786-1-mszeredi@redhat.com>

Hi Miklos,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on viro-vfs/for-next linus/master v6.17-rc6 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miklos-Szeredi/namei-fix-revalidate-vs-rename-race/20250919-162113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250919081843.522786-1-mszeredi%40redhat.com
patch subject: [RFC PATCH] namei: fix revalidate vs. rename race
config: x86_64-buildonly-randconfig-003-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201712.p8sGr76y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201712.p8sGr76y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201712.p8sGr76y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/dcache.c:2403 function parameter 'seq' not described in '__d_lookup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
