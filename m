Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D75E17EA
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 06:53:49 +0000 (UTC)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.17.1.19/8.17.1.19) with ESMTP id 37P1cZSO029490;
	Thu, 24 Aug 2023 23:53:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=s2048-2021-q4;
 bh=z7e5r9R2ZDAfA7Z44ue6XkTTeMVDUHJ2kh2FdVMNHaI=;
 b=XzmXjLuV1U8bywpZ1ipP876qP6GmXX008PI+oY/hMDzkCJkOhsp0AmRNnAjD8K/H/dvw
 YfFmRV4mdZ2WLPN7f8keRdlng3iwsNyF+fvSMrbq4e9G/U1zQ/LpWdR3jO0mgb48G6II
 76MXVdJRB0TjoXVmm9COqDwrXJKTV9KXnL6h5604TQN+umBq36ieYPG/r19adPT8uPKz
 nzlC9Nmu4Q3F5tNDpPAOaEz/ZfbJDiJushUqo0bomgHReMejgEH7dDGWxSt3t3Scqjvq
 G1QczHbIfrddajagSsyz5ThkfK7pgcH/EnLKSzrG71Voi0Nihj0Cns+VY/zUzIQaifP4 yw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by m0089730.ppops.net (PPS) with ESMTPS id 3spb6jxx9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 23:53:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZbehFpz9ovuwobF5FreT8SCgYxrhXr/hr2Ukr6FP/LDIH29cjy9FybGo2KeSTyMzhepvVW+yW5HB22dzvCrY717YY75danpysAnqPUhMVgafWlJrKcd7HJrGiZH9uj9sRGtvpBXUpwYxnL4LLDkZ9gBqvMk85F1lXFs8U0j7tpr1n8TmIHCmRurSsOVPRPUAGhsNA+QRiebwLgrgoCYncxj+EfRcn/kAigSfAZFgnfCSPnfatEUyLDPXadrbBQD3+l4KO7enWkUQdOf/pgD6xSHPsfZva6u5qu2poLA452sLzsGi15rsZAbQ9Y0bVeNwNlWJ3T1TAk9Hat/Mz/ajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fu03K49PgPRLfBNjS2RRgyUYKpZr+gni4J4t66qNcCM=;
 b=EVN8D5DhbPXSWPDlL3Ft2Pn9dW3dBkO1xGJmuitKBTu0x2oAJUuoaNHiG3uMIdMCB+ozCMNtkZGiDXNT6TPYL0QNUJL8NEfpf1tQPDt5hS3cEQ83P4vLpzJGBEoxSo/fa117I/xG/wUim6SV1B6q676w2b1h8l0dgDQZTfYSCfvTYWJBw57tlAy2ceLCE7G4Vk5c1LYYINe9PSp/MMYvqGaIHEbgsgJtvlBETM4AU6gzh2tpIt48AGTh75GRjKrYA/d9H6lFF7YFL/wCfBC430Vx1PUOY1p0KYr4v5M4aYD/RvjZwa6qeyTcTo/Nue5Tr6KqmabUEjOdTqLS+Oc5gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SA1PR15MB5109.namprd15.prod.outlook.com (2603:10b6:806:1dc::10)
 by PH0PR15MB4719.namprd15.prod.outlook.com (2603:10b6:510:8d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 06:53:05 +0000
Received: from SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::57f2:86c6:1115:ad7d]) by SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::57f2:86c6:1115:ad7d%6]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 06:53:05 +0000
From: Song Liu <songliubraving@meta.com>
To: Yonghong Song <yonghong.song@linux.dev>
CC: Kees Cook <keescook@chromium.org>,
        Nick Desaulniers
	<ndesaulniers@google.com>,
        Petr Mladek <pmladek@suse.com>, Song Liu
	<song@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Fangrui Song
	<maskray@google.com>, Kernel Team <kernel-team@meta.com>,
        Leizhen
	<thunder.leizhen@huawei.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        kernel test robot
	<oliver.sang@intel.com>
