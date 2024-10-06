Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6387B4409;
	Sun,  6 Oct 2024 02:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728180282; cv=none; b=fn55KCaw4/231LKE8rZ1kXoId8OPAruvW7hZ6qc0a9x2fCS6Ka2myhO2vBZ/F9k+srrOsxGwZIIpv2ENURWVHpeKeXHv+c1woKhOgzNm5k8MCG+ALZua+j5wJKfkepxS8tJoJNGOlZHacP8V4Liq03CnGT3q/haGKjA5cfOjic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728180282; c=relaxed/simple;
	bh=udHHGK224Zz/IGn4pIopOCA108KwETBr3JGeTysyrN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Al8EerZTvan3erfrZb2kQZt1rOAaWgaVCU09M9iMBdxRA+SVhvtvwmdkeHLl2Rm/t1KIPo+2EN6I+D1MmifWpnERqXg/GuLMVwC6mwiDbcT5kzkSBHsVzHgRvngYIQZkYZz1xvxnOz45kaZEOxRsY+42OrhV37j0cl11GUFcF80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfLOYmuu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfLOYmuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728180280; x=1759716280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=udHHGK224Zz/IGn4pIopOCA108KwETBr3JGeTysyrN4=;
  b=BfLOYmuu4Rey8ywPXqIlOkh4HfSCmBzKinMSkyxv5bVboU2A9ajgYtkw
   sjGdHwrr622Eu9vNyA6xt7aonYf5YLtgzJrqzGH+BAkn9DGbtRm3wTGQB
   uH8awglf14TVVrVIbrIcOO1hDaiueFaz6FBB5kCy8aOsgY2m+9cKeVMYi
   3t1AIvZt/kSs+hv6Kn2Y0fCfulDHVQOcvScOgSHmhobeuQNGvzZ3xVABp
   HQBp0Co5u4KiLhaUVCVbVMueQDAzv7uKdSzEghk5CSptMND4CDbei6Cv5
   h05eFuGTZWcwXscbznXQ+JvmUrlitgPJFGM9378G5lUxqNwEkWF6MilWv
   Q==;
X-CSE-ConnectionGUID: rzN8DG8kTWWk7uP9eG1Hzw==
X-CSE-MsgGUID: QHgIa7D9T5aJ3xLWFMgDtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="26827143"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="26827143"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 19:04:40 -0700
X-CSE-ConnectionGUID: hvljGW/nQBiRqWhuU6xDcg==
X-CSE-MsgGUID: doHVVU14REmLltlmE52zRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="80056193"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Oct 2024 19:04:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxGdN-0003XI-1t;
	Sun, 06 Oct 2024 02:04:33 +0000
Date: Sun, 6 Oct 2024 10:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>
Subject: Re: [PATCH 2/6] remoteproc: qcom: Add iommu map_unmap helper function
Message-ID: <202410060943.UAdM2uKn-lkp@intel.com>
References: <20241004212359.2263502-3-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004212359.2263502-3-quic_mojha@quicinc.com>

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on robh/for-next linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/dt-bindings-remoteproc-qcom-pas-common-Introduce-iommus-and-qcom-devmem-property/20241005-052733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20241004212359.2263502-3-quic_mojha%40quicinc.com
patch subject: [PATCH 2/6] remoteproc: qcom: Add iommu map_unmap helper function
config: arm-defconfig (https://download.01.org/0day-ci/archive/20241006/202410060943.UAdM2uKn-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060943.UAdM2uKn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060943.UAdM2uKn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/qcom_common.c:645:24: warning: shift count >= width of type [-Wshift-count-overflow]
                   iova |= (sid_def_val << 32);
                                        ^  ~~
   1 warning generated.


vim +645 drivers/remoteproc/qcom_common.c

   611	
   612	/**
   613	 * qcom_map_unmap_carveout() - iommu map and unmap carveout region
   614	 *
   615	 * @rproc:	rproc handle
   616	 * @mem_phys:	starting physical address of carveout region
   617	 * @mem_size:	size of carveout region
   618	 * @map:	if true, map otherwise, unmap
   619	 * @use_sid:	decision to append sid to iova
   620	 * @sid:	SID value
   621	 */
   622	int qcom_map_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t mem_size,
   623				    bool map, bool use_sid, unsigned long sid)
   624	{
   625		unsigned long iova = mem_phys;
   626		unsigned long sid_def_val;
   627		int ret;
   628	
   629		if (!rproc->has_iommu)
   630			return 0;
   631	
   632		if (!rproc->domain)
   633			return -EINVAL;
   634	
   635		/*
   636		 * Remote processor like ADSP supports upto 36 bit device
   637		 * address space and some of its clients like fastrpc uses
   638		 * upper 32-35 bits to keep lower 4 bits of its SID to use
   639		 * larger address space. To keep this consistent across other
   640		 * use cases add remoteproc SID configuration for firmware
   641		 * to IOMMU for carveouts.
   642		 */
   643		if (use_sid && sid) {
   644			sid_def_val = sid & SID_MASK_DEFAULT;
 > 645			iova |= (sid_def_val << 32);
   646		}
   647	
   648		if (map)
   649			ret = iommu_map(rproc->domain, iova, mem_phys, mem_size, IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
   650		else
   651			ret = iommu_unmap(rproc->domain, iova, mem_size);
   652	
   653		if (ret)
   654			dev_err(&rproc->dev, "Unable to %s IOVA Memory, ret: %d\n",
   655				map ? "map" : "unmap", ret);
   656	
   657		return ret;
   658	}
   659	EXPORT_SYMBOL_GPL(qcom_map_unmap_carveout);
   660	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
