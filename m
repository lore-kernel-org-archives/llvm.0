Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AE2149E07;
	Fri, 26 Apr 2024 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714147755; cv=none; b=osJhlwfkk9PXL46I7oNpNnKLT/no2/oz8oZZtVL0LjhUPI/uY2mlLW+rXD/eKGRRgY7Rs1g2pDnqKnCDT74/gAUKp7gijJDugnnigjkliJpC85mt+RTxs/iSbGOyHb0uqp6ZbeXtb4vDPNrvqIqZcURSEMMT7SGWmdC6UwpFKTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714147755; c=relaxed/simple;
	bh=iRAHtoHflwcOnUe6sMhMbeG7LceMsW1mwUCMgjDsfeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R+cuQ25GKci8Sx2pGc10YaFZoECOn74Rt6jcOgqxIQRKRWh4TMJrzVaL/+JCVT9Cfm9MetEJBNSLZF3AKUyFnt8vRU2mEgOV7StLUYkC0GXRtqpQS305gWYkobPu8hET5ce3G9qompckdhJYLs7Cv0JmFMcQbwjPnjVR/0wYo6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5uli2Iz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5uli2Iz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714147752; x=1745683752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iRAHtoHflwcOnUe6sMhMbeG7LceMsW1mwUCMgjDsfeM=;
  b=U5uli2IzHdHJMmssJBP0VkMofgk6dQNFgyWBzJcvNZOs2gPAx8uoRaEd
   aZO7qHFSwz8eoSdcNjf8eicYsxnw2dDho2Ls1GajBJKKYpp/z5jvFj8I2
   o6dcVhQZsiHK4koGSYujU/pk6IQpRUWv6LdTT6dGQGiDlOCN34ANC3jXG
   H7DL5JVcEp6eueT10IUnDyR6Cx3rW9tLRquYa5M1ICR2B3cpL8NP/P8mP
   tjLlpXFmqlz9alTGgU9TwGxEo0OpzB0ED5EVgPBAP+eX46dIZuAsin9Wr
   9TRaBFAWcuRrRwJ5q0PoS4ZU3taMInvsJit47MXlnUzaNQGWAdZIOVGPq
   Q==;
X-CSE-ConnectionGUID: F9NGZDOsQRCyLti+xWwHoA==
X-CSE-MsgGUID: 5Fh5l4CZQ2CaBr5vHJq3vQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="12823160"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="12823160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 09:08:57 -0700
X-CSE-ConnectionGUID: +jd/O8cMTnCf65I4ke6Pgg==
X-CSE-MsgGUID: v6YLQipRQIy1CYwT+OcYaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="26095526"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Apr 2024 09:08:56 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0O85-0003uG-1N;
	Fri, 26 Apr 2024 16:08:53 +0000
Date: Sat, 27 Apr 2024 00:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/kasan/report.c:143:20: error: unused function
 'kasan_kunit_test_suite_executing'
Message-ID: <202404270029.zLvI9vVQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c942a0cd3603e34dd2d7237e064d9318cb7f9654
commit: c8c7016f50c85688d71feea2dba1bd955d5f5358 kasan: fail non-kasan KUnit tests on KASAN reports
date:   1 year, 5 months ago
config: x86_64-sof-customedconfig-memory-debug-defconfig (https://download.01.org/0day-ci/archive/20240427/202404270029.zLvI9vVQ-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404270029.zLvI9vVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404270029.zLvI9vVQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kasan/report.c:143:20: error: unused function 'kasan_kunit_test_suite_executing' [-Werror,-Wunused-function]
     143 | static inline bool kasan_kunit_test_suite_executing(void) { return false; }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/kasan_kunit_test_suite_executing +143 mm/kasan/report.c

   142	
 > 143	static inline bool kasan_kunit_test_suite_executing(void) { return false; }
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
