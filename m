Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D78274B31;
	Mon, 18 Aug 2025 06:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755498606; cv=fail; b=UA6IC4jltC/M+x+VJ22jN9t4huhkdTtJnLwm69/Caf4Kbsg3ZiTcqpif2zTemy4Gti0qTDPCftr3sbcwcXugVgFJmR2q1Ie+dYCCBDxjKFISKZ7KP1AcOP1l4WNK+9SSRwJPwAfHCM6i0w+vyMZpJIKe8A80hGj/EwOODmzmF9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755498606; c=relaxed/simple;
	bh=UeieQqWmfSxCTyIKjxm+7F+rhrlAhLxG/0E93q6jhdg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eqCmeDEdUDFjPzB8ZikTVtzqkn/i0s5J0sh5gtnSnnFyNKMdMVyY+CFKj9l63XUb2BGxawGjQLRQXGivpN4pUV948XfGl/59jtePmu8SfttsnT41/TvtuzD1ljZbRQ1r/zpPF/frsZhoR4hlAcuovSvtKe12Z3REi+96aIsBuz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3p45qALv; arc=fail smtp.client-ip=40.107.220.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3p45qALv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/aZL98c+YuPhXZergo+mtv/TFpNiceKNN2ZTujgv6vVZwHM3+2jxSR/9UPHdQlvdi13FmesnGO+WUVRc3FamYtIcVo6y3C1gtDHBOeT+ZAY3YPTy8iUbfAhE2ONaZmk/94v5DxgyT1fIVbPzpxWwtGC+IGeXWLOLeBAoz2IYx37Ekg6SV+XskREvjIRsBTPrAounRrywHYjJ/GzMsPoFBUj+2VMx2c3UlvPjDBSmhmJJS4UZsQc7CYBWPHSwwUlRy8lJc6IaPZyTUAK3/KfYBPDWTsXqLt4BgThE7Mcc/nG8BE0k7V7klg72F/bZblbT7eZyXJlyVmQ5k214nRCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlSIOUSqTwNP8QP2plkOKDLt27kpvQaVuB3I9+zJ7tQ=;
 b=Y3hj5AfFu2xxqrSqz6zbzHf82VQRRbVIdXpL2BO1Aqkz+jWFFDjh6nGaBv2auY7DWoRjuqT1uyRi1LFR0M9P1JfLszG0udjTaQpr+Iirild0v2cqstbo70rLRnVbHJO8UJnq5I0YeZYJr/GKEmUh5gxyGtDXqp6LFuEfNlW6my/lZqFP5uuTc12SkzvrXtq04ePEWyN71GIzFGsChEMhtnc3epf5lf2nslnIR5suvAQVQwVD2LVj60SuaCKS9jlO/18fYtbJc48lMqkE8IOISULPQC4MmXUPA4E4bq034rKRJRLvuTusGzOjmuQSVoswLzNtwzseownkB6ZQsUehlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlSIOUSqTwNP8QP2plkOKDLt27kpvQaVuB3I9+zJ7tQ=;
 b=3p45qALvLbSHCy4211JsOWtcYaudC9g0a4AOxcDJfqB4PZ/c2TfmSaYHQNLcay03x43Xpkrv/9JsTBDNAeet/A0ym+pleJa+WfE3FxKQXL49he2HBHZKvO8CkbHc7R+kNM4gKvrlEIU62556lvx/JCmxxVP17a0j4q27EUht0bQ=
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Mon, 18 Aug
 2025 06:30:02 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%5]) with mapi id 15.20.9031.014; Mon, 18 Aug 2025
 06:30:02 +0000
From: RaghavendraKT <Raghavendra.KodsaraThimmappa@amd.com>
To: kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH V3 03/17] mm: Scan the mm and create a migration list
Thread-Topic: [RFC PATCH V3 03/17] mm: Scan the mm and create a migration list
Thread-Index: AQHcDTDjZEFdgtDGmE6wFtJY9qj4rbRkHu4AgAQ06wA=
Date: Mon, 18 Aug 2025 06:30:02 +0000
Message-ID: <cdac0f0f-df1a-4335-9661-701497601b72@amd.com>
References: <20250814153307.1553061-4-raghavendra.kt@amd.com>
 <202508160305.4N7h8utZ-lkp@intel.com>
