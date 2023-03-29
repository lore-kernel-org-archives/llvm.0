Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9C763D2;
	Wed, 29 Mar 2023 18:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680113767; x=1711649767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SM93Gf3OEoykbLXAhRIQnQY2XUwDEpIaR6b8tjYkRWo=;
  b=MgB/piJv37kf9UeGxMF8XqJcKOPdRdffmrxhdm60fYddydBnYjDlEAfw
   9OYrKBTHvYPHGLZ6jdEBDy6U9hXBYgiqdm9WkHdoF6kzh+1SuZ39QakzK
   5EFVon1x5UKoD2FAzpH2lk2jeMu2ryKpM3KV3PiG8SnjLu5kyu6Qauplu
   UC5HqzV/cKR1uPOS74TZIZg5XbrwOaWEdyPUsj/vzwt79lTT/IExN/NcS
   c+HQEMHqv+bii96pRAzt/MhqkqtxACDBl/Rw7jtO7NuHanQrw9agrGyWs
   z9FrSgw3QYZCqNQ27KPfax3JtZktQ4FaHIPDUO7u47RZ7INH8V5Dp2t0y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="405914093"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="405914093"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 11:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="795347176"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="795347176"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2023 11:16:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phaL7-000JoC-2W;
	Wed, 29 Mar 2023 18:16:05 +0000
Date: Thu, 30 Mar 2023 02:16:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-sendpage 28/63] net/tls/tls_main.c:130:4: error:
 field designator 'msg_kflags' does not refer to any field in type 'struct
 msghdr'; did you mean 'msg_flags'?
Message-ID: <202303300200.v3pCrbDt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-sendpage
head:   39e48c1301bf2fb60a53912fe5870a253256debc
commit: e1bd0668a8caff3ca2428ad9312c430379b56e46 [28/63] tls: Inline do_tcp_sendpages()
config: riscv-randconfig-r011-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300200.v3pCrbDt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=e1bd0668a8caff3ca2428ad9312c430379b56e46
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs iov-sendpage
        git checkout e1bd0668a8caff3ca2428ad9312c430379b56e46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/tls/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300200.v3pCrbDt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/tls/tls_main.c:130:4: error: field designator 'msg_kflags' does not refer to any field in type 'struct msghdr'; did you mean 'msg_flags'?
                   .msg_kflags     = MSG_SPLICE_PAGES,
                    ^~~~~~~~~~
                    msg_flags
   include/linux/socket.h:74:15: note: 'msg_flags' declared here
           unsigned int    msg_flags;      /* flags on received message */
                           ^
   net/tls/tls_main.c:130:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
                   .msg_kflags     = MSG_SPLICE_PAGES,
                                     ^~~~~~~~~~~~~~~~
   include/linux/socket.h:330:26: note: expanded from macro 'MSG_SPLICE_PAGES'
   #define MSG_SPLICE_PAGES 0x8000000      /* Splice the pages from the iterator in sendmsg() */
                            ^~~~~~~~~
   net/tls/tls_main.c:129:16: note: previous initialization is here
                   .msg_flags      = flags | MSG_SENDPAGE_NOTLAST,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +130 net/tls/tls_main.c

   120	
   121	int tls_push_sg(struct sock *sk,
   122			struct tls_context *ctx,
   123			struct scatterlist *sg,
   124			u16 first_offset,
   125			int flags)
   126	{
   127		struct bio_vec bvec;
   128		struct msghdr msg = {
   129			.msg_flags	= flags | MSG_SENDPAGE_NOTLAST,
 > 130			.msg_kflags	= MSG_SPLICE_PAGES,
   131		};
   132		int ret = 0;
   133		struct page *p;
   134		size_t size;
   135		int offset = first_offset;
   136	
   137		size = sg->length - offset;
   138		offset += sg->offset;
   139	
   140		ctx->splicing_pages = true;
   141		while (1) {
   142			if (sg_is_last(sg))
   143				msg.msg_flags = flags;
   144	
   145			/* is sending application-limited? */
   146			tcp_rate_check_app_limited(sk);
   147			p = sg_page(sg);
   148	retry:
   149			bvec_set_page(&bvec, p, size, offset);
   150			iov_iter_bvec(&msg.msg_iter, ITER_SOURCE, &bvec, 1, size);
   151	
   152			ret = tcp_sendmsg_locked(sk, &msg, size);
   153	
   154			if (ret != size) {
   155				if (ret > 0) {
   156					offset += ret;
   157					size -= ret;
   158					goto retry;
   159				}
   160	
   161				offset -= sg->offset;
   162				ctx->partially_sent_offset = offset;
   163				ctx->partially_sent_record = (void *)sg;
   164				ctx->splicing_pages = false;
   165				return ret;
   166			}
   167	
   168			put_page(p);
   169			sk_mem_uncharge(sk, sg->length);
   170			sg = sg_next(sg);
   171			if (!sg)
   172				break;
   173	
   174			offset = sg->offset;
   175			size = sg->length;
   176		}
   177	
   178		ctx->splicing_pages = false;
   179	
   180		return 0;
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
