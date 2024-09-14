Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279DA823D1;
	Sat, 14 Sep 2024 23:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726355969; cv=none; b=E9hlRaP2JWx6N4QNIbzxDUx46d1M2VsfMwr8kz6HrR7N2i4QOx1nnIh4O2Ur5Tiv6LTE7vnKnTPhfQIbW6Ct4X/3BkBGlAF5VRViDh6eOMyWzhwRQ0pCaX1RCTEUJN/HccMjjTN7VusBKWiFJgDqugfctwznnsM5xU2GMK+LJNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726355969; c=relaxed/simple;
	bh=y59VWu/bKAwTS9RtnpWc628YkLW9xowpbyjRRGSA1RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z00PwOad+DKJuRAmym1POjQT5InoPw725lB6DdVFv/tI8omogyatZ8EfJ9KK6tDlhuvx0cyJNws8WOkbY59NXNJZRni1xaKy7vORZcg4W+rphdQGc5cEEQBnSV2djSX9xQ7LNimCcpdsSAF5BXXHPjB9qQuc+yLupb9iAV6EwiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1vzXibx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1vzXibx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726355967; x=1757891967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y59VWu/bKAwTS9RtnpWc628YkLW9xowpbyjRRGSA1RM=;
  b=B1vzXibxYV+yl9Dfca9xlKuj1X/Olrt4aT1/bR11scJ2hk80xh2QSRlv
   TeXY0EBY/qXh58TXS+9DISB9+mTpAMDWsOxwNsqGLNAEc96zVJIEYGPdJ
   DTfEyEcrjddjFmNzCe1MIu+rwQgxgSUSZZmt2b6OOpB3wflin9t8xPujJ
   ZHQzC5PQfqBQaBSo46/mw4SAml0BIvBHq/TkEI2oAythl5CaDnOPOkT5v
   C+9vpmPM1ACtQVfqUPMBpE67bXZRkD/HmSQBTN7co56GwaVrt7xTTkjIX
   VOSmFUwn8To9YyI3Ufzid5dJTb4kcgr0zQbh2tX5SRllN76Uv8ir41Af6
   w==;
X-CSE-ConnectionGUID: hlL9OXlkSNeP4mJytjOnZg==
X-CSE-MsgGUID: hawdTnJrSdyusdKVYysoQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="28978112"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="28978112"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 16:19:24 -0700
X-CSE-ConnectionGUID: uXll9ZG1TLuteovD2ey5bw==
X-CSE-MsgGUID: cwhYQobvRWWJ05G8XB2sNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="73248255"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Sep 2024 16:19:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spc2y-0008ES-2W;
	Sat, 14 Sep 2024 23:19:20 +0000
Date: Sun, 15 Sep 2024 07:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC V4 1/1] ocfs2: reserve space for inline xattr before
 attaching reflink tree
Message-ID: <202409150732.E4EsYwaz-lkp@intel.com>
References: <20240912064720.898600-1-gautham.ananthakrishna@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912064720.898600-1-gautham.ananthakrishna@oracle.com>

Hi Gautham,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gautham-Ananthakrishna/ocfs2-reserve-space-for-inline-xattr-before-attaching-reflink-tree/20240912-144813
base:   linus/master
patch link:    https://lore.kernel.org/r/20240912064720.898600-1-gautham.ananthakrishna%40oracle.com
patch subject: [PATCH RFC V4 1/1] ocfs2: reserve space for inline xattr before attaching reflink tree
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240915/202409150732.E4EsYwaz-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150732.E4EsYwaz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150732.E4EsYwaz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ocfs2/refcounttree.c:4197:25: error: incompatible pointer types initializing 'struct ocfs2_dinode *' with an expression of type 'char *' [-Werror,-Wincompatible-pointer-types]
    4197 |                         struct ocfs2_dinode *new_di = new_bh->b_data;
         |                                              ^        ~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:4198:25: error: incompatible pointer types initializing 'struct ocfs2_dinode *' with an expression of type 'char *' [-Werror,-Wincompatible-pointer-types]
    4198 |                         struct ocfs2_dinode *old_di = old_bh->b_data;
         |                                              ^        ~~~~~~~~~~~~~~
   2 errors generated.