In-Reply-To: <202508160305.4N7h8utZ-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-18T06:30:02.0320000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-exchange-imapappendstamp: PH7PR12MB5805.namprd12.prod.outlook.com
 (15.20.9031.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5805:EE_|PH7PR12MB6835:EE_
x-ms-office365-filtering-correlation-id: 9062e6a7-afa1-4eca-3b2c-08ddde20a9b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?nsqCGmfCwftMUnipcA2EJ4ORmn0k0TV/iYqLiu0jhE0NQED1WtdVmdVjYA?=
 =?iso-8859-1?Q?Sjp1GC6jWoqfolpRg65hRaFaXtVvmXVyr9Z1u4w1Uwbjj54ioH5dtDrsfS?=
 =?iso-8859-1?Q?0Y+BodLimf1ufm/v+EzPPFm7Vj8m3xEBSWNhWlhKPZrTP877gmjhzqd5R3?=
 =?iso-8859-1?Q?3uezERyvHNCYaNmxZyR3rCJ1g6xB0DO9vrp3CPgenlz19eu63L2cbW15Pa?=
 =?iso-8859-1?Q?fSmikp7UAphhyHsQ0qdaU63mQzqBRkh83fR9amPwByOmjemFDEbDqRlejl?=
 =?iso-8859-1?Q?H+iY3wFBFXOCR3McwJcY4vuixYiXJ7yX8jd/cP4sEi5sfGCiJgfAwluHsF?=
 =?iso-8859-1?Q?wy0uEmljOKK9nPBokkJCPNa8/FJvAvZ5WSn89C3UQNusRqAL72C71hDz+z?=
 =?iso-8859-1?Q?bO6vSBMjf0PMtxhAz2WaQroKf0aeNDjwJF7hpfh4jo+Y7eXzLHX7cFv8Ei?=
 =?iso-8859-1?Q?cHtUjjgPBkYkhB+EbGE1ZpyN3ln0Numt7LJvd1WBGS8UemRRNd7yZ2J4+k?=
 =?iso-8859-1?Q?j9nB2LDJbOzobBRwZ6GLcMIBmc2BaDqi9baAIZZOfbT6IB71luGO1C4VV/?=
 =?iso-8859-1?Q?P8OGiY/Ou7rlU3qQK/x5KIFt69gXtOquwznaZ1h2Zb+gKJbx0Hs0v7qYrV?=
 =?iso-8859-1?Q?p9EJ3lsFr5M3+EtgL7o7DRrHOm7ecJCs4xMWgLu7R0OoE5A6e72uDh+L2z?=
 =?iso-8859-1?Q?NyagpwdYhLNg3FUxe/uSBlrO+yMdsddGaEUWDlmsZiYF1op/GplNkUzkIw?=
 =?iso-8859-1?Q?EiB8XqHtzt/ogkjygxA6u4zRykxzrxIStVJKiE/NVaFeOwfSMDDwIxNQim?=
 =?iso-8859-1?Q?Sj2qsZc6XCgejMt7AzuPYyiLkuJ1tjPkeQTYkpaCfrt0KYvPO3j6J8H0Pf?=
 =?iso-8859-1?Q?53rPtY6ORfwjUpAqj0z1ZPhzffKBNC6eHCTF3PPjVHqkYr5KS07nsHWhWC?=
 =?iso-8859-1?Q?73O6WD5e/6l9xx1f5rOzibRQRudUBJj90At6PU3NHbXTlmRWu1BiJ6tPm3?=
 =?iso-8859-1?Q?SU/yLwDVIqoYagL9bb9kABH0sYEYz5Z2LbuYy2gg6B39vJ8OXQ9r5CLTJx?=
 =?iso-8859-1?Q?L3Rw12CzDc+Eio2vtexrdRA1MlERUc7w1KO8PYL/at82k/wg6zN6KXFQZu?=
 =?iso-8859-1?Q?qvhqgKDDyJFem+QHQ5JUbhRXIDimcut22n/oZjf7SWmDIubpdHkENmMWEx?=
 =?iso-8859-1?Q?iUTZTv2NDchGKIzDVvEJKXaiiI1l3ol1NOSl0z+nDcSS7dYWStypKJugeR?=
 =?iso-8859-1?Q?GZJW7R2uiYopl+qPh65R1TODgee1CTDMDGQp5uPmXqxoTpFHK//Ruoq5Q2?=
 =?iso-8859-1?Q?Q+upZc+JStIIq15PGcUg+ylTBc7dyggiiJ/aPPAP5jNDTZDJ4rOSgek2Pw?=
 =?iso-8859-1?Q?mL10keSeBD655g3M8xtzj9BZ2nbRSujwCpD+lA5mm8DTWd0XQTz41QxuXN?=
 =?iso-8859-1?Q?enlVIMFSoqHEF4eS8+D9oORPhop1IZuQy3GPeP02JDtYSjOfcXOJSM77im?=
 =?iso-8859-1?Q?rznwUKReskCt9FUyabrCLF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/DHkcJS7//5zi3JiyCItGOX9LDQ9jSXQF1SoIsOwuNPp5pZYnak72jVbIJ?=
 =?iso-8859-1?Q?F2UxHpTgjjzuyafL79v5i1PxO571vrSpmlT4TibsgDqWC2B05T5Pnt9jN2?=
 =?iso-8859-1?Q?je+KIcqkpZvQdcUCKyYOlz8oWaA+UKyHi08tgf7h9/951C9bi+2PUEM+5Y?=
 =?iso-8859-1?Q?qeMVVsFyGo+nQlzILQ5n7lN6iQjvO49VUDGc48wRh6g9xjFLW3KbjJDbwY?=
 =?iso-8859-1?Q?pqd3s1vM1/3vhY88R5cWX2r0fp3yMl754uMF+5vv1nE7HShbHBrDRgqMAv?=
 =?iso-8859-1?Q?vI58fijAV1TJtoqDD5wFU33YPG5gnihfSZnEU0k2bfXNO4xsbihXEBfNtX?=
 =?iso-8859-1?Q?q/lG58Zj8T2noTiX+kNOKwqsxo1T2WA8V+XGiaNjkEulBJGuC7VeJ2kKbi?=
 =?iso-8859-1?Q?Domi7UG5iM3bPKk52HuI2XSETK5feDeEL53OmAlTzYwwKoG7r1byXGNBLH?=
 =?iso-8859-1?Q?0qTMs4sp1nM2ps81Md6PgiJf/Tf21glHq9y8rT3Kgyi+FMha5SSed7VJQV?=
 =?iso-8859-1?Q?vp2nJmc0DehZEuvM+90JsWYHOorFPgCNhYA+WWoLfd6mmstsC55oRWJtv6?=
 =?iso-8859-1?Q?oJAdSVDzWntVraJC3M3OMz4wpqP1u+gOHOc8SNmTVQ34O7Q2JNQNspjVej?=
 =?iso-8859-1?Q?KDL9KIUk3CAVn3bZKZWwU8/9K7z75BcOreJ7pcRlbcakDQPXzXguLm6yAF?=
 =?iso-8859-1?Q?g21F9FPtwncP7uz3oplxe5g5988p3h4bJ+YALqaPf8P/VsTbxI3k4ft2JJ?=
 =?iso-8859-1?Q?56iEdCJpq5y+gQ8hFm+4rmdZMoQ2rLThxLBzSjTKO0yDgbqnnnUF/XQVtl?=
 =?iso-8859-1?Q?46aITps7zmgVABpI8i1FjP+YO3fQ8ZLTbuBOZ+d00vT/UH2L1ZW0uqpYcf?=
 =?iso-8859-1?Q?bUgsbTm3cLuCjPoJi7KsUXk2/HYBdU3v7JCMJXg4RnTXDzHOGH+ct1NKJl?=
 =?iso-8859-1?Q?I6k/rJAGfG1m1eJu7eUp3c/Jkl2mcWbbCXy1kT0Dwl17LnJEbh1fGTeSu9?=
 =?iso-8859-1?Q?APfZtM2cvXPpxjWlCxmNX6jew/GUT4tYU5f+v7XgCD+UxkgW+qqUQ4EjvZ?=
 =?iso-8859-1?Q?9fc5KMQRFLGaiFP8HLBsUvY/RGPEtqVN3jNlFqfjtmSw3JQaanA7YyBX5k?=
 =?iso-8859-1?Q?T8RrcmJ2ccTbGNdMvTfmt0liNqhaCP16Mnvzt59ODmeCLQVIgdNOCZKukp?=
 =?iso-8859-1?Q?yfioDiLqjD9pn4qniV03b5HuPpDcuN+QvmDjqh+Pa4w+q6idzMuYdWj6T+?=
 =?iso-8859-1?Q?UE3ddf183tPs9SIpiC5KVs3BA26KOhxZL5lEIE2p7lX7dDIuie7rK+TLnO?=
 =?iso-8859-1?Q?uoRVvcBFllUeFyUo9aXbm9TSR/+WvNo/w1VKrY0e6QBakmBQ3yVtviQLUD?=
 =?iso-8859-1?Q?tOKJf78KJQWhdcWXtOYq6S/Nma5g8jkHDqrmyQaSHes8bg2jyxgfXkZ5E0?=
 =?iso-8859-1?Q?YZk76p/wc+yc6SF7rUoX6hX8do761yrwtB8WERzfhryCGp73t/tIfnqsBr?=
 =?iso-8859-1?Q?EK0OX+goXN4khj1xcg7+xUfrMxaCTyl3kEZpa5SYZXU+nd+BnB0welac5K?=
 =?iso-8859-1?Q?aj5BqyaM0iIbJcqQWjzwKOGMSodfRUey74/yI+1TLeBS6oxcSbe36BL73b?=
 =?iso-8859-1?Q?zQh+qzPR/bAgs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <61BB2968EAB2004DBD569F68E0A9745B@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9062e6a7-afa1-4eca-3b2c-08ddde20a9b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 06:30:02.3554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M5wgkA/OWgnZDdxPxA09qu4QMFPot/1FPgU1B8gDNWcCzGS8cUt2UVK36VTka72BuQxUymXqQfHmZT0G9D3ztA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835

[AMD Official Use Only - AMD Internal Distribution Only]

On 8/16/2025 1:11 AM, kernel test robot wrote:
&gt; Hi Raghavendra,
&gt;
&gt; [This is a private test report for your RFC patch.]
&gt; kernel test robot noticed the following build warnings:
&gt;
&gt; [auto build test WARNING on 038d61fd642278bab63ee8ef722c50d10ab01e8f]
&gt;
&gt; url:    https://github.com/intel-lab-lkp/linux/commits/Raghavendra-K-T=
/mm-Add-kscand-kthread-for-PTE-A-bit-scan/20250814-233829
&gt; base:   038d61fd642278bab63ee8ef722c50d10ab01e8f
&gt; patch link:    https://lore.kernel.org/r/20250814153307.1553061-4-ragh=
avendra.kt%40amd.com
&gt; patch subject: [RFC PATCH V3 03/17] mm: Scan the mm and create a migra=
tion list
&gt; config: s390-allmodconfig (https://download.01.org/0day-ci/archive/202=
50816/202508160305.4N7h8utZ-lkp@intel.com/config)
&gt; compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3=
b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
&gt; reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20250816/202508160305.4N7h8utZ-lkp@intel.com/reproduce)
&gt;
&gt; If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
&gt; the same patch/commit), kindly add following tags
&gt; | Reported-by: kernel test robot
&gt; | Closes: https://lore.kernel.org/oe-kbuild-all/202508160305.4N7h8utZ-=
lkp@intel.com/
&gt;
&gt; All warnings (new ones prefixed by &gt;&gt;):
&gt;
&gt;&gt;&gt; mm/kscand.c:194:20: warning: variable 'mm' set but not used [-=
Wunused-but-set-variable]
&gt;       194 |         struct mm_struct *mm;
&gt;           |                           ^
&gt;     1 warning generated.
&gt;
&gt;

Hello,

Thank you for the report.
will take care of this in next iteration.

Thanks and Regards
- Raghu
