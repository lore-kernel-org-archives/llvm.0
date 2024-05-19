Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8B5101CE;
	Sun, 19 May 2024 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716117312; cv=none; b=WM5hCHKpRfqfkP3sFgEdSseP3FiVoBevW92CmjjAWoEws7L+O38jJETNb1KdRmsEDxy4eMZ3lIAnGqmOd/mqcE07N/3g2rmW3DW5pq2r/6oEArKOAQI5v77jQKwAsbJEM/JYaKDpcmaGgQ2+xupzymc0Z1/8FNytLYv3hAuPTY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716117312; c=relaxed/simple;
	bh=fpFD9Rwh3eU+fPYTg0PWsTj3HMrPbbHMGQ/agdwBn/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpNhaOvpR/edUN72BYx4ItqJ9Zw7zLTTH37FZZMClUJNn3DdNgwf/9t0Jg3aHXpypoIpFkmCe2XLB7Z6TjnS6ETzWR01E5Rlve3fTgd21iYWSNTiTmr9qbjYmpBtwXpu0lpLGme9XfovHECt9jMX+vUjpU1ejsU2VS4p89U7g2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUgKLi+Q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUgKLi+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716117311; x=1747653311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fpFD9Rwh3eU+fPYTg0PWsTj3HMrPbbHMGQ/agdwBn/4=;
  b=eUgKLi+QG+HFxxIo+89bSk0+Hjg1BFHLKNez3KadWzvLGQ5pOf0B+EYa
   PxhEg8AQmPhvYdRIQh24Lhru47fG4EtNHjwcChQI44PEdLihTDIUaBj2q
   ZsW/Lx/wX6X/hrczF8n1uKdQct24SqOVIxGfZ+fpM+ZG0qrkq1NoktUuc
   red1xLNwYbrR9SoLQAEIF53o84Am9e54mYeB56wyUuI9ejtk7nmixiyTv
   FJS2/4ejMfzDwvhVTS/bwPP6chIdBCHDXHSEF1Iu7X57+H67ycN6FKsM/
   IUEWh5WiGpDhAvXe6Lx0RP+QsAzqiKR+4n9duBnNA7kWgsaw7OFFSDj02
   w==;
X-CSE-ConnectionGUID: Z4uVRFHLQNuWLiU7RXjX4w==
X-CSE-MsgGUID: ekBPfYsGRwqgVQt32GOBlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="16084005"
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="16084005"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 04:15:09 -0700
X-CSE-ConnectionGUID: CHMY+v9BT5aRyNYZ8pmLtQ==
X-CSE-MsgGUID: 2ja2OM2xRWKaXWmK6blRXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="36669876"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 May 2024 04:15:08 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8eVN-0003PA-2x;
	Sun, 19 May 2024 11:15:05 +0000
Date: Sun, 19 May 2024 19:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2_key-2 5/6] ld.lld: error: undefined symbol:
 look_up_OID
Message-ID: <202405191914.cueCV6Nd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2_key-2
head:   f576cb4d2006cb2edd425432dab8bc97df63720d
commit: 43a5881d4fd3804353c06034ce9901947e067b41 [5/6] KEYS: trusted: Migrate tpm2_key_{encode,decode}() to TPM driver
config: x86_64-buildonly-randconfig-001-20240519 (https://download.01.org/0day-ci/archive/20240519/202405191914.cueCV6Nd-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405191914.cueCV6Nd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405191914.cueCV6Nd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: look_up_OID
   >>> referenced by tpm2_key.c
   >>>               drivers/char/tpm/tpm2_key.o:(tpm2_key_type) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: sprint_oid
   >>> referenced by tpm2_key.c
   >>>               drivers/char/tpm/tpm2_key.o:(tpm2_key_type) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
