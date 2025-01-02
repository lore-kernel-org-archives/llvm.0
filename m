Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB102EAE6;
	Thu,  2 Jan 2025 16:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835215; cv=none; b=P2qYJjrsn66ZtRO6USxEeV/fBtYL+PvtqRZs0nSGObKTpnu3442UinGwHFOVHZSzsSOrnkb6H4Xl4sJUJBOGRtHRu2J7qY5r5BAwfL5ArXKN0dHkjqwxdcGAsxScnanE9DZmlWbWP9cFra2BuuWKu/e5Aflh+ZkZ4oNt8Z7THdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835215; c=relaxed/simple;
	bh=eZlYym/i8rHGLawKu377lQm3OBiE/FJLlreR6GOYJTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=roTpIeEQHugOCqyfIkxraRJHq1lublP3muMj4VPHMfVvR19zHjnNl6bWBhvRHs7RoDz8Z4iLrCyVlNX77Qeo5ST9b4QCrKd9uQR0HZznAaAPu5579ynGdRgfx7+8EDHCTq+ywwSe1Y3KLUx7AZFp823sQTUYPROQAp8gxQKRQNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGU9FEdQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGU9FEdQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735835214; x=1767371214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eZlYym/i8rHGLawKu377lQm3OBiE/FJLlreR6GOYJTM=;
  b=YGU9FEdQtckhvVweIZOEN+zN7OW1xCCs42zTFv5nthpmRKoCOmL23LXl
   FMqJHOuZ1fC8Isgha8QHOzv3H2Xij9KvrKFO1nuJr5Hr/R2f8xftLdfyl
   o18mhpOE2UPJ8llvZGTVYXZmOQ6ceUXgnCNU4C0vD88CYiIet7wVF2EUp
   roHju9pWGLZbzNRgIyiIdGnQsrQ10RAgqB+SAosv/dSRufxI2TlO1dPFt
   IhmEU8zKCK+6Ex7Aa6kN++lHwsTKulCJ9GsFq9/lGvNpW+eFdFMt0eEue
   l2cY/EjLj1eShMIsr8PXX0UpeJX703jwkpmUbwu6w12r3BMo1j/+CMc5S
   g==;
X-CSE-ConnectionGUID: M2o4iF0vQRaTlmpG/uDo0g==
X-CSE-MsgGUID: vwPDsfDCR86KcOJUpBgARw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46659901"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="46659901"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 08:26:53 -0800
X-CSE-ConnectionGUID: mVmTSdZqSoi4L+c2J0NZNw==
X-CSE-MsgGUID: 6JS3FAPUQUmz5fZQsvUFEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102405307"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jan 2025 08:26:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTO25-0008dt-1O;
	Thu, 02 Jan 2025 16:26:49 +0000
Date: Fri, 3 Jan 2025 00:26:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 774/5236] samples/vfs/mountinfo.c:142:33:
 warning: format specifies type 'unsigned long' but the argument has type
 'uint64_t' (aka 'unsigned long long')
Message-ID: <202501030056.6iChb8dx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 0c8f746452aa75bbca927a9f5e9d0a7e69b892a4 [774/5236] samples: add a mountinfo program to demonstrate statmount()/listmount()
config: i386-randconfig-014-20250102 (https://download.01.org/0day-ci/archive/20250103/202501030056.6iChb8dx-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030056.6iChb8dx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030056.6iChb8dx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/vfs/mountinfo.c:142:33: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     142 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
         |                           ~~~                 ^~~~~~~~~
         |                           %llx
   samples/vfs/mountinfo.c:142:44: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     142 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
         |                                 ~~~                      ^~~~~~
         |                                 %llx
   2 warnings generated.


vim +142 samples/vfs/mountinfo.c

   124	
   125	static int dump_mountinfo(uint64_t mnt_id, uint64_t mnt_ns_id)
   126	{
   127		int ret;
   128		struct statmount *buf = alloca(STATMOUNT_BUFSIZE);
   129		const uint64_t mask = STATMOUNT_SB_BASIC | STATMOUNT_MNT_BASIC |
   130					STATMOUNT_PROPAGATE_FROM | STATMOUNT_FS_TYPE |
   131					STATMOUNT_MNT_ROOT | STATMOUNT_MNT_POINT |
   132					STATMOUNT_MNT_OPTS | STATMOUNT_FS_SUBTYPE |
   133					STATMOUNT_SB_SOURCE;
   134	
   135		ret = statmount(mnt_id, mnt_ns_id, mask, buf, STATMOUNT_BUFSIZE, 0);
   136		if (ret < 0) {
   137			perror("statmount");
   138			return 1;
   139		}
   140	
   141		if (ext_format)
 > 142			printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
   143	
   144		printf("%u %u %u:%u %s %s ", buf->mnt_id_old, buf->mnt_parent_id_old,
   145					   buf->sb_dev_major, buf->sb_dev_minor,
   146					   &buf->str[buf->mnt_root],
   147					   &buf->str[buf->mnt_point]);
   148		show_mnt_attrs(buf->mnt_attr);
   149		show_propagation(buf);
   150	
   151		printf(" - %s", &buf->str[buf->fs_type]);
   152		if (buf->mask & STATMOUNT_FS_SUBTYPE)
   153			printf(".%s", &buf->str[buf->fs_subtype]);
   154		if (buf->mask & STATMOUNT_SB_SOURCE)
   155			printf(" %s ", &buf->str[buf->sb_source]);
   156		else
   157			printf(" :none ");
   158	
   159		show_sb_flags(buf->sb_flags);
   160		if (buf->mask & STATMOUNT_MNT_OPTS)
   161			printf(",%s", &buf->str[buf->mnt_opts]);
   162		printf("\n");
   163		return 0;
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
