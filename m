Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE131193091;
	Sat, 19 Oct 2024 04:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729313786; cv=none; b=ckePg4DYuFrzxgASPmhJWhfa1LQzSkIhyMFln5JjTvOFUKPBE4Es3UyZYm26FI3m6WcviGPv3STWLeZZ305JmWiqyMCmxYsvtu45GhGsY9yYLhZuCCXezvwFqkHL06j9IuzrkbnUODi/VGhqotLhXLgLfK8lpsC7JXUHqXS7fn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729313786; c=relaxed/simple;
	bh=xCW92WfZMGH6AxBNDi2Pul7yXrzQQpptMejorAbSj6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZukkelEmj1JZauBZ/zSl4C0kD7RPqL731NO+vHdMBSlmBPuZzbBbBrmQ4JUdkHpdTTahnp2Tz/3kIzqW4zlG+yYeMTBq2BjZrYSHDQ1VVHkwmbpJZTNuJetW9dAnhjHi2ijtLoU9Oqe26GZr5eFN05tqvqed/ICrfW6NOb3twUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwEvE/2I; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwEvE/2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729313784; x=1760849784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xCW92WfZMGH6AxBNDi2Pul7yXrzQQpptMejorAbSj6U=;
  b=jwEvE/2IBUuk8H+DHvvY1LcxaO/GQ2zVJ3feNZ+/aZyA7JMJfgsbabOT
   gwqxwvFhgLkGMEyIYiKMoKS+JjqH1UP5cEvJrWFG4Ip/XLOV6JW8wfjsS
   wXMMQlpUkOtLSmQdaCPtfP/OoF32GA9Kz+uYydWDUapcZwyW1rBCtU+kD
   562rl6Ez+vvU2zY8I2sGfVQzw9OUwfAzagtXPjxIoOMVCZJo3HMCl30p0
   12g1q7gRrf7HOORLfs6kHrK0/jUNJeF3/j9CTOC7+q5LbB2AoqRX+y3J7
   18UM38x1nO/AhP+7vrR2H2cQAQ1PviBjjWuz5NtUTohniG3Y+w3QNeNcB
   g==;
X-CSE-ConnectionGUID: Bi2BLnheRjeq3xzVqC1ieg==
X-CSE-MsgGUID: I61IxmF3TeyzE8mXj14y7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40217519"
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="40217519"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 21:56:23 -0700
X-CSE-ConnectionGUID: HftTUN5PTM6QD2ZTBqghag==
X-CSE-MsgGUID: pyQ9DcLbTCOSC35mmrItoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="79390642"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Oct 2024 21:56:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t21Vj-000Ohl-2s;
	Sat, 19 Oct 2024 04:56:19 +0000
Date: Sat, 19 Oct 2024 12:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/739 1/1] fs/bcachefs/acl.c:139:8: error:
 use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
Message-ID: <202410191232.eY2DpOXr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/739
head:   6ea5c17ba85f21d50adc867374b9fc1786e2d8ea
commit: 6ea5c17ba85f21d50adc867374b9fc1786e2d8ea [1/1] Fix typos
config: i386-buildonly-randconfig-002-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191232.eY2DpOXr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191232.eY2DpOXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191232.eY2DpOXr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/acl.c:139:8: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     139 |         acl = allocate_dropping_locks(trans, ret,
         |               ^
   fs/bcachefs/btree_iter.h:903:37: note: expanded from macro 'allocate_dropping_locks'
     903 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^
>> fs/bcachefs/acl.c:139:8: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:903:59: note: expanded from macro 'allocate_dropping_locks'
     903 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^
   fs/bcachefs/acl.c:425:8: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     425 |         ret = allocate_dropping_locks_errcode(trans,
         |               ^
   fs/bcachefs/btree_iter.h:893:31: note: expanded from macro 'allocate_dropping_locks_errcode'
     893 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                      ^
   fs/bcachefs/acl.c:425:8: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:893:53: note: expanded from macro 'allocate_dropping_locks_errcode'
     893 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                            ^
   4 errors generated.
--
>> fs/bcachefs/ec.c:951:9: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     951 |         return allocate_dropping_locks_errcode(trans,
         |                ^
   fs/bcachefs/btree_iter.h:893:31: note: expanded from macro 'allocate_dropping_locks_errcode'
     893 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                      ^
>> fs/bcachefs/ec.c:951:9: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:893:53: note: expanded from macro 'allocate_dropping_locks_errcode'
     893 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                            ^
   2 errors generated.
--
>> fs/bcachefs/btree_cache.c:807:24: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'; did you mean 'KMALLOC_RECLAIM'?
     807 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
         |                               KMALLOC_RECLAIM
   fs/bcachefs/btree_iter.h:885:46: note: expanded from macro 'memalloc_flags_do'
     885 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^
   include/linux/slab.h:584:2: note: 'KMALLOC_RECLAIM' declared here
     584 |         KMALLOC_RECLAIM = KMALLOC_NORMAL,
         |         ^
   1 error generated.
--
>> fs/bcachefs/btree_key_cache.c:149:7: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^
   fs/bcachefs/btree_iter.h:903:37: note: expanded from macro 'allocate_dropping_locks'
     903 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^
>> fs/bcachefs/btree_key_cache.c:149:7: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:903:59: note: expanded from macro 'allocate_dropping_locks'
     903 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^
   fs/bcachefs/btree_key_cache.c:243:26: error: use of undeclared identifier 'PF_MEMALLOC_NORECLAIM'
     243 |                 struct bkey_i *new_k = allocate_dropping_locks(trans, ret,
         |                                        ^
   fs/bcachefs/btree_iter.h:903:37: note: expanded from macro 'allocate_dropping_locks'
     903 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^
   fs/bcachefs/btree_key_cache.c:243:26: error: use of undeclared identifier 'PF_MEMALLOC_NOWARN'
   fs/bcachefs/btree_iter.h:903:59: note: expanded from macro 'allocate_dropping_locks'
     903 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^
   4 errors generated.


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
6ea5c17ba85f21 Andrea Gelmini  2024-10-10  140  			posix_acl_alloc(count, GFP_KERNEL));
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
