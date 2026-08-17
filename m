Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0259732B131;
	Mon, 17 Aug 2026 05:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786945845; cv=none; b=ktKciM3kl4TMnwjdiSZg+d5lD3pzv3wDZlXvuoEhRaoGghxdPVRfdXyYdHyLisJyKnql6b7qbQV7kqWjw1YhpuCXllQzMsIEeah9FB/PS8OBnD0gsXFwAOeOLVkE+CwtK8IiVzZpM9obixkRA1bNNfGyeFQRNFuXM919+UQVt9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786945845; c=relaxed/simple;
	bh=Z6xGjeg51aVSBgLKu3+DxbP17VeZxtjDRxxQWkPCdHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7pIcgXUG/qKN5zOtpDtxM5I6hT66j3QcDTT1592yoBRy9uCFaQDdmGR0ua0xRhMFYhG406vNnXE5+6yHszr4oXkSKMf47fEEaeEh5x1GrhfhmSFbTrk+5/hnvOKeR9CbQ8auheU/EFtjT3796DTB7yrCfVZqOy1flzQ/tf9+JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZuFO2nt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZuFO2nt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786945843; x=1818481843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z6xGjeg51aVSBgLKu3+DxbP17VeZxtjDRxxQWkPCdHk=;
  b=LZuFO2ntj2aO8iR/n7apCidOkTGGnDe5msKHymU2R0YSu+57XlQ2E9yN
   GOkjAoOUK7r41XhLbXj8ariOI0pEDqwoFW/UeKjqICFQWEbGvmy6MgoUD
   09MaD0Gli/SKiqytjYkovXOhXUrjk+tpNtq8O5HJU9/P2MFysVrife48e
   ZDJde9HeVZiPzzpz3cundiCjYz6bpluYCG8a/G4VD6IIlxkCw93AFG/bi
   qqG+NqGTUWJU5/87E6sMCwJzPFo5zHaYZoqRJTR1sQYJxYXgUT4qUsYEe
   Sut+an3zIXAoj995bSRsJwV1353xUHwLExl6QuI5tUvceN3/icOiJRG+u
   g==;
X-CSE-ConnectionGUID: OxJDY158TRW0lPr1GFJVNw==
X-CSE-MsgGUID: A2gn6ffeSM6lETbHNaHuzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="112957398"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="112957398"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 22:50:32 -0700
X-CSE-ConnectionGUID: IZkimFl8Tfe9ag03ddeZ7Q==
X-CSE-MsgGUID: 2ZrNMPsVT5eOBkwuY8cMwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="268664355"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Aug 2026 22:50:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvqEt-00000000dK6-27ij;
	Mon, 17 Aug 2026 05:50:27 +0000
Date: Mon, 17 Aug 2026 13:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH] firmware: qcom: scm: Fix resource cleanup on probe
 failure
Message-ID: <202608171329.vdD9aiQC-lkp@intel.com>
References: <20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.2-rc7]
[cannot apply to next-20260814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/firmware-qcom-scm-Fix-resource-cleanup-on-probe-failure/20260815-220308
base:   linus/master
patch link:    https://lore.kernel.org/r/20260625093644.3918184-1-mukesh.ojha%40oss.qualcomm.com
patch subject: [PATCH] firmware: qcom: scm: Fix resource cleanup on probe failure
config: arm64-randconfig-003-20260817 (https://download.01.org/0day-ci/archive/20260817/202608171329.vdD9aiQC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171329.vdD9aiQC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608171329.vdD9aiQC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/qcom/qcom_tzmem.c:523:2: error: use of undeclared identifier 'qcom_tzmem_using_shm_bridge'
     523 |         qcom_tzmem_using_shm_bridge = false;
         |         ^
   1 error generated.


vim +/qcom_tzmem_using_shm_bridge +523 drivers/firmware/qcom/qcom_tzmem.c

   520	
   521	void qcom_tzmem_disable(struct device *dev)
   522	{
 > 523		qcom_tzmem_using_shm_bridge = false;
   524		qcom_tzmem_dev = NULL;
   525	}
   526	EXPORT_SYMBOL_GPL(qcom_tzmem_disable);
   527	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
