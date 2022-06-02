Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091FEA4B
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 14:11:58 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252CMgHe022372;
	Thu, 2 Jun 2022 14:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=trl8ohioISurFvCc1QTcnyBzu7pp8TU2WVRckTZTsNU=;
 b=SzBfOW0bPT1miL+qps7yumyf0Oy15dYzVF3eSDYBW62Y0DPpfKYhRU7caoRRtdrXFrp5
 Hrsd6yNj7kX+JVI2yJJk6rpdwha2wKkzLUSU4QwRVrpfmFqlITQOSZH6LTYUX0LDnKlv
 kE7vG/xTf6TQWW/b3cEqIHvcqCTSGW6XMvMJITD4XRWzitxn2xpEF40d3iegMBtSb2Gd
 05f/Yjbb3XO9lhKRcrmvd1jPkh8xoAv/vn3f7osmXGxWDe8fKu0TJ9ZLiwH6TxUxp7u2
 /pbdybF8InqOmbLntHBfp3RSn8EKs+esTq9hmCdQxb10rcxZSakoOsKfLZQOCo4TlERr Rg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gew5h08f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jun 2022 14:11:54 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 252E6I4P014020;
	Thu, 2 Jun 2022 14:11:53 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gc8hy7mcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jun 2022 14:11:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+8dUh8mYrJmUH4iPZmmmOBMyCwFc6Q15zDUyDhgzF4B2reMQk1bSg2e+iSPbVhPSBleypSuSxFZHchLZ9OUEXxwfjiqp4hZP0KwKrBUFtGTcj2VFnIthFipMBjj7kQfHmegJGCmzeEaSXgcItTWDtqwdAp6kNqAKMIntgpWmSzbSqK7Y2zraLfNrBp6FP6EXOpbTbNBriDwNvySOFYWiS/6NbuhIH58iCTTmpd3YRoaoJFyPe8uSl2DLZVFw3J9jRtMDZ3OUWA99PKqBylkLWW/4ewKcGl/DubAvoPrTzBoCukplaAKwNmmrInssTEp/GrdGmSWmLiZHt+AyxvW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trl8ohioISurFvCc1QTcnyBzu7pp8TU2WVRckTZTsNU=;
 b=MRr9/VGhqN7f0Soa8BSMF852F3eRjzgKq9lnaVkumjf736vsQmSGAbKiOHib6Sp18KHz63tHSnbzyR4R0z/mAOwk1bYEPDGKc5oC9e5wfW1xWPfhLUcH/RivJw2pymz35RFhNvzIVYjOAuQY1Cf8aj9/Q6hwwotya/hTQI6dKLXOL8fB6ptlUeDjkLXVy0tzvd91gFL47W7N78XqnbOy8x+BnOAEKege1nowXjGp41jCYaSI5aR24h9uYdpQSv7MVCUiTuufsPwIy+vfznY6sxeIaPvt0V4EMHSLOx6KfiXGyIXgSPPGBJ32QPR9beUGe+pbrJUJqehPt4NIPS5H3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trl8ohioISurFvCc1QTcnyBzu7pp8TU2WVRckTZTsNU=;
 b=Pdl5IoE/9GObgtXd71kAfUlIKtDJLn4XcmsTmzuOJE0mZlXAVLy6jfxQE6XKByojAz+vkk4TGaTW5Zj91yx8z9w7Hj7gL60cmiWCORxPwsMX52Op+wGM/dr7F2xawJIbiGU83GunxCV50RdCPzQ5Q67JX06LxjpkULMfYPNgkHg=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by PH7PR10MB5854.namprd10.prod.outlook.com (2603:10b6:510:127::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 14:11:51 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::e1df:2e42:6674:313e]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::e1df:2e42:6674:313e%7]) with mapi id 15.20.5293.015; Thu, 2 Jun 2022
 14:11:51 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: kernel test robot <lkp@intel.com>,
        "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [linux-next:master 14545/14705] mm/nommu.c:1081:28: warning:
 variable 'vma' is uninitialized when used here
Thread-Topic: [linux-next:master 14545/14705] mm/nommu.c:1081:28: warning:
 variable 'vma' is uninitialized when used here
