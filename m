Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C258B1917C2;
	Thu,  2 Jan 2025 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735812379; cv=none; b=mC+KF3Eqh4rBLXgez4C5PYDPGMfO1pIGZx/vp+UjfTU69KyD/vZbI5uGzoiDFhcii3gORW8/JTv+p05LLUq33YrBML8TkmEt+nU07fyfrjV/9b0MF0WNGOgp5nwoI2/l/aLcosPgfDED6LVwuVqp3YitaFMJMNZ19UGeZpSQgwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735812379; c=relaxed/simple;
	bh=ohwrO2Jbwv3ovLswaWcqgt37fBCcyoHE3296q6vi8X0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qh9u5E5i6b7ZdXZEIDoTO6yUrV7BsWeqgw9oJBcHrX8ix++5V7e0yQOjFMBoEqYPOsSfW/aUkm7JCGpYPzCZkK/4dCLAh1V7GHiwDb8qjG/RRlDrsTIY7MFzkMgEcyOEhYvw7glSwWFDpuRtA6ckXLmIgbpXpxiitGflWI1wAGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpWhTZ8Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpWhTZ8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735812378; x=1767348378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ohwrO2Jbwv3ovLswaWcqgt37fBCcyoHE3296q6vi8X0=;
  b=JpWhTZ8Z74CMctviM91Asksj/Fp5utfis/u9wdzKpJZdyOX/PgwEIZU/
   0BArYGIKL+ru0o6TUq56REmp8SQjDSv311utYH65hzLskk+IL0Vd2G7Iq
   0ZXfJyUG4bdNU2ibba6n1R1aKIJpcKq4QsosUJqd+RM86iqyfRUf2dji9
   Tun2Cz95hflZirHZczEKUpGkByW6sg6H2ijWS/lvYwCR/P7nAHvc/bRqs
   btdpCkH0VImqBiA9yN1o52lNCvhDoMQIwi4BuDrKTXVpCyYQv1NyZzSMT
   19zmY3G6YZM98oMC+J6tUR17gl243zDMaSmcsgX5Z9BDHjCpOslW51nm9
   A==;
X-CSE-ConnectionGUID: 7B/ur4ZLQ+aRBTuzYZlftA==
X-CSE-MsgGUID: xlAGwIUBQqC6iTOj1Rx9dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35926004"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="35926004"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 02:06:18 -0800
X-CSE-ConnectionGUID: SnfJAbasSv2K+f1/x4bswA==
X-CSE-MsgGUID: UDRzRzi5StuOsQwsp8Mq1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101309917"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jan 2025 02:06:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTI5m-0008Nf-0A;
	Thu, 02 Jan 2025 10:06:14 +0000
Date: Thu, 2 Jan 2025 18:05:35 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/739 1/1] fs/bcachefs/acl.c:139:8: error:
 use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
