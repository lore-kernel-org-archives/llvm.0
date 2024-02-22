Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E3D3F9ED;
	Thu, 22 Feb 2024 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708605676; cv=none; b=S5ezEk4fyr056Uuh8x0Ys0CzUHTLyl3uZOiL+ceeBhUBTjpbNj08wPHkVmTkVweanthu3XcxXDNfN0QDG2kdJbJmMgBrRCX6v/EZZMn5Ol4P7oOuGde3eke04OA8QC0lww3uaEIEq8YchNtYNpfbW6gY3ya7WmkSM4JjJxlw6MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708605676; c=relaxed/simple;
	bh=73kMDCSaNNiQHqXsmRFjytEhlUgtpbZ1WCka/nNWSw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J874hS7HvS8BMRPZZPsFaZld9UzOdD1+7NLhGisNognavORQ+9moM/R1NOPV8PsQ9+fIQSC+Be6+WurTMDRJhyXiwffxVyAhW04hASWLaJFVU42hMp9CQCSuqPz7ZquKG5+RFgF8zKEClOR0WZ39CcRyVRgJiPAU/DjornYrz/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGE3CWtL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGE3CWtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708605675; x=1740141675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=73kMDCSaNNiQHqXsmRFjytEhlUgtpbZ1WCka/nNWSw8=;
  b=lGE3CWtLm+XeHol/e7BIMgdx/m6Axl8pRtJ7HTi+NN7Ma2Zo9D8Nf8TV
   gfS9h3FJ9+qx7xRGhjKgAKiSr0yl1+Xi5qFc9VyQZhYfPx0A96TkaWqjv
   YFsjd3UTsd0YNzEua/n5CvCEU3ckH9Z5DHEP25xusmhArGL9amQVV2rZV
   u2VHf6kWdx8ixOL6j7vQ0ETNAnHpLNlC4L53RS0QAVNpFoPt6NbW4eFK5
   wL6AwiGHuv5Bk6Pmn9blYErFgJKP6B3rDRKYC2ZKcggMp8ezLfq5CUFUU
   /dJcwM0idZD0tIbqnQ/WJLn5w21V4Lr6v3scC5FOJVBsH1GsFsAsrmGOK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2948200"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2948200"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 04:41:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="28650897"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Feb 2024 04:41:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd8Nq-0006JS-0B;
	Thu, 22 Feb 2024 12:41:03 +0000
Date: Thu, 22 Feb 2024 20:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>
Subject: [cel:nfsd-5.15.y 41/47] samples/fanotify/fs-monitor.c:7:10: fatal
 error: 'errno.h' file not found
Message-ID: <202402222002.1yteHudw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.15.y
head:   a5aab01194d8736b0d197129d1202ac94e67ede6
commit: 88586fc1009fee86a38c041aed71d2e51a4f2f82 [41/47] orDate: Mon Oct 25 16:27:45 2021 -0300
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240222/202402222002.1yteHudw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402222002.1yteHudw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402222002.1yteHudw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> samples/fanotify/fs-monitor.c:7:10: fatal error: 'errno.h' file not found
       7 | #include <errno.h>
         |          ^~~~~~~~~
   1 error generated.


vim +7 samples/fanotify/fs-monitor.c

   > 7	#include <errno.h>
     8	#include <err.h>
     9	#include <stdlib.h>
    10	#include <stdio.h>
    11	#include <fcntl.h>
    12	#include <sys/fanotify.h>
    13	#include <sys/types.h>
    14	#include <unistd.h>
    15	#include <sys/types.h>
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
