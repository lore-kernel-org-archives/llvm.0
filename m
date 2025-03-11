Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7201B1C1ADB;
	Tue, 11 Mar 2025 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741684003; cv=none; b=lsw7IgABvQtf8GmMlr1AMxouPUw1twfOSsKVOWCyYKZ05s8HIwN01B9GNdDpbShJS5NheGa9OZvKEbVVmgZZ1JqZei45Y/qifHDB6NLENvQPh3dPjl0BZK6WNrZ3Ku1atOLgVocXQrliaY6oHXsSLJxZgsF8bh1xZbxUqRencoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741684003; c=relaxed/simple;
	bh=Lf1ll/w54v7N4pMRqpFCRX6LM4srEfAQ8cYdNV9dHR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WG7G/aHNj3pNVSGDiatqSHLQKELbpVRIrGFr+hkzfWLevp47fYp5LSe1+YvTsjfpL8AYQeNhbsi+wwfsuUTToEw8s22gFUaA/xv8b1P43SV9nBcJ7k6rKXl41qFGz9eWnNqGqD/a7JZl9c5KvlUU61w28l2lcmiSe1O6FOiQpww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WP6EEr7e; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WP6EEr7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741684002; x=1773220002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lf1ll/w54v7N4pMRqpFCRX6LM4srEfAQ8cYdNV9dHR0=;
  b=WP6EEr7eHHsaozT3dAZ3m0qwlfAjF+STqIQ0w06whU3YLF3ssg6uZoHL
   ujPeNRxsHev1vVPBqvkY1TdT7yC8jfH7qtnz9KoqHxk6rdGQrX3fXoULN
   5WiOipelWLRyJ3s3xIrcBHdv7J5kI5c0TgLwsxFh9vczveyWcPVx2cnsA
   5jfvU3bH6Lgya3nxM6s291goW2jgYRQ4cMQEIc5hz4y0cBWD+VFgM0w2e
   6xsQhp8MnGe0L0p/HKisZfQsxqXL/bRXKeVsfTq4f5J1Ru4ODe/XfeiJW
   IHO8JF8TsTJZpbzSpYVILMtc+Sw3MZaT0RrP9NYvYabRBTuKJ6b2UuQvz
   g==;
X-CSE-ConnectionGUID: 4f4n8fKLT7+/It2qTizwnQ==
X-CSE-MsgGUID: VpUFWoU6TliuKiX3QuhrGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42427737"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="42427737"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 02:06:41 -0700
X-CSE-ConnectionGUID: QYf9xl73QsWOniN1NCeshQ==
X-CSE-MsgGUID: RvshfzS+QI+d6Cp3vR22QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120484207"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Mar 2025 02:06:36 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trvZK-0006Vq-0G;
	Tue, 11 Mar 2025 09:06:34 +0000
Date: Tue, 11 Mar 2025 17:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	kishon@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	abel.vesa@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	quic_ziyuzhan@quicinc.com, quic_qianyu@quicinc.com,
	quic_krichai@quicinc.com, johan+linaro@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: qcs615-ride: Enable PCIe
 interface
Message-ID: <202503111654.Uo5Nw44p-lkp@intel.com>
References: <20250310065613.151598-4-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310065613.151598-4-quic_ziyuzhan@quicinc.com>

Hi Ziyue,

kernel test robot noticed the following build errors:

[auto build test ERROR on c674aa7c289e51659e40dda0f954886ef7f80042]

url:    https://github.com/intel-lab-lkp/linux/commits/Ziyue-Zhang/dt-bindings-PCI-qcom-Document-the-QCS615-PCIe-Controller/20250310-145902
base:   c674aa7c289e51659e40dda0f954886ef7f80042
patch link:    https://lore.kernel.org/r/20250310065613.151598-4-quic_ziyuzhan%40quicinc.com
patch subject: [PATCH v3 3/4] arm64: dts: qcom: qcs615-ride: Enable PCIe interface
config: arm64-randconfig-003-20250311 (https://download.01.org/0day-ci/archive/20250311/202503111654.Uo5Nw44p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503111654.Uo5Nw44p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503111654.Uo5Nw44p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/qcs8300-ride.dts:288.1-6 Label or path pcie not found
>> Error: arch/arm64/boot/dts/qcom/qcs8300-ride.dts:298.1-10 Label or path pcie_phy not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
