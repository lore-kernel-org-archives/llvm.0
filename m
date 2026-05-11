Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360733CFF69;
	Mon, 11 May 2026 13:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504828; cv=none; b=XDXR/R+8o3jnQqyr7FkoCEk3uy7Y1E5dRL0WXRqqBRkSynCjHU39DsBJQSnyI8i/RX8pqJzxGawIip9CFjJ5MOHno5ss87TaJwjJ0USdHQbHrmqOLruKwqHbsRqg1tbJbjHvbgNZ3MSh9BynN6Kt57vFaa5gEc3gOW/C29SN/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504828; c=relaxed/simple;
	bh=dvI39vhuv8MbBZp1Wz9BVG2yO5TsDoC24dhBPA4wWXA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NGVuUxuXHsuZU7ocj5bUBK4l6EZNpg1DG2j42Zz3VUDfzr7UbRz2wyvhTs1mFGgQfBcbsbHMTbuAWhv4M3ta4vPtelK1c8K3gd9T75qqS17Hdo/m8s0PLfklj9lWAEwjrS9N5liRYiSCut7XH3G7bmv9jKUV0BILJUUtAZp2CKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7YOsSL1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7YOsSL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778504827; x=1810040827;
  h=date:from:to:cc:subject:message-id;
  bh=dvI39vhuv8MbBZp1Wz9BVG2yO5TsDoC24dhBPA4wWXA=;
  b=Y7YOsSL1cfq+21WcvKthQkHRSN8kTjOI/Aog51nDSwaIseOeyKaYPquD
   A1UAORfATyJJdOwmACM+TgDJ02ps2hUNG87Jxx2JzlC0M3I3xsluQ2yAX
   /Kv2Kb2TGNZcvL/MilbyqqnEYvAhsF7RS98eFY4FxEcvSwbGGquXSJvRy
   ipiYJeCSVVG4lP0H9Tuoks8psZs9Ciu2YJGMbYmXRCFLj/1bdD/6Z8JUM
   dULh4jZAnaNWdN4KyJMf+mMwp5C0Pj+lsgRl0htyYExjy0uPkh55niPdp
   0y0gnzFj9kpwJzJLY2gKLmwQaorbJHt+piyCLvf7A1amT5z5yTRAiYzqq
   w==;
X-CSE-ConnectionGUID: sTIh/uPtQ1SGk7cArp9Qiw==
X-CSE-MsgGUID: r148wwDbSOC0jngxQDLncA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89693264"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="89693264"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 06:07:04 -0700
X-CSE-ConnectionGUID: D0UoMul7T8OThTstUtUAqQ==
X-CSE-MsgGUID: 55Az6dnJQIugbqjFV0GK3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="233121530"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 May 2026 06:07:03 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMQLc-000000000c1-3TVS;
	Mon, 11 May 2026 13:07:00 +0000
Date: Mon, 11 May 2026 21:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v1 8/8]
 fs/configfs/mount.c:70:16: error: incomplete definition of type 'struct
 configfs_super_info'
