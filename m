Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA27E583;
	Mon, 29 Apr 2024 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714401530; cv=none; b=eeVA2VtRFpJyBnaGUb37ZOn7n7eCPpMeGIrkXiu8r7u8+gFw56iICs7TllGIBqNHVCSage3TJ/M/Jr6GsludKT8fMYf/myu6AEnEdirKxrSt7bRWRI2o6fzhzyIDaiv+3PcUbjwSt1/OeRmGd9sgYgWSpqb1l7amSs9bVhGk9Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714401530; c=relaxed/simple;
	bh=Y+W0V61mGqmIq34pCXlGZXdnHGGS+wQxQbg5Z65y5ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P+jfHsRCiP1clnaXzgmJ2REbTMBwgqLVwR6gUY+PWc4uUSZOqowQR5WgWE5CRkuHgOT+oDSpPWr9ZhSVvOjk5TpBxNJRdP7h6JKxgvHU52vuZ9X3COQvHTRVFkAZu2zoY0XuYAtLFi+FPnUY9xLE29umFB+13IvBkhdnY/0aiKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTdUISNZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTdUISNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714401528; x=1745937528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y+W0V61mGqmIq34pCXlGZXdnHGGS+wQxQbg5Z65y5ik=;
  b=cTdUISNZxa8+aO11D9s7ZNhGPHp2sMAcEkSeRFu/AsUq3WynZzhP8KHp
   GKbR/PiqwjMKeB82mVH1p+CeFld4074vfmBtllPtCi9UDdTuy0iuC8Mcz
   Fufh51u/U3cyPGtXB6vhV8jbQOx5a9Y07nEAz069jJ4Yo5hmW4GCl2d+P
   2/kftfnTLlKi89yZ1CwvRaB5ZHNbLCBNxclGkKFScyMVESDS7H1Cm4x8v
   En/Y1l4J0oCSDUg6koWqW5Ei8bacvVlVqA35ZOj1cXJfq3AVWNZ8j3UpG
   bKW6jieczLFBEOCx3eaMAJxGUSHIusqcoMpW2cOpxu6I4gosgF3YWf06H
   Q==;
X-CSE-ConnectionGUID: aZruznS5RCe81o3H2iyC2g==
X-CSE-MsgGUID: P7ZK7fPmTtig5gIrkGQr3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="27514980"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="27514980"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:38:44 -0700
X-CSE-ConnectionGUID: FXZXUUVoRSWRwdlsg4RK2Q==
X-CSE-MsgGUID: Dy8aHkYlRcSNCSQkwybfHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="25999390"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2024 07:38:43 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1S9Q-0007F2-19;
	Mon, 29 Apr 2024 14:38:40 +0000
Date: Mon, 29 Apr 2024 22:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Morrisson <nmorrisson@phytec.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Wadim Egorov <w.egorov@phytec.de>
Subject: [linux-next:master 8684/9390] make[4]: *** No rule to make target
 'arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb', needed by
 'arch/arm64/boot/dts/ti/'.
Message-ID: <202404292222.KkVw8MVg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b0a2c79c6f3590b74742cbbc76687014d47972d8
commit: 9198fbfc14797a3a39c758ac6fb96a2169cbb70d [8684/9390] arm64: dts: ti: am64-phyboard-electra: Add overlay to enable a GPIO fan
config: arm64-randconfig-001-20240429 (https://download.01.org/0day-ci/archive/20240429/202404292222.KkVw8MVg-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404292222.KkVw8MVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404292222.KkVw8MVg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb', needed by 'arch/arm64/boot/dts/ti/'.
   make[4]: Target 'arch/arm64/boot/dts/ti/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
