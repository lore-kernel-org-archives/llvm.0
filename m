Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E894E7F4;
	Sat, 11 Feb 2023 01:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676078454; x=1707614454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FSFkbLFK9LkRUXuQrosil+MNNTb97P+b72WwNV7m3cQ=;
  b=Bsp+mLg5o9xma3xntcJBwOfeWlurT8hRFtsKwIgmmYPQ014Zv4RUhY1J
   mjC9QhvwQX10QrMdDeK3hwJh38ByyH1Bda36sC09xJ0JCw2wH4Ek5V4Z8
   evqyIq0GCREP4uOFhr9+9iP5yJGYa9Wmvzbt08oJ97g3VqXDLpX1zoPDv
   opOO+gPtLb4u0UMrIR6xCn9umnabiDAvEe2BgFS6v5PVUDYd15MqmgFi7
   QSsxfm5jOtURBGZgy4qJl9ZXhBdUxkh319jXDr8Y28GKgb8C7fvj8WFr5
   8YPpTy/H2qMXUbMECZLlBJHTDaAnkLkYI5Pl4W1F0RCIQL66CBmFux0kq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="392971198"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="392971198"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 17:20:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="661587622"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="661587622"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Feb 2023 17:20:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQeZP-00069d-2Y;
	Sat, 11 Feb 2023 01:20:51 +0000
Date: Sat, 11 Feb 2023 09:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-next 4/10]
 net/rxrpc/recvmsg.c:37:19: warning: variable 'sk' is uninitialized when used
 here
Message-ID: <202302110950.6lHzaqdE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/rxrpc-next
head:   c661a1d21c087e6a776a85eb4c60fbba29caaf99
commit: 0f2dc9220002c9a8172c453b9550df310bf9bd60 [4/10] rxrpc: Allow UDP socket sharing for AF_RXRPC service sockets
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230211/202302110950.6lHzaqdE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/0f2dc9220002c9a8172c453b9550df310bf9bd60
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/rxrpc-next
        git checkout 0f2dc9220002c9a8172c453b9550df310bf9bd60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/rxrpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110950.6lHzaqdE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/rxrpc/recvmsg.c:37:19: warning: variable 'sk' is uninitialized when used here [-Wuninitialized]
                   call->notify_rx(sk, call, call->user_call_ID);
                                   ^~
   net/rxrpc/recvmsg.c:26:17: note: initialize the variable 'sk' to silence this warning
           struct sock *sk;
                          ^
                           = NULL
   1 warning generated.


vim +/sk +37 net/rxrpc/recvmsg.c

17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  18  
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  19  /*
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  20   * Post a call for attention by the socket or kernel service.  Further
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  21   * notifications are suppressed by putting recvmsg_link on a dummy queue.
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  22   */
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  23  void rxrpc_notify_socket(struct rxrpc_call *call)
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  24  {
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  25  	struct rxrpc_sock *rx;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  26  	struct sock *sk;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  27  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  28  	_enter("%d", call->debug_id);
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  29  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  30  	if (!list_empty(&call->recvmsg_link))
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  31  		return;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  32  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  33  	rcu_read_lock();
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  34  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  35  	if (call->notify_rx) {
3dd9c8b5f09fd2 net/rxrpc/recvmsg.c    David Howells 2020-01-24  36  		spin_lock(&call->notify_lock);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08 @37  		call->notify_rx(sk, call, call->user_call_ID);
3dd9c8b5f09fd2 net/rxrpc/recvmsg.c    David Howells 2020-01-24  38  		spin_unlock(&call->notify_lock);
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  39  		goto out;
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  40  	}
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  41  
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  42  	rx = rcu_dereference(call->socket);
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  43  	if (rx) {
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  44  		sk = &rx->sk;
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  45  		if (sk->sk_state >= RXRPC_CLOSE)
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  46  			goto out;
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  47  
223f59016fa2b6 net/rxrpc/recvmsg.c    David Howells 2022-10-12  48  		spin_lock(&rx->recvmsg_lock);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  49  		if (list_empty(&call->recvmsg_link)) {
cb0fc0c9722c0c net/rxrpc/recvmsg.c    David Howells 2022-10-21  50  			rxrpc_get_call(call, rxrpc_call_get_notify_socket);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  51  			list_add_tail(&call->recvmsg_link, &rx->recvmsg_q);
214a64a83a9705 net/rxrpc/recvmsg.c    David Howells 2020-07-28  52  			rx->nr_recvmsg++;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  53  		}
223f59016fa2b6 net/rxrpc/recvmsg.c    David Howells 2022-10-12  54  		spin_unlock(&rx->recvmsg_lock);
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  55  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  56  		if (!sock_flag(sk, SOCK_DEAD)) {
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  57  			_debug("call %ps", sk->sk_data_ready);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  58  			sk->sk_data_ready(sk);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  59  		}
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  60  		goto out;
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  61  	}
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  62  
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  63  	if (call->service) {
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  64  		struct rxrpc_service *b = call->service;
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  65  
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  66  		spin_lock(&b->incoming_lock);
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  67  		if (list_empty(&call->recvmsg_link)) {
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  68  			list_add_tail(&call->recvmsg_link, &b->to_be_accepted);
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  69  			b->nr_tba++;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  70  		}
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  71  		list_for_each_entry(rx, &b->waiting_sockets, accept_link) {
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  72  			sk = &rx->sk;
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  73  			if (!sock_flag(sk, SOCK_DEAD))
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  74  				sk->sk_data_ready(sk);
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  75  		}
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  76  		spin_unlock(&b->incoming_lock);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  77  	}
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  78  
0f2dc9220002c9 net/rxrpc/recvmsg.c    David Howells 2022-06-16  79  out:
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  80  	rcu_read_unlock();
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  81  	_leave("");
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  82  }
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  83  

:::::: The code at line 37 was first introduced by commit
:::::: 248f219cb8bcbfbd7f132752d44afa2df7c241d1 rxrpc: Rewrite the data and ack handling code

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
