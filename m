Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60213469D;
	Mon,  4 Nov 2024 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730731521; cv=none; b=IrZZNBg75r5NqhPOZc/V6SiPwCTdmi4PgDBARatUiN444RyJCTqSFUehQoERVbig5oYgd9ci6MSjx8KeUZwI5v5rXwbe32qFgM5fYmJvcA15c8VXn7iqR/NXZyKgyllpcsE4M9iyF6rVEmyGSEmUCqthJadifLhT1cr4L4iK4qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730731521; c=relaxed/simple;
	bh=p4nDr7PCCaezB3lXkyzM0JFRhrFfZDjknyyrOk2yt3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cngSvDoTnYa2zUCL6amaxj1Tb6UCKkWR+buOWbg344qdom+zYjxDdvFON5f80M1VHx5Qn9WprBJFo9u2VWRk31xLfeUcCaqSNyeGrLZjwN10aTPsaCywFvq83X1PUzBb1ftE7l6iyRvW4BsXkkDWdRWgJsyEMKilGmP8UFVlS98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBEuyDoz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBEuyDoz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730731519; x=1762267519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p4nDr7PCCaezB3lXkyzM0JFRhrFfZDjknyyrOk2yt3Y=;
  b=WBEuyDozpuafFYdDC6ThGR2VF0RWR1sg0zGh65K0UGL5shWxCBMo550F
   fYH8QuKLkp44NPCutHXLPMOttTcg06JBRzxMp2yB8Km0L9imhsJZiSWm+
   Xd0eM/rSc9s6T1DmHr+p/n9zh17sPq+iRjcV3ducVjlV/da3/cea7FKNk
   M/fuhbToInZN3xDykINFc4mFajeesI5GSoSKBsuUqUOE6h0FJxbENTqN1
   QTvNfWOweIC0f3JpxU90XQ0Z7gLngJzziIbNrduHuarC6fTRGhAyXC+Wp
   3VkjZ2BleRdAkFLeNSHAnGP/SPuHg9xFY5lGik/QhUuWhSDZC57yWHtER
   w==;
X-CSE-ConnectionGUID: DRGwk46+SsKx8R9q9/H+eg==
X-CSE-MsgGUID: q3pVR3ivRtmGIonm10pxNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30376962"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30376962"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:45:18 -0800
X-CSE-ConnectionGUID: XwnqWETbQLWVQihl58dbKg==
X-CSE-MsgGUID: aRyt+8azTgWmgh3gZFTlbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="87605399"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2024 06:45:16 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7yKQ-000kvt-1Y;
	Mon, 04 Nov 2024 14:45:14 +0000
Date: Mon, 4 Nov 2024 22:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [ebiggers:crc32-lib-v3 20/33] ld.lld: error: undefined symbol:
 __kcfi_typeid_crc32_armv8_le
Message-ID: <202411042253.lLk5G8jo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v3
head:   5df8633ed44a9b50f2221cff13d4a5a7077b58e4
commit: 749d57402c02f66464634de978484195090da195 [20/33] arm/crc32: expose CRC32 functions through lib
config: arm-randconfig-001-20241104 (https://download.01.org/0day-ci/archive/20241104/202411042253.lLk5G8jo-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411042253.lLk5G8jo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411042253.lLk5G8jo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __kcfi_typeid_crc32_armv8_le
   >>> referenced by crc32-core.S:231 (arch/arm/lib/crc32-core.S:231)
   >>>               arch/arm/lib/crc32-core.o:(.text+0x1C0) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_crc32c_armv8_le
   >>> referenced by crc32-core.S:292 (arch/arm/lib/crc32-core.S:292)
   >>>               arch/arm/lib/crc32-core.o:(.text+0x260) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
