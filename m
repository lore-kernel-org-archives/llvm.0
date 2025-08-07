Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA9126D4C0;
	Thu,  7 Aug 2025 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754586669; cv=none; b=hLqcKUdRpYa0BmYta5hMDczVXWgeUQ81smQvP3XC+f2v857sJzu0bsgSRKFx43l32bdRmE9BsRxgthDh8HbYFg1HXpQ09ufpbn537O3GxHMTliHSUeuBIdNetHTgOorobFVkhyD/gvvdRgacwnD4CRUF+7b8vPMh4uPXOeOLr18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754586669; c=relaxed/simple;
	bh=eBW2FoMJnSFvV92ogGvuKE2mEyEMxRm7r3soUu4+Ic0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m/L7LyrfSQgOXb1gMYreK50Vye5q8YB+wGv0t2WGhbb0pk/jQtsnl7eucOyBs+zE2GkD5NFgnApZZYRYSYKhGGckMdb1UqQ/C2d2/mKjxi9Px12OqVZzsQWmQM/IxDNpZVAIgRqUeHN/hYs2/HjDEPQa8LL9lNSs0rJQFtqFXjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aL4Vhvhl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aL4Vhvhl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754586668; x=1786122668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eBW2FoMJnSFvV92ogGvuKE2mEyEMxRm7r3soUu4+Ic0=;
  b=aL4VhvhlL8Jb6QQGZx05PgeTz+zI6c7HycVkOFs0cg23XRfmK5tdGP9q
   bD1UvciAvpwWzrwVtfrIR3HxhdeXn6b5YVU8SFv7NVwV7QUAUfzj6qapN
   Skr8BCNX3IlJoZlvqIw7a5KN0CnFjqejNrx8K+yPdWaLY4d+kTde+I9Ex
   xaBpeHJcQhiAfbcTdKLh72HFsmYo8Xuf5HwLoKdSUsusrsmtSaPf5PnHj
   o2TqaGzQ1c/Mspvx6FpZrbGmden9d6mp5KG7UBgb7c/mIH/UinoxSS+GE
   xHLPVxPTiIW82s8z8tKQnJv7wq5UlUtio/Z0CdoKFZb9XHiItZGlaloUs
   Q==;
X-CSE-ConnectionGUID: z82hbqLKTiCrFzsnqLPd0A==
X-CSE-MsgGUID: DNu3XuYaSJanTZym5fiJkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57072579"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="57072579"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 10:11:04 -0700
X-CSE-ConnectionGUID: biFS5CUsS+ir5tMlFVv1ow==
X-CSE-MsgGUID: A5j9EBfmT92xSBow7q4paw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="170485279"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Aug 2025 10:11:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk48b-00032G-2N;
	Thu, 07 Aug 2025 17:10:50 +0000
Date: Fri, 8 Aug 2025 01:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: prey169 <francisdrossi@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/932 260/261]
 fs/bcachefs/sb-counters_format.h:132:2: warning: label at end of compound
 statement is a C23 extension
Message-ID: <202508080158.0jt0xi0X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/932
head:   590c23c3974360a4fca96bbfeeb79bd860a5645b
commit: baec94c2772407d9791a3560e7fbf5f3042a1876 [260/261] Switch statment evaluate ids and confirm they are unique going forward
config: arm-randconfig-003-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080158.0jt0xi0X-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080158.0jt0xi0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080158.0jt0xi0X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bkey.c:3:
   In file included from fs/bcachefs/bcachefs.h:218:
   In file included from fs/bcachefs/bcachefs_format.h:524:
>> fs/bcachefs/sb-counters_format.h:132:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     132 |         }
         |         ^
   1 warning generated.
--
   In file included from fs/bcachefs/namei.c:3:
   In file included from fs/bcachefs/bcachefs.h:218:
   In file included from fs/bcachefs/bcachefs_format.h:524:
>> fs/bcachefs/sb-counters_format.h:132:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     132 |         }
         |         ^
   fs/bcachefs/namei.c:622:20: warning: unused function 'prt_str_reversed' [-Wunused-function]
     622 | static inline void prt_str_reversed(struct printbuf *out, const char *s)
         |                    ^~~~~~~~~~~~~~~~
   2 warnings generated.


vim +132 fs/bcachefs/sb-counters_format.h

   126	
   127	static inline void __maybe_unused check_bch_counter_ids_unique(void) {
   128		switch(0){
   129	#define x(t, n, ...) case (n):
   130	        BCH_PERSISTENT_COUNTERS()
   131	#undef x
 > 132		}
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
