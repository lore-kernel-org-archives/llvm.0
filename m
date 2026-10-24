Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833851;
	b=DdOXEVslWVCigg0KelqcNd+9kumiOTkBrEVsQ5oEriQHjBqTn7LRJq43zSYoahldYHj0
	 SnwUYNpy48p7W/4E7Jmb7s2PXkCj8Dqe8lGDKdLZrziqjBzeW+t0l6dCIXpa9M9BWHrVj
	 8oublL/KkE56fehmmRvjPNrkldZKVkmdlX2Zthuh3K7g7s1rQUMdNYHMfEQM5aUgNbAf0
	 +a0oMP9uBL12aS0vZEaQRwPKpmvesy98MeFKGttMQUd+7E5VcHi6VrWmH/JDtv8dOs5D5
	 03JlV3P5X4fi6GIrsE/pUEiY9FeMZA3FuShNJU4ptDKMZZvUF0DwWBGS11NVffZqHhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833851;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=exMi6S4cO+EsM2HRrvNKx7D7JdtbTwGDUma1PTptkLE=;
	b=as9BVWONJ3FKFcLPFXkbN8iv21lgJIzSO50OoX6OS5LY2wzMWuWIEL8RbGGUJzQSuxdM
	 sEtqWPg8zlpUpHiTxiWDpA6tD9Exrd6gPjhSphlbyB7sOftkPnzrz6eCIOHE12/YvPjLn
	 8kWRHpBMYjnn5tBv7nY5w7xjlnKdHnqOWmBiNfoYZMwLFtltJRcm4M9CFus+oQz+b/XPX
	 PxODrVlfNdvJxK1ygZjLZ5UccuIhtqM/6z5J8xlrv8eRaMzOzoy+Glfsa24P7PYxy3cQ+
	 3DTVFRaGpe15J+tQ+7FfHywexL97tlhynyi1Bp4tna8gIF5bshqo3+/6bfskMKBYI3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EMr9pafX;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00DC606A31A;
	Sat, 24 Oct 2026 09:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C00DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EMr9pafX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792833849; x=1824369849;
  h=date:from:to:cc:subject:message-id;
  bh=a9s+UdRGk7syISuZKJFpgti2hBC9UasjVKiz2g+tx7s=;
  b=EMr9pafXMVzusRLiPnahjWu/9cqM+n6gbYW8TnQfJQJVXUmVlFwHhEf2
   pS+qihU7/R+gLJKCJ/Fkw5FpEumXUQBIedgZnXO4e6uDs9Bz8KvyRxYQF
   5SyI2nd3Vjfi7bUATV86ZaAibgfWILPOotGjut+Yl8egNReVBOR9XXpEF
   zBmn1DDSG6WpUxqV5CLkI7BVMnnqbTeVnKeaCMZWmUz4YLeDgH7JmF8BV
   tslvik/tvy1CeCT0B3/ZCTsX2n80CQKNEznnKlXrgs3uzQP2SG2XtN0Dg
   cTOisK62FzRaaPYQv7bhJ37ju/PyEzdjPxRnxkqyDFYk1ebrKv7/EBnA8
   Q==;
X-CSE-ConnectionGUID: ZXC1E3s+QOCNWKu7LzUSyw==
X-CSE-MsgGUID: T662Km5MQKCqLXd+fUNmCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1596911"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1596911"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 02:24:08 -0700
X-CSE-ConnectionGUID: slfTOvfyRbWlcK/twjUPDQ==
X-CSE-MsgGUID: Isk/ASS8RDun+dc3wauUvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4228605"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Oct 2026 02:24:07 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKXyu-00000000TkE-0KVJ;
	Sat, 24 Oct 2026 09:24:04 +0000
Date: Sat, 24 Oct 2026 17:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:hexagon 53/82] arch/hexagon/kernel/h2info.c:281:2:
 warning: ignoring return value of function declared with 'warn_unused_result'
 attribute
Message-ID: <202610241720.OPD2Ymuj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git hexagon
head:   35ab1dadb94646b74469738c1741f68e8c6aac3d
commit: 049331d04179d182e9c08c3d8c23e0badbac5bad [53/82] hexagon: export what the hypervisor tells the guest, for debugging
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261024/202610241720.OPD2Ymuj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241720.OPD2Ymuj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241720.OPD2Ymuj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/hexagon/kernel/h2info.c:281:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
     281 |         sysfs_create_group(kobj, &top_group);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/warn_unused_result +281 arch/hexagon/kernel/h2info.c

   267	
   268	static int __init h2info_init(void)
   269	{
   270		const char *pmu_names[ARRAY_SIZE(pmu_regs)];
   271		const char *cpu_names[NR_CPUS];
   272		static char cpu_name_buf[NR_CPUS][8];
   273		struct kobject *kobj;
   274		struct dentry *dir;
   275		int i;
   276	
   277		kobj = kobject_create_and_add("hexagon", kernel_kobj);
   278		if (!kobj)
   279			return -ENOMEM;
   280	
 > 281		sysfs_create_group(kobj, &top_group);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
