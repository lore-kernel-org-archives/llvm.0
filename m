Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38592D3EC5;
	Wed,  9 Jul 2025 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752075891; cv=none; b=kwDbaIi0JPH08cqeXnmFPnryQgoSfKJ9bChu1Uc94iCzy6ui9C9FRiXETmQxmv/3djVpgn995jdBIQmavdDekYmb1ZQHsijn+RpM3cR5ASzIQF9KZdLq70CRr1XB0ttXi6HcHHRCX6yVy/WbSNzNt2jUxRoPb1rWCjYm7Hrv9SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752075891; c=relaxed/simple;
	bh=rux6I6mt8qp6WGjgN3Rq+Ng/tKC7wviYezat3HsAsTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M0FipVqQMIoVnTvzvQAhZs4aMp6ZEpcvqVBbyHSnnnzfj78GYx81AqCCdUEourRIft7fKPBiK0Ka7MTwurk/IwGnxaCjHfujLjZBCkqLT6XYtPpq2oOjOf2EiquHvkZoaVI1fVEU6zDbcM9Rd0v1w2/JEKupfyVD/Piun12BVJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixPPxw5d; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixPPxw5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752075890; x=1783611890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rux6I6mt8qp6WGjgN3Rq+Ng/tKC7wviYezat3HsAsTg=;
  b=ixPPxw5dpdFEeI0EgpwGQPT9/GCPu84SnM1xbHBLNi/Gsf1e+vdvFKOU
   rjXW9zofIH8BTVIRvRDbxV6w5P9ii8LnBpd6c0yk7sbYAbeI8Lwk8Dqt+
   aYZEYHuCjy4ePDjVj2Ul1XcUxvwyCbbRQavipgo2GXJZ1ObaoGLKWCNGc
   fMmfIun7ht8ByS62Gic0FkoQMcsfCAEg2Gd/oPwcNpG8cOPoT4pj3MyQB
   jTMwzZNEViy9ddTx1/N+0EK+5f0u49TFwqsSAEGTisURZGp7MUebYLAdS
   N7hwYQDZq+lZlKFdKPwnYWrw2J4dbi4FTgqLl6itEZGjP5aJcwaLPMN5f
   Q==;
X-CSE-ConnectionGUID: nGMhS4HjT5erkqMwdKFn9w==
X-CSE-MsgGUID: wtDIRfaPQdmB7ZlgRhVpFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54197253"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54197253"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 08:44:49 -0700
X-CSE-ConnectionGUID: bqE3YgPyQ66IhOYGM4z2kA==
X-CSE-MsgGUID: /z78WTq9TQCjEUOLw1BDlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="179495671"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jul 2025 08:44:44 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZWyQ-0003gn-1V;
	Wed, 09 Jul 2025 15:44:42 +0000
Date: Wed, 9 Jul 2025 23:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kan Liang <kan.liang@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <seanjc@google.com>,
	Xiong Zhang <xiong.y.zhang@linux.intel.com>,
	Mingwei Zhang <mizhang@google.com>
Subject: [sean-jc:x86/mediated_pmu 10/43] ld.lld: error: duplicate symbol:
 __pcpu_unique_guest_ctx_loaded
Message-ID: <202507092306.jH2NGdXo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mediated_pmu
head:   4bb4586beebc127605c6a26a212e0ebd23fb7e4c
commit: 38e7ef5e11c6180c1a9073fe18cd0163eb3fec6f [10/43] perf/x86: Switch LVTPC to/from mediated PMI vector on guest load/put context
config: i386-buildonly-randconfig-006-20250709 (https://download.01.org/0day-ci/archive/20250709/202507092306.jH2NGdXo-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507092306.jH2NGdXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507092306.jH2NGdXo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __pcpu_unique_guest_ctx_loaded
   >>> defined at core.c
   >>>            arch/x86/events/core.o:(__pcpu_unique_guest_ctx_loaded) in archive vmlinux.a
   >>> defined at core.c
   >>>            kernel/events/core.o:(.discard+0x2) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
