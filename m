Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D96D18B462;
	Fri, 22 Nov 2024 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732264994; cv=none; b=Lf9ZJOB5o/DWx2iUqUUzVr2QGAqCL1MFNJPV6Pr1Vbsa9q/mw/BxI1KHQR6M2lR+lvOkE1HkMja058E5TNI2MDBSXTh2U8hzP9iiJDa37VcDG/Bbos11jrhwUBGTnMY8hqIBZmgRcZ2el4s8aE3BzRC7UyARt5GuKLF+XSHCgAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732264994; c=relaxed/simple;
	bh=P68aeh3TcVBeafEDkBgbtLr5at3kUvBlctQM9B64INo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtsWO2kA2q5qTh81jSVFal6bqXMOtpsU+IDWcmakRI65zTIpVef92g55OsMBy0ZHD2IZZc5eTnjGrHkk+VcGm6s7YffO+kJssW2+O/qdZ5YuNGtUVn705amMF5Fm4dk1xzxEThvyqjm1gsifAkrjNMXNjIX+l3Abe/gGWdXHYwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRURp823; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRURp823"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732264993; x=1763800993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P68aeh3TcVBeafEDkBgbtLr5at3kUvBlctQM9B64INo=;
  b=fRURp823/vsg89/N1/59IJr22c/3E7LTOljIb3If1xs9GxZHu8/Q+STL
   LtyArN091u1vW/XiL5x6KpvZmKOCgM50qR4txzOu3K+WnQGQ+W23Blgaa
   CsiRvSeSWSM0IDCg3ayU8jcKLO/LkDXpaZncw1JAa5m+TV9aCQ6iPnCrF
   74BUk1GHsApJ0zxz34C7O/PxfHwTipj38ZpTlUdF8BjuSGqM2e48QlmKK
   csDJLJ5k7gOzasQ2srQpz0LeKaW3Iwvf/VoIdrRn5dyfkma30FD1fp0I6
   8qTtU5aWjtxqUbDeSHZr7Kp4khkN0wdU7mJmE+RiBi2jM+VYKsugEdtRx
   Q==;
X-CSE-ConnectionGUID: Q3M0uYdEQwizd1A83zseDA==
X-CSE-MsgGUID: ZNSdu5Y6RvK+mNfIGiSF6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43479434"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="43479434"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 00:43:08 -0800
X-CSE-ConnectionGUID: d3+K4gt2R1OCzu6OIXkbOw==
X-CSE-MsgGUID: P6LLq6iIT+Kyy3L4HHzRVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="128030479"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Nov 2024 00:43:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEPFl-0003n5-27;
	Fri, 22 Nov 2024 08:43:01 +0000
Date: Fri, 22 Nov 2024 16:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Odelu Kukatla <quic_okukatla@quicinc.com>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: sdx75: Drop QP0 related
 interconnect and BCM nodes
Message-ID: <202411221619.zJpjlWkH-lkp@intel.com>
References: <20241121172737.255-3-quic_rlaggysh@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121172737.255-3-quic_rlaggysh@quicinc.com>

Hi Raviteja,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.12 next-20241121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raviteja-Laggyshetty/dt-bindings-interconnect-qcom-drop-QPIC_CORE-IDs/20241122-013857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241121172737.255-3-quic_rlaggysh%40quicinc.com
patch subject: [PATCH 2/2] interconnect: qcom: sdx75: Drop QP0 related interconnect and BCM nodes
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241122/202411221619.zJpjlWkH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411221619.zJpjlWkH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221619.zJpjlWkH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/interconnect/qcom/sdx75.c:878:3: error: use of undeclared identifier 'bcm_qp0'; did you mean 'bcm_qup0'?
     878 |         &bcm_qp0,
         |          ^~~~~~~
         |          bcm_qup0
   drivers/interconnect/qcom/sdx75.c:817:28: note: 'bcm_qup0' declared here
     817 | static struct qcom_icc_bcm bcm_qup0 = {
         |                            ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +878 drivers/interconnect/qcom/sdx75.c

3642b4e5cbfe48 Rohit Agarwal 2023-09-13  876  
3642b4e5cbfe48 Rohit Agarwal 2023-09-13  877  static struct qcom_icc_bcm * const clk_virt_bcms[] = {
3642b4e5cbfe48 Rohit Agarwal 2023-09-13 @878  	&bcm_qp0,
3642b4e5cbfe48 Rohit Agarwal 2023-09-13  879  	&bcm_qup0,
3642b4e5cbfe48 Rohit Agarwal 2023-09-13  880  };
3642b4e5cbfe48 Rohit Agarwal 2023-09-13  881  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
