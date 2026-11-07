Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794071105;
	b=mNWcTYcjqJmb9hxprGypaezOhWLIY/mNWS+fw+dqQUZi6bC56891LyCLcc90OJvFmxgu
	 ck3JBs05PC9d7ThwdZDKxnq62f2bTC0wovKOwlu/ovlb06WgOhU+NdtbTAO0Dxz1aUjYA
	 rTXjxE2dvoN2JczrJopNvEXstlSitX4GB7kZLvE6sY+n/CK8EsjNCB2z2628TpSSNPBGe
	 Pb4ib51XOqlzW2X/pIr0ekheLlN14FQbd55U4SH8R60rk0qeWbLQbZLq9W30OrCMRkRJW
	 Cy09MToGCbYcG97gjECjpv0FyZVqewS+zRRe6rJJ3m4t0+8n81Z0tFCojoxauAf3M7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794071105;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=tuZXBvaXhxTtaSu3IjU8Dvke4HyGXfYy7awdmJVrM+Y=;
	b=MFkfXroaMrbvK6NJdg2zW1LxgLEgSmYlTwErYZ56J38K5OsbGnoszgHCMIPIMti32sF/
	 SiFEVdStp2jIy2XRcjtNt/SOLxNQk8KkPbnGOVQum77pyzmw1AolS8tW0Lu4crSpnX4gf
	 cwrYmLa2AKJqAu7oUEWXbzESM3+mIF1z3ivAiyYPydRpBDEM5p6/LC8viMxjwzAKD4x/I
	 pCcphc0PHILVe45fz6fwGfzU16kpzmqXy22JubNymQyhyWiDCU7mzpgYeKjpKy+Aui4Kb
	 fj7VRlf9dae9egFMHOaujzDvhmCzACBN/0ji93h8vQFPBwQ2Uzy4jMT8DBU1LdlhbMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JeFplFM+;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73825606A32C;
	Sat,  7 Nov 2026 17:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73825606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JeFplFM+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794071102; x=1825607102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ldDp/F7niAr7c2d1iKtQlPq97mEON7EG9ro+Ts+D+0=;
  b=JeFplFM+oVhGMyVV2P0snVZ2shAkIz8WKIU/qRfD+v1CkBcGs5/O1qcD
   CM4KKyGnknyGtsgvTXqkkcekFVHpToTM+VPiC/h4DFrTYIkQ3S977elq2
   mlJxejG54g7PhWRSgHXQxnjhf9yyZ9F1pburiJq+d9nbyMJZUTpSs50bw
   2Gk4hh8yBuk8iVEY15yJUW/6wuV/tBwUCByFVF+BfX57KxJUvHisFcdnf
   wqb2s/FbNSLmMrJNrCUrTvOuwIkFC4QYCPZUEDvDbMowgFmGd9c5XXCCb
   Jo0WMmqGSzE6LwoGM2v2I6JYsL73ly/dUFz+PoQPewPBKIXSBO1eIzFQx
   g==;
X-CSE-ConnectionGUID: ORcHhlpyTFyb6XVmhHCTaQ==
X-CSE-MsgGUID: yrpexgB7SvWmAf8IijKMbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2750726"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2750726"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 09:05:01 -0800
X-CSE-ConnectionGUID: K/UOg2l8Q6+kd/0RS4elCw==
X-CSE-MsgGUID: jZeENGn8Q2eBzd7eswqb/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7652623"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Nov 2026 09:04:59 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPjqb-00000000rFw-0M4o;
	Sat, 07 Nov 2026 17:04:57 +0000
Date: Sun, 08 Nov 2026 01:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/configfs-const 32/34]
 samples/configfs/configfs_sample.c:378:14: error: initializing 'const struct
 configfs_attribute *const *' with an expression of type 'struct
 configfs_attribute *[2]' discards qualifiers in nested pointer types
Message-ID: <202611080030.LFp3K9aU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/configfs-const
head:   0e68ea5975531faee86ef390018b5d08916b17db
commit: 4762ca57ffcb5fe7b2fddd96882daba9fe3ce303 [32/34] const ct_attrs
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261108/202611080030.LFp3K9aU-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080030.LFp3K9aU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080030.LFp3K9aU-lkp@intel.com/

All errors (new ones prefixed by >>):

   samples/configfs/configfs_sample.c:343:2: error: initializing 'struct configfs_attribute *' with an expression of type 'const struct configfs_attribute *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     343 |         &symlink_child_attr_nlinks,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> samples/configfs/configfs_sample.c:378:14: error: initializing 'const struct configfs_attribute *const *' with an expression of type 'struct configfs_attribute *[2]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     378 |         .ct_attrs       = symlink_child_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~
   samples/configfs/configfs_sample.c:411:2: error: initializing 'struct configfs_attribute *' with an expression of type 'const struct configfs_attribute *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     411 |         &symlink_children_attr_description,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/configfs/configfs_sample.c:421:14: error: initializing 'const struct configfs_attribute *const *' with an expression of type 'struct configfs_attribute *[2]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     421 |         .ct_attrs       = symlink_children_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +378 samples/configfs/configfs_sample.c

0a51cf54232ecd Breno Leitao 2026-08-26  375  
0a51cf54232ecd Breno Leitao 2026-08-26  376  static const struct config_item_type symlink_child_type = {
0a51cf54232ecd Breno Leitao 2026-08-26  377  	.ct_item_ops	= &symlink_child_item_ops,
0a51cf54232ecd Breno Leitao 2026-08-26 @378  	.ct_attrs	= symlink_child_attrs,
0a51cf54232ecd Breno Leitao 2026-08-26  379  	.ct_owner	= THIS_MODULE,
0a51cf54232ecd Breno Leitao 2026-08-26  380  };
0a51cf54232ecd Breno Leitao 2026-08-26  381  

:::::: The code at line 378 was first introduced by commit
:::::: 0a51cf54232ecdfb8172ad7943e04e67e401538a samples/configfs: add a subsystem that accepts symlinks

:::::: TO: Breno Leitao <leitao@debian.org>
:::::: CC: Breno Leitao <leitao@debian.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
