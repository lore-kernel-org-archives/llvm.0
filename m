Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B07270830;
	Tue, 23 Jun 2026 04:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782188358; cv=none; b=aAGv+NC4rIqS917zKBl4+fDDn2lxFFyhzHYTAmgzqrCCeT1JUVvObdtyRW2fx8dWrivq3LGfD/mLMw2XgnhJCfsIqrDDR8aIb6qNiCb0+z4tKGOFmJM7pXIAcx1abdFsiUDFvlnyadDqbz9N9l9U16X2qAMqEF+ndoSUoyo2lX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782188358; c=relaxed/simple;
	bh=JZxlU+SsezeJZMNFG7N5q8fd2VTqBR480bo0n47quPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t0ZIBo0YTz463tSG9fMg6a0kQAuTxcFP9RooMrwn1SwDAReUiXO8GP6F+NSvqv2oWIxpYULJeWnGFiBl055obF/veCyq+cCVjeMDRtCFQxsQ9p6jVrR/tssXTSnslHOSEqF1jrpCboGDH0kIY//f0rklgIRbJPBZIgOJUz8PuAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GxlquVAH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxlquVAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782188356; x=1813724356;
  h=date:from:to:cc:subject:message-id;
  bh=JZxlU+SsezeJZMNFG7N5q8fd2VTqBR480bo0n47quPk=;
  b=GxlquVAHkPbjaSNN4j93ayp5rWKpR4pbRK9GFmorUsP9T25+GnGiIivG
   wA+mvWxECe6r/s7hoho76pqc8pw3zGWLrkAn0FMQpW+i2ptSE72YfeDaq
   6PIGykTCDHo+q8ElDzg5ixOf8ocPx3ejf3ZolKiPFx/G2QE4TWI7wmXfw
   tmzYq2rlpVeRhm2vk801LpQBiNOKq/2JZWAIMZqG0L8zmXGoQ6HOLkBRB
   50qrqp2bjvrQo1+4uiBV4lhBU01GpwBKL7QpdRl2FytfTK3jv/XQX5oie
   cxnN5ucII63MHdiQ9VFpg9mrdRqVv6XHpHA1cjFqfRyGAYDaDOUn8ufU5
   w==;
X-CSE-ConnectionGUID: /FMQ3X+DSDStVbjWjQn1yg==
X-CSE-MsgGUID: BXAmH3dBRKmdehoR7LnLrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="105717071"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="105717071"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 21:19:15 -0700
X-CSE-ConnectionGUID: J48oCKprS2S2C4tSw9FO5Q==
X-CSE-MsgGUID: Rn6fMDdISiGvjRG9K0tqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="279585961"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Jun 2026 21:19:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbsbP-000000002FF-15er;
	Tue, 23 Jun 2026 04:19:11 +0000
Date: Tue, 23 Jun 2026 12:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 14744/14955] ERROR: modpost:
 "__hexagon_moddi3" [fs/smb/server/ksmbd.ko] undefined!
Message-ID: <202606231232.Q1v04anI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   948efecf22e49aa4bf55bb73ec79a0ddcfd38571
commit: 64ab25180b27fff29912cbf1728bd1ce46119156 [14744/14955] ksmbd: return requested create allocation size
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606231232.Q1v04anI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231232.Q1v04anI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231232.Q1v04anI-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__hexagon_moddi3" [fs/smb/server/ksmbd.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
