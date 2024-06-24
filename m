Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75672142654;
	Mon, 24 Jun 2024 16:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246619; cv=none; b=GA5Hjuba/Lg39U6qEHMQN2/atLF5uV99Nfu9Fw9M4GpZL5ualo2oAKxkpiqND2Y4/POyzUkkTex/WNy3A/7AdfA0UKPxGu4a8s1jxAKrON6J8X+yRGX6MY7/k2UhdxngJQ5dGJlIABzkxdO8/mx0ZVcAGidzPUX/qvidWijGCB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246619; c=relaxed/simple;
	bh=9Q091ES8lDXoqB+nU8Yao/3Rk0vbky2NVGED6AkiR3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CeOHtFjzU252hyM6DZqx4c1kkI9lKylRm1UAiCQlDnED/KDNlfg3XGRT2JtrfqjCFdS9MCiMxOJCeck2EjIuuYIqMrSMX8tISShO0RIJM5ZlIIp4LLU3AMk80tL3BQrIdum2tW3NwrHXP/Hw7BdLsWsv4EvgIUpJag+xGnB5ywU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zvo2fwpi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zvo2fwpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719246617; x=1750782617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Q091ES8lDXoqB+nU8Yao/3Rk0vbky2NVGED6AkiR3Q=;
  b=Zvo2fwpigJGiX2hZ2JoETIKtnB0qEiLnZBvm/MdbsqgVTClIUHbsByjg
   oXjLdl+eSA5icAwIANhY7xMufLOoQGXf9kpiAeoMpmU/vUMFvBufuzm23
   ixwgGhk8lh1HoABReDDl4P09+A6Ovr/dDybVObo994mjp0YFogXc2Ytz+
   UE+0jhfyXZCTBm3we+k2r7lMlCj8JWyOeghiDFQbm8ukbF2n7OE+eQt1h
   g2WKPvD4prNLBSy84PLBBB50L1VwoFpTdxdQTpY4zAWK5Q3EpYR3BrQbE
   Omgn0EDDLrtFzhrdL7O3t0jK798I79Cn3wsSMEMiIcrnwg1yh+VIxEV2n
   w==;
X-CSE-ConnectionGUID: DDKw+a2RRIywF7EBm4mpAg==
X-CSE-MsgGUID: 0MaR8iK5QU+Ww0pCXgM5ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16359303"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="16359303"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 09:30:17 -0700
X-CSE-ConnectionGUID: gLkEFMboSH2VrD64V9Oahw==
X-CSE-MsgGUID: Vzy7GEa+Q7+6/5tw21IolQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="74113118"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jun 2024 09:30:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLma5-000DWn-1w;
	Mon, 24 Jun 2024 16:30:13 +0000
Date: Tue, 25 Jun 2024 00:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 16/16] fs/netfs/main.c:70:6: warning:
 format specifies type 'int' but the argument has type 'long'
Message-ID: <202406250022.6NZKarFI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   4058083df1dc58322ad2ec98bcd218a43c8befac
commit: 4058083df1dc58322ad2ec98bcd218a43c8befac [16/16] netfs: Speed up buffered reading
config: i386-randconfig-006-20240624 (https://download.01.org/0day-ci/archive/20240625/202406250022.6NZKarFI-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406250022.6NZKarFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406250022.6NZKarFI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/main.c:70:6: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
      65 |                    "%08x %s %3d %2lx %4d @%04llx %llx/%llx",
         |                                      ~~~
         |                                      %4ld
      66 |                    rreq->debug_id,
      67 |                    netfs_origins[rreq->origin],
      68 |                    refcount_read(&rreq->ref),
      69 |                    rreq->flags,
      70 |                    rreq->error,
         |                    ^~~~~~~~~~~
   1 warning generated.


vim +70 fs/netfs/main.c

87b57a048964ab David Howells 2022-03-04  47  
87b57a048964ab David Howells 2022-03-04  48  /*
87b57a048964ab David Howells 2022-03-04  49   * Generate a list of I/O requests in /proc/fs/netfs/requests
87b57a048964ab David Howells 2022-03-04  50   */
87b57a048964ab David Howells 2022-03-04  51  static int netfs_requests_seq_show(struct seq_file *m, void *v)
87b57a048964ab David Howells 2022-03-04  52  {
87b57a048964ab David Howells 2022-03-04  53  	struct netfs_io_request *rreq;
87b57a048964ab David Howells 2022-03-04  54  
87b57a048964ab David Howells 2022-03-04  55  	if (v == &netfs_io_requests) {
87b57a048964ab David Howells 2022-03-04  56  		seq_puts(m,
4058083df1dc58 David Howells 2024-06-19  57  			 "REQUEST  OR REF FL ERR  COVERAGE\n"
4058083df1dc58 David Howells 2024-06-19  58  			 "======== == === == ==== =========\n"
87b57a048964ab David Howells 2022-03-04  59  			 );
87b57a048964ab David Howells 2022-03-04  60  		return 0;
87b57a048964ab David Howells 2022-03-04  61  	}
87b57a048964ab David Howells 2022-03-04  62  
87b57a048964ab David Howells 2022-03-04  63  	rreq = list_entry(v, struct netfs_io_request, proc_link);
87b57a048964ab David Howells 2022-03-04  64  	seq_printf(m,
4058083df1dc58 David Howells 2024-06-19  65  		   "%08x %s %3d %2lx %4d @%04llx %llx/%llx",
87b57a048964ab David Howells 2022-03-04  66  		   rreq->debug_id,
87b57a048964ab David Howells 2022-03-04  67  		   netfs_origins[rreq->origin],
87b57a048964ab David Howells 2022-03-04  68  		   refcount_read(&rreq->ref),
87b57a048964ab David Howells 2022-03-04  69  		   rreq->flags,
87b57a048964ab David Howells 2022-03-04 @70  		   rreq->error,
87b57a048964ab David Howells 2022-03-04  71  		   rreq->start, rreq->submitted, rreq->len);
87b57a048964ab David Howells 2022-03-04  72  	seq_putc(m, '\n');
87b57a048964ab David Howells 2022-03-04  73  	return 0;
87b57a048964ab David Howells 2022-03-04  74  }
87b57a048964ab David Howells 2022-03-04  75  

:::::: The code at line 70 was first introduced by commit
:::::: 87b57a048964abfd5f3d8b79bc55687327f5a380 netfs: Add a procfile to list in-progress requests

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
