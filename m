Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BB810E8
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 05:38:42 +0000 (UTC)
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 23T5UV0R0003909, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 23T5UV0R0003909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Apr 2022 13:30:31 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 13:30:31 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 13:30:31 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::34e7:ab63:3da4:27c6]) by
 RTEXMBS04.realtek.com.tw ([fe80::34e7:ab63:3da4:27c6%5]) with mapi id
 15.01.2308.021; Fri, 29 Apr 2022 13:30:31 +0800
From: Pkshih <pkshih@realtek.com>
To: kernel test robot <lkp@intel.com>, "kvalo@kernel.org" <kvalo@kernel.org>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "kbuild-all@lists.01.org"
	<kbuild-all@lists.01.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: [PATCH 15/15] rtw89: 8852c: add 8852ce to Makefile and Kconfig
Thread-Topic: [PATCH 15/15] rtw89: 8852c: add 8852ce to Makefile and Kconfig
Thread-Index: AQHYWTevDaEDmvkQB06rbly2/np5Fa0FjE4AgADUjrA=
Date: Fri, 29 Apr 2022 05:30:31 +0000
Message-ID: <ba7dddf5224746daaaa4db7e3b9637ed@realtek.com>
References: <20220426063235.41650-16-pkshih@realtek.com>
 <202204290830.slUaIhad-lkp@intel.com>
In-Reply-To: <202204290830.slUaIhad-lkp@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/4/29_=3F=3F_01:55:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled


> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Friday, April 29, 2022 8:46 AM
> To: Pkshih <pkshih@realtek.com>; kvalo@kernel.org
> Cc: llvm@lists.linux.dev; kbuild-all@lists.01.org; linux-wireless@vger.ke=
rnel.org
> Subject: Re: [PATCH 15/15] rtw89: 8852c: add 8852ce to Makefile and Kconf=
ig
>=20
> Hi Ping-Ke,
>=20
> I love your patch! Perhaps something to improve:
>=20
> [auto build test WARNING on wireless-next/main]
> [also build test WARNING on next-20220428]
> [cannot apply to wireless/main v5.18-rc4]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>=20
> url:
> https://github.com/intel-lab-lkp/linux/commits/Ping-Ke-Shih/rtw89-8852c-a=
dd-RFK-and-then-enable-8852ce
> -in-Makefile-and-Kconfig/20220426-143456
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless=
-next.git main
> config: i386-allmodconfig
> (https://download.01.org/0day-ci/archive/20220429/202204290830.slUaIhad-l=
kp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project
> c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O
> ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/5aaabdd4d9ac433ed=
14c1c02147c2609827739d2
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review
> Ping-Ke-Shih/rtw89-8852c-add-RFK-and-then-enable-8852ce-in-Makefile-and-K=
config/20220426-143456
>         git checkout 5aaabdd4d9ac433ed14c1c02147c2609827739d2
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Di386
> SHELL=3D/bin/bash drivers/net/wireless/realtek/rtw89/
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> drivers/net/wireless/realtek/rtw89/rtw8852c.c:2640:2: warning: result =
of comparison of constant
> 18446744073709551615 with expression of type 'typeof (_Generic((__msk), c=
har: (unsigned char)0, unsigned
> char: (unsigned char)0, signed char: (unsigned char)0, unsigned short: (u=
nsigned short)0, short: (unsigned
> short)0, unsigned int: (unsigned int)0, int: (unsigned int)0, unsigned lo=
ng: (unsigned long)0, long:
> (unsigned long)0, unsigned long long: (unsigned long long)0, long long: (=
unsigned long long)0, default:
> (__msk)))' (aka 'unsigned long') is always false [-Wtautological-constant=
-out-of-range-compare]
>            __write_ctrl(R_AX_PWR_RATE_CTRL, B_AX_FORCE_PWR_BY_RATE_VALUE_=
MASK,
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>    drivers/net/wireless/realtek/rtw89/rtw8852c.c:2621:13: note: expanded =
from macro '__write_ctrl'
>            u32 _wrt =3D FIELD_PREP(__msk, _val);                     \
>                       ^~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
>                    __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");  =
  \
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/bitfield.h:71:53: note: expanded from macro '__BF_FIELD_=
CHECK'
>                    BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >   =
  \
>                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~=
~~~
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/compiler_types.h:352:22: note: expanded from macro 'comp=
iletime_assert'
>            _compiletime_assert(condition, msg, __compiletime_assert_, __C=
OUNTER__)
>            ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
>    include/linux/compiler_types.h:340:23: note: expanded from macro '_com=
piletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>            ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler_types.h:332:9: note: expanded from macro '__com=
piletime_assert'
>                    if (!(condition))                                     =
  \
>                          ^~~~~~~~~

We add 'BUILD_BUG_ON((__msk & __en) !=3D 0);' to prevent coding error durin=
g
development. The __msk and __en in the expression are constant and expected
no intersection of these two bit masks. Since we have verified this code,
I think I can send a patch to remove the BUILD_BUG_ON() from this macro.

Thank you
Ping-Ke

