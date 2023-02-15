Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAC56109;
	Wed, 15 Feb 2023 15:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676475713; x=1708011713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ru+XvIDg3twgcFvIDSQOrc/i1HrC0wtgAsp5VcFWNkE=;
  b=moilhzek56LTxlE+hRnKwYwFE1fS7+XWgtSlE/h/6IxLeYzRZVZM7gW7
   CqSW/FMbUXaTDWwI0AYE+hwx45w8Dt6QdwUOvWdMnYoLxjxmMW5t4oTCS
   bIJ6Pp6hN3AJDY175Vy/R/ZZAxpC3Hu9uyWMd+5gX4DX3JykjQUcTP9+f
   +QuAyPJi5JcFVmov5lUm0Ha2r29ezWnNXC/ervc+qo5evT3nXJ4fooYeb
   OPHob+VxVwCXTvioFNQM+e8djEBVe09Vnr/sPUO6ha+bzrQCQfGYRxJeh
   fndRpVh9xhWMfVHa4vMEQvHbbM1IHIcOj6JCmi/TrbiT+K5DeWbRxBWAg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="332762812"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="332762812"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 07:41:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="733323660"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="733323660"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Feb 2023 07:41:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSJup-0009Vh-0d;
	Wed, 15 Feb 2023 15:41:51 +0000
Date: Wed, 15 Feb 2023 23:41:41 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/3] io_uring: enable io_uring to submit sqes located in
 kernel
Message-ID: <202302152315.W5hlZK5P-lkp@intel.com>
References: <20230215004122.28917-3-xiaoguang.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215004122.28917-3-xiaoguang.wang@linux.alibaba.com>

Hi Xiaoguang,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf/master]
[also build test WARNING on axboe-block/for-next linus/master v6.2-rc8]
[cannot apply to bpf-next/master next-20230215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoguang-Wang/bpf-add-UBLK-program-type/20230215-084242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20230215004122.28917-3-xiaoguang.wang%40linux.alibaba.com
patch subject: [RFC 2/3] io_uring: enable io_uring to submit sqes located in kernel
config: x86_64-randconfig-a002-20230213 (https://download.01.org/0day-ci/archive/20230215/202302152315.W5hlZK5P-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0d433a1cf7f666e5596514da7fab92f2691463ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiaoguang-Wang/bpf-add-UBLK-program-type/20230215-084242
        git checkout 0d433a1cf7f666e5596514da7fab92f2691463ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/unix/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302152315.W5hlZK5P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/unix/scm.c:11:
>> include/linux/io_uring.h:107:5: warning: no previous prototype for function 'io_uring_submit_sqe' [-Wmissing-prototypes]
   int io_uring_submit_sqe(int fd, const struct io_uring_sqe *sqe, u32 sqe_len,
       ^
   include/linux/io_uring.h:107:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int io_uring_submit_sqe(int fd, const struct io_uring_sqe *sqe, u32 sqe_len,
   ^
   static 
   1 warning generated.


vim +/io_uring_submit_sqe +107 include/linux/io_uring.h

    56	
    57	static inline void io_uring_files_cancel(void)
    58	{
    59		if (current->io_uring) {
    60			io_uring_unreg_ringfd();
    61			__io_uring_cancel(false);
    62		}
    63	}
    64	static inline void io_uring_task_cancel(void)
    65	{
    66		if (current->io_uring)
    67			__io_uring_cancel(true);
    68	}
    69	static inline void io_uring_free(struct task_struct *tsk)
    70	{
    71		if (tsk->io_uring)
    72			__io_uring_free(tsk);
    73	}
    74	int io_uring_submit_sqe(int fd, const struct io_uring_sqe *sqe, u32 sqe_len,
    75				struct io_mapped_kbuf *kbuf);
    76	#else
    77	static inline int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
    78				      struct iov_iter *iter, void *ioucmd)
    79	{
    80		return -EOPNOTSUPP;
    81	}
    82	static inline void io_uring_cmd_done(struct io_uring_cmd *cmd, ssize_t ret,
    83			ssize_t ret2)
    84	{
    85	}
    86	static inline void io_uring_cmd_complete_in_task(struct io_uring_cmd *ioucmd,
    87				void (*task_work_cb)(struct io_uring_cmd *))
    88	{
    89	}
    90	static inline struct sock *io_uring_get_socket(struct file *file)
    91	{
    92		return NULL;
    93	}
    94	static inline void io_uring_task_cancel(void)
    95	{
    96	}
    97	static inline void io_uring_files_cancel(void)
    98	{
    99	}
   100	static inline void io_uring_free(struct task_struct *tsk)
   101	{
   102	}
   103	static inline const char *io_uring_get_opcode(u8 opcode)
   104	{
   105		return "";
   106	}
 > 107	int io_uring_submit_sqe(int fd, const struct io_uring_sqe *sqe, u32 sqe_len,
   108				struct io_mapped_kbuf *kbuf)
   109	{
   110		return 0;
   111	}
   112	#endif
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
