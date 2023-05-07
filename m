Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ABF2567;
	Sun,  7 May 2023 16:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683476797; x=1715012797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3UR/J4ztwY8tjUb2RTBpfsM2IMtuW+rpTejNXDI8e50=;
  b=KvcthI2NjbmJQEGCyeOlHO0SqhMA1YgwP0e+ZwTM/nEbNebmMsmEq9yQ
   Wdaug7C8aFRUnCKYHv0tElM1p3EtT1PJYd6IQSC2VBhhdXvyBOIR2ookR
   RKodrgt52Y+i2GnCQKH9uGEl9aeOSAbuUFJrGV1PI4jwUlxEA7bQCKkDA
   NyVMLLIUM+Oh+yn8ON+0CkfT/wXM3/Wrz5GlEkHtis/wxCq9AyZA5YcK5
   Ev0Bc2sLCZtjVuaKkY1bVAAHAfvWhZqxc+X/c+YafFd7tzOw6+09ZXlJm
   hhlITjvWqVb30E0p0hW0qmQa38wbmzuCj6Mse8NOeyoNH2dHyBMDO7jc+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="377584480"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="377584480"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 09:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="1028160884"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="1028160884"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 May 2023 09:26:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvhDX-0000nZ-0D;
	Sun, 07 May 2023 16:26:35 +0000
Date: Mon, 8 May 2023 00:26:06 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-shmem-stable-dir-cookies 18/29]
 drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c:1048:32: error:
 use of undeclared identifier 'TLS_RECORD_TYPE_DATA'
