Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5195D32AAD1;
	Tue,  3 Mar 2026 21:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572735; cv=none; b=IvprZ988s5NkmDikmhlYY71xa7fhZ/e812U80bdW6JCBPtwyxddXo1+L/Vz/obTYvE2a1LKt2gji0iEtNSByjaqgvkecNz00UK8S+G6xOtLui08tXBZwVPoWXFDx8u+HIN390wUGj13LHl4ehnZWZ6DUGTwisEm89uUZhbeCn6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572735; c=relaxed/simple;
	bh=1bXDPQo2hsorF9dKVTtulmXykJ9XQFh953QxQfdEFsk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oJv0nEg9dMmTdRbDf4pZa3YnDhugUmYtYIJDCCBK3mLZIOnBehPQiyu9kUCoF4OJI8rz12gJJ1XJhidWHZbCbREsKwvLk9g3jKG1OvaWwoeKIKWbynAJcZKErmvmBON9jKHq12zF+8kHlNoz4CwaNCZJ1Wk4NmGrRKcRqLWiAwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgpqIVL+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgpqIVL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772572733; x=1804108733;
  h=date:from:to:cc:subject:message-id;
  bh=1bXDPQo2hsorF9dKVTtulmXykJ9XQFh953QxQfdEFsk=;
  b=hgpqIVL+3EjPW6YbYxnTP20scsK7VO1FxyYkJfPWhTE+vA4EPMecG5dX
   b2zk1tDMVdwxOn/+oxREzRjpUmgTe34WiwlUZiQ861MTVKbV4da7v4gZG
   lcXN9hcKM9yXAnJlrej7EssgyzsXSTgyXwuyLKUa2FseFLOmbPQmSeion
   H3BNAM6WeQnQhSelVgH33cRII6h32DTeGKLZmZ7bkUD9emt7GXBMuqYnL
   HcD/n3YCNklh/XpBILCsbL+wAerlcfgFf6aHXAoyTUscaBO/Pn3erH/M5
   DaOH2AlOt7tjPwHaqXGQ2QR8RnuP8nv0uM6mg9UtgVwV0930dHGl4hfE7
   g==;
X-CSE-ConnectionGUID: rNcsXM56STukCHYDESE1gw==
X-CSE-MsgGUID: nyuOH2B4RvKs4/IJsXfL+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73531430"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73531430"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 13:18:52 -0800
X-CSE-ConnectionGUID: GX+QaK6hSLiobUFtbRDwEQ==
X-CSE-MsgGUID: DXprM6xlTP2jOqumPEu1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="244905273"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Mar 2026 13:18:50 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxX8h-000000002sV-366p;
	Tue, 03 Mar 2026 21:18:47 +0000
Date: Wed, 04 Mar 2026 05:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260302 10/12]
 ./usr/include/asm/setup_data.h:35:2: error: declaration does not declare
 anything
Message-ID: <202603040528.xmhp9aIb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260302
head:   759ff201de93e9bf74683ac6d4414b9141b12c27
commit: 0c2f151521b10100c7f4415d3ef1f7ae4999634d [10/12] x86/setup: Avoid multiple -Wflex-array-member-not-at-end warnings
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260304/202603040528.xmhp9aIb-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603040528.xmhp9aIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603040528.xmhp9aIb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/asm/setup_data.h:35:2: error: declaration does not declare anything [-Werror,-Wmissing-declarations]
      35 |         struct setup_data_hdr;
         |         ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
