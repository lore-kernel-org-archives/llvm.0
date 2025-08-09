Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5078A1E515;
	Sat,  9 Aug 2025 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754745559; cv=none; b=b1Xr4vPARHj3JD2s3sDNRaeuhtscaJtovf88+00yYptyQXvb1LyBDR+3oCtQlMMETN+Fx+lXVlIMt52oUxP4iCo7TZQwACip7U1upEqTNV/MqO0bNUaeJNluMmkZaV4mBtNec9t+ux0TqfauBZtc3DBbCYS84K2taLjEniI5yW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754745559; c=relaxed/simple;
	bh=4B5nGTPAznunDiWUNnWix4ij3vQf62R87tkwTKSnzNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LfM3ZWy8pEg9O0JBgbMR8HD59zWTFmCAWF29JHNnv8kaJQVy+bycWLpGEzLH9FoSW23lKQMbkIBUWsJ2QQU3VjSawDjxXFud8BBwVnENircgRxeSWuq2rFyNoWr+n499KWqt7oB5TnFR6KYmyJe9FMPufOF5pXIhSTBrz3lFzto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GaQDZ0mN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaQDZ0mN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754745558; x=1786281558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4B5nGTPAznunDiWUNnWix4ij3vQf62R87tkwTKSnzNc=;
  b=GaQDZ0mNLs4kItLZlDUXdRh3HKBpIhdY46zbXQr5vFuRJYPYz3wzpjDG
   FnZXpoy2GgbUMNrglPx8G47mfmjo/ZV4BtebY4QfKS5QPR7UxYX0y7vv1
   KPdZFLhFjTUPQgk7M4d78hJFtVFmJ8cW8+GQj/sFmEy1ZhLB8O0cembNK
   dLHUnhJZbdcegIcJDKfn6qqmlke1RYonwziY254x6/qQQDsWmxPsremv5
   nD01ALzwP56RKNK1IXKlIz+sGedI7GBZwNBPQ3l+R/cEx410sw63AT29T
   qDjluJfPjma+ap+AemjD60MjlTC8CcvFnIBb/QoUF0Vf4OrHtgvqeMUyq
   Q==;
X-CSE-ConnectionGUID: 6Sm8sXfOTYCX7d1FMAdpPA==
X-CSE-MsgGUID: C/9Wi2KCS2OJLdFijEOPHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="44658630"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="44658630"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 06:19:18 -0700
X-CSE-ConnectionGUID: yb/og07VT2Knr3797a1l5A==
X-CSE-MsgGUID: OdFIsa66R4yzECNY21TNtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165187444"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 09 Aug 2025 06:19:16 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukjTe-0002od-0z;
	Sat, 09 Aug 2025 13:19:14 +0000
Date: Sat, 9 Aug 2025 15:18:47 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 43/47] net/sunrpc/svcsock.c:1294:11: warning:
 format specifies type 'int' but the argument has type 'unsigned long'
Message-ID: <202508091526.CVVPmLwu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   78cea35b7fffda7d71482e5881bcd3e4a30b0acb
commit: 562305ff2066e7dd88d087577f23fab6b6a76b2d [43/47] sunrpc: fix pr_notice in svc_tcp_sendto() to show correct length
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250809/202508091526.CVVPmLwu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091526.CVVPmLwu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508091526.CVVPmLwu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/sunrpc/svcsock.c:1294:11: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
    1291 |         pr_notice("rpc-srv/tcp: %s: %s %d when sending %d bytes - shutting down socket\n",
         |                                                        ~~
         |                                                        %lu
    1292 |                   xprt->xpt_server->sv_name,
    1293 |                   (sent < 0) ? "got error" : "sent",
    1294 |                   sent, xdr->len + sizeof(marker));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:577:36: note: expanded from macro 'pr_notice'
     577 |         printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
         |                                   ~~~     ^~~~~~~~~~~
   include/linux/printk.h:514:60: note: expanded from macro 'printk'
     514 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:486:19: note: expanded from macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1294 net/sunrpc/svcsock.c

  1255	
  1256	/**
  1257	 * svc_tcp_sendto - Send out a reply on a TCP socket
  1258	 * @rqstp: completed svc_rqst
  1259	 *
  1260	 * xpt_mutex ensures @rqstp's whole message is written to the socket
  1261	 * without interruption.
  1262	 *
  1263	 * Returns the number of bytes sent, or a negative errno.
  1264	 */
  1265	static int svc_tcp_sendto(struct svc_rqst *rqstp)
  1266	{
  1267		struct svc_xprt *xprt = rqstp->rq_xprt;
  1268		struct svc_sock	*svsk = container_of(xprt, struct svc_sock, sk_xprt);
  1269		struct xdr_buf *xdr = &rqstp->rq_res;
  1270		rpc_fraghdr marker = cpu_to_be32(RPC_LAST_STREAM_FRAGMENT |
  1271						 (u32)xdr->len);
  1272		int sent;
  1273	
  1274		svc_tcp_release_ctxt(xprt, rqstp->rq_xprt_ctxt);
  1275		rqstp->rq_xprt_ctxt = NULL;
  1276	
  1277		mutex_lock(&xprt->xpt_mutex);
  1278		if (svc_xprt_is_dead(xprt))
  1279			goto out_notconn;
  1280		sent = svc_tcp_sendmsg(svsk, rqstp, marker);
  1281		trace_svcsock_tcp_send(xprt, sent);
  1282		if (sent < 0 || sent != (xdr->len + sizeof(marker)))
  1283			goto out_close;
  1284		mutex_unlock(&xprt->xpt_mutex);
  1285		return sent;
  1286	
  1287	out_notconn:
  1288		mutex_unlock(&xprt->xpt_mutex);
  1289		return -ENOTCONN;
  1290	out_close:
  1291		pr_notice("rpc-srv/tcp: %s: %s %d when sending %d bytes - shutting down socket\n",
  1292			  xprt->xpt_server->sv_name,
  1293			  (sent < 0) ? "got error" : "sent",
> 1294			  sent, xdr->len + sizeof(marker));
  1295		svc_xprt_deferred_close(xprt);
  1296		mutex_unlock(&xprt->xpt_mutex);
  1297		return -EAGAIN;
  1298	}
  1299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
