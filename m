Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43F619900;
	Sat, 27 May 2023 23:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685230710; x=1716766710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PGjTqxrTCZLR4IqO1wL5PGxZ8YB2DrLjMcyeY0HcXrU=;
  b=RuyTJormMdp7BQi9AYhrwrPEytp2lUd2oGhpHgaQRO9Juyv+cljyMikI
   7pGCGvNR6scEhxpiVgbZgiRESBaFJK3OhYuAXfBmrWCm/l7NL6n3mGLqK
   vtzeHMgqaj6Lin+Y8qFI7ilXrPy9OxtMLr30gmjCTgB/GsLYbec9Q0jnc
   4YDKyZfXRRuX+lAKn6Sct60ttKavkzWtnW0J5ZdQDf1y7W3ETozjZ/4Ze
   aGFqHObJhfZy0lFZeqaZGV2zDsaeYqFibY+D4T/0Du9GJWJa7EE1GPwUS
   nHMu7hFEqdV/QnAbn0b7EZYsF8lIKjjSfDRF+9MVKdVA/7fG3Yk1PZ3Ov
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="353300481"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="353300481"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 16:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="738666234"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="738666234"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 May 2023 16:38:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q33US-000KFq-0W;
	Sat, 27 May 2023 23:38:28 +0000
Date: Sun, 28 May 2023 07:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi_2 1/22] kernel/trace/bpf_trace.c:3041:16:
 warning: variable 'inode' set but not used
Message-ID: <202305280743.W2Qij9if-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi_2
head:   c8f1191093bc581ca849b4e106d98b69bdc3a9fd
commit: cd4ef19c217089e0b5af3754c9b5915780926c9b [1/22] bpf: Add multi uprobe link
config: x86_64-randconfig-x063-20230528 (https://download.01.org/0day-ci/archive/20230528/202305280743.W2Qij9if-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=cd4ef19c217089e0b5af3754c9b5915780926c9b
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_2
        git checkout cd4ef19c217089e0b5af3754c9b5915780926c9b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280743.W2Qij9if-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/bpf_trace.c:3041:16: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
           struct inode *inode, *old_inode;
                         ^
>> kernel/trace/bpf_trace.c:3092:12: warning: variable 'old_inode' is uninitialized when used here [-Wuninitialized]
                           inode = old_inode;
                                   ^~~~~~~~~
   kernel/trace/bpf_trace.c:3041:33: note: initialize the variable 'old_inode' to silence this warning
           struct inode *inode, *old_inode;
                                          ^
                                           = NULL
   2 warnings generated.


vim +/inode +3041 kernel/trace/bpf_trace.c

  3032	
  3033	int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
  3034	{
  3035		void __user **upaths, __user *upath, __user *old_upath = NULL;
  3036		unsigned long __user *uref_ctr_offsets, ref_ctr_offset = 0;
  3037		struct bpf_uprobe_multi_link *link = NULL;
  3038		unsigned long __user *uoffsets, offset;
  3039		struct bpf_link_primer link_primer;
  3040		struct bpf_uprobe *uprobes = NULL;
> 3041		struct inode *inode, *old_inode;
  3042		u32 flags, cnt, i;
  3043		struct path path;
  3044		int err;
  3045	
  3046		/* no support for 32bit archs yet */
  3047		if (sizeof(u64) != sizeof(void *))
  3048			return -EOPNOTSUPP;
  3049	
  3050		if (prog->expected_attach_type != BPF_TRACE_UPROBE_MULTI)
  3051			return -EINVAL;
  3052	
  3053		flags = attr->link_create.uprobe_multi.flags;
  3054		if (flags & ~BPF_F_UPROBE_MULTI_RETURN)
  3055			return -EINVAL;
  3056	
  3057		upaths = u64_to_user_ptr(attr->link_create.uprobe_multi.paths);
  3058		uoffsets = u64_to_user_ptr(attr->link_create.uprobe_multi.offsets);
  3059		if (!!upaths != !!uoffsets)
  3060			return -EINVAL;
  3061	
  3062		uref_ctr_offsets = u64_to_user_ptr(attr->link_create.uprobe_multi.ref_ctr_offsets);
  3063	
  3064		cnt = attr->link_create.uprobe_multi.cnt;
  3065		if (!cnt)
  3066			return -EINVAL;
  3067	
  3068		uprobes = kvcalloc(cnt, sizeof(*uprobes), GFP_KERNEL);
  3069		if (!uprobes)
  3070			return -ENOMEM;
  3071	
  3072		link = kzalloc(sizeof(*link), GFP_KERNEL);
  3073		if (!link) {
  3074			err = -ENOMEM;
  3075			goto error;
  3076		}
  3077	
  3078		for (i = 0; i < cnt; i++) {
  3079			if (uref_ctr_offsets && __get_user(ref_ctr_offset, uref_ctr_offsets + i)) {
  3080				err = -EFAULT;
  3081				goto error_path_put;
  3082			}
  3083			if (__get_user(offset, uoffsets + i)) {
  3084				err = -EFAULT;
  3085				goto error_path_put;
  3086			}
  3087			if (__get_user(upath, upaths + i)) {
  3088				err = -EFAULT;
  3089				goto error_path_put;
  3090			}
  3091			if (i && old_upath == upath) {
> 3092				inode = old_inode;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
