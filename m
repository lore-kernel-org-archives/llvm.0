Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B28BA44;
	Wed, 22 Mar 2023 22:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679523179; x=1711059179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ADNxUTW1zCusm1gRKP2UDXVuNsrX9EnhFk/Tn90L1yY=;
  b=NYjPj+z2AD45j7A/b+lbSN1Qv/kAbG5G1Gq/ZikxyeX8Q3z6INtiec88
   KHXwpaSlzs012yL9SmRPb2FYu4vdQnI25ulLauC5Ae1TjCzP5GfXl0wJC
   xHrd2DXRaDfUIkVZJAMvd+OhUXOI/fz9EjEg0VMZ/kKUIDMpa5D8Dn9+a
   V2tGqAPfvXV/zI0m3Fs7QXqKumkD2qksqBeqW5veV6HXFNTsAD32bV4je
   jyFstN7pjaS1BxrQcXizWX7U0P2EMOLqK1s8PEzgExc7sofT8k0kgwcvv
   +keZl2ZpRAmCD1S2z8OuHnTzRPvwD8xQEsWOVgoh1yCbAVTgTK7I+59TB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339380766"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="339380766"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 15:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="825584371"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="825584371"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2023 15:12:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf6hU-000Dhk-1g;
	Wed, 22 Mar 2023 22:12:56 +0000
Date: Thu, 23 Mar 2023 06:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] ip: Make __ip{,6}_append_data() and co. take a
 msghdr*