Message-ID: <202501021835.ZTMKin1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/739
head:   5aab4d7cc3e134b97e6bb36ea9d51325e66e258c
commit: 5aab4d7cc3e134b97e6bb36ea9d51325e66e258c [1/1] Fix typos
config: x86_64-randconfig-078-20250102 (https://download.01.org/0day-ci/archive/20250102/202501021835.ZTMKin1q-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021835.ZTMKin1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021835.ZTMKin1q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/acl.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/bcachefs/acl.c:139:8: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     139 |         acl = allocate_dropping_locks(trans, ret,
         |               ^
   fs/bcachefs/btree_iter.h:900:37: note: expanded from macro 'allocate_dropping_locks'
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^
>> fs/bcachefs/acl.c:139:8: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:900:59: note: expanded from macro 'allocate_dropping_locks'
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^
   fs/bcachefs/acl.c:425:8: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     425 |         ret = allocate_dropping_locks_errcode(trans,
         |               ^
   fs/bcachefs/btree_iter.h:890:31: note: expanded from macro 'allocate_dropping_locks_errcode'
     890 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                      ^
   fs/bcachefs/acl.c:425:8: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:890:53: note: expanded from macro 'allocate_dropping_locks_errcode'
     890 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                            ^
   1 warning and 4 errors generated.


vim +/PF_MEMALLOC_NORECLAIM +139 fs/bcachefs/acl.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16   87  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   88  /*
1c6fdbd8f2465d Kent Overstreet 2017-03-16   89   * Convert from filesystem to in-memory representation.
1c6fdbd8f2465d Kent Overstreet 2017-03-16   90   */
5ff10c0a04c421 Kent Overstreet 2023-05-28   91  static struct posix_acl *bch2_acl_from_disk(struct btree_trans *trans,
5ff10c0a04c421 Kent Overstreet 2023-05-28   92  					    const void *value, size_t size)
1c6fdbd8f2465d Kent Overstreet 2017-03-16   93  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16   94  	const void *p, *end = value + size;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   95  	struct posix_acl *acl;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   96  	struct posix_acl_entry *out;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   97  	unsigned count = 0;
5ff10c0a04c421 Kent Overstreet 2023-05-28   98  	int ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   99  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  100  	if (!value)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  101  		return NULL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  102  	if (size < sizeof(bch_acl_header))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  103  		goto invalid;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  104  	if (((bch_acl_header *)value)->a_version !=
1c6fdbd8f2465d Kent Overstreet 2017-03-16  105  	    cpu_to_le32(BCH_ACL_VERSION))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  106  		goto invalid;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  107  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  108  	p = value + sizeof(bch_acl_header);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  109  	while (p < end) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  110  		const bch_acl_entry *entry = p;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  111  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  112  		if (p + sizeof(bch_acl_entry_short) > end)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  113  			goto invalid;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  114  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  115  		switch (le16_to_cpu(entry->e_tag)) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  116  		case ACL_USER_OBJ:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  117  		case ACL_GROUP_OBJ:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  118  		case ACL_MASK:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  119  		case ACL_OTHER:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  120  			p += sizeof(bch_acl_entry_short);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  121  			break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  122  		case ACL_USER:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  123  		case ACL_GROUP:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  124  			p += sizeof(bch_acl_entry);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  125  			break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  126  		default:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  127  			goto invalid;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  128  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  129  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  130  		count++;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  131  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  132  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  133  	if (p > end)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  134  		goto invalid;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  135  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  136  	if (!count)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  137  		return NULL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  138  
5ff10c0a04c421 Kent Overstreet 2023-05-28 @139  	acl = allocate_dropping_locks(trans, ret,
5aab4d7cc3e134 Andrea Gelmini  2024-12-22  140  			posix_acl_alloc(count, GFP_KERNEL));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  141  	if (!acl)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  142  		return ERR_PTR(-ENOMEM);
5ff10c0a04c421 Kent Overstreet 2023-05-28  143  	if (ret) {
5ff10c0a04c421 Kent Overstreet 2023-05-28  144  		kfree(acl);
5ff10c0a04c421 Kent Overstreet 2023-05-28  145  		return ERR_PTR(ret);
5ff10c0a04c421 Kent Overstreet 2023-05-28  146  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  147  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  148  	out = acl->a_entries;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  149  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  150  	p = value + sizeof(bch_acl_header);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  151  	while (p < end) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  152  		const bch_acl_entry *in = p;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  153  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  154  		out->e_tag  = le16_to_cpu(in->e_tag);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  155  		out->e_perm = le16_to_cpu(in->e_perm);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  156  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  157  		switch (out->e_tag) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  158  		case ACL_USER_OBJ:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  159  		case ACL_GROUP_OBJ:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  160  		case ACL_MASK:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  161  		case ACL_OTHER:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  162  			p += sizeof(bch_acl_entry_short);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  163  			break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  164  		case ACL_USER:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  165  			out->e_uid = make_kuid(&init_user_ns,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  166  					       le32_to_cpu(in->e_id));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  167  			p += sizeof(bch_acl_entry);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  168  			break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  169  		case ACL_GROUP:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  170  			out->e_gid = make_kgid(&init_user_ns,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  171  					       le32_to_cpu(in->e_id));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  172  			p += sizeof(bch_acl_entry);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  173  			break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  174  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  175  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  176  		out++;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  177  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  178  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  179  	BUG_ON(out != acl->a_entries + acl->a_count);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  180  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  181  	return acl;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  182  invalid:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  183  	pr_err("invalid acl entry");
1c6fdbd8f2465d Kent Overstreet 2017-03-16  184  	return ERR_PTR(-EINVAL);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  185  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  186  

:::::: The code at line 139 was first introduced by commit
:::::: 5ff10c0a04c4217b24997d9b127c50602d717ab3 bcachefs: Convert acl.c to allocate_dropping_locks()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