Thread-Index: AQHYdoQn4zqDEOR1uEOnjASBXUDaC608H7mAgAAIoIA=
Date: Thu, 2 Jun 2022 14:11:51 +0000
Message-ID: <20220602141145.i44sjd3mxvqaofvt@revolver>
References: <202206022121.RYk2Zgc9-lkp@intel.com>
 <20220602134053.cyuvw7ema33voakf@revolver>
In-Reply-To: <20220602134053.cyuvw7ema33voakf@revolver>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 214b497f-40bc-453d-6907-08da44a1d6f1
x-ms-traffictypediagnostic: PH7PR10MB5854:EE_
x-microsoft-antispam-prvs: 
 <PH7PR10MB58546845E61CD7597086FA4DFDDE9@PH7PR10MB5854.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 x/iJxunF1KCBuyl0JccoKbP0nXAGh3YBIRVhFsvrfWziG56nvIGUgKMeLaGIAPn6y6arpnu1dBE3diMm6ELUU+1PcClesER9EGNV8kTybGNbde3EzumzPwzOLTOxL/Jlx8S6yOKc1urwbLVtsj3jp+65plVYP6NPmz+zKS5F6rvHfJmVQqknuZAiKoUxBB5l1rgYP1V8r7vzVbWDM2ipbNBPEfX7CVf2qMlb3T8lGfiF4yHaF1AVNSZ/j/eMg3/5oizveKbW6WXN3xlN5V7VsF90lSTGqSl8wmtlxh/p48HSkCkFF69/GIRUKqhYxxdVWacpuZ9M5L3OJGGC7QrhpsFGKXw0gQryCy4nVyBlPklj6yzIHdhSmNEG7uSrHTPE2REaneOSMuVvldHdsQ67AcY7z+VnNKA7N33DOVgR89so6Tgam1TSPSpmdWiLCg9RL0ArGbcR/hK2hv+WwXimy9O3QyodJ7iotQOKqJ4QM0bEdb1KxfROFiTbJ2rtEsDjRpOhpe/NLHMO8GRXIDVcwMPd4POhXOsTdkZwq4HvalFwgvhn+2V5dkcdTXP3HW5cK48qqZ7Gw//OzUzsJwPwO3DJYYBRkyntMBn7ahDc87oQLLyTbhniUVmgG1YVyFeJruoQ2BRylNym01RFHBi38ngjcncr070pCk9jw7sbkICTe7tGlVKmm3TAXrHbTpA9uI3BGqJR4iDAwY4O/YokGR1QYrmRXjBxKqdzLPvKAfHHSXwlOBVmsOT84aWBD7V9J03sjy4urqoGUnjN18NIRFD2eqs7REaC5m8mPRCO1GYNF6pCDQ+vxhR0oHqtnPUkTk3Y9uT+5Xe7ed0YqQN/ug==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(8676002)(76116006)(91956017)(66476007)(66946007)(66556008)(64756008)(66446008)(86362001)(71200400001)(38070700005)(122000001)(99936003)(5660300002)(966005)(6486002)(38100700002)(110136005)(508600001)(316002)(1076003)(186003)(9686003)(26005)(6506007)(2906002)(44832011)(6512007)(8936002)(33716001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?feZckpQM4hRNFuRP5g27Aiz34eflJMg4Y9r5bOA6Au2c33DUN6LmXmaTN+zE?=
 =?us-ascii?Q?BjrpOPZTxlVTIWfCN6HH81XLBLnssC/djIcGIITiIQhBf5kVpAmUzugvbOJX?=
 =?us-ascii?Q?tGGABfHnuV+/28/ewpgdmizBrFY8l1hJLMaT5asBjyTnvuMC62OkaV7uoH1w?=
 =?us-ascii?Q?DXb/fy+7nwEPYyDTdq7y9h7ke+8vM81Q+3sBdoKpwJhWuJ+xUeq4J0Rc7BfI?=
 =?us-ascii?Q?IvnLT94ZWwewg4ATHo1pB8nEikWubwhZEj4TZPnjBLFSXSoQt8zPPhnu2ES/?=
 =?us-ascii?Q?9U2NAzIb1MAa+4BBmnCI1E8wwwm4iGQZvGOZtyw7I3vULgagPNowMs57mt+l?=
 =?us-ascii?Q?cUG591C3RkusKUVz7BY9njF4GXSe/YwFNm9tricKNQROqnb+vhUXfw+ufLPa?=
 =?us-ascii?Q?t3yox9x4DaAMl2srLRtFPK8l8dPLnGug8YoZuXwOTAYIBLkwuEkDKw1U/w8r?=
 =?us-ascii?Q?cj3YEp3MuSjl5XC4OqrcZDgvRhr5rmeqAkP8HXQ27DVUYo244NhquYmk3kX8?=
 =?us-ascii?Q?JqRMV2VHM8DhuxzPmPexE2PEPv24FViaiulU7tw5gnJ4PldtuhPJLUN1IWis?=
 =?us-ascii?Q?zuvuoXW0HLU+RYjKGmlryvvOTRPBq34pOk0eeWtGqB9o/WLMEDtMBQN21WKb?=
 =?us-ascii?Q?yVz98ApPCzDA59ji/0hZcau0D6PcyU3XdrDm/lPqOSHf7rFCztemic8sej0C?=
 =?us-ascii?Q?IEwyNUu9w3m481YXrcYXeLp6cNk81KQ/7QEJf70tWPNhVc5oH+JTVghsc1XQ?=
 =?us-ascii?Q?IrN6wCyUjTTPHxea8eSHXJVByGGqpz2b+gtNjuFGKqvsrARI5N66WIVYW4sL?=
 =?us-ascii?Q?09VLkolPe9HCDXPYoXRgK1CJ5oe6c4bQzO18LErK8ffDPkWGaoQ85E0+1p/A?=
 =?us-ascii?Q?NP5gK++CmNr8AqpgMWJVjDR8In0J1tR0qaCSjzZrpWbWcAPlNZjp7lg8XmTU?=
 =?us-ascii?Q?vgR+KAwuQiIPG/ldnYVi/244vv7vFw08mozVk2zF50WF2E0cJoWui7Fykhv+?=
 =?us-ascii?Q?rqqDZ/7JzjQXInlu/PZnMaxiHoA85iYOtWU38K1QQ0Edh1WFy/n+uvw3XA5j?=
 =?us-ascii?Q?uv6+xoh1GCDQCnqKEGNxfHAT29GQYLKWlKW/Fr3ICCaiD0ZHvnSrq3RxYPg0?=
 =?us-ascii?Q?pomQRluz7XuwSeheq4Fghkx84emaYExkAPaSxV2HgsxmejS5ZshUzL0Fr9YL?=
 =?us-ascii?Q?Pv2+0b95mxVMLqF64gTYsQABwMADtR0ULx4ON2T1fkjq5L5uwFjJ0IO9oS67?=
 =?us-ascii?Q?/NrUg6YPofArundL0c4kc/gsoEx8g9ox2M2iSP5/x2d4wDan1GV8DpG+31pJ?=
 =?us-ascii?Q?g3IGx9X9EWV1lUSzg4NpYgQh/+awvLQ7WvJz7AGS2GlB7o7AEhor9xBgmakB?=
 =?us-ascii?Q?jQCLvnpDnQXIXOsvKIBXdpBNgsZIJGlz6zs17JGO5T6Ex/92F2/mNyQeWMhd?=
 =?us-ascii?Q?7Pl6jOrblNPJGgUMTdf3n0ovoy1prsVU26QZG0vuyjEq33NHsty2f0Wn7JIr?=
 =?us-ascii?Q?hcmJq8DPh1AhEG5b6i8jvoGAuvKfoedzjzReJGBTahIe9jP6z01EL4eN8nNF?=
 =?us-ascii?Q?oX/ECn26A/2nm4LnBo+3vVf/G1X0Ujocn9e6UIAMFfJvOQS1ohX6aiEi/dJL?=
 =?us-ascii?Q?5aBdRwpt2JcKx3A9Oj67vnXU49/R14ThOEGHr/dQ2JFKt11IkZbbNDEiVqzc?=
 =?us-ascii?Q?CU6v+lIaR7r1s3KgPCWWB0blPPeuoAsV5dzT3PTGrdT1Ua4Z1O20WLjrMOhb?=
 =?us-ascii?Q?OyJjAlzhj03OBrhtJr7hTMzhLqkh1N4=3D?=
