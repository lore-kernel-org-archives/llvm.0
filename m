Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66E0205159;
	Wed, 16 Oct 2024 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070767; cv=none; b=VphtPo6aSthqDz2RNbY01IG77P1O7YRPBbSB/j3UuIRQXCUgnlikq8XYsPN4I/GBSmMcA79kbvXBkv13ebqxtp0XX8GvQDA7QusHbYzrilaUU0GCoeYciGRa6E/8ZMA3M+8Io9/SXibk0tMsYH4x2g9MCaOWu2y9V7KD9IfjUpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070767; c=relaxed/simple;
	bh=28jnTv6h6STCAqyWBuF8qBfgOMArQniaHVUl7pMjaZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4v5v9YLLHTeE6kLUFN/GpMfpspYoCDVhbxqm3ixEMNgYkFtwG9kn/TOE+xR6RWbl+xGoxGnc8xFtG54DJbLO26tPdr0nk95vEDFYFYMzQbvzYQftWDewqdpuB+ckuUT0QiIb0ubIxNKd1EJM55hrgEkTKWu0wLejLugFJ4Jh0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbFKdhAD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbFKdhAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729070765; x=1760606765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=28jnTv6h6STCAqyWBuF8qBfgOMArQniaHVUl7pMjaZ0=;
  b=RbFKdhADhG68f4TyJh3l9FtMfweckGuXg4k1yHB6yCGYMjfru73+66KQ
   PMligZ8SWxL+9IC3U2PCUoHqe/fcAEoYEr5nazP0I/dU0MmVKzszPsZXf
   vPhaCRavbVGEEYTBoraK4sjfOMGukGgGU067mfDiM03z87urqbjBs9iWA
   dEc9aiRHB2XJ0mRtux4tXPO3FCWUjHbwSUnRFZ8jrQ6f9U2iLwqxctWyb
   RuPgHNgNaA2YmWo43Hxxt1tryrWIJjd34ssL8xsH4lmeQbD+jY9xRg0b3
   irfOqoduZcth5huyxIwJdmpHDi9GOoroF3G8h834kVxk7Zwv0hfWJgaC3
   w==;
X-CSE-ConnectionGUID: rAQLNJVHTNqnWjlOWUWeQw==
X-CSE-MsgGUID: 5vsSBvjxRHWA6kHlNyosWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28604941"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28604941"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 02:26:05 -0700
X-CSE-ConnectionGUID: bOwObLaaTh2XgLJHc2Rc7w==
X-CSE-MsgGUID: zhC20fwSRwKp8db5a/W28Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="77790496"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Oct 2024 02:26:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t10I4-000KgX-0k;
	Wed, 16 Oct 2024 09:26:00 +0000
Date: Wed, 16 Oct 2024 17:25:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rakesh Kota <quic_kotarake@quicinc.com>, dmitry.baryshkov@linaro.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	quic_kamalw@quicinc.com, quic_jprakash@quicinc.com,
	quic_kotarake@quicinc.com
Subject: Re: [PATCH V2] arm64: dts: qcom: qcm6490-idp: Allow UFS regulators
 load/mode setting
Message-ID: <202410161736.XEEYKM7A-lkp@intel.com>
References: <20241015132049.2037500-1-quic_kotarake@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015132049.2037500-1-quic_kotarake@quicinc.com>

Hi Rakesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.12-rc3 next-20241016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rakesh-Kota/arm64-dts-qcom-qcm6490-idp-Allow-UFS-regulators-load-mode-setting/20241015-212708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241015132049.2037500-1-quic_kotarake%40quicinc.com
patch subject: [PATCH V2] arm64: dts: qcom: qcm6490-idp: Allow UFS regulators load/mode setting
config: arm64-randconfig-001-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161736.XEEYKM7A-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161736.XEEYKM7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161736.XEEYKM7A-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/qcm6490-idp.dts:287.4-5 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
