Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF001224FD;
	Thu,  8 May 2025 22:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746744477; cv=none; b=CPqpQlg3bkny35uP780Syp/7G4erxQSiR0r5w+a1oHGTEwHygxPCyopFt09AcoIwm0gKdrDGFnHIoAObkat7lV+EuBd+MTwVYP3f8o1WjFD2h1HlZtreVJxJDANXRHCAoBuukLn4eaHfpZobz0w/JW3U36i9ltgEesnT4RWtrWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746744477; c=relaxed/simple;
	bh=K9RKEqzFTtllR796q7SanQZnve1DXiKY0QZo4VMInBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fO1LRRO344higUk8tTElE5drtjWvTVRtInVGfpbgjOYbY9TIz2kKfSt/iLqdxvwid3vtqSN1+qJWa+BxQG/R9hvKnLPQRwQH+60V10+LUGv3geUnioajd+/TaZMB7fn6IfSgpLN9A7TThaqPfEurF1W8BBjsiznRHItGxYxQ1gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5eh6MRv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5eh6MRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746744476; x=1778280476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K9RKEqzFTtllR796q7SanQZnve1DXiKY0QZo4VMInBg=;
  b=C5eh6MRvxogiunpO6qq/rsp+g3WDDZTXtOYDHN/OPPp9uR/8Ghfz0m8h
   +gZwMxwexXFcD3hJYumuP4kDXgE3BmYjUN7zUTRuessQn1Zoaff1ld8uB
   aR6O3Atg4gh9+doXj8N6l58c6voYFQGbdWGnX/iEO/3Fa6ph+VncVp29V
   rSXMDjRyrkqKaXcZQfIHn1z1W6xRUSwX8QgEpBbuRk4bvLO03HnQqs9Ix
   kgu473dNCNcLBJ61ag8Tk+1kaNAI8XLtVa032rmEAokha3lRa1dCickHJ
   xQAWmHhc8ASNFHK+OIhErUjWNmXdDhAbBzbloB/0RyIdatbge/EEeCZE2
   w==;
X-CSE-ConnectionGUID: FWm5KfDHSresxywCvrO47g==
X-CSE-MsgGUID: KYIvLIehSbi6swWNfLvg1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52207025"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="52207025"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:47:56 -0700
X-CSE-ConnectionGUID: nZE5L5ggSOWMPSkOGJ8RKw==
X-CSE-MsgGUID: Kw2y1zmOSdqhDbd7FCUvXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="141345648"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 15:47:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDA1w-000BRJ-1i;
	Thu, 08 May 2025 22:47:52 +0000
Date: Fri, 9 May 2025 06:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6484/9729] error[E0432]: unresolved import
 `crate::clk`
Message-ID: <202505090616.2BrTjCYF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f48887a98b78880b7711aca311fbbbcaad6c4e3b
commit: 4eb3c0cfd2b267d208286ba435f90535fdb08b9f [6484/9729] rust: opp: Add initial abstractions for OPP framework
config: x86_64-buildonly-randconfig-003-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090616.2BrTjCYF-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090616.2BrTjCYF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090616.2BrTjCYF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 20.1.2
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
>> error[E0432]: unresolved import `crate::clk`
   --> rust/kernel/opp.rs:12:5
   |
   12 |     clk::Hertz,
   |     ^^^ could not find `clk` in the crate root

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
