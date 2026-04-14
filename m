Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F141A239A;
	Tue, 14 Apr 2026 01:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776129779; cv=none; b=uhdNvMWo4aR7SFaaZRoFXfP5f2oTp/f5CIyPdr3YrF88253NB+l8Bg8nF5kXvwV1nWamTrAA3SMFVqrhS7ck6WdvjE9B05Z+yraLL14/R58mIeGlfzyL7DZ5yiGdBU8HDfo/6ztqYB6KG0aEEQ+5mXoykIC3YnNR56aIXpOv4Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776129779; c=relaxed/simple;
	bh=AtH9NMMyIU4NFxfKZTP2MWOC50or4PV41WVgn51roc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g9oBGEQ/hqAbTtU4LdCJJi6Mz3GwtZ0shu7ewigU2zXQt0u3bUAsPateK12xFHrcETyviS0m3SPMbQ2bHbPOgUQ12tlsSa8iWo4iCFeYEe7w+mQKAkch/F0z/EQW/8delluheCmaUakPX4VVS7iKcy46hZVbcKMuFG0gbUR5Cns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlEpzwoR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlEpzwoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776129777; x=1807665777;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AtH9NMMyIU4NFxfKZTP2MWOC50or4PV41WVgn51roc4=;
  b=dlEpzwoROp6x6tgBa27lvDt0baZPu8P7B4rrc6AVJkJWsGvkliciym+m
   s34a3u0HxlTOsKMsYaWysX7usjfTpuMFzS9tEdqPi6oMihlv9IEQQbYRB
   1qTe7nhWAD2jUbp3vNaqCKp1fMs6KncJBPc+KXpUNlDfNjQElJuviXcfX
   UvJaWFZDCZn7mqKwmFM0E5GtKWY3BNZTgV24TrWEXRi8NthC6urORxZgr
   OiRMrqWTOFunOz8cY7NmFJgJz0gg5I4IBdbwQYcjAmMUHtOv7Ox0taHGr
   oxXAJnJWnbxKK6yW0tBak2FqewB+Yk6L2MKGMa6qLorEFGtsQqVEcU4sH
   g==;
X-CSE-ConnectionGUID: rzX69QhdSn61cvxw7L14GA==
X-CSE-MsgGUID: D79h+teDSLeXTbxQWA5j7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88523435"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="88523435"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 18:22:56 -0700
X-CSE-ConnectionGUID: PlXe79UNQ6aW3at6AleUxw==
X-CSE-MsgGUID: 2ywIx/JZT0iwtufJUayT4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="234335829"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 13 Apr 2026 18:22:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCSUO-000000000Gl-0onJ;
	Tue, 14 Apr 2026 01:22:52 +0000
Date: Tue, 14 Apr 2026 03:22:49 +0200
From: kernel test robot <lkp@intel.com>
To: "Pablo Martin-Gomez" <pmartin-gomez@freebox.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: include/linux/ieee80211-eht.h:1138:18: error: use of
 undeclared identifier 'IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_256US'
Message-ID: <202604140301.5LUR4ruV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel-lab-lkp/linux/commits/Pablo-Martin-Gomez/w=
ifi-Remove-invalid-128TU-transition-timeout-constant/20260413-194835
head:   61f7ec5db10fc67eca270c36d5d0a305ad4ae302
commit: 274ef51c760e8aa7814ed480bcc56ee6fbdd546a wifi: Rename EMLSR delay c=
onstants and add EMLMR helpers and definitions
date:   14 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260414/2026=
04140301.5LUR4ruV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260414/202604140301.5LUR4ruV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604140301.5LUR4ruV-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from net/mac80211/main.c:11:
   In file included from include/net/mac80211.h:20:
   In file included from include/linux/ieee80211.h:2851:
>> include/linux/ieee80211-eht.h:1138:18: error: use of undeclared identifi=
er 'IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_256US'
    1138 |             pad_delay > IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_25=
6US)
         |                         ^
>> include/linux/ieee80211-eht.h:1188:25: error: use of undeclared identifi=
er 'IEEE80211_EML_CAP_EMLMR_SUPP'
    1188 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^
>> include/linux/ieee80211-eht.h:1200:18: error: use of undeclared identifi=
er 'IEEE80211_EML_CAP_EMLMR_PADDING_DELAY_256US'
    1200 |             pad_delay > IEEE80211_EML_CAP_EMLMR_PADDING_DELAY_25=
6US)
         |                         ^
   include/linux/ieee80211-eht.h:1218:25: error: use of undeclared identifi=
er 'IEEE80211_EML_CAP_EMLMR_SUPP'
    1218 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^
   4 errors generated.
--
   In file included from net/mac80211/eht.c:8:
   In file included from net/mac80211/driver-ops.h:12:
   In file included from include/net/mac80211.h:20:
   In file included from include/linux/ieee80211.h:2851:
