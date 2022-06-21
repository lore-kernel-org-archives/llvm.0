Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC101A20
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 03:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655781639; x=1687317639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HtGtyOAw3EPbRlSQyh87PysGHjoA34yWeBWU6S1lLj0=;
  b=NPVX606NQ1rJgpOjl8rPMBiaOkhAY4zfO/ohd/JLh8Z3UrsrekQf9CXn
   AjaPrc7uslteV8aYEtsLDhaQ2zv3Ex/DCipcCpeHOuDunrI5JQ0epUJFg
   yZzSwfbJT+3rrPUmvkU7PS4cVf8KPPZaSnem7G1woJUZpixuISCTe+t5w
   pJ+v2j/XIRKcZJoLBCij13xdh85f+wFPUDGgjLJN81v6FuIglUxGI53Fw
   DefKjE0ClamXnVfihmuoL3rCRO+fIB9kAEibZ/LXsL1hdeOII+6bgEB+k
   sDNs2qkhcvHEg6Jd+xHYiVo6ERdHT4ku0KbWgjTh3xfwjyK0FJ+fptCsC
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="344009114"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="344009114"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 20:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="676805905"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2022 20:20:30 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3URJ-000Y57-ER;
	Tue, 21 Jun 2022 03:20:29 +0000
Date: Tue, 21 Jun 2022 11:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: KP Singh <kpsingh@kernel.org>, bpf@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	KP Singh <kpsingh@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH v2 bpf-next 4/5] bpf: Add a bpf_getxattr kfunc
Message-ID: <202206211035.p3LxbVfK-lkp@intel.com>
References: <20220621012811.2683313-5-kpsingh@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621012811.2683313-5-kpsingh@kernel.org>

Hi KP,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/KP-Singh/Add-bpf_getxattr/20220621-093013
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: x86_64-randconfig-a015-20220620 (https://download.01.org/0day-ci/archive/20220621/202206211035.p3LxbVfK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dd49d2ffb18adceafa98bd517008f59aa9bc910b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review KP-Singh/Add-bpf_getxattr/20220621-093013
        git checkout dd49d2ffb18adceafa98bd517008f59aa9bc910b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/trace/bpf_trace.c:1185:25: warning: no previous prototype for function 'bpf_getxattr' [-Wmissing-prototypes]
   noinline __weak ssize_t bpf_getxattr(struct dentry *dentry, struct inode *inode,
                           ^
   kernel/trace/bpf_trace.c:1185:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline __weak ssize_t bpf_getxattr(struct dentry *dentry, struct inode *inode,
                   ^
                   static 
   1 warning generated.


vim +/bpf_getxattr +1185 kernel/trace/bpf_trace.c

  1184	
> 1185	noinline __weak ssize_t bpf_getxattr(struct dentry *dentry, struct inode *inode,
  1186					     const char *name, void *value, int size)
  1187	{
  1188		return __vfs_getxattr(dentry, inode, name, value, size);
  1189	}
  1190	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
