Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0301AD30;
	Tue, 28 Mar 2023 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680024859; x=1711560859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WTNJQqR6j0Fv4yewPZZeEkwpR+jxknlg6+8TkBHSQ54=;
  b=NMmF+86zOR8Tw1SDFfPxTMjMBSH/12KYthX7ToPN+iL6EmD1bRIuhsAo
   NqQQOJoGAevsFVQ13jb1+TlENEyYDicwWMqn37G+5h4o900Gm8SyEXoRr
   w+NVkGwEIK8vHnesrgDRosbGUTwCrbiXllJXhKB6jTxIWSpGMftONmZNn
   uCjSDFJwcGr0bEYxKG3HOo/LO62QBUFJi2fv/RhOYCp/0OrHzuSMsSYzk
   edhziCU4xAxQb91gXU2O5e5CQz18hI++RSoFi3tgYo/VZh1HFQHPKkMnj
   7/lgkRvE5DoyOSuUV5ugEWt5G0N3sO3cKwO+rWHMIU58K8ujqllhhPkuk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="342228788"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="342228788"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 10:34:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="677452177"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="677452177"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Mar 2023 10:34:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phDD4-000IlR-1M;
	Tue, 28 Mar 2023 17:34:14 +0000
Date: Wed, 29 Mar 2023 01:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org, linux-block@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>,
	ZiyangZhang <ZiyangZhang@linux.alibaba.com>,
	Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: Re: [PATCH V5 02/16] io_uring: add IORING_OP_FUSED_CMD
Message-ID: <202303290112.oiF4LrMI-lkp@intel.com>
References: <20230328150958.1253547-3-ming.lei@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328150958.1253547-3-ming.lei@redhat.com>

Hi Ming,

I love your patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.3-rc4 next-20230328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/io_uring-increase-io_kiocb-flags-into-64bit/20230328-232554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230328150958.1253547-3-ming.lei%40redhat.com
patch subject: [PATCH V5 02/16] io_uring: add IORING_OP_FUSED_CMD
config: x86_64-randconfig-a011-20230327 (https://download.01.org/0day-ci/archive/20230329/202303290112.oiF4LrMI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1cdd7d77287ea8d97834b37825e63a727e860f6c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ming-Lei/io_uring-increase-io_kiocb-flags-into-64bit/20230328-232554
        git checkout 1cdd7d77287ea8d97834b37825e63a727e860f6c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290112.oiF4LrMI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/ioctl.c:8:
>> include/linux/io_uring.h:112:74: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline void io_fused_cmd_start_secondary_req(struct io_uring_cmd *,
                                                                            ^
   include/linux/io_uring.h:113:57: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
                   unsigned issue_flags, const struct io_uring_bvec_buf *,
                                                                         ^
   include/linux/io_uring.h:114:15: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
                   unsigned int,
                               ^
   3 warnings generated.


vim +112 include/linux/io_uring.h

    93	
    94	static inline void io_uring_files_cancel(void)
    95	{
    96		if (current->io_uring) {
    97			io_uring_unreg_ringfd();
    98			__io_uring_cancel(false);
    99		}
   100	}
   101	static inline void io_uring_task_cancel(void)
   102	{
   103		if (current->io_uring)
   104			__io_uring_cancel(true);
   105	}
   106	static inline void io_uring_free(struct task_struct *tsk)
   107	{
   108		if (tsk->io_uring)
   109			__io_uring_free(tsk);
   110	}
   111	#else
 > 112	static inline void io_fused_cmd_start_secondary_req(struct io_uring_cmd *,
   113			unsigned issue_flags, const struct io_uring_bvec_buf *,
   114			unsigned int,
   115			void (*complete_tw_cb)(struct io_uring_cmd *, unsigned))
   116	{
   117	}
   118	static inline int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
   119				      struct iov_iter *iter, void *ioucmd)
   120	{
   121		return -EOPNOTSUPP;
   122	}
   123	static inline void io_uring_cmd_done(struct io_uring_cmd *cmd, ssize_t ret,
   124			ssize_t ret2, unsigned issue_flags)
   125	{
   126	}
   127	static inline void io_uring_cmd_complete_in_task(struct io_uring_cmd *ioucmd,
   128				void (*task_work_cb)(struct io_uring_cmd *, unsigned))
   129	{
   130	}
   131	static inline struct sock *io_uring_get_socket(struct file *file)
   132	{
   133		return NULL;
   134	}
   135	static inline void io_uring_task_cancel(void)
   136	{
   137	}
   138	static inline void io_uring_files_cancel(void)
   139	{
   140	}
   141	static inline void io_uring_free(struct task_struct *tsk)
   142	{
   143	}
   144	static inline const char *io_uring_get_opcode(u8 opcode)
   145	{
   146		return "";
   147	}
   148	#endif
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
