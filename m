Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C96424B20;
	Wed, 17 Jan 2024 20:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705522281; cv=none; b=JzAk8xKhUTAJhktWhV4nPzvEzAJ4aqbtucVUKuztGbXU3LAArNxrC2HLWENJDcGl0sgYVSJXtFw0891EgbATBQwXtzsKB98renbKg8xQFwXf47oSag0k+WBq0d8njw0COpbMtbdgvTDIROcA9Zduq7bz8jfhoECoZdRS3xcVGHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705522281; c=relaxed/simple;
	bh=1rrVRrBw8frJUoDUa5u+SwEx1ju3nz6QvD7V37mkx4E=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=ajvUpQaldDtKchUx+m7RR22DN2xLcybTpScUxaBAbOX1E9ExzC/5QKdGKPKCuLiNE31amCSJU0aXRvmdjNg5bhhjdh3C+z6/6/06kaHMsanqUNs1NbZoqE5XF7p/36THzhzDTgE33q4mkqlEYZLzQg3TXQqhHArwC+b48CmMkY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGZxTI/s; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGZxTI/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705522280; x=1737058280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1rrVRrBw8frJUoDUa5u+SwEx1ju3nz6QvD7V37mkx4E=;
  b=FGZxTI/s+fnyboFJpNFc8qOs/KdB0iIVtPMvq7tm4oiJkcmEGoA0BMm0
   Lh5Ka9kEkpw2iGkfproublwdKoAP/h6nNiBFKuuy+rfTvWPhntSj8ohmX
   gq/eY80iqJNbLWPoaVlQNsWenJGwKe7rCoZvrrG///nvTW7+yyeWSE6YJ
   xhIIPdTJfJOqa2nOPSN2Pzuj+Aif96r2Z/BY7tW/cUEtjb2+SJLYhWF2N
   ULpwJqZXSmHkjz3edlDdx0pqSgu43fnYaGHYmhdZhOZHjkgg0BmSVDi51
   wvcuAHX7+BPuNVC4tRE45DcPcbO8HvY8zIyBBK8zaq92umj0jOsGDIo+f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7022895"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7022895"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 12:11:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="178145"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2024 12:11:17 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQCFm-0002JC-1k;
	Wed, 17 Jan 2024 20:11:14 +0000
Date: Thu, 18 Jan 2024 04:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: [bpf-next:master 32/36] net/core/filter.c:11842:13: warning:
 declaration of 'struct bpf_tcp_req_attrs' will not be visible outside of
 this function
Message-ID: <202401180418.CUVc0hxF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   be7c19de9ecf4d93a9908003a1a3b8f1e8f8a672
commit: b9c3eca5c086eb65f20ad92fe3aa3d556f23103b [32/36] bpf: tcp: Support arbitrary SYN Cookie.
config: i386-randconfig-011-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180418.CUVc0hxF-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180418.CUVc0hxF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180418.CUVc0hxF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/filter.c:11842:13: warning: declaration of 'struct bpf_tcp_req_attrs' will not be visible outside of this function [-Wvisibility]
    11842 |                                         struct bpf_tcp_req_attrs *attrs, int attrs__sz)
          |                                                ^
   1 warning generated.


vim +11842 net/core/filter.c

 11840	
 11841	__bpf_kfunc int bpf_sk_assign_tcp_reqsk(struct sk_buff *skb, struct sock *sk,
 11842						struct bpf_tcp_req_attrs *attrs, int attrs__sz)
 11843	{
 11844	#if IS_ENABLED(CONFIG_SYN_COOKIES)
 11845		const struct request_sock_ops *ops;
 11846		struct inet_request_sock *ireq;
 11847		struct tcp_request_sock *treq;
 11848		struct request_sock *req;
 11849		struct net *net;
 11850		__u16 min_mss;
 11851		u32 tsoff = 0;
 11852	
 11853		if (attrs__sz != sizeof(*attrs) ||
 11854		    attrs->reserved[0] || attrs->reserved[1] || attrs->reserved[2])
 11855			return -EINVAL;
 11856	
 11857		if (!skb_at_tc_ingress(skb))
 11858			return -EINVAL;
 11859	
 11860		net = dev_net(skb->dev);
 11861		if (net != sock_net(sk))
 11862			return -ENETUNREACH;
 11863	
 11864		switch (skb->protocol) {
 11865		case htons(ETH_P_IP):
 11866			ops = &tcp_request_sock_ops;
 11867			min_mss = 536;
 11868			break;
 11869	#if IS_BUILTIN(CONFIG_IPV6)
 11870		case htons(ETH_P_IPV6):
 11871			ops = &tcp6_request_sock_ops;
 11872			min_mss = IPV6_MIN_MTU - 60;
 11873			break;
 11874	#endif
 11875		default:
 11876			return -EINVAL;
 11877		}
 11878	
 11879		if (sk->sk_type != SOCK_STREAM || sk->sk_state != TCP_LISTEN ||
 11880		    sk_is_mptcp(sk))
 11881			return -EINVAL;
 11882	
 11883		if (attrs->mss < min_mss)
 11884			return -EINVAL;
 11885	
 11886		if (attrs->wscale_ok) {
 11887			if (!READ_ONCE(net->ipv4.sysctl_tcp_window_scaling))
 11888				return -EINVAL;
 11889	
 11890			if (attrs->snd_wscale > TCP_MAX_WSCALE ||
 11891			    attrs->rcv_wscale > TCP_MAX_WSCALE)
 11892				return -EINVAL;
 11893		}
 11894	
 11895		if (attrs->sack_ok && !READ_ONCE(net->ipv4.sysctl_tcp_sack))
 11896			return -EINVAL;
 11897	
 11898		if (attrs->tstamp_ok) {
 11899			if (!READ_ONCE(net->ipv4.sysctl_tcp_timestamps))
 11900				return -EINVAL;
 11901	
 11902			tsoff = attrs->rcv_tsecr - tcp_ns_to_ts(attrs->usec_ts_ok, tcp_clock_ns());
 11903		}
 11904	
 11905		req = inet_reqsk_alloc(ops, sk, false);
 11906		if (!req)
 11907			return -ENOMEM;
 11908	
 11909		ireq = inet_rsk(req);
 11910		treq = tcp_rsk(req);
 11911	
 11912		req->rsk_listener = sk;
 11913		req->syncookie = 1;
 11914		req->mss = attrs->mss;
 11915		req->ts_recent = attrs->rcv_tsval;
 11916	
 11917		ireq->snd_wscale = attrs->snd_wscale;
 11918		ireq->rcv_wscale = attrs->rcv_wscale;
 11919		ireq->tstamp_ok	= !!attrs->tstamp_ok;
 11920		ireq->sack_ok = !!attrs->sack_ok;
 11921		ireq->wscale_ok = !!attrs->wscale_ok;
 11922		ireq->ecn_ok = !!attrs->ecn_ok;
 11923	
 11924		treq->req_usec_ts = !!attrs->usec_ts_ok;
 11925		treq->ts_off = tsoff;
 11926	
 11927		skb_orphan(skb);
 11928		skb->sk = req_to_sk(req);
 11929		skb->destructor = sock_pfree;
 11930	
 11931		return 0;
 11932	#else
 11933		return -EOPNOTSUPP;
 11934	#endif
 11935	}
 11936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
