Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCAD7EF01;
	Fri,  9 Feb 2024 18:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707502300; cv=none; b=IMZ6NJV9Rr1HgCbuLEA8Ay5e/38rgB1Q/dn6D4O88dQkwOlFu27TgNd0XgI1/n5o7dYSinlw7nrptLN1BVM1Gs+M3R7k531EfGD14p9oCctRNn5l3akJlU/QOIpxHW3M0YF3c2DJptcX/rnx2ktDAeAVE6fHGALt96oVhdZrhrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707502300; c=relaxed/simple;
	bh=udkSw/jXmix2hS8UPAU68VQC1L9IDTlI6JkFx+gVgUo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PeR5CfZX+r/xmNhGtZ8ESaVLfWsMrE4L6rOKunvTY6fiXrree6tNVyG533g5rD7OJxiL5VLq5xilIm5LOC03AlC0IXOhCSLwZ0gdDnP3F/4u2HSLc4znQQuV2dXd+qWgOIowTd091miFshXM5O/RyV+bSWZYmQcIcvknOVILUZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuYH2Yj8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuYH2Yj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707502298; x=1739038298;
  h=date:from:cc:subject:message-id:mime-version;
  bh=udkSw/jXmix2hS8UPAU68VQC1L9IDTlI6JkFx+gVgUo=;
  b=cuYH2Yj8h4+5OTD+/ReGY3swn8nWyB21tb4hx21rKeHlk7s1nWPeE7IU
   gOaztw/1NFy8r2ldeticY2Dh2wGRJGUcQEniP36i6j2/yOQNwc5XjXBAM
   ON/ok7FFGdB0zdkNGD+iNbrQqLbSt59D8YD8dpaL6TrxbONPvvO21Mqxf
   t57FKgOAuYxTeHyW1oTRSEww7UMJCpBA7+RxTX3uaR71LHD9yoBnyTt/O
   gKEfueyPKIwpE7BZ/rm/Cg3Dg1KgpQPJnluZuHApwiXwDuuj/BGTtaNsx
   FXBHyNSKWLfEhvYsaayFPg+PoXlHlKMyyl0v/gQVA9UiqWJb/uWwTSUQ0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1610719"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1610719"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 10:11:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="2341450"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Feb 2024 10:11:36 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYVLa-000508-0y;
	Fri, 09 Feb 2024 18:11:34 +0000
Date: Sat, 10 Feb 2024 02:10:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: ip_vs_protocol_init() falls through to
 next function ip_vs_wlc_init()
Message-ID: <202402100205.PWXIz1ZK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f719a2f3fa67665578c759ac34fd3d3690c1a20
commit: 55c84a5cf2c72a821719823ef2ebef01b119025b fortify: strcat: Move definition to use fortified strlcat()
date:   9 months ago
config: x86_64-randconfig-076-20240209 (https://download.01.org/0day-ci/archive/20240210/202402100205.PWXIz1ZK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100205.PWXIz1ZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100205.PWXIz1ZK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ip_vs_protocol_init() falls through to next function ip_vs_wlc_init()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
