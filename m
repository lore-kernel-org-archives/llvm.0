Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4A842056;
	Sat, 22 Mar 2025 05:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742620654; cv=none; b=cfQVD7KjxUzjBIyrwXdAMM0/t3d8AWiakOB8WJzX0NjaPlC2FQujbW168Cq5WIdAbVCD7+eJzym68XSnoUDykYI6HRt9h5cZv8h7Zox57o570wA+/7OHWIUrkfk/qj1LUpOqjM6M3kOaJB7i8ZUjvwfXi0uKl/uvLxilq17ZbJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742620654; c=relaxed/simple;
	bh=3TYckuJ4787RdHJB4OSef4hkPy8y64J1Y3sxipV9fEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E0Mgaw/XB01hPTcpylJl/2nZ6Hahea8WnoavR9KX6adpRB8sMEkqp1Mpjo2NuSeRoE/6Ur9ljweZQScY1PBeC/Xjb/5SoYYXuLcwIN/cxJ1QhNxVYspqWt2ToC0mHeVIreaNVk+FSXz8+6nuVYFc0QcHjI7JCJ9FAraoYYmQ13U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6u2ayGG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6u2ayGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742620652; x=1774156652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3TYckuJ4787RdHJB4OSef4hkPy8y64J1Y3sxipV9fEM=;
  b=d6u2ayGGS7+iF3poQBgqkYGMKaDEnfMn6rBIUVp3rISKHWdaYmp1vf5+
   Hyj5SdMoOyvOeuvaSkFs/LH7A4yqUGsZI97Tsk8ulAjppFGVQh/JYohph
   stRkeVDXmLG6wrLKOl8JGj9Apd6CCTdTMDzxJKeo2fnQ9rnNmWleC40DI
   /p3SBgRPcdeCLsJsQqmbgWTB0kL9WhgoPMMKjKzo1uXphSFATl6CpXJQI
   vseXa8wrve+7ancuY4tTVFEDur3X6m/aC5M+QHFCtViDa4KMhjT8Mfeni
   hm9Ypetr4hoHvXAr81xZiHB6QG8QmMFA8se/2Wl1mGZdoIdEDfMcxhZDs
   Q==;
X-CSE-ConnectionGUID: KKstKLuXTAmlvq9eWj3K+w==
X-CSE-MsgGUID: up74u+9DSyySfazCTPw98Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43128374"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="43128374"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 22:17:30 -0700
X-CSE-ConnectionGUID: tc+uiMKtQpie4XvB5vZ8Mg==
X-CSE-MsgGUID: C9/N2BkYT6WdkGz9Gih78A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="123595232"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Mar 2025 22:17:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvrEd-0001wz-0c;
	Sat, 22 Mar 2025 05:17:27 +0000
Date: Sat, 22 Mar 2025 13:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfs-netdown 6/6] net/sunrpc/clnt.c:2074:18: error: must use
 'struct' tag to refer to type 'rpc_task'
