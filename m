Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4094699
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 06:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655188160; x=1686724160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=29IQ6n9QrjSNLJelJNaqyQhYPVrUKEach8B6nCbaUI0=;
  b=jImY6ytDWKKlMODYHXE0HV631B2m6LVqKbLPHYuZVceK8euZEZnkETEG
   bdjykgx8IVh4m0K4odOE5ib4ieaHIHYaf1V9/Ol78pKqSfwK2RuSRIOQ4
   J0IdglOyEH3XxCje3K3q7dYWODFZsxrko8bRgjIDoSGv0ugw2wJWubrbQ
   MXpPSbR8uXhW6HzaSP7IhyQ3WxJzlei7D5Yn62gdiQqpapbMtaBLjXkbb
   XfVV0mxLeqP7Rn3yn2e0ESLt1LYO0Y03SWC/hSGvZuDNJ90ZBzOUvMYBm
   y9JgBBq/DbnY244sJ9QuCah5+6dA3qmripKGGAhUKuUwRC/Bo0SUsTVxa
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="278558126"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="278558126"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 23:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="612099499"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Jun 2022 23:29:18 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o103B-000LZa-BD;
	Tue, 14 Jun 2022 06:29:17 +0000
Date: Tue, 14 Jun 2022 14:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@bytedance.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 2/3] io_uring: add support for IORING_OP_MSGSND
Message-ID: <202206141441.Zawylny2-lkp@intel.com>
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
config: hexagon-randconfig-r045-20220613 (https://download.01.org/0day-ci/archive/20220614/202206141441.Zawylny2-lkp@intel.com/config)
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

All errors (new ones prefixed by >>):

>> fs/io_uring.c:8291:10: error: call to undeclared function 'io_msgsnd_prep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   return io_msgsnd_prep(req, sqe);
                          ^
>> fs/io_uring.c:8637:9: error: call to undeclared function 'io_msgsnd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = io_msgsnd(req, issue_flags);
                         ^
   2 errors generated.


vim +/io_msgsnd_prep +8291 fs/io_uring.c

  8199	
  8200	static int io_req_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
  8201	{
  8202		switch (req->opcode) {
  8203		case IORING_OP_NOP:
  8204			return io_nop_prep(req, sqe);
  8205		case IORING_OP_READV:
  8206		case IORING_OP_READ_FIXED:
  8207		case IORING_OP_READ:
  8208		case IORING_OP_WRITEV:
  8209		case IORING_OP_WRITE_FIXED:
  8210		case IORING_OP_WRITE:
  8211			return io_prep_rw(req, sqe);
  8212		case IORING_OP_POLL_ADD:
  8213			return io_poll_add_prep(req, sqe);
  8214		case IORING_OP_POLL_REMOVE:
  8215			return io_poll_remove_prep(req, sqe);
  8216		case IORING_OP_FSYNC:
  8217			return io_fsync_prep(req, sqe);
  8218		case IORING_OP_SYNC_FILE_RANGE:
  8219			return io_sfr_prep(req, sqe);
  8220		case IORING_OP_SENDMSG:
  8221		case IORING_OP_SEND:
  8222			return io_sendmsg_prep(req, sqe);
  8223		case IORING_OP_RECVMSG:
  8224		case IORING_OP_RECV:
  8225			return io_recvmsg_prep(req, sqe);
  8226		case IORING_OP_CONNECT:
  8227			return io_connect_prep(req, sqe);
  8228		case IORING_OP_TIMEOUT:
  8229			return io_timeout_prep(req, sqe);
  8230		case IORING_OP_TIMEOUT_REMOVE:
  8231			return io_timeout_remove_prep(req, sqe);
  8232		case IORING_OP_ASYNC_CANCEL:
  8233			return io_async_cancel_prep(req, sqe);
  8234		case IORING_OP_LINK_TIMEOUT:
  8235			return io_link_timeout_prep(req, sqe);
  8236		case IORING_OP_ACCEPT:
  8237			return io_accept_prep(req, sqe);
  8238		case IORING_OP_FALLOCATE:
  8239			return io_fallocate_prep(req, sqe);
  8240		case IORING_OP_OPENAT:
  8241			return io_openat_prep(req, sqe);
  8242		case IORING_OP_CLOSE:
  8243			return io_close_prep(req, sqe);
  8244		case IORING_OP_FILES_UPDATE:
  8245			return io_files_update_prep(req, sqe);
  8246		case IORING_OP_STATX:
  8247			return io_statx_prep(req, sqe);
  8248		case IORING_OP_FADVISE:
  8249			return io_fadvise_prep(req, sqe);
  8250		case IORING_OP_MADVISE:
  8251			return io_madvise_prep(req, sqe);
  8252		case IORING_OP_OPENAT2:
  8253			return io_openat2_prep(req, sqe);
  8254		case IORING_OP_EPOLL_CTL:
  8255			return io_epoll_ctl_prep(req, sqe);
  8256		case IORING_OP_SPLICE:
  8257			return io_splice_prep(req, sqe);
  8258		case IORING_OP_PROVIDE_BUFFERS:
  8259			return io_provide_buffers_prep(req, sqe);
  8260		case IORING_OP_REMOVE_BUFFERS:
  8261			return io_remove_buffers_prep(req, sqe);
  8262		case IORING_OP_TEE:
  8263			return io_tee_prep(req, sqe);
  8264		case IORING_OP_SHUTDOWN:
  8265			return io_shutdown_prep(req, sqe);
  8266		case IORING_OP_RENAMEAT:
  8267			return io_renameat_prep(req, sqe);
  8268		case IORING_OP_UNLINKAT:
  8269			return io_unlinkat_prep(req, sqe);
  8270		case IORING_OP_MKDIRAT:
  8271			return io_mkdirat_prep(req, sqe);
  8272		case IORING_OP_SYMLINKAT:
  8273			return io_symlinkat_prep(req, sqe);
  8274		case IORING_OP_LINKAT:
  8275			return io_linkat_prep(req, sqe);
  8276		case IORING_OP_MSG_RING:
  8277			return io_msg_ring_prep(req, sqe);
  8278		case IORING_OP_FSETXATTR:
  8279			return io_fsetxattr_prep(req, sqe);
  8280		case IORING_OP_SETXATTR:
  8281			return io_setxattr_prep(req, sqe);
  8282		case IORING_OP_FGETXATTR:
  8283			return io_fgetxattr_prep(req, sqe);
  8284		case IORING_OP_GETXATTR:
  8285			return io_getxattr_prep(req, sqe);
  8286		case IORING_OP_SOCKET:
  8287			return io_socket_prep(req, sqe);
  8288		case IORING_OP_URING_CMD:
  8289			return io_uring_cmd_prep(req, sqe);
  8290		case IORING_OP_MSGSND:
> 8291			return io_msgsnd_prep(req, sqe);
  8292		}
  8293	
  8294		printk_once(KERN_WARNING "io_uring: unhandled opcode %d\n",
  8295				req->opcode);
  8296		return -EINVAL;
  8297	}
  8298	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
