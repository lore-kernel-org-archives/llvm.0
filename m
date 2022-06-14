Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F40E184A
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655194283; x=1686730283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PILnaJq8+SdT0NewtsC2iirEizp1s1uKin5H6ZTUG8I=;
  b=G4S4PbIONER+3356xqu/EAOzf0uyA7D05QggAfNp+ZomtXLfaamcmPBl
   2ssuRrISTpe1qkMeTVEpW8W8Uxyu91ZlG6m4zvkQNgkINu4AwjiLYBpdv
   p18CteR4TCyTuM3XO+sGl17kI6m3KYG5SCq0VCorSxnUgMmGwf9VFPwJE
   /0Kt1u0mwpqjNy8KOPgWvZcZmWPuT4fqffyWT/DPBrS/4RDyv4k+Y4UTS
   EenW1gsdFpwZBWQINPe9lnSKgjYoVTApGIARFu8jXKapQZ+lpLYaNMKn1
   jf4c8jnzCOkL45HnOv0wEvZ25tStrdwNf17AmQWmWmnZ1CLGAuKXDI/nT
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="364881960"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="364881960"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 01:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="651900521"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2022 01:11:21 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o11dw-000Leb-JO;
	Tue, 14 Jun 2022 08:11:20 +0000
Date: Tue, 14 Jun 2022 16:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@bytedance.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 3/3] io_uring: add support for IORING_OP_MSGRCV
Message-ID: <202206141643.zjDF6qdK-lkp@intel.com>
References: <20220613192642.2040118-4-usama.arif@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613192642.2040118-4-usama.arif@bytedance.com>

