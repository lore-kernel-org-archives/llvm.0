Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4EFE545;
	Tue, 16 Apr 2024 02:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713234984; cv=none; b=hR4PcYfdI3s5rGqsck4OZqGMdzrRjmrvW4b3ZK0KQAr/IP78SkAl8h0jCfxOfq4yEXRIVR0HIS0mVsB68TOIJSe35/r5MDBaXIzl9uX1XLDYTRywxqFPRpXivbxawsQt7vEJoymZqi1trtf9iUF/dA9sUI9BPAJm1X6wOuM9b8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713234984; c=relaxed/simple;
	bh=oLwzwiqOhSbmW8VELmiWpLJAQiSqvlEmLp+iZ8Pqnmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VanG9mgCFoKG0jXASPAM20BGmcok8TIsOxUcKNWW7x8d8TPbdLlt5dgKpMR4KTVbBKIJ3irq3UsnYhNQBK6T9iPuAc82A+OWjngKqr3T6CD3JJLXfBvtTSup8Q6vcoO+AZtpt7D0B+Ic9hAGN4i2gdr85+hFSGnyFC+tQBnLcCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5PBI8YA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5PBI8YA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713234983; x=1744770983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oLwzwiqOhSbmW8VELmiWpLJAQiSqvlEmLp+iZ8Pqnmk=;
  b=b5PBI8YA43HAtGfMKLLVUZgZTiiLRoxsOpPDWhV0/bxmeuZG92jbHX3U
   /r2AAjS7Qm2V2pZ69IoZSx4pL85o/3ydNB6QuxhnSqaP/37QV2+lsr9lR
   IYL5axd8UtnflZSAvlpVgAQjMrA7UQPVFrU30/exINp+1MJ0iVLPyseoY
   1tGCszJoqzW5yM/hNWDcAMprKF2Q3ryT7dFjxzuw8MMEqmqVnZEuGQO5f
   8FT/7UR+C9vLV822pBoNt/V/UnPn2/cqWLkxXyqji/fmpdGyXX6udueo3
   bisHl3FkC/iDA43Kfo3xEYnLq5/p0NJO22rWJJ8Jai5kTXdkEoJhASUzQ
   A==;
X-CSE-ConnectionGUID: kpcsBTk/Sqi4ctDfrDDskw==
X-CSE-MsgGUID: rDkAjDfZS1KCcINvBpgNHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12497573"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="12497573"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 19:36:23 -0700
X-CSE-ConnectionGUID: So3f+BeCR2CMIDPTIu059A==
X-CSE-MsgGUID: lJXLzQ6jRFKNcTj5p3p5Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26776400"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Apr 2024 19:36:20 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwYgE-0004r6-0b;
	Tue, 16 Apr 2024 02:36:18 +0000
Date: Tue, 16 Apr 2024 10:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [pdx86-platform-drivers-x86:review-hans 40/59]
 drivers/platform/x86/amd/pmc/mp2_stb.c:94:2: error: call to undeclared
 function 'writeq'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202404161050.NSNJAxvX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   0aae4c44b032b5ede39405dfc62900adc467f362
commit: 2dc77993cb5eb311d6bb5584d30c3d1d42d9fa4a [40/59] platform/x86/amd/pmc: Add AMD MP2 STB functionality
config: i386-randconfig-011-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161050.NSNJAxvX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161050.NSNJAxvX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161050.NSNJAxvX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/amd/pmc/mp2_stb.c:94:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |         writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
         |         ^
   drivers/platform/x86/amd/pmc/mp2_stb.c:267:45: warning: shift count >= width of type [-Wshift-count-overflow]
     267 |         rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 1 error generated.


vim +/writeq +94 drivers/platform/x86/amd/pmc/mp2_stb.c

    84	
    85	static void amd_mp2_stb_send_cmd(struct amd_mp2_dev *mp2, u8 cmd_id, bool is_dma_used)
    86	{
    87		struct mp2_cmd_base cmd_base;
    88	
    89		cmd_base.ul = 0;
    90		cmd_base.field.cmd_id = cmd_id;
    91		cmd_base.field.intr_disable = 1;
    92		cmd_base.field.is_dma_used = is_dma_used;
    93	
  > 94		writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
    95		writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG0);
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
