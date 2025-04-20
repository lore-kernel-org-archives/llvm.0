Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC8F184F;
	Sun, 20 Apr 2025 21:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745184827; cv=none; b=HP78D8LdieiN+kM4RY5PqZCoT6qqfSPoPNMi/ySqoPdHJtJ+2bOMx/Cp2U2S9urbrjsbWgqz/n64JXxsu961iAQV4la3L+4h5NWL3GgC0V9V+jFJIkR72LatvRLpnv8uVAbJtkmsxpFkVJhlmWnuMsYvqdDeCgUWH3TGoCIaDeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745184827; c=relaxed/simple;
	bh=IqPt8BDNEs11IlRY+tU6po9XQkp9SFh/oHg0XBaPZ7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwFOJkHX0xoCGSybBmPQBn8Y2xfbdOZXnTt9PJuC6521gEirMhPbHAfJ8gTrmOzjtC5RbUkojVYRBj1KmlKO39ybJY+XWWbrPPiIZcPVmHZaFOsVhMV9bQ8A59G27HXOR+m/NrOrSmy+HbqYRnt4ZrokGDWZf79zpjuR5SBdemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XitlFMxu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XitlFMxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745184825; x=1776720825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IqPt8BDNEs11IlRY+tU6po9XQkp9SFh/oHg0XBaPZ7M=;
  b=XitlFMxudyHDh4kfhWuDVtU9TUFVLfMd3Z0EDdWnh+/d3+9IhLewolOK
   dV29yD4IgG7VAF2TpU7b0RmYVUcCI2VWM6tToRSBuuXWtCL99u9eCvCKG
   mLovsfH0rMSQp7FJ9F2XL4dCfEP9WL4/ymp9DZOkEvX3mYzzbZL87mMjB
   +RWqmTi0yP9v5yfNrYdpNP7yZwkBRPaBFyH4Nh8M9hUJmgzx4hpyZ8vsV
   eDyvnJgEY5IDgzVLeaKxOj+QiOkiVhFObDI1jKakvQHexEC6axBuRJZRu
   ONQ9Eyt9ByYwscH62pFxCigIg6uUeso3ZVnDuwBSk7MEbipW/j6Lmdlo5
   A==;
X-CSE-ConnectionGUID: RJbTCQQvQqCzRTleiRrvMA==
X-CSE-MsgGUID: m2p+R6KPRMWqzTP9w8EY6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46823189"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46823189"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 14:33:43 -0700
X-CSE-ConnectionGUID: G8WrNrIYR0mA5nKY8mNasQ==
X-CSE-MsgGUID: ys+iET5vSkCDoBN2QgtG/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136525541"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Apr 2025 14:33:43 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6cIG-0004vh-0q;
	Sun, 20 Apr 2025 21:33:40 +0000
Date: Mon, 21 Apr 2025 05:32:55 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 05/13] crypto: arm - move library functions to
 arch/arm/lib/crypto/
Message-ID: <202504210545.llc4JaKQ-lkp@intel.com>
References: <20250420192609.295075-6-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420192609.295075-6-ebiggers@kernel.org>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on bb9c648b334be581a791c7669abaa594e4b5ebb7]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Biggers/crypto-arm64-drop-redundant-dependencies-on-ARM64/20250421-033019
base:   bb9c648b334be581a791c7669abaa594e4b5ebb7
patch link:    https://lore.kernel.org/r/20250420192609.295075-6-ebiggers%40kernel.org
patch subject: [PATCH v2 05/13] crypto: arm - move library functions to arch/arm/lib/crypto/
config: arm-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250421/202504210545.llc4JaKQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504210545.llc4JaKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504210545.llc4JaKQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/lib/crypto/poly1305-core.S:16:1: error: target does not support ARM mode
   .code 32
   ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
