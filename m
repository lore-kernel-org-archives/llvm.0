Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF2780F
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 13:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660397901; x=1691933901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lNxmtn7TP3KZN3UEnL13yw1zfYL3pBdnH/f59m3DyYY=;
  b=R5WaKmqzXkuWiOENHCiXFG0I0hzmKDXD6HiUVmcMcuVQQpEONxD5sjpJ
   sPw18RZE+u3dvDTtZOs9XW0d4dRlnOJv7+WHQ64E8dy+2s7kYJ6n0R9bA
   g29k/qIDM6URKm4nQgKpVPXKfOixhq9oIInHARoncH7H0jXgnfKZrdmyX
   Q+3XEKaLEhBLrePLVNky/juUOceXayvTJYjnuL1QU80cHi7Rut2Iw8Unp
   5MzkPw1gqJPrql3Ma+/EzbFLC7vVfZeE4x0BqKx7Gj3uiO6+LEJG87EX5
   AHl29LrjtaCL34yXVCntB9p8dI3ocs72nL5zX9P5EfT8+FnlWzEo4rb9Q
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="292548619"
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="292548619"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 06:38:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="602762016"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Aug 2022 06:38:19 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMrLG-0001iV-2t;
	Sat, 13 Aug 2022 13:38:18 +0000
Date: Sat, 13 Aug 2022 21:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jolsa-perf:bpf/tracing_multi_new_1 22/23]
 kernel/bpf/syscall.c:3150:20: error: field has incomplete type 'struct
 ftrace_ops'
Message-ID: <202208132147.npPyYMne-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_new_1
head:   e27bb6c0f6805082ef71568985f74dcefe7ff6ff
commit: dc38a65ab46f4ba538353c1eb7c64ac36202eb54 [22/23] fix
config: mips-randconfig-r031-20220804 (https://download.01.org/0day-ci/archive/20220813/202208132147.npPyYMne-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=dc38a65ab46f4ba538353c1eb7c64ac36202eb54
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/tracing_multi_new_1
        git checkout dc38a65ab46f4ba538353c1eb7c64ac36202eb54
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/bpf/syscall.c:2523:15: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           multi_func = is_tracing_multi(attr->expected_attach_type);
                        ^
>> kernel/bpf/syscall.c:3150:20: error: field has incomplete type 'struct ftrace_ops'
           struct ftrace_ops fops;
                             ^
   include/linux/bpf.h:51:8: note: forward declaration of 'struct ftrace_ops'
   struct ftrace_ops;
          ^
   kernel/bpf/syscall.c:3158:15: error: call to undeclared function 'bpf_trampoline_multi_detach'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           WARN_ON_ONCE(bpf_trampoline_multi_detach(&tr_link->fops, &tr_link->tp, tr_link->id));
                        ^
   kernel/bpf/syscall.c:3166:2: error: call to undeclared function 'bpf_tramp_id_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           bpf_tramp_id_put(tr_link->id);
           ^
   kernel/bpf/syscall.c:3166:2: note: did you mean 'bpf_trampoline_put'?
   include/linux/bpf.h:1021:20: note: 'bpf_trampoline_put' declared here
   static inline void bpf_trampoline_put(struct bpf_trampoline *tr) {}
                      ^
   kernel/bpf/syscall.c:3329:7: error: call to undeclared function 'bpf_tramp_id_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           id = bpf_tramp_id_alloc(cnt);
                ^
   kernel/bpf/syscall.c:3329:5: error: incompatible integer to pointer conversion assigning to 'struct bpf_tramp_id *' from 'int' [-Wint-conversion]
           id = bpf_tramp_id_alloc(cnt);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:3370:8: error: call to undeclared function 'bpf_trampoline_multi_attach'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           err = bpf_trampoline_multi_attach(&link->fops, &link->tp, id);
                 ^
   kernel/bpf/syscall.c:3370:8: note: did you mean 'bpf_tracing_multi_attach'?
   kernel/bpf/syscall.c:3314:12: note: 'bpf_tracing_multi_attach' declared here
   static int bpf_tracing_multi_attach(struct bpf_prog *prog,
              ^
   kernel/bpf/syscall.c:4842:12: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   else if (is_tracing_multi(prog->expected_attach_type))
                            ^
   8 errors generated.


vim +3150 kernel/bpf/syscall.c

  3144	
  3145	struct bpf_tracing_multi_link {
  3146		struct bpf_link link;
  3147		enum bpf_attach_type attach_type;
  3148		struct bpf_tramp_prog tp;
  3149		struct bpf_tramp_id *id;
> 3150		struct ftrace_ops fops;
  3151	};
  3152	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
