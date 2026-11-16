Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850771;
	b=jI9LPCwAkigB+B11ZWkOSkr3rOOudXpxC7qtK5LQ2PW2yDlZtqIQD8c2y9F/gY4fh//V
	 i5fBTHpl5N0PpkerWG2QTPz6+8OUo38CuAZmvyBygfscWHgfUuwZnI2dmDTWLXllo50Z1
	 vhOuHdgYW4WIfJZhYInjr3sHpF+ihyB7nPl0FPJTBMlZeBvA+PaLwSyfZYlhR929eX/lE
	 naxJxS+6pRWY0bguelngGih2pJhekc6BEbBDQjZtF82xHFK02VTjdfxZzFabTchmuQQla
	 EDJkYDhE6Z6QW3QgmJp30vEopSqmlC4Pv8OeAs58qjDHkohIf06F7eCttz3HLgOYwNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850771;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HdFymGJlpZ4cGol4eupgOaNuJxbRJ07qteptrQoP9mY=;
	b=fOTD6LdmR3Ak3vnGSCN4qqRVQL7z5OUgeqg7LVqocCF4Hp+yEzO59qoiE9/V8CgYnPrU
	 ChbplmMB1cKky3UuylrlPT0sSjs4xya9nT9hHj2FkGXMjo8SE6BAyVX3Z+2rEToOlqmer
	 4zWloR0L8+SZVL23FXSY9FvbJnjVBXIRSPZfbtqf2/egWFT4jOMw85CKP4n/+QNAXeCVX
	 v6fyvI5kxiCutuUm0w9+6kxsGXhjqz2FEw8RRdjg4viYV6u1gfIdOYzekYF7+kW/jCw1Y
	 xr+eGV78BMLBN3e6MtmlhJ3Gttzt/VK9LGGysyiHUZGjy05Y0jCHhAnA/mFW7Kxe5nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="f/J3iU9A";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D085606A31C;
	Mon, 16 Nov 2026 17:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D085606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f/J3iU9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794850771; x=1826386771;
  h=date:from:to:cc:subject:message-id;
  bh=n0mBk7IXB99+6UyUj6PD/T8dLzpwzrxQZFxLPf63ARo=;
  b=f/J3iU9AXPD7kaZThKov/QETYWYSxhkmUj8/RdW9jlyfFHUrpv5wjr1S
   qaxIyjy+3eklXrrL60nMmQSXm7Smr1sMIMqpz9iIpfrjuHVyFy1r3UXfa
   K15eslwugyLhij61+u6KKJS6hSKDaUq05I8n42ZufMMgfHkUYC8HM0Tsg
   0pkBVN+Cjwl8XE7gXpA0/V4yDRMQ/TVa+l4GMk+hX2Tg1cqX1/hVKPZGw
   YSHkghdfBI82aXN4UFN4zZQd45my2nFiMjYM6OGqy5ScyHt02V/JWk6qI
   UbPWM8pfKUvafMH//2gqES+l/qeoMePSxgiGbGXN8ysJ48jWE94ig8ANs
   g==;
X-CSE-ConnectionGUID: h8J8eQqESCC0QVxnzX/Fxw==
X-CSE-MsgGUID: Pcn0PrXhSVaCGar+1DbKyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3504567"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3504567"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 09:39:31 -0800
X-CSE-ConnectionGUID: 5p2bRkv8Rdysu7G9dSk5Cw==
X-CSE-MsgGUID: xMzU7vRTTueDANpXdLcuaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9857723"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Nov 2026 09:39:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT0fv-0000000196u-0c92;
	Mon, 16 Nov 2026 17:39:27 +0000
Date: Tue, 17 Nov 2026 01:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20261115-1518 35/35] Warning:
 drivers/infiniband/hw/hfi2/eth_ptp.c:38 function parameter 'edev' not
 described in 'cne_get_tod'
Message-ID: <202611170144.153QWep5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20261115-1518
head:   16b51e7cd1a98a98348c7b3d5824a3507c8132fa
commit: 16b51e7cd1a98a98348c7b3d5824a3507c8132fa [35/35] RDMA/hfi2: Add tracepoints and enable hfi2 driver build
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20261117/202611170144.153QWep5-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170144.153QWep5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170144.153QWep5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/infiniband/hw/hfi2/eth_ptp.c:38 function parameter 'edev' not described in 'cne_get_tod'
>> Warning: drivers/infiniband/hw/hfi2/eth_ptp.c:38 function parameter 'ts' not described in 'cne_get_tod'
>> Warning: drivers/infiniband/hw/hfi2/eth_ptp.c:38 function parameter 'sts' not described in 'cne_get_tod'
>> Warning: drivers/infiniband/hw/hfi2/eth_ptp.c:89 function parameter 'ts' not described in 'cne_set_tod'
>> Warning: drivers/infiniband/hw/hfi2/eth_ptp.c:38 function parameter 'edev' not described in 'cne_get_tod'
>> Warning: drivers/infiniband/hw/hfi2/eth_ptp.c:38 function parameter 'ts' not described in 'cne_get_tod'
>> Warning: drivers/infiniband/hw/hfi2/eth_ptp.c:38 function parameter 'sts' not described in 'cne_get_tod'
>> Warning: drivers/infiniband/hw/hfi2/eth_ptp.c:89 function parameter 'ts' not described in 'cne_set_tod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
