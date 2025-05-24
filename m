Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7CF4A01;
	Sat, 24 May 2025 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748078082; cv=none; b=uQTkeFZCqeQ29779ye5fw7t3ajDirpYuvSth/v9xITdLRMkqq3kAlDvjnYkoNAG6VuWsYWZLuHYNcZq6btAAMNjCWinPsyFY7dlY1OO2AG8RQSY+cxgXA1SyVGrPgUZDmFrbvdy+LHwHuIQPT1IxADEByh471FkDxJw5tjxbPHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748078082; c=relaxed/simple;
	bh=kdOW+nIUgF2g3N9MSSsOb5oWhaYxWhlKowhrF/fB+Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cQqsv06Jf4u+mHFwg03BnYQUuVyTHdu3tWaX4fBScXfuCRPntfmHAMBflqXIovQsPrRsQIP3Qn9Z649XjwVc4ghdvjJZIuBYUhOEPymZCfHD8c86M+PWZ4EG6k9x0BaMycS5Uqo7/IlmRMZwYYruWwPGxjYybivTx+eBa7mOoKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XrkAEnHH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XrkAEnHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748078080; x=1779614080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kdOW+nIUgF2g3N9MSSsOb5oWhaYxWhlKowhrF/fB+Bs=;
  b=XrkAEnHHqIkgKP+gBDfR6xP3YPr5M8o8h8C5ee0mzWvHN0DqaQBnrKRg
   Wj6zJvlPQxFZhR2xLUHNedLWJt/TxuCeGgri8y2skPv39gZKj20+FEQ8B
   fR0fQffZyID5ekepkAl9g8nr2aWUeXKnVR9JMvXKub46xi5fipLe5iQYS
   0iF1PmvtenBxdSelmB4PVZNa3NG8o0fqfCaFYUbLPC0H0rB14jWW5SPji
   ZjPOo+GfPZjuxPjNr4HTkbUkeaS50TBoV8Pki+ui0b+DwxyzbrMfkTiQY
   Wg9f8it/JWb2h1YtlBkv12Ocj/m0fWG2l1hGwPJxl2YZjCdMUji/UaA+D
   A==;
X-CSE-ConnectionGUID: pUq4Cq0zQ8e6outlJ3PESQ==
X-CSE-MsgGUID: oocyumpxTomPD6ayfLMsIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50177523"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50177523"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 02:14:40 -0700
X-CSE-ConnectionGUID: UAU4JZQHSd6qQWVGx2PIyg==
X-CSE-MsgGUID: f/vqoHtiQV6WJyLVr18OEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141413159"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 May 2025 02:14:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIkxf-000R4o-3A;
	Sat, 24 May 2025 09:14:35 +0000
Date: Sat, 24 May 2025 17:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Jumper <greg.jumper@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	LUCI Bot <vijayendra.suman@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>
Subject: [jlayton:uek-localio 1944/2262] net/rds/send.c:1380:18: warning:
 variable 'rns' set but not used
Message-ID: <202505241704.Id3nau5v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 09b27477265df03926c91a3c5294bc2b582f2472 [1944/2262] Revert "Revert "net/rds: Track "rds" module statistics per network namespace""
config: arm-randconfig-003-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241704.Id3nau5v-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241704.Id3nau5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241704.Id3nau5v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/rds/send.c:38:
   net/rds/rds.h:1030:22: error: no member named 'net' in 'possible_net_t'
    1030 |                         return sk->sk_net.net->ns.inum;
         |                                ~~~~~~~~~~ ^
>> net/rds/send.c:1380:18: warning: variable 'rns' set but not used [-Wunused-but-set-variable]
    1380 |         struct rds_net *rns;
         |                         ^
   1 warning and 1 error generated.


vim +/rns +1380 net/rds/send.c

  1360	
  1361	int rds_sendmsg(struct socket *sock, struct msghdr *msg, size_t payload_len)
  1362	{
  1363		struct sock *sk = sock->sk;
  1364		struct rds_sock *rs = rds_sk_to_rs(sk);
  1365	#if IS_ENABLED(CONFIG_IPV6)
  1366		struct sockaddr_in6 *sin6 = (struct sockaddr_in6 *)msg->msg_name;
  1367	#endif
  1368		struct sockaddr_in *usin = (struct sockaddr_in *)msg->msg_name;
  1369		__be16 dport;
  1370		struct rds_message *rm = NULL;
  1371		struct rds_connection *conn = NULL;
  1372		char *reason = NULL;
  1373		int ret = 0;
  1374		int queued = 0;
  1375		int nonblock = msg->msg_flags & MSG_DONTWAIT;
  1376		long timeo = sock_sndtimeo(sk, nonblock);
  1377		size_t total_payload_len = payload_len, rdma_payload_len = 0;
  1378		struct rds_conn_path *cpath = NULL;
  1379		struct rs_buf_info *bufi;
> 1380		struct rds_net *rns;
  1381		struct in6_addr daddr;
  1382		__u32 scope_id = 0;
  1383		int namelen;
  1384		bool no_space;
  1385		unsigned long flags;
  1386		struct rds_iov_vector_arr iov_arr = {};
  1387		struct rds_iov_vector *iov;
  1388		int i;
  1389	
  1390		/* expect 1 RDMA CMSG per rds_sendmsg. can still grow if more needed. */
  1391		iov_arr.iva_incr = 1;
  1392	
  1393		/* Mirror Linux UDP mirror of BSD error message compatibility */
  1394		/* XXX: Perhaps MSG_MORE someday */
  1395		if (msg->msg_flags & ~(MSG_DONTWAIT | MSG_CMSG_COMPAT | MSG_NOSIGNAL)) {
  1396			pr_debug_ratelimited("%s: msg_flags 0x%08X\n", __func__, msg->msg_flags);
  1397			ret = -EOPNOTSUPP;
  1398			reason = "invalid msg_flags";
  1399			goto out;
  1400		}
  1401		namelen = msg->msg_namelen;
  1402		if (namelen != 0) {
  1403			if (namelen < sizeof(*usin)) {
  1404				reason = "invalid IPv4 namelen";
  1405				ret = -EINVAL;
  1406				goto out;
  1407			}
  1408			switch (usin->sin_family) {
  1409			case AF_INET:
  1410				if (usin->sin_addr.s_addr == htonl(INADDR_ANY) ||
  1411				    usin->sin_addr.s_addr == htonl(INADDR_BROADCAST) ||
  1412				    IN_MULTICAST(ntohl(usin->sin_addr.s_addr))) {
  1413					reason = "invalid IPv4 addr";
  1414					ret = -EINVAL;
  1415					goto out;
  1416				}
  1417				ipv6_addr_set_v4mapped(usin->sin_addr.s_addr, &daddr);
  1418				dport = usin->sin_port;
  1419				break;
  1420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