>> include/linux/ieee80211-eht.h:1138:18: error: use of undeclared identifi=
er 'IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_256US'
    1138 |             pad_delay > IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_25=
6US)
         |                         ^
>> include/linux/ieee80211-eht.h:1188:25: error: use of undeclared identifi=
er 'IEEE80211_EML_CAP_EMLMR_SUPP'
    1188 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^
>> include/linux/ieee80211-eht.h:1200:18: error: use of undeclared identifi=
er 'IEEE80211_EML_CAP_EMLMR_PADDING_DELAY_256US'
    1200 |             pad_delay > IEEE80211_EML_CAP_EMLMR_PADDING_DELAY_25=
6US)
         |                         ^
   include/linux/ieee80211-eht.h:1218:25: error: use of undeclared identifi=
er 'IEEE80211_EML_CAP_EMLMR_SUPP'
    1218 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^
>> net/mac80211/eht.c:207:8: error: use of undeclared identifier 'IEEE80211=
_EML_CAP_EMLSR_PADDING_DELAY_256US'
     207 |                             IEEE80211_EML_CAP_EMLSR_PADDING_DELA=
Y_256US)
         |                             ^
   5 errors generated.
--
   In file included from eht.c:8:
   In file included from ./driver-ops.h:12:
   In file included from include/net/mac80211.h:20:
   In file included from include/linux/ieee80211.h:2851:
>> include/linux/ieee80211-eht.h:1138:18: error: use of undeclared identifi=
er 'IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_256US'
    1138 |             pad_delay > IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_25=
6US)
         |                         ^
>> include/linux/ieee80211-eht.h:1188:25: error: use of undeclared identifi=
er 'IEEE80211_EML_CAP_EMLMR_SUPP'
    1188 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^
>> include/linux/ieee80211-eht.h:1200:18: error: use of undeclared identifi=
er 'IEEE80211_EML_CAP_EMLMR_PADDING_DELAY_256US'
    1200 |             pad_delay > IEEE80211_EML_CAP_EMLMR_PADDING_DELAY_25=
6US)
         |                         ^
   include/linux/ieee80211-eht.h:1218:25: error: use of undeclared identifi=
er 'IEEE80211_EML_CAP_EMLMR_SUPP'
    1218 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^
   eht.c:207:8: error: use of undeclared identifier 'IEEE80211_EML_CAP_EMLS=
R_PADDING_DELAY_256US'
     207 |                             IEEE80211_EML_CAP_EMLSR_PADDING_DELA=
Y_256US)
         |                             ^
   5 errors generated.


vim +/IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_256US +1138 include/linux/ieee8=
0211-eht.h

