Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B031E7C10;
	Sun,  2 Mar 2025 15:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740930202; cv=none; b=s/HKsvu+IZgiwNwGoX8PMU1wtF0Uho8GBrGBfSkNgaTqKNQLMOYwjV2Yk01r3ey0H2Aaihr+a78R3yqJmkKUqDBuRIlI1t3ZXqOKTLHrE5WFAibPAvtlzkPnNnez8dB5exKvXEtbbC5+cPMCWGeaf6ta8XaOB8fj7FbM+c/qKWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740930202; c=relaxed/simple;
	bh=9XbyGeWO1nJrQsLW+70EZoa3AEwvGwi4vSRwenMVI20=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TCSEu+3pt83HQTp5R3jh++KE3juRZT3MuH1qlhnf0gxeEuF7Bh260dfCPSFibxE7yfY9IwgdmUBSyN1z6S+RrH63vzPNYaQffnGvLuDBBA+kVd31OjrcShZYqED8vYZHQMe584ZlEm6QXRaRKzXfv11kyf67k6ORmyeRg8C2Fz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxzH9qgZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxzH9qgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740930200; x=1772466200;
  h=date:from:cc:subject:message-id:mime-version;
  bh=9XbyGeWO1nJrQsLW+70EZoa3AEwvGwi4vSRwenMVI20=;
  b=IxzH9qgZHABR1502karywdY1mwwInu0stRn5gbBXjYztTv+Cgs5Zsa7y
   hnGZYt8CQBY8zoDuDKqRrh4+Ev+jLDQviLoRhoFZv4uC/wDvxsG9JzolS
   eNqQpuv582RE9km9OmAiMKzrYq+pzmW8CrjYWfP9NvT0ylj7i+6HD8E8/
   Vxuw0ZmzimyXkrphPuyCgBteOGB/OjSoKFR4xOZMo7hHTzBc0cUXWx0jh
   ClzdgUplIN+hhehlrfCqvXELttnv1g2waLvMuzjbbeWtkCD58HX0MGzKx
   1D8tUy+ozXRkKWdRhAIrqyVFixAL7VYJVFs6iS6NBxyQcY6T1pZbMfaMO
   A==;
X-CSE-ConnectionGUID: KGwDPOTrRMi9P7myP7QGTA==
X-CSE-MsgGUID: djQ1OaJCSRWsupss3BtHYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41837100"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="41837100"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 07:43:20 -0800
X-CSE-ConnectionGUID: SgqJld32SIOGXrEslmmRjw==
X-CSE-MsgGUID: 8KHvNC9OR9SW0YQ2OOaClA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="122747268"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Mar 2025 07:43:18 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tolTI-000HQ6-1C;
	Sun, 02 Mar 2025 15:43:16 +0000
Date: Sun, 2 Mar 2025 23:42:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: fs/bcachefs/quota.c:130:15: warning: arithmetic between different
 enumeration types ('enum quota_types' and 'enum quota_counters')
Message-ID: <202503022349.eydi1bf1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1973160c90d7886c523e52e1f56164e6a74f0474
commit: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
date:   1 year, 4 months ago
config: x86_64-buildonly-randconfig-004-20241224 (https://download.01.org/0day-ci/archive/20250302/202503022349.eydi1bf1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503022349.eydi1bf1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503022349.eydi1bf1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/quota.c:2:
   In file included from fs/bcachefs/bcachefs.h:184:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/quota.c:25:24: warning: variable 'dq' set but not used [-Wunused-but-set-variable]
      25 |         struct bkey_s_c_quota dq;
         |                               ^
>> fs/bcachefs/quota.c:130:15: warning: arithmetic between different enumeration types ('enum quota_types' and 'enum quota_counters') [-Wenum-enum-conversion]
     130 |         }               m[QTYP_NR * Q_COUNTERS];
         |                           ~~~~~~~ ^ ~~~~~~~~~~
   fs/bcachefs/quota.c:612:28: warning: variable 'q' set but not used [-Wunused-but-set-variable]
     612 |         struct bch_memquota_type *q;
         |                                   ^
   7 warnings generated.


