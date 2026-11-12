Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496093;
	b=DY/30kbqnPLYN5D6lhl8gX1rI9xBbD9JZR17c4NopRDvZlROZGxVyulZ4nF/sKsjL77s
	 SNamFgBoegruIbV+fwV5vKgUU9xG5Ly2O6F3hmpkGCHdSw3QoHk3ShhNExBsnPcvgnrOM
	 epOkKiO/PtFFucNsOSH3gXPC8eSJMoOPRIxZxR49mtVqH3bHyze8oD/h0KMWMEY0rpn+C
	 ahozStTRvs+LXBoHspPjB9yBVsW1phYjneAhoJiGZxo3OL/oYbTAT7UD5xZFpiXQAbs0e
	 GG+Oyy/dL55VgYtbUF+GyVTjQyIynIOaf8x6MDiLuAI+HE7Cl0nuQqL5Bqf1QK/wvkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496093;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0MtVD/2CYndxQ/V5h95yvnWDNSnQLfbStpMT5xcinaE=;
	b=5qXjBm+osKQn+IqNXmofp6qeUL2ZgfwCggJhhsqsP681LRZHKUZZjNNCbzfkstCbKYZn
	 IGvwSeaMnQYuL5LnqkLmAMexk/KUzwg5sbLjuC+WK3odg22TulIzUYe/S3YG+wZl+QdQb
	 KVw0+ys+b8Y4NPPGKo2Tv0cTgDg+QdWEpgKf0m+bJewHA7QiuPtK1lDeZPMvAQY71cBNl
	 98NBcqBXLP+NPXgGg8D9w2tjQGmff7T2yqOgxuuGsAXepFwCk5AI7/3kbjZ3oVCr2tC3a
	 O87e6VthO+geW7EpEQdbJ08GR9RIeXYFXslMUQ+Lm75IERjS54cRYCgAXIKdY6tKsdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMmhAuvc;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D4C606A31C;
	Thu, 12 Nov 2026 15:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78D4C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMmhAuvc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794496094; x=1826032094;
  h=date:from:to:cc:subject:message-id;
  bh=2grJq6ch3SWlVA90HbL4U9dkC72n/tE8xXLosCwE7rk=;
  b=IMmhAuvc4iTXv/HQ28USJC/yqkQABuyHwaaW8heIZO3oGuZWxELK8yXv
   mZ9aAA2mRVXJBaslepCg8HyU9KRQF1H3rsApbUxzgxC+SYWnTJj+qtVq7
   +sxD0hJbReZkRDF617R7L1kIhjmpPR++Y37+jki+uVqHBAxY8JdqUPk3N
   EoBw13OQAqKrFp/Dn4bSmCkX+1QgRUSnU+uXJyxJ9pzxauN9E7GWr1V4S
   Q+8pQsweIV+Uz/ponxyBLKH7Ne+mjky1Be1kzr51HaHIimwJjXLvFONFT
   I3GQbK6T+B+7mBJ11ERqhuPINg8R9wRZhakn+hKAAU34HG7KYq7K0uXK3
   Q==;
X-CSE-ConnectionGUID: twLgOHnmTSST2BSdPlHn+A==
X-CSE-MsgGUID: 8OE6q+TeTO+AkbnM5EU8Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3178877"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3178877"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 07:08:13 -0800
X-CSE-ConnectionGUID: 7Ox7SkDfSFipX5yVuL3/CA==
X-CSE-MsgGUID: mAlUkWGuRoiJy8D6ViP84w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8774520"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Nov 2026 07:08:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRWPJ-000000011bL-0cAS;
	Thu, 12 Nov 2026 15:08:09 +0000
Date: Thu, 12 Nov 2026 23:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Steven Rostedt <rostedt@goodmis.org>
Subject: [linux-next:master 5784/6673] WARNING: modpost: vmlinux:
 section mismatch in reference: seq_buf_terminate+0x2c (section: .text) ->
 bootup_event_buf (section: .init.data)
Message-ID: <202611122323.IvGv8FYK-lkp@intel.com>
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
config: arm64-randconfig-1000-20261112 (https://download.01.org/0day-ci/archive/20261112/202611122323.IvGv8FYK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611122323.IvGv8FYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611122323.IvGv8FYK-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x20 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x24 (section: .text) -> bootup_event_seq (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x2c (section: .text) -> bootup_event_buf (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x40 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x44 (section: .text) -> bootup_event_buf (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x94 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0xc8 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x124 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x178 (section: .text) -> bootup_event_buf (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x17c (section: .text) -> bootup_event_seq (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
