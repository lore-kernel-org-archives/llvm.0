Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C5510E6;
	Sun, 12 Mar 2023 02:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678588211; x=1710124211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BpIM+JvJVv5NSuGCosv4966IIqr/qK30MXaD3aR1u24=;
  b=Lg29NcTlSMV7WJL8Z+1NURTKZsDGwt47t8ImnkEvTh4VtgEDBincv2dI
   coi9d/uxNxvWb6frkgbByUhh7hRiuMDymlSQr04mjj1XyzE7EiAtETWWL
   7jt1ZLtxPq2OG6xYw9TkYxPD23OVnMGP7lEpxx2A5Da44doPTW1/nD83M
   smfH+w4j7RPzdXl+7wsdnmREOVDXmelL7Hhr2VG8v399DzwbJWr4T8iQ3
   D67U+/9NFC4PdIpQ+HvprflKWP5pJM2MfTJufkB/PfnzB6p4jtH4io2/0
   gQQH0WfPfyCvS0kw2QPNFT+QOVPdkx/KgSrsmmM+Z14f42G1A1FkyF+XI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="320808549"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="320808549"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 18:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="788492183"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="788492183"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2023 18:30:09 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbBTM-0004vx-1m;
	Sun, 12 Mar 2023 02:30:08 +0000
Date: Sun, 12 Mar 2023 10:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_4 1/10] kernel/trace/bpf_trace.c:3036:12:
 warning: variable 'old_inode' is uninitialized when used here
Message-ID: <202303121037.MNLHvyuj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi_4
head:   9d1680460291ce10458ce0adcd4859944fd7ada9
commit: aefd3dc75e104d9b49c8fe971eea78fabd70809e [1/10] bpf: Add multi uprobe link
config: arm64-randconfig-r004-20230312 (https://download.01.org/0day-ci/archive/20230312/202303121037.MNLHvyuj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=aefd3dc75e104d9b49c8fe971eea78fabd70809e
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_4
        git checkout aefd3dc75e104d9b49c8fe971eea78fabd70809e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121037.MNLHvyuj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/bpf_trace.c:2998:18: warning: variable 'size' set but not used [-Wunused-but-set-variable]
           u32 flags, cnt, size, i;
                           ^
>> kernel/trace/bpf_trace.c:3036:12: warning: variable 'old_inode' is uninitialized when used here [-Wuninitialized]
                           inode = old_inode;
                                   ^~~~~~~~~
   kernel/trace/bpf_trace.c:2997:33: note: initialize the variable 'old_inode' to silence this warning
           struct inode *inode, *old_inode;
                                          ^
                                           = NULL
   2 warnings generated.


vim +/old_inode +3036 kernel/trace/bpf_trace.c

  2989	
  2990	int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
  2991	{
  2992		void __user **upaths, __user *upath, __user *old_upath = NULL;
  2993		unsigned long __user *uoffsets, offset;
  2994		struct bpf_uprobe_multi_link *link = NULL;
  2995		struct bpf_link_primer link_primer;
  2996		struct bpf_uprobe *uprobes = NULL;
  2997		struct inode *inode, *old_inode;
> 2998		u32 flags, cnt, size, i;
  2999		char *name;
  3000		int err;
  3001	
  3002		/* no support for 32bit archs yet */
  3003		if (sizeof(u64) != sizeof(void *))
  3004			return -EOPNOTSUPP;
  3005	
  3006		if (prog->expected_attach_type != BPF_TRACE_UPROBE_MULTI)
  3007			return -EINVAL;
  3008	
  3009		flags = attr->link_create.uprobe_multi.flags;
  3010		if (flags & ~BPF_F_UPROBE_MULTI_RETURN)
  3011			return -EINVAL;
  3012	
  3013		upaths = u64_to_user_ptr(attr->link_create.uprobe_multi.paths);
  3014		uoffsets = u64_to_user_ptr(attr->link_create.uprobe_multi.offsets);
  3015		if (!!upaths != !!uoffsets)
  3016			return -EINVAL;
  3017	
  3018		cnt = attr->link_create.uprobe_multi.cnt;
  3019		if (!cnt)
  3020			return -EINVAL;
  3021	
  3022		uprobes = kvmalloc_array(cnt, sizeof(*uprobes), GFP_KERNEL);
  3023		if (!uprobes)
  3024			return -ENOMEM;
  3025	
  3026		for (i = 0; i < cnt; i++) {
  3027			if (__get_user(offset, uoffsets + i)) {
  3028				err = -EFAULT;
  3029				goto error;
  3030			}
  3031			if (__get_user(upath, upaths + i)) {
  3032				err = -EFAULT;
  3033				goto error;
  3034			}
  3035			if (i && old_upath == upath) {
> 3036				inode = old_inode;
  3037			} else {
  3038				struct path path;
  3039	
  3040				name = strndup_user(upath, PATH_MAX);
  3041				if (IS_ERR(name)) {
  3042					err = PTR_ERR(name);
  3043					goto error;
  3044				}
  3045				err = kern_path(name, LOOKUP_FOLLOW, &path);
  3046				if (err)
  3047					goto error;
  3048				if (!d_is_reg(path.dentry)) {
  3049					err = -EINVAL;
  3050					path_put(&path);
  3051					goto error;
  3052				}
  3053				inode = d_real_inode(path.dentry);
  3054				path_put(&path);
  3055			}
  3056			old_upath = upath;
  3057			uprobes[i].inode = inode;
  3058			uprobes[i].offset = offset;
  3059		}
  3060	
  3061		size = sizeof(*link) + cnt * sizeof(link->consumer);
  3062		link = kzalloc(sizeof(*link), GFP_KERNEL);
  3063		if (!link) {
  3064			err = -ENOMEM;
  3065			goto error;
  3066		}
  3067	
  3068		link->uprobes = uprobes;
  3069		link->consumer.handler = uprobe_multi_link_handler;
  3070	
  3071		bpf_link_init(&link->link, BPF_LINK_TYPE_UPROBE_MULTI,
  3072			      &bpf_uprobe_multi_link_lops, prog);
  3073	
  3074		err = bpf_link_prime(&link->link, &link_primer);
  3075		if (err)
  3076			goto error;
  3077	
  3078		for (i = 0; i < cnt; i++) {
  3079			err = uprobe_register(uprobes[i].inode, uprobes[i].offset, &link->consumer);
  3080			if (err) {
  3081				bpf_link_cleanup(&link_primer);
  3082				goto unregister;
  3083			}
  3084		}
  3085	
  3086		return bpf_link_settle(&link_primer);
  3087	
  3088	unregister:
  3089		cnt = i;
  3090		for (i = 0; i < cnt; i++) {
  3091			uprobe_unregister(uprobes[i].inode, uprobes[i].offset,
  3092					  &link->consumer);
  3093		}
  3094	error:
  3095		kfree(uprobes);
  3096		kfree(link);
  3097		return err;
  3098	}
  3099	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