Content-Type: multipart/mixed;
	boundary="_002_20220602141145i44sjd3mxvqaofvtrevolver_"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214b497f-40bc-453d-6907-08da44a1d6f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2022 14:11:51.2446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+yNgOPosTaZXdeLvqtaMQc0sB4xl1m4xFDoZIhUP7kgJG456pQdzizYr6y3NCFps0N6QT4ULpUqYZrsTErJnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5854
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-02_03:2022-06-02,2022-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206020062
X-Proofpoint-ORIG-GUID: jPRcpbKbXyvVZHkse3QFWPphnqwq6ngN
X-Proofpoint-GUID: jPRcpbKbXyvVZHkse3QFWPphnqwq6ngN

--_002_20220602141145i44sjd3mxvqaofvtrevolver_
Content-Type: text/plain; charset="us-ascii"
Content-ID: <07872A1D1B3E2F43A1832EF53B1AA1B1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

* Liam R. Howlett <Liam.Howlett@Oracle.com> [220602 09:40]:
> * kernel test robot <lkp@intel.com> [220602 09:24]:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   2e776ccffa840ce53ee1c21bde54cbe4bc102c3b
> > commit: 32355b99dd92f9751a482463d7e239fa06302bc9 [14545/14705] mm/nommu=
: move preallocations and limit other allocations
> > config: arm-buildonly-randconfig-r004-20220531 (https://download.01.org=
/0day-ci/archive/20220602/202206022121.RYk2Zgc9-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b3=
64c76683f8ef241025a9556300778c07b590c2)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm cross compiling tool for clang build
> >         # apt-get install binutils-arm-linux-gnueabi
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3D32355b99dd92f9751a482463d7e239fa06302bc9
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 32355b99dd92f9751a482463d7e239fa06302bc9
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
W=3D1 O=3Dbuild_dir ARCH=3Darm SHELL=3D/bin/bash
> >=20
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> >=20
> > All warnings (new ones prefixed by >>):
> >=20
> >    mm/nommu.c:593:18: error: incompatible pointer types passing 'struct=
 ma_state **' to parameter of type 'struct ma_state *'; remove & [-Werror,-=
