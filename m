Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43111791ED;
	Sat, 26 Oct 2024 17:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729965441; cv=none; b=dT1wJ4+l21x2C+aDhNUXFNuaGqT8it4Ou5dsYl+LZjjNSB0FVd2vwvH8mPfNTQDh6fGqGCHB+54v3N6+Cz+F79OI/7U7D+2VsiPgkz4cCPLCB/irBLWqKnwIsPWLhayow7SfVIwJrEynfhiAYNIvVUU0d243+igLPN2RDx4/ciU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729965441; c=relaxed/simple;
	bh=YEACSpNLr08Q7WcLylyvZBLckMRtdTYSW38WRmpy7No=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jl64XBbJXWfM33DTt31AWCihq9AobIzTsVIcQTVs3/U+kAoj4iIn48RPJs2IE6JI3sTvTImRPYevTbfyVEKr8lEnWNPqgQotlHB+gCYbdF9YmKv0alji/C22mS5/haK8im8yttfTyA3dEQ6spHdjgFrLbwwQV/29iLJvrv5jwZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpnp21vv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpnp21vv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729965438; x=1761501438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YEACSpNLr08Q7WcLylyvZBLckMRtdTYSW38WRmpy7No=;
  b=jpnp21vvhAxYnMut0k3KXkLLpStKAHt1UepDjEwZ+WYnzir3+z3kjUk7
   Dm14Q8QoV+9MDqYkm/AoNVZ67a6hzI8caZnUQ6JvFxQR2HFXOA4X37AU8
   S0wVpzDFwPsomk7wSMrja7a31Szn7TbnLbmyivv0Kav58ZqFfsX45Gsxb
   /cb29Xw3xQ2rbu96tZ7EF6OCVW8U3PV1691mDRML18J6PVACcWrCp9Ak4
   nPsHBfnW2UkuD2iC2LIRaxjsnWMqDHalZ+0edrmFcJyntKB6BYTm05IHH
   KDr3rQLDGgn6fkJJtuHpsmtsCrqS6tslEMLMIj5GNJ0HJd5dd6slRSJCj
   A==;
X-CSE-ConnectionGUID: oJ1mE0OXTDOb2mJF0jW9eg==
X-CSE-MsgGUID: qzggFbvCSSOO+jw8PN/lfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29802607"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29802607"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 10:57:18 -0700
X-CSE-ConnectionGUID: orCWOtXeQAeP2B2AXmZF0Q==
X-CSE-MsgGUID: 94rX+scwRhy31DOO3j46Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="81674551"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Oct 2024 10:57:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4l2H-000ZuC-1e;
	Sat, 26 Oct 2024 17:57:13 +0000
Date: Sun, 27 Oct 2024 01:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sandeen:mount-api 7/7] fs/devpts/inode.c:354:8: error: call to
 undeclared function 'parse_mount_options'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202410270136.pUT4Udbn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git mount-api
head:   cf7abe7ded8f2c97728ebb2655ca09970b4cdeb6
commit: cf7abe7ded8f2c97728ebb2655ca09970b4cdeb6 [7/7] devpts: convert to the new mount API
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241027/202410270136.pUT4Udbn-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270136.pUT4Udbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270136.pUT4Udbn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/devpts/inode.c:19:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:40:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/devpts/inode.c:251:18: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
     251 |         if (fc->purpose = FS_CONTEXT_FOR_MOUNT)
         |             ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   fs/devpts/inode.c:251:18: note: place parentheses around the assignment to silence this warning
     251 |         if (fc->purpose = FS_CONTEXT_FOR_MOUNT)
         |                         ^                     
         |             (                                 )
   fs/devpts/inode.c:251:18: note: use '==' to turn this assignment into an equality comparison
     251 |         if (fc->purpose = FS_CONTEXT_FOR_MOUNT)
         |                         ^
         |                         ==
>> fs/devpts/inode.c:354:8: error: call to undeclared function 'parse_mount_options'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     354 |         err = parse_mount_options(data, PARSE_REMOUNT, opts);
         |               ^
   fs/devpts/inode.c:354:8: note: did you mean 'parse_early_options'?
   include/linux/init.h:382:13: note: 'parse_early_options' declared here
     382 | void __init parse_early_options(char *cmdline);
         |             ^
