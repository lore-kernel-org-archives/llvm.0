Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56B4194C7D;
	Sun, 20 Oct 2024 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729454000; cv=none; b=uUmfiWWdulX5z88d5NyBah9nDVhB6NsFToJnbfA4jQaMPSFyO0hG3ff7cwuaZKVtVQ+o7ABLdqLdzeXMfyRahjRDI4KSUDT5GVV0Mu5qbCbZyZhA6PaF8TyyM8UVOcV3KQu84j7u3cq45OC/zyI33knTuRTF+6MAd3JdETboRX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729454000; c=relaxed/simple;
	bh=NUl5wLKfXrlmAITdUKRsm1jobjctTNRygTvb2ezjcr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuqVr6QTnWdgerOb0kJuq7Mp2DnfSNy8tx4tU7qp4SEOtghbjWAF2bqOJQks2x2HkhiJYana0h9BwDb/Bvds5H7sV5bP3dBKL3lHgM11Db21gR/KijITcryTFcaq2akaz98B3cIPkASMp2Ldt+vRM5r/QYwNrxb8S8ujfQtZx4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zb50/3Q+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zb50/3Q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729453999; x=1760989999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NUl5wLKfXrlmAITdUKRsm1jobjctTNRygTvb2ezjcr4=;
  b=Zb50/3Q+xQ9dioyQnBdpdIQDVXy6kPlFfDtVSgGaFbFB+rLgPGskZEnP
   ODhCFAN6pg6LTofokMnjMPeVKEREWn5gLnmhuhCjhqeuaSc/Jp6yp3LKY
   IJ1D+SJmqeNGN/KPyNcg4evsFV2BRkky8glCBLY6j8bc6Q7ZzgVVGcCP9
   vftvLrBEQLThqgIjFHa7u1yctKVmntZfBPNZSO+TxGswtvOMM7gv3t5/+
   SypeR3UmHr+uQBfyNPA0v66MIdvNuUqL5EVSFZ+yAbrJtDmRcFx9NadXi
   BbFFHKCGHr5+NNd+zFtsdC2sj9QGrPEgQpNvwwa/pp+6IrX5ZTu2Om3vp
   w==;
X-CSE-ConnectionGUID: PpkVK4EJSn+avqmWjDz4xQ==
X-CSE-MsgGUID: E70oA+OuT8Ox01ZRkyDWBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="16557547"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="16557547"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 12:53:18 -0700
X-CSE-ConnectionGUID: Tc2MKGXrSiunSGsS93Nz/w==
X-CSE-MsgGUID: uK0e0n9VTDK3tsFpNpMgHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="78989802"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Oct 2024 12:53:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2bzC-000Qkv-01;
	Sun, 20 Oct 2024 19:53:10 +0000
Date: Mon, 21 Oct 2024 03:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Shivendra Pratap <quic_spratap@quicinc.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: Add PSCI SYSTEM_RESET2 types
 for sa8775p-ride
Message-ID: <202410210333.KGHmzwGN-lkp@intel.com>
References: <20241018-arm-psci-system_reset2-vendor-reboots-v6-5-50cbe88b0a24@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-arm-psci-system_reset2-vendor-reboots-v6-5-50cbe88b0a24@quicinc.com>

Hi Elliot,

kernel test robot noticed the following build errors:

[auto build test ERROR on 98f7e32f20d28ec452afb208f9cffc08448a2652]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/dt-bindings-power-reset-Convert-mode-properties-to-array/20241019-034308
base:   98f7e32f20d28ec452afb208f9cffc08448a2652
patch link:    https://lore.kernel.org/r/20241018-arm-psci-system_reset2-vendor-reboots-v6-5-50cbe88b0a24%40quicinc.com
patch subject: [PATCH v6 5/5] arm64: dts: qcom: Add PSCI SYSTEM_RESET2 types for sa8775p-ride
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241021/202410210333.KGHmzwGN-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210333.KGHmzwGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210333.KGHmzwGN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi:504.12-13 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