Message-ID: <202303230649.hnY3j3oN-lkp@intel.com>
References: <20230322135612.3265850-3-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322135612.3265850-3-dhowells@redhat.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc3]
[cannot apply to herbert-cryptodev-2.6/master herbert-crypto-2.6/master bluetooth-next/master bluetooth/master next-20230322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/ip-Make-__ip-6-_append_data-and-co-take-a-msghdr/20230322-225741
patch link:    https://lore.kernel.org/r/20230322135612.3265850-3-dhowells%40redhat.com
patch subject: [RFC PATCH 2/3] ip: Make __ip{,6}_append_data() and co. take a msghdr*
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230323/202303230649.hnY3j3oN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/eecac0727821eaf716a8600550bf68f21ead4b87
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Howells/ip-Make-__ip-6-_append_data-and-co-take-a-msghdr/20230322-225741
        git checkout eecac0727821eaf716a8600550bf68f21ead4b87
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/l2tp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230649.hnY3j3oN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/l2tp/l2tp_ip6.c:638:10: error: too many arguments to function call, expected 8, have 9
                                 msg->msg_flags);
                                 ^~~~~~~~~~~~~~
   include/net/ipv6.h:1100:5: note: 'ip6_append_data' declared here
   int ip6_append_data(struct sock *sk, struct msghdr *msg,
       ^
   1 error generated.


vim +638 net/l2tp/l2tp_ip6.c

a32e0eec7042b2 Chris Elston         2012-04-29  487  
a32e0eec7042b2 Chris Elston         2012-04-29  488  /* Userspace will call sendmsg() on the tunnel socket to send L2TP
a32e0eec7042b2 Chris Elston         2012-04-29  489   * control frames.
a32e0eec7042b2 Chris Elston         2012-04-29  490   */
cee416e2c19501 David Howells        2023-03-22  491  static int l2tp_ip6_sendmsg(struct sock *sk, struct msghdr *msg)
a32e0eec7042b2 Chris Elston         2012-04-29  492  {
a32e0eec7042b2 Chris Elston         2012-04-29  493  	struct ipv6_txoptions opt_space;
342dfc306fb321 Steffen Hurrle       2014-01-17  494  	DECLARE_SOCKADDR(struct sockaddr_l2tpip6 *, lsa, msg->msg_name);
a32e0eec7042b2 Chris Elston         2012-04-29  495  	struct in6_addr *daddr, *final_p, final;
a32e0eec7042b2 Chris Elston         2012-04-29  496  	struct ipv6_pinfo *np = inet6_sk(sk);
45f6fad84cc305 Eric Dumazet         2015-11-29  497  	struct ipv6_txoptions *opt_to_free = NULL;
a32e0eec7042b2 Chris Elston         2012-04-29  498  	struct ipv6_txoptions *opt = NULL;
a32e0eec7042b2 Chris Elston         2012-04-29  499  	struct ip6_flowlabel *flowlabel = NULL;
a32e0eec7042b2 Chris Elston         2012-04-29  500  	struct dst_entry *dst = NULL;
a32e0eec7042b2 Chris Elston         2012-04-29  501  	struct flowi6 fl6;
26879da58711aa Wei Wang             2016-05-02  502  	struct ipcm6_cookie ipc6;
cee416e2c19501 David Howells        2023-03-22  503  	size_t len = msg_data_left(msg);
a32e0eec7042b2 Chris Elston         2012-04-29  504  	int addr_len = msg->msg_namelen;
a32e0eec7042b2 Chris Elston         2012-04-29  505  	int transhdrlen = 4; /* zero session-id */
f638a84afef3df Wang Yufen           2022-06-07  506  	int ulen;
a32e0eec7042b2 Chris Elston         2012-04-29  507  	int err;
a32e0eec7042b2 Chris Elston         2012-04-29  508  
a32e0eec7042b2 Chris Elston         2012-04-29  509  	/* Rough check on arithmetic overflow,
20dcb1107ab1a3 Tom Parkin           2020-07-22  510  	 * better check is made in ip6_append_data().
a32e0eec7042b2 Chris Elston         2012-04-29  511  	 */
f638a84afef3df Wang Yufen           2022-06-07  512  	if (len > INT_MAX - transhdrlen)
a32e0eec7042b2 Chris Elston         2012-04-29  513  		return -EMSGSIZE;
f638a84afef3df Wang Yufen           2022-06-07  514  	ulen = len + transhdrlen;
a32e0eec7042b2 Chris Elston         2012-04-29  515  
a32e0eec7042b2 Chris Elston         2012-04-29  516  	/* Mirror BSD error message compatibility */
a32e0eec7042b2 Chris Elston         2012-04-29  517  	if (msg->msg_flags & MSG_OOB)
a32e0eec7042b2 Chris Elston         2012-04-29  518  		return -EOPNOTSUPP;
a32e0eec7042b2 Chris Elston         2012-04-29  519  
20dcb1107ab1a3 Tom Parkin           2020-07-22  520  	/* Get and verify the address */
a32e0eec7042b2 Chris Elston         2012-04-29  521  	memset(&fl6, 0, sizeof(fl6));
a32e0eec7042b2 Chris Elston         2012-04-29  522  
a32e0eec7042b2 Chris Elston         2012-04-29  523  	fl6.flowi6_mark = sk->sk_mark;
e2d118a1cb5e60 Lorenzo Colitti      2016-11-04  524  	fl6.flowi6_uid = sk->sk_uid;
a32e0eec7042b2 Chris Elston         2012-04-29  525  
b515430ac9c25d Willem de Bruijn     2018-07-06  526  	ipcm6_init(&ipc6);
26879da58711aa Wei Wang             2016-05-02  527  
a32e0eec7042b2 Chris Elston         2012-04-29  528  	if (lsa) {
a32e0eec7042b2 Chris Elston         2012-04-29  529  		if (addr_len < SIN6_LEN_RFC2133)
a32e0eec7042b2 Chris Elston         2012-04-29  530  			return -EINVAL;
a32e0eec7042b2 Chris Elston         2012-04-29  531  
a32e0eec7042b2 Chris Elston         2012-04-29  532  		if (lsa->l2tp_family && lsa->l2tp_family != AF_INET6)
a32e0eec7042b2 Chris Elston         2012-04-29  533  			return -EAFNOSUPPORT;
a32e0eec7042b2 Chris Elston         2012-04-29  534  
a32e0eec7042b2 Chris Elston         2012-04-29  535  		daddr = &lsa->l2tp_addr;
a32e0eec7042b2 Chris Elston         2012-04-29  536  		if (np->sndflow) {
a32e0eec7042b2 Chris Elston         2012-04-29  537  			fl6.flowlabel = lsa->l2tp_flowinfo & IPV6_FLOWINFO_MASK;
a32e0eec7042b2 Chris Elston         2012-04-29  538  			if (fl6.flowlabel & IPV6_FLOWLABEL_MASK) {
a32e0eec7042b2 Chris Elston         2012-04-29  539  				flowlabel = fl6_sock_lookup(sk, fl6.flowlabel);
59c820b2317f0f Willem de Bruijn     2019-07-07  540  				if (IS_ERR(flowlabel))
a32e0eec7042b2 Chris Elston         2012-04-29  541  					return -EINVAL;
a32e0eec7042b2 Chris Elston         2012-04-29  542  			}
a32e0eec7042b2 Chris Elston         2012-04-29  543  		}
a32e0eec7042b2 Chris Elston         2012-04-29  544  
20dcb1107ab1a3 Tom Parkin           2020-07-22  545  		/* Otherwise it will be difficult to maintain
a32e0eec7042b2 Chris Elston         2012-04-29  546  		 * sk->sk_dst_cache.
a32e0eec7042b2 Chris Elston         2012-04-29  547  		 */
a32e0eec7042b2 Chris Elston         2012-04-29  548  		if (sk->sk_state == TCP_ESTABLISHED &&
efe4208f47f907 Eric Dumazet         2013-10-03  549  		    ipv6_addr_equal(daddr, &sk->sk_v6_daddr))
efe4208f47f907 Eric Dumazet         2013-10-03  550  			daddr = &sk->sk_v6_daddr;
a32e0eec7042b2 Chris Elston         2012-04-29  551  
a32e0eec7042b2 Chris Elston         2012-04-29  552  		if (addr_len >= sizeof(struct sockaddr_in6) &&
a32e0eec7042b2 Chris Elston         2012-04-29  553  		    lsa->l2tp_scope_id &&
a32e0eec7042b2 Chris Elston         2012-04-29  554  		    ipv6_addr_type(daddr) & IPV6_ADDR_LINKLOCAL)
a32e0eec7042b2 Chris Elston         2012-04-29  555  			fl6.flowi6_oif = lsa->l2tp_scope_id;
a32e0eec7042b2 Chris Elston         2012-04-29  556  	} else {
a32e0eec7042b2 Chris Elston         2012-04-29  557  		if (sk->sk_state != TCP_ESTABLISHED)
a32e0eec7042b2 Chris Elston         2012-04-29  558  			return -EDESTADDRREQ;
a32e0eec7042b2 Chris Elston         2012-04-29  559  
efe4208f47f907 Eric Dumazet         2013-10-03  560  		daddr = &sk->sk_v6_daddr;
a32e0eec7042b2 Chris Elston         2012-04-29  561  		fl6.flowlabel = np->flow_label;
a32e0eec7042b2 Chris Elston         2012-04-29  562  	}
a32e0eec7042b2 Chris Elston         2012-04-29  563  
a32e0eec7042b2 Chris Elston         2012-04-29  564  	if (fl6.flowi6_oif == 0)
ff0094030f146b Eric Dumazet         2022-05-13  565  		fl6.flowi6_oif = READ_ONCE(sk->sk_bound_dev_if);
a32e0eec7042b2 Chris Elston         2012-04-29  566  
a32e0eec7042b2 Chris Elston         2012-04-29  567  	if (msg->msg_controllen) {
a32e0eec7042b2 Chris Elston         2012-04-29  568  		opt = &opt_space;
a32e0eec7042b2 Chris Elston         2012-04-29  569  		memset(opt, 0, sizeof(struct ipv6_txoptions));
a32e0eec7042b2 Chris Elston         2012-04-29  570  		opt->tot_len = sizeof(struct ipv6_txoptions);
26879da58711aa Wei Wang             2016-05-02  571  		ipc6.opt = opt;
a32e0eec7042b2 Chris Elston         2012-04-29  572  
5fdaa88dfefa87 Willem de Bruijn     2018-07-06  573  		err = ip6_datagram_send_ctl(sock_net(sk), sk, msg, &fl6, &ipc6);
a32e0eec7042b2 Chris Elston         2012-04-29  574  		if (err < 0) {
a32e0eec7042b2 Chris Elston         2012-04-29  575  			fl6_sock_release(flowlabel);
a32e0eec7042b2 Chris Elston         2012-04-29  576  			return err;
a32e0eec7042b2 Chris Elston         2012-04-29  577  		}
a32e0eec7042b2 Chris Elston         2012-04-29  578  		if ((fl6.flowlabel & IPV6_FLOWLABEL_MASK) && !flowlabel) {
a32e0eec7042b2 Chris Elston         2012-04-29  579  			flowlabel = fl6_sock_lookup(sk, fl6.flowlabel);
59c820b2317f0f Willem de Bruijn     2019-07-07  580  			if (IS_ERR(flowlabel))
a32e0eec7042b2 Chris Elston         2012-04-29  581  				return -EINVAL;
a32e0eec7042b2 Chris Elston         2012-04-29  582  		}
a32e0eec7042b2 Chris Elston         2012-04-29  583  		if (!(opt->opt_nflen | opt->opt_flen))
a32e0eec7042b2 Chris Elston         2012-04-29  584  			opt = NULL;
a32e0eec7042b2 Chris Elston         2012-04-29  585  	}
a32e0eec7042b2 Chris Elston         2012-04-29  586  
45f6fad84cc305 Eric Dumazet         2015-11-29  587  	if (!opt) {
45f6fad84cc305 Eric Dumazet         2015-11-29  588  		opt = txopt_get(np);
45f6fad84cc305 Eric Dumazet         2015-11-29  589  		opt_to_free = opt;
45f6fad84cc305 Eric Dumazet         2015-11-29  590  	}
a32e0eec7042b2 Chris Elston         2012-04-29  591  	if (flowlabel)
a32e0eec7042b2 Chris Elston         2012-04-29  592  		opt = fl6_merge_options(&opt_space, flowlabel, opt);
a32e0eec7042b2 Chris Elston         2012-04-29  593  	opt = ipv6_fixup_options(&opt_space, opt);
26879da58711aa Wei Wang             2016-05-02  594  	ipc6.opt = opt;
a32e0eec7042b2 Chris Elston         2012-04-29  595  
a32e0eec7042b2 Chris Elston         2012-04-29  596  	fl6.flowi6_proto = sk->sk_protocol;
a32e0eec7042b2 Chris Elston         2012-04-29  597  	if (!ipv6_addr_any(daddr))
a32e0eec7042b2 Chris Elston         2012-04-29  598  		fl6.daddr = *daddr;
a32e0eec7042b2 Chris Elston         2012-04-29  599  	else
a32e0eec7042b2 Chris Elston         2012-04-29  600  		fl6.daddr.s6_addr[15] = 0x1; /* :: means loopback (BSD'ism) */
a32e0eec7042b2 Chris Elston         2012-04-29  601  	if (ipv6_addr_any(&fl6.saddr) && !ipv6_addr_any(&np->saddr))
a32e0eec7042b2 Chris Elston         2012-04-29  602  		fl6.saddr = np->saddr;
a32e0eec7042b2 Chris Elston         2012-04-29  603  
a32e0eec7042b2 Chris Elston         2012-04-29  604  	final_p = fl6_update_dst(&fl6, opt, &final);
a32e0eec7042b2 Chris Elston         2012-04-29  605  
a32e0eec7042b2 Chris Elston         2012-04-29  606  	if (!fl6.flowi6_oif && ipv6_addr_is_multicast(&fl6.daddr))
a32e0eec7042b2 Chris Elston         2012-04-29  607  		fl6.flowi6_oif = np->mcast_oif;
a32e0eec7042b2 Chris Elston         2012-04-29  608  	else if (!fl6.flowi6_oif)
a32e0eec7042b2 Chris Elston         2012-04-29  609  		fl6.flowi6_oif = np->ucast_oif;
a32e0eec7042b2 Chris Elston         2012-04-29  610  
3df98d79215ace Paul Moore           2020-09-27  611  	security_sk_classify_flow(sk, flowi6_to_flowi_common(&fl6));
a32e0eec7042b2 Chris Elston         2012-04-29  612  
38b7097b55b6cf Hannes Frederic Sowa 2016-06-11  613  	if (ipc6.tclass < 0)
38b7097b55b6cf Hannes Frederic Sowa 2016-06-11  614  		ipc6.tclass = np->tclass;
38b7097b55b6cf Hannes Frederic Sowa 2016-06-11  615  
38b7097b55b6cf Hannes Frederic Sowa 2016-06-11  616  	fl6.flowlabel = ip6_make_flowinfo(ipc6.tclass, fl6.flowlabel);
38b7097b55b6cf Hannes Frederic Sowa 2016-06-11  617  
c4e85f73afb638 Sabrina Dubroca      2019-12-04  618  	dst = ip6_dst_lookup_flow(sock_net(sk), sk, &fl6, final_p);
a32e0eec7042b2 Chris Elston         2012-04-29  619  	if (IS_ERR(dst)) {
a32e0eec7042b2 Chris Elston         2012-04-29  620  		err = PTR_ERR(dst);
a32e0eec7042b2 Chris Elston         2012-04-29  621  		goto out;
a32e0eec7042b2 Chris Elston         2012-04-29  622  	}
a32e0eec7042b2 Chris Elston         2012-04-29  623  
26879da58711aa Wei Wang             2016-05-02  624  	if (ipc6.hlimit < 0)
26879da58711aa Wei Wang             2016-05-02  625  		ipc6.hlimit = ip6_sk_dst_hoplimit(np, &fl6, dst);
a32e0eec7042b2 Chris Elston         2012-04-29  626  
26879da58711aa Wei Wang             2016-05-02  627  	if (ipc6.dontfrag < 0)
26879da58711aa Wei Wang             2016-05-02  628  		ipc6.dontfrag = np->dontfrag;
a32e0eec7042b2 Chris Elston         2012-04-29  629  
a32e0eec7042b2 Chris Elston         2012-04-29  630  	if (msg->msg_flags & MSG_CONFIRM)
a32e0eec7042b2 Chris Elston         2012-04-29  631  		goto do_confirm;
a32e0eec7042b2 Chris Elston         2012-04-29  632  
a32e0eec7042b2 Chris Elston         2012-04-29  633  back_from_confirm:
a32e0eec7042b2 Chris Elston         2012-04-29  634  	lock_sock(sk);
f69e6d131f5dac Al Viro              2014-11-24  635  	err = ip6_append_data(sk, ip_generic_getfrag, msg,
26879da58711aa Wei Wang             2016-05-02  636  			      ulen, transhdrlen, &ipc6,
a32e0eec7042b2 Chris Elston         2012-04-29  637  			      &fl6, (struct rt6_info *)dst,
5fdaa88dfefa87 Willem de Bruijn     2018-07-06 @638  			      msg->msg_flags);
a32e0eec7042b2 Chris Elston         2012-04-29  639  	if (err)
a32e0eec7042b2 Chris Elston         2012-04-29  640  		ip6_flush_pending_frames(sk);
a32e0eec7042b2 Chris Elston         2012-04-29  641  	else if (!(msg->msg_flags & MSG_MORE))
a32e0eec7042b2 Chris Elston         2012-04-29  642  		err = l2tp_ip6_push_pending_frames(sk);
a32e0eec7042b2 Chris Elston         2012-04-29  643  	release_sock(sk);
a32e0eec7042b2 Chris Elston         2012-04-29  644  done:
a32e0eec7042b2 Chris Elston         2012-04-29  645  	dst_release(dst);
a32e0eec7042b2 Chris Elston         2012-04-29  646  out:
a32e0eec7042b2 Chris Elston         2012-04-29  647  	fl6_sock_release(flowlabel);
45f6fad84cc305 Eric Dumazet         2015-11-29  648  	txopt_put(opt_to_free);
a32e0eec7042b2 Chris Elston         2012-04-29  649  
a32e0eec7042b2 Chris Elston         2012-04-29  650  	return err < 0 ? err : len;
a32e0eec7042b2 Chris Elston         2012-04-29  651  
a32e0eec7042b2 Chris Elston         2012-04-29  652  do_confirm:
0dec879f636f11 Julian Anastasov     2017-02-06  653  	if (msg->msg_flags & MSG_PROBE)
0dec879f636f11 Julian Anastasov     2017-02-06  654  		dst_confirm_neigh(dst, &fl6.daddr);
a32e0eec7042b2 Chris Elston         2012-04-29  655  	if (!(msg->msg_flags & MSG_PROBE) || len)
a32e0eec7042b2 Chris Elston         2012-04-29  656  		goto back_from_confirm;
a32e0eec7042b2 Chris Elston         2012-04-29  657  	err = 0;
a32e0eec7042b2 Chris Elston         2012-04-29  658  	goto done;
a32e0eec7042b2 Chris Elston         2012-04-29  659  }
a32e0eec7042b2 Chris Elston         2012-04-29  660  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
