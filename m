Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF860204F8B;
	Wed, 16 Apr 2025 15:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744816336; cv=none; b=YGLnXLsODw/gNsjSSneb5v668U2Xvvu9Tv8sXRmnOU5N3xXEWttPds9xtF/z/ZJ8Zy7M4QfgcMpDZwydbHcLODKrQQmiW//QHcIgpRLMlFlmaPr7aXcRlrxTQb327fFdou41h8dNYBxkKMzYwJ6SuCz/AzUeDoL7NYC7w69ffDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744816336; c=relaxed/simple;
	bh=9qzPencW113V2WTgWeho/3FWA2JpX7obGfHVurw4i9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t7e0qXHrTTIHSC0MHiAr3pRplPGKt6n5pj48kS8A4nGtdW/lmDo9F/Xx+xj2IHifPs56d+0BPDUWG64P0KZewpaTHxiG04jvMvmRuhfCHgZizVA1Wdp81o5FB+idEjQdJ9/aDfE0KPeablkv2fVFeqT49VQcscP6DCsnXZKH95M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyH5VtP9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyH5VtP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744816334; x=1776352334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9qzPencW113V2WTgWeho/3FWA2JpX7obGfHVurw4i9A=;
  b=IyH5VtP9oV64b7N4FFgFiUB64TL/+s/h+8Tb2oR0HLnfKfutkz9EO+55
   Z5a4bo1Yn1bUiUZb/tWs08vbZFw7tq7qb67sVbObtHxgne5PyPdUsJLvM
   h2BVJSZ3Ww6ygcQh05zXrcezOCndUadrVkUhotiKvniaGpG4FWz8NEf+6
   Z6wX8LhSAbxnKri+Xz5MQGaPs4s7HjUXzOP/IQaa90SYkG6wvmWsEIzsw
   NvQcFPnDWTyW95CCpXjz4K+IMah4iAJeFXmMgWpNEKTeSmeU3aN/aPmBq
   g13ZuKylb8dh1MmWv8XYrffQldkNQXYnhjf1wrEKWVCqdaqww8wi0rZW1
   Q==;
X-CSE-ConnectionGUID: 3YghHb2XS+O97Vzpidujrg==
X-CSE-MsgGUID: Eu8tECrQTwaY3vhv+MFVIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57743810"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="57743810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 08:12:13 -0700
X-CSE-ConnectionGUID: kEtLLD14QEGomv8Ma75Itg==
X-CSE-MsgGUID: PavtYALoT8KUELr3Auvt1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135355347"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Apr 2025 08:12:12 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u54Qr-000JxP-2v;
	Wed, 16 Apr 2025 15:12:09 +0000
Date: Wed, 16 Apr 2025 23:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.timers/core 4/10]
 net/ipv4/inet_connection_sock.c:1072:29: error: call to undeclared function
 'from_timer'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202504162318.HYFGIAgD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ingo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.timers/core
