Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA452572;
	Tue, 12 Mar 2024 10:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710240571; cv=none; b=E3sJJDi6TOGX1eykw57HkqQEHPLqZrOQeXSiA8nEBhkr7L90M7DS5RPOEK9qlFFCoF/7FH0XYJHUqi+S28dEvJ9Sne4FKwzylwTHCztLUxmbJ3EBlKXkBXvaG/MUft5Ls/azP1w1eaVsNHIZw5m5EjhOEWwFKl7mIZlTNFuBn5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710240571; c=relaxed/simple;
	bh=pik/C5QHaV0+NMf2Cx1A2tmEuScRkZYtAiJS/slm1oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCMcsl+bk4hCvNiLUqlwMlSiCBvStQHb8TIIGiIh/PLmaLsI7g405jmgivZg+PjeHUY8rTTa1fYa6uKMvRNRW9oi85iksHCbI61bWHh85OoE36/4FVfSZO0ULw/LGM+/zweFWL3wcU9gaQO/OO8YV4Sn3dNyd9BhgJKnRD0p8dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYsAiku3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYsAiku3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710240569; x=1741776569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pik/C5QHaV0+NMf2Cx1A2tmEuScRkZYtAiJS/slm1oM=;
  b=eYsAiku3pqBYVNhOqpxuNcV1Au22tA/bAVnH4IcdyL2zzp2sE+li8+n+
   nNwVTsEy6cZI4nMB9QVm41xWaYusiQrgwgvl2zb1usOu93oBf6S/EozGx
   Pmy7E2/DZFIMQokpzkaZYhf/SyIekdAjd8gpBF0caFIJb9b1dlagq4VCI
   tvWcRlPTl2zEpbaXy+816Uc9Z8G3dYI092VB+F82eKjeQIiZQiZbg+CYG
   4d7np04lx4cWfqaOOkPfqgACk+LCQCMI6BNhBlHqgQ932YV4C9p4wVDRm
   ippJ7zu8LSLCHFIFAUz6zWBIzsbPR1zsxZbZSypgV4dVMVSLq34uBbMOl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15500995"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="15500995"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="34673893"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2024 03:49:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjzhF-000A3P-10;
	Tue, 12 Mar 2024 10:49:25 +0000
Date: Tue, 12 Mar 2024 18:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Snowberg <eric.snowberg@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/8] clavis: Introduce a new system keyring called
 clavis
Message-ID: <202403121804.3aCRnfuH-lkp@intel.com>
References: <20240311161111.3268190-3-eric.snowberg@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311161111.3268190-3-eric.snowberg@oracle.com>

Hi Eric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on edc6670233a333ccfd1ec0548f068bd121d209c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Snowberg/certs-Introduce-ability-to-link-to-a-system-key/20240312-002925
base:   edc6670233a333ccfd1ec0548f068bd121d209c8
patch link:    https://lore.kernel.org/r/20240311161111.3268190-3-eric.snowberg%40oracle.com
patch subject: [PATCH RFC 2/8] clavis: Introduce a new system keyring called clavis
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240312/202403121804.3aCRnfuH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121804.3aCRnfuH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121804.3aCRnfuH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: late_init_clavis_setup
   >>> referenced by iint.c
   >>>               security/integrity/iint.o:(integrity_load_keys) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
