Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B87883E;
	Tue, 24 Jan 2023 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674574948; x=1706110948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jMEgRgBZsBtvYBCL5dvCPMplczKke3txLIJeX2iqR7Q=;
  b=UMeA2W07sn/E2wDXltHXWHiNRkGJ02kMVydNHUYnXEqrBT3tHBXngkMB
   IF/qR95SN8YBBc6+cVStfAqwT7A5iPrlvK2Cd8OFD65MPcTIfE2lJNTxo
   mjaicXUvDMCElgoncXNf639HfALRrEoO86M6BbSOFjxKEMfgQKv56bztb
   sE3aEJ8MogCu4PURF8B92R9lrdEAqWUMf9z05ZP1HPzcECVd3IvcG30FW
   xccQpxVrUI1lfpAWGhQnmVgNEUge7GKJLRTV/fVhIcmG8q0FfRR68qbBS
   24rgcS7/kVHHyV+6hhphgKrxR6WfiZq+KIi3BuATO0lQ4h5QwYjfTTHge
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="412551866"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="412551866"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 07:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="786122938"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="786122938"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Jan 2023 07:42:05 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKLQy-0006Zo-2o;
	Tue, 24 Jan 2023 15:42:04 +0000
Date: Tue, 24 Jan 2023 23:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 14/19] mm: Introduce a cgroup for pinned memory
Message-ID: <202301242339.dF4Cw6vY-lkp@intel.com>
References: <183372b80aac73e640d9f5ac3c742d505fc6c1f2.1674538665.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <183372b80aac73e640d9f5ac3c742d505fc6c1f2.1674538665.git-series.apopple@nvidia.com>

