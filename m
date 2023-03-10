Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01453E4E1;
	Fri, 10 Mar 2023 23:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678490736; x=1710026736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/UvSU+EBcvgGq9r/H192yMaVlskrr3X8oj01aZyu+rI=;
  b=cwefQVF+C2GpIiecxPrCquLLiCi5TIotNTVnKeGPL9OCCMoLCgs/wYFY
   iNSNhhp6x/Mtxe4tSi9Qmw4c4UsPQ8+41QoTVddA3Wy7Oy+w61tNsTBH2
   dovKpVygq5pKlOq3Do/HCuA1Cz1/HjRmvtp9gdX6Zas8ya1bq0UW59JoB
   Q4zaqJhBeGGJ5oMQLBHmK6MBiVhzbduSJDAB6xZqp0NnmGTNnD6FqoE8H
   jUlPoFwPEyCDbAc2tfu69z/qEownM0n4JG0JmUajZQki7bytkzx/7MOwV
   IwwRiqrcpfOOzp1T2z3dlUX4f5eZ1rmpXe4tcbtixkkw5E0xhXGEAHERF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="316498011"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="316498011"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 15:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="1007295706"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="1007295706"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Mar 2023 15:25:34 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pam7B-0004AH-1q;
	Fri, 10 Mar 2023 23:25:33 +0000
Date: Sat, 11 Mar 2023 07:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 30/30] net/unix/af_unix.c:855:3: error: field
 designator 'sendpage' does not refer to any field in type 'const struct
 proto_ops'
Message-ID: <202303110734.VR5QNGcb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pipe-list
head:   e76345d9b0b65f673fbee4ce5c3ef8450e89638e
commit: e76345d9b0b65f673fbee4ce5c3ef8450e89638e [30/30] sock: Remove ->sendpage*() in favour of sendmsg(MSG_SPLICE_PAGES)
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230311/202303110734.VR5QNGcb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=e76345d9b0b65f673fbee4ce5c3ef8450e89638e
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout e76345d9b0b65f673fbee4ce5c3ef8450e89638e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110734.VR5QNGcb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/unix/af_unix.c:855:3: error: field designator 'sendpage' does not refer to any field in type 'const struct proto_ops'
           .sendpage =     unix_stream_sendpage,
            ^
   1 error generated.
--
   In file included from net/sunrpc/svcsock.c:51:
   In file included from include/linux/sunrpc/clnt.h:20:
   In file included from include/linux/sunrpc/sched.h:19:
   include/linux/sunrpc/xdr.h:779:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (len > SIZE_MAX / sizeof(*p))
               ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
>> net/sunrpc/svcsock.c:1066:9: error: implicit declaration of function 'kernel_sendpage' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return kernel_sendpage(sock, virt_to_page(vec->iov_base),
                  ^
   net/sunrpc/svcsock.c:1066:9: note: did you mean 'kernel_sendmsg'?
   include/linux/net.h:324:5: note: 'kernel_sendmsg' declared here
   int kernel_sendmsg(struct socket *sock, struct msghdr *msg, struct kvec *vec,
       ^
   net/sunrpc/svcsock.c:1121:10: error: implicit declaration of function 'kernel_sendpage' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           ret = kernel_sendpage(sock, bvec->bv_page,
                                 ^
   1 warning and 2 errors generated.


vim +855 net/unix/af_unix.c

f55bb7f9cb82dec Pavel Emelyanov      2012-02-21  834  
90ddc4f0470427d Eric Dumazet         2005-12-22  835  static const struct proto_ops unix_stream_ops = {
^1da177e4c3f415 Linus Torvalds       2005-04-16  836  	.family =	PF_UNIX,
^1da177e4c3f415 Linus Torvalds       2005-04-16  837  	.owner =	THIS_MODULE,
^1da177e4c3f415 Linus Torvalds       2005-04-16  838  	.release =	unix_release,
^1da177e4c3f415 Linus Torvalds       2005-04-16  839  	.bind =		unix_bind,
^1da177e4c3f415 Linus Torvalds       2005-04-16  840  	.connect =	unix_stream_connect,
^1da177e4c3f415 Linus Torvalds       2005-04-16  841  	.socketpair =	unix_socketpair,
^1da177e4c3f415 Linus Torvalds       2005-04-16  842  	.accept =	unix_accept,
^1da177e4c3f415 Linus Torvalds       2005-04-16  843  	.getname =	unix_getname,
a11e1d432b51f63 Linus Torvalds       2018-06-28  844  	.poll =		unix_poll,
^1da177e4c3f415 Linus Torvalds       2005-04-16  845  	.ioctl =	unix_ioctl,
5f6beb9e0f633f3 Arnd Bergmann        2019-06-03  846  #ifdef CONFIG_COMPAT
5f6beb9e0f633f3 Arnd Bergmann        2019-06-03  847  	.compat_ioctl =	unix_compat_ioctl,
5f6beb9e0f633f3 Arnd Bergmann        2019-06-03  848  #endif
^1da177e4c3f415 Linus Torvalds       2005-04-16  849  	.listen =	unix_listen,
^1da177e4c3f415 Linus Torvalds       2005-04-16  850  	.shutdown =	unix_shutdown,
^1da177e4c3f415 Linus Torvalds       2005-04-16  851  	.sendmsg =	unix_stream_sendmsg,
^1da177e4c3f415 Linus Torvalds       2005-04-16  852  	.recvmsg =	unix_stream_recvmsg,
965b57b469a589d Cong Wang            2022-06-15  853  	.read_skb =	unix_stream_read_skb,
^1da177e4c3f415 Linus Torvalds       2005-04-16  854  	.mmap =		sock_no_mmap,
869e7c62486ec0e Hannes Frederic Sowa 2015-05-21 @855  	.sendpage =	unix_stream_sendpage,
2b514574f7e88c8 Hannes Frederic Sowa 2015-05-21  856  	.splice_read =	unix_stream_splice_read,
fc0d753641f7b91 Pavel Emelyanov      2012-02-21  857  	.set_peek_off =	unix_set_peek_off,
3c32da19a858fb1 Kirill Tkhai         2019-12-09  858  	.show_fdinfo =	unix_show_fdinfo,
^1da177e4c3f415 Linus Torvalds       2005-04-16  859  };
^1da177e4c3f415 Linus Torvalds       2005-04-16  860  

:::::: The code at line 855 was first introduced by commit
:::::: 869e7c62486ec0e170a9771acaa251d1a33b5871 net: af_unix: implement stream sendpage support

:::::: TO: Hannes Frederic Sowa <hannes@stressinduktion.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
