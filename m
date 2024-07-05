Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08621C6A0;
	Fri,  5 Jul 2024 06:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720159809; cv=none; b=AtlQ3kDYHYCEu5sRquoB/aJucSZV2LlzSfAeri8SydDrkLRJncvxBFQF9G7osEqVot85DfypSpaZRuRtHjGmOL3Yu7A+XPKgDby3D76l45qnEq3lxC38ihu95LiPspK6ymjUyOIJjouXgGwnZ3o3HzNoy1/io85C7SIhH7IU3cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720159809; c=relaxed/simple;
	bh=vTcx2+1lCMBfWrPZ13b428fkp2SjuNVrG8fTeuvkDww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CAGxj5Zyf7sibJkUc8AOVj7p61dPB+G4MjzG9btGQVkk/Nzaa+vhRrCLpfZh3P30G8/n/qnaRlRAecDU/lMteYCSwVvRATZd7xfTPqRYi9xhQWqThv+sQuaKzV52fT/4fwCGKGpDMm6Rru7JZ9r6E3+6us9MG1PfNb0tQqxAFnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsRCFO0A; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsRCFO0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720159808; x=1751695808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vTcx2+1lCMBfWrPZ13b428fkp2SjuNVrG8fTeuvkDww=;
  b=YsRCFO0A1ra+xClkAgeAF4vUgVoUm3LuOYu1JSiLsCjSxywG0IMuWbjo
   LTLYD5sLMNo4mJU1HbRIWORK3X1lziugEaMthMKZaJER80qUMXroeec84
   GZwaIsLR07xAoS+mR0mXTCOgmlcPiadZSGm+Bs7CRKRxsxPFWpmVx5u34
   6muxvLkV9btAZDzsOkIitLa8FEgYWx1dMSOHQXuowAsC9OnzDPbIhQV9F
   JTd/DAxzr4up74tunB9YdhksBiFe4G2aZdLC4xSk0zuomqeMbAwcGHkjc
   iCX9zzugS3DkeRmomH5B5WclFLPQKhrb6vvMy0+MOZ8aeHtKXpkFrSTJR
   Q==;
X-CSE-ConnectionGUID: 8jPxptDASnqkUMaT5gPehQ==
X-CSE-MsgGUID: vKRekkbsSE6n0iSdoCB2iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17587067"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="17587067"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 23:10:08 -0700
X-CSE-ConnectionGUID: hU/CBXYEQB2djr27ycd+WA==
X-CSE-MsgGUID: +PBv/BLxTIagLVNxVlwYyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="77518697"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jul 2024 23:10:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPc8x-000S0i-1X;
	Fri, 05 Jul 2024 06:10:03 +0000
Date: Fri, 5 Jul 2024 14:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Danielle Ratson <danieller@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Petr Machata <petrm@nvidia.com>
Subject: [linux-next:master 8719/10451] ld.lld: error: section .pci_fixup
 virtual address range overlaps with __bug_table
Message-ID: <202407051359.IdUPkWid-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: a39c84d796254e6b1662ca0c46dbc313379e9291 [8719/10451] ethtool: cmis_cdb: Add a layer for supporting CDB commands
config: riscv-randconfig-001-20240704 (https://download.01.org/0day-ci/archive/20240705/202407051359.IdUPkWid-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051359.IdUPkWid-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051359.IdUPkWid-lkp@intel.com/

Note: the linux-next/master HEAD 0b58e108042b0ed28a71cd7edf5175999955b233 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: section .pci_fixup virtual address range overlaps with __bug_table
   >>> .pci_fixup range is [0xFFFFFFFF826C79D8, 0xFFFFFFFF826CB9DF]
   >>> __bug_table range is [0xFFFFFFFF826CA788, 0xFFFFFFFF8270CE6B]
--
>> ld.lld: error: section __bug_table virtual address range overlaps with __ksymtab
   >>> __bug_table range is [0xFFFFFFFF826CA788, 0xFFFFFFFF8270CE6B]
   >>> __ksymtab range is [0xFFFFFFFF826CB9E0, 0xFFFFFFFF826EE86F]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
