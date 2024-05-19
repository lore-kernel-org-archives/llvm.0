Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AF88827;
	Sun, 19 May 2024 02:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716085532; cv=none; b=e2U027bO9ZS5P2SebuwSSgOQkIG2sC3W1v3oUBei32gK2Vdb3stz/5kW8TaIfNidd2y1PZ+t4dJqxjyjDLvHcVj829HNlb9od3jbAL90EBU5Wt049/nMOuJFKgtbei2ak/4r3YETh0+8KHyuL0DVdv6MRjmCd2fo/v8m9ahtWg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716085532; c=relaxed/simple;
	bh=H2QWT2f81t2A7YfqN4WR89Yk0ejyOv/D2vd2g52iWeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aAcEU1vNhR6+XTkMOP8E8rvNJBIQYc1OAUMYH/QoRzhGQD2tJ3U/xqfKYGyOdbKL7MxGDIsEUQF1AIoItszHjIw+CZScAew3HHeDNRmM9lMjjTh6vIUu07SdJwrLfU81CJ+hHXzHltO2ZMbsRMCyjVukSLzrUg+5gop3QbeCWu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1O5E6Wi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1O5E6Wi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716085531; x=1747621531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2QWT2f81t2A7YfqN4WR89Yk0ejyOv/D2vd2g52iWeM=;
  b=d1O5E6WiU7pR9GyeHofsQmNJ9UuUd/NEGVVi7cOE12v/HodzipEsXDeb
   MrQur/x0ULwtF4a/FlnkLfBID2wNbYx6tlgkn7Q7ns5IuPc41hCbS2Qsb
   E/Lf1h1BfrEqr9HopnUmzhAFkQ2TC+1fuxgG9Pc8ddyPVr+uB3KRJnAKX
   souf/Z6ZDdRXDQQXd9iIVzkCHmkE6G4X9OeQyK5nFq1hbM5ZVUKLMQTxj
   tpY41rBeWMWd6yryLABywNBYAfK3MHskWrQiGt5UIgBdPLy4lFQimV8GB
   BSuH0HoasSDD1BYXSBLcIPDzOi0n4SG4u3+F6UXagSqrmvXME58nNXneX
   g==;
X-CSE-ConnectionGUID: m5d+edOfQmyJuCwuqnR5lw==
X-CSE-MsgGUID: hcKyVlezSR6ZJeoaeAQMTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="22847001"
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="22847001"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 19:25:30 -0700
X-CSE-ConnectionGUID: C/hqf9DFR5mNFnCcsn5pyg==
X-CSE-MsgGUID: 90LfL37ARmC3MoBEF0sZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="32091264"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 May 2024 19:25:29 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8WEn-0002r4-1W;
	Sun, 19 May 2024 02:25:25 +0000
Date: Sun, 19 May 2024 10:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 13/16] warning: trait `Sealed` is never used
Message-ID: <202405191059.dw6ssuHa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc topic/rust-drm
head:   440a8db3f583392a1a894f32782ecc397911f9af
commit: a92c0d93ee103b33d566d4e6ba88e3dc691db856 [13/16] rust: Add a Sealed trait
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240519/202405191059.dw6ssuHa-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405191059.dw6ssuHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405191059.dw6ssuHa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: trait `Sealed` is never used
   --> rust/kernel/lib.rs:71:15
   |
   71 |     pub trait Sealed {}
   |               ^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
