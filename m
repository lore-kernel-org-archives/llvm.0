Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B8837E2E6;
	Fri,  3 Apr 2026 08:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205734; cv=none; b=KVWf9+2pK9KfP/qne5SiuPvHsdm4NU+69D7WTo+VQHLP3+QSTqYLREhq283WwF8x9QdfXVzhLQ/QvsSqF5qmUkwWT7bt+5Ip78MIkIJg6EPQxQERrX6WojJEz9x62f3IJo9D8Jpn0xBPmFWZcXQ7JH2Ody74GYckBktGr+OGoCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205734; c=relaxed/simple;
	bh=VT47fF4UNFKw92doLEtJyGGgyl5ERxdRuU+ta7n+GaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rIEiCfeIIDDw5C6yAcD+sBkQ8RJW7Ni/dhHYavhwFkVzc6tPlAQTSlvF9PCsImt0drLb7p1Dn0rydZ5snfduaVTWgcOQC2/Cv/iQ3nj9CVPjXXcI7+rG+oRnsfVX5LZrU5W1cLAldnL2CG/MbBh5bDbcvAGH/muL4NTElOcTyQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzqNjzgG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzqNjzgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205731; x=1806741731;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VT47fF4UNFKw92doLEtJyGGgyl5ERxdRuU+ta7n+GaE=;
  b=GzqNjzgGdv5ZCQnrsvr8EECj1AIQ0vHmU4I+mAuuCwBUvmfva8cnp2a2
   t7LIBpF+Xky6waPuaIBRX13QN0YQY/LJKakr3v5snI6h/Ehm9qXQyaDfr
   nYCcAhE6/PS7uanIz8g5QQ3+NFLfUYv79K5MW3/0oECiesEySmeSXpzKi
   lhDAiA0MpfconP+R6Gt0F6+CR06MdbjZEvIqx3r9ORlxvSMR7ntgDQJod
   JEMnsAQNVYxRNnfmh4MrqA5vvLxdyF9oarjrLNJWjy3WMJINofQBmIp3/
   vGJg3CHJJrF4J6AGMnhUwopQ82qQA5lqBCA6Rv+w4YcldRboBETZSre0o
   Q==;
X-CSE-ConnectionGUID: vruABJZHRGyMOZDEwgsMiw==
X-CSE-MsgGUID: 55Th2bpxT1KLj+f9VTJ+sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86973966"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86973966"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:41:58 -0700
X-CSE-ConnectionGUID: 5Yiq07mPSG2+C+iIFIZtPw==
X-CSE-MsgGUID: QoJyM/a0TQGASHJJ6DwAuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="228834244"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 01:41:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a6E-00000000131-2odw;
	Fri, 03 Apr 2026 08:41:54 +0000
Date: Fri, 03 Apr 2026 16:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:deprecate-legacy-ip 5/6] net/mac80211/main.c:1650:2:
 warning: unused label 'fail_ifa'
