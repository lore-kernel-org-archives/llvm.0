Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76E460B8A;
	Wed, 16 Oct 2024 06:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729059608; cv=none; b=Dsak0Rrmyfqwt/h6/psNT86WlHbTq71NPUFxrpTKLOxJhVrJb4QlWaLnnoodMhMfIDs/RFBrNckYSGrxf7ikA9mRs7tfjJ9XGU0Jsys/SwgEHt7qAXGIm2VHrq3g8h6rn8TfKe8dNRkbIcq+fVOlNCqjSBgSSVirDRHswMy/qEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729059608; c=relaxed/simple;
	bh=qaJLAfJ+hrsrmwGpkbpiwW/a3cmep1qGh4KcmkUooaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uyi7i4Woj7oeBOhHrGrFdCAo/NAdBE7GSPHfes591n5lth2sAgFwOrr6qk2jR9kPZ4DFZbhBdBpKrBGwCWRw+bI8pt/bePDgMNjds3GCsmjqX46TueIQ4kYLrpTOBCyNHfw629LK4seFEkYnBBztiKGvam2h6yj1kjZB4eWfE6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cARZK30U; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cARZK30U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729059606; x=1760595606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qaJLAfJ+hrsrmwGpkbpiwW/a3cmep1qGh4KcmkUooaY=;
  b=cARZK30UzojA8Xr4PnCcAqIptt8DOmoyFhPc+q0SW36horY8KZXdRhA7
   mFq5fW4+G+2VtOQsrDkdXB9ACFU/HWZZrfoF1s6rr069JL2tyrQVV68WK
   IsAKeGCZou3lBsIE88BNQnejpofE+51e+o66A6jhQffnBmkZp+7JmLXuS
   uG/Cb7NEMeivwa/6HwH6O8i4KTXTaDep6Ot4XWAo8e0iIMCXYHMnAEfeh
   RTmG71HE9iU3gTbc1a/J6GCoC5Szz9KVY/7WDByKCRoXAOpjtyI5hpEKA
   yTNuZ/0kNjxHyh7bYcNwKmQwH6KfUcfmhWCkXxGbv90Z8mw1xGgOwbZqP
   g==;
X-CSE-ConnectionGUID: W3sS2AZ7QpCClu8ml1WCDA==
X-CSE-MsgGUID: Oo7TpiZxSzuzlzGAsVvk6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="31359194"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="31359194"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 23:20:06 -0700
X-CSE-ConnectionGUID: Qz2YFxCPRX+DL4A1Q90/JA==
X-CSE-MsgGUID: pir6H9ovQH2NODdk0aN8xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78295490"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Oct 2024 23:20:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0xO2-000KRU-0W;
	Wed, 16 Oct 2024 06:19:58 +0000
Date: Wed, 16 Oct 2024 14:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
	mpe@ellerman.id.au, linux-arm-kernel@lists.infradead.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	pierre.gondois@arm.com, dietmar.eggemann@arm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, morten.rasmussen@arm.com,
	msuchanek@suse.de, gregkh@linuxfoundation.org, rafael@kernel.org,
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
	linuxarm@huawei.com, yangyicong@hisilicon.com, xuwei5@huawei.com,
	guohanjun@huawei.com
Subject: Re: [PATCH v6 2/4] arch_topology: Support SMT control for OF based
 system
Message-ID: <202410161302.HjmSau6j-lkp@intel.com>
References: <20241015021841.35713-3-yangyicong@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015021841.35713-3-yangyicong@huawei.com>

Hi Yicong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on powerpc/next powerpc/fixes driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master tip/x86/core v6.12-rc3 next-20241015]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yicong-Yang/cpu-SMT-Provide-a-default-topology_is_primary_thread/20241015-102147
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20241015021841.35713-3-yangyicong%40huawei.com
patch subject: [PATCH v6 2/4] arch_topology: Support SMT control for OF based system
config: arm-defconfig (https://download.01.org/0day-ci/archive/20241016/202410161302.HjmSau6j-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161302.HjmSau6j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161302.HjmSau6j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/arch_topology.c:32:21: warning: unused variable 'max_smt_thread_num' [-Wunused-variable]
   static unsigned int max_smt_thread_num;
                       ^
   1 warning generated.


vim +/max_smt_thread_num +32 drivers/base/arch_topology.c

    28	
    29	static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
    30	static struct cpumask scale_freq_counters_mask;
    31	static bool scale_freq_invariant;
  > 32	static unsigned int max_smt_thread_num;
    33	DEFINE_PER_CPU(unsigned long, capacity_freq_ref) = 1;
    34	EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