Message-ID: <202305080047.rDFUvsAC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-shmem-stable-dir-cookies
head:   c219a290dc1a7661bd102ffa5ec6253b5111bd97
commit: 8d5929b8f51d4d8a3904f1a3b364f6ce75b50c8c [18/29] net/tls: Move TLS protocol elements to a separate header
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230508/202305080047.rDFUvsAC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=8d5929b8f51d4d8a3904f1a3b364f6ce75b50c8c
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-shmem-stable-dir-cookies
        git checkout 8d5929b8f51d4d8a3904f1a3b364f6ce75b50c8c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/ethernet/chelsio/inline_crypto/chtls/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305080047.rDFUvsAC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c:1048:32: error: use of undeclared identifier 'TLS_RECORD_TYPE_DATA'
                           unsigned char record_type = TLS_RECORD_TYPE_DATA;
                                                       ^
   drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c:1567:30: error: use of undeclared identifier 'TLS_RECORD_TYPE_DATA'
                           if (cerr && thdr->type != TLS_RECORD_TYPE_DATA) {
                                                     ^
   2 errors generated.


vim +/TLS_RECORD_TYPE_DATA +1048 drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c

6919a8264a3248 drivers/crypto/chelsio/chtls/chtls_io.c Rohit Maheshwari        2020-03-19  1006  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1007  int chtls_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1008  {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1009  	struct chtls_sock *csk = rcu_dereference_sk_user_data(sk);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1010  	struct chtls_dev *cdev = csk->cdev;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1011  	struct tcp_sock *tp = tcp_sk(sk);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1012  	struct sk_buff *skb;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1013  	int mss, flags, err;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1014  	int recordsz = 0;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1015  	int copied = 0;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1016  	long timeo;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1017  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1018  	lock_sock(sk);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1019  	flags = msg->msg_flags;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1020  	timeo = sock_sndtimeo(sk, flags & MSG_DONTWAIT);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1021  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1022  	if (!sk_in_state(sk, TCPF_ESTABLISHED | TCPF_CLOSE_WAIT)) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1023  		err = sk_stream_wait_connect(sk, &timeo);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1024  		if (err)
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1025  			goto out_err;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1026  	}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1027  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1028  	sk_clear_bit(SOCKWQ_ASYNC_NOSPACE, sk);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1029  	err = -EPIPE;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1030  	if (sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN))
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1031  		goto out_err;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1032  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1033  	mss = csk->mss;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1034  	csk_set_flag(csk, CSK_TX_MORE_DATA);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1035  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1036  	while (msg_data_left(msg)) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1037  		int copy = 0;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1038  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1039  		skb = skb_peek_tail(&csk->txq);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1040  		if (skb) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1041  			copy = mss - skb->len;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1042  			skb->ip_summed = CHECKSUM_UNNECESSARY;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1043  		}
3b8305f5c84468 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-05-27  1044  		if (!csk_mem_free(cdev, sk))
3b8305f5c84468 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-05-27  1045  			goto wait_for_sndbuf;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1046  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1047  		if (is_tls_tx(csk) && !csk->tlshws.txleft) {
6919a8264a3248 drivers/crypto/chelsio/chtls/chtls_io.c Rohit Maheshwari        2020-03-19 @1048  			unsigned char record_type = TLS_RECORD_TYPE_DATA;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1049  
6919a8264a3248 drivers/crypto/chelsio/chtls/chtls_io.c Rohit Maheshwari        2020-03-19  1050  			if (unlikely(msg->msg_controllen)) {
6919a8264a3248 drivers/crypto/chelsio/chtls/chtls_io.c Rohit Maheshwari        2020-03-19  1051  				err = chtls_proccess_cmsg(sk, msg,
6919a8264a3248 drivers/crypto/chelsio/chtls/chtls_io.c Rohit Maheshwari        2020-03-19  1052  							  &record_type);
6919a8264a3248 drivers/crypto/chelsio/chtls/chtls_io.c Rohit Maheshwari        2020-03-19  1053  				if (err)
6919a8264a3248 drivers/crypto/chelsio/chtls/chtls_io.c Rohit Maheshwari        2020-03-19  1054  					goto out_err;
c271042eb6a031 drivers/crypto/chelsio/chtls/chtls_io.c Vinay Kumar Yadav       2020-07-18  1055  
c271042eb6a031 drivers/crypto/chelsio/chtls/chtls_io.c Vinay Kumar Yadav       2020-07-18  1056  				/* Avoid appending tls handshake, alert to tls data */
c271042eb6a031 drivers/crypto/chelsio/chtls/chtls_io.c Vinay Kumar Yadav       2020-07-18  1057  				if (skb)
c271042eb6a031 drivers/crypto/chelsio/chtls/chtls_io.c Vinay Kumar Yadav       2020-07-18  1058  					tx_skb_finalize(skb);
6919a8264a3248 drivers/crypto/chelsio/chtls/chtls_io.c Rohit Maheshwari        2020-03-19  1059  			}
6919a8264a3248 drivers/crypto/chelsio/chtls/chtls_io.c Rohit Maheshwari        2020-03-19  1060  
6919a8264a3248 drivers/crypto/chelsio/chtls/chtls_io.c Rohit Maheshwari        2020-03-19  1061  			recordsz = size;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1062  			csk->tlshws.txleft = recordsz;
6919a8264a3248 drivers/crypto/chelsio/chtls/chtls_io.c Rohit Maheshwari        2020-03-19  1063  			csk->tlshws.type = record_type;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1064  		}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1065  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1066  		if (!skb || (ULP_SKB_CB(skb)->flags & ULPCB_FLAG_NO_APPEND) ||
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1067  		    copy <= 0) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1068  new_buf:
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1069  			if (skb) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1070  				tx_skb_finalize(skb);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1071  				push_frames_if_head(sk);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1072  			}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1073  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1074  			if (is_tls_tx(csk)) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1075  				skb = get_record_skb(sk,
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1076  						     select_size(sk,
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1077  								 recordsz,
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1078  								 flags,
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1079  								 TX_TLSHDR_LEN),
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1080  								 false);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1081  			} else {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1082  				skb = get_tx_skb(sk,
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1083  						 select_size(sk, size, flags,
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1084  							     TX_HEADER_LEN));
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1085  			}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1086  			if (unlikely(!skb))
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1087  				goto wait_for_memory;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1088  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1089  			skb->ip_summed = CHECKSUM_UNNECESSARY;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1090  			copy = mss;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1091  		}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1092  		if (copy > size)
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1093  			copy = size;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1094  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1095  		if (skb_tailroom(skb) > 0) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1096  			copy = min(copy, skb_tailroom(skb));
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1097  			if (is_tls_tx(csk))
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1098  				copy = min_t(int, copy, csk->tlshws.txleft);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1099  			err = skb_add_data_nocache(sk, skb,
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1100  						   &msg->msg_iter, copy);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1101  			if (err)
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1102  				goto do_fault;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1103  		} else {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1104  			int i = skb_shinfo(skb)->nr_frags;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1105  			struct page *page = TCP_PAGE(sk);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1106  			int pg_size = PAGE_SIZE;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1107  			int off = TCP_OFF(sk);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1108  			bool merge;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1109  
848dd1c1cbc5a1 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-12-11  1110  			if (page)
a50b854e073cd3 drivers/crypto/chelsio/chtls/chtls_io.c Matthew Wilcox (Oracle  2019-09-23  1111) 				pg_size = page_size(page);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1112  			if (off < pg_size &&
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1113  			    skb_can_coalesce(skb, i, page, off)) {
a83880068845d4 drivers/crypto/chelsio/chtls/chtls_io.c Vinay Kumar Yadav       2020-02-28  1114  				merge = true;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1115  				goto copy;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1116  			}
a83880068845d4 drivers/crypto/chelsio/chtls/chtls_io.c Vinay Kumar Yadav       2020-02-28  1117  			merge = false;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1118  			if (i == (is_tls_tx(csk) ? (MAX_SKB_FRAGS - 1) :
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1119  			    MAX_SKB_FRAGS))
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1120  				goto new_buf;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1121  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1122  			if (page && off == pg_size) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1123  				put_page(page);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1124  				TCP_PAGE(sk) = page = NULL;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1125  				pg_size = PAGE_SIZE;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1126  			}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1127  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1128  			if (!page) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1129  				gfp_t gfp = sk->sk_allocation;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1130  				int order = cdev->send_page_order;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1131  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1132  				if (order) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1133  					page = alloc_pages(gfp | __GFP_COMP |
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1134  							   __GFP_NOWARN |
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1135  							   __GFP_NORETRY,
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1136  							   order);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1137  					if (page)
a50b854e073cd3 drivers/crypto/chelsio/chtls/chtls_io.c Matthew Wilcox (Oracle  2019-09-23  1138) 						pg_size <<= order;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1139  				}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1140  				if (!page) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1141  					page = alloc_page(gfp);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1142  					pg_size = PAGE_SIZE;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1143  				}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1144  				if (!page)
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1145  					goto wait_for_memory;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1146  				off = 0;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1147  			}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1148  copy:
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1149  			if (copy > pg_size - off)
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1150  				copy = pg_size - off;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1151  			if (is_tls_tx(csk))
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1152  				copy = min_t(int, copy, csk->tlshws.txleft);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1153  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1154  			err = chtls_skb_copy_to_page_nocache(sk, &msg->msg_iter,
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1155  							     skb, page,
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1156  							     off, copy);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1157  			if (unlikely(err)) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1158  				if (!TCP_PAGE(sk)) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1159  					TCP_PAGE(sk) = page;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1160  					TCP_OFF(sk) = 0;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1161  				}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1162  				goto do_fault;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1163  			}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1164  			/* Update the skb. */
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1165  			if (merge) {
d7840976e39156 drivers/crypto/chelsio/chtls/chtls_io.c Matthew Wilcox (Oracle  2019-07-22  1166) 				skb_frag_size_add(
d7840976e39156 drivers/crypto/chelsio/chtls/chtls_io.c Matthew Wilcox (Oracle  2019-07-22  1167) 						&skb_shinfo(skb)->frags[i - 1],
d7840976e39156 drivers/crypto/chelsio/chtls/chtls_io.c Matthew Wilcox (Oracle  2019-07-22  1168) 						copy);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1169  			} else {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1170  				skb_fill_page_desc(skb, i, page, off, copy);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1171  				if (off + copy < pg_size) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1172  					/* space left keep page */
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1173  					get_page(page);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1174  					TCP_PAGE(sk) = page;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1175  				} else {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1176  					TCP_PAGE(sk) = NULL;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1177  				}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1178  			}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1179  			TCP_OFF(sk) = off + copy;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1180  		}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1181  		if (unlikely(skb->len == mss))
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1182  			tx_skb_finalize(skb);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1183  		tp->write_seq += copy;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1184  		copied += copy;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1185  		size -= copy;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1186  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1187  		if (is_tls_tx(csk))
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1188  			csk->tlshws.txleft -= copy;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1189  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1190  		if (corked(tp, flags) &&
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1191  		    (sk_stream_wspace(sk) < sk_stream_min_wspace(sk)))
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1192  			ULP_SKB_CB(skb)->flags |= ULPCB_FLAG_NO_APPEND;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1193  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1194  		if (size == 0)
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1195  			goto out;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1196  
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1197  		if (ULP_SKB_CB(skb)->flags & ULPCB_FLAG_NO_APPEND)
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1198  			push_frames_if_head(sk);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1199  		continue;
3b8305f5c84468 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-05-27  1200  wait_for_sndbuf:
3b8305f5c84468 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-05-27  1201  		set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1202  wait_for_memory:
3b8305f5c84468 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-05-27  1203  		err = csk_wait_memory(cdev, sk, &timeo);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1204  		if (err)
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1205  			goto do_error;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1206  	}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1207  out:
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1208  	csk_reset_flag(csk, CSK_TX_MORE_DATA);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1209  	if (copied)
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1210  		chtls_tcp_push(sk, flags);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1211  done:
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1212  	release_sock(sk);
848dd1c1cbc5a1 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-12-11  1213  	return copied;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1214  do_fault:
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1215  	if (!skb->len) {
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1216  		__skb_unlink(skb, &csk->txq);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1217  		sk->sk_wmem_queued -= skb->truesize;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1218  		__kfree_skb(skb);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1219  	}
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1220  do_error:
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1221  	if (copied)
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1222  		goto out;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1223  out_err:
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1224  	if (csk_conn_inline(csk))
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1225  		csk_reset_flag(csk, CSK_TX_MORE_DATA);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1226  	copied = sk_stream_error(sk, flags, err);
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1227  	goto done;
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1228  }
36bedb3f2e5b81 drivers/crypto/chelsio/chtls/chtls_io.c Atul Gupta              2018-03-31  1229  

:::::: The code at line 1048 was first introduced by commit
:::::: 6919a8264a3248dc0d7f945bb42f2c380f76b01e Crypto/chtls: add/delete TLS header in driver

:::::: TO: Rohit Maheshwari <rohitm@chelsio.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
