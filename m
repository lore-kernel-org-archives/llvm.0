Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243591D63F0;
	Tue, 26 Nov 2024 17:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732640671; cv=none; b=uDuj0LY9MUik4E/gcthXTyRyvmeqVxwguST3ZpjZmGduhq5/d7ueG8pn+NOFno69lu1WIXQ2CiUKu3lonpyYevubRspZKikXB6ftTVjkqWsmYeJbsdd+LYB73fXiKfK2Pi8QmwLhOmGYzhnoPYHUe0KuKGZAu1tl7SG95tH4jHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732640671; c=relaxed/simple;
	bh=XlJogXeU96y9CA9wNIBfV10zwsqOVWg3NuHbNQ6xAQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tEKxw9MjWd+mAF0vRoV+KTMgjE2lgBWRAcMpA1Wrw3TD8JxhfBq4R8ap6Mv12LK3tZajKAuK3wTZyYcIq6K3xYt9N/p8bmnDSDr21ZV5Vckn8jdK92EWfjQMlmGmJJ/QPKWdZ6UU2wL9f/MU2Zl8UGTBiN0yOyXMF6iMLb8Sf9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7BFk2IH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7BFk2IH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732640669; x=1764176669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XlJogXeU96y9CA9wNIBfV10zwsqOVWg3NuHbNQ6xAQ0=;
  b=k7BFk2IHQwuAv7PrJhc5flXpWp2sr3hhayK6FhgnXstBAi4DPOKNfGV3
   manIxQdhq7+fsTE4sRg8QQlH4V5GZks8Ev11ZU318V85MeUcA2JFzJoDK
   hQSIORnL/wjra6Qgz7+TjScyGMFBvOebaNruEnr3SrP1evzRk3k2gqFxy
   4bqDbWuCLrhXprI01kgtT5Xy9Lh38Bc5G72GvvsBjlxcmaOOWsSsNW8y/
   Xd2D1CR2/rTRU3dHMW/AqZx2FWcx+ixF4/qCPYrL70qGfIwJyNM4PWXaa
   ZCL9o61dNcTQJUDeH5C7LPa9R6xL0+NRmMHVSqZpDqqy23++4NBq1u4zN
   w==;
X-CSE-ConnectionGUID: 60y8S2vSQkGokNSAHef8Sg==
X-CSE-MsgGUID: pe+JoS6DRR+f6i2/Xuyl4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32763251"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="32763251"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:04:28 -0800
X-CSE-ConnectionGUID: jL54A7ohRRCo5p38704s5Q==
X-CSE-MsgGUID: TgZizWsHR1GIrLTRC0jP9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="96104575"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2024 09:04:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFyzB-0007Qt-1V;
	Tue, 26 Nov 2024 17:04:25 +0000
Date: Wed, 27 Nov 2024 01:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug 2/21] ld.lld: error: undefined symbol:
 saved_context_gdt_desc
Message-ID: <202411270006.ZyyzpYf8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug
head:   605ee978620415b08606653176ef0db89211f3fa
commit: 94f97b1bb453b5c445f0ef1d21a32b130256cbeb [2/21] x86/kexec: Restore GDT on return from preserve_context kexec
config: x86_64-buildonly-randconfig-005-20241126 (https://download.01.org/0day-ci/archive/20241127/202411270006.ZyyzpYf8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411270006.ZyyzpYf8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411270006.ZyyzpYf8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: saved_context_gdt_desc
   >>> referenced by arch/x86/kernel/relocate_kernel_64.o:(virtual_mapped) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
