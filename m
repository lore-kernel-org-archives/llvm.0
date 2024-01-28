Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738C42D60A;
	Sun, 28 Jan 2024 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706457575; cv=none; b=dnsBfulbFcEpZxJzqYlcOPfzlGwn7dfzpGUkwKp0G29UbO8SI+JubXgcVoKXoKZQ7ygO9NouCneZUFEFqr50OYERtyvEysZaCFMS+TqS6CqBZ07/UECh13YC52HEN7B7TX5M0DjdN+1KGNB9Z7BV6x4tuQoOOxwHXUTJnq+mWYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706457575; c=relaxed/simple;
	bh=jgxK5bxKkmEkuPP2q4pZVhdhe9oPQw4K/R0cQ3sYWPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nmurjEZ63WWig5/r1wGy+XGU70ZJPgxmMrO3G86c03k6Yt2d4u9g6QF+pFG7EYm39Uuz1IamAUPaM3fssBl+1/uRygtT42dJtGhF2E8JuDz02vwqQ/Rr4/IA20PIa8mC5T1B1mbwJvRHcM9+cH/EeExp2c06hJM6afKLeJzwAL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g9Q/oMQW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9Q/oMQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706457574; x=1737993574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jgxK5bxKkmEkuPP2q4pZVhdhe9oPQw4K/R0cQ3sYWPw=;
  b=g9Q/oMQWm+5xuPtS0MVlIYDm63eEVy59luazjrzpd6C1xCRLEnwYNRGF
   qCPyHP0/r2yaRACkUClNi+YU76hnV6vHFoC0/6dQafkK56PMfZtPXb1rq
   loJoNp8o+8XfihqzJ0YypsWkigi3oiuSz3drVh5SO2jV67uELt4RajuYf
   bu6nFdnsQ8NRTsmCVh++NPleeZXWsasWp73ZBxGctpOTp9MDOMLqnwlmE
   V43pF7AfLXDfAKLPOriDIyJG7Ir1lFEiVLsFMeBJpFZolPGiVF8Zey7wc
   MGm7gskD63TmNB01eO7LkVYJakN50vX64tBmYo1rQqTmNMU2oL48ehOPz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="1719077"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="1719077"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 07:59:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="857867604"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="857867604"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jan 2024 07:59:30 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU7ZB-0003W6-0H;
	Sun, 28 Jan 2024 15:59:29 +0000
Date: Sun, 28 Jan 2024 23:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jmondi:pispbe/media-staging/be-upstream 7/7]
 ./usr/include/linux/pisp_common.h:142:34: warning: // comments are not
 allowed in this language
Message-ID: <202401282315.Tmjnw5Qr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git pispbe/media-staging/be-upstream
head:   e1ae55c1c7105b10788c4b50c4185e82c309fdda
commit: e1ae55c1c7105b10788c4b50c4185e82c309fdda [7/7] media: raspberrypi: Add support for PiSP BE
config: i386-buildonly-randconfig-002-20240128 (https://download.01.org/0day-ci/archive/20240128/202401282315.Tmjnw5Qr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401282315.Tmjnw5Qr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401282315.Tmjnw5Qr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/pisp_common.h:142:34: warning: // comments are not allowed in this language [-Wcomment]
     142 | #define PISP_WALLPAPER_WIDTH 128 // in bytes
         |                                  ^
   1 warning generated.
--
   In file included from <built-in>:1:
   In file included from ./usr/include/linux/pisp_be_config.h:13:
>> ./usr/include/linux/pisp_common.h:142:34: warning: // comments are not allowed in this language [-Wcomment]
     142 | #define PISP_WALLPAPER_WIDTH 128 // in bytes
         |                                  ^
   In file included from <built-in>:1:
>> ./usr/include/linux/pisp_be_config.h:476:13: warning: // comments are not allowed in this language [-Wcomment]
     476 |         __u8 edge; // enum pisp_tile_edge
         |                    ^
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
