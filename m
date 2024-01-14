Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D302522F;
	Sun, 14 Jan 2024 14:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gA2q/xEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705243186; x=1736779186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iepm82DoWVOXbB5m70i2gDzL41TwIPkrgwOhskcuP2g=;
  b=gA2q/xEZ+s3RALuBKmiSslz7N1I76U8t/EXM9oywkHXd4By6zZqqpW8/
   TBs7PPA+TFW0VHLCwvActZbIoKxWZDucYDfxOsKnX4gO90L4+3X9cPBet
   DdjyKlYzghi8yWB5dhNleb0ONtpjQlHcmDZQpVA5/PzTJfW+c6N33PmvD
   cyCznHe7AdmAIf4Vt5WALtEXLtArRHWrKrfWZsZmLixSbB5YS+2366b8q
   xhPL2ApHeSUOlCZ3ja+S9E3jZc4wF052cMb53q8y5Bio2TaVdTsLhtsyC
   fVrncz0HxwvnhqCsV0UwEbvkHdxb40d5VPcp+n+YWbw0DkOeuIRXREzsu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="18069422"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="18069422"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 06:39:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="902511860"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="902511860"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2024 06:39:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP1eA-000BZk-0x;
	Sun, 14 Jan 2024 14:39:34 +0000
Date: Sun, 14 Jan 2024 22:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: Geoff Levand <geoff@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [geoff-ps3:ps3-queue-v6.8 8/17]
 arch/powerpc/platforms/ps3/setup.c:194: warning: Function parameter or
 struct member 'address' not described in 'ps3_debug_setup_dabr'
Message-ID: <202401142219.Xqpyj7hH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git ps3-queue-v6.8
head:   be678bbacb19a32082d16b31bd5a8ba5f30d20ae
commit: 5162af76a52ec22d2272f93740eca08bb035c06f [8/17] ps3-debugging: Setup DABR register
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240114/202401142219.Xqpyj7hH-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401142219.Xqpyj7hH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401142219.Xqpyj7hH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/ps3/setup.c:194: warning: Function parameter or struct member 'address' not described in 'ps3_debug_setup_dabr'


vim +194 arch/powerpc/platforms/ps3/setup.c

   185	
   186	/**
   187	 * ps3_debug_setup_dabr - Setup the DABR for kernel use.
   188	 * @dabr_flags: DABR_DATA_WRITE, DABR_DATA_READ, DABR_TRANSLATION
   189	 * @dabrx: DABRX_BTI, DABRX_KERNEL, DABRX_USER
   190	 */
   191	
   192	int ps3_debug_setup_dabr(u64 address, unsigned int dabr_flags,
   193		unsigned int dabrx)
 > 194	{
   195		int result;
   196		u64 reg;
   197	
   198		BUG_ON(dabr_flags
   199			& ~(DABR_DATA_WRITE | DABR_DATA_READ | DABR_TRANSLATION));
   200	
   201		/* PS3 seems to need DABR_TRANSLATION set to work */
   202	
   203		reg = (address & -8L) | dabr_flags | DABR_TRANSLATION;
   204	
   205		printk("%s: address %016llxh, flags %xh = %016llxh\n", __func__,
   206			address, dabr_flags, reg);
   207	
   208		result = ps3_set_dabr(reg, dabrx);
   209	
   210		if (result)
   211			printk("%s: failed: %d %s\n", __func__, result,
   212				ps3_result(result));
   213	
   214		return result;
   215	}
   216	EXPORT_SYMBOL_GPL(ps3_debug_setup_dabr);
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
