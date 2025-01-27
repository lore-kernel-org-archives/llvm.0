Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8565802;
	Mon, 27 Jan 2025 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737962309; cv=none; b=X6fJjwPwSEmge0o+i7p/uYx3HHtGlBf7yKNDyR9vH0nUvwIpR9gJnynNBmwjjlIW7EUb+v/oPUsc5ZaY7WJ2fJWA27jiB7Xe+a8OW4x3tUqCeTHlZ/HMquDlIGCrPFD+yszm+mxDt+uiE45GU7E90upSPnsA2Nsnw8/Njq4F1jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737962309; c=relaxed/simple;
	bh=sy9bWsAf5J8xIjOr7UHnnTv9stuR2mJa+4nhKMhciY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1Q9JmBRf80QUJ1VtMlOewrzbaBrX7FGHtBPeZXeSIbjcsOQDkUhTSbgSh5sm9Fpjxjg+XxUaJhmhcDRuMfOUEvx2amGDtuPOva74LAyvjmr0gdBoKsbwrGpeUVDbRj0spmVothlfeTFWcX0pAh7sRvTCcAAW8W+EFUl+YbmLkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2inCVkQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2inCVkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737962308; x=1769498308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sy9bWsAf5J8xIjOr7UHnnTv9stuR2mJa+4nhKMhciY0=;
  b=K2inCVkQQzZt5VD/KyYBMmKgeaWWNhCqd3RFsJxkL1+uqj14ynkU9Tb3
   7OQ1YIs7V5+UvO02H3H/QsgIuAT6uZadHLtW6SXTliHVnkdRaE6QyK41+
   15w6TxTl+pLLjLQ3YRRX+QasBvb6tRxzIizbpxC5P/dvMmbJFN6hmyTSn
   70tewCkYn7dHu0eLOCoGAethT/OMGTXqSlPzbFEHXY13hdF7hKucx9NBW
   gNsue/wqkPLe815NWSUDwS3Gvbyb0hO+sPozUXQ0as2tAygPkGRQcNpZv
   3YQVmpNrNrmh/6gss8hSa9z7B6QnXlANdRhYhdZaQRjsUhQWQ/C+qZHns
   A==;
X-CSE-ConnectionGUID: MV0o4QDmTdOcAO1bOTq0tg==
X-CSE-MsgGUID: SFygcGuxScyep5kBcSJruQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="26012168"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="26012168"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 23:18:27 -0800
X-CSE-ConnectionGUID: YDfPFxSQSWy/kjLFHXq1SQ==
X-CSE-MsgGUID: cb4OEUXQS7Oz2QI86cZ9xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112381944"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2025 23:18:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcJO3-000gWF-2Q;
	Mon, 27 Jan 2025 07:18:23 +0000
Date: Mon, 27 Jan 2025 15:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 11/16] ld.lld: error: undefined hidden symbol:
 pv_ops
Message-ID: <202501271543.iaTbLKPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   10a91ad0b8cdac55ad6dd0392df03e80942eef51
commit: 22bf9d7e4b29ece8d06e0caef03289622ec443db [11/16] x86/efistub: Move EFI stub specific code into stub sources
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250127/202501271543.iaTbLKPJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501271543.iaTbLKPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501271543.iaTbLKPJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined hidden symbol: pv_ops
   >>> referenced by x86-stub.c
   >>>               x86-stub.stub.o:(arch_accept_memory) in archive drivers/firmware/efi/libstub/lib.a
   >>> referenced by x86-stub.c
   >>>               x86-stub.stub.o:(arch_accept_memory) in archive drivers/firmware/efi/libstub/lib.a
--
>> ld.lld: error: undefined symbol: BUG_func
   >>> referenced by x86-stub.c
   >>>               x86-stub.stub.o:(.altinstr_replacement+0x1) in archive drivers/firmware/efi/libstub/lib.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
