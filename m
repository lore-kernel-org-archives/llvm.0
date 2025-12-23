Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7BA2BF3CC;
	Tue, 23 Dec 2025 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766506190; cv=none; b=MD1FXQwTsUABDQsGORC4ESHxExiJ/VRiiJuMpPekgmlcgYfcnxBHUIjDZwEvUapCmVS+TqGSlO0rs+VFLeLmWhd8BOCvj/yee06MyM4nggdFHkkPNcPmvc/HzfvemmD/X37dfS2/G/fkZHgWeajH2tm0tCUZqR1nmYTgn0ph9cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766506190; c=relaxed/simple;
	bh=IzoToA1I8I0KWE0efJl9sFujPzKUzhtTCmJsBIH3Hx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMDGnamzwjfI+mhI3lkV6LXTMdGOEenPjELzv326j8PHDPmcEGycCa5UGESa4r3B0Vsrsna7X+i2Xhp59Bh+/pr98JUPMYyihaykega3rfwz88iq19zszZp5HjYice18qmMGa3lcdBDDDaNCUcyg+2REvitvK7oeMUeynufD3lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYrtLxJ+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYrtLxJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766506188; x=1798042188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IzoToA1I8I0KWE0efJl9sFujPzKUzhtTCmJsBIH3Hx8=;
  b=jYrtLxJ+ZYhurLIn466Z4yuMFt6T2ohyKOK/DPxwzycqHW9TZO8F+13G
   XO5Wb/Dk1VwXsrgRDVqpfvw6KobXmf1fWeHPLH8nSnUnB/xrArq27qV1d
   9mue4VMuo0yfH9ceiUj1Qzymjt3uuICLvpcccCApxLENAoTxhEgv1xtc3
   yZZkqF6sRjbnK0vLd0rAa6F34AQ+6yYJsJCKN7Fhe/C4LQC1EVG36e5Zn
   c4dlRZq0mcmlttM04Oo0QIJmjinS5wVQbM8oo8WdJn6ny3X5iS5Yvhpbo
   HoqPqpT0j5JRmCPSaYDuodZOvUpLy73n9E2rgsI8zUios9/CrY/yX1qPx
   g==;
X-CSE-ConnectionGUID: XKYt30RRRXSkUTtoY2lqIA==
X-CSE-MsgGUID: Nv+dlx54QdGKDw5Lzw/TOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79075750"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79075750"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 08:09:47 -0800
X-CSE-ConnectionGUID: ZVtET5yHRiKd5uh3q5vF/A==
X-CSE-MsgGUID: E83UwC1wSzyq1dfmrwH56w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="198948733"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Dec 2025 08:09:46 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY4x8-0000000027l-03Tx;
	Tue, 23 Dec 2025 16:09:39 +0000
Date: Wed, 24 Dec 2025 00:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 24/28] KVM: s390: Switch to new gmap
Message-ID: <202512240257.wvkcvjdc-lkp@intel.com>
References: <20251222165033.162329-25-imbrenda@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222165033.162329-25-imbrenda@linux.ibm.com>

Hi Claudio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on s390/features]
[also build test WARNING on kvm/queue kvm/next linus/master v6.19-rc2 next-20251219]
[cannot apply to kvms390/next kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudio-Imbrenda/KVM-s390-Refactor-pgste-lock-and-unlock-functions/20251223-012700
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/20251222165033.162329-25-imbrenda%40linux.ibm.com
patch subject: [PATCH v6 24/28] KVM: s390: Switch to new gmap
config: s390-defconfig (https://download.01.org/0day-ci/archive/20251224/202512240257.wvkcvjdc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240257.wvkcvjdc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240257.wvkcvjdc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/s390/kvm/gaccess.c:1052 function parameter 'size' not described in '__cmpxchg_with_key'
>> Warning: arch/s390/kvm/gaccess.c:1587 expecting prototype for __kvm_s390_shadow_fault(). Prototype was for __gaccess_shadow_fault() instead
>> Warning: arch/s390/kvm/gaccess.c:1052 function parameter 'size' not described in '__cmpxchg_with_key'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
