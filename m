Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A23536827F;
	Tue, 18 Nov 2025 15:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481292; cv=none; b=O4cTyHXhOawztqSW2d1wYcjkKxOjmNFxEB65ulqnpmUqvHx+8fKucvwHvNUz1QugkfUfMxu3Jfz86/bq6SS7qlnfFR/XgAHuxtH6dOeq+JhXPwlzGdMsXxcjMVX9gkAyREmpZ4G7ZHdyN/WEMHQ3vUu0aC3GdjDeoZPndeUmobU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481292; c=relaxed/simple;
	bh=D07vP2bTR56TwC70J4fSsfq2NWntIX6r4PR2vKL2tCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B02KI/FVWcoZuh8+LwxGVOA2TiGPwAr922IR2EPXE5Hy1373UjwL9rTnXUaKuI94Ya9d6lUlgbjS/W0YDXnerSh2LKJPYzLfwUTn0ZLJgBmniDMt+R0fJmx0q6XMnztodET8QcnxA6aSrbMjbuXY/fBFY2YRN5+2rdUjPbvA3UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYSAUeUy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYSAUeUy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763481291; x=1795017291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D07vP2bTR56TwC70J4fSsfq2NWntIX6r4PR2vKL2tCk=;
  b=aYSAUeUyAs8ggOzTXzIxfxykZosrhsPmR4oLRTJXOn9OubbArwzIa590
   VuUfA2enA6doTaEyq0NArItTEAEMHK3Xx4PMjs0P6OrgRkhmZsVjLIox3
   l8K1+iYHNE9Sn/afefIEih9PZ/qhZXnDpdBGklyKoffP7W24AprBcvBm1
   Pjpz/XoIe3mAdcu+bk5bwI+oRV3KKPMQOYSsQivUzCogwRTJEpNvq0Wni
   YVPfJXTZFiujM+mQsDY+0u28XOvl41Xqt/Jx3RBW37o0G0xXa470qmkHK
   WC6+QAFmkbn0gvljBPABJv0mGwkrGWNOLgv1krpmscZcAwhwLvq3FtaY1
   g==;
X-CSE-ConnectionGUID: 3U9Nlii4QOaLlz7SP+afLA==
X-CSE-MsgGUID: 1AtjaXYSTh+OZNwAm8eygw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76184824"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76184824"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 07:54:49 -0800
X-CSE-ConnectionGUID: gydvxmQoQdqQG2JcwV1l0w==
X-CSE-MsgGUID: BmWiB7vEQWa3K3hG3Tn+nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221695830"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2025 07:54:45 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLO2U-0001tp-1w;
	Tue, 18 Nov 2025 15:54:42 +0000
Date: Tue, 18 Nov 2025 23:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: Praveen K Paladugu <prapal@linux.microsoft.com>, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	tglx@linutronix.de, mingo@redhat.com, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	arnd@arndb.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	anbelski@linux.microsoft.com, prapal@linux.microsoft.com,
	easwar.hariharan@linux.microsoft.com,
	nunodasneves@linux.microsoft.com, skinsburskii@linux.microsoft.com
Subject: Re: [PATCH v5 3/3] hyperv: Cleanly shutdown root partition with MSHV
Message-ID: <202511182353.5FvVmUhR-lkp@intel.com>
References: <20251117210855.108126-4-prapal@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117210855.108126-4-prapal@linux.microsoft.com>

Hi Praveen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251117]
[cannot apply to tip/x86/core linus/master v6.18-rc6 v6.18-rc5 v6.18-rc4 v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Praveen-K-Paladugu/hyperv-Add-definitions-for-MSHV-sleep-state-configuration/20251118-051204
base:   next-20251117
patch link:    https://lore.kernel.org/r/20251117210855.108126-4-prapal%40linux.microsoft.com
patch subject: [PATCH v5 3/3] hyperv: Cleanly shutdown root partition with MSHV
config: arm64-randconfig-003-20251118 (https://download.01.org/0day-ci/archive/20251118/202511182353.5FvVmUhR-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511182353.5FvVmUhR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511182353.5FvVmUhR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hv/mshv_common.c:210:6: warning: no previous prototype for function 'hv_sleep_notifiers_register' [-Wmissing-prototypes]
     210 | void hv_sleep_notifiers_register(void)
         |      ^
   drivers/hv/mshv_common.c:210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     210 | void hv_sleep_notifiers_register(void)
         | ^
         | static 
>> drivers/hv/mshv_common.c:224:6: warning: no previous prototype for function 'hv_machine_power_off' [-Wmissing-prototypes]
     224 | void hv_machine_power_off(void)
         |      ^
   drivers/hv/mshv_common.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     224 | void hv_machine_power_off(void)
         | ^
         | static 
   2 warnings generated.


vim +/hv_machine_power_off +224 drivers/hv/mshv_common.c

   219	
   220	/*
   221	 * Power off the machine by entering S5 sleep state via Hyper-V hypercall.
   222	 * This call does not return if successful.
   223	 */
 > 224	void hv_machine_power_off(void)
   225	{
   226		unsigned long flags;
   227		struct hv_input_enter_sleep_state *in;
   228	
   229		local_irq_save(flags);
   230		in = *this_cpu_ptr(hyperv_pcpu_input_arg);
   231		in->sleep_state = HV_SLEEP_STATE_S5;
   232	
   233		(void)hv_do_hypercall(HVCALL_ENTER_SLEEP_STATE, in, NULL);
   234		local_irq_restore(flags);
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
