Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216EC2DEA9D;
	Wed,  1 Oct 2025 11:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759319458; cv=none; b=AO3lRn2dHV6kh3SLXWS3BTtASznoqw7wbWFHh9WT/ZUquKPX37ZQuFRu+KbzT0FNVNwjtY/wfplPAGPJ8vXMXkJXzDBCwicelTmfwsUMTxoUCbifp/k0YhbkWB0oSG1SFb+J/og1CfAg5XQSdYZFMgYs2SNMNPIGcVG3DvA4JhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759319458; c=relaxed/simple;
	bh=UUMgyh1khVMAvCaYjTZGs4C0yTwafGUhOSzbw+S1OlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciajR2h+SxAKJoKm/Z4ozQVlwFLmPM5EynN+AJK4J4QpyH9lDqG0CUhTo3BoZZH0/o3WVGE27N2OlirUD5i4sVCVdWp68tVNIAx/xz16Pr64lG/MNo4wi23bND0+4rkat2e7fMqWSvmc+we1LuvKQUnZI0hNclCjVYCWcBqJJyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBKrq1Gc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBKrq1Gc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759319456; x=1790855456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UUMgyh1khVMAvCaYjTZGs4C0yTwafGUhOSzbw+S1OlM=;
  b=LBKrq1GcrfHQRdxDPp2doNE2IqsPjuYdxAZg2R+Edm12DKLh/+7HmaKp
   /1w7QEDVtIz2u09vmmPhb8UP75B6aZ8q40gx5zXYHefQSBLsLcJRNosIt
   EYPzCngZ3Kq6kdZq4VTCX59SVFb/01tnYhDCVfDrCEJh5W8+rLSrm9krK
   2t1hUfC8GfxjLCC8QKTxjQAfrlQlRVqS7O43dwTz2jlKX5t9LgSsF7mNz
   tpGoFZwvO1LpcCo51BO81dDzGWBYOAwqiZsXwpRhsGzFqvtkHl2quzdfB
   XGYKwC6k0nM3hTFWvkv57aLDwVv3ATl6908WM/G5XZdkUiyVO+GbSySdR
   g==;
X-CSE-ConnectionGUID: 2GRHPrpQShOEhilatGep1Q==
X-CSE-MsgGUID: 10kN87GMTJqmiWyq/fWkIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65443972"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="65443972"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 04:50:55 -0700
X-CSE-ConnectionGUID: usEHt5hORTqkcXV+hJVCiA==
X-CSE-MsgGUID: oJ6f0FRMQWy3rQi94VIwEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="215893106"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Oct 2025 04:50:53 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3vMB-0002xH-01;
	Wed, 01 Oct 2025 11:50:51 +0000
Date: Wed, 1 Oct 2025 19:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: James Houghton <jthoughton@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	James Houghton <jthoughton@google.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: For manual-protect GET_DIRTY_LOG, do not hold
 slots lock
Message-ID: <202510011941.dJGxEiZE-lkp@intel.com>
References: <20250930172850.598938-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930172850.598938-1-jthoughton@google.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a6ad54137af92535cfe32e19e5f3bc1bb7dbd383]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Houghton/KVM-selftests-Add-parallel-KVM_GET_DIRTY_LOG-to-dirty_log_perf_test/20251001-013306
base:   a6ad54137af92535cfe32e19e5f3bc1bb7dbd383
patch link:    https://lore.kernel.org/r/20250930172850.598938-1-jthoughton%40google.com
patch subject: [PATCH 1/2] KVM: For manual-protect GET_DIRTY_LOG, do not hold slots lock
config: x86_64-buildonly-randconfig-005-20251001 (https://download.01.org/0day-ci/archive/20251001/202510011941.dJGxEiZE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510011941.dJGxEiZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510011941.dJGxEiZE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/kvm/../../../virt/kvm/kvm_main.c:2220 function parameter 'protect' not described in 'kvm_get_dirty_log_protect'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