Wincompatible-pointer-types]
> >            prev =3D mas_prev(&mas, 0);
> >                            ^~~~
> >    include/linux/maple_tree.h:468:33: note: passing argument to paramet=
er 'mas' here
> >    void *mas_prev(struct ma_state *mas, unsigned long min);
> >                                    ^
> >    mm/nommu.c:594:12: error: incompatible pointer types passing 'struct=
 ma_state **' to parameter of type 'struct ma_state *'; remove & [-Werror,-=
Wincompatible-pointer-types]
> >            mas_reset(&mas);
> >                      ^~~~
> >    include/linux/maple_tree.h:505:47: note: passing argument to paramet=
er 'mas' here
> >    static inline void mas_reset(struct ma_state *mas)
> >                                                  ^
> > >> mm/nommu.c:1081:28: warning: variable 'vma' is uninitialized when us=
ed here [-Wuninitialized]
> >            if (mas_preallocate(&mas, vma, GFP_KERNEL))
>=20
> mas_preallocate does not currently use this variable, but in the future
> it may be that you are storing a NULL which could affect the
> preallocations as an optimization.  I will fix this by relocating it
> below the vma allocation.

Andrew,

Please find the attached patch to fix up the commit mentioned above
"32355b99dd92f: mm/nommu: move preallocations and limit other
allocations"

Thanks,
Liam



--_002_20220602141145i44sjd3mxvqaofvtrevolver_
Content-Type: text/x-diff;
	name="0001-mm-nommu-Fix-compile-warning-in-do_mmap.patch"
