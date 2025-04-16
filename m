Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A2724B34;
	Wed, 16 Apr 2025 07:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788125; cv=none; b=fRwFhanWDFWHuVIWCSkG8iTjsL49/peC61IJir8ecHzypWz1++y5mBgewz0ZAQ1WcrVF50jgC01sRsoqLLDI7ErJFJLBZlxv6YkCKEPLe4JwUnr79OlkPxGJwTiiNutsicVME7EVQ/Pa5nvGju60u/GuhS/VT/O7/ujxGf86LQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788125; c=relaxed/simple;
	bh=TgE2kGOIH0k8zXkWv7SPIoeRhIJCGcMjX8R6sCfEFIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PGheAiuWyLD6FYG0a4I5a7bk2vqEiioVmdp/eHHmzMl2HNWBOgZVb/61bQExZ2v43Db5ZZkR5b8XueOv2OR2sRre4R968sMCjxDG8+nJenH+NAcquGm/Y3iSUq8JkxiWFbBzF6Wmm/aclwQ/fHHI0J9Epq2Xj8SOvQygxeZQr5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkOUAgRe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkOUAgRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744788124; x=1776324124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TgE2kGOIH0k8zXkWv7SPIoeRhIJCGcMjX8R6sCfEFIk=;
  b=RkOUAgResFe4WAaMugEfcnzO18JvYz7U+IWKBOP2Cl1ZZh/PxlUF9Ezy
   0S2HZD9LtJSBc8QuwLCIBif4+VGJ5etbycdTH5Gfvo9DicFKQnM65qkoW
   24tB+whZkpU79VHDPSXsNo8yQXLhS6Zsj0jk632MexoLldx2rpW1frShj
   D46N6qUK5sbU+3dZ4beUvmLH4AKu5nAwPcZSZyPvS3MZhPOENdv0yfZJ+
   HJ7wQQKrOFmp2Ms2DD6bqk8p40IswdsZyRUlvnFzpwS0WIZamUfCwApkp
   Q7A7EbLzeyVzX7aZYg1MlGSub+O0w9r6PXyuhH/bijlG40TnsyCIBdQZy
   A==;
X-CSE-ConnectionGUID: 5BpOPjlKS5ewvjqN5MgxoA==
X-CSE-MsgGUID: VG015DfOTGKFRI6mV5k1qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="71714450"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="71714450"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:22:03 -0700
X-CSE-ConnectionGUID: +FP4yAXXTNm7DpvYT17Fqg==
X-CSE-MsgGUID: 4GLV69zgQg+tlaTTMCFjOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130883699"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Apr 2025 00:22:01 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4x5r-000JFG-1K;
	Wed, 16 Apr 2025 07:21:59 +0000
Date: Wed, 16 Apr 2025 15:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Igor Belousov <igor.b@beldev.am>
Subject: [akpm-mm:mm-new 195/196] mm/zblock.c:369:13: error: incompatible
 function pointer types initializing 'int (*)(void *, size_t, gfp_t, unsigned
 long *, const int)' (aka 'int (*)(void *, unsigned int, unsigned int,
 unsigned long *, const int)') with an expression of type 'int (void ...
Message-ID: <202504161517.KYEDQav9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   13ef12753ee527caca620af5ab72ef6249c20622
commit: 40d54ac31c6e801d94f2563158650b69c15fbf82 [195/196] mm: add zblock allocator
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250416/202504161517.KYEDQav9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161517.KYEDQav9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161517.KYEDQav9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/zblock.c:369:13: error: incompatible function pointer types initializing 'int (*)(void *, size_t, gfp_t, unsigned long *, const int)' (aka 'int (*)(void *, unsigned int, unsigned int, unsigned long *, const int)') with an expression of type 'int (void *, size_t, gfp_t, unsigned long *)' (aka 'int (void *, unsigned int, unsigned int, unsigned long *)') [-Wincompatible-function-pointer-types]
     369 |         .malloc =               zblock_zpool_malloc,
         |                                 ^~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +369 mm/zblock.c

   363	
   364	static struct zpool_driver zblock_zpool_driver = {
   365		.type =			"zblock",
   366		.owner =		THIS_MODULE,
   367		.create =		zblock_zpool_create,
   368		.destroy =		zblock_zpool_destroy,
 > 369		.malloc =		zblock_zpool_malloc,
   370		.free =			zblock_zpool_free,
   371		.obj_read_begin =	zblock_zpool_read_begin,
   372		.obj_read_end =		zblock_zpool_read_end,
   373		.obj_write =		zblock_zpool_obj_write,
   374		.total_pages =		zblock_zpool_total_pages,
   375	};
   376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
