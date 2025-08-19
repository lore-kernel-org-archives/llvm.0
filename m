Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC08C3043C2;
	Tue, 19 Aug 2025 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606295; cv=none; b=YHEn+MSj+YfTucTZWXvYyERDQMaQnohgVTtNPOSkEvMab9j75do6aBOym+b1yr1o+x7h5D0qmk8j9BtGtsoLrRWe5UmFWJFZ3Qb7G2W4YEsKvYOKS909g2jBJxLTusPk89oly6dfzvb6ov6zxQN21qMvZpCxaDEIA/3MKhUKoxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606295; c=relaxed/simple;
	bh=IYEUQWG+tLbUBu4RWN/muhseMdiRSJjh3IOieyKggyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3vb2SFIpEF8H1Awrs4+oATsnCNXmnvUw89vZduerE0hCCHNFpnvqiWQyvUrWOg8fGLzN7fW1rNXJD1y3IEo8xbcuDcpchpgr2MEodckGE3uXu7uX2oIfxa4uK/uxWwBGp2Lrd5tQwEoVbyT3DPXLuP8uzlnIj2N0RKAT4XVHOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKKABw8L; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKKABw8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755606295; x=1787142295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IYEUQWG+tLbUBu4RWN/muhseMdiRSJjh3IOieyKggyc=;
  b=CKKABw8LS7Fzo7RmUKhVzbcei3TDXRPnMYKMDEh//8MS2k06KoeXdzvb
   PZH6IcSEZsscWeJXmkXPqqRU2WWRh9R5IFcCXb7hum4hf80KaYE67A4dR
   1Wx4hDoUDsn+/uFsC5sD7GLI6Pqxi+SrDwiP6IGINilN6tbY+tsvgVLyb
   S0dgbCAW7uP6cF0G+/EYh+zSFu5hQ1/yOWZ0vDkz35RvSuWcSRKm54iia
   WMqMuuoDIg/VMLKtcb3zlMoF2c6vlC/bC8I4W4DBJOv/cGCPmmb/RrPX9
   O4DwbROvmNeWYSk7T975/sfZ37XOn6VMlMWO3opgdyMA4OreKX9fr8hV6
   g==;
X-CSE-ConnectionGUID: jEmtltDaQLScdsUjXpyYIg==
X-CSE-MsgGUID: fGe8v4SZTs2YsXw4di1bQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61679553"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="61679553"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 05:24:54 -0700
X-CSE-ConnectionGUID: mg2Vn+SJRGiMeZG3Jyyw1A==
X-CSE-MsgGUID: P1oRkPpWTEapQY9ckQMsYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="172064403"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Aug 2025 05:24:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoLO0-000Gqn-2T;
	Tue, 19 Aug 2025 12:24:31 +0000
Date: Tue, 19 Aug 2025 20:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 315/315] ld.lld: error:
 duplicate symbol: __tracepoint_io_read
Message-ID: <202508192038.S6x4nOyC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   18104c9e108e1d96c66acb5f4f26f891c3f643cd
commit: 18104c9e108e1d96c66acb5f4f26f891c3f643cd [315/315] bcachefs: trace_io_read()
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250819/202508192038.S6x4nOyC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508192038.S6x4nOyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508192038.S6x4nOyC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __traceiter_io_read
   >>> defined at trace.c
   >>>            fs/bcachefs/trace.o:(__traceiter_io_read) in archive vmlinux.a
   >>> defined at debug.c
   >>>            drivers/net/wireless/silabs/wfx/debug.o:(.text+0x120) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __tracepoint_io_read
   >>> defined at trace.c
   >>>            fs/bcachefs/trace.o:(__tracepoint_io_read) in archive vmlinux.a
   >>> defined at debug.c
   >>>            drivers/net/wireless/silabs/wfx/debug.o:(__tracepoints+0x60) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __probestub_io_read
   >>> defined at trace.c
   >>>            fs/bcachefs/trace.o:(__probestub_io_read) in archive vmlinux.a
   >>> defined at debug.c
   >>>            drivers/net/wireless/silabs/wfx/debug.o:(.text+0x170) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCK__tp_func_io_read
   >>> defined at trace.c
   >>>            fs/bcachefs/trace.o:(__SCK__tp_func_io_read) in archive vmlinux.a
   >>> defined at debug.c
   >>>            drivers/net/wireless/silabs/wfx/debug.o:(.data+0xc) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