Content-Description: 0001-mm-nommu-Fix-compile-warning-in-do_mmap.patch
Content-Disposition: attachment;
	filename="0001-mm-nommu-Fix-compile-warning-in-do_mmap.patch"; size=2615;
	creation-date="Thu, 02 Jun 2022 14:11:51 GMT";
	modification-date="Thu, 02 Jun 2022 14:11:51 GMT"
Content-ID: <1D9AAB118B257449855701A36C9DC9DD@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSAwZmYzZDFkNmYwYzFkMDQ2NGNjYTAwOGFjYjFhNzUwZDc4YWY0NDFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogIkxpYW0gUi4gSG93bGV0dCIgPExpYW0uSG93bGV0dEBvcmFj
bGUuY29tPg0KRGF0ZTogVGh1LCAyIEp1biAyMDIyIDA5OjQ0OjM4IC0wNDAwDQpTdWJqZWN0OiBb
UEFUQ0hdIG1tL25vbW11OiBGaXggY29tcGlsZSB3YXJuaW5nIGluIGRvX21tYXAoKQ0KDQp2bWEg
aXMgcGFzc2VkIGluIHRvIHByZWFsbG9jYXRlIG5vZGVzIHNpbmNlIHN0b3JpbmcgTlVMTCBjb3Vs
ZCByZXN1bHQgaW4NCmxlc3Mgbm9kZXMgbmVlZGVkIHRoYW4gYW4gYWN0dWFsIHZhbHVlIGJlaW5n
IHN0b3JlZC4gIEZpeCB0aGlzIGJ5IG1vdmluZw0KdGhlIHByZWFsbG9jYXRpb24gY2FsbCB0byBi
ZWxvdyB0aGUgdm1hIGFsbG9jYXRpb24gJiBiZSBzdXJlIHRvIHVuZG8NCm90aGVyIGFsbG9jYXRp
b25zIGluIHRoZSBmYWlsdXJlIHBhdGguDQoNCkFsc28gZml4IHRoZSB0eXBlIGVycm9yIGluIHRo
ZSBzaG9ydC1saXZlZCBsaW5rZWQgbGlzdCBtb2RpZmljYXRpb24uDQoNClJlcG9ydGVkLWJ5OiBr
ZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NClNpZ25lZC1vZmYtYnk6IExpYW0gUi4g
SG93bGV0dCA8TGlhbS5Ib3dsZXR0QG9yYWNsZS5jb20+DQotLS0NCiBtbS9ub21tdS5jIHwgMTQg
KysrKysrKy0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvbW0vbm9tbXUuYyBiL21tL25vbW11LmMNCmluZGV4IGRi
ZDczZTNhOWFkZi4uZjZiMTg3MDkwZDk1IDEwMDY0NA0KLS0tIGEvbW0vbm9tbXUuYw0KKysrIGIv
bW0vbm9tbXUuYw0KQEAgLTU5MCw4ICs1OTAsOCBAQCBzdGF0aWMgdm9pZCBtYXNfYWRkX3ZtYV90
b19tbShzdHJ1Y3QgbWFfc3RhdGUgKm1hcywgc3RydWN0IG1tX3N0cnVjdCAqbW0sDQogDQogCXNl
dHVwX3ZtYV90b19tbSh2bWEsIG1tKTsNCiANCi0JcHJldiA9IG1hc19wcmV2KCZtYXMsIDApOw0K
LQltYXNfcmVzZXQoJm1hcyk7DQorCXByZXYgPSBtYXNfcHJldihtYXMsIDApOw0KKwltYXNfcmVz
ZXQobWFzKTsNCiAJLyogYWRkIHRoZSBWTUEgdG8gdGhlIHRyZWUgKi8NCiAJdm1hX21hc19zdG9y
ZSh2bWEsIG1hcyk7DQogCV9fdm1hX2xpbmtfbGlzdChtbSwgdm1hLCBwcmV2KTsNCkBAIC0xMDc4
LDkgKzEwNzgsNiBAQCB1bnNpZ25lZCBsb25nIGRvX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsDQog
CXZtX2ZsYWdzID0gZGV0ZXJtaW5lX3ZtX2ZsYWdzKGZpbGUsIHByb3QsIGZsYWdzLCBjYXBhYmls
aXRpZXMpOw0KIA0KIA0KLQlpZiAobWFzX3ByZWFsbG9jYXRlKCZtYXMsIHZtYSwgR0ZQX0tFUk5F
TCkpDQotCQlnb3RvIGVycm9yX21hcGxlX3ByZWFsbG9jYXRlOw0KLQ0KIAkvKiB3ZSdyZSBnb2lu
ZyB0byBuZWVkIHRvIHJlY29yZCB0aGUgbWFwcGluZyAqLw0KIAlyZWdpb24gPSBrbWVtX2NhY2hl
X3phbGxvYyh2bV9yZWdpb25famFyLCBHRlBfS0VSTkVMKTsNCiAJaWYgKCFyZWdpb24pDQpAQCAt
MTA5MCw2ICsxMDg3LDkgQEAgdW5zaWduZWQgbG9uZyBkb19tbWFwKHN0cnVjdCBmaWxlICpmaWxl
LA0KIAlpZiAoIXZtYSkNCiAJCWdvdG8gZXJyb3JfZ2V0dGluZ192bWE7DQogDQorCWlmIChtYXNf
cHJlYWxsb2NhdGUoJm1hcywgdm1hLCBHRlBfS0VSTkVMKSkNCisJCWdvdG8gZXJyb3JfbWFwbGVf
cHJlYWxsb2NhdGU7DQorDQogCXJlZ2lvbi0+dm1fdXNhZ2UgPSAxOw0KIAlyZWdpb24tPnZtX2Zs
YWdzID0gdm1fZmxhZ3M7DQogCXJlZ2lvbi0+dm1fcGdvZmYgPSBwZ29mZjsNCkBAIC0xMjYyLDcg
KzEyNjIsNiBAQCB1bnNpZ25lZCBsb25nIGRvX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsDQogCWdv
dG8gZXJyb3I7DQogDQogZXJyb3JfZ2V0dGluZ192bWE6DQotCW1hc19kZXN0cm95KCZtYXMpOw0K
IAlrbWVtX2NhY2hlX2ZyZWUodm1fcmVnaW9uX2phciwgcmVnaW9uKTsNCiAJcHJfd2FybigiQWxs
b2NhdGlvbiBvZiB2bWEgZm9yICVsdSBieXRlIGFsbG9jYXRpb24gZnJvbSBwcm9jZXNzICVkIGZh
aWxlZFxuIiwNCiAJCQlsZW4sIGN1cnJlbnQtPnBpZCk7DQpAQCAtMTI3MCwxMyArMTI2OSwxNCBA
QCB1bnNpZ25lZCBsb25nIGRvX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsDQogCXJldHVybiAtRU5P
TUVNOw0KIA0KIGVycm9yX2dldHRpbmdfcmVnaW9uOg0KLQltYXNfZGVzdHJveSgmbWFzKTsNCiAJ
cHJfd2FybigiQWxsb2NhdGlvbiBvZiB2bSByZWdpb24gZm9yICVsdSBieXRlIGFsbG9jYXRpb24g
ZnJvbSBwcm9jZXNzICVkIGZhaWxlZFxuIiwNCiAJCQlsZW4sIGN1cnJlbnQtPnBpZCk7DQogCXNo
b3dfZnJlZV9hcmVhcygwLCBOVUxMKTsNCiAJcmV0dXJuIC1FTk9NRU07DQogDQogZXJyb3JfbWFw
bGVfcHJlYWxsb2NhdGU6DQorCWttZW1fY2FjaGVfZnJlZSh2bV9yZWdpb25famFyLCByZWdpb24p
Ow0KKwl2bV9hcmVhX2ZyZWUodm1hKTsNCiAJcHJfd2FybigiQWxsb2NhdGlvbiBvZiB2bWEgdHJl
ZSBmb3IgcHJvY2VzcyAlZCBmYWlsZWRcbiIsIGN1cnJlbnQtPnBpZCk7DQogCXNob3dfZnJlZV9h
cmVhcygwLCBOVUxMKTsNCiAJcmV0dXJuIC1FTk9NRU07DQotLSANCjIuMzUuMQ0KDQo=

--_002_20220602141145i44sjd3mxvqaofvtrevolver_--