86bc0c662322b4 Johannes Berg      2025-11-05  1113 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1114  /**
86bc0c662322b4 Johannes Berg      2025-11-05  1115   * ieee80211_emlsr_pad_=
delay_in_us - Fetch the EMLSR Padding delay
86bc0c662322b4 Johannes Berg      2025-11-05  1116   *	in microseconds
86bc0c662322b4 Johannes Berg      2025-11-05  1117   * @eml_cap: EML capabi=
lities field value from common info field of
86bc0c662322b4 Johannes Berg      2025-11-05  1118   *	the Multi-link eleme=
nt
86bc0c662322b4 Johannes Berg      2025-11-05  1119   * Return: the EMLSR Pa=
dding delay (in microseconds) encoded in the
86bc0c662322b4 Johannes Berg      2025-11-05  1120   *	EML Capabilities fie=
ld
86bc0c662322b4 Johannes Berg      2025-11-05  1121   */
86bc0c662322b4 Johannes Berg      2025-11-05  1122 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1123  static inline u32 ieee8=
0211_emlsr_pad_delay_in_us(u16 eml_cap)
86bc0c662322b4 Johannes Berg      2025-11-05  1124  {
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1125  	u32 emlsr_supp =3D
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1126  		u16_get_bits(eml_cap,=
 IEEE80211_EML_CAP_EMLSR_SUPP);
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1127 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1128  	if (!emlsr_supp)
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1129  		return 0;
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1130 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1131  	/* IEEE Std 802.11be-2=
024 Table 9-417i=E2=80=94Encoding of the EMLSR
86bc0c662322b4 Johannes Berg      2025-11-05  1132  	 * Padding Delay subfi=
eld.
86bc0c662322b4 Johannes Berg      2025-11-05  1133  	 */
86bc0c662322b4 Johannes Berg      2025-11-05  1134  	u32 pad_delay =3D u16_=
get_bits(eml_cap,
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1135  				     IEEE80211_EML_=
CAP_EML_PADDING_DELAY);
86bc0c662322b4 Johannes Berg      2025-11-05  1136 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1137  	if (!pad_delay ||
86bc0c662322b4 Johannes Berg      2025-11-05 @1138  	    pad_delay > IEEE80=
211_EML_CAP_EMLSR_PADDING_DELAY_256US)
86bc0c662322b4 Johannes Berg      2025-11-05  1139  		return 0;
86bc0c662322b4 Johannes Berg      2025-11-05  1140 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1141  	return 32 * (1 << (pad=
_delay - 1));
86bc0c662322b4 Johannes Berg      2025-11-05  1142  }
86bc0c662322b4 Johannes Berg      2025-11-05  1143 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1144  /**
86bc0c662322b4 Johannes Berg      2025-11-05  1145   * ieee80211_emlsr_tran=
s_delay_in_us - Fetch the EMLSR Transition
86bc0c662322b4 Johannes Berg      2025-11-05  1146   *	delay in microseconds
86bc0c662322b4 Johannes Berg      2025-11-05  1147   * @eml_cap: EML capabi=
lities field value from common info field of
86bc0c662322b4 Johannes Berg      2025-11-05  1148   *	the Multi-link eleme=
nt
86bc0c662322b4 Johannes Berg      2025-11-05  1149   * Return: the EMLSR Tr=
ansition delay (in microseconds) encoded in the
86bc0c662322b4 Johannes Berg      2025-11-05  1150   *	EML Capabilities fie=
ld
86bc0c662322b4 Johannes Berg      2025-11-05  1151   */
86bc0c662322b4 Johannes Berg      2025-11-05  1152 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1153  static inline u32 ieee8=
0211_emlsr_trans_delay_in_us(u16 eml_cap)
86bc0c662322b4 Johannes Berg      2025-11-05  1154  {
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1155  	u32 emlsr_supp =3D
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1156  		u16_get_bits(eml_cap,=
 IEEE80211_EML_CAP_EMLSR_SUPP);
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1157 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1158  	if (!emlsr_supp)
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1159  		return 0;
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1160 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1161  	/* IEEE Std 802.11be-2=
024 Table 9-417j=E2=80=94Encoding of the EMLSR
86bc0c662322b4 Johannes Berg      2025-11-05  1162  	 * Transition Delay su=
bfield.
86bc0c662322b4 Johannes Berg      2025-11-05  1163  	 */
86bc0c662322b4 Johannes Berg      2025-11-05  1164  	u32 trans_delay =3D
86bc0c662322b4 Johannes Berg      2025-11-05  1165  		u16_get_bits(eml_cap,
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1166  			     IEEE80211_EML_C=
AP_EML_TRANSITION_DELAY);
86bc0c662322b4 Johannes Berg      2025-11-05  1167 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1168  	/* invalid values also=
 just use 0 */
86bc0c662322b4 Johannes Berg      2025-11-05  1169  	if (!trans_delay ||
86bc0c662322b4 Johannes Berg      2025-11-05  1170  	    trans_delay > IEEE=
80211_EML_CAP_EMLSR_TRANSITION_DELAY_256US)
86bc0c662322b4 Johannes Berg      2025-11-05  1171  		return 0;
86bc0c662322b4 Johannes Berg      2025-11-05  1172 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1173  	return 16 * (1 << (tra=
ns_delay - 1));
86bc0c662322b4 Johannes Berg      2025-11-05  1174  }
86bc0c662322b4 Johannes Berg      2025-11-05  1175 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1176  /**
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1177   * ieee80211_emlmr_pad_=
delay_in_us - Fetch the EMLMR Padding delay
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1178   *	in microseconds
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1179   * @eml_cap: EML capabi=
lities field value from common info field of
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1180   *	the Multi-link eleme=
nt
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1181   * Return: the EMLMR Pa=
dding delay (in microseconds) encoded in the
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1182   *	EML Capabilities fie=
ld
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1183   */
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1184 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1185  static inline u32 ieee8=
0211_emlmr_pad_delay_in_us(u16 eml_cap)
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1186  {
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1187  	u32 emlmr_supp =3D
274ef51c760e8a Pablo Martin-Gomez 2026-04-09 @1188  		u16_get_bits(eml_cap,=
 IEEE80211_EML_CAP_EMLMR_SUPP);
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1189 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1190  	if (!emlmr_supp)
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1191  		return 0;
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1192 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1193  	/* IEEE Std 802.11be-2=
024 Table 9-417k=E2=80=94Encoding of the EMLMR
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1194  	 * Padding Delay subfi=
eld.
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1195  	 */
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1196  	u32 pad_delay =3D u16_=
get_bits(eml_cap,
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1197  				     IEEE80211_EML_=
CAP_EML_PADDING_DELAY);
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1198 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1199  	if (!pad_delay ||
274ef51c760e8a Pablo Martin-Gomez 2026-04-09 @1200  	    pad_delay > IEEE80=
211_EML_CAP_EMLMR_PADDING_DELAY_256US)
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1201  		return 0;
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1202 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1203  	return 32 * (1 << (pad=
_delay - 1));
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1204  }
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1205 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
