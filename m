Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A4C35E547;
	Tue, 18 Nov 2025 15:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481290; cv=none; b=ViW0daFbQox0ACvCzGtLT/hMSIBXTgakWLQiexwn8eW6iv7CdF8MU6QpQVwFC62nsDWysdP9jeyWmqwxUcy0F7GCVGecbyejmXYjsOeYGa11VROxzFVQRPLXX/yqzu1MepGABDxaMPlQrrRbDTfkh5B8tu1iGX9pu1z+TC8IKIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481290; c=relaxed/simple;
	bh=SJZmduYdNLwpIaCG9udDYZTNJdO/7vSPzVNUjd0rFjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+8BUSl/nLjkaoegLv0dUeM2S5GMhh0ShdbzWon9/W0xaPRUKKEICj9yEwc1iHDpUEYZXyKgCL3G2NgQ70+2ld2m099Pm3snO+Xx7v3HMueTN9YKaWL9BxC2DtxDVvKnA1Hze+sMe3rkUJwWz0iS+qEa4+js1Rytun4ZBaeRzSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWI/s9vG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWI/s9vG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763481289; x=1795017289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SJZmduYdNLwpIaCG9udDYZTNJdO/7vSPzVNUjd0rFjw=;
  b=aWI/s9vG4MM1qM/PS+6VK/HEm5wcaKe101iVgKGMeajshyXiDQq3HI7c
   RyGNnjPswav/iF3k+tmvVaB0jpQXcD+fsViUDxDYg3JNhtmPUn29yHm6p
   GW+ThwhDXSDOpGrlmCrt8kAwci0XavYGUZg3ZSSs/w2tR+uxaXgWn5UT4
   X2qG5b86UqahCXaIUO9U9mpFWKwVpzeisTXhPaCFI+YmKqJ4GBUvlB1Xf
   St3+6wVFD1+X3NDugQltk7gVdhucFu5S5sP/E9YYuOJkugAvZn8HGaApq
   Zzn8FJiLpKHG0Hm0cDbWAMaCEvvvf5DeTNUqr1bFz9M7kro9/MBWLViUa
   g==;
X-CSE-ConnectionGUID: MVjIwaK5SC+8Udjb7IqpiQ==
X-CSE-MsgGUID: fopt37tNQE2cOJ58Bg9W9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="53078100"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="53078100"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 07:54:46 -0800
X-CSE-ConnectionGUID: LtPpoil3Q/OLH4mWlhgW+w==
X-CSE-MsgGUID: EpeEMFRgROCDRoI7jQkzcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="214181099"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Nov 2025 07:54:44 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLO2U-0001tn-1r;
	Tue, 18 Nov 2025 15:54:42 +0000
Date: Tue, 18 Nov 2025 23:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Hodges <git@danielhodges.dev>
Subject: Re: [PATCH bpf-next 1/4] bpf: Add SHA hash kfuncs for cryptographic
 hashing
Message-ID: <202511182314.4OwvmPz8-lkp@intel.com>
References: <20251117211413.1394-2-git@danielhodges.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117211413.1394-2-git@danielhodges.dev>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Hodges/bpf-Add-SHA-hash-kfuncs-for-cryptographic-hashing/20251118-051958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251117211413.1394-2-git%40danielhodges.dev
patch subject: [PATCH bpf-next 1/4] bpf: Add SHA hash kfuncs for cryptographic hashing
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20251118/202511182314.4OwvmPz8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511182314.4OwvmPz8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511182314.4OwvmPz8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sha384
   >>> referenced by crypto.c
   >>>               kernel/bpf/crypto.o:(bpf_sha384_hash) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: sha512
   >>> referenced by crypto.c
   >>>               kernel/bpf/crypto.o:(bpf_sha512_hash) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