vim +130 fs/bcachefs/quota.c

    22	
    23	const char *bch2_quota_invalid(const struct bch_fs *c, struct bkey_s_c k)
    24	{
  > 25		struct bkey_s_c_quota dq;
    26	
    27		if (k.k->p.inode >= QTYP_NR)
    28			return "invalid quota type";
    29	
    30		switch (k.k->type) {
    31		case BCH_QUOTA: {
    32			dq = bkey_s_c_to_quota(k);
    33	
    34			if (bkey_val_bytes(k.k) != sizeof(struct bch_quota))
    35				return "incorrect value size";
    36	
    37			return NULL;
    38		}
    39		default:
    40			return "invalid type";
    41		}
    42	}
    43	
    44	static const char * const bch2_quota_counters[] = {
    45		"space",
    46		"inodes",
    47	};
    48	
    49	void bch2_quota_to_text(struct bch_fs *c, char *buf,
    50				size_t size, struct bkey_s_c k)
    51	{
    52		char *out = buf, *end= buf + size;
    53		struct bkey_s_c_quota dq;
    54		unsigned i;
    55	
    56		switch (k.k->type) {
    57		case BCH_QUOTA:
    58			dq = bkey_s_c_to_quota(k);
    59	
    60			for (i = 0; i < Q_COUNTERS; i++)
    61				out += scnprintf(out, end - out, "%s hardlimit %llu softlimit %llu",
    62						 bch2_quota_counters[i],
    63						 le64_to_cpu(dq.v->c[i].hardlimit),
    64						 le64_to_cpu(dq.v->c[i].softlimit));
    65			break;
    66		}
    67	}
    68	
    69	#ifdef CONFIG_BCACHEFS_QUOTA
    70	
    71	#include <linux/cred.h>
    72	#include <linux/fs.h>
    73	#include <linux/quota.h>
    74	
    75	static inline unsigned __next_qtype(unsigned i, unsigned qtypes)
    76	{
    77		qtypes >>= i;
    78		return qtypes ? i + __ffs(qtypes) : QTYP_NR;
    79	}
    80	
    81	#define for_each_set_qtype(_c, _i, _q, _qtypes)				\
    82		for (_i = 0;							\
    83		     (_i = __next_qtype(_i, _qtypes),				\
    84		      _q = &(_c)->quotas[_i],					\
    85		      _i < QTYP_NR);						\
    86		     _i++)
    87	
    88	static bool ignore_hardlimit(struct bch_memquota_type *q)
    89	{
    90		if (capable(CAP_SYS_RESOURCE))
    91			return true;
    92	#if 0
    93		struct mem_dqinfo *info = &sb_dqopt(dquot->dq_sb)->info[dquot->dq_id.type];
    94	
    95		return capable(CAP_SYS_RESOURCE) &&
    96		       (info->dqi_format->qf_fmt_id != QFMT_VFS_OLD ||
    97			!(info->dqi_flags & DQF_ROOT_SQUASH));
    98	#endif
    99		return false;
   100	}
   101	
   102	enum quota_msg {
   103		SOFTWARN,	/* Softlimit reached */
   104		SOFTLONGWARN,	/* Grace time expired */
   105		HARDWARN,	/* Hardlimit reached */
   106	
   107		HARDBELOW,	/* Usage got below inode hardlimit */
   108		SOFTBELOW,	/* Usage got below inode softlimit */
   109	};
   110	
   111	static int quota_nl[][Q_COUNTERS] = {
   112		[HARDWARN][Q_SPC]	= QUOTA_NL_BHARDWARN,
   113		[SOFTLONGWARN][Q_SPC]	= QUOTA_NL_BSOFTLONGWARN,
   114		[SOFTWARN][Q_SPC]	= QUOTA_NL_BSOFTWARN,
   115		[HARDBELOW][Q_SPC]	= QUOTA_NL_BHARDBELOW,
   116		[SOFTBELOW][Q_SPC]	= QUOTA_NL_BSOFTBELOW,
   117	
   118		[HARDWARN][Q_INO]	= QUOTA_NL_IHARDWARN,
   119		[SOFTLONGWARN][Q_INO]	= QUOTA_NL_ISOFTLONGWARN,
   120		[SOFTWARN][Q_INO]	= QUOTA_NL_ISOFTWARN,
   121		[HARDBELOW][Q_INO]	= QUOTA_NL_IHARDBELOW,
   122		[SOFTBELOW][Q_INO]	= QUOTA_NL_ISOFTBELOW,
   123	};
   124	
   125	struct quota_msgs {
   126		u8		nr;
   127		struct {
   128			u8	qtype;
   129			u8	msg;
 > 130		}		m[QTYP_NR * Q_COUNTERS];
   131	};
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
