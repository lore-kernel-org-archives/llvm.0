Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D5E29C325;
	Wed, 27 May 2026 03:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779854300; cv=none; b=ns/V3CsdRZGe+kfzybLoGj9c5q+XqtqacoNuLFGbuz50y6mfyWmtezQlM+Txf+dZlsEzIqwoohtHQCsCfwyxgqCjyvPApZXsvMdhavi4xPwLWFgjJzKkjuD0CD//Y44s50n2UmesW696b46WISfuyT8BkEdIoNgKK6NGo9AKpPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779854300; c=relaxed/simple;
	bh=3gvQxNmYqwuWyM4/iNT+zJNwwNDB146aV8xtNCHM1Pc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sv9D+VNWglFkhfThZyKnZsvt12yhkiFUE0RYwFHGB69GQqVIchhL9MYPxrpAkfpx3dQ5Vn3W54AqIVbh8esmQxY2z2IleeKdxG7T9/24UsDfCYyJ4v4Te1DcXMMNOcdFoVY1kfVsUiHMnbEe4Fiywb0rgC3dJdvAS47bWe+T2qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLWmbbTO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLWmbbTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779854299; x=1811390299;
  h=date:from:to:cc:subject:message-id;
  bh=3gvQxNmYqwuWyM4/iNT+zJNwwNDB146aV8xtNCHM1Pc=;
  b=YLWmbbTOXdPwJ3KgBTDu2QSF0tIeK+SH/YYKmdt/K4uOjWvlbITn9/DQ
   7gzZUuRQknulC9JZRLRk4quxNyZl5WIVnNhetSKUdMay1ZLnIgsypt3A8
   +QwX85f8an8Rb3vkumaGgT4VDUwdLW33kHEZ3pifqZ9O8Hk5f8tRblfnV
   pg0Sg/ozkSbWQFsgEsGvYJWgt04/KmoCzFEQNzpVU9/wSk3dPTkn6lsOd
   63vbK/VFJQiW+606MYsjf0pcefb23wrukWF/doOqNb5p6jp3BCcoJ08VO
   Dx2Icp6ka8gkzaHiU8Nm0DE8Vi6e2q/ye789nwHT6iusWmB23BE4ozd14
   g==;
X-CSE-ConnectionGUID: 3Up52QJmRFeui5Ml6MZCHQ==
X-CSE-MsgGUID: DUAzlwlnQCWaDIh44+o3Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80709335"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80709335"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 20:58:16 -0700
X-CSE-ConnectionGUID: z80kaOzBRgmgFZVPas0WLA==
X-CSE-MsgGUID: 1ZRinFP8RpiawH4DCRdDlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="239501400"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 May 2026 20:58:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS5PI-000000003Ms-09qO;
	Wed, 27 May 2026 03:58:12 +0000
Date: Wed, 27 May 2026 11:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 31/1197]
 ./usr/include/linux/compat64_pr.h:4:10: fatal error: 'linux/compat.h' file
 not found
Message-ID: <202605271131.YDLFsoR4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: cef57a69a69cd2627d8c6da407d3d61ab87ef0f5 [31/1197] cheri: UAPI: Generate compat64 headers
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260527/202605271131.YDLFsoR4-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271131.YDLFsoR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271131.YDLFsoR4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/compat64_pr.h:4:10: fatal error: 'linux/compat.h' file not found
       4 | #include <linux/compat.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
