Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C6B184A
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 06:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655187559; x=1686723559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zp0AxtuEgeC2k6xN7uyB1tG8n2U2PV+U1AX3y6gi+6M=;
  b=gIVGmVTCpXGBZtwBozUkU4rWlQnVndXY/HOHFRD89tRAuEqiN9yQkIK9
   oVusGNtI4lSuOMZ5iQO3WNfhxCKpplg+pi0sVQO2A63Ey0qAL+pxkbNQ7
   a6mG3pC1WgG2Xd4vrQiN+6ljdQV1d/SklT+85gOKayekC9E5FO6X/5kVc
   xIXL2eKLEvo7fM2lhcjK5T3CHZFtOOKUnwieWvXejVkJw/+ei0Zm3YMpU
   g8nDyoohPXg6NzU5xyAosfmlLfoO5j9+STJpJY2pYgEK33JqZ7WpeHAzq
   R4uLJLPxWY3SvmCA4mGz/DMUGLX+TrYIB5Uju2iksf7+kbZEZfOJ6o5pF
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="364854821"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="364854821"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 23:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="617831082"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Jun 2022 23:19:17 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0ztU-000LYp-R4;
	Tue, 14 Jun 2022 06:19:16 +0000
Date: Tue, 14 Jun 2022 14:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@bytedance.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 2/3] io_uring: add support for IORING_OP_MSGSND
Message-ID: <202206141405.lCMvrlaK-lkp@intel.com>
References: <20220613192642.2040118-3-usama.arif@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613192642.2040118-3-usama.arif@bytedance.com>

Hi Usama,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc2 next-20220610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/io_uring-add-support-for-IORING_OP_MSGSND-IORING_OP_MSGRCV/20220614-043915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
config: hexagon-randconfig-r041-20220613 (https://download.01.org/0day-ci/archive/20220614/202206141405.lCMvrlaK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c97436f8b6e2718286e8496faf53a2c800e281cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/55ef2bd7a864162103bc17258d5426bb0847dc9d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Usama-Arif/io_uring-add-support-for-IORING_OP_MSGSND-IORING_OP_MSGRCV/20220614-043915
        git checkout 55ef2bd7a864162103bc17258d5426bb0847dc9d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: check_and_load_msgsnd
   >>> referenced by io_uring.c
   >>> io_uring.o:(io_issue_sqe) in archive fs/built-in.a
   >>> referenced by io_uring.c
   >>> io_uring.o:(io_issue_sqe) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: __do_msgsnd
   >>> referenced by io_uring.c
   >>> io_uring.o:(io_issue_sqe) in archive fs/built-in.a
   >>> referenced by io_uring.c
   >>> io_uring.o:(io_issue_sqe) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: free_msg
   >>> referenced by io_uring.c
   >>> io_uring.o:(io_issue_sqe) in archive fs/built-in.a
   >>> referenced by io_uring.c
   >>> io_uring.o:(io_issue_sqe) in archive fs/built-in.a
   >>> referenced by io_uring.c
   >>> io_uring.o:(io_clean_op) in archive fs/built-in.a
   >>> referenced 1 more times
--
>> fs/io_uring.c:6262:6: warning: variable 'flags' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (force_nonblock)
               ^~~~~~~~~~~~~~
   fs/io_uring.c:6266:22: note: uninitialized use occurs here
                                           msg_sr->msg_sz, flags);
                                                           ^~~~~
   fs/io_uring.c:6262:2: note: remove the 'if' if its condition is always true
           if (force_nonblock)
           ^~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:6247:11: note: initialize the variable 'flags' to silence this warning
           int flags;
                    ^
                     = 0
   fs/io_uring.c:8737:28: warning: unused function 'io_file_from_index' [-Wunused-function]
   static inline struct file *io_file_from_index(struct io_ring_ctx *ctx,
                              ^
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
