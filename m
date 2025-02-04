Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD91211703;
	Tue,  4 Feb 2025 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738678093; cv=none; b=JLqQ66Eg9gkBrra2Yh/jPCCBgJsg2rsKEl+4iNFywHKB4Pj1iDxlXpJvU7c+M9F/AZv05uOYJ+71p9fTrjCa3XhhFOwWh0dogCpgy9z+rEF7zywKwiAw4QZhIMVg7DeOGeXLcLzSO5BnA5/lZyWhwt4RSv22sm660Isrilisfzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738678093; c=relaxed/simple;
	bh=VUi06TS7MWl3WrxSYaECEG9QZL6OepAlFSezS8CGqf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XYcg6+SRv2pV2Z3DK27kzBxor+B6zDzta0B2GJd1q22antnV9enYPTPexKylZf5n3izWzbiokf5PGGZ9vFcTA+/+YS0+qtnFwt++x4C0CSLusu3rDDtxUebL4Tj21fgZxOEflWVOY5uEWzCc91gmz0S3bJiKAOVxO7CWv3089n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpHqCJcK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpHqCJcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738678092; x=1770214092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VUi06TS7MWl3WrxSYaECEG9QZL6OepAlFSezS8CGqf0=;
  b=YpHqCJcKzWcKtM5qhSa4wtqIhNND7kWMhmqoMUaENxASyGNS4vTuJDN1
   5x4NR2BMeWjLmxFdsJdwS/5qdb5HZgADXKmMp3NzrHRRs19aDsSSFb8FI
   3a3IWx9UPEUx7yYu8uGNUAfYXiLIuoff9gSKkrY4hEC+BbmAZTA2wYeSb
   b/aHjhH/HfKkGFToUnEVwPeTu6JpZ/+JjIXAUO/UCd7K071RJdAVuIeAG
   hQ5q6xLK7ZLais7XjA0Xhd/QYz4gmU//JMqPmlKmzknbTc53aU+iMEJeG
   KM6zPDgIg8JhZuJWTPZ7KolPsABq4KlNKVmK0Bbz8r/NxjY31J39LWEod
   A==;
X-CSE-ConnectionGUID: Sycz9vCRSHiFj7Dgiqbbqw==
X-CSE-MsgGUID: O58IC4NKR5S1JK8Xl/eFMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39309103"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39309103"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 06:08:11 -0800
X-CSE-ConnectionGUID: Kru85VL9Rm+NFBhzllo3hA==
X-CSE-MsgGUID: LFBffYlnSvaFhhagkdBHkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="110386803"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Feb 2025 06:08:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfJax-000sYZ-0c;
	Tue, 04 Feb 2025 14:08:07 +0000
Date: Tue, 4 Feb 2025 22:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v4 12/13] error: arch/x86/include/uapi/asm/setup_data.h:
 leak CONFIG_KEXEC_HANDOVER to user-space
Message-ID: <202502042236.a8SqWoq8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4
head:   a75b813f58b0bc19b2c4b06bd62afc87f02dcb43
commit: dd730ee646a9855c98bf5e8ed8ccf1ee7c8fe122 [12/13] x86: Add KHO support
config: x86_64-buildonly-randconfig-001-20250204 (https://download.01.org/0day-ci/archive/20250204/202502042236.a8SqWoq8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502042236.a8SqWoq8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502042236.a8SqWoq8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: arch/x86/include/uapi/asm/setup_data.h: leak CONFIG_KEXEC_HANDOVER to user-space
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/asm/setup_data.h] Error 1 shuffle=1096944769
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1361: headers] Error 2 shuffle=1096944769
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1096944769
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1096944769
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
