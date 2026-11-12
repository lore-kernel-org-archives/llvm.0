Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493121;
	b=h76AtN3qOWuacUOsDHAe7xGMpiR/coWc2ZZWVA8Z5adRT7wELJyE//YHYzHrocVSBNQS
	 eMSyqfVgKibZGG/04sUa9leZY3oh1FX44XuZ8+c6IUCemY/rwCU9ISHt7so2AdFRVnTp7
	 XUXNqgqw7FKM+9F0G2/JYSar4yjrsJDDvgJe0xQfKlt6dsE1z3YHE+H4+UK3hlhz1sOgC
	 c4xksL4z/aK5qT1nneHoz5Iasq2+L3Idm2m79SLDtYba3N7vfuYYV7dJFmAAgp9GP6+iE
	 q7G6ONig0s4g1061iZy13o4EZWhayGAIM89UcdHcvwevharwa+q2LUXRcmVDKVoyMQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493121;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=J4ckicV8J3DaZjpgH1uZlBSuab7T9f1cskisK8e37r8=;
	b=D6GVilkzbmAazkf22qsqfv0+BcQklhg13eMfujaSXvZFsa/xSahRBMkJfe3FupDgnSGy
	 9ofb/p18YvWVDkR2bj9cKmEM05FIFRMTG6QeKh74szI/y6KMVmDBX/90WNI/tmqT9ghGZ
	 O/7U4nNEOi6K4ZtIxD+ZyaBiZ9x9i29VdSYPK/swZBO2v7QaS3vB0gsy1KdHU5ZpHv5xT
	 aSwkiFqsOEq2t2jXiDmFun+tMHvyutcBwNe2rtX/ofzJoHl36n7Vxe3pxUdSIYm5GJkbG
	 TI8802sep0YH7IVWezihj57BxZ5fSs/yT5l7Calymi8kLbYHijxMDbaxE9A5m2YGM7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gIuoKh1i;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4B4606B817;
	Thu, 12 Nov 2026 14:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA4B4606B817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gIuoKh1i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794493121; x=1826029121;
  h=date:from:to:cc:subject:message-id;
  bh=vaV0wFZxVthwvCib43YnL8SjzdR0wKM2m4yRkZhT32g=;
  b=gIuoKh1ihIsPgmQ6qR45YOoutOeANECrRnpQ0NfNVzYOllD3ak43h8EB
   k3P2ih7nNE1cXEHbEYqBlwbkGu++2MfFkS1/rX4u7vQHxd25VGIA+rdx8
   hM5cUhVWgTjnujPzWd06h7cuINhehP6WBg2lFcWKTVPHEXsiobPlIqPe4
   aQHpTjRDRS90FbeMhujBWVE1lRc3HY+BmbIeqLnAz4keoUPZX8O/ErYIa
   Doo00uOm/G4tx6rzmgU0624xeYjNQ36k5vpAiqo3aVsrarR8o+f+XoLmk
   o9Y4qu5obMMr6NnMUkdvd2sSWizAvBS7DnBIS495gupzcM2caoS63GMLr
   g==;
X-CSE-ConnectionGUID: jTkwXYNJQQyA8rXWMNTZTQ==
X-CSE-MsgGUID: L0S/ixOaRBChISZl6FmLbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3173972"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3173972"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:18:40 -0800
X-CSE-ConnectionGUID: 2cNieOtzQZOHC7WnJkhVeA==
X-CSE-MsgGUID: zPJGxYgVR1yrZrhFv0dUfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8704395"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2026 06:18:38 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRVdL-000000011Sz-1jWJ;
	Thu, 12 Nov 2026 14:18:35 +0000
Date: Thu, 12 Nov 2026 22:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Steven Rostedt <rostedt@goodmis.org>
Subject: [linux-next:master 5784/6673] WARNING: modpost: vmlinux:
 section mismatch in reference: seq_buf_terminate+0x20 (section: .text) ->
 bootup_event_seq (section: .init.data)
Message-ID: <202611122226.vTBpAmtr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaa2f954c21b205a0bcd0961e5b2be4e82e58455
commit: 7b8cd26b6aab8cf147165610d13964f79200a5a7 [5784/6673] seq_buf: Mark a seq_buf overflowed when terminating it loses a byte
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261112/202611122226.vTBpAmtr-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611122226.vTBpAmtr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611122226.vTBpAmtr-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x20 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x24 (section: .text) -> bootup_event_seq (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