Message-ID: <202604022243.XisdcKsc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/dwmw2/linux deprecate-legacy-ip
head:   2d2acff90d1c42a747b3fed5ce9189622f49daa3
commit: 3f213df15191632a3cb32932955ee90bff8385a0 [5/6] net: Change CONFIG_I=
NET to CONFIG_LEGACY_IP for IPv4-only code
config: riscv-randconfig-001-20260402 (https://download.01.org/0day-ci/arch=
ive/20260402/202604022243.XisdcKsc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260402/202604022243.XisdcKsc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022243.XisdcKsc-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> net/mac80211/main.c:1650:2: warning: unused label 'fail_ifa' [-Wunused-l=
abel]
    1650 |  fail_ifa:
         |  ^~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IP_MROUTE_COMMON
   Depends on [n]: NET [=3Dy] && INET [=3Dy] && LEGACY_IP [=3Dn] && (IP_MRO=
UTE [=3Dn] || IPV6_MROUTE [=3Dy])
   Selected by [y]:
   - IPV6_MROUTE [=3Dy] && NET [=3Dy] && INET [=3Dy] && IPV6 [=3Dy]
   WARNING: unmet direct dependencies detected for IP_ROUTE_CLASSID
   Depends on [n]: NET [=3Dy] && INET [=3Dy] && LEGACY_IP [=3Dn]
   Selected by [y]:
   - NET_CLS_ROUTE4 [=3Dy] && NET [=3Dy] && NET_SCHED [=3Dy] && INET [=3Dy]
   WARNING: unmet direct dependencies detected for INET_TUNNEL
   Depends on [n]: NET [=3Dy] && INET [=3Dy] && LEGACY_IP [=3Dn]
   Selected by [y]:
   - IPV6_SIT [=3Dy] && NET [=3Dy] && INET [=3Dy] && IPV6 [=3Dy]


vim +/fail_ifa +1650 net/mac80211/main.c

a65240c1013222 net/mac80211/main.c      Johannes Berg          2013-01-14  =
1640 =20
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1641  	return 0;
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1642 =20
a65240c1013222 net/mac80211/main.c      Johannes Berg          2013-01-14  =
1643  #if IS_ENABLED(CONFIG_IPV6)
a65240c1013222 net/mac80211/main.c      Johannes Berg          2013-01-14  =
1644   fail_ifa6:
3f213df1519163 net/mac80211/main.c      David Woodhouse        2026-03-31  =
1645  #ifdef CONFIG_LEGACY_IP
a65240c1013222 net/mac80211/main.c      Johannes Berg          2013-01-14  =
1646  	unregister_inetaddr_notifier(&local->ifa_notifier);
a65240c1013222 net/mac80211/main.c      Johannes Berg          2013-01-14  =
1647  #endif
a65240c1013222 net/mac80211/main.c      Johannes Berg          2013-01-14  =
1648  #endif
3f213df1519163 net/mac80211/main.c      David Woodhouse        2026-03-31  =
1649  #if defined(CONFIG_LEGACY_IP) || defined(CONFIG_IPV6)
2b2c009ecf71f4 net/mac80211/main.c      Juuso Oikarinen        2010-05-27 @=
1650   fail_ifa:
93c08c32914264 net/mac80211/main.c      Juuso Oikarinen        2010-08-03  =
1651  #endif
52e04b4ce5d037 net/mac80211/main.c      Sumit Garg             2020-04-07  =
1652  	wiphy_unregister(local->hw.wiphy);
52e04b4ce5d037 net/mac80211/main.c      Sumit Garg             2020-04-07  =
1653   fail_wiphy_register:
54330bf63b4968 net/mac80211/main.c      Johannes Berg          2015-01-21  =
1654  	rtnl_lock();
54330bf63b4968 net/mac80211/main.c      Johannes Berg          2015-01-21  =
1655  	rate_control_deinitialize(local);
10f644a47b76d3 net/mac80211/main.c      Johannes Berg          2009-04-16  =
1656  	ieee80211_remove_interfaces(local);
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1657  	rtnl_unlock();
52e04b4ce5d037 net/mac80211/main.c      Sumit Garg             2020-04-07  =
1658   fail_rate:
b7600aae8a20ff net/mac80211/main.c      Johannes Berg          2023-08-29  =
1659  	ieee80211_txq_teardown_flows(local);
dc8b274f0952f6 net/mac80211/main.c      Toke H=C3=B8iland-J=C3=B8rgensen 20=
18-05-25  1660   fail_flows:
6dd47d9754ff05 net/mac80211/main.c      Johannes Berg          2019-11-05  =
1661  	ieee80211_led_exit(local);
42935ecaf4e784 net/mac80211/main.c      Luis R. Rodriguez      2009-07-29  =
1662  	destroy_workqueue(local->workqueue);
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1663   fail_workqueue:
11ba964d4f9366 net/mac80211/main.c      Johannes Berg          2009-08-19  =
1664  	kfree(local->int_scan_req);
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1665  	return result;
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1666  }
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1667  EXPORT_SYMBOL(ieee80211_register_hw);
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc              2007-05-05  =
1668 =20

:::::: The code at line 1650 was first introduced by commit
:::::: 2b2c009ecf71f4c66ff8420b63dddbc9737e04e3 mac80211: Add support for h=
ardware ARP query filtering

:::::: TO: Juuso Oikarinen <juuso.oikarinen@nokia.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