head:   e42d8536937923868af908502797aa7923df52b1
commit: 24e5f9a3c2f20d7a7c04b6d5cb2b4b7ec4f1a707 [4/10] treewide, timers: Rename destroy_timer_on_stack() => timer_destroy_on_stack()
config: i386-buildonly-randconfig-005-20250416 (https://download.01.org/0day-ci/archive/20250416/202504162318.HYFGIAgD-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504162318.HYFGIAgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504162318.HYFGIAgD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ipv4/inet_connection_sock.c:1072:29: error: call to undeclared function 'from_timer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1072 |         struct request_sock *req = from_timer(req, t, rsk_timer);
         |                                    ^
   net/ipv4/inet_connection_sock.c:1072:29: note: did you mean 'mod_timer'?
   include/linux/timer.h:151:12: note: 'mod_timer' declared here
     151 | extern int mod_timer(struct timer_list *timer, unsigned long expires);
         |            ^
>> net/ipv4/inet_connection_sock.c:1072:48: error: use of undeclared identifier 'rsk_timer'
    1072 |         struct request_sock *req = from_timer(req, t, rsk_timer);
         |                                                       ^
   2 errors generated.


vim +/from_timer +1072 net/ipv4/inet_connection_sock.c

  1069	
  1070	static void reqsk_timer_handler(struct timer_list *t)
  1071	{
> 1072		struct request_sock *req = from_timer(req, t, rsk_timer);
  1073		struct request_sock *nreq = NULL, *oreq = req;
  1074		struct sock *sk_listener = req->rsk_listener;
  1075		struct inet_connection_sock *icsk;
  1076		struct request_sock_queue *queue;
  1077		struct net *net;
  1078		int max_syn_ack_retries, qlen, expire = 0, resend = 0;
  1079	
  1080		if (inet_sk_state_load(sk_listener) != TCP_LISTEN) {
  1081			struct sock *nsk;
  1082	
  1083			nsk = reuseport_migrate_sock(sk_listener, req_to_sk(req), NULL);
  1084			if (!nsk)
  1085				goto drop;
  1086	
  1087			nreq = inet_reqsk_clone(req, nsk);
  1088			if (!nreq)
  1089				goto drop;
  1090	
  1091			/* The new timer for the cloned req can decrease the 2
  1092			 * by calling inet_csk_reqsk_queue_drop_and_put(), so
  1093			 * hold another count to prevent use-after-free and
  1094			 * call reqsk_put() just before return.
  1095			 */
  1096			refcount_set(&nreq->rsk_refcnt, 2 + 1);
  1097			timer_setup(&nreq->rsk_timer, reqsk_timer_handler, TIMER_PINNED);
  1098			reqsk_queue_migrated(&inet_csk(nsk)->icsk_accept_queue, req);
  1099	
  1100			req = nreq;
  1101			sk_listener = nsk;
  1102		}
  1103	
  1104		icsk = inet_csk(sk_listener);
  1105		net = sock_net(sk_listener);
  1106		max_syn_ack_retries = READ_ONCE(icsk->icsk_syn_retries) ? :
  1107			READ_ONCE(net->ipv4.sysctl_tcp_synack_retries);
  1108		/* Normally all the openreqs are young and become mature
  1109		 * (i.e. converted to established socket) for first timeout.
  1110		 * If synack was not acknowledged for 1 second, it means
  1111		 * one of the following things: synack was lost, ack was lost,
  1112		 * rtt is high or nobody planned to ack (i.e. synflood).
  1113		 * When server is a bit loaded, queue is populated with old
  1114		 * open requests, reducing effective size of queue.
  1115		 * When server is well loaded, queue size reduces to zero
  1116		 * after several minutes of work. It is not synflood,
  1117		 * it is normal operation. The solution is pruning
  1118		 * too old entries overriding normal timeout, when
  1119		 * situation becomes dangerous.
  1120		 *
  1121		 * Essentially, we reserve half of room for young
  1122		 * embrions; and abort old ones without pity, if old
  1123		 * ones are about to clog our table.
  1124		 */
  1125		queue = &icsk->icsk_accept_queue;
  1126		qlen = reqsk_queue_len(queue);
  1127		if ((qlen << 1) > max(8U, READ_ONCE(sk_listener->sk_max_ack_backlog))) {
  1128			int young = reqsk_queue_len_young(queue) << 1;
  1129	
  1130			while (max_syn_ack_retries > 2) {
  1131				if (qlen < young)
  1132					break;
  1133				max_syn_ack_retries--;
  1134				young <<= 1;
  1135			}
  1136		}
  1137		syn_ack_recalc(req, max_syn_ack_retries, READ_ONCE(queue->rskq_defer_accept),
  1138			       &expire, &resend);
  1139		req->rsk_ops->syn_ack_timeout(req);
  1140		if (!expire &&
  1141		    (!resend ||
  1142		     !inet_rtx_syn_ack(sk_listener, req) ||
  1143		     inet_rsk(req)->acked)) {
  1144			if (req->num_timeout++ == 0)
  1145				atomic_dec(&queue->young);
  1146			mod_timer(&req->rsk_timer, jiffies + reqsk_timeout(req, TCP_RTO_MAX));
  1147	
  1148			if (!nreq)
  1149				return;
  1150	
  1151			if (!inet_ehash_insert(req_to_sk(nreq), req_to_sk(oreq), NULL)) {
  1152				/* delete timer */
  1153				__inet_csk_reqsk_queue_drop(sk_listener, nreq, true);
  1154				goto no_ownership;
  1155			}
  1156	
  1157			__NET_INC_STATS(net, LINUX_MIB_TCPMIGRATEREQSUCCESS);
  1158			reqsk_migrate_reset(oreq);
  1159			reqsk_queue_removed(&inet_csk(oreq->rsk_listener)->icsk_accept_queue, oreq);
  1160			reqsk_put(oreq);
  1161	
  1162			reqsk_put(nreq);
  1163			return;
  1164		}
  1165	
  1166		/* Even if we can clone the req, we may need not retransmit any more
  1167		 * SYN+ACKs (nreq->num_timeout > max_syn_ack_retries, etc), or another
  1168		 * CPU may win the "own_req" race so that inet_ehash_insert() fails.
  1169		 */
  1170		if (nreq) {
  1171			__NET_INC_STATS(net, LINUX_MIB_TCPMIGRATEREQFAILURE);
  1172	no_ownership:
  1173			reqsk_migrate_reset(nreq);
  1174			reqsk_queue_removed(queue, nreq);
  1175			__reqsk_free(nreq);
  1176		}
  1177	
  1178	drop:
  1179		__inet_csk_reqsk_queue_drop(sk_listener, oreq, true);
  1180		reqsk_put(oreq);
  1181	}
  1182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
