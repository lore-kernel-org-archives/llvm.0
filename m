Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20D133EAFD;
	Thu, 11 Sep 2025 17:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757611695; cv=none; b=e6MPlFryVKzJhcruR+62VG/Dhl1GyGsip7yEP4oGNePQppkXGzgCC/BLGAaOp+0WQhufHJDNolNqD6OA0jM6ONxeej1NGxIMI+g8MBeRaQtXndSCQAl6yBVAgklDFPNji0r3nW/INx1V4aa2h2EsiE1WSuNp16gW/TER46E8yww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757611695; c=relaxed/simple;
	bh=qTIFt+4Vmj2bVteOMnRB2LAUPk3klM1A7WKqCid9mfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cttGnOQUwT+4e/N2WWUvgeb47GhmberzZEGyJc5Ki3pgXnraWAHpgcrnG3+etok6LX0Jxi41SycK0hFNAQ8s+zb3gjncAv5SudrF7d+yqSVPg6Ch3j8jbPSUkGN/rSbqqYQ7g1oCCtHni6M40YR3x4Id/1IDcXQaeD4fBR4Tq2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvgAcAuc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvgAcAuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757611694; x=1789147694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qTIFt+4Vmj2bVteOMnRB2LAUPk3klM1A7WKqCid9mfc=;
  b=GvgAcAuca3wIFL8IAHE2+LpGRArDwE+DHJn4iF3A1a8P2Agbr/MbVtwt
   dtqFW8/qhAo29aTBqYXXtffZx4aouV7APFrgILv/geaA9j/8LCLM8BRoF
   EfI70a36KMs8WY5D717yIbPgGVWpkpUZg4W0TFmSC46vjqKD8rlrLUMpQ
   G3AThF9aAfIA6dkyuq+QgPeeT0PZOsgE9qbQaS4QMOS7EAioDFsAzjEN1
   wFkOHutuyU8p4bblC/PyoKBAiVoyeNAkeYItXbSotAqvERH/vhjHszUhc
   HZz9qCVk7YT3sAuKtD+MkKp/vbzdXGxm1PLqI/TTMk5fFWDZmdiYGbXlw
   Q==;
X-CSE-ConnectionGUID: UuiqbMzKRdqD6xniuQTEHA==
X-CSE-MsgGUID: QSDz7gX3TEeBrw5FleOeyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59811029"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="59811029"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 10:28:13 -0700
X-CSE-ConnectionGUID: Rirftl3QSgWPfv+Hj7eaCQ==
X-CSE-MsgGUID: xkdWdPHURPSIN7wt7oX8Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="178957197"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 11 Sep 2025 10:28:12 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwl5T-0000Ww-1o;
	Thu, 11 Sep 2025 17:28:04 +0000
Date: Fri, 12 Sep 2025 01:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ulfh-pm:debug_pm 21/23] ld.lld: error: undefined symbol:
 __devm_auxiliary_device_create
Message-ID: <202509120158.y4YLm1Ms-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git debug_pm
head:   1a9f6a1fa2007aed31a46bd6c01fcc49d519588c
commit: 2ba6ba21fb5382bf3a7344a7218941b32e62c3b2 [21/23] pmdomain: Add driver for onecell PM domain providers
config: arm-randconfig-003-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120158.y4YLm1Ms-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509120158.y4YLm1Ms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509120158.y4YLm1Ms-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __devm_auxiliary_device_create
   >>> referenced by pm_domain_oc_test.c
   >>>               drivers/pmdomain/pm_domain_oc_test.o:(pm_domain_oc_test_add_aux_dev) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