Message-ID: <202605112124.QNu9jQRj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v1
head:   c924e1daab3eb4efc26275918155673d5e90c6ba
commit: c924e1daab3eb4efc26275918155673d5e90c6ba [8/8] configfs: configfs_create_root()
config: arm-randconfig-003-20260511 (https://download.01.org/0day-ci/archive/20260511/202605112124.QNu9jQRj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112124.QNu9jQRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112124.QNu9jQRj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/configfs/mount.c:70:16: error: incomplete definition of type 'struct configfs_super_info'
      70 |         return sb_info->root == info->root && sb_info->ns == info->ns;
         |                ~~~~~~~^
   fs/configfs/mount.c:66:9: note: forward declaration of 'struct configfs_super_info'
      66 |         struct configfs_super_info *sb_info =
         |                ^
   fs/configfs/mount.c:70:30: error: incomplete definition of type 'struct configfs_super_info'
      70 |         return sb_info->root == info->root && sb_info->ns == info->ns;
         |                                 ~~~~^
   fs/configfs/mount.c:66:9: note: forward declaration of 'struct configfs_super_info'
      66 |         struct configfs_super_info *sb_info =
         |                ^
   fs/configfs/mount.c:70:47: error: incomplete definition of type 'struct configfs_super_info'
      70 |         return sb_info->root == info->root && sb_info->ns == info->ns;
         |                                               ~~~~~~~^
   fs/configfs/mount.c:66:9: note: forward declaration of 'struct configfs_super_info'
      66 |         struct configfs_super_info *sb_info =
         |                ^
   fs/configfs/mount.c:70:59: error: incomplete definition of type 'struct configfs_super_info'
      70 |         return sb_info->root == info->root && sb_info->ns == info->ns;
         |                                                              ~~~~^
   fs/configfs/mount.c:66:9: note: forward declaration of 'struct configfs_super_info'
      66 |         struct configfs_super_info *sb_info =
         |                ^
>> fs/configfs/mount.c:80:9: error: invalid application of 'sizeof' to an incomplete type 'typeof (*info)' (aka 'struct configfs_super_info')
      80 |         info = kzalloc_obj(*info);
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1040:2: note: expanded from macro 'kzalloc_obj'
    1040 |         __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:973:37: note: expanded from macro '__alloc_objs'
     973 |         const size_t __obj_size = size_mul(sizeof(TYPE), COUNT);        \
         |                                            ^     ~~~~~~
   fs/configfs/mount.c:76:9: note: forward declaration of 'struct configfs_super_info'
      76 |         struct configfs_super_info *info;
         |                ^
   fs/configfs/mount.c:84:22: error: incomplete definition of type 'struct configfs_super_info'
      84 |         INIT_LIST_HEAD(&info->root.s_sibling);
         |                         ~~~~^
   fs/configfs/mount.c:76:9: note: forward declaration of 'struct configfs_super_info'
      76 |         struct configfs_super_info *info;
         |                ^
   fs/configfs/mount.c:85:22: error: incomplete definition of type 'struct configfs_super_info'
      85 |         INIT_LIST_HEAD(&info->root.s_children);
         |                         ~~~~^
   fs/configfs/mount.c:76:9: note: forward declaration of 'struct configfs_super_info'
      76 |         struct configfs_super_info *info;
         |                ^
   fs/configfs/mount.c:86:6: error: incomplete definition of type 'struct configfs_super_info'
      86 |         info->root.s_type = CONFIGFS_ROOT;
         |         ~~~~^
   fs/configfs/mount.c:76:9: note: forward declaration of 'struct configfs_super_info'
      76 |         struct configfs_super_info *info;
         |                ^
   fs/configfs/mount.c:87:6: error: incomplete definition of type 'struct configfs_super_info'
      87 |         info->root.s_element = &info->group.cg_item;
         |         ~~~~^
   fs/configfs/mount.c:76:9: note: forward declaration of 'struct configfs_super_info'
      76 |         struct configfs_super_info *info;
         |                ^
   fs/configfs/mount.c:87:30: error: incomplete definition of type 'struct configfs_super_info'
      87 |         info->root.s_element = &info->group.cg_item;
         |                                 ~~~~^
   fs/configfs/mount.c:76:9: note: forward declaration of 'struct configfs_super_info'
      76 |         struct configfs_super_info *info;
         |                ^
   fs/configfs/mount.c:88:6: error: incomplete definition of type 'struct configfs_super_info'
      88 |         info->ns = fsi->ns;
         |         ~~~~^
   fs/configfs/mount.c:76:9: note: forward declaration of 'struct configfs_super_info'
      76 |         struct configfs_super_info *info;
         |                ^
   fs/configfs/mount.c:90:6: error: incomplete definition of type 'struct configfs_super_info'
      90 |         info->group.cg_item.ci_name = (char *)root_name;
         |         ~~~~^
   fs/configfs/mount.c:76:9: note: forward declaration of 'struct configfs_super_info'
      76 |         struct configfs_super_info *info;
         |                ^
   fs/configfs/mount.c:98:13: error: incomplete definition of type 'struct configfs_super_info'
      98 |                                    &info->root, sb);
         |                                     ~~~~^
   fs/configfs/mount.c:76:9: note: forward declaration of 'struct configfs_super_info'
      76 |         struct configfs_super_info *info;
         |                ^
   fs/configfs/mount.c:114:25: error: incomplete definition of type 'struct configfs_super_info'
     114 |         config_group_init(&info->group);
         |                            ~~~~^
   fs/configfs/mount.c:76:9: note: forward declaration of 'struct configfs_super_info'
      76 |         struct configfs_super_info *info;
         |                ^
   fs/configfs/mount.c:115:6: error: incomplete definition of type 'struct configfs_super_info'
     115 |         info->group.cg_item.ci_dentry = root;
         |         ~~~~^
   fs/configfs/mount.c:76:9: note: forward declaration of 'struct configfs_super_info'
      76 |         struct configfs_super_info *info;
         |                ^
   fs/configfs/mount.c:116:24: error: incomplete definition of type 'struct configfs_super_info'
     116 |         root->d_fsdata = &info->root;
         |                           ~~~~^
   fs/configfs/mount.c:76:9: note: forward declaration of 'struct configfs_super_info'
      76 |         struct configfs_super_info *info;
         |                ^
>> fs/configfs/mount.c:126:9: error: call to undeclared function 'vfs_get_super'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         return vfs_get_super(fc, configfs_test_super, configfs_fill_super);
         |                ^
   fs/configfs/mount.c:126:9: note: did you mean 'vfs_get_tree'?
   include/linux/fs_context.h:147:12: note: 'vfs_get_tree' declared here
     147 | extern int vfs_get_tree(struct fs_context *fc);
         |            ^