Hi Usama,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc2]
[cannot apply to next-20220614]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/io_uring-add-support-for-IORING_OP_MSGSND-IORING_OP_MSGRCV/20220614-043915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
config: hexagon-randconfig-r045-20220613 (https://download.01.org/0day-ci/archive/20220614/202206141643.zjDF6qdK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c97436f8b6e2718286e8496faf53a2c800e281cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/68c2ccd5226487853561a6eae75c70429721d46a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Usama-Arif/io_uring-add-support-for-IORING_OP_MSGSND-IORING_OP_MSGRCV/20220614-043915
        git checkout 68c2ccd5226487853561a6eae75c70429721d46a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/io_uring.c:8331:10: error: call to undeclared function 'io_msgsnd_prep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   return io_msgsnd_prep(req, sqe);
                          ^
>> fs/io_uring.c:8333:10: error: call to undeclared function 'io_msgrcv_prep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   return io_msgrcv_prep(req, sqe);
                          ^
   fs/io_uring.c:8679:9: error: call to undeclared function 'io_msgsnd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = io_msgsnd(req, issue_flags);
                         ^
>> fs/io_uring.c:8682:9: error: call to undeclared function 'io_msgrcv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = io_msgrcv(req, issue_flags);
                         ^
   4 errors generated.


vim +/io_msgrcv_prep +8333 fs/io_uring.c

  8239	
  8240	static int io_req_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
  8241	{
  8242		switch (req->opcode) {
  8243		case IORING_OP_NOP:
  8244			return io_nop_prep(req, sqe);
  8245		case IORING_OP_READV:
  8246		case IORING_OP_READ_FIXED:
  8247		case IORING_OP_READ:
  8248		case IORING_OP_WRITEV:
  8249		case IORING_OP_WRITE_FIXED:
  8250		case IORING_OP_WRITE:
  8251			return io_prep_rw(req, sqe);
  8252		case IORING_OP_POLL_ADD:
  8253			return io_poll_add_prep(req, sqe);
  8254		case IORING_OP_POLL_REMOVE:
  8255			return io_poll_remove_prep(req, sqe);
  8256		case IORING_OP_FSYNC:
  8257			return io_fsync_prep(req, sqe);
  8258		case IORING_OP_SYNC_FILE_RANGE:
  8259			return io_sfr_prep(req, sqe);
  8260		case IORING_OP_SENDMSG:
  8261		case IORING_OP_SEND:
  8262			return io_sendmsg_prep(req, sqe);
  8263		case IORING_OP_RECVMSG:
  8264		case IORING_OP_RECV:
  8265			return io_recvmsg_prep(req, sqe);
  8266		case IORING_OP_CONNECT:
  8267			return io_connect_prep(req, sqe);
  8268		case IORING_OP_TIMEOUT:
  8269			return io_timeout_prep(req, sqe);
  8270		case IORING_OP_TIMEOUT_REMOVE:
  8271			return io_timeout_remove_prep(req, sqe);
  8272		case IORING_OP_ASYNC_CANCEL:
  8273			return io_async_cancel_prep(req, sqe);
  8274		case IORING_OP_LINK_TIMEOUT:
  8275			return io_link_timeout_prep(req, sqe);
  8276		case IORING_OP_ACCEPT:
  8277			return io_accept_prep(req, sqe);
  8278		case IORING_OP_FALLOCATE:
  8279			return io_fallocate_prep(req, sqe);
  8280		case IORING_OP_OPENAT:
  8281			return io_openat_prep(req, sqe);
  8282		case IORING_OP_CLOSE:
  8283			return io_close_prep(req, sqe);
  8284		case IORING_OP_FILES_UPDATE:
  8285			return io_files_update_prep(req, sqe);
  8286		case IORING_OP_STATX:
  8287			return io_statx_prep(req, sqe);
  8288		case IORING_OP_FADVISE:
  8289			return io_fadvise_prep(req, sqe);
  8290		case IORING_OP_MADVISE:
  8291			return io_madvise_prep(req, sqe);
  8292		case IORING_OP_OPENAT2:
  8293			return io_openat2_prep(req, sqe);
  8294		case IORING_OP_EPOLL_CTL:
  8295			return io_epoll_ctl_prep(req, sqe);
  8296		case IORING_OP_SPLICE:
  8297			return io_splice_prep(req, sqe);
  8298		case IORING_OP_PROVIDE_BUFFERS:
  8299			return io_provide_buffers_prep(req, sqe);
  8300		case IORING_OP_REMOVE_BUFFERS:
  8301			return io_remove_buffers_prep(req, sqe);
  8302		case IORING_OP_TEE:
  8303			return io_tee_prep(req, sqe);
  8304		case IORING_OP_SHUTDOWN:
  8305			return io_shutdown_prep(req, sqe);
  8306		case IORING_OP_RENAMEAT:
  8307			return io_renameat_prep(req, sqe);
  8308		case IORING_OP_UNLINKAT:
  8309			return io_unlinkat_prep(req, sqe);
  8310		case IORING_OP_MKDIRAT:
  8311			return io_mkdirat_prep(req, sqe);
  8312		case IORING_OP_SYMLINKAT:
  8313			return io_symlinkat_prep(req, sqe);
  8314		case IORING_OP_LINKAT:
  8315			return io_linkat_prep(req, sqe);
  8316		case IORING_OP_MSG_RING:
  8317			return io_msg_ring_prep(req, sqe);
  8318		case IORING_OP_FSETXATTR:
  8319			return io_fsetxattr_prep(req, sqe);
  8320		case IORING_OP_SETXATTR:
  8321			return io_setxattr_prep(req, sqe);
  8322		case IORING_OP_FGETXATTR:
  8323			return io_fgetxattr_prep(req, sqe);
  8324		case IORING_OP_GETXATTR:
  8325			return io_getxattr_prep(req, sqe);
  8326		case IORING_OP_SOCKET:
  8327			return io_socket_prep(req, sqe);
  8328		case IORING_OP_URING_CMD:
  8329			return io_uring_cmd_prep(req, sqe);
  8330		case IORING_OP_MSGSND:
  8331			return io_msgsnd_prep(req, sqe);
  8332		case IORING_OP_MSGRCV:
> 8333			return io_msgrcv_prep(req, sqe);
  8334		}
  8335	
  8336		printk_once(KERN_WARNING "io_uring: unhandled opcode %d\n",
  8337				req->opcode);
  8338		return -EINVAL;
  8339	}
  8340	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
