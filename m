Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F6A2C21F3;
	Sat, 20 Dec 2025 14:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241977; cv=none; b=QBQqmwIYC/JEH0CbNQeGImahBgywfQqHWgIAqRyy4ed6ukOOYYDqVRHjlRxiscO13U9IUjchbEckUu+lY9T2E+MRZeMredkBcBSTXsUxyDF9UPxkaufLGYYI1m2TKnzKeP05fLw53ybKK1pW3KIjNnUDPc60h8rl1O1pD1iDb+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241977; c=relaxed/simple;
	bh=Sh166ntz5rUnO0QqtQM2PhUjdar0m+HmAZuQ8M7NTHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8wKIl4kQfiQwEg7vMqU7Ykt8cgQXGAWtxewVjReh5Fr87idiRnOe+fw46SnecIADoGmFhCLvD/OxQbUrjE2eLBnLJ+bHXKVJdN5XXKUcA6mQF6VWWZFAvEFDDWYsHEBTf65Tyuo29/dCZvO8TD1eJEVdXNy2keqH1n9LD5s1Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxj7JYZa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxj7JYZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241976; x=1797777976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sh166ntz5rUnO0QqtQM2PhUjdar0m+HmAZuQ8M7NTHo=;
  b=dxj7JYZafPbzl6EZBA1+iprT8hlDVkyJ6Ox2TjaM7UGOhB/IxKT2b9E0
   4YDJsxH6V4QN1uN8uoAZ9bv3ZmJLLs+9CWFov0KLkkNvz0t8AZrOwrpIs
   KHT6f7EbYvXGIvtQqu3hjvHRuB1LxXQHApaKSXXZAQ9vy/kQSCDcRCqwM
   Uch+aGjemDTSuzkTRiridrdbAuClXeneO4UMB6a5tYGcQIR7eQSFlSB0/
   YroOlOAejsVo2IecDFMXjQZjOR8K071JEEboOAhwP9b8sPrfGPrRfAw7g
   TMiQU1D/ZzQ14+Ue8ZwLFPHJKewVRwaW11pRic/DT/o9t/HMVx4dukfm1
   g==;
X-CSE-ConnectionGUID: dwPUetPZQ3eXVpBVRMBTyA==
X-CSE-MsgGUID: svfnR70aTz2DFs9cvf+IzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79294965"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79294965"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:46:13 -0800
X-CSE-ConnectionGUID: qST79o8tRVq3wUI3/L9HPg==
X-CSE-MsgGUID: CPf3Jy+CQtSgq0SCXgTvTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199986988"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 06:46:09 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyDf-000000004fw-1k3D;
	Sat, 20 Dec 2025 14:46:07 +0000
Date: Sat, 20 Dec 2025 22:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v9 07/14] soc: qcom: mdtloader: Remove
 qcom_mdt_pas_init() from exported symbols
Message-ID: <202512202208.yMbtQrgo-lkp@intel.com>
References: <20251217-kvm_rproc_v9-v9-7-ab7ac03e0ff1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-kvm_rproc_v9-v9-7-ab7ac03e0ff1@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 563c8dd425b59e44470e28519107b1efc99f4c7b]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/dt-bindings-remoteproc-qcom-pas-Add-iommus-property/20251218-010100
base:   563c8dd425b59e44470e28519107b1efc99f4c7b
patch link:    https://lore.kernel.org/r/20251217-kvm_rproc_v9-v9-7-ab7ac03e0ff1%40oss.qualcomm.com
patch subject: [PATCH v9 07/14] soc: qcom: mdtloader: Remove qcom_mdt_pas_init() from exported symbols
config: x86_64-buildonly-randconfig-002-20251220 (https://download.01.org/0day-ci/archive/20251220/202512202208.yMbtQrgo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202208.yMbtQrgo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202208.yMbtQrgo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/soc/qcom/mdt_loader.c:243 expecting prototype for qcom_mdt_pas_init(). Prototype was for __qcom_mdt_pas_init() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