>> fs/configfs/mount.c:188:2: error: use of undeclared identifier 'err'
     188 |         err = idr_alloc(&configfs_mount, root, ns->ns_id,
         |         ^~~
   fs/configfs/mount.c:190:6: error: use of undeclared identifier 'err'
     190 |         if (err < 0) {
         |             ^~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +70 fs/configfs/mount.c

    63	
    64	static int configfs_test_super(struct super_block *sb, struct fs_context *fc)
    65	{
  > 66		struct configfs_super_info *sb_info =
    67			(struct configfs_super_info *)sb->s_fs_info;
    68		struct configfs_super_info *info = fc->s_fs_info;
    69	
  > 70		return sb_info->root == info->root && sb_info->ns == info->ns;
    71	}
    72	
    73	static int configfs_fill_super(struct super_block *sb, struct fs_context *fc)
    74	{
    75		struct configfs_fs_info *fsi = fc->fs_private;
  > 76		struct configfs_super_info *info;
    77		struct inode *inode;
    78		struct dentry *root;
    79	
  > 80		info = kzalloc_obj(*info);
    81		if (!info)
    82			return -ENOMEM;
    83	
    84		INIT_LIST_HEAD(&info->root.s_sibling);
    85		INIT_LIST_HEAD(&info->root.s_children);
    86		info->root.s_type = CONFIGFS_ROOT;
    87		info->root.s_element = &info->group.cg_item;
    88		info->ns = fsi->ns;
    89	
    90		info->group.cg_item.ci_name = (char *)root_name;
    91		sb->s_blocksize = PAGE_SIZE;
    92		sb->s_blocksize_bits = PAGE_SHIFT;
    93		sb->s_magic = CONFIGFS_MAGIC;
    94		sb->s_op = &configfs_ops;
    95		sb->s_time_gran = 1;
    96	
    97		inode = configfs_new_inode(S_IFDIR | S_IRWXU | S_IRUGO | S_IXUGO,
    98					   &info->root, sb);
    99		if (inode) {
   100			inode->i_op = &configfs_root_inode_operations;
   101			inode->i_fop = &configfs_dir_operations;
   102			/* directory inodes start off with i_nlink == 2 (for "." entry) */
   103			inc_nlink(inode);
   104		} else {
   105			pr_debug("could not get root inode\n");
   106			return -ENOMEM;
   107		}
   108	
   109		root = d_make_root(inode);
   110		if (!root) {
   111			pr_debug("%s: could not get root dentry!\n",__func__);
   112			return -ENOMEM;
   113		}
   114		config_group_init(&info->group);
   115		info->group.cg_item.ci_dentry = root;
   116		root->d_fsdata = &info->root;
   117		sb->s_root = root;
   118		set_default_d_op(sb, &configfs_dentry_ops); /* the rest get that */
   119		sb->s_d_flags |= DCACHE_DONTCACHE;
   120		sb->s_fs_info = info;
   121		return 0;
   122	}
   123	
   124	static int configfs_get_tree(struct fs_context *fc)
   125	{
 > 126		return vfs_get_super(fc, configfs_test_super, configfs_fill_super);
   127	}
   128	
   129	static void configfs_fs_context_free(struct fs_context *fc)
   130	{
   131		struct configfs_fs_info *fsi = fc->fs_private;
   132	
   133		if (fsi->ns)
   134			kobj_ns_drop(KOBJ_NS_TYPE_NET, fsi->ns);
   135	
   136		kfree(fsi);
   137	}
   138	
   139	static const struct fs_context_operations configfs_context_ops = {
   140		.get_tree	= configfs_get_tree,
   141		.free		= configfs_fs_context_free,
   142	};
   143	
   144	static int configfs_init_fs_context(struct fs_context *fc)
   145	{
   146		struct configfs_fs_info *fsi;
   147	
   148		fsi = kzalloc_obj(*fsi);
   149		if (!fsi)
   150			return -ENOMEM;
   151		fsi->ns = kobj_ns_grab_current(KOBJ_NS_TYPE_NET);
   152		if (fsi->ns) {
   153			struct net *netns = to_net_ns(fsi->ns);
   154	
   155			put_user_ns(fc->user_ns);
   156			fc->user_ns = get_user_ns(netns->user_ns);
   157		}
   158		fc->fs_private = fsi;
   159		fc->ops = &configfs_context_ops;
   160		fc->global = true;
   161		return 0;
   162	}
   163	
   164	static void configfs_kill_sb(struct super_block *sb)
   165	{
   166		struct configfs_sb_info *info =
   167			(struct configfs_sb_info *)(sb->s_fs_info);
   168	
   169		kill_anon_super(sb);
   170		kfree(info);
   171	}
   172	
   173	static struct file_system_type configfs_fs_type = {
   174		.owner		= THIS_MODULE,
   175		.name		= "configfs",
   176		.init_fs_context = configfs_init_fs_context,
   177		.kill_sb	= configfs_kill_sb,
   178	};
   179	MODULE_ALIAS_FS("configfs");
   180	
   181	struct configfs_root_info *configfs_get_root(struct ns_common *ns)
   182	{
   183		struct configfs_root_info *root =
   184			kzalloc_obj(*root);
   185	
   186		if (!root)
   187			return ERR_PTR(-ENOMEM);
 > 188		err = idr_alloc(&configfs_mount, root, ns->ns_id,
   189				ns->ns_id + 1, GFP_KERNEL);
   190		if (err < 0) {
   191			kfree(root);
   192			return ERR_PTR(err);
   193		}
   194		WARN_ON(err != ns->ns_id);
   195		return root;
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
