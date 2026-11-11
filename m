Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382996;
	b=FoT/neP1x6wfr71VMSh+5tji05OV7loUtYkNT9VWqzwU1qeywj72Fck01gpFT2XKuOba
	 D7POhFvGaVlIlvE6EfCs+3WRUK4AHVr98z+jOTrsQ5rCqwfpgivhbwDWoeTCqnNX3NRrX
	 SQBZBiwTyUbReIBjEPerV0eSyc6JRbDcsk37eSoW0zE7c9FqafLn3EI/sN0P+7dmRzQ4d
	 OAmGZeJt7+oaFz8oVnv3UbJdHFr/78L2bK/CRTxfg4nAFgqAEF6tUCSH/xz5hY0wb4rpQ
	 3hZTpVFEbjK+qjZQ3GEH83QwjTSbw1OBdKZi+tXKMeWuE5NIV9MV/XKj/leXUjjCKlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382996;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=VZTMpSWIpIjImonIQn6KcE+nvjBN6poZUb+bi9vRUPo=;
	b=YgrB12RG8RgjooxIdJxQXpNbgBzeCRvIWGR5nBVLDvP0kAcO8fQw9BPDQng/2yvu+5e5
	 YHpvKBPg1TTWQ8mfEcmSslY0HfV8QHrVJnAIb8dPmnbvq70rPWhNAApjVaFbECmfhNw9T
	 5MqdpQsggXjR08qxig7wRMuE3VGMx2q3up79pXWYkqiN2JASja0fGpSBC6rA/rOYmcJdZ
	 7ArSNrSiUb6hM+9fJ5Pc6zp9Yfx4j3RBPHZv5wSzjbBzuhWCVY5lkN2v+klsPTkWoAHNw
	 lm86/Qw7cZ8xnSdIKdK6CYPVttqOmGX8u/nT3U0eB15ctPvLZlk0lUVTHdya+bJVnYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cr3jMx5B;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4A0606A321;
	Wed, 11 Nov 2026 07:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE4A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cr3jMx5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794382996; x=1825918996;
  h=date:from:to:cc:subject:message-id;
  bh=XX1N3E/ZWKdPHkSCl8L4xxtiklkcdAZMjY08QA93Rog=;
  b=cr3jMx5BIQdzmQ6bTC2/GKjGY1FpXAi1sCgoaaWISmFSYLkwqzKcklJl
   FTAeh+InhC3VSIbSpq5GiOeu8VPk8JUwuqOORSVreEA0qnGFTkj/PgCnc
   FgvD1w38nmC4lIO9/QpJ+Z/GSUXp2OSR5HpDDeq7DHykzLHwbhganiBGP
   xtMV1Jv2IFs1qUKjW/HP3DoRKzntAPaO5lEIwTgNTzAJXnfeGRPK+rWxo
   lTS4neRl/vergV40GzD8UAWPa0RfMRJRIWX5tOHI7y8eEDHzaSAK7XjEH
   QIjxzbQdEA6mu+WTVVQsai7lF0pkUa+Oe1DEeIGRdBmBFDjDLSHkvdABh
   g==;
X-CSE-ConnectionGUID: IA8sFacpS6CzmRwZ3h/Mdg==
X-CSE-MsgGUID: luyaY7ERQ/WUj/j7WvBXow==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3043619"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3043619"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 23:43:15 -0800
X-CSE-ConnectionGUID: /8qNVijyQdyw44K6s57dhQ==
X-CSE-MsgGUID: cK31BwuyTJeTl4z5zNcUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8924528"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 10 Nov 2026 23:43:14 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR2zA-000000000XL-047l;
	Wed, 11 Nov 2026 07:43:12 +0000
Date: Wed, 11 Nov 2026 08:43:00 +0100
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Steven Rostedt <rostedt@goodmis.org>
Subject: [kees:for-next/kspp 1/1] WARNING: modpost: vmlinux: section
 mismatch in reference: seq_buf_terminate+0x1ac (section: .text) ->
 bootup_event_seq (section: .init.data)
Message-ID: <202611110802.zPIiPSnJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
head:   7b8cd26b6aab8cf147165610d13964f79200a5a7
commit: 7b8cd26b6aab8cf147165610d13964f79200a5a7 [1/1] seq_buf: Mark a seq_buf overflowed when terminating it loses a byte
config: arm-randconfig-2001-20261111 (https://download.01.org/0day-ci/archive/20261111/202611110802.zPIiPSnJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110802.zPIiPSnJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611110802.zPIiPSnJ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x1ac (section: .text) -> bootup_event_seq (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
