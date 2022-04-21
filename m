Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E781FD5
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650562591; x=1682098591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8LiXGEF4iaLH68tK0QEOMlFWqbyHkwJkbMI1AziSLvE=;
  b=bS30j/v2LI2b9fgu5l+DcaNDuraKNB7yzhx6Kw3yF0ZJkaIN4PnD34Eq
   Op1emaB+dakDd4PV0UppB2yXpdueeDE0uYQ/bn7hKZhPNAA9tjvN4UIwC
   NScgnjE2J61R1n6jQjdcK959TbCqxBxa9K790ZmW7e+cMngVI+8lhP0mj
   fserLktwO1oDSToEY/lhmxk7/bhm8Z9B5DVE7ovvfrES+OfO+BTyk6WxD
   UdEg6iPYgu1JrzFNUkhi9Hi6gmFupjaAfL7Vg1L4vc04AB0BFzUwPBqDm
   dGoWcSKxFQdf22VFBLVj+R6p8s8So3uOl/tLNH4QgbjB/9tWmtZXGof4J
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="327334828"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="327334828"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 10:36:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="703179772"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Apr 2022 10:36:28 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhajD-0008cj-LU;
	Thu, 21 Apr 2022 17:36:27 +0000
Date: Fri, 22 Apr 2022 01:35:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [dhowells-fs:rxrpc-ringless 16/21] net/rxrpc/recvmsg.c:358:17:
 warning: variable 'serial' set but not used
Message-ID: <202204220147.aPvpcmQ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-ringless
head:   c388a8388ad238ffbe0cd204c3eacaf200055751
commit: 58c2a63aa0c47fdeb5fbdab61785fc43cf212fa0 [16/21] changes
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220422/202204220147.aPvpcmQ8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=58c2a63aa0c47fdeb5fbdab61785fc43cf212fa0
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs rxrpc-ringless
        git checkout 58c2a63aa0c47fdeb5fbdab61785fc43cf212fa0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/rxrpc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/rxrpc/recvmsg.c:358:17: warning: variable 'serial' set but not used [-Wunused-but-set-variable]
           rxrpc_serial_t serial;
                          ^
   1 warning generated.


vim +/serial +358 net/rxrpc/recvmsg.c

