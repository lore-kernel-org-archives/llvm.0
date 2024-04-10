Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8A158D6E;
	Wed, 10 Apr 2024 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712746789; cv=none; b=mUcpb8VgzGBLSf1+1eXrXwfRyUlFpQzdJn7T3kN475bmI3Vo4r9zIwptawC6h1mPazOx+bXLFuv4gvlVV9z0FZUE4NMtYNFNhTNLwN+ZgWqp5yJN8gNE1Q8SFTEm8eyGGPI34rOVBeKI5Z1NkeHc+xW/3dRTX4vm+cnGo076g6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712746789; c=relaxed/simple;
	bh=zpjatQvh8SrwaXcPrw1IoXEzZWRj7eVtwsfCpO6Mq2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K3RlgXvk9vB6djczl6HR8RQyjTTacdx6Uffo5dbaTKe4QXpK7PAoth1ySNunuUka6fxvGuZWNKhD1S/wuE5xtSnwg+0uILAefC65dwu8MZOggrUMY+BP7dP6ym8To/BGuCKk+aH4V+KalQjL4TZGyvFkJbqnkv5UlO0lMuIFnlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2URNbUQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2URNbUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712746788; x=1744282788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zpjatQvh8SrwaXcPrw1IoXEzZWRj7eVtwsfCpO6Mq2Y=;
  b=Z2URNbUQI8xOi9aOo3n4pQXMONy6TCw0B+0Sq1oSl3Rc7LuDKCCPfaR5
   vvPLVKU+XLJYAAlPmSJwBlcdALmFugCP34U6A5dyxduuunMzoNfu86CDj
   pTHYmhkZknyqn++C0HBhWKh9vxgG0idDQvr72p6F1ulGhtsfWa/R5/TGE
   9fgLKBSq3fVjH+Fq5NxUahuJnr84KgVqynTqQ6HY92Zs+bpTAicYljnUo
   zyGEstdSvHhs/F0xqr0IuBsq1pVybRVn8Q0kh4eggezby5wXNkQkEXBWr
   NnBu1ZRfLM7eLajw6zCpiX1Lr1YoZwxlDF+perIHUss1pxu2XbMM5wq+V
   g==;
X-CSE-ConnectionGUID: DmE0MS9DTjyY2Zn29IsRwQ==
X-CSE-MsgGUID: e32VbOaAR1iDBxUAN5Znww==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7973822"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7973822"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 03:59:47 -0700
X-CSE-ConnectionGUID: wJBcMMACTo2o9VmRf2T6YQ==
X-CSE-MsgGUID: FObvpBnmSDCinEZPjTvHfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="51745344"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2024 03:59:46 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruVg7-0007Ea-2Y;
	Wed, 10 Apr 2024 10:59:43 +0000
Date: Wed, 10 Apr 2024 18:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v4+x86-rox 18/23] mm/execmem.c:69:undefined reference
 to `text_poke_copy'
Message-ID: <202404101820.mi1ZXnRT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox
head:   d64e0751d3a13178009bd0a72f04f4b90f7ef961
commit: 95eac503c326322a5414c81b8c55e1a43bc19371 [18/23] module: prepare to handle ROX allocations for text
config: um-defconfig (https://download.01.org/0day-ci/archive/20240410/202404101820.mi1ZXnRT-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101820.mi1ZXnRT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101820.mi1ZXnRT-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: mm/execmem.o: in function `execmem_update_copy':
>> mm/execmem.c:69:(.ltext+0x179): undefined reference to `text_poke_copy'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +69 mm/execmem.c

    66	
    67	void *execmem_update_copy(void *dst, const void *src, size_t size)
    68	{
  > 69		return text_poke_copy(dst, src, size);
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
