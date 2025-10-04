Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6155550276;
	Sat,  4 Oct 2025 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759565398; cv=none; b=BApFKdaNHQiIA27msiKUV0i5sM+PLI8ryEMisF9fETzzXjORY7RfSuM1KrU+YLwpnO9VN2eoMUMNE3/6bCuj+NwbVH2dwhQf+hK0TU5PFm3rarVIonky8GOxaaIXR8uIgUOitO9+GKPDKHy5DC52uFdRSG8Wsva/D65hgp2Y8yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759565398; c=relaxed/simple;
	bh=B96OmDeOmMDIhrgUpXpMInr1UGo5k+vzJaFEQqQ3TuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApDrLB4gv1N350LXOvs8VbhAMkPfl8adp+IKobp2CNJZXb5BU6NR49lMWIjoWe6e9bN36sUl0lkc0mFOl7T5QFsHCyD5QWJfqjrCTCXQvO9SlPT+NKnf7duJBvTTx9/aUeNfCQnMdHKfTUBeXjkKSSoTD8nqik4ArpgNOxMxN7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=budMKm4/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="budMKm4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759565397; x=1791101397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B96OmDeOmMDIhrgUpXpMInr1UGo5k+vzJaFEQqQ3TuI=;
  b=budMKm4/o7s0x4EwmiA52HJoor5Uxznqd95y0GGrIW4H8Jt+thdYo0e7
   v76AfsDOkmKpCL9iMvNgI5hWtlCcXl/KBC2SNte2fGfkUApocnM/QJATb
   TZWtPR8QOdCoDhAdTaoAUAt6/DM+AVGoPHoad3XkXZQ2bHCaAIq271VXG
   dlbgxxoyDkWdA6ipMqUHoUiEToHSoIKDuOg0Ub7l5GFG3ufXPFC5Rr5Wn
   832Fp/gJX4cx5IC4U9ykRXrW8E/mF+X2A2+zeOTdCaY1dRIs2Doxj0ELr
   cogF8fgqvDbfca6VXbHcusBqQcFHdb0kwNmOVm0lsAoSwEBzJs6JpgAck
   Q==;
X-CSE-ConnectionGUID: TCL5aeiUR06AvAXMFZdqPQ==
X-CSE-MsgGUID: mCOC2V6bQvWwiuVEeTZz3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61749217"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61749217"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2025 01:09:57 -0700
X-CSE-ConnectionGUID: fL8QGjcqTXm1u6X0ZSdpdw==
X-CSE-MsgGUID: 5v6lvpaFSeeHqo6qgEPQVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="183855351"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Oct 2025 01:09:51 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4xKu-00059b-1f;
	Sat, 04 Oct 2025 08:09:48 +0000
Date: Sat, 4 Oct 2025 16:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>, arnd@arndb.de, bp@alien8.de,
	corbet@lwn.net, dave.hansen@linux.intel.com, decui@microsoft.com,
	haiyangz@microsoft.com, hpa@zytor.com, kys@microsoft.com,
	mikelley@microsoft.com, mingo@redhat.com, tglx@linutronix.de,
	Tianyu.Lan@microsoft.com, wei.liu@kernel.org, x86@kernel.org,
	linux-hyperv@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	benhill@microsoft.com, bperkins@microsoft.com,
	sunilmut@microsoft.com, romank@linux.microsoft.com
Subject: Re: [PATCH hyperv-next v6 05/17] arch/x86: mshyperv: Trap on access
 for some synthetic MSRs
Message-ID: <202510041544.zPic8ogA-lkp@intel.com>
References: <20251003222710.6257-6-romank@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003222710.6257-6-romank@linux.microsoft.com>

Hi Roman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b595edcb24727e7f93e7962c3f6f971cc16dd29e]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/Documentation-hyperv-Confidential-VMBus/20251004-063158
base:   b595edcb24727e7f93e7962c3f6f971cc16dd29e
patch link:    https://lore.kernel.org/r/20251003222710.6257-6-romank%40linux.microsoft.com
patch subject: [PATCH hyperv-next v6 05/17] arch/x86: mshyperv: Trap on access for some synthetic MSRs
config: i386-buildonly-randconfig-003-20251004 (https://download.01.org/0day-ci/archive/20251004/202510041544.zPic8ogA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510041544.zPic8ogA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510041544.zPic8ogA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mshyperv.c:46:13: warning: unused variable 'hv_para_sint_proxy' [-Wunused-variable]
      46 | static bool hv_para_sint_proxy;
         |             ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/hv_para_sint_proxy +46 arch/x86/kernel/cpu/mshyperv.c

    41	
    42	/*
    43	 * When running with the paravisor, controls proxying the synthetic interrupts
    44	 * from the host
    45	 */
  > 46	static bool hv_para_sint_proxy;
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