Message-ID: <202503221309.FHvt4qRk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfs-netdown
head:   80864ce87d5678a278000ff4f0714dfc66f18ef9
commit: 80864ce87d5678a278000ff4f0714dfc66f18ef9 [6/6] sunrpc: shutdown the rpc_clnt on fatal ENETUNREACH
config: riscv-randconfig-002-20250322 (https://download.01.org/0day-ci/archive/20250322/202503221309.FHvt4qRk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503221309.FHvt4qRk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221309.FHvt4qRk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/sunrpc/clnt.c:2074:18: error: must use 'struct' tag to refer to type 'rpc_task'
    2074 | netunreach_fatal(rpc_task *task)
         |                  ^
         |                  struct 
>> net/sunrpc/clnt.c:2134:7: error: call to undeclared function 'netunreach_fatak'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2134 |                 if (netunreach_fatak(task))
         |                     ^
   net/sunrpc/clnt.c:2134:7: note: did you mean 'netunreach_fatal'?
   net/sunrpc/clnt.c:2074:1: note: 'netunreach_fatal' declared here
    2074 | netunreach_fatal(rpc_task *task)
         | ^
   net/sunrpc/clnt.c:2226:7: error: call to undeclared function 'netunreach_fatak'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2226 |                 if (netunreach_fatak(task))
         |                     ^
   net/sunrpc/clnt.c:2493:7: error: call to undeclared function 'netunreach_fatak'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2493 |                 if (netunreach_fatak(task))
         |                     ^
   4 errors generated.


vim +2074 net/sunrpc/clnt.c

  2072	
  2073	static bool
> 2074	netunreach_fatal(rpc_task *task)
  2075	{
  2076		if (task->tk_flags & RPC_TASK_NETUNREACH_FATAL) {
  2077			rpc_clnt_shutdown(task->tk_client);
  2078			return true;
  2079		}
  2080		return false;
  2081	}
  2082	
  2083	/*
  2084	 * 4a.	Sort out bind result
  2085	 */
  2086	static void
  2087	call_bind_status(struct rpc_task *task)
  2088	{
  2089		struct rpc_xprt *xprt = task->tk_rqstp->rq_xprt;
  2090		int status = -EIO;
  2091	
  2092		if (rpc_task_transmitted(task)) {
  2093			rpc_task_handle_transmitted(task);
  2094			return;
  2095		}
  2096	
  2097		if (task->tk_status >= 0)
  2098			goto out_next;
  2099		if (xprt_bound(xprt)) {
  2100			task->tk_status = 0;
  2101			goto out_next;
  2102		}
  2103	
  2104		switch (task->tk_status) {
  2105		case -ENOMEM:
  2106			rpc_delay(task, HZ >> 2);
  2107			goto retry_timeout;
  2108		case -EACCES:
  2109			trace_rpcb_prog_unavail_err(task);
  2110			/* fail immediately if this is an RPC ping */
  2111			if (task->tk_msg.rpc_proc->p_proc == 0) {
  2112				status = -EOPNOTSUPP;
  2113				break;
  2114			}
  2115			rpc_delay(task, 3*HZ);
  2116			goto retry_timeout;
  2117		case -ENOBUFS:
  2118			rpc_delay(task, HZ >> 2);
  2119			goto retry_timeout;
  2120		case -EAGAIN:
  2121			goto retry_timeout;
  2122		case -ETIMEDOUT:
  2123			trace_rpcb_timeout_err(task);
  2124			goto retry_timeout;
  2125		case -EPFNOSUPPORT:
  2126			/* server doesn't support any rpcbind version we know of */
  2127			trace_rpcb_bind_version_err(task);
  2128			break;
  2129		case -EPROTONOSUPPORT:
  2130			trace_rpcb_bind_version_err(task);
  2131			goto retry_timeout;
  2132		case -ENETDOWN:
  2133		case -ENETUNREACH:
> 2134			if (netunreach_fatak(task))
  2135				break;
  2136			fallthrough;
  2137		case -ECONNREFUSED:		/* connection problems */
  2138		case -ECONNRESET:
  2139		case -ECONNABORTED:
  2140		case -ENOTCONN:
  2141		case -EHOSTDOWN:
  2142		case -EHOSTUNREACH:
  2143		case -EPIPE:
  2144			trace_rpcb_unreachable_err(task);
  2145			if (!RPC_IS_SOFTCONN(task)) {
  2146				rpc_delay(task, 5*HZ);
  2147				goto retry_timeout;
  2148			}
  2149			status = task->tk_status;
  2150			break;
  2151		default:
  2152			trace_rpcb_unrecognized_err(task);
  2153		}
  2154	
  2155		rpc_call_rpcerror(task, status);
  2156		return;
  2157	out_next:
  2158		task->tk_action = call_connect;
  2159		return;
  2160	retry_timeout:
  2161		task->tk_status = 0;
  2162		task->tk_action = call_bind;
  2163		rpc_check_timeout(task);
  2164	}
  2165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
