Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C0612E
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 23:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661902900; x=1693438900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0tEyu1NWfIZb3Cp/gaCITzKqgIluxeLwJhrpaEzMLc=;
  b=NjDu1uN04t2OnnvBQ9nNdNUqA0El6XDuJBXCC7sZy9RYFyYwXhnxbvp7
   4E9Gk33vquwiDtGB1iHcK1JvB7pU36C8f9LJPMwsPF4QnxssNRplNRQcH
   TMP48TavWtjEa1ldrHY5KShwpLyDn++G608/zxHypzJMjYJvDt3US+xXD
   2mN11c/KlYR0g6BATCybPDOunDVJ1/7P+t6KE9roMdvR2Qa72NqIcqFIx
   70HqZaBLZdFThcxOyDtfYLlMqNyZmlQOlgBjllMlz8TUROI1H9/Jtp/ca
   F8KWdHZr4VwlJqQ3LfMQPQQkLXYBSbmnoCgRilaNZmPOUgAArp4HvccGI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="292908285"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="292908285"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 16:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="641616319"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2022 16:41:37 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTArQ-0000jz-2E;
	Tue, 30 Aug 2022 23:41:36 +0000
Date: Wed, 31 Aug 2022 07:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-fixes 1/5]
 net/rxrpc/peer_event.c:416:6: warning: variable 'peer' is used uninitialized
 whenever 'if' condition is false
Message-ID: <202208310714.iEB29eJf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/rxrpc-fixes
head:   5ba1502ed90c38548d56a41156440fa70aed70ed
commit: b445daa0f2ca96635e9620cef26a72619ce3644a [1/5] rxrpc: Fix ICMP/ICMP6 error handling
config: hexagon-buildonly-randconfig-r006-20220830 (https://download.01.org/0day-ci/archive/20220831/202208310714.iEB29eJf-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c7df82e4693c19e3fd2e25c83eb04d9deb7b7b59)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/b445daa0f2ca96635e9620cef26a72619ce3644a
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/rxrpc-fixes
        git checkout b445daa0f2ca96635e9620cef26a72619ce3644a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/rxrpc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/rxrpc/peer_event.c:416:6: warning: variable 'peer' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (serr->ee.ee_origin == SO_EE_ORIGIN_LOCAL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/peer_event.c:428:17: note: uninitialized use occurs here
           rxrpc_put_peer(peer);
                          ^~~~
   net/rxrpc/peer_event.c:416:2: note: remove the 'if' if its condition is always true
           if (serr->ee.ee_origin == SO_EE_ORIGIN_LOCAL) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/peer_event.c:391:25: note: initialize the variable 'peer' to silence this warning
           struct rxrpc_peer *peer;
                                  ^
                                   = NULL
   1 warning generated.


vim +416 net/rxrpc/peer_event.c

   382	
   383	/*
   384	 * Handle an error received on the local endpoint.
   385	 */
   386	void rxrpc_error_report(struct sock *sk)
   387	{
   388		struct sock_exterr_skb *serr;
   389		struct sockaddr_rxrpc srx;
   390		struct rxrpc_local *local;
   391		struct rxrpc_peer *peer;
   392		struct sk_buff *skb;
   393	
   394		rcu_read_lock();
   395		local = rcu_dereference_sk_user_data(sk);
   396		if (unlikely(!local)) {
   397			rcu_read_unlock();
   398			return;
   399		}
   400		_enter("%p{%d}", sk, local->debug_id);
   401	
   402		/* Clear the outstanding error value on the socket so that it doesn't
   403		 * cause kernel_sendmsg() to return it later.
   404		 */
   405		sock_error(sk);
   406	
   407		skb = sock_dequeue_err_skb(sk);
   408		if (!skb) {
   409			rcu_read_unlock();
   410			_leave("UDP socket errqueue empty");
   411			return;
   412		}
   413		rxrpc_new_skb(skb, rxrpc_skb_received);
   414		serr = SKB_EXT_ERR(skb);
   415	
 > 416		if (serr->ee.ee_origin == SO_EE_ORIGIN_LOCAL) {
   417			peer = rxrpc_lookup_peer_local_rcu(local, skb, &srx);
   418			if (peer && !rxrpc_get_peer_maybe(peer))
   419				peer = NULL;
   420			if (peer) {
   421				trace_rxrpc_rx_icmp(peer, &serr->ee, &srx);
   422				rxrpc_store_error(peer, serr);
   423			}
   424		}
   425	
   426		rcu_read_unlock();
   427		rxrpc_free_skb(skb, rxrpc_skb_freed);
   428		rxrpc_put_peer(peer);
   429		_leave("");
   430	}
   431	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
