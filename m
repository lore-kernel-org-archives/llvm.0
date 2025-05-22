Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2EC3010C;
	Thu, 22 May 2025 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747921373; cv=none; b=QQkkFn+x07pOkpzJikV3EhrNVZxmnRojSsNk4VqQT4uRVWJWDhBP/l15IjzQAwIKirJ+Efg53iInwfkLSX92HrQcev/0voBlW/YahcMhL8xhud0jyh5iPa4UeAEgBBvuFtfhtdIuldkpPRLjOXBbDRy0mucCtiFv0Y3i88+/pEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747921373; c=relaxed/simple;
	bh=fNBi/1K/biEGCgGnPuC1MqSThVx5X24AubHC3I7UEO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BhNKpQnP7u2X879EIFemZqbpZwAHWyl0qncbW6/1NU8nQx/FeLpD9wgPABc3CErt5HKvlJB2PqsJmBfx/oyAcq78QUw49l5/V7XU7xvcgTfWDb4vgO51jjJr+TtDU6BKqtLsxkIECVggG2NptZ6teXIiX372VR7ozc+6hZ80qlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSoQq2x+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSoQq2x+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747921371; x=1779457371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fNBi/1K/biEGCgGnPuC1MqSThVx5X24AubHC3I7UEO8=;
  b=QSoQq2x+t88Dc+vBHSqNrVHrO7zqAEvN/j2+/7dZXwC+aZiTPyaVzpQy
   cstvBl0NLEIRbLL6UMwuI2w5DhaYLw/COQoN+PZ8gYB1TOL/G7mByuaaT
   f85t5P5vOmVgXizAqTlQOYBokCZeHgzAtTJvn+/c1lSs+6iaRRZ0DQhJC
   zLBB660vXs+J6AiLccyFhs4jwjxNTlbG08a0EI5n8Tqp60DX373B4uVU0
   YLYYaU0gY2IPySB2e3RXICmCbZZVJEgTvmohyh7bBuNgIKWnLEaKx/TEm
   iBl2b37txgyFIAPhpQfXI8ESeOiwcPc9kYGeBaA0sUMIS2I21sknUB3rX
   Q==;
X-CSE-ConnectionGUID: 6I68/NVoTuuuyRgrynp/gA==
X-CSE-MsgGUID: ZyefvP0nSTK5T2EB0ZvmTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50105497"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="50105497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 06:42:50 -0700
X-CSE-ConnectionGUID: qfuo922ESK+IuglyUxfgiQ==
X-CSE-MsgGUID: d6ESqaYGTjWnBjc80xPOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="145467000"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 May 2025 06:42:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI6C7-000POC-1n;
	Thu, 22 May 2025 13:42:47 +0000
Date: Thu, 22 May 2025 21:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 32/43] fs/nfsd/nfs4callback.c:900:23: warning:
 unused variable 'res'
Message-ID: <202505222120.oaQu7cme-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   0c6668479bba48114e5031d6fb3db53d80d8d6ad
commit: 118202ef11a34c160a4bb2a9bf78ddf8626b0ed3 [32/43] nfsd: add callback encoding and decoding linkages for CB_NOTIFY
config: i386-buildonly-randconfig-001-20250522 (https://download.01.org/0day-ci/archive/20250522/202505222120.oaQu7cme-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505222120.oaQu7cme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505222120.oaQu7cme-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4callback.c:900:23: warning: unused variable 'res' [-Wunused-variable]
     900 |         struct CB_NOTIFY4res res;
         |                              ^~~
   1 warning generated.


vim +/res +900 fs/nfsd/nfs4callback.c

   893	
   894	static int nfs4_xdr_dec_cb_notify(struct rpc_rqst *rqstp,
   895					  struct xdr_stream *xdr,
   896					  void *data)
   897	{
   898		struct nfsd4_callback *cb = data;
   899		struct nfs4_cb_compound_hdr hdr;
 > 900		struct CB_NOTIFY4res res;
   901		int status;
   902	
   903		status = decode_cb_compound4res(xdr, &hdr);
   904		if (unlikely(status))
   905			return status;
   906	
   907		status = decode_cb_sequence4res(xdr, cb);
   908		if (unlikely(status || cb->cb_seq_status))
   909			return status;
   910	
   911		return decode_cb_op_status(xdr, OP_CB_NOTIFY, &cb->cb_status);
   912	}
   913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