17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  346  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  347  /*
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  348   * Deliver messages to a call.  This keeps processing packets until the buffer
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  349   * is filled and we find either more DATA (returns 0) or the end of the DATA
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  350   * (returns 1).  If more packets are required, it returns -EAGAIN.
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  351   */
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  352  static int rxrpc_recvmsg_data(struct socket *sock, struct rxrpc_call *call,
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  353  			      struct msghdr *msg, struct iov_iter *iter,
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  354  			      size_t len, int flags, size_t *_offset)
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  355  {
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  356  	struct rxrpc_skb_priv *sp;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  357  	struct sk_buff *skb;
e2de6c40489890 net/rxrpc/recvmsg.c    David Howells 2019-08-27 @358  	rxrpc_serial_t serial;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  359  	rxrpc_seq_t hard_ack, top, seq;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  360  	size_t remain;
f9c32435ab7221 net/rxrpc/recvmsg.c    David Howells 2019-10-31  361  	bool rx_pkt_last;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  362  	unsigned int rx_pkt_offset, rx_pkt_len;
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  363  	int ix, copy, ret = -EAGAIN, ret2;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  364  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  365  	rx_pkt_offset = call->rx_pkt_offset;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  366  	rx_pkt_len = call->rx_pkt_len;
f9c32435ab7221 net/rxrpc/recvmsg.c    David Howells 2019-10-31  367  	rx_pkt_last = call->rx_pkt_last;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  368  
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  369  	if (call->state >= RXRPC_CALL_SERVER_ACK_REQUEST) {
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  370  		seq = call->rx_hard_ack;
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  371  		ret = 1;
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  372  		goto done;
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  373  	}
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  374  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  375  	/* Barriers against rxrpc_input_data(). */
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  376  	hard_ack = call->rx_hard_ack;
d7e15835ab2784 net/rxrpc/recvmsg.c    David Howells 2017-02-24  377  	seq = hard_ack + 1;
f9c32435ab7221 net/rxrpc/recvmsg.c    David Howells 2019-10-31  378  
d7e15835ab2784 net/rxrpc/recvmsg.c    David Howells 2017-02-24  379  	while (top = smp_load_acquire(&call->rx_top),
d7e15835ab2784 net/rxrpc/recvmsg.c    David Howells 2017-02-24  380  	       before_eq(seq, top)
d7e15835ab2784 net/rxrpc/recvmsg.c    David Howells 2017-02-24  381  	       ) {
3f63ce6fffedc9 net/rxrpc/recvmsg.c    David Howells 2022-03-31  382  		ix = seq & RXRPC_RX_BUFF_MASK;
3f63ce6fffedc9 net/rxrpc/recvmsg.c    David Howells 2022-03-31  383  		skb = call->rx_buffer[ix];
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  384  		if (!skb) {
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  385  			trace_rxrpc_recvmsg(call, rxrpc_recvmsg_hole, seq,
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  386  					    rx_pkt_offset, rx_pkt_len, 0);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  387  			break;
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  388  		}
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  389  		smp_rmb();
987db9f7cd1e77 net/rxrpc/recvmsg.c    David Howells 2019-08-19  390  		rxrpc_see_skb(skb, rxrpc_skb_seen);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  391  		sp = rxrpc_skb(skb);
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  392  
e2de6c40489890 net/rxrpc/recvmsg.c    David Howells 2019-08-27  393  		if (!(flags & MSG_PEEK)) {
e2de6c40489890 net/rxrpc/recvmsg.c    David Howells 2019-08-27  394  			serial = sp->hdr.serial;
3f63ce6fffedc9 net/rxrpc/recvmsg.c    David Howells 2022-03-31  395  			serial += call->rx_annotations[ix] & RXRPC_RX_ANNO_SUBPACKET;
58c2a63aa0c47f net/rxrpc/recvmsg.c    David Howells 2022-04-06  396  			//trace_rxrpc_receive(call, rxrpc_receive_front,
58c2a63aa0c47f net/rxrpc/recvmsg.c    David Howells 2022-04-06  397  			//		    serial, seq);
e2de6c40489890 net/rxrpc/recvmsg.c    David Howells 2019-08-27  398  		}
58dc63c998ea3c net/rxrpc/recvmsg.c    David Howells 2016-09-17  399  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  400  		if (msg)
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  401  			sock_recv_timestamp(msg, sock->sk, skb);
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  402  
2e2ea51dec2ab6 net/rxrpc/recvmsg.c    David Howells 2016-09-17  403  		if (rx_pkt_offset == 0) {
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  404  			ret2 = rxrpc_locate_data(call, skb,
3f63ce6fffedc9 net/rxrpc/recvmsg.c    David Howells 2022-03-31  405  						 &call->rx_annotations[ix],
f9c32435ab7221 net/rxrpc/recvmsg.c    David Howells 2019-10-31  406  						 &rx_pkt_offset, &rx_pkt_len,
f9c32435ab7221 net/rxrpc/recvmsg.c    David Howells 2019-10-31  407  						 &rx_pkt_last);
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  408  			trace_rxrpc_recvmsg(call, rxrpc_recvmsg_next, seq,
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  409  					    rx_pkt_offset, rx_pkt_len, ret2);
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  410  			if (ret2 < 0) {
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  411  				ret = ret2;
2e2ea51dec2ab6 net/rxrpc/recvmsg.c    David Howells 2016-09-17  412  				goto out;
2e2ea51dec2ab6 net/rxrpc/recvmsg.c    David Howells 2016-09-17  413  			}
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  414  		} else {
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  415  			trace_rxrpc_recvmsg(call, rxrpc_recvmsg_cont, seq,
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  416  					    rx_pkt_offset, rx_pkt_len, 0);
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  417  		}
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  418  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  419  		/* We have to handle short, empty and used-up DATA packets. */
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  420  		remain = len - *_offset;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  421  		copy = rx_pkt_len;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  422  		if (copy > remain)
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  423  			copy = remain;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  424  		if (copy > 0) {
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  425  			ret2 = skb_copy_datagram_iter(skb, rx_pkt_offset, iter,
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  426  						      copy);
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  427  			if (ret2 < 0) {
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  428  				ret = ret2;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  429  				goto out;
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  430  			}
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  431  
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  432  			/* handle piecemeal consumption of data packets */
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  433  			rx_pkt_offset += copy;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  434  			rx_pkt_len -= copy;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  435  			*_offset += copy;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  436  		}
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  437  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  438  		if (rx_pkt_len > 0) {
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  439  			trace_rxrpc_recvmsg(call, rxrpc_recvmsg_full, seq,
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  440  					    rx_pkt_offset, rx_pkt_len, 0);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  441  			ASSERTCMP(*_offset, ==, len);
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  442  			ret = 0;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  443  			break;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  444  		}
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  445  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  446  		/* The whole packet has been transferred. */
372ee16386bbf6 net/rxrpc/recvmsg.c    David Howells 2016-08-03  447  		if (!(flags & MSG_PEEK))
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  448  			rxrpc_rotate_rx_window(call);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  449  		rx_pkt_offset = 0;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  450  		rx_pkt_len = 0;
372ee16386bbf6 net/rxrpc/recvmsg.c    David Howells 2016-08-03  451  
f9c32435ab7221 net/rxrpc/recvmsg.c    David Howells 2019-10-31  452  		if (rx_pkt_last) {
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  453  			ASSERTCMP(seq, ==, READ_ONCE(call->rx_top));
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  454  			ret = 1;
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  455  			goto out;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  456  		}
d7e15835ab2784 net/rxrpc/recvmsg.c    David Howells 2017-02-24  457  
d7e15835ab2784 net/rxrpc/recvmsg.c    David Howells 2017-02-24  458  		seq++;
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  459  	}
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  460  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  461  out:
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  462  	if (!(flags & MSG_PEEK)) {
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  463  		call->rx_pkt_offset = rx_pkt_offset;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  464  		call->rx_pkt_len = rx_pkt_len;
f9c32435ab7221 net/rxrpc/recvmsg.c    David Howells 2019-10-31  465  		call->rx_pkt_last = rx_pkt_last;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  466  	}
816c9fce12f374 net/rxrpc/recvmsg.c    David Howells 2016-09-17  467  done:
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  468  	trace_rxrpc_recvmsg(call, rxrpc_recvmsg_data_return, seq,
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  469  			    rx_pkt_offset, rx_pkt_len, ret);
d0b35a42031a31 net/rxrpc/recvmsg.c    David Howells 2018-07-23  470  	if (ret == -EAGAIN)
d0b35a42031a31 net/rxrpc/recvmsg.c    David Howells 2018-07-23  471  		set_bit(RXRPC_CALL_RX_UNDERRUN, &call->flags);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  472  	return ret;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  473  }
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  474  

:::::: The code at line 358 was first introduced by commit
:::::: e2de6c4048989007b353164b19d6b7d5be4fa9e3 rxrpc: Use info in skbuff instead of reparsing a jumbo packet

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
