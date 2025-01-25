Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC57083C;
	Sat, 25 Jan 2025 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737823408; cv=none; b=jtOBPrVqkpeqpTAKIO6W4b1NKqyNffKVZHSxnaZ/Huxx6e0kRzs4ygPsRMKbbxxtWoXuF5VqNRsi0abnvksbcqFOmmXdxD1g57rRQZ+fztqWkwZWOndf2Ow50oCdzucfcu+1W/FtgzJnRpyApNkzE7ec8P6Sqo6Cs1PWhab+GiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737823408; c=relaxed/simple;
	bh=9tFTdgZqre9E46+B1satkBaOYn5XrFcYPVYMWcyyJN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DLvvU7OUdZ1NPQZyBY+A6M03Gt72Vpw8PCOnVNIFnR6qkAqYDdmWSBS5ZOAKRY0McsWKXFFKKnHGRFq0sIJzYYfVLMSFXLXqRcw3QbgexlRprwLIhvLPxxv0dWdYKu/KG+O/7a+t6S3HuW5u78xIK+OYx7o7GQek5NLOQokzqY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTvWdg2C; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTvWdg2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737823406; x=1769359406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9tFTdgZqre9E46+B1satkBaOYn5XrFcYPVYMWcyyJN0=;
  b=XTvWdg2Cr2dAhwt0QmHTzJ+33wFXXkBo7Eg753Y64JpCJ1hURtaN/G24
   YwbSdpec6KnhsOX3hzaTLnrtj02Qr03a0C5634CRGdWBtfLT/320cEmTX
   mtEvg1kR0AtT7H7SaJStNDHsws7NxVWn2MyhIaukIWZMecvWsX+52IlBK
   xy1OKgv4fLB2yiK7yaDVByS4tsb2fjB+A2mNAxsgpal67CNUOsPmaZpJQ
   iNvK9VjvDWaqiuvwmOsKGKZ5CNYChegyIL+iisDJbgv35HqFxqP7eDVGO
   C6v+R41j4qSLaadjRzTygD5OnkeOBiM+PZV9jdUALl0gm4y4rZb4mH1Ap
   w==;
X-CSE-ConnectionGUID: IS+HO/7NQd6sXT+/a/NO7g==
X-CSE-MsgGUID: WzwkCeVhTjee8qI17DvZEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="42001806"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="42001806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 08:43:24 -0800
X-CSE-ConnectionGUID: P8czEk31RYOlKvixeZDHhw==
X-CSE-MsgGUID: Q9S77bi5RPKha+fSiUPAGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145280505"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jan 2025 08:43:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbjFf-000e1n-2j;
	Sat, 25 Jan 2025 16:43:19 +0000
Date: Sun, 26 Jan 2025 00:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bigeasy-staging:ucount 4/4] kernel/ucount.c:14:11: error: field
 designator 'refcnt' does not refer to any field in type 'atomic_t'
Message-ID: <202501260026.51BnOJBu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git ucount
head:   e9941c1a05c13c6c791c76ab322b385f5e535a6f
commit: e9941c1a05c13c6c791c76ab322b385f5e535a6f [4/4] ucount: use rcuref
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250126/202501260026.51BnOJBu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260026.51BnOJBu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501260026.51BnOJBu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/ucount.c:14:11: error: field designator 'refcnt' does not refer to any field in type 'atomic_t'
      14 |         .count = RCUREF_INIT(1),
         |                  ^~~~~~~~~~~~~~
   include/linux/types.h:192:27: note: expanded from macro 'RCUREF_INIT'
     192 | #define RCUREF_INIT(i)  { .refcnt = ATOMIC_INIT(i - 1) }
         |                           ~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/ucount.c:141:8: error: call to undeclared function 'rcuref_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     141 |                         if (rcuref_get(&ucounts->count))
         |                             ^
   kernel/ucount.c:141:8: note: did you mean 'kref_get'?
   include/linux/kref.h:43:20: note: 'kref_get' declared here
      43 | static inline void kref_get(struct kref *kref)
         |                    ^
>> kernel/ucount.c:172:2: error: call to undeclared function 'rcuref_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     172 |         rcuref_init(&new->count, 1);
         |         ^
