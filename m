Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635A63B;
	Sun, 24 Mar 2024 01:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711242927; cv=none; b=UPGlPqouF0aK68VRHQLS4+9jR7ze65K4C24F9zTEj6Hpp14QsXLCmhsszOgMVze29fuQDqXCW1sftT4tal2YjCqvcHTFchG2hOyMHxvygtcfXsI37JYLuxe+A4h4DZFAzumJSTH2dyJQ2a9FbHrFARBVLh6KC+TP316GguTqb8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711242927; c=relaxed/simple;
	bh=gDq+/cDEbbDthOfEdZmzLzHm2GK8OE7LhlMpWQgzkWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZUbFFi/LTwvjW4FyLIHwyOz5Zu9/7pI1wx/c1I7UgaSu3G3Wc1xVMyXGY3BN81BdlnWDt8mQq2cxldawmYsXsq0FB6mJOeU+8kUuXmO7APP4Q2X2XRWKNR+iagGVv9amJzZPbi39dwWeYRjDzk8jTX/M3l+9wWMBvo1CCuPHWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1fehC97; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1fehC97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711242926; x=1742778926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gDq+/cDEbbDthOfEdZmzLzHm2GK8OE7LhlMpWQgzkWs=;
  b=P1fehC97py3XyX3bUPCLn9c+IRa//vguR8y4tK0TdSuwAxjVl2iUwrBP
   yw1us1mkbjjdxVq3pRK+ZPH4nUzDZ9XquST4n4h5CfF6IG0ONA1oa7ljp
   ufC1rX/7I6Ks3Ly2ffk1eekucdgjVG0T3tfok8S8jMRDm1/eIqANZFnuL
   YsAFnSjSu7dlVB6C1x8rDqcd+1oeRk/BUjr51dr3LuTVQtfoN2tuaTiFo
   zhemnPbr0r0qM8yaSD1T7+Ce9BFSzNRFMJ6bjcLmKMpdevVBRPUga6Z9v
   Vw5XJJZKZA27ATqwAptSoGUMjSsonOTKGAvOvEZBnvaOHnmotXUb73IUC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="16814404"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="16814404"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 18:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="19994641"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Mar 2024 18:15:22 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roCSF-000LaN-25;
	Sun, 24 Mar 2024 01:15:19 +0000
Date: Sun, 24 Mar 2024 09:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, zx2c4@kernel.org,
	Elena Reshetova <elena.reshetova@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [crng-random:master 2/2] arch/x86/coco/core.c:189:2: error: call to
 undeclared function 'memzero_explicit'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202403240934.Nf4UUK5L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git master
head:   6fba9af4a847c5ee67715bc6f7959e9ab6394275
commit: 6fba9af4a847c5ee67715bc6f7959e9ab6394275 [2/2] x86/coco: Require seeding RNG with RDRAND on CoCo systems
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240324/202403240934.Nf4UUK5L-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240934.Nf4UUK5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240934.Nf4UUK5L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/coco/core.c:189:2: error: call to undeclared function 'memzero_explicit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     189 |         memzero_explicit(rng_seed, sizeof(rng_seed));
         |         ^
   1 error generated.


vim +/memzero_explicit +189 arch/x86/coco/core.c

   154	
   155	__init void cc_random_init(void)
   156	{
   157		/*
   158		 * The seed is 32 bytes (in units of longs), which is 256 bits, which
   159		 * is the security level that the RNG is targeting.
   160		 */
   161		unsigned long rng_seed[32 / sizeof(long)];
   162		size_t i, longs;
   163	
   164		if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
   165			return;
   166	
   167		/*
   168		 * Since the CoCo threat model includes the host, the only reliable
   169		 * source of entropy that can be neither observed nor manipulated is
   170		 * RDRAND. Usually, RDRAND failure is considered tolerable, but since
   171		 * CoCo guests have no other unobservable source of entropy, it's
   172		 * important to at least ensure the RNG gets some initial random seeds.
   173		 */
   174		for (i = 0; i < ARRAY_SIZE(rng_seed); i += longs) {
   175			longs = arch_get_random_longs(&rng_seed[i], ARRAY_SIZE(rng_seed) - i);
   176	
   177			/*
   178			 * A zero return value means that the guest doesn't have RDRAND
   179			 * or the CPU is physically broken, and in both cases that
   180			 * means most crypto inside of the CoCo instance will be
   181			 * broken, defeating the purpose of CoCo in the first place. So
   182			 * just panic here because it's absolutely unsafe to continue
   183			 * executing.
   184			 */
   185			if (longs == 0)
   186				panic("RDRAND is defective.");
   187		}
   188		add_device_randomness(rng_seed, sizeof(rng_seed));
 > 189		memzero_explicit(rng_seed, sizeof(rng_seed));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
