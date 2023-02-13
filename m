Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AC4AD2B;
	Mon, 13 Feb 2023 18:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676312673; x=1707848673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WaRGD3uwnJrl67JqYV1VcKv6T62YYZdcYDiAroF7eh8=;
  b=PkisnabwO6vaLkRjdjSimW02nS8Rexk8Fjt6umEOUCjKFrDsYfJ7gPIA
   qwNsJ26ecBUxEHlGTZYJHCsmTqzVpapS7ZB2DjhjFmjQJKEdFSsscnIta
   Q9KtDouY5ZSEusIaVo0cXstxyUIc6kFa6jCpQ5+FBooG8imsWL5KTu61S
   pHNW3f7pzeVePAitkdQRDu4kp9GFfHyqVlkak82QNqkVVhLSrcVpuGqo9
   cjm57IIviiv3d77IVOrBWbeSErnw8hZpFX2qWOzfFY1GPncVFWLIdj8/N
   BWvn71tPKkiru5FoKCm+sz6pCtXIwePHeHcEObR/SXcp32N6cjzTUDa5Q
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="314601012"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="314601012"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 10:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="670916354"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="670916354"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 10:24:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRdV8-0007wR-2W;
	Mon, 13 Feb 2023 18:24:30 +0000
Date: Tue, 14 Feb 2023 02:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-testing 1/1] net/rxrpc/sendmsg.c:606:23: warning:
 format specifies type 'int' but the argument has type 'struct rxrpc_call *'
Message-ID: <202302140231.MkZmcNiF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-testing
head:   fa7f69da4a2210209299c01a778b068dc638a0b0
commit: fa7f69da4a2210209299c01a778b068dc638a0b0 [1/1] rxrpc: Don't print kernel pointers in warning messages
config: hexagon-randconfig-r016-20230212 (https://download.01.org/0day-ci/archive/20230214/202302140231.MkZmcNiF-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=fa7f69da4a2210209299c01a778b068dc638a0b0
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs afs-testing
        git checkout fa7f69da4a2210209299c01a778b068dc638a0b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/rxrpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140231.MkZmcNiF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/rxrpc/sendmsg.c:12:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from net/rxrpc/sendmsg.c:12:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from net/rxrpc/sendmsg.c:12:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> net/rxrpc/sendmsg.c:606:23: warning: format specifies type 'int' but the argument has type 'struct rxrpc_call *' [-Wformat]
           _leave(" = %c=%x\n", call);
                      ~~        ^~~~
   net/rxrpc/ar-internal.h:1339:63: note: expanded from macro '_leave'
   #define _leave(FMT,...) no_printk("<== %s()"FMT"",__func__ ,##__VA_ARGS__)
                                               ~~~               ^~~~~~~~~~~
   include/linux/printk.h:131:17: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                          ~~~    ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
>> net/rxrpc/sendmsg.c:606:17: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
           _leave(" = %c=%x\n", call);
                         ~^
   net/rxrpc/ar-internal.h:1339:45: note: expanded from macro '_leave'
   #define _leave(FMT,...) no_printk("<== %s()"FMT"",__func__ ,##__VA_ARGS__)
                                               ^~~
   include/linux/printk.h:131:10: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                          ^~~
   include/linux/printk.h:457:53: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ^~~
   include/linux/printk.h:429:11: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ^~~~
   8 warnings generated.


vim +606 net/rxrpc/sendmsg.c

   566	
   567	/*
   568	 * Create a new client call for sendmsg().
   569	 * - Called with the socket lock held, which it must release.
   570	 * - If it returns a call, the call's lock will need releasing by the caller.
   571	 */
   572	static struct rxrpc_call *
   573	rxrpc_new_client_call_for_sendmsg(struct rxrpc_sock *rx, struct msghdr *msg,
   574					  struct rxrpc_send_params *p)
   575		__releases(&rx->sk.sk_lock.slock)
   576		__acquires(&call->user_mutex)
   577	{
   578		struct rxrpc_conn_parameters cp;
   579		struct rxrpc_call *call;
   580		struct key *key;
   581	
   582		DECLARE_SOCKADDR(struct sockaddr_rxrpc *, srx, msg->msg_name);
   583	
   584		_enter("");
   585	
   586		if (!msg->msg_name) {
   587			release_sock(&rx->sk);
   588			return ERR_PTR(-EDESTADDRREQ);
   589		}
   590	
   591		key = rx->key;
   592		if (key && !rx->key->payload.data[0])
   593			key = NULL;
   594	
   595		memset(&cp, 0, sizeof(cp));
   596		cp.local		= rx->local;
   597		cp.key			= rx->key;
   598		cp.security_level	= rx->min_sec_level;
   599		cp.exclusive		= rx->exclusive | p->exclusive;
   600		cp.upgrade		= p->upgrade;
   601		cp.service_id		= srx->srx_service;
   602		call = rxrpc_new_client_call(rx, &cp, srx, &p->call, GFP_KERNEL,
   603					     atomic_inc_return(&rxrpc_debug_id));
   604		/* The socket is now unlocked */
   605	
 > 606		_leave(" = %c=%x\n", call);
   607		return call;
   608	}
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
