Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061062;
	b=px6w476Z5/eMgoWmSEHsMX83N9kAshuOIyay4kxnsVDV0Pdz23mQESG3OT8j+AIHVJla
	 e+QYaquvpdeouixq9MpfdSb7ClHPAH0O3Av9XxNOIuHz1AxDt8SXkPSoKnkyqcJGIrwou
	 /o5jrLe1Ulo4wqXvBNLVxhwv26KslyXQh38Dels9b4Vb4EZv5yG+yMvg4XkvRXleWTaPg
	 BxMVYm6Os8RGbtVFuXCVjIdI1fvrBPS9fhfuW2m/XVtjg8Bzjt5M+U0XdqOudZs93jDjL
	 fNT618b1rsyr0Go7TaQMqxcaWMcGI++d7UYOXy7htIZQU5hWKP71mlJSRTi5LDjUbhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061062;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=RQWqlZm86Lj8BP2zxzusWIKOGO9KqsrMF8mjIT89vr8=;
	b=za2RLoAIV2p98GTwm77WQ3sG87lk90RdSMm5wTfEJgzh86MYgXjErjEqu9SxZIQcaXWL
	 XrbjhtJG6Ax97cSa2688uHEd3AlizW3jDU7Uq6tpIHd33CRjsRXUlnEcZp0QwozQn4NC1
	 8J8JzsbT9hYM0l3UnNw2nCxiPU/8UYzfgh4r4PXZqctuLLpU8s5q8V+Wrd5GXYH/HnP4R
	 mM8Is5aRHwuy0PkSf10LLQ7vMuB8ikk0YFosS5EsJHIzAlc8+sQmMQlfYE5DB4fiC2PYf
	 4n5/wRlVbakbH36tYqsMS2zhiukFhjoxB2VIBpeP8zyNiyHiWPu6KhbtKguITzUei/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kyeL+u4D;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D252B6082BC0;
	Sat,  7 Nov 2026 14:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D252B6082BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kyeL+u4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794061061; x=1825597061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f0y78WXb8T9DSvGSSnGE1y47DbCMRBowCF47goutj3g=;
  b=kyeL+u4DExBqCsR1H0n0rJihySipcezO6x7mcgHa744REckVrLnylwQx
   XTLGZpawe/RmOqzA2iWwOezmgnZO5o99W3VQa1ZRsf9J1zfwFfe2au9Yd
   Kl9twJxP+NLuiMzZq4JkwnhnQZ+rXioNtLZZnTpvp3UDNOhGgkgcBYQ9c
   av5B5EX3Y10y/yQoAsglahGdg+CcSSU3HLnO362NK4y2r8ilBxu7aeq7K
   mRtsfSCLuYY8P6ZQE2WwBbjpy3MIcqKN8Z15251uZHfkgMdb0MlLieV8a
   /SD1/N7CqVqDrflbwjucTe1FdXPWRQ9yaltQZJFHjVARf0X4tGG/qeHye
   g==;
X-CSE-ConnectionGUID: LJyrEAyfQdu9jZ8OLUZ5CA==
X-CSE-MsgGUID: U3Y1WeZKQTakAzDpr0Wx9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2955315"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2955315"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 06:17:41 -0800
X-CSE-ConnectionGUID: 5OlpngBDQAiPF30hJKj/8g==
X-CSE-MsgGUID: 2OUpHqS6SbGPysAgoBPgLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7363014"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2026 06:17:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPhEe-00000000qv5-3kDJ;
	Sat, 07 Nov 2026 14:17:36 +0000
Date: Sat, 07 Nov 2026 22:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/configfs-const 31/34]
 samples/configfs/configfs_sample.c:343:2: error: initializing 'struct
 configfs_attribute *' with an expression of type 'const struct
 configfs_attribute *' discards qualifiers
Message-ID: <202611072251.uaHsKQAu-lkp@intel.com>
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
commit: bd1e491ccf3cb7d868d2f06405e7419328a27a7d [31/34] macro
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261107/202611072251.uaHsKQAu-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611072251.uaHsKQAu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611072251.uaHsKQAu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> samples/configfs/configfs_sample.c:343:2: error: initializing 'struct configfs_attribute *' with an expression of type 'const struct configfs_attribute *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     343 |         &symlink_child_attr_nlinks,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/configfs/configfs_sample.c:411:2: error: initializing 'struct configfs_attribute *' with an expression of type 'const struct configfs_attribute *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     411 |         &symlink_children_attr_description,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +343 samples/configfs/configfs_sample.c

0a51cf54232ecd Breno Leitao 2026-08-26  341  
0a51cf54232ecd Breno Leitao 2026-08-26  342  static struct configfs_attribute *symlink_child_attrs[] = {
0a51cf54232ecd Breno Leitao 2026-08-26 @343  	&symlink_child_attr_nlinks,
0a51cf54232ecd Breno Leitao 2026-08-26  344  	NULL,
0a51cf54232ecd Breno Leitao 2026-08-26  345  };
0a51cf54232ecd Breno Leitao 2026-08-26  346  

:::::: The code at line 343 was first introduced by commit
:::::: 0a51cf54232ecdfb8172ad7943e04e67e401538a samples/configfs: add a subsystem that accepts symlinks

:::::: TO: Breno Leitao <leitao@debian.org>
:::::: CC: Breno Leitao <leitao@debian.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
