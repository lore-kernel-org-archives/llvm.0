Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FB41870;
	Mon, 16 Sep 2024 01:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726450446; cv=none; b=OVwcyCX0PvHEC9JLihhYsGZIportxXiKk5F220KHwqq5t2H0VMCh3+MXjw2MV8zuiuQJXoRiOYUnzME8sVgfQaQnvgFWluqsil+SfGSS1KgyZkyodlv3z1fqTseCwizrVG3rRFEDIcX31nJ7GUfREclhlgcq5rn9N1FK5ye42dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726450446; c=relaxed/simple;
	bh=NGew8tPtliLDcb1nxUn0FA/x0XgEtZ4hb3wWr3OnPaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WIE/v1MurItzm3475KkW40QtWEj4Ve/ra3JwW//8QUltlOInqXeAvP5Sapmf7Nhj53ryOxrrBuyzgoMbaYRwUz6K+d1sk9IuJNxWW5Wt3LP4hilsrg/BENMUoSQ7pH7Yn/wqSR0J+WHfozH71fyp+u1o5OM7kUpXWu/F4jv0/H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnqOL9qY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnqOL9qY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726450445; x=1757986445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGew8tPtliLDcb1nxUn0FA/x0XgEtZ4hb3wWr3OnPaM=;
  b=cnqOL9qYhdbbrH4RsFhFQX75Y9/Ekf0cQtEG/W5EuUal/Mfaa/sRMnDr
   2PCsxtH1mzjxQWIXxp3xXcR2wl9yRfv/tgCoEhPVFJcIFFk6PWEWqXxkz
   6STsik4p5Oq93v3wv8+9yrTqqnIY8kUlX6ZjlvwK0OCHC/pmIQe1I1udt
   iAmm24jGzaR/ZdnIWjoyMC68ctbsvSOnfKM3D+iadPQZ/fhHhToEjsauD
   KsZcA0hu4qYP+QgcOOEybfJETDSwQjoOweC3paWHx9XX+gNPJZUUo7LvX
   hUdvakRldKndzp696lOWxUw2eTFbnu+zvgZH8/BkE0DroUHLThZxH9Pqm
   g==;
X-CSE-ConnectionGUID: XKXnTb+QR9SNeaKoCZVeng==
X-CSE-MsgGUID: /4C1sCLmSb2GufKT9rHYew==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24761229"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="24761229"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 18:34:02 -0700
X-CSE-ConnectionGUID: Td1iq+pwTIiqiSLIRi8EdQ==
X-CSE-MsgGUID: VPzTvolRTUOPZ/40JdOlKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68977048"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2024 18:33:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq0bx-0009Db-1b;
	Mon, 16 Sep 2024 01:33:05 +0000
Date: Mon, 16 Sep 2024 09:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: Enzo Matsumiya <ematsumiya@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Steve French <stfrench@microsoft.com>
Subject: [linux-next:pending-fixes 950/1001]
 fs/smb/client/transport.c:437:10: error: call to undeclared function
 'smb_compress'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202409160930.sSepp6Xh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   75a1d6d160163b0db4b67065bb73a8239b118aa7
commit: f046d71e84e1e94cf23335129a27f5cfe3e8b75f [950/1001] smb: client: insert compression check/call on write requests
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240916/202409160930.sSepp6Xh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160930.sSepp6Xh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160930.sSepp6Xh-lkp@intel.com/

Note: the linux-next/pending-fixes HEAD 75a1d6d160163b0db4b67065bb73a8239b118aa7 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> fs/smb/client/transport.c:437:10: error: call to undeclared function 'smb_compress'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     437 |                 return smb_compress(server, &rqst[0], __smb_send_rqst);
         |                        ^
   1 error generated.
--
>> fs/smb/client/smb2pdu.c:5025:62: error: call to undeclared function 'should_compress'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5025 |         if (((flags & CIFS_TRANSFORM_REQ) != CIFS_TRANSFORM_REQ) && should_compress(tcon, &rqst))
         |                                                                     ^
   1 error generated.


vim +/smb_compress +437 fs/smb/client/transport.c

   426	
   427	static int
   428	smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
   429		      struct smb_rqst *rqst, int flags)
   430	{
   431		struct send_req_vars *vars;
   432		struct smb_rqst *cur_rqst;
   433		struct kvec *iov;
   434		int rc;
   435	
   436		if (flags & CIFS_COMPRESS_REQ)
 > 437			return smb_compress(server, &rqst[0], __smb_send_rqst);
   438	
   439		if (!(flags & CIFS_TRANSFORM_REQ))
   440			return __smb_send_rqst(server, num_rqst, rqst);
   441	
   442		if (WARN_ON_ONCE(num_rqst > MAX_COMPOUND - 1))
   443			return -EIO;
   444	
   445		if (!server->ops->init_transform_rq) {
   446			cifs_server_dbg(VFS, "Encryption requested but transform callback is missing\n");
   447			return -EIO;
   448		}
   449	
   450		vars = kzalloc(sizeof(*vars), GFP_NOFS);
   451		if (!vars)
   452			return -ENOMEM;
   453		cur_rqst = vars->rqst;
   454		iov = &vars->iov;
   455	
   456		iov->iov_base = &vars->tr_hdr;
   457		iov->iov_len = sizeof(vars->tr_hdr);
   458		cur_rqst[0].rq_iov = iov;
   459		cur_rqst[0].rq_nvec = 1;
   460	
   461		rc = server->ops->init_transform_rq(server, num_rqst + 1,
   462						    &cur_rqst[0], rqst);
   463		if (rc)
   464			goto out;
   465	
   466		rc = __smb_send_rqst(server, num_rqst + 1, &cur_rqst[0]);
   467		smb3_free_compound_rqst(num_rqst, &cur_rqst[1]);
   468	out:
   469		kfree(vars);
   470		return rc;
   471	}
   472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
