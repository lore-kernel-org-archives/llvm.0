Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F6C175A92;
	Sat,  2 May 2026 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777718885; cv=none; b=cU6sd/xveIP+aO5M8JaEeWFzC/2wk8krMgxu1AExQJuhoi8XK1QJmB9Fa/YxMhvjePwFlTjgEaznZ3BhNG9R4WI3g0BhNL7xlxebLrgeLt6ydHAKNRhpT5dt0X6dAVJt+lXzfTVHFFlUcxwXGCND8Bt2/mA5FHyaR6mS1rlMOvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777718885; c=relaxed/simple;
	bh=fpqigbgkS0SPBw4UeIzdMdZdcX908q58xiLRu1dIixk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mGKEBUo3kllV+4zIw+/KZZjymFPl4E/MAtA1jOrBhakB/Y9nmH8U+GLL5B+GsdVvb/JMUYWGqXkqTmGk9Cpk38MMr2DGFfJ0q8IDLCni6QL1bdYUoDDbhA4HwbX1TUurrsNQJi82nZOIdX5NhS5fVM+ViQzJ8cSACEFyhNIc+lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwjKyGfX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwjKyGfX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777718884; x=1809254884;
  h=date:from:to:cc:subject:message-id;
  bh=fpqigbgkS0SPBw4UeIzdMdZdcX908q58xiLRu1dIixk=;
  b=YwjKyGfXkrXbgZT55nwgftEbp56BjgETAimmpBgvCRxNQwpV8w2qXg3g
   spPbJ6F259T/VXNxzfQcSSwA/iMHhM6kcMXXri0iMtCCCdgvT8c6rdXt5
   m4cD2QoVh1TNNti5lz4cgLJ/w3tvZtseK8ASYmoODUmtNW9vIPKBnq2fO
   /FR9jGFC8S75ZUCw6HYvWsJNF3OzeuJisoXSz9jUzS0SsilCfkwpO5lU3
   UCKjl+UXEQ2PgSoIpId/gphZJ6Ndb2lrWkV1OAS2VNhpB0zw6BdVUmjZW
   OUkHOSWBOZGEUqaGq+3VKld54LfnxArDCfFyfOE6g062k0so+8LNrxj91
   Q==;
X-CSE-ConnectionGUID: 0C6uXktYTYSmK2tSdo9Jww==
X-CSE-MsgGUID: oW63thoIR3+Wjs8avbXLDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="101327152"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="101327152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 03:48:03 -0700
X-CSE-ConnectionGUID: ilKRjURFQ/ad71WHL8pt2g==
X-CSE-MsgGUID: avW4WgfXRj61YSFFICUEWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="273177718"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2026 03:48:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ7t9-000000005FN-1Bi4;
	Sat, 02 May 2026 10:47:59 +0000
Date: Sat, 02 May 2026 12:47:35 +0200
From: kernel test robot <lkp@intel.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: fs/nfs/pagelist.c:443 function parameter 'pinned'
 not described in 'nfs_page_create_from_page'
Message-ID: <202605021240.srZJcEWh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pranjal-Shrivastava/sunrpc-add-supports_p2pdma-to-rpc_xprt_ops/20260420-213800
head:   76cd975286d7c4db4dd0f8ef2df4f11e55ce6a84
commit: f7cdf563cad207c4c76179bcc2f2c161e4b18924 nfs: make nfs_page pin-aware
date:   12 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260502/202605021240.srZJcEWh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021240.srZJcEWh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021240.srZJcEWh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfs/pagelist.c:443 function parameter 'pinned' not described in 'nfs_page_create_from_page'
>> Warning: fs/nfs/pagelist.c:443 function parameter 'pinned' not described in 'nfs_page_create_from_page'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
