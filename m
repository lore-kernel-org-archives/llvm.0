Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794746202;
	b=wdhuwPg5u0iNkGswsMn71B5bG/67r846p6Um9wLoAEGvgwNrziZBVSLPXW/ZZb/SIf08
	 QbdBzV4/o3qNvkNbOYB7URSGp+kjdhhC8qKsooYmt1wLxR+/bqm8OeP/ZvaLAU48ary5T
	 4FtWZLq8pFkAAGbhC6eNLMTzS8DWevDBhY8TV4aSZJcF+OFuKtckn08hcEdNrFB//oMsU
	 nBPRsP/6u7woxSx9gVK4Tju+P0OritK2g8cm14MpkeLmt6Xz2QwloCHT7bPfCBnkSqv2x
	 Exujbn9te9gtphx5IiNSEZs6Yu2wsJH9Kk7LuQQNIVxjZX4/Ls3gRCVWWLlxP9navFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794746202;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CUXzAClohS4gZDLkyAO1P6r4f8IwXQ7NyaGsuPtk+zk=;
	b=IEAz36nAzl8+WyrOqOGqkLqStiWKHn+aREsj+jlfwFdQT7PlIKGX96ZOzbKrzIPvQM5B
	 AUAZCAMoadnpuD19NHQ7MZaz/uIWFV2MKnPnxwzZ11TPfgm6wHxj4/vznJv1jjTe4cDsL
	 VYQhFqBXiPiHbwdaWGypQ07i0mhgHMId0+BmTEmfWPqn2ucF0q5E+v6+e6z+on7uwOZGR
	 0PEM0QxivlSJ3WnF+lMAvR+XhB7ZgpwLAwn4nIbgeTpd6X+2D1EZWLJSY6j7Ibuh+NMkB
	 2cxgem093zZuqVbL1S6J43JB/e+sMJH4X13wik6uS7qfgFCiU1y/xFpt6+uZzuRj33w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="mOpF62/R";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE30606A32E;
	Sun, 15 Nov 2026 12:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE30606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mOpF62/R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794746201; x=1826282201;
  h=date:from:to:cc:subject:message-id;
  bh=He8fsfNVZP2bl/lUsH4P1NgWF5WYMoGd6TsyLJfC5pg=;
  b=mOpF62/R7ZnUFquMOJg7K1Psr2sjmbZQbBjXx9GcH64QJWK6dwDsuIDU
   UpmTn3PIClR2Wz75UtOlwbX6wWem1JHhJ85qyjsp0h5o0wcSP4DuBpvkP
   vSbAmNsUyK8aM2Kccmz3wrVcScTvTfWKrRbw/zbHLDakk3PMxvC2rp55t
   LmYOYuA6g0dQqG7jKbDbINPFU7j62vOJpTBU3OWzZCn/O3MKjvTSVOFag
   QSs9P6D2TakVv9CuF6/6xXyu6Tm99AYBt5p5QhBEQGwqTvM7FO9IeucOf
   bTRs96f9HKx5sxAVzM+FdJCHTr6g4u+/SMQOemODFAwdkGXpZdFZ6zGLx
   A==;
X-CSE-ConnectionGUID: jChOq1PpQTaqOlVjLun/IA==
X-CSE-MsgGUID: 0cqW6Wo3QD6u0WDorFHQew==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3413658"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3413658"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 04:36:39 -0800
X-CSE-ConnectionGUID: 9YXbVVHpTZ2t1Z/L0KXRAw==
X-CSE-MsgGUID: fRASeZdiSXKSdDMFPaUGBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="11102660"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 15 Nov 2026 04:36:38 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSZTH-000000016pS-1LgH;
	Sun, 15 Nov 2026 12:36:35 +0000
Date: Sun, 15 Nov 2026 20:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_2 61/68]
 drivers/attestation/providers/sim.c:368:12: warning: stack frame size (1616)
 exceeds limit (1280) in 'attestation_sim_mr_extend'
Message-ID: <202611152010.EoqoqlKR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 8c87940832749279ae0ee5b91b280fff1d951737 [61/68] attestation: Add the simulation family implementation
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261115/202611152010.EoqoqlKR-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5dabc01bba1df10de6fb3c32fcf9db4aafe78f38)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611152010.EoqoqlKR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611152010.EoqoqlKR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/attestation/providers/sim.c:368:12: warning: stack frame size (1616) exceeds limit (1280) in 'attestation_sim_mr_extend' [-Wframe-larger-than]
     368 | static int attestation_sim_mr_extend(struct attestation_dev *att,
         |            ^
   1 warning generated.


vim +/attestation_sim_mr_extend +368 drivers/attestation/providers/sim.c

   367	
 > 368	static int attestation_sim_mr_extend(struct attestation_dev *att,
   369					     unsigned int mr_id,
   370					     const struct ctlv_cursor *mr_options,
   371					     const struct attestation_digest_set *values)
   372	{
   373		struct attestation_digest changed[HASH_ALGO__LAST];
   374		struct attestation_sim *sim = attestation_sim_from_att(att);
   375		DECLARE_BITMAP(extended, HASH_ALGO__LAST) = {};
   376		struct attestation_sim_mr *mr;
   377		unsigned long bank;
   378		size_t index;
   379		int ret;
   380	
   381		ret = attestation_sim_callback_enter(sim, ATTESTATION_SIM_CB_MR_EXTEND);
   382		if (ret)
   383			return ret;
   384		guard(mutex)(&sim->hardware_lock);
   385		if (sim->notification_pending)
   386			return -EAGAIN;
   387		mr = attestation_sim_mr_lookup(sim, mr_id);
   388		if (!mr)
   389			return -ENOENT;
   390		for (index = 0; index < values->values_count; index++) {
   391			const struct attestation_digest *value = &values->values[index];
   392			size_t length = hash_digest_size[value->algorithm];
   393	
   394			for (bank = 0; bank < mr->props.algorithms_count; bank++)
   395				if (mr->values[bank].algorithm == value->algorithm)
   396					break;
   397			if (bank == mr->props.algorithms_count ||
   398			    __test_and_set_bit(bank, extended))
   399				return -EINVAL;
   400			changed[bank].algorithm = value->algorithm;
   401			ret = attestation_sim_digest(value->algorithm,
   402						     mr->values[bank].data, length,
   403						     value->data, length,
   404						     changed[bank].data);
   405			if (ret)
   406				return ret;
   407		}
   408		for_each_set_bit(bank, extended, HASH_ALGO__LAST)
   409			mr->values[bank] = changed[bank];
   410		return 0;
   411	}
   412	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
