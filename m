Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED42250297;
	Tue, 16 Jul 2024 22:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721167222; cv=none; b=Cgoq6lEh4d8bh4EYTrwks9h0Y9B4I6ZQ9n7JwJ/KeHWjwfA/cSvnc+omu8aoPVFKSk8A2MbbdfWQhFWBlzx8w8thUJTyUMGAw30ULo3IdZh6q0YSkHaqy9NNobQaL7pPGkzEfTn/X75y5FE6ssh2OHv+dIrxT2I+QdIfS9c3Xto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721167222; c=relaxed/simple;
	bh=/2jhcYJqnoyY8/k+vpxU+TG96PiNCbd+Ybh1k1MxL9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZiNmstEXLjSV1ofhcl8Q5/9pBAjhdbX6fznc7XGDc0IUV+DQaoYtk5WuM6FGKqiicDOVJmtiinB33bP7vdcovX3OKJbCPoCaPLe9bK/qrcGQHtakSR3nqFlbQoK8Tlu8ZZgyDmQF9OxKS5GqmQExYCo0IoidJUc3qSaixAUhygc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckJbEToa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckJbEToa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721167221; x=1752703221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/2jhcYJqnoyY8/k+vpxU+TG96PiNCbd+Ybh1k1MxL9s=;
  b=ckJbEToaZN1zBZEJ/oxYhSIf0oGHLvUIU6APL3o1ubpYDD6xeT/Q3tw6
   7A07UhrIgGtGA3sfnaZfks4qfdAlvDuCbcvUkvsAYj96WwONbN0gKKr6G
   W5UzoUwgNPYxfZtTUx8Ava/lJM3fSMHAlDPTzcGIF3kZEzQVbsXdZFfdC
   /crsZIIIN/mdysW+R8rs3dSzewK49sW4ptDQcSA8mo7BJ0PBThdjGtLJ7
   TQ0Z/XSTlzCdxeDA/MC7mEfG01gazGuy/4pIm5CBHzPzu/1H4RDriFz6p
   IlPJMZrP2EDK4rlA6+7/lTeEw2sC03GrGNQYJcoViI2t24kkU5mQ3Grlr
   Q==;
X-CSE-ConnectionGUID: QpUBZkwET0q1mVexl7GJxA==
X-CSE-MsgGUID: zPm3xHBgQ6ykNcFifBoZbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29246854"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="29246854"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 15:00:20 -0700
X-CSE-ConnectionGUID: 2Ec/3ao0RI2fyXpm3ZNf0g==
X-CSE-MsgGUID: zn23qb4dRF6yqV6tG+8Okg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="50233731"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jul 2024 15:00:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTqDY-000fi7-09;
	Tue, 16 Jul 2024 22:00:16 +0000
Date: Wed, 17 Jul 2024 05:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20240710-cbc 12/13]
 usr/include/linux/ethtool.h:1644:51: error: expected ')'
Message-ID: <202407170517.BxkUPcmH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20240710-cbc
head:   e3597892cb471e5732700d17c2cca098f3148759
commit: d2fc97b383bbbdff9312f7993dbc9fd9d44bf379 [12/13] ethtool: Avoid -Wflex-array-member-not-at-end warning
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240717/202407170517.BxkUPcmH-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170517.BxkUPcmH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170517.BxkUPcmH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/mdio.h:15:
   In file included from usr/include/linux/mii.h:13:
>> usr/include/linux/ethtool.h:1644:45: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
    1644 | static_assert(offsetof(struct ethtool_dump, data) ==
         |                                             ^
         |                                             int
   usr/include/linux/ethtool.h:1644:15: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
    1644 | static_assert(offsetof(struct ethtool_dump, data) ==
         |               ^
         |               int
>> usr/include/linux/ethtool.h:1644:51: error: expected ')'
    1644 | static_assert(offsetof(struct ethtool_dump, data) ==
         |                                                   ^
   usr/include/linux/ethtool.h:1644:14: note: to match this '('
    1644 | static_assert(offsetof(struct ethtool_dump, data) ==
         |              ^
   usr/include/linux/ethtool.h:1644:1: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
    1644 | static_assert(offsetof(struct ethtool_dump, data) ==
         | ^
         | int
   3 warnings and 1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/ethtool.h:1644:45: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
    1644 | static_assert(offsetof(struct ethtool_dump, data) ==
         |                                             ^
         |                                             int
   ./usr/include/linux/ethtool.h:1644:15: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
    1644 | static_assert(offsetof(struct ethtool_dump, data) ==
         |               ^
         |               int
>> ./usr/include/linux/ethtool.h:1644:51: error: expected ')'
    1644 | static_assert(offsetof(struct ethtool_dump, data) ==
         |                                                   ^
   ./usr/include/linux/ethtool.h:1644:14: note: to match this '('
    1644 | static_assert(offsetof(struct ethtool_dump, data) ==
         |              ^
   ./usr/include/linux/ethtool.h:1644:1: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
    1644 | static_assert(offsetof(struct ethtool_dump, data) ==
         | ^
         | int
   3 warnings and 1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
