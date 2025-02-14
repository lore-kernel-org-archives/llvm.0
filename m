Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A31614F9FD;
	Fri, 14 Feb 2025 03:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739505016; cv=none; b=fhHQkdAkHPD2GV5oUTT/n3fs//s4VuaVDrqAvtuLjcFJBOZtOO/grUUDnnuswDjaCNpuZP6jpokFcMc0rZfjlc0Yq+O1nB0JT7juwHeH7qgNAZ4pk3Nd4KKFws3BoTCoZIg2Gh2c/WENbiTq1uLBE12bb2O5N4noV6hBVDvabOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739505016; c=relaxed/simple;
	bh=3XTEKliFR+4zrN0fBUhbCSFNlDQXtB8bXQDB7lH3rFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pno2vIstN70YtJGGXOSXUP1/phchutdf/kYAimsUVNyt3DvwhrMk2VK6KvovZRMHBb/7EU8uGzOJ0l3ITYVn5Y3s2S1h721lLPj7lhWadSgnGOhUVTHJu28noTIBN+bHLE5wnIwE0+INEq5eKgo24NFn3N0ZtdJc73XWmvGp03U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFIUPRfR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFIUPRfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739505015; x=1771041015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3XTEKliFR+4zrN0fBUhbCSFNlDQXtB8bXQDB7lH3rFQ=;
  b=LFIUPRfRlSCsxWjmhpNca4eeGQK+gtVsgm5rv9KSLqUVY0fMMm+t3IPC
   rPbU6bQRBtaz3A9XMjsCndxSQQ/lebsiqcWmnwWWcV9Rq1+PSST4IDLMO
   4ROTJTF5A3OhEkmJEwoih/LuV0+1GEO0xRuzRNQW6J025mrrVGScQ+BuD
   KUu5oqDvf6HIINO7Ls2Va18/y1J+FGEtxxB0XVGRQzv1I7zA8ahPloXWn
   VoO7zN3i3syWaW+HGx4zBHf8Lnxb6U4qMltBxMh+SR1ZRWE3Gn3+fN3lw
   LKGyPTU/aUxsDfXigZyxGH3i91vyfYlctf5D26xPF0fHTekJax07cBQoh
   g==;
X-CSE-ConnectionGUID: O+wcp/Y7QiOgOMio0qDH4Q==
X-CSE-MsgGUID: ORVGLJUWTkGk4C6Eaq5PKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40356765"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40356765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 19:50:11 -0800
X-CSE-ConnectionGUID: pKecGMrNTqKZ9FlHyspfhw==
X-CSE-MsgGUID: 74B/dOB8SbCkh2COP1zZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="113865567"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2025 19:50:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1timiN-001928-0z;
	Fri, 14 Feb 2025 03:50:07 +0000
Date: Fri, 14 Feb 2025 11:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl/fwctl 20/25] ./usr/include/fwctl/cxl.h:33:36: error:
 field has incomplete type 'struct cxl_mbox_get_sup_feats_in'
Message-ID: <202502141147.zSebquWh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   368060188b78ad57197303bbffb78081837a7481
commit: 43f78e702825a9d67bd762d83e72d7eec9b7f34e [20/25] cxl: Add support for fwctl RPC command to enable CXL feature commands
config: x86_64-buildonly-randconfig-001-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141147.zSebquWh-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141147.zSebquWh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141147.zSebquWh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/fwctl/cxl.h:33:36: error: field has incomplete type 'struct cxl_mbox_get_sup_feats_in'
      33 |                 struct cxl_mbox_get_sup_feats_in get_sup_feats_in;
         |                                                  ^
   ./usr/include/fwctl/cxl.h:13:8: note: forward declaration of 'struct cxl_mbox_get_sup_feats_in'
      13 | struct cxl_mbox_get_sup_feats_in;
         |        ^
>> ./usr/include/fwctl/cxl.h:50:37: error: field has incomplete type 'struct cxl_mbox_get_sup_feats_out'
      50 |                 struct cxl_mbox_get_sup_feats_out get_feats_out;
         |                                                   ^
   ./usr/include/fwctl/cxl.h:14:8: note: forward declaration of 'struct cxl_mbox_get_sup_feats_out'
      14 | struct cxl_mbox_get_sup_feats_out;
         |        ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
