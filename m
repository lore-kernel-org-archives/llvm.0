Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3156917C6;
	Tue, 14 Mar 2023 04:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678767441; x=1710303441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fwbG2uIvlZXZWxQ692Tl358yiLOHNW232kBILql6J7Q=;
  b=OdHggs1t/ohnDRxbD/MUzbc7Rpm5JhR0RggwC3qvUH8lGX5zrpbqZdBJ
   maHef6oaDQZNqjrxvBQnybmmRl2cE8IhCg/7KbushZwukmWw0Q/VN/o0N
   G3DMRRUWBSIzuxVGlCp3SIzWtJOH107MdqTc4fepBX8+N682MLXPva2O8
   NzIIKikfdcvkgxAgZH3m/73XU8C4BubbXc6d/iA4SDI6fX8ZZewnSEpX5
   iJiSSwULAAr0KT9aTlhWJLexwna78c+kqomISLm9iLI7uzH+uOyrOS1JH
   k/+nfU7GfrweWrdddM+maykah7BL8KhIOKZH9UcpjGCARiGGjIuEnxHYc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="337353720"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="337353720"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 21:17:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="678948309"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="678948309"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Mar 2023 21:17:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbw65-0006WM-1M;
	Tue, 14 Mar 2023 04:17:13 +0000
Date: Tue, 14 Mar 2023 12:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_6 1/12] kernel/trace/bpf_trace.c:3055:12:
 warning: variable 'old_inode' is uninitialized when used here
Message-ID: <202303141241.Nw4DnamW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi_6
head:   3f2899fc03dd194fc538daca944ed9560d265fb3
commit: 8dd01ea9b045f53b6b8625fde50a896de89e075d [1/12] bpf: Add multi uprobe link
config: x86_64-randconfig-a014-20230313 (https://download.01.org/0day-ci/archive/20230314/202303141241.Nw4DnamW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=8dd01ea9b045f53b6b8625fde50a896de89e075d
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_6
        git checkout 8dd01ea9b045f53b6b8625fde50a896de89e075d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141241.Nw4DnamW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/bpf_trace.c:3055:12: warning: variable 'old_inode' is uninitialized when used here [-Wuninitialized]
                           inode = old_inode;
                                   ^~~~~~~~~
   kernel/trace/bpf_trace.c:3011:33: note: initialize the variable 'old_inode' to silence this warning
           struct inode *inode, *old_inode;
                                          ^
                                           = NULL
   1 warning generated.


vim +/old_inode +3055 kernel/trace/bpf_trace.c

  3003	
  3004	int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
  3005	{
  3006		void __user **upaths, __user *upath, __user *old_upath = NULL;
  3007		unsigned long __user *uoffsets, offset;
  3008		struct bpf_uprobe_multi_link *link = NULL;
  3009		struct bpf_link_primer link_primer;
  3010		struct bpf_uprobe *uprobes = NULL;
  3011		struct inode *inode, *old_inode;
  3012		u32 flags, cnt, i;
  3013		int err;
  3014	
  3015		/* no support for 32bit archs yet */
  3016		if (sizeof(u64) != sizeof(void *))
  3017			return -EOPNOTSUPP;
  3018	
  3019		if (prog->expected_attach_type != BPF_TRACE_UPROBE_MULTI)
  3020			return -EINVAL;
  3021	
  3022		flags = attr->link_create.uprobe_multi.flags;
  3023		if (flags & ~BPF_F_UPROBE_MULTI_RETURN)
  3024			return -EINVAL;
  3025	
  3026		upaths = u64_to_user_ptr(attr->link_create.uprobe_multi.paths);
  3027		uoffsets = u64_to_user_ptr(attr->link_create.uprobe_multi.offsets);
  3028		if (!!upaths != !!uoffsets)
  3029			return -EINVAL;
  3030	
  3031		cnt = attr->link_create.uprobe_multi.cnt;
  3032		if (!cnt)
  3033			return -EINVAL;
  3034	
  3035		uprobes = kvcalloc(cnt, sizeof(*uprobes), GFP_KERNEL);
  3036		if (!uprobes)
  3037			return -ENOMEM;
  3038	
  3039		link = kzalloc(sizeof(*link), GFP_KERNEL);
  3040		if (!link) {
  3041			err = -ENOMEM;
  3042			goto error;
  3043		}
  3044	
  3045		for (i = 0; i < cnt; i++) {
  3046			if (__get_user(offset, uoffsets + i)) {
  3047				err = -EFAULT;
  3048				goto error;
  3049			}
  3050			if (__get_user(upath, upaths + i)) {
  3051				err = -EFAULT;
  3052				goto error;
  3053			}
  3054			if (i && old_upath == upath) {
> 3055				inode = old_inode;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
