Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019991E32D4;
	Fri, 31 Jan 2025 17:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343984; cv=none; b=FY0zkGbJkUx6/DC8jzngv92hMEBXO9ttxEFVkvglOcD0T8HXxOlddCMUlz2qf5sHr2qVUU2vMd4SQu/PWGWSNTl/LCIUYo30yof0hHA8mx+KbkUrSdBTvRrdwkcU90z7JU5qr8BmJGfqUFBbZ0B0zqRU+zMzcfOfRUBMsKuZDiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343984; c=relaxed/simple;
	bh=bTxJ/hkDe9l3sGEa65vE9L2nrb7fzHS23TeTnTo+xcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eopZ95cupGV4Chj6/5R2vE9WoHUWFGoZNF14t3SlR7ggZl/NaiqwvKvuHQrF60qPYQXqWEmOTXjyKCNCRIPwJCPqByQcLCL8+R9rvwRjDh3zEvvGqRuGGK/r3bZGEnu/1pelX4n9JWNz1hTSR21j5l3avCsNC4620dZ5PxMolYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXi/Xd8i; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXi/Xd8i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738343984; x=1769879984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bTxJ/hkDe9l3sGEa65vE9L2nrb7fzHS23TeTnTo+xcI=;
  b=FXi/Xd8izDZdaDFYMy9Tao3MF3NfTSdQ1AaFLqq+qX8GpSntafJP1EkB
   HXi/17G+jxqbroRNqdzrDijIwYiKQfOAKqDDIIlkAUAlIJwjWCwN7KEH7
   FMRZ+sUQthnu3sTXWWQiEAwRAJwaYGT4V5x9YjrFX650ingC08wKm+tMa
   w7K4obr/NwNn5MSgBTKuB4hR2m7XjJBQmFb6wJJ2B6jOi0GMV9CHrSjk1
   lUwMs/PLlT66s9kzPzQDCqwcyg0/7kGLFrfSkmv3igAI3AJGGkhG4/xUf
   g1yoKuDp59PfkJy+XgtAoO3kQx3FtY/Ck4wD3356QpM7ExwkR2eEhnSKU
   g==;
X-CSE-ConnectionGUID: ExKWgCC5St6vcFTEOht77Q==
X-CSE-MsgGUID: 08snfpS8S32RU+ALq+9rJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38801744"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="38801744"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 09:19:42 -0800
X-CSE-ConnectionGUID: QPAgwm85SBSu+qMkWXRVng==
X-CSE-MsgGUID: 7INzjV++SAy7/g3IYq2+ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="109581251"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Jan 2025 09:19:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdug5-000meZ-0o;
	Fri, 31 Jan 2025 17:19:37 +0000
Date: Sat, 1 Feb 2025 01:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 23/33] net/rxrpc/output.c:918:6: warning:
 variable 'serial' is used uninitialized whenever 'if' condition is true
Message-ID: <202502010148.H1FR0nxe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   3108d67c535aa3ea00a95b1daf8efdc15bb074b4
commit: 097df55e65b4cf8449dd5ae95fb43e55220e0c8d [23/33] rxrpc: Pass CHALLENGE packets to the call for recvmsg() to respond to
config: x86_64-buildonly-randconfig-005-20250131 (https://download.01.org/0day-ci/archive/20250201/202502010148.H1FR0nxe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010148.H1FR0nxe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010148.H1FR0nxe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/rxrpc/output.c:918:6: warning: variable 'serial' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     918 |         if (ret < 0)
         |             ^~~~~~~
   net/rxrpc/output.c:951:38: note: uninitialized use occurs here
     951 |         trace_rxrpc_tx_fail(conn->debug_id, serial, ret,
         |                                             ^~~~~~
   net/rxrpc/output.c:918:2: note: remove the 'if' if its condition is always false
     918 |         if (ret < 0)
         |         ^~~~~~~~~~~~
     919 |                 goto fail;
         |                 ~~~~~~~~~
   net/rxrpc/output.c:911:12: note: initialize the variable 'serial' to silence this warning
     911 |         u32 serial;
         |                   ^
         |                    = 0
   1 warning generated.


vim +918 net/rxrpc/output.c

   899	
   900	/*
   901	 * Send a RESPONSE message.
   902	 */
   903	void rxrpc_send_response(struct rxrpc_connection *conn, struct sk_buff *response)
   904	{
   905		struct rxrpc_skb_priv *sp = rxrpc_skb(response);
   906		struct scatterlist sg[16];
   907		struct bio_vec bvec[16];
   908		struct msghdr msg;
   909		size_t len = sp->resp.len;
   910		__be32 wserial;
   911		u32 serial;
   912		int ret, nr_sg;
   913	
   914		_enter("C=%x,%x", conn->debug_id, sp->resp.challenge_serial);
   915	
   916		sg_init_table(sg, ARRAY_SIZE(sg));
   917		ret = skb_to_sgvec(response, sg, 0, len);
 > 918		if (ret < 0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
