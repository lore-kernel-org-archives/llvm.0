Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF30366DA5;
	Tue, 31 Mar 2026 02:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774923295; cv=none; b=R1KJJnxbflGXwqOTjkX3PA/+w/7WVRZ86PWgMAfUD2a1bt4f19CNMy9A4CSrWUI2TOU2bbsaFmYqWbw2GPKxZaGnKlA3fxjVOzyH+HZA56sfER2hWMtI0ZvqRvLHA3FbxkvGtmOZc21xEsvII/DaPOBofuO/mjxc2XnS+d6RyDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774923295; c=relaxed/simple;
	bh=wYxTJAYjbUzW07/TMAxyAqaxL93dH9jpnRFdRVY1rco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DJEZ1oyaxMZOaWF5sL5kp6Oi97ScN1wN15tju1HkYV8Mkn31GPNk9C1U714LRkhGJFzJjRrGJqDzJukBPux7+xuveenqST0Q1iB/1gs6zn8BP1PoRiqGz8K2hd/Ro7m79JubSnjheqyIef6EuF4IzGZMTgXKczkiXYJGZfDYIkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoK9JvRh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoK9JvRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774923293; x=1806459293;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wYxTJAYjbUzW07/TMAxyAqaxL93dH9jpnRFdRVY1rco=;
  b=eoK9JvRhRqXcK3+lD0j4KrpDnmnjgVftRwgGVAp5jC83jBRBBNfoKBWp
   ny5dldbgRRN5CNAudw/GLdl9nDWG1dqCqH2UjmW4iZEdqCnRt+VFkd3at
   xrxjuemLiEoGaF9y6Mef7gyV2UWPRE/O6AGjBah/6ki+ZoXaaRtGEqb6x
   P2b4mm2IH8tBg56KtEX32Tx1Nxl3/APS61uSqv5s4GzR+AHbDXdwInV+s
   yVsTT+pRK3kGp45NVf7JQK0GYsYyjtTebzSmSec2UF2XACxrc8M/ZTvIb
   fdZGUoM+ggODAjOnb79D+irmegU44Sdg1gdaMEFgr0eb00mt6xCBOUFHZ
   Q==;
X-CSE-ConnectionGUID: q6XCwm1iSE+xKJJst5VVkQ==
X-CSE-MsgGUID: 7R29mSwGSliM2adK6idc7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="101384466"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="101384466"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 19:14:53 -0700
X-CSE-ConnectionGUID: sYQGutoPSS+dCqRm000S3g==
X-CSE-MsgGUID: dBNakTNNSUmzQHnJW8L2PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="223343984"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Mar 2026 19:14:51 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Ocy-0000000021h-2uyV;
	Tue, 31 Mar 2026 02:14:48 +0000
Date: Tue, 31 Mar 2026 10:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:locking/core 21/38]
 drivers/platform/x86/lenovo/wmi-gamezone.c:34:31: warning: unused variable
 'gz_chain_head'
Message-ID: <202603311058.D8qRr92a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking=
/core
head:   a21c1e961de28b95099a9ca2c3774b2eee1a33bb
commit: 1ea4b473504b6dc6a0d21c298519aff2d52433c9 [21/38] locking/rwsem: Rem=
ove the list_head from struct rw_semaphore
config: i386-buildonly-randconfig-002-20260331 (https://download.01.org/0da=
y-ci/archive/20260331/202603311058.D8qRr92a-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260331/202603311058.D8qRr92a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311058.D8qRr92a-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/lenovo/wmi-gamezone.c:34:31: warning: unused variab=
le 'gz_chain_head' [-Wunused-variable]
      34 | static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
         |                               ^~~~~~~~~~~~~
   include/linux/notifier.h:119:32: note: expanded from macro 'BLOCKING_NOT=
IFIER_HEAD'
     119 |         struct blocking_notifier_head name =3D                  =
  \
         |                                       ^~~~
   1 warning generated.


vim +/gz_chain_head +34 drivers/platform/x86/lenovo/wmi-gamezone.c

22024ac5366f06 Derek J. Clark 2025-07-01  33 =20
22024ac5366f06 Derek J. Clark 2025-07-01 @34  static BLOCKING_NOTIFIER_HEAD=
(gz_chain_head);
22024ac5366f06 Derek J. Clark 2025-07-01  35 =20

:::::: The code at line 34 was first introduced by commit
:::::: 22024ac5366f065a7b931bee5b62e2588521c4f0 platform/x86: Add Lenovo Ga=
mezone WMI Driver

:::::: TO: Derek J. Clark <derekjohn.clark@gmail.com>
:::::: CC: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
