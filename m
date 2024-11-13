Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA8216DEB4;
	Wed, 13 Nov 2024 03:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731468584; cv=none; b=Mj/GNU7YOAuT6d2ogDtbdO4I41H1z116qTWGrfSxNPz43hJV4s+ulXfuc7Hw47zekQDPOe6Haso9yB95axaSaVDu4HB83jTH+dSTprm0/xl/7LRJ47+4kUnw2Anc15dv69PgYI/TS8NE0fB6FXqP18kRh5dtvIOurJy35tdajcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731468584; c=relaxed/simple;
	bh=zBDc456r67UdP1KTxni4OnRh4y7un56AKDTyJiwbpb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ivARuGy+Pg31j7jDSmt6k350ZihH3SLUzevCIqtUGic30GfCI1ys6ozRwUViHgMruqSHZP3wJ4XTkq8tNsP5QcTfLxXwZ2sNCT7o7WvGr7qW4MlDcRcb5iCpJOb/yRceMhK/GelN22iI56fk2XELXXMpWmBjV8pqwB15itUANTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgAa1zDQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgAa1zDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731468583; x=1763004583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zBDc456r67UdP1KTxni4OnRh4y7un56AKDTyJiwbpb8=;
  b=IgAa1zDQzzrgEdHz/aNZFgzsnZpoEnhhn3Z8Z8Y2OJIatvPzPLjCEtqp
   MMAZH60ata6S1HnuYJfH9fRKzZqeO5Yuca9SqcxlsO1b/O8+GMF//IwmE
   Ata4gjc9ajW4fSnvV6tm3cYCYswyrCOKlgP44HGYmeUjWDGypEcprtuPz
   lAV7JO2i0U/Ls40d34gE5OyK/JiPS8TYE5kzAnWvzz6FcBnMdZ+sSdKCM
   3IQLTfJWmmDuaVHwjp/9FJGCqxmLbSwK/UfpXtSKo/juh4kkIdYLrYrNp
   6m5cUDM0uuOpxvlxo3j+Q+A+AAN5/3MnW2V+PjVIb8Rbp5fI6tDl0w08J
   Q==;
X-CSE-ConnectionGUID: C80xKIc8SJOsLmPOsdfQgg==
X-CSE-MsgGUID: C7No7vQlTHSpiQOihst0Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53891384"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53891384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 19:29:41 -0800
X-CSE-ConnectionGUID: i2uCDkoQRo2wQ5gXUT4F3g==
X-CSE-MsgGUID: ISVljHvISOqmem/AdG6++Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="111040572"
Received: from lkp-server01.sh.intel.com (HELO c782e932e0d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2024 19:29:13 -0800
Received: from kbuild by c782e932e0d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB446-00001I-2g;
	Wed, 13 Nov 2024 03:29:10 +0000
Date: Wed, 13 Nov 2024 11:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:statmount 5/5] samples/vfs/mountinfo.c:122:45: warning:
 format specifies type 'unsigned long' but the argument has type '__u64' (aka
 'unsigned long long')
Message-ID: <202411131112.x7IgKgNt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git statmount
head:   b362a0ea5036587314ee0f8f5cbc491cd4ded303
commit: b362a0ea5036587314ee0f8f5cbc491cd4ded303 [5/5] samples: add a mnt-ns-walk program to demonstrate statmount()/listmount()
config: x86_64-buildonly-randconfig-002-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131112.x7IgKgNt-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131112.x7IgKgNt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131112.x7IgKgNt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/vfs/mountinfo.c:122:45: warning: format specifies type 'unsigned long' but the argument has type '__u64' (aka 'unsigned long long') [-Wformat]
     122 |         printf("0x%lx 0x%lx %u:%u %s %s ", mnt_id, buf->mnt_parent_id,
         |                         ~~~                        ^~~~~~~~~~~~~~~~~~
         |                         %llx
   1 warning generated.


vim +122 samples/vfs/mountinfo.c

   106	
   107	static int dump_mountinfo(uint64_t mnt_id, uint64_t mnt_ns_id)
   108	{
   109		int ret;
   110		struct statmount *buf = alloca(STATMOUNT_BUFSIZE);
   111		const uint64_t mask = STATMOUNT_SB_BASIC | STATMOUNT_MNT_BASIC |
   112					STATMOUNT_PROPAGATE_FROM | STATMOUNT_FS_TYPE |
   113					STATMOUNT_MNT_ROOT | STATMOUNT_MNT_POINT |
   114					STATMOUNT_MNT_OPTS | STATMOUNT_FS_SUBTYPE |
   115					STATMOUNT_SB_SOURCE;
   116	
   117		ret = statmount(mnt_id, mnt_ns_id, mask, buf, STATMOUNT_BUFSIZE, 0);
   118		if (ret < 0) {
   119			perror("statmount");
   120			return 1;
   121		}
 > 122		printf("0x%lx 0x%lx %u:%u %s %s ", mnt_id, buf->mnt_parent_id,
   123					   buf->sb_dev_major, buf->sb_dev_minor,
   124					   &buf->str[buf->mnt_root],
   125					   &buf->str[buf->mnt_point]);
   126		show_mnt_attrs(buf->mnt_attr);
   127		show_propagation(buf);
   128	
   129		printf(" - %s", &buf->str[buf->fs_type]);
   130		if (buf->mask & STATMOUNT_FS_SUBTYPE)
   131			printf(".%s", &buf->str[buf->fs_subtype]);
   132		if (buf->mask & STATMOUNT_SB_SOURCE)
   133			printf(" %s", &buf->str[buf->sb_source]);
   134		else
   135			printf(":none");
   136	
   137		show_sb_flags(buf->sb_flags);
   138		printf(",%s\n", &buf->str[buf->mnt_opts]);
   139		return 0;
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
