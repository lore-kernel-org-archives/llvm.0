Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793539033;
	b=PXSV6i18Ch8NHcRFy2nZsYKcWlluHDtJsgp0eEjTkJpNrpCzbZLn8MKQqDW0yAMijEic
	 HgLE1vSwUL9jU82/MAKxV0LJ+joaepSkrNXzeaLzjSOsYMZsCqUVrSmNT1sIwIPRoIPz8
	 G7Pqy+JIdlJ9t3nIN8F5VIZkAkNQ42AMBwawwVYILfsQGESsB9Nd8P7m/AKt1yrN0QTnx
	 ygOvtpbS2clO+Q+PCGgpN6b/7391td/RDo2OJvCcJMsXtJ7+I0MShnnheEzmiL6LYcIes
	 zWjURV4GCuqSGSRcZtk88kNhnsLOPQMNXBWT50jt5pSnstin9fWo/ChN5tps8hesmYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793539033;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=w4bq/0g8RhsZpG5ZMgi9uMz4OgpyNoh3lwfQvLSG4kA=;
	b=HaqqLZbtqZZKQcggclsIbUcQ+1iEowEavYMj03McpKbbNGG7N+zPK8hifN7nt1NEcQxB
	 fKgh8axXtnvtKbfOWYEeF1U7q+SloTqMH3koE5Mkshk+ro6bT3xN83MDpWEXH/aOjwCee
	 sLCgKrvHJe7t7WCz+S9ZfgWQr/Tp3aqNJbXBkR48SwPJP9cnBX6SJbzXF6z/nCAesrCAF
	 Dq2GZR4RE87mbtna69MzzWxY95yy46UQeWyZyuNSEY0p9AF98gLWSJmGzGxBtp6bx4k+P
	 U3iiMQDpW35ouIRgS7vRkmxRS9NcLS8GO9HKlxgSxt37Oljt/dyYHcWd/7MHcz78nYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FXnku0FF;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA97606A325;
	Sun,  1 Nov 2026 13:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA97606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FXnku0FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793539032; x=1825075032;
  h=date:from:to:cc:subject:message-id;
  bh=JAbPOH2A8VFIzFQrMfM3PNOHGoeHF4IVMnIPcL5oetg=;
  b=FXnku0FFjBqV0zlVz8cexOkmChr6DXW9l9bV6BKgLy5fMjo76HGTgCLq
   XjrLqXvqMPZarXNlT3P8CahAsRUdQsKCk3PyccTJHNipobDcFPCNApC6c
   Qztp/yfwoMu/VgyRcQFNjBwcnZj+ShFxp1cVpqslSNCJJjJlvH4kz2PSp
   0zglI+OmWNbvBhjg57gdWWmjPOyuwjfX4uqqVYP+OCzTRGOFL7ikwk4Kh
   MEBuiRpByVVXMymky0GI7x5CIclNeP9totY8W/XwGnYJPpSgS/0T2zZzV
   455G4WmBxs2SaPI0OOkcLmA7BsIjUISKmlPm/ZIJitCsit7c3N+7WkLra
   g==;
X-CSE-ConnectionGUID: vrK7XTi1RZWt+bVKYceRzw==
X-CSE-MsgGUID: PR6YXv6mQouXLRiiAyRRlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2152764"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2152764"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 05:17:11 -0800
X-CSE-ConnectionGUID: aLojhxKPShK+3iypFH1W9g==
X-CSE-MsgGUID: SJQhPmI3QuuiQN50erUsIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6268820"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Nov 2026 05:17:10 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNVQq-000000006i3-0PDb;
	Sun, 01 Nov 2026 13:17:08 +0000
Date: Sun, 01 Nov 2026 14:17:03 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.procfs.cleanup 22/115]
 net/l2tp/l2tp_ppp.c:1602:28: warning: unused variable 'pd'
Message-ID: <202611011406.rTUd4cX8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/brauner/linux.git work.procfs.cleanup
head:   149defb030fc6398856817bad7186556426e0845
commit: 16905bac11a0bd08362a07a222b1650db0bff1ec [22/115] l2tp: let procfs own the seq_file of /proc/net/pppol2tp
config: s390-randconfig-2001-20261101 (https://download.01.org/0day-ci/archive/20261101/202611011406.rTUd4cX8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611011406.rTUd4cX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611011406.rTUd4cX8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/l2tp/l2tp_ppp.c:1602:28: warning: unused variable 'pd' [-Wunused-variable]
    1602 |         struct pppol2tp_seq_data *pd = ((struct seq_file *)file->private_data)->private;
         |                                   ^~
   1 warning generated.


vim +/pd +1602 net/l2tp/l2tp_ppp.c

  1598	
  1599	/* procfs opened the seq_file and allocated @pd */
  1600	static int pppol2tp_proc_open(struct inode *inode, struct file *file)
  1601	{
> 1602		struct pppol2tp_seq_data *pd = ((struct seq_file *)file->private_data)->private;
  1603		struct net *net;
  1604	
  1605		net = maybe_get_net(pde_data(inode));
  1606		if (!net)
  1607			return -ENXIO;
  1608	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
