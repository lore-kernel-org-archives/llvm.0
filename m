Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5B733D5
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 13:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647006188; x=1678542188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZYWAt8CasOmpFYYg90HlEKCCSdk6/jyMs4zTHkqPfRo=;
  b=kNm2KgvZ2V18VRCtNbOMRYjeHyZicgwDzeEQKG4peFMEJytfozVZthP6
   1rcBsIAeaLBfGKgqLt4bDlEXeEvxr2sOiqKuKpJ8CmFDRoD0uBmJULwJ8
   yDg+8VzVeiLeUubZBuCMuhdVqpdefPgzfjP1rOHEmwaFHL7Jm1cKCUsID
   76Cyuz3Mwy7Ee2AMH03fWpGvlNkUEi1HRf7V7Foytt2YgrBS0RBxVbu+V
   Z3Bowv3T7faJKzXZBs09IMOXS8Huo5ZSftYEhDCWrf8SDfkOR5m4p7h0j
   sjVqCta2OtgAaTBz+0Tv5n0tpdvcBY9vduMYSAEWUbOyALlvsjh/fIobv
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="254401130"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="254401130"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 05:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="514507837"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 05:43:06 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSfXt-0006UT-L0; Fri, 11 Mar 2022 13:43:05 +0000
Date: Fri, 11 Mar 2022 21:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jiyong Park <jiyong@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 1/2] vsock: each transport cycles only on its own sockets
Message-ID: <202203112159.kNHX2McH-lkp@intel.com>
References: <20220310125425.4193879-2-jiyong@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310125425.4193879-2-jiyong@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jiyong,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 3bf7edc84a9eb4007dd9a0cb8878a7e1d5ec6a3b]

url:    https://github.com/0day-ci/linux/commits/Jiyong-Park/vsock-cycle-only-on-its-own-socket/20220310-205638
base:   3bf7edc84a9eb4007dd9a0cb8878a7e1d5ec6a3b
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220311/202203112159.kNHX2McH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6219060e1d706d7055fb0829b3bf23c5ae84790e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jiyong-Park/vsock-cycle-only-on-its-own-socket/20220310-205638
        git checkout 6219060e1d706d7055fb0829b3bf23c5ae84790e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/vmw_vsock/vmci_transport.c:808:25: error: use of undeclared identifier 'vmci_transport'
           if (vsk->transport != &vmci_transport)
                                  ^
   1 error generated.


vim +/vmci_transport +808 net/vmw_vsock/vmci_transport.c

   800	
   801	static void vmci_transport_handle_detach(struct sock *sk)
   802	{
   803		struct vsock_sock *vsk;
   804	
   805		vsk = vsock_sk(sk);
   806	
   807		/* Only handle our own sockets */
 > 808		if (vsk->transport != &vmci_transport)
   809			return;
   810	
   811		if (!vmci_handle_is_invalid(vmci_trans(vsk)->qp_handle)) {
   812			sock_set_flag(sk, SOCK_DONE);
   813	
   814			/* On a detach the peer will not be sending or receiving
   815			 * anymore.
   816			 */
   817			vsk->peer_shutdown = SHUTDOWN_MASK;
   818	
   819			/* We should not be sending anymore since the peer won't be
   820			 * there to receive, but we can still receive if there is data
   821			 * left in our consume queue. If the local endpoint is a host,
   822			 * we can't call vsock_stream_has_data, since that may block,
   823			 * but a host endpoint can't read data once the VM has
   824			 * detached, so there is no available data in that case.
   825			 */
   826			if (vsk->local_addr.svm_cid == VMADDR_CID_HOST ||
   827			    vsock_stream_has_data(vsk) <= 0) {
   828				if (sk->sk_state == TCP_SYN_SENT) {
   829					/* The peer may detach from a queue pair while
   830					 * we are still in the connecting state, i.e.,
   831					 * if the peer VM is killed after attaching to
   832					 * a queue pair, but before we complete the
   833					 * handshake. In that case, we treat the detach
   834					 * event like a reset.
   835					 */
   836	
   837					sk->sk_state = TCP_CLOSE;
   838					sk->sk_err = ECONNRESET;
   839					sk_error_report(sk);
   840					return;
   841				}
   842				sk->sk_state = TCP_CLOSE;
   843			}
   844			sk->sk_state_change(sk);
   845		}
   846	}
   847	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