Hi Alistair,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on 2241ab53cbb5cdb08a6b2d4688feb13971058f65]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/mm-Introduce-vm_account/20230124-135027
base:   2241ab53cbb5cdb08a6b2d4688feb13971058f65
patch link:    https://lore.kernel.org/r/183372b80aac73e640d9f5ac3c742d505fc6c1f2.1674538665.git-series.apopple%40nvidia.com
patch subject: [RFC PATCH 14/19] mm: Introduce a cgroup for pinned memory
config: arm-randconfig-r036-20230123 (https://download.01.org/0day-ci/archive/20230124/202301242339.dF4Cw6vY-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/4eba1da312a889b27469e42f20c216183d19cd4d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alistair-Popple/mm-Introduce-vm_account/20230124-135027
        git checkout 4eba1da312a889b27469e42f20c216183d19cd4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> mm/pins_cgroup.c:19:29: error: field has incomplete type 'struct cgroup_subsys_state'
           struct cgroup_subsys_state      css;
                                           ^
   include/linux/kthread.h:218:8: note: forward declaration of 'struct cgroup_subsys_state'
   struct cgroup_subsys_state;
          ^
>> mm/pins_cgroup.c:24:22: error: field has incomplete type 'struct cgroup_file'
           struct cgroup_file              events_file;
                                           ^
   mm/pins_cgroup.c:24:9: note: forward declaration of 'struct cgroup_file'
           struct cgroup_file              events_file;
                  ^
>> mm/pins_cgroup.c:40:18: error: call to undeclared function 'task_get_css'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return css_pins(task_get_css(task, pins_cgrp_id));
                           ^
>> mm/pins_cgroup.c:40:37: error: use of undeclared identifier 'pins_cgrp_id'
           return css_pins(task_get_css(task, pins_cgrp_id));
                                              ^
>> mm/pins_cgroup.c:76:6: warning: no previous prototype for function 'pins_cancel' [-Wmissing-prototypes]
   void pins_cancel(struct pins_cgroup *pins, int num)
        ^
   mm/pins_cgroup.c:76:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void pins_cancel(struct pins_cgroup *pins, int num)
   ^
   static 
>> mm/pins_cgroup.c:146:35: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
   static int pins_can_attach(struct cgroup_taskset *tset)
                                     ^
>> mm/pins_cgroup.c:151:2: error: call to undeclared function 'cgroup_taskset_for_each'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           cgroup_taskset_for_each(task, dst_css, tset) {
           ^
>> mm/pins_cgroup.c:151:46: error: expected ';' after expression
           cgroup_taskset_for_each(task, dst_css, tset) {
                                                       ^
                                                       ;
>> mm/pins_cgroup.c:156:13: error: call to undeclared function 'task_css'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   old_css = task_css(task, pins_cgrp_id);
                             ^
   mm/pins_cgroup.c:156:13: note: did you mean 'task_cpu'?
   include/linux/sched.h:2240:28: note: 'task_cpu' declared here
   static inline unsigned int task_cpu(const struct task_struct *p)
                              ^
   mm/pins_cgroup.c:156:28: error: use of undeclared identifier 'pins_cgrp_id'
                   old_css = task_css(task, pins_cgrp_id);
                                            ^
   mm/pins_cgroup.c:166:39: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
   static void pins_cancel_attach(struct cgroup_taskset *tset)
                                         ^
   mm/pins_cgroup.c:171:2: error: call to undeclared function 'cgroup_taskset_for_each'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           cgroup_taskset_for_each(task, dst_css, tset) {
           ^
   mm/pins_cgroup.c:171:46: error: expected ';' after expression
           cgroup_taskset_for_each(task, dst_css, tset) {
                                                       ^
                                                       ;
   mm/pins_cgroup.c:176:13: error: call to undeclared function 'task_css'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   old_css = task_css(task, pins_cgrp_id);
                             ^
   mm/pins_cgroup.c:176:28: error: use of undeclared identifier 'pins_cgrp_id'
                   old_css = task_css(task, pins_cgrp_id);
                                            ^
>> mm/pins_cgroup.c:188:36: error: call to undeclared function 'of_css'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct cgroup_subsys_state *css = of_css(of);
                                             ^
>> mm/pins_cgroup.c:188:30: error: incompatible integer to pointer conversion initializing 'struct cgroup_subsys_state *' with an expression of type 'int' [-Wint-conversion]
           struct cgroup_subsys_state *css = of_css(of);
                                       ^     ~~~~~~~~~~
>> mm/pins_cgroup.c:217:36: error: call to undeclared function 'seq_css'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct cgroup_subsys_state *css = seq_css(sf);
                                             ^
   mm/pins_cgroup.c:217:30: error: incompatible integer to pointer conversion initializing 'struct cgroup_subsys_state *' with an expression of type 'int' [-Wint-conversion]
           struct cgroup_subsys_state *css = seq_css(sf);
                                       ^     ~~~~~~~~~~~
>> mm/pins_cgroup.c:230:16: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
                                struct cftype *cft)
                                       ^
   mm/pins_cgroup.c:239:38: error: call to undeclared function 'seq_css'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct pins_cgroup *pins = css_pins(seq_css(sf));
                                               ^
>> mm/pins_cgroup.c:239:38: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct cgroup_subsys_state *' [-Wint-conversion]
           struct pins_cgroup *pins = css_pins(seq_css(sf));
                                               ^~~~~~~~~~~
   mm/pins_cgroup.c:28:65: note: passing argument to parameter 'css' here
   static struct pins_cgroup *css_pins(struct cgroup_subsys_state *css)
                                                                   ^
>> mm/pins_cgroup.c:245:32: error: array has incomplete element type 'struct cftype'
   static struct cftype pins_files[] = {
                                  ^
   mm/pins_cgroup.c:245:15: note: forward declaration of 'struct cftype'
   static struct cftype pins_files[] = {
                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   4 warnings and 20 errors generated.


vim +19 mm/pins_cgroup.c

    17	
    18	struct pins_cgroup {
  > 19		struct cgroup_subsys_state	css;
    20	
    21		atomic64_t			counter;
    22		atomic64_t			limit;
    23	
  > 24		struct cgroup_file		events_file;
    25		atomic64_t			events_limit;
    26	};
    27	
    28	static struct pins_cgroup *css_pins(struct cgroup_subsys_state *css)
    29	{
    30		return container_of(css, struct pins_cgroup, css);
    31	}
    32	
    33	static struct pins_cgroup *parent_pins(struct pins_cgroup *pins)
    34	{
    35		return css_pins(pins->css.parent);
    36	}
    37	
    38	struct pins_cgroup *get_pins_cg(struct task_struct *task)
    39	{
  > 40		return css_pins(task_get_css(task, pins_cgrp_id));
    41	}
    42	
    43	void put_pins_cg(struct pins_cgroup *cg)
    44	{
    45		css_put(&cg->css);
    46	}
    47	
    48	static struct cgroup_subsys_state *
    49	pins_css_alloc(struct cgroup_subsys_state *parent)
    50	{
    51		struct pins_cgroup *pins;
    52	
    53		pins = kzalloc(sizeof(struct pins_cgroup), GFP_KERNEL);
    54		if (!pins)
    55			return ERR_PTR(-ENOMEM);
    56	
    57		atomic64_set(&pins->counter, 0);
    58		atomic64_set(&pins->limit, PINS_MAX);
    59		atomic64_set(&pins->events_limit, 0);
    60		return &pins->css;
    61	}
    62	
    63	static void pins_css_free(struct cgroup_subsys_state *css)
    64	{
    65		kfree(css_pins(css));
    66	}
    67	
    68	/**
    69	 * pins_cancel - uncharge the local pin count
    70	 * @pins: the pin cgroup state
    71	 * @num: the number of pins to cancel
    72	 *
    73	 * This function will WARN if the pin count goes under 0, because such a case is
    74	 * a bug in the pins controller proper.
    75	 */
  > 76	void pins_cancel(struct pins_cgroup *pins, int num)
    77	{
    78		/*
    79		 * A negative count (or overflow for that matter) is invalid,
    80		 * and indicates a bug in the `pins` controller proper.
    81		 */
    82		WARN_ON_ONCE(atomic64_add_negative(-num, &pins->counter));
    83	}
    84	
    85	/**
    86	 * pins_uncharge - hierarchically uncharge the pin count
    87	 * @pins: the pin cgroup state
    88	 * @num: the number of pins to uncharge
    89	 */
    90	void pins_uncharge(struct pins_cgroup *pins, int num)
    91	{
    92		struct pins_cgroup *p;
    93	
    94		for (p = pins; parent_pins(p); p = parent_pins(p))
    95			pins_cancel(p, num);
    96	}
    97	
    98	/**
    99	 * pins_charge - hierarchically charge the pin count
   100	 * @pins: the pin cgroup state
   101	 * @num: the number of pins to charge
   102	 *
   103	 * This function does *not* follow the pin limit set. It cannot fail and the new
   104	 * pin count may exceed the limit. This is only used for reverting failed
   105	 * attaches, where there is no other way out than violating the limit.
   106	 */
   107	static void pins_charge(struct pins_cgroup *pins, int num)
   108	{
   109		struct pins_cgroup *p;
   110	
   111		for (p = pins; parent_pins(p); p = parent_pins(p))
   112			atomic64_add(num, &p->counter);
   113	}
   114	
   115	/**
   116	 * pins_try_charge - hierarchically try to charge the pin count
   117	 * @pins: the pin cgroup state
   118	 * @num: the number of pins to charge
   119	 *
   120	 * This function follows the set limit. It will fail if the charge would cause
   121	 * the new value to exceed the hierarchical limit. Returns 0 if the charge
   122	 * succeeded, otherwise -EAGAIN.
   123	 */
   124	int pins_try_charge(struct pins_cgroup *pins, int num)
   125	{
   126		struct pins_cgroup *p, *q;
   127	
   128		for (p = pins; parent_pins(p); p = parent_pins(p)) {
   129			uint64_t new = atomic64_add_return(num, &p->counter);
   130			uint64_t limit = atomic64_read(&p->limit);
   131	
   132			if (limit != PINS_MAX && new > limit)
   133				goto revert;
   134		}
   135	
   136		return 0;
   137	
   138	revert:
   139		for (q = pins; q != p; q = parent_pins(q))
   140			pins_cancel(q, num);
   141		pins_cancel(p, num);
   142	
   143		return -EAGAIN;
   144	}
   145	
 > 146	static int pins_can_attach(struct cgroup_taskset *tset)
   147	{
   148		struct cgroup_subsys_state *dst_css;
   149		struct task_struct *task;
   150	
 > 151		cgroup_taskset_for_each(task, dst_css, tset) {
   152			struct pins_cgroup *pins = css_pins(dst_css);
   153			struct cgroup_subsys_state *old_css;
   154			struct pins_cgroup *old_pins;
   155	
 > 156			old_css = task_css(task, pins_cgrp_id);
   157			old_pins = css_pins(old_css);
   158	
   159			pins_charge(pins, task->mm->locked_vm);
   160			pins_uncharge(old_pins, task->mm->locked_vm);
   161		}
   162	
   163		return 0;
   164	}
   165	
   166	static void pins_cancel_attach(struct cgroup_taskset *tset)
   167	{
   168		struct cgroup_subsys_state *dst_css;
   169		struct task_struct *task;
   170	
   171		cgroup_taskset_for_each(task, dst_css, tset) {
   172			struct pins_cgroup *pins = css_pins(dst_css);
   173			struct cgroup_subsys_state *old_css;
   174			struct pins_cgroup *old_pins;
   175	
   176			old_css = task_css(task, pins_cgrp_id);
   177			old_pins = css_pins(old_css);
   178	
   179			pins_charge(old_pins, task->mm->locked_vm);
   180			pins_uncharge(pins, task->mm->locked_vm);
   181		}
   182	}
   183	
   184	
   185	static ssize_t pins_max_write(struct kernfs_open_file *of, char *buf,
   186				      size_t nbytes, loff_t off)
   187	{
 > 188		struct cgroup_subsys_state *css = of_css(of);
   189		struct pins_cgroup *pins = css_pins(css);
   190		uint64_t limit;
   191		int err;
   192	
   193		buf = strstrip(buf);
   194		if (!strcmp(buf, PINS_MAX_STR)) {
   195			limit = PINS_MAX;
   196			goto set_limit;
   197		}
   198	
   199		err = kstrtoll(buf, 0, &limit);
   200		if (err)
   201			return err;
   202	
   203		if (limit < 0 || limit >= PINS_MAX)
   204			return -EINVAL;
   205	
   206	set_limit:
   207		/*
   208		 * Limit updates don't need to be mutex'd, since it isn't
   209		 * critical that any racing fork()s follow the new limit.
   210		 */
   211		atomic64_set(&pins->limit, limit);
   212		return nbytes;
   213	}
   214	
   215	static int pins_max_show(struct seq_file *sf, void *v)
   216	{
 > 217		struct cgroup_subsys_state *css = seq_css(sf);
   218		struct pins_cgroup *pins = css_pins(css);
   219		uint64_t limit = atomic64_read(&pins->limit);
   220	
   221		if (limit >= PINS_MAX)
   222			seq_printf(sf, "%s\n", PINS_MAX_STR);
   223		else
   224			seq_printf(sf, "%lld\n", limit);
   225	
   226		return 0;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
