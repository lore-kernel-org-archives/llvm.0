Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7F7201023;
	Fri,  6 Dec 2024 20:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733515278; cv=none; b=O2UHWw90wUmtT1xoLoGzG7tQZz4K6L+gXG/ftmTYEOyfb5Q+mgksvDMrXpr22aFzaB1x4aH+hfL1Y1aj1qSZ+XJMxP79PntYNBXIigfi5MGg2RDuw8T8T2dg+dAmgGlwu4GQqQaW46Br8zdSky0ZLbBaCBNhIjSQRyzZ2vQjZiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733515278; c=relaxed/simple;
	bh=PT8Zu+LQ/3FUAhxfk2myO0kHZ+qh01CerhSCfKXkmDU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLMkiDLkh1X+gymDen+eqS8UpK8pcaD1iJL+/gB1IvMTZIUk6OzAKUm0xUvqLaaVomj99iwUqu14KHhx+YFqQI4ehE9UoMPZ3sZeuaCeB/Mie+u9BsoDIOczeP8OG3d1my09o1gt3uypYuHTC+/1YSyIISjhyCnm4ZLvqZqthz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3fWCzZ1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3fWCzZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733515277; x=1765051277;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PT8Zu+LQ/3FUAhxfk2myO0kHZ+qh01CerhSCfKXkmDU=;
  b=Q3fWCzZ1wUPYCTF8bRp0s9bfSGYQzan582FkP+LtxbxxJ+MYvTzV5sq6
   jt/FBA/WYNqAQMtYWax6y3usW2BrPVNJEG4h2QN7tCHz1KKhOmLppC+J1
   K8+16hPex5fvsGaJkVyerkt0JEfk1YmVvyBvv5LEsIpS554VK26/lvxVv
   8Y+uKBqh97B8WGVvBJVYbR/DmrGCT19YjskvnjVowr1silNxKiHXjQ/ic
   QI9AbzU8/y5b/ywpI/cI/6Lhv1vP1GG96sayuSkOHIz6OL7Q//SuPXkjH
   q9aXRr1+bIy4lMgJS9lsJDSdPZqADDZZgEvMDCGN3WdE6CWkJRgY+LYIq
   Q==;
X-CSE-ConnectionGUID: Alq0Diq0TcqEfzHWLXnZMw==
X-CSE-MsgGUID: OFDhRPt/Q1axJKL3Pnmeyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="34123444"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="34123444"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 12:01:16 -0800
X-CSE-ConnectionGUID: R4y373hHST2QoIJjv90vbg==
X-CSE-MsgGUID: Tiep4SaWTfOoUFQ7Lp2rWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="99558106"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Dec 2024 12:01:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJeVk-0002Dl-1V;
	Fri, 06 Dec 2024 20:01:12 +0000
Date: Sat, 7 Dec 2024 04:00:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: sound/core/seq/seq_ump_convert.o: warning: objtool:
 cc_ev_to_ump_midi2+0x589: return with modified stack frame
Message-ID: <202412070334.qukIwQDe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>

Hi Takashi,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b8f52214c61a5b99a54168145378e91b40d10c90
commit: a4ff92ff0bdd731eca9f0b50b1cbb5aba89be4b2 ALSA: seq: ump: Transmit RPN/NRPN message at each MSB/LSB data reception
date:   4 months ago
config: x86_64-randconfig-001-20241206 (https://download.01.org/0day-ci/archive/20241207/202412070334.qukIwQDe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070334.qukIwQDe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070334.qukIwQDe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/core/seq/seq_ump_convert.c:8:
   In file included from include/linux/string.h:374:
   include/linux/fortify-string.h:580:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     580 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   1 warning generated.
>> sound/core/seq/seq_ump_convert.o: warning: objtool: cc_ev_to_ump_midi2+0x589: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
