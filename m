Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471B3CAA55;
	Tue, 14 Jul 2026 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784052816; cv=none; b=bD7iGBZ78eT0tt9ykeMQCRdiZqx//p6+CJTAXZWCpS4daGKDrDSvxtr53o3aLjhgEqDOX495zzJynGZIHX+HMD0a1bxcsxLrkG/+JfMSeff54lhWBigQ6eLJyNriTZM01F7zcNfrmygAuO60fyNdM94PJbtR23O2VL4eMJNNgsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784052816; c=relaxed/simple;
	bh=Lx1o7Q+i4ANxy3I6bGs9AmvUdkZrwxDXd/bpIBSPcJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HN6SjaaTlLfwuPhL+JFvuvfwytyej985SWmeSuFtOWl8tjnqXvpTa7aliJyun58G5iZmNiyFtqJdGbHM3xrdfdJjtPY5N6RbSZ4CK26eEiATqbUV8xZl9EHGu6RGU63PMg9OBzc5EKuA4JNK8ZcsRFPnI9FCklM7VcbbNd+feDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlMqFOqC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlMqFOqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784052815; x=1815588815;
  h=date:from:to:cc:subject:message-id;
  bh=Lx1o7Q+i4ANxy3I6bGs9AmvUdkZrwxDXd/bpIBSPcJ4=;
  b=jlMqFOqCfslGlWS88GyJzJYvNgmgybILmw3/63Ljc4KTKHz5h6aodHkt
   eXiDnbelW8V46meu93Z1UO7Zuqy7AufhSymLlt1vLUGf/X/pXJuBOxW4K
   RZ7kT6fhtXsSt8mS24nlEMAUYWD29qIFKc4JXR/6MA0tcxPMa1v29dvXS
   psiDl5GNZIXfTWD3p6+rnVCc8JpfwRe9Nj4mAu4Y3T6/Bc60KC8/BsWDy
   HTLbhTq55jQWIr/RsvzN/dol/bHIExY0CQO67rDBALmgl/Gvccxk1exCb
   vEoaLtZa2tnEqoq1ZEcNQaLYpdR5DqmXHFQ1+93lnQ0juMhGuVhUJgGqb
   Q==;
X-CSE-ConnectionGUID: xKjco98kQfuktZqfcFEWVw==
X-CSE-MsgGUID: u+DKBmCcREaMBFSQCZg3Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88583129"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="88583129"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 11:13:34 -0700
X-CSE-ConnectionGUID: wUOELGB2Te63y6bdZI4TFw==
X-CSE-MsgGUID: Se4HhsAYT02lsK6EmjVmTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="257882990"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 14 Jul 2026 11:13:33 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjhdL-0000000043J-1JbH;
	Tue, 14 Jul 2026 18:13:31 +0000
Date: Tue, 14 Jul 2026 20:13:18 +0200
From: kernel test robot <lkp@intel.com>
To: Nilesh Javali <njavali@marvell.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Hannes Reinecke <hare@kernel.org>
Subject: Warning: drivers/scsi/qla2xxx/qla_isr.c:3704 function
 parameter 'data_sz' not described in 'qla2x00_status_cont_entry'
Message-ID: <202607142020.gqDaApes-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nilesh-Javali/scsi-qla2xxx-Add-29xx-series-PCI-device-ID-support/20260714-180455
head:   a91be341107d322b5c157a8eb685f7d8d4d9277b
commit: 26bf5958db611d99ef47410069e01e1e5dea7681 scsi: qla2xxx: Handle sts_cont_entry_ext_t for 29xx adapters
date:   8 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260714/202607142020.gqDaApes-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607142020.gqDaApes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607142020.gqDaApes-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/qla2xxx/qla_isr.c:3704 function parameter 'data_sz' not described in 'qla2x00_status_cont_entry'
   Warning: drivers/scsi/qla2xxx/qla_isr.c:3908 function parameter 'rsp_q_in' not described in 'qla_chk_cont_iocb_avail'
>> Warning: drivers/scsi/qla2xxx/qla_isr.c:3704 function parameter 'data_sz' not described in 'qla2x00_status_cont_entry'
   Warning: drivers/scsi/qla2xxx/qla_isr.c:3908 function parameter 'rsp_q_in' not described in 'qla_chk_cont_iocb_avail'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
