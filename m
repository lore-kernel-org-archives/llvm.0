Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858F31A9FB0;
	Sun, 21 Dec 2025 00:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766276753; cv=none; b=JmEegnzkZS6hZaAHbjzhzDnUd6+OcvZPPxXW8dUbpz2DzwAHoWseZsMhhNOZ4iW2IeD8jZc6m0dfCsYR1dlgbgpqE45UzY0lp6nhPmxVUGwEdMNJhJDoZW87dW0Ks9s2ggTBAJor/CqxRNZv3ugz8v44Z4pPF0uo4Y6hc6vP4+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766276753; c=relaxed/simple;
	bh=sT+uWjBV1AXrfDter/6EUkkwOVvmA+f+485uIIQIuEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R6aDHLbg42+FrbT0gSUkkckg5rF8PI+sPXzJZJZk66rBJD1sa8kOQZiWPfxGquMHN3i0X4Nn7lERw2yPg7O5kGgOnssT6E49oXQwS1HrBGO+D/1o+JXZ/EZRLxmqsEgIji9e1TtJXgLipk0G9gsprvUtsWJKLK1iXUGcPMoU9Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gh5ivkIb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gh5ivkIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766276751; x=1797812751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sT+uWjBV1AXrfDter/6EUkkwOVvmA+f+485uIIQIuEM=;
  b=Gh5ivkIb/76r1s6wGfTyDyAcHShEvfpaevIO1kQXILemF75OpfE7wIOH
   /zh2D+V6qVOEUtuiYb3xK/l3jBowty+XEu/rrH+0kowTSMu3Ys+C3iDOJ
   j7bVTMk3SOX/hf+sish4cbMIhXUammPr4w/DJNxrQOEmECafj3szmmZYP
   cIqYFLkOtQ2tPTIDXkXqN/k539n5j4Pg4lHUE5quF0uCjUlqr2tLkr3Je
   Nf4dYAvXZzey+IiQyTaQ/yMbGZT3RvQMyvv0vZeP1CW4P2jv5r/rwb0qp
   cJKGyVMLKz3IWhuv7MvqVoQEc0pKwt99TXk4r1cCGcTWTO/ljdvi/sK2R
   w==;
X-CSE-ConnectionGUID: n/gVI8PwQI+qxg4Qd7Ah+w==
X-CSE-MsgGUID: kqzEl21IQh+vXi9eehGcxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79643816"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79643816"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 16:25:51 -0800
X-CSE-ConnectionGUID: c0d+Uhu/RAiyOsK4zsWAUA==
X-CSE-MsgGUID: koNYKXUyQLSCygSTPUPXAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199713052"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2025 16:25:49 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX7Gd-000000005DV-2o4a;
	Sun, 21 Dec 2025 00:25:47 +0000
Date: Sun, 21 Dec 2025 08:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 5/15] ERROR: modpost: "native_irq_return_iret"
 [drivers/misc/sgi-gru/gru.ko] undefined!
Message-ID: <202512210826.NsDOdr0m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   5ed57ce1a7de9e649ede6b45207ee2f3bdf4cd2f
commit: c5725ac2b07bbee3b9ab9c959018b145825b6a23 [5/15] x86/sync_core: Use RIP-relative addressing
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251221/202512210826.NsDOdr0m-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210826.NsDOdr0m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210826.NsDOdr0m-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "native_irq_return_iret" [drivers/misc/sgi-gru/gru.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