Subject: Re: [PATCH] kallsyms: Fix kallsyms_selftest failure
Thread-Topic: [PATCH] kallsyms: Fix kallsyms_selftest failure
Thread-Index: AQHZ1wcjHZ4VTqvh6kuU0K2TO5sxPq/6k30A
Date: Fri, 25 Aug 2023 06:53:04 +0000
Message-ID: <C720F23D-167E-4BF0-A003-39F965448401@fb.com>
References: <20230825034659.1037627-1-yonghong.song@linux.dev>
In-Reply-To: <20230825034659.1037627-1-yonghong.song@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5109:EE_|PH0PR15MB4719:EE_
x-ms-office365-filtering-correlation-id: 87f69d5a-2ca1-413c-91b1-08dba537eebb
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zyQY76MTK6CdJE1jj5inh/1qm52Y0d4I5AM3HvRDPHXlU/0zRPJ7drrY7dJmzVmN4I3FmS5m3IvRJX1Z+R88Z8GdDAlAsDuiuh9oI0TMy5ZImcdgkNcX/sExvlpZ0sF6xPZmliSSybH0397M1VpN8PybQbnzjoS6+0gylf1IiiugfKCumExUTaNmPxfQFLWDuuUXk8TZDAoE6vDrEdhuX/9Y3JHc/Wvq29HYXKrkx9YsBsyISy8ydJWA6WlCReG3umBdrDDR4+udJl/IQWQwcWdR5JH1hUjYg9BloGsGvoFqeOoX9MgvPqHeqM8+cS/lX/meJgQwkqAoQ/oRLpIj8A75BEr24IL6xkTvZnxabK2OpOVW9qSNqIzIj+RzCgiS5aalnXMpM9YPlFPx0CEfGO/y/RvAmATBKDE+E3+OBCrJ2WuzvgVjeKoLyJ71SBjAgjpV5CyusQ/rDV7ETfbHcdGbREIR53SpI2xIE94WupL10i8PUA5NirerMyhRCN62sX9TFCiIx5DQrjR10/7GQ//3hbYoHVhMYCCGEm+ERFug5DeywPbOkqyamqwsEeC23McAUJuAHbV0/+x/F3yFNb3FBm2CvAn7gV+YBtu/hpY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR15MB5109.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(1800799009)(451199024)(186009)(7416002)(83380400001)(6512007)(9686003)(478600001)(5660300002)(966005)(2906002)(8936002)(4326008)(8676002)(38070700005)(38100700002)(122000001)(6916009)(66476007)(66556008)(66946007)(76116006)(91956017)(86362001)(71200400001)(41300700001)(64756008)(54906003)(6506007)(53546011)(6486002)(36756003)(66446008)(33656002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oDo3GKZvWaLgFbECBrRP1KIWpvcGAPmUSIFk5jrXEs3Miaq5KURD1R0yvWAi?=
 =?us-ascii?Q?bSTi5E7BrSHD17qGEk2/RzcJ0/DnZ3w9tMINOe5kL3zSDXRUKagVheM7xyOl?=
 =?us-ascii?Q?5U3naALRCAk+KaDGd+YOGfLMUCi8wfAs8tLT/tQGksZpzTN57URCRzsGtdYq?=
 =?us-ascii?Q?fIisYk2Ad9VqBpSjqc6WMzNwK8KKcw8hwCVOqVBW1seHYU1UWRzoqkINu7h6?=
 =?us-ascii?Q?GI1Twk4lPAEqqwRBhl8mpI2v+71G6w3WlgQw3W6h51Ua+0ROydICnUO+S9IT?=
 =?us-ascii?Q?X3Gcaj42fTnxh4erszzj8wqC2ui7P7b7NaNU/ACaGCn46ZN9k+H3j691knN9?=
 =?us-ascii?Q?1Fdi26kv1bqXtYjNjiN1KG5A9eSZ6o5wnrRTtzE4bE+kGF2bIO29JyU5rF14?=
 =?us-ascii?Q?R1fN5efEkfoH46Fqi/2pYES3ui8brK/PpKY4L0fTeinP1PtQRKN0NaAATDd0?=
 =?us-ascii?Q?+H9bDbDS7/UyLE6pzqlkgguKYTMDu1D4/xByDhPfcB87gQHZGJ1oCSKWBovt?=
 =?us-ascii?Q?D/BV/XMK/rbb8TvlLO3ucEm5MAwYXHba3Ii2WbQPe17djxwXn/ykaQSoYJqf?=
 =?us-ascii?Q?3mjNQtKnI2vvx/AhQ6ERSZY8zRVtl0CQ15ROzCESagJVxwKgpAutBz/9YJVF?=
 =?us-ascii?Q?K/EnFTfdtUxALZ6I/v/0ISAaktlgaklnKP+vJ9/Cx8DcuVPdVGBvLJ3ODlMo?=
 =?us-ascii?Q?b2CfpeFPLRJqI4Nyd8Tjpdzu0s+EapLs8ELXg80muNF84OTr61HbBabEvf0d?=
 =?us-ascii?Q?Ed5g+Zq48brL3JdG15/j6uu1BD6s6t7VOo/EZ3hhZFWudxUCcDq7gAlMqGyY?=
 =?us-ascii?Q?w4rDiEdLbk7ehXK1cngjHqVp7gnxXVD+IpZZ91HUGxWD4M52F15R4f9X4+Ev?=
 =?us-ascii?Q?ENcXaN5p/NANAbb5Vq86Ft2mmdBsC3SjssJ3TfcXilAsyJc9IHzqAkWtMaU4?=
 =?us-ascii?Q?5rqfwfu4wu18oIPpPwm4FE04P/97F51gEiODrYWGTnMci1cJ4X3O3RI0pa8B?=
 =?us-ascii?Q?C6CEm1pqzFX8kNQKSe0XKFW8lMQMqtzWMRR4XIddbcYhDhrMPlBIkzPx1gpW?=
 =?us-ascii?Q?+D5HVCjse1x4UCp1gUHfjRPLxJ2NpEp5gAjY5z/5fgOf+T71cEHpA1/RD3pM?=
 =?us-ascii?Q?pEd3czPwySumj0CvCG27X0luEG7lzaiXSZ+Y1m935rB21udsortAdIeawAJm?=
 =?us-ascii?Q?RIzpsfAoUAfU3IAMNhqRt5lu02PUoGEUGihvHNbGr36kqfkXVJ2mlP4WxDvw?=
 =?us-ascii?Q?SsPq/Fu8abtimlqsbJIh34rnovGkduAQ4qkzCnL71Y34qCZuEbjSnBx4cORR?=
 =?us-ascii?Q?IPell88W3Ar37u1BGc9AS3XKeUYqV6Teiz4KihZouuX2Z7W2PNCsEM16FV/i?=
 =?us-ascii?Q?sIrIPyB7h5ISb8GKLMu+WX4wFaUyYXfYPdBD9rHniFJ9UknEb+8KejKsw33+?=
 =?us-ascii?Q?vXyBmE0OGULik27jUI8bGaj7DG60RgZ7uE7c68W3xbRT/LzLsPCB+vrET+E1?=
 =?us-ascii?Q?v9ZcnF4lNKBrciXgHGcAkcSaTWq3g3uPYQRrSJM89/wPu4lD6ID/SzZPXAR+?=
 =?us-ascii?Q?BfeIVyw5wC0CcaSnu1DRWXmxu2wbM07KQyiLJ8Wh8V/Av6k1in0ZeogW1ulQ?=
 =?us-ascii?Q?yjdWnqwGPvn9PchPaEt6DQc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5074AB52CA67FB41ACB7BC5452251C92@namprd15.prod.outlook.com>
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5109.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f69d5a-2ca1-413c-91b1-08dba537eebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 06:53:04.9694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +gnOiXOOcKr2tQOQnxhUrIt2wGhqaD7U3Yly8M3CjkDxenQiVwZBqohd0298GG1C4+coEfCRnUZDkac9zBZvxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4719
X-Proofpoint-ORIG-GUID: lh9tgz6fFLX1ewWCve5V9At9aE_8HnfI
X-Proofpoint-GUID: lh9tgz6fFLX1ewWCve5V9At9aE_8HnfI
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_04,2023-08-24_01,2023-05-22_02