>> kernel/ucount.c:200:6: error: call to undeclared function 'rcuref_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     200 |         if (rcuref_put(&ucounts->count)) {
         |             ^
   kernel/ucount.c:200:6: note: did you mean 'kref_put'?
   include/linux/kref.h:62:19: note: 'kref_put' declared here
      62 | static inline int kref_put(struct kref *kref, void (*release)(struct kref *kref))
         |                   ^
   4 errors generated.


vim +14 kernel/ucount.c

    10	
    11	struct ucounts init_ucounts = {
    12		.ns    = &init_user_ns,
    13		.uid   = GLOBAL_ROOT_UID,
  > 14		.count = RCUREF_INIT(1),
    15	};
    16	
    17	#define UCOUNTS_HASHTABLE_BITS 10
    18	#define UCOUNTS_HASHTABLE_ENTRIES (1 << UCOUNTS_HASHTABLE_BITS)
    19	static struct hlist_nulls_head ucounts_hashtable[UCOUNTS_HASHTABLE_ENTRIES]= {
    20		[0 ... UCOUNTS_HASHTABLE_ENTRIES - 1] = HLIST_NULLS_HEAD_INIT(0)
    21	};
    22	static DEFINE_SPINLOCK(ucounts_lock);
    23	
    24	#define ucounts_hashfn(ns, uid)						\
    25		hash_long((unsigned long)__kuid_val(uid) + (unsigned long)(ns), \
    26			  UCOUNTS_HASHTABLE_BITS)
    27	#define ucounts_hashentry(ns, uid)	\
    28		(ucounts_hashtable + ucounts_hashfn(ns, uid))
    29	
    30	#ifdef CONFIG_SYSCTL
    31	static struct ctl_table_set *
    32	set_lookup(struct ctl_table_root *root)
    33	{
    34		return &current_user_ns()->set;
    35	}
    36	
    37	static int set_is_seen(struct ctl_table_set *set)
    38	{
    39		return &current_user_ns()->set == set;
    40	}
    41	
    42	static int set_permissions(struct ctl_table_header *head,
    43				   const struct ctl_table *table)
    44	{
    45		struct user_namespace *user_ns =
    46			container_of(head->set, struct user_namespace, set);
    47		int mode;
    48	
    49		/* Allow users with CAP_SYS_RESOURCE unrestrained access */
    50		if (ns_capable(user_ns, CAP_SYS_RESOURCE))
    51			mode = (table->mode & S_IRWXU) >> 6;
    52		else
    53		/* Allow all others at most read-only access */
    54			mode = table->mode & S_IROTH;
    55		return (mode << 6) | (mode << 3) | mode;
    56	}
    57	
    58	static struct ctl_table_root set_root = {
    59		.lookup = set_lookup,
    60		.permissions = set_permissions,
    61	};
    62	
    63	static long ue_zero = 0;
    64	static long ue_int_max = INT_MAX;
    65	
    66	#define UCOUNT_ENTRY(name)					\
    67		{							\
    68			.procname	= name,				\
    69			.maxlen		= sizeof(long),			\
    70			.mode		= 0644,				\
    71			.proc_handler	= proc_doulongvec_minmax,	\
    72			.extra1		= &ue_zero,			\
    73			.extra2		= &ue_int_max,			\
    74		}
    75	static const struct ctl_table user_table[] = {
    76		UCOUNT_ENTRY("max_user_namespaces"),
    77		UCOUNT_ENTRY("max_pid_namespaces"),
    78		UCOUNT_ENTRY("max_uts_namespaces"),
    79		UCOUNT_ENTRY("max_ipc_namespaces"),
    80		UCOUNT_ENTRY("max_net_namespaces"),
    81		UCOUNT_ENTRY("max_mnt_namespaces"),
    82		UCOUNT_ENTRY("max_cgroup_namespaces"),
    83		UCOUNT_ENTRY("max_time_namespaces"),
    84	#ifdef CONFIG_INOTIFY_USER
    85		UCOUNT_ENTRY("max_inotify_instances"),
    86		UCOUNT_ENTRY("max_inotify_watches"),
    87	#endif
    88	#ifdef CONFIG_FANOTIFY
    89		UCOUNT_ENTRY("max_fanotify_groups"),
    90		UCOUNT_ENTRY("max_fanotify_marks"),
    91	#endif
    92	};
    93	#endif /* CONFIG_SYSCTL */
    94	
    95	bool setup_userns_sysctls(struct user_namespace *ns)
    96	{
    97	#ifdef CONFIG_SYSCTL
    98		struct ctl_table *tbl;
    99	
   100		BUILD_BUG_ON(ARRAY_SIZE(user_table) != UCOUNT_COUNTS);
   101		setup_sysctl_set(&ns->set, &set_root, set_is_seen);
   102		tbl = kmemdup(user_table, sizeof(user_table), GFP_KERNEL);
   103		if (tbl) {
   104			int i;
   105			for (i = 0; i < UCOUNT_COUNTS; i++) {
   106				tbl[i].data = &ns->ucount_max[i];
   107			}
   108			ns->sysctls = __register_sysctl_table(&ns->set, "user", tbl,
   109							      ARRAY_SIZE(user_table));
   110		}
   111		if (!ns->sysctls) {
   112			kfree(tbl);
   113			retire_sysctl_set(&ns->set);
   114			return false;
   115		}
   116	#endif
   117		return true;
   118	}
   119	
   120	void retire_userns_sysctls(struct user_namespace *ns)
   121	{
   122	#ifdef CONFIG_SYSCTL
   123		const struct ctl_table *tbl;
   124	
   125		tbl = ns->sysctls->ctl_table_arg;
   126		unregister_sysctl_table(ns->sysctls);
   127		retire_sysctl_set(&ns->set);
   128		kfree(tbl);
   129	#endif
   130	}
   131	
   132	static struct ucounts *find_ucounts(struct user_namespace *ns, kuid_t uid,
   133					    struct hlist_nulls_head *hashent)
   134	{
   135		struct ucounts *ucounts;
   136		struct hlist_nulls_node *pos;
   137	
   138		guard(rcu)();
   139		hlist_nulls_for_each_entry_rcu(ucounts, pos, hashent, node) {
   140			if (uid_eq(ucounts->uid, uid) && (ucounts->ns == ns)) {
 > 141				if (rcuref_get(&ucounts->count))
   142					return ucounts;
   143			}
   144		}
   145		return NULL;
   146	}
   147	
   148	static void hlist_add_ucounts(struct ucounts *ucounts)
   149	{
   150		struct hlist_nulls_head *hashent = ucounts_hashentry(ucounts->ns, ucounts->uid);
   151	
   152		spin_lock_irq(&ucounts_lock);
   153		hlist_nulls_add_head_rcu(&ucounts->node, hashent);
   154		spin_unlock_irq(&ucounts_lock);
   155	}
   156	
   157	struct ucounts *alloc_ucounts(struct user_namespace *ns, kuid_t uid)
   158	{
   159		struct hlist_nulls_head *hashent = ucounts_hashentry(ns, uid);
   160		struct ucounts *ucounts, *new;
   161	
   162		ucounts = find_ucounts(ns, uid, hashent);
   163		if (ucounts)
   164			return ucounts;
   165	
   166		new = kzalloc(sizeof(*new), GFP_KERNEL);
   167		if (!new)
   168			return NULL;
   169	
   170		new->ns = ns;
   171		new->uid = uid;
 > 172		rcuref_init(&new->count, 1);
   173	
   174		spin_lock_irq(&ucounts_lock);
   175		ucounts = find_ucounts(ns, uid, hashent);
   176		if (ucounts) {
   177			spin_unlock_irq(&ucounts_lock);
   178			kfree(new);
   179			return ucounts;
   180		}
   181	
   182		hlist_nulls_add_head_rcu(&new->node, hashent);
   183		get_user_ns(new->ns);
   184		spin_unlock_irq(&ucounts_lock);
   185		return new;
   186	}
   187	
   188	static void ucounts_free(struct rcu_head *rcu)
   189	{
   190		struct ucounts *ucounts = container_of(rcu, struct ucounts, rcu);
   191	
   192		put_user_ns(ucounts->ns);
   193		kfree(ucounts);
   194	}
   195	
   196	void put_ucounts(struct ucounts *ucounts)
   197	{
   198		unsigned long flags;
   199	
 > 200		if (rcuref_put(&ucounts->count)) {
   201			spin_lock_irqsave(&ucounts_lock, flags);
   202			hlist_nulls_del_rcu(&ucounts->node);
   203			spin_unlock_irqrestore(&ucounts_lock, flags);
   204	
   205			call_rcu(&ucounts->rcu, ucounts_free);
   206		}
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
