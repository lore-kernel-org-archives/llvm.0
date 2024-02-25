Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6F91361;
	Sun, 25 Feb 2024 01:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708825938; cv=none; b=gtgQBCTZqPtzmIwefufgkNo+ubsVCa6iRKCTkfoaVUYif2T50jDm1RVQumfUunWgA1EgEQeks40HWAb0fXzfIqhSLhbG1TFKtuHmBSHsJpK6knnD/oAxnDD/nk/Fw+im/h0KBkik5YcqKjTQ2GXe7Kcq/HtCdR8ZGpKBbwa3kTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708825938; c=relaxed/simple;
	bh=W9OoTRR/EDt51rt7q59skyo0zDnypgdo2Q9SfgO5hH4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcQTsgqX+xgGYBL+TIkojy/JUNSz0Ey8Bpxx5JFcylaQSykBbONaU4Dk0GqGkaj6BoZ7TsQNtA+zgz4ahJo/4gaFztIYCKn+PzhPYkduDpSOoRndEP+jaMXtVUerSvBdOyCSwhuZHbo8k5Z9yTNBMoeRtCgEOrO5+x8IszmhMDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWQL80o/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWQL80o/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708825936; x=1740361936;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W9OoTRR/EDt51rt7q59skyo0zDnypgdo2Q9SfgO5hH4=;
  b=aWQL80o/lcKbXhDql5auk+vj3pgQJ2wd65w6Zvuk22W6iPcV5+tWjxic
   rxDqzS5YXnofHnWoqRMRqJiuBS2B5IWS47o/blFtPjSiEqEbowi6fsgbr
   C9Jy80111LZVAkGnD1QT+XHKAqX9ODprDoEo1cAOMa3FXf/flazfv+pOf
   aNb2lvpiC3AOfX6fJY6VHcyHDxDNBcvRxB/9n5YHdCSdAA2LtqMWJqy8Q
   boZ6/uzKuqXHWbXEllnHP7lTzCUmRZ7Z2n8xUoUzpdora0F/dFcOai9ce
   kjz3/dpV3ybGh0tFR8qpnIdqAoc0JDaw9mpXQKWoN+d4RYhUqla1p0dVh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="6950110"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="6950110"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 17:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="10849427"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2024 17:52:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re3ga-00098K-0k;
	Sun, 25 Feb 2024 01:52:12 +0000
Date: Sun, 25 Feb 2024 09:51:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: pwm_mediatek_apply() falls through to
 next function __cfi_pca9685_pwm_probe()
Message-ID: <202402250935.HYKMpyGi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

CC: linux-kernel@vger.kernel.org
TO: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab0a97cffa0bb3b529ca08b0caea772ddb3e0b5c
commit: 03c835f498b540087244a6757e87dfe7ef10999b i2c: Switch .probe() to not take an id parameter
date:   12 months ago
config: x86_64-buildonly-randconfig-003-20240225 (https://download.01.org/0day-ci/archive/20240225/202402250935.HYKMpyGi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402250935.HYKMpyGi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402250935.HYKMpyGi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: pwm_mediatek_apply() falls through to next function __cfi_pca9685_pwm_probe()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
