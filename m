Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95221494DB;
	Thu,  5 Sep 2024 04:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725512390; cv=none; b=qgwffVigNQZMrG7lhl3mMGQVepBmAtBMfCPDVOF1l0HFEuxXznD15lYbLA1n/nfHNhkl5F+ExKsvFQup6Htg7mxMxQs0O1QphzEJZjyhrlHHaHupySzpUW5lzxLQQPY0/IPBqJ9243n9fAAqxx4ZZ4rWfBfZZkrVD2KjO1erX2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725512390; c=relaxed/simple;
	bh=1TIU6KXlJIKXhTUAYenTO0pDpE0hD80xDHscKWVPuP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F18lO44biPq6ktKwmkiupnXRfOQW+goFXMMixjOM0rE+dCtNSIeulZ2qdDS5hvPy3+3pcyHOQnkejWo4NUCJ+u4L9pXcIuU+jtyBdQlqmuzUovm8rsI+WeeQ2BLx5ATOnZ8kI+LKmfirpLs+ZRtX2AA3MeGV9tcj42R7RL6X3yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDRjUZ6M; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDRjUZ6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725512387; x=1757048387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1TIU6KXlJIKXhTUAYenTO0pDpE0hD80xDHscKWVPuP8=;
  b=eDRjUZ6MgmiDxIucPjw/PbJIljB/3JeZG4Jo8KFOA25dII6ZXJ8lBCNU
   S10uOE1V8sGlPKFNVY0iR1o84fZDw8s49sy3HQkCMP2w1Npw6D4Xtjrr1
   7th0h4J3HPmsQEnHa8uKW4cCTdCBg/7hufrbw0ETKcO106IkX6dAXWYi4
   QA6v/paG7G5DwMPN5MoG5hMI9SH8o4kg9fk9xN+e7/hQmRMqHHM++EKMs
   WPkt3bgqXBrDderzcz2tRTVA3t1W0flJOgQmqvBZz9NL4LpS1QH2mD0l6
   EqcETJM4rslDn4/xl7NWWnUvDSkeqTmL3NEdhWmbc9yKLbbPCQoqxH5wE
   g==;
X-CSE-ConnectionGUID: EJAI25y1QcShj2lVvu3mRQ==
X-CSE-MsgGUID: Ofxlc/2NRWCNq1ZWmKjs+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35592692"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="35592692"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 21:59:47 -0700
X-CSE-ConnectionGUID: mcFcKZmcTq+MK+M44M+o0w==
X-CSE-MsgGUID: WI6lrRhCTimDeWpKjCcUBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="66242332"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Sep 2024 21:59:46 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm4at-0008wh-1P;
	Thu, 05 Sep 2024 04:59:43 +0000
Date: Thu, 5 Sep 2024 12:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 153/159] ld.lld: error: call to
 __compiletime_assert_515 marked "dontcall-error": Need native word sized
 stores/loads for atomicity.
Message-ID: <202409051233.N3vFnaCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   85a3988ffabe0e85b34ad713694ef3949d0a5223
commit: 454c99c8755bbbfbf92edf151a1685bb6cf580a9 [153/159] percpu: per_cpu_sum()
config: riscv-randconfig-002-20240905 (https://download.01.org/0day-ci/archive/20240905/202409051233.N3vFnaCt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051233.N3vFnaCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051233.N3vFnaCt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
>> ld.lld: error: call to __compiletime_assert_515 marked "dontcall-error": Need native word sized stores/loads for atomicity.
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
