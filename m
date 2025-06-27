Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C346298CAB;
	Fri, 27 Jun 2025 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021333; cv=none; b=iMRcd2xvAFBcfL8CimpXayr6mPbvbgv+VPrf6S2g/nmIAA3SwFQW3CTqqW/+gADOCt3OBdMJGNrMTsPISzYdYVlJGAyTIStkDtdwrIj3RX73+LwGwpgWfhgrKCQ2iPJux9Aa1SnOefPqlyxFlwxrsCVsiKmWDlkpIR2V/c4r8Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021333; c=relaxed/simple;
	bh=t5zc6fIQTCmGoE8p4c4MC9Y05swYQ+weDqBUHa/JISA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/eVkMD0zpNa7QIWE5W6uu5d1ext7jTwa/49pNOVXwLU5UMV5jRarbzX8fPtLXnK007IG401j6T7GQGvtNSnttaC0a4l1JpNlw9xZXcyak2T23UDy6wZmhwKucqvOQLkv5+8FgxD4RZ6pBZ56k2w8AciTIltxCbnjhC3KD/J/yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6voMRwB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6voMRwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751021332; x=1782557332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t5zc6fIQTCmGoE8p4c4MC9Y05swYQ+weDqBUHa/JISA=;
  b=U6voMRwB/2yVpwc5KRGhXM8kLvjA4Nay4c2F2i65mMat1HeasieeL3vm
   h+er9O0Iev+OGKJlu0acQRZ386E2inCbaR2BRzj3rqcU4gwipVnfewb+P
   mNjncEP5jMm+Y6pGzcw50nEdSNR8GEwoBwa9pyWaGvhDoDIm6bovyMns6
   qMYCOFs1lAuDDNRLpUKFuQu5ec53wILdlb4lmXlnrJlGji7ORZvzf3DOO
   P/HKa0pneKEAb6c1mwubtc1+NDec8svdx9x4U06ih4QMkNwutkggxKT9N
   P1mgxFbJGYq7PRHkjTr/zr834tU4S9a0pFoLZlmYsHZQq5zEihPXtIA5i
   w==;
X-CSE-ConnectionGUID: IQ0rl7nLSUS9EKV/xwOhhQ==
X-CSE-MsgGUID: 5hlB3+UYQyabaeX8J0Rd8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53274498"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53274498"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 03:48:51 -0700
X-CSE-ConnectionGUID: AW3mqA78TgWq4HU9M2HqiQ==
X-CSE-MsgGUID: rnkN1+BOSDapci4mJ7S4XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="156819302"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jun 2025 03:48:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV6dR-000W5i-25;
	Fri, 27 Jun 2025 10:48:45 +0000
Date: Fri, 27 Jun 2025 18:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Niranjan H Y <niranjan.hy@ti.com>, broonie@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	andriy.shevchenko@linux.intel.com, tiwai@suse.de,
	alsa-devel@alsa-project.org, baojun.xu@ti.com, shenghao-ding@ti.com,
	liam.r.girdwood@intel.com, lgirdwood@gmail.com, robh@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	navada@ti.com, v-hampiholi@ti.com, niranjan.hy@ti.com
Subject: Re: [PATCH v3 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Message-ID: <202506271807.cuEjxbbx-lkp@intel.com>
References: <20250626181334.1200-2-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626181334.1200-2-niranjan.hy@ti.com>

Hi Niranjan,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niranjan-H-Y/ASoc-tac5x1x-add-codec-driver-tac5x1x-family/20250627-021555
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250626181334.1200-2-niranjan.hy%40ti.com
patch subject: [PATCH v3 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
config: x86_64-kexec (attached as .config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271807.cuEjxbbx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271807.cuEjxbbx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: recursive dependency detected!
   symbol REGMAP_I2C is selected by SND_SOC_TAC5X1X_I2C
   symbol SND_SOC_TAC5X1X_I2C depends on REGMAP_I2C
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