> On Aug 24, 2023, at 8:46 PM, Yonghong Song <yonghong.song@linux.dev> wrot=
e:
>=20
> Kernel test robot reported a kallsyms_test failure when clang lto is
> enabled (thin or full) and CONFIG_KALLSYMS_SELFTEST is also enabled.
> I can reproduce in my local environment with the following error message
> with thin lto:
>  [    1.877897] kallsyms_selftest: Test for 1750th symbol failed: (tsc_cs=
_mark_unstable) addr=3Dffffffff81038090
>  [    1.877901] kallsyms_selftest: abort
>=20
> It appears that commit 8cc32a9bbf29 ("kallsyms: strip LTO-only suffixes
> from promoted global functions") caused the failure. Commit 8cc32a9bbf29
> changed cleanup_symbol_name() based on ".llvm." instead of '.' where
> ".llvm." is appended to a before-lto-optimization local symbol name.
> We need to propagate such knowledge in kallsyms_selftest.c as well.
>=20
> Further more, compare_symbol_name() in kallsyms.c needs change as well.
> In scripts/kallsyms.c, kallsyms_names and kallsyms_seqs_of_names are used
> to record symbol names themselves and index to symbol names respectively.
> For example:
>  kallsyms_names:
>    ...
>    __amd_smn_rw._entry       <=3D=3D seq 1000
>    __amd_smn_rw._entry.5     <=3D=3D seq 1001
>    __amd_smn_rw.llvm.<hash>  <=3D=3D seq 1002
>    ...
>=20
> kallsyms_seqs_of_names are sorted based on cleanup_symbol_name() through,=
 so
> the order in kallsyms_seqs_of_names actually has
>=20
>  index 1000:   seq 1002   <=3D=3D __amd_smn_rw.llvm.<hash> (actual symbol=
 comparison using '__amd_smn_rw')
>  index 1001:   seq 1000   <=3D=3D __amd_smn_rw._entry
>  index 1002:   seq 1001   <=3D=3D __amd_smn_rw._entry.5
>=20
> Let us say at a particular point, at index 1000, symbol '__amd_smn_rw.llv=
m.<hash>'
> is comparing to '__amd_smn_rw._entry' where '__amd_smn_rw._entry' is the =
one to
> search e.g., with function kallsyms_on_each_match_symbol(). The current i=
mplementation
> will find out '__amd_smn_rw._entry' is less than '__amd_smn_rw.llvm.<hash=
>' and
> then continue to search e.g., index 999 and never found a match although =
the actual
> index 1001 is a match.
>=20
> To fix this issue, let us do cleanup_symbol_name() first and then do comp=
arison.
> In the above case, comparing '__amd_smn_rw' vs '__amd_smn_rw._entry' and
> '__amd_smn_rw._entry' being greater than '__amd_smn_rw', the next compari=
son will
> be > index 1000 and eventually index 1001 will be hit an a match is found.
>=20
> For any symbols not having '.llvm.' substr, there is no functionality cha=
nge
> for compare_symbol_name().
>=20
> Fixes: 8cc32a9bbf29 ("kallsyms: strip LTO-only suffixes from promoted glo=
bal functions")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202308232200.1c932a90-oliver.sang@=
intel.com
> Signed-off-by: Yonghong Song <yonghong.song@linux.dev>

Reviewed-by: Song Liu <song@kernel.org>