vim +4197 fs/ocfs2/refcounttree.c

  4150	
  4151	static int __ocfs2_reflink(struct dentry *old_dentry,
  4152				   struct buffer_head *old_bh,
  4153				   struct inode *new_inode,
  4154				   bool preserve)
  4155	{
  4156		int ret;
  4157		struct inode *inode = d_inode(old_dentry);
  4158		struct buffer_head *new_bh = NULL;
  4159		struct ocfs2_inode_info *oi = OCFS2_I(inode);
  4160	
  4161		if (oi->ip_flags & OCFS2_INODE_SYSTEM_FILE) {
  4162			ret = -EINVAL;
  4163			mlog_errno(ret);
  4164			goto out;
  4165		}
  4166	
  4167		ret = filemap_fdatawrite(inode->i_mapping);
  4168		if (ret) {
  4169			mlog_errno(ret);
  4170			goto out;
  4171		}
  4172	
  4173		ret = ocfs2_attach_refcount_tree(inode, old_bh);
  4174		if (ret) {
  4175			mlog_errno(ret);
  4176			goto out;
  4177		}
  4178	
  4179		inode_lock_nested(new_inode, I_MUTEX_CHILD);
  4180		ret = ocfs2_inode_lock_nested(new_inode, &new_bh, 1,
  4181					      OI_LS_REFLINK_TARGET);
  4182		if (ret) {
  4183			mlog_errno(ret);
  4184			goto out_unlock;
  4185		}
  4186	
  4187		if ((oi->ip_dyn_features & OCFS2_HAS_XATTR_FL) &&
  4188		    (oi->ip_dyn_features & OCFS2_INLINE_XATTR_FL)) {
  4189			/*
  4190			 * Adjust extent record count to reserve space for extended attribute.
  4191			 * Inline data count had been adjusted in ocfs2_duplicate_inline_data().
  4192			 */
  4193			struct ocfs2_inode_info *new_oi = OCFS2_I(new_inode);
  4194	
  4195			if (!(new_oi->ip_dyn_features & OCFS2_INLINE_DATA_FL) &&
  4196			    !(ocfs2_inode_is_fast_symlink(new_inode))) {
> 4197				struct ocfs2_dinode *new_di = new_bh->b_data;
  4198				struct ocfs2_dinode *old_di = old_bh->b_data;
  4199				struct ocfs2_extent_list *el = &new_di->id2.i_list;
  4200				int inline_size = le16_to_cpu(old_di->i_xattr_inline_size);
  4201	
  4202				le16_add_cpu(&el->l_count, -(inline_size /
  4203						sizeof(struct ocfs2_extent_rec)));
  4204			}
  4205		}
  4206	
  4207		ret = ocfs2_create_reflink_node(inode, old_bh,
  4208						new_inode, new_bh, preserve);
  4209		if (ret) {
  4210			mlog_errno(ret);
  4211			goto inode_unlock;
  4212		}
  4213	
  4214		if (oi->ip_dyn_features & OCFS2_HAS_XATTR_FL) {
  4215			ret = ocfs2_reflink_xattrs(inode, old_bh,
  4216						   new_inode, new_bh,
  4217						   preserve);
  4218			if (ret) {
  4219				mlog_errno(ret);
  4220				goto inode_unlock;
  4221			}
  4222		}
  4223	
  4224		ret = ocfs2_complete_reflink(inode, old_bh,
  4225					     new_inode, new_bh, preserve);
  4226		if (ret)
  4227			mlog_errno(ret);
  4228	
  4229	inode_unlock:
  4230		ocfs2_inode_unlock(new_inode, 1);
  4231		brelse(new_bh);
  4232	out_unlock:
  4233		inode_unlock(new_inode);
  4234	out:
  4235		if (!ret) {
  4236			ret = filemap_fdatawait(inode->i_mapping);
  4237			if (ret)
  4238				mlog_errno(ret);
  4239		}
  4240		return ret;
  4241	}
  4242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
