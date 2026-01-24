Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E5E2DCC08;
	Sat, 24 Jan 2026 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769259558; cv=none; b=IeWa9Uq/vNiym5VbUHTyMrr0hrmPsiHTqYKxzwWyX4XX7ghafekkI949JLcHMQ2k4mPobpZrkBJLFtzCBiM75zWavxzZA0vLSqeGnzwJ3O0xYV3QaZvAyCv59effPv2c7rRbnP2HcRVbCCOK1M0YFSA1/qn1xSXh/swO5i0J2u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769259558; c=relaxed/simple;
	bh=6VWELgiXnV8xByG7aIJEZB/pmilfWBd9gDammhpke/U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kgW7bgwDjuciSe7v2sVICygi1G737gAYiqPLzagvy5CHydWx5mrclsTgxbolLftZ2TLc14UJTXeVxY7yQKF+6DuKWRLjyP6KpxFqaD8borXjdjjgjXBU6zJ2oI4TkegVSptjRQU4FzCLh8EUw6Oyjt/h7W2RCrZfaSdbIysiksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWPy6xL5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWPy6xL5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769259556; x=1800795556;
  h=date:from:to:cc:subject:message-id;
  bh=6VWELgiXnV8xByG7aIJEZB/pmilfWBd9gDammhpke/U=;
  b=aWPy6xL5U+En52JKwJDbGL322LXPYMUykKtZKSzXqw/Ba50T4MpMGViz
   ZuNpsB9Ow7ifpVUSZeXRB0CxPexE0WViwRQ4Ty/97TL3Gd+8mOJh/sgEa
   fyGQx6PWSW/ZDXAhHJQs6bVigoRcoN46ovw5k5374j1ZdW7r36wzxaWfn
   XsIanUzpZ7C8/H2Ipx3Jo3UK6OURRmn9Yh0jIAj3rtOINcxg957/Vx8LT
   /qBDfMJlFkTxeKc8czSQn2TLD723aNX+tCYQxf0YGo7DtPbHVeIsMj+DW
   fEQu6Y3jZ879S8DVk5tCm5wxR1s5t7y88n+Sqo5F8BXw6BrhojTttrUD8
   Q==;
X-CSE-ConnectionGUID: cR8UwAbNQz+Ve8Y++hyF2Q==
X-CSE-MsgGUID: feHovB0jR1eJ1Rx8Q4AhDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74122115"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="74122115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 04:59:14 -0800
X-CSE-ConnectionGUID: dmQraaB9SXm4g2l0nBmOVQ==
X-CSE-MsgGUID: fBftZ3KLQfm13Gj1r500lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="207505316"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jan 2026 04:59:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjdEL-00000000VBo-3IhH;
	Sat, 24 Jan 2026 12:59:09 +0000
Date: Sat, 24 Jan 2026 20:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Bahubali B Gumaji <bahubali.bg@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 2/2]
 fs/smb/server/vfs.c:34:10: fatal error: 'stats.h' file not found
Message-ID: <202601242353.Ymm0oTBe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   165b1c2775ace8540bc0869e3fa92aed566fc193
commit: 165b1c2775ace8540bc0869e3fa92aed566fc193 [2/2] ksmbd: add procfs interface for runtime monitoring and statistics
config: x86_64-buildonly-randconfig-003-20260124 (https://download.01.org/0day-ci/archive/20260124/202601242353.Ymm0oTBe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601242353.Ymm0oTBe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601242353.Ymm0oTBe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/server/vfs.c:34:10: fatal error: 'stats.h' file not found
      34 | #include "stats.h"
         |          ^~~~~~~~~
   1 error generated.
--
>> fs/smb/server/mgmt/tree_connect.c:12:10: fatal error: '../stats.h' file not found
      12 | #include "../stats.h"
         |          ^~~~~~~~~~~~
   1 error generated.
--
>> fs/smb/server/smb2ops.c:14:10: fatal error: 'stats.h' file not found
      14 | #include "stats.h"
         |          ^~~~~~~~~
   1 error generated.
--
>> fs/smb/server/mgmt/user_session.c:20:10: fatal error: '../stats.h' file not found
      20 | #include "../stats.h"
         |          ^~~~~~~~~~~~
   1 error generated.
--
>> fs/smb/server/connection.c:47:37: error: no member named 'inet6_addr' in 'struct ksmbd_conn'; did you mean 'inet_addr'?
      47 |                         seq_printf(m, "%-20pI6c", &conn->inet6_addr);
         |                                                          ^~~~~~~~~~
         |                                                          inet_addr
   fs/smb/server/connection.h:53:12: note: 'inet_addr' declared here
      53 |                 __be32                  inet_addr;
         |                                         ^
   1 error generated.
--
>> fs/smb/server/server.c:25:10: fatal error: 'stats.h' file not found
      25 | #include "stats.h"
         |          ^~~~~~~~~
   1 error generated.
--
>> fs/smb/server/smb2pdu.c:42:10: fatal error: 'stats.h' file not found
      42 | #include "stats.h"
         |          ^~~~~~~~~
   1 error generated.


vim +34 fs/smb/server/vfs.c

    24	
    25	#include "glob.h"
    26	#include "oplock.h"
    27	#include "connection.h"
    28	#include "vfs.h"
    29	#include "vfs_cache.h"
    30	#include "smbacl.h"
    31	#include "ndr.h"
    32	#include "auth.h"
    33	#include "misc.h"
  > 34	#include "stats.h"
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