>> fs/devpts/inode.c:492:17: error: use of undeclared identifier 'devpts_reconfigure'
     492 |         .reconfigure    = devpts_reconfigure,
         |                           ^
   5 warnings and 2 errors generated.


vim +/parse_mount_options +354 fs/devpts/inode.c

2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02  231  
1f71ebedb3f8ce Sukadev Bhattiprolu   2009-05-14  232  /*
1f71ebedb3f8ce Sukadev Bhattiprolu   2009-05-14  233   * parse_mount_options():
1f71ebedb3f8ce Sukadev Bhattiprolu   2009-05-14  234   *	Set @opts to mount options specified in @data. If an option is not
eedf265aa003b4 Eric W. Biederman     2016-06-02  235   *	specified in @data, set it to its default value.
1f71ebedb3f8ce Sukadev Bhattiprolu   2009-05-14  236   *
1f71ebedb3f8ce Sukadev Bhattiprolu   2009-05-14  237   * Note: @data may be NULL (in which case all options are set to default).
1f71ebedb3f8ce Sukadev Bhattiprolu   2009-05-14  238   */
cf7abe7ded8f2c Eric Sandeen          2024-10-25  239  // static int parse_mount_options(char *data, int op, struct pts_mount_opts *opts)
cf7abe7ded8f2c Eric Sandeen          2024-10-25  240  static int devpts_parse_param(struct fs_context *fc, struct fs_parameter *param)
^1da177e4c3f41 Linus Torvalds        2005-04-16  241  {
cf7abe7ded8f2c Eric Sandeen          2024-10-25  242  	struct pts_fs_info *fsi = fc->s_fs_info;
cf7abe7ded8f2c Eric Sandeen          2024-10-25  243  	struct pts_mount_opts *opts = &fsi->mount_opts;
cf7abe7ded8f2c Eric Sandeen          2024-10-25  244  	struct fs_parse_result result;
cf7abe7ded8f2c Eric Sandeen          2024-10-25  245  	int opt;
7a673c6b8fff4b Domen Puncer          2006-03-23  246  
7a673c6b8fff4b Domen Puncer          2006-03-23  247  
eedf265aa003b4 Eric W. Biederman     2016-06-02  248  	/* Only allow instances mounted from the initial mount
eedf265aa003b4 Eric W. Biederman     2016-06-02  249  	 * namespace to tap the reserve pool of ptys.
eedf265aa003b4 Eric W. Biederman     2016-06-02  250  	 */
cf7abe7ded8f2c Eric Sandeen          2024-10-25 @251  	if (fc->purpose = FS_CONTEXT_FOR_MOUNT)
eedf265aa003b4 Eric W. Biederman     2016-06-02  252  		opts->reserve =
eedf265aa003b4 Eric W. Biederman     2016-06-02  253  			(current->nsproxy->mnt_ns == init_task.nsproxy->mnt_ns);
2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02  254  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  255  	opt = fs_parse(fc, devpts_param_spec, param, &result);
7a673c6b8fff4b Domen Puncer          2006-03-23  256  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  257  	switch (opt) {
7a673c6b8fff4b Domen Puncer          2006-03-23  258  	case Opt_uid:
cf7abe7ded8f2c Eric Sandeen          2024-10-25  259  		opts->uid = result.uid;
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  260  		opts->setuid = 1;
7a673c6b8fff4b Domen Puncer          2006-03-23  261  		break;
7a673c6b8fff4b Domen Puncer          2006-03-23  262  	case Opt_gid:
cf7abe7ded8f2c Eric Sandeen          2024-10-25  263  		opts->gid = result.gid;
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  264  		opts->setgid = 1;
7a673c6b8fff4b Domen Puncer          2006-03-23  265  		break;
7a673c6b8fff4b Domen Puncer          2006-03-23  266  	case Opt_mode:
cf7abe7ded8f2c Eric Sandeen          2024-10-25  267  		opts->mode = result.uint_32 & S_IALLUGO;
7a673c6b8fff4b Domen Puncer          2006-03-23  268  		break;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  269  	case Opt_ptmxmode:
cf7abe7ded8f2c Eric Sandeen          2024-10-25  270  		opts->ptmxmode = result.uint_32 & S_IALLUGO;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  271  		break;
2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02  272  	case Opt_newinstance:
2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02  273  		break;
e9aba5158a8009 Konstantin Khlebnikov 2012-01-05  274  	case Opt_max:
cf7abe7ded8f2c Eric Sandeen          2024-10-25  275  		 if (result.int_32 < 0 || result.int_32 > NR_UNIX98_PTY_MAX)
e9aba5158a8009 Konstantin Khlebnikov 2012-01-05  276  			return -EINVAL;
cf7abe7ded8f2c Eric Sandeen          2024-10-25  277  		opts->max = result.int_32;
e9aba5158a8009 Konstantin Khlebnikov 2012-01-05  278  		break;
7a673c6b8fff4b Domen Puncer          2006-03-23  279  	default:
^1da177e4c3f41 Linus Torvalds        2005-04-16  280  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  281  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  282  
^1da177e4c3f41 Linus Torvalds        2005-04-16  283  	return 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  284  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  285  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  286  static int mknod_ptmx(struct super_block *sb)
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  287  {
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  288  	int mode;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  289  	int rc = -ENOMEM;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  290  	struct dentry *dentry;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  291  	struct inode *inode;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  292  	struct dentry *root = sb->s_root;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  293  	struct pts_fs_info *fsi = DEVPTS_SB(sb);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  294  	struct pts_mount_opts *opts = &fsi->mount_opts;
e98d41370392db Eric W. Biederman     2016-09-14  295  	kuid_t ptmx_uid = current_fsuid();
e98d41370392db Eric W. Biederman     2016-09-14  296  	kgid_t ptmx_gid = current_fsgid();
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  297  
5955102c9984fa Al Viro               2016-01-22  298  	inode_lock(d_inode(root));
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  299  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  300  	/* If we have already created ptmx node, return */
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  301  	if (fsi->ptmx_dentry) {
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  302  		rc = 0;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  303  		goto out;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  304  	}
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  305  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  306  	dentry = d_alloc_name(root, "ptmx");
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  307  	if (!dentry) {
04541a2f316022 Fabian Frederick      2014-06-06  308  		pr_err("Unable to alloc dentry for ptmx node\n");
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  309  		goto out;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  310  	}
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  311  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  312  	/*
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  313  	 * Create a new 'ptmx' node in this mount of devpts.
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  314  	 */
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  315  	inode = new_inode(sb);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  316  	if (!inode) {
04541a2f316022 Fabian Frederick      2014-06-06  317  		pr_err("Unable to alloc inode for ptmx node\n");
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  318  		dput(dentry);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  319  		goto out;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  320  	}
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  321  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  322  	inode->i_ino = 2;
69d9116d0a0d99 Jeff Layton           2023-10-04  323  	simple_inode_init_ts(inode);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  324  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  325  	mode = S_IFCHR|opts->ptmxmode;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  326  	init_special_inode(inode, mode, MKDEV(TTYAUX_MAJOR, 2));
e98d41370392db Eric W. Biederman     2016-09-14  327  	inode->i_uid = ptmx_uid;
e98d41370392db Eric W. Biederman     2016-09-14  328  	inode->i_gid = ptmx_gid;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  329  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  330  	d_add(dentry, inode);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  331  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  332  	fsi->ptmx_dentry = dentry;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  333  	rc = 0;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  334  out:
5955102c9984fa Al Viro               2016-01-22  335  	inode_unlock(d_inode(root));
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  336  	return rc;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  337  }
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  338  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  339  static void update_ptmx_mode(struct pts_fs_info *fsi)
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  340  {
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  341  	struct inode *inode;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  342  	if (fsi->ptmx_dentry) {
2b0143b5c986be David Howells         2015-03-17  343  		inode = d_inode(fsi->ptmx_dentry);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  344  		inode->i_mode = S_IFCHR|fsi->mount_opts.ptmxmode;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  345  	}
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  346  }
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  347  
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  348  static int devpts_remount(struct super_block *sb, int *flags, char *data)
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  349  {
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  350  	int err;
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  351  	struct pts_fs_info *fsi = DEVPTS_SB(sb);
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  352  	struct pts_mount_opts *opts = &fsi->mount_opts;
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  353  
2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02 @354  	err = parse_mount_options(data, PARSE_REMOUNT, opts);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  355  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  356  	/*
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  357  	 * parse_mount_options() restores options to default values
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  358  	 * before parsing and may have changed ptmxmode. So, update the
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  359  	 * mode in the inode too. Bogus options don't fail the remount,
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  360  	 * so do this even on error return.
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  361  	 */
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  362  	update_ptmx_mode(fsi);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  363  
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  364  	return err;
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  365  }
53af8ee4094d80 Sukadev Bhattiprolu   2009-01-02  366  
34c80b1d93e6e2 Al Viro               2011-12-08  367  static int devpts_show_options(struct seq_file *seq, struct dentry *root)
b87a267eb7291d Miklos Szeredi        2008-02-08  368  {
34c80b1d93e6e2 Al Viro               2011-12-08  369  	struct pts_fs_info *fsi = DEVPTS_SB(root->d_sb);
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  370  	struct pts_mount_opts *opts = &fsi->mount_opts;
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  371  
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  372  	if (opts->setuid)
04541a2f316022 Fabian Frederick      2014-06-06  373  		seq_printf(seq, ",uid=%u",
04541a2f316022 Fabian Frederick      2014-06-06  374  			   from_kuid_munged(&init_user_ns, opts->uid));
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  375  	if (opts->setgid)
04541a2f316022 Fabian Frederick      2014-06-06  376  		seq_printf(seq, ",gid=%u",
04541a2f316022 Fabian Frederick      2014-06-06  377  			   from_kgid_munged(&init_user_ns, opts->gid));
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  378  	seq_printf(seq, ",mode=%03o", opts->mode);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  379  	seq_printf(seq, ",ptmxmode=%03o", opts->ptmxmode);
e9aba5158a8009 Konstantin Khlebnikov 2012-01-05  380  	if (opts->max < NR_UNIX98_PTY_MAX)
e9aba5158a8009 Konstantin Khlebnikov 2012-01-05  381  		seq_printf(seq, ",max=%d", opts->max);
b87a267eb7291d Miklos Szeredi        2008-02-08  382  
b87a267eb7291d Miklos Szeredi        2008-02-08  383  	return 0;
b87a267eb7291d Miklos Szeredi        2008-02-08  384  }
b87a267eb7291d Miklos Szeredi        2008-02-08  385  
ee9b6d61a2a43c Josef 'Jeff' Sipek    2007-02-12  386  static const struct super_operations devpts_sops = {
^1da177e4c3f41 Linus Torvalds        2005-04-16  387  	.statfs		= simple_statfs,
^1da177e4c3f41 Linus Torvalds        2005-04-16  388  	.remount_fs	= devpts_remount,
b87a267eb7291d Miklos Szeredi        2008-02-08  389  	.show_options	= devpts_show_options,
^1da177e4c3f41 Linus Torvalds        2005-04-16  390  };
^1da177e4c3f41 Linus Torvalds        2005-04-16  391  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  392  #if 0
67245ff332064c Linus Torvalds        2016-04-16  393  static void *new_pts_fs_info(struct super_block *sb)
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  394  {
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  395  	struct pts_fs_info *fsi;
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  396  
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  397  	fsi = kzalloc(sizeof(struct pts_fs_info), GFP_KERNEL);
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  398  	if (!fsi)
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  399  		return NULL;
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  400  
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  401  	ida_init(&fsi->allocated_ptys);
31af0abbdafb66 Sukadev Bhattiprolu   2009-01-02  402  	fsi->mount_opts.mode = DEVPTS_DEFAULT_MODE;
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  403  	fsi->mount_opts.ptmxmode = DEVPTS_DEFAULT_PTMX_MODE;
67245ff332064c Linus Torvalds        2016-04-16  404  	fsi->sb = sb;
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  405  
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  406  	return fsi;
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  407  }
cf7abe7ded8f2c Eric Sandeen          2024-10-25  408  #endif
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  409  
^1da177e4c3f41 Linus Torvalds        2005-04-16  410  static int
cf7abe7ded8f2c Eric Sandeen          2024-10-25  411  devpts_fill_super(struct super_block *s, struct fs_context *fc)
^1da177e4c3f41 Linus Torvalds        2005-04-16  412  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  413  	struct inode *inode;
dee87d47365e47 Eric W. Biederman     2016-09-14  414  	int error;
^1da177e4c3f41 Linus Torvalds        2005-04-16  415  
cc50a07a247e17 Eric W. Biederman     2016-06-09  416  	s->s_iflags &= ~SB_I_NODEV;
^1da177e4c3f41 Linus Torvalds        2005-04-16  417  	s->s_blocksize = 1024;
^1da177e4c3f41 Linus Torvalds        2005-04-16  418  	s->s_blocksize_bits = 10;
^1da177e4c3f41 Linus Torvalds        2005-04-16  419  	s->s_magic = DEVPTS_SUPER_MAGIC;
^1da177e4c3f41 Linus Torvalds        2005-04-16  420  	s->s_op = &devpts_sops;
73052b0daee0b7 Varad Gautam          2019-01-24  421  	s->s_d_op = &simple_dentry_operations;
^1da177e4c3f41 Linus Torvalds        2005-04-16  422  	s->s_time_gran = 1;
^1da177e4c3f41 Linus Torvalds        2005-04-16  423  
dee87d47365e47 Eric W. Biederman     2016-09-14  424  	error = -ENOMEM;
cf7abe7ded8f2c Eric Sandeen          2024-10-25  425  	//s->s_fs_info = new_pts_fs_info(s);
cf7abe7ded8f2c Eric Sandeen          2024-10-25  426  	//if (!s->s_fs_info)
cf7abe7ded8f2c Eric Sandeen          2024-10-25  427  	//	goto fail;
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  428  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  429  	//error = parse_mount_options(data, PARSE_MOUNT, &DEVPTS_SB(s)->mount_opts);
cf7abe7ded8f2c Eric Sandeen          2024-10-25  430  	//if (error)
cf7abe7ded8f2c Eric Sandeen          2024-10-25  431  	//	goto fail;
dee87d47365e47 Eric W. Biederman     2016-09-14  432  
^1da177e4c3f41 Linus Torvalds        2005-04-16  433  	inode = new_inode(s);
^1da177e4c3f41 Linus Torvalds        2005-04-16  434  	if (!inode)
3850aba74873aa Al Viro               2012-01-08  435  		goto fail;
^1da177e4c3f41 Linus Torvalds        2005-04-16  436  	inode->i_ino = 1;
69d9116d0a0d99 Jeff Layton           2023-10-04  437  	simple_inode_init_ts(inode);
^1da177e4c3f41 Linus Torvalds        2005-04-16  438  	inode->i_mode = S_IFDIR | S_IRUGO | S_IXUGO | S_IWUSR;
^1da177e4c3f41 Linus Torvalds        2005-04-16  439  	inode->i_op = &simple_dir_inode_operations;
^1da177e4c3f41 Linus Torvalds        2005-04-16  440  	inode->i_fop = &simple_dir_operations;
bfe8684869601d Miklos Szeredi        2011-10-28  441  	set_nlink(inode, 2);
^1da177e4c3f41 Linus Torvalds        2005-04-16  442  
48fde701aff662 Al Viro               2012-01-08  443  	s->s_root = d_make_root(inode);
180d904442023d Eric W. Biederman     2016-09-14  444  	if (!s->s_root) {
04541a2f316022 Fabian Frederick      2014-06-06  445  		pr_err("get root dentry failed\n");
180d904442023d Eric W. Biederman     2016-09-14  446  		goto fail;
180d904442023d Eric W. Biederman     2016-09-14  447  	}
180d904442023d Eric W. Biederman     2016-09-14  448  
180d904442023d Eric W. Biederman     2016-09-14  449  	error = mknod_ptmx(s);
180d904442023d Eric W. Biederman     2016-09-14  450  	if (error)
180d904442023d Eric W. Biederman     2016-09-14  451  		goto fail_dput;
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  452  
180d904442023d Eric W. Biederman     2016-09-14  453  	return 0;
180d904442023d Eric W. Biederman     2016-09-14  454  fail_dput:
180d904442023d Eric W. Biederman     2016-09-14  455  	dput(s->s_root);
180d904442023d Eric W. Biederman     2016-09-14  456  	s->s_root = NULL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  457  fail:
dee87d47365e47 Eric W. Biederman     2016-09-14  458  	return error;
^1da177e4c3f41 Linus Torvalds        2005-04-16  459  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  460  
2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02  461  /*
cf7abe7ded8f2c Eric Sandeen          2024-10-25  462   * devpts_get_tree()
289f00e225a6f6 Sukadev Bhattiprolu   2009-03-07  463   *
eedf265aa003b4 Eric W. Biederman     2016-06-02  464   *     Mount a new (private) instance of devpts.  PTYs created in this
eedf265aa003b4 Eric W. Biederman     2016-06-02  465   *     instance are independent of the PTYs in other devpts instances.
d4076ac55bf875 Sukadev Bhattiprolu   2009-01-02  466   */
cf7abe7ded8f2c Eric Sandeen          2024-10-25  467  static int devpts_get_tree(struct fs_context *fc)
^1da177e4c3f41 Linus Torvalds        2005-04-16  468  {
cf7abe7ded8f2c Eric Sandeen          2024-10-25  469  	return get_tree_nodev(fc, devpts_fill_super);
2a1b2dc0c83bbf Sukadev Bhattiprolu   2009-01-02  470  }
482984f06df54d Sukadev Bhattiprolu   2009-03-07  471  
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  472  static void devpts_kill_sb(struct super_block *sb)
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  473  {
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  474  	struct pts_fs_info *fsi = DEVPTS_SB(sb);
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  475  
40b320e1c75735 Eric W. Biederman     2016-09-14  476  	if (fsi)
66da0e1f903414 Ilija Hadzic          2013-11-12  477  		ida_destroy(&fsi->allocated_ptys);
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  478  	kfree(fsi);
1f8f1e296583f9 Sukadev Bhattiprolu   2009-01-02  479  	kill_litter_super(sb);
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  480  }
e76b7c01e598d2 Sukadev Bhattiprolu   2009-01-02  481  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  482  static void devpts_free_fc(struct fs_context *fc)
cf7abe7ded8f2c Eric Sandeen          2024-10-25  483  {
cf7abe7ded8f2c Eric Sandeen          2024-10-25  484  	struct pts_fs_info *fsi = fc->s_fs_info;
cf7abe7ded8f2c Eric Sandeen          2024-10-25  485  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  486  	kfree(fsi);
cf7abe7ded8f2c Eric Sandeen          2024-10-25  487  }
cf7abe7ded8f2c Eric Sandeen          2024-10-25  488  
cf7abe7ded8f2c Eric Sandeen          2024-10-25  489  static const struct fs_context_operations devpts_context_ops = {
cf7abe7ded8f2c Eric Sandeen          2024-10-25  490  	.parse_param	= devpts_parse_param,
cf7abe7ded8f2c Eric Sandeen          2024-10-25  491  	.get_tree	= devpts_get_tree,
cf7abe7ded8f2c Eric Sandeen          2024-10-25 @492  	.reconfigure	= devpts_reconfigure,
cf7abe7ded8f2c Eric Sandeen          2024-10-25  493  	.free		= devpts_free_fc,
cf7abe7ded8f2c Eric Sandeen          2024-10-25  494  };
cf7abe7ded8f2c Eric Sandeen          2024-10-25  495  

:::::: The code at line 354 was first introduced by commit
:::::: 2a1b2dc0c83bbfc24d72cafd5e69810a149b44e4 Enable multiple instances of devpts

:::::: TO: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
