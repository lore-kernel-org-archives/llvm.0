Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3D2F2F;
	Fri,  4 Nov 2022 18:58:12 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4G47la025398;
	Fri, 4 Nov 2022 18:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=LZIMWEv1Cm6aQbGsb/0CWtAkkPBiFGfPtjMuA2V17Sk=;
 b=TwHE0Y+pV8eUH96cC/K5LlrkGr6zASq++YWuY5HgE5jm1m16eIQtSh+LW65xpe9uDN1I
 LERAowOLPqXCvIYy1OYz7mSxa3udWuWCtouEN+gPVims+XkjuOo3VSVblC2k2bClCnd4
 ztzrk0PhQ0rjpiHGD99h15DqZIsfeS9S5Ccs+XXGmwv/e1INFLMRU5oieaE/kTyYzVli
 4ANa06nn6IkS8A9JBU3cafr670nc5es8T+7h68zc+0VyFOttV5qHYCfalA/wfJdm4MK1
 9NHpiGSXk3Akl05tZcDEzCKwOqqeZSIi02zyD0tggBO1hcUzl0aATWhSz72AKRSIdgqn SQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kgv2arkja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Nov 2022 18:57:57 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4GU2XD029300;
	Fri, 4 Nov 2022 18:57:56 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kmpr94e42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Nov 2022 18:57:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3ryLEKTK5x4FQIwhGSvvTVWtmZPwh72x9TgT3tKSmSatsXw2BMagUREo1VT+Mhh6TfKIHWHGlVwGrEN/BSu5MKY9/QoBzZFOETtF8rgA1cNVDmLmtXDZy+NBcOCTbpGgA1+m3rEcpcNBrsBR35FFNuBe+EcqBVhU9cMl9Tt8/ddtCLwVcvoPO0wjlJeR5SwOu/Cps2Sga3gcf1zX7E+aFwC4mkrhOgWFLj3MRdajGz/2++uzLKj7zwwxy97zla393jhtCKtmVc7dGdxpCc//jH9kRMLFut1RP/r6VPvdN2WPhqaRZ771KVQHH/GLeoCePrlA1dTvLxFbu84wx23GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZIMWEv1Cm6aQbGsb/0CWtAkkPBiFGfPtjMuA2V17Sk=;
 b=fX7bWrw92GRwSBU9ObIdSZJXzGvHvlLkD1oha0Fs7XpLcc99BykiRCWfteX4abqNOuPNz3ZcgfeF+lMbqohn0BPe+heCsAHGG6vlRMIIyVDoselVTivaStGyTIde+9jx4PqdnYQ7leB/nvfIziXPcmxCz2LwsRDCp19O8oaQg+JGfcYrkew3tn6d+6nrgf9vxuujFsuB2r6IPqxHpS5yTxPtuMK8WiJBWdN6KmhkU1oUtt90qTER3a57RTJv8BgEvyVFgVxTxC8HQSztiINqTka369+JNHbfp07zynjngPFViUA8JlhXoClJ++lKTXyRuQ6kqnS0qr1Rs1KTU92nfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZIMWEv1Cm6aQbGsb/0CWtAkkPBiFGfPtjMuA2V17Sk=;
 b=Z2j58wq05yBWIbBAQzKg+00ABsohjPiKz9fLWP4kNokTpuYw/8vHZDjTnfYqgUSp4zBSH9X1vb0L54Ez/h+d79FCUIUrZGcVXQD+1DugacVTa64R/7k6ul+9ns/QIJ0sZ8cZmNhhf9ENtrUKeVahKZpfi8tW7Ukc9Fz9bHCYzTU=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by DM4PR10MB6720.namprd10.prod.outlook.com (2603:10b6:8:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Fri, 4 Nov
 2022 18:57:54 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f378:f1d0:796a:55a1]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f378:f1d0:796a:55a1%3]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 18:57:54 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Hugh Dickins <hughd@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>,
        kernel test robot
	<lkp@intel.com>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        Ammar Faizi
	<ammarfaizi2@gnuweeb.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 46/244]
 lib/test_maple_tree.c:453:12: warning: result of comparison of constant
 4398046511104 with expression of type 'unsigned long' is always false
Thread-Topic: [ammarfaizi2-block:akpm/mm/mm-unstable 46/244]
 lib/test_maple_tree.c:453:12: warning: result of comparison of constant
 4398046511104 with expression of type 'unsigned long' is always false
Thread-Index: AQHY7B04Vgz+XyEn4USEeGFj6ybT2q4pI8sAgAExlACAAHIWAIAEXvaA
Date: Fri, 4 Nov 2022 18:57:54 +0000
Message-ID: <20221104185745.fru7nynv6ncynvu6@revolver>
References: <202210301224.r9RDzf4K-lkp@intel.com>
 <20221031161048.a2fd2ce1c210b9cd1a499cb4@linux-foundation.org>
 <20221101170854.43lt42yokl34vemc@revolver>
 <63b5f2ce-589a-80c6-49bf-c0cf7b3ea920@google.com>
In-Reply-To: <63b5f2ce-589a-80c6-49bf-c0cf7b3ea920@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR10MB3022:EE_|DM4PR10MB6720:EE_
x-ms-office365-filtering-correlation-id: cf8d7c77-7617-4193-4a66-08dabe967adb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4nZ5wlWVrBMrBnju3+onGh4CGw8PwjrNbZSkxO9qF0fFDQ+bDQEGNu8PZCkX2NfO8xw0RFfQ2HSgNyep+2omLKcgZNU3WndbV1HOd1oITmSZt42G5JIXzHSa42H3cr+KkGKLbUc8RpcaswbEkd2nT6pzdHaJKG4jV7f2e+jUSZJbL8T9SuZj6k54sBQ99mKpQDTLSB1fEwF4Basf8EBDjPVqW1pWZBv7SPmzHONY9n2cWQN1jwzg1TdtZRpXPGeEX/GxktYlk+jKtFvmWw9r2gJ2n6dddlSZoZW1DR/tyDk9X4o/Bbo8nMr21zXIOPlTa/uavxiuXoUU3xD6alMi1mKSfMzgp/2o6nJ9+tpOFRErpjDNVpxOqPIm9R0iaF9Nk9EWmafb2d+Muqmak93JUO08mzg2fLpT6EuseB7Myoxpj1cMTk8hOiF0DGDu6FPAcGV7yXYuS0oRgoeTM8bBm1Ey9cMp4fa98W7ezI2W16jDAI9VL0L2hErULtISM59blU9oW4YcbyENTGq9IDJML/SRsCH5O7KCh9V3jaXUKZysobB2vWigFNbL/7E/J8vS96WAJ5RGJyLlviGoPyCT4gPMfzFykM7K1fOF+w+ICZ6Yb2mtXY/z7Eks/qpD149O1dTGXySe7OoWBDk1MGdF0+8VzbG3A61mHg207UKljWnjBWDAxbLbnA20hBVIqySHtxNdLF1BYC4TIeVTQv1hPQHf4v8y6HvXKK3OExEAHtYHYE+IGw4SCpSQ61nm209OSUQ70pdt6hOknPIPScM0Xw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199015)(2906002)(41300700001)(4326008)(44832011)(71200400001)(66476007)(5660300002)(64756008)(66556008)(76116006)(91956017)(478600001)(8676002)(186003)(66446008)(66946007)(54906003)(33716001)(83380400001)(316002)(6486002)(8936002)(9686003)(1076003)(6916009)(122000001)(6506007)(6512007)(86362001)(26005)(38100700002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dhO0t/+F1dkuHBlb0gjLQ0VmjmZ1N0J22Ek4yPgU8NTjqZrqrenqBWExxA3l?=
 =?us-ascii?Q?kDpms86d0yiW1iOwAqGgj39BpjKjYvzFdor69mlpypMezQP60HjiOhaqk1hI?=
 =?us-ascii?Q?V1PH8oSUr2PnBPn3//xjmAo6x5iRCXBwdtTcUN/E4YWWfR9aGW2JABmKGDnx?=
 =?us-ascii?Q?s1a0eQk27Yuwh/z2JZIo23qI6XjCzcJ1UjgxWUV3UnZfVe2PCYnC9fd6doeW?=
 =?us-ascii?Q?TIqxiY31ICue1wrhd8bldNj8hhV0ELa8uRg/2lvYe2rKhLm3IdOtgBUCTKd+?=
 =?us-ascii?Q?hmwzFBIfvLlWBGhZ9/95GCuXeXN9xb2ZMsQIygWGHAXLpsfl0XIUKDNcUgim?=
 =?us-ascii?Q?PfWqfe/uWEUfBQCcpis16Jm0CCCkjXMWkhFV2SNQ7RustZhl4MohfCtZRnFq?=
 =?us-ascii?Q?qJc2n3dLde+UbxlGbjwu52L9ZiqG8gvuhIkZ06BYWHhWm/prZUiOJ23GX18d?=
 =?us-ascii?Q?Hnp/K+LiXenXmoNIsvwSiWqUp3Gdex0XNgm49JfboEzhA/xGn4GzKOwIqQwN?=
 =?us-ascii?Q?mNcSSR1h4Y9ifpgL4qrSqUGBTwmv/6IKjiieozUUci8QuteJJxMlplFQFcKF?=
 =?us-ascii?Q?Q3cF0mnNH6REWp0vMH2tjt/7hdQcJGb3MLhIYrRopi71ywqKlwfDhoxUzMmx?=
 =?us-ascii?Q?kJTzg6uoksPGNKdGqPLqASLtKlmcShvzD2r+qyglWKMcxfIKxFNCpqS4oDoV?=
 =?us-ascii?Q?WtALM8pB4y31qd9rd176+70h7+MzlttSejGrRIi5k2MomrvDyohhiKf004T8?=
 =?us-ascii?Q?pZL0jigwy1ZNH37/k/EKIMN76reJr2esDkkgtSduxb10h0WJgmdoPSiRBBrA?=
 =?us-ascii?Q?Xshy5wK7zptqJCcC+YCj+qsahFg7J9FpgC5PguQtoWBY/yEXfJOrUyGRwIGq?=
 =?us-ascii?Q?EkrBB+Ggdty5yh1i+oMP2ka3rmJtbNoCfukOiRgCDdh0mfSL8x7xI7uBJ8vL?=
 =?us-ascii?Q?xXtTvVyLIUHB6Vaqt6Iho1IZQJs/XQ24On9LGEoTapXGJz/qpCcVggAYFj6A?=
 =?us-ascii?Q?ypauWkPjED1HkupPWgUtQi/LHKZg2DldFBSrYUZgUA+3wDaZHfuZqAWagq1U?=
 =?us-ascii?Q?RK4HyziOj5lXvZYjgOaPW7MHHBX109egfxYKF3DSbvSwHBNIiWI0MUz/fxTl?=
 =?us-ascii?Q?98L5XJTn/zumwqEYUY01h9JV7qo7eCX9doALztAwGPF6kEQtJX5cMVfsF3xb?=
 =?us-ascii?Q?6imFNhf3WbYyzoxo7INpJI2X1bwSoo5Guby5GkGath79ZlTIQdeC0V+abQpQ?=
 =?us-ascii?Q?Y+reSOSX8QkiVvU7gyIRW3qmAGSPz5qwIXHoqekmoHWeFh2v3T8rRf/IzC1U?=
 =?us-ascii?Q?c87tYiPz0J08+Ql9itjDjYG/2AoV4tteUthbZjDNKPN0gciVJuA1JwzTpoUo?=
 =?us-ascii?Q?ndlohQu7wO5ThCrBbg2/AsNYmeb7ISbwNudIGlCYJ5p9sEOSnpqmFzqDeJFz?=
 =?us-ascii?Q?Vm9BHvjfperAcK6kMHBa0/29ut00qW9ZHupR9ohIETtNNSLdl8xc2Ewas13s?=
 =?us-ascii?Q?Qz+7HeqQLaE1Eh3duJ+ckLYcYFvaMfwuz5Pd2LFaNqD2NiwVvCpGeEsNYK81?=
 =?us-ascii?Q?2PsY02oQQt6Bsbqvmvf/7a5jEfGBfCLPFt/bzXmOLPlLWmbOEVWfUD8RwN3q?=
 =?us-ascii?Q?lQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <11975733FE2EF347B2E4DE6FD5C8861D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8d7c77-7617-4193-4a66-08dabe967adb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 18:57:54.1597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/QKhNCff/CNav26TsFN7pY9KK9IEMTD1w4hWWXfQDRgMQOf6StuarUB5AJkoe6xcSHjFpnOECCFB3cgQTXYSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6720
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211040119
X-Proofpoint-ORIG-GUID: pF9JlPGr4kIc1RluOlPBnHFjQ2zBJvm4
X-Proofpoint-GUID: pF9JlPGr4kIc1RluOlPBnHFjQ2zBJvm4

* Hugh Dickins <hughd@google.com> [221101 20:13]:
> On Tue, 1 Nov 2022, Liam Howlett wrote:
> > * Andrew Morton <akpm@linux-foundation.org> [221031 19:10]:
> > >=20
> > > Liam, what's with that 4398046511104?  Wouldn't 0x40000000000 be clea=
rer? =20
> >=20
> > I had the hex and changed it to decimal so I could easily search for it
> > in a tree dump - it was more unique.  At one point I had it as a commen=
t
> > next to the hex, which might be a better way to keep it around for
> > searching if there is ever a bug here again.  I'll include that in the
> > patch.
>=20
> Huh.  I made the point before, that IMO the tree dump is itself insane
> to be using decimal rather than hex.  There can be patterns immediately
> obvious in hex, that are thoroughly obscure in decimal (unless you're
> some kind of savant).
>=20
> Fortunately, it's a long time since I needed to look at a maple tree dump
> (all credit to you), but here's the patch I continue to carry in my tree,
> in case I ever do need to.  (But I've not checked whether more long
> decimal has crept in recently.)
>=20
> So long as you are the only one doing the debugging, the choice should
> remain yours; but if anyone else has to look...

Thanks, yes I haven't forgotten your request to change this.  I was
planning to update the debug code later in fears of destabilizing so
close to the finish line.  I haven't been happy on how to list the
pivots and slots together both as hex yet.  It also may make sense to
have the debug output one or the other format, depending on what is
being tracked.

>=20
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -5641,7 +5641,7 @@ void *mas_store(struct ma_state *mas, vo
>  	trace_ma_write(__func__, mas, 0, entry);
>  #ifdef CONFIG_DEBUG_MAPLE_TREE
>  	if (mas->index > mas->last)
> -		pr_err("Error %lu > %lu %p\n", mas->index, mas->last, entry);
> +		pr_err("Error %lx > %lx %px\n", mas->index, mas->last, entry);
>  	MT_BUG_ON(mas->tree, mas->index > mas->last);
>  	if (mas->index > mas->last) {
>  		mas_set_err(mas, -EINVAL);
> @@ -6669,9 +6669,9 @@ static void mt_dump_range(unsigned long
>  	static const char spaces[] =3D "                                ";
> =20
>  	if (min =3D=3D max)
> -		pr_info("%.*s%lu: ", depth * 2, spaces, min);
> +		pr_info("%.*s%lx: ", depth * 2, spaces, min);
>  	else
> -		pr_info("%.*s%lu-%lu: ", depth * 2, spaces, min, max);
> +		pr_info("%.*s%lx-%lx: ", depth * 2, spaces, min, max);
>  }
> =20
>  static void mt_dump_entry(void *entry, unsigned long min, unsigned long =
max,
> @@ -6680,14 +6680,14 @@ static void mt_dump_entry(void *entry, u
>  	mt_dump_range(min, max, depth);
> =20
>  	if (xa_is_value(entry))
> -		pr_cont("value %ld (0x%lx) [%p]\n", xa_to_value(entry),
> +		pr_cont("value %lx (0x%lx) [%px]\n", xa_to_value(entry),
>  				xa_to_value(entry), entry);
>  	else if (xa_is_zero(entry))
> -		pr_cont("zero (%ld)\n", xa_to_internal(entry));
> +		pr_cont("zero (%lx)\n", xa_to_internal(entry));
>  	else if (mt_is_reserved(entry))
> -		pr_cont("UNKNOWN ENTRY (%p)\n", entry);
> +		pr_cont("UNKNOWN ENTRY (%px)\n", entry);
>  	else
> -		pr_cont("%p\n", entry);
> +		pr_cont("%px\n", entry);
>  }
> =20
>  static void mt_dump_range64(const struct maple_tree *mt, void *entry,
> @@ -6700,8 +6700,8 @@ static void mt_dump_range64(const struct
> =20
>  	pr_cont(" contents: ");
>  	for (i =3D 0; i < MAPLE_RANGE64_SLOTS - 1; i++)
> -		pr_cont("%p %lu ", node->slot[i], node->pivot[i]);
> -	pr_cont("%p\n", node->slot[i]);
> +		pr_cont("%px %lx ", node->slot[i], node->pivot[i]);
> +	pr_cont("%px\n", node->slot[i]);
>  	for (i =3D 0; i < MAPLE_RANGE64_SLOTS; i++) {
>  		unsigned long last =3D max;
> =20
> @@ -6721,7 +6721,7 @@ static void mt_dump_range64(const struct
>  		if (last =3D=3D max)
>  			break;
>  		if (last > max) {
> -			pr_err("node %p last (%lu) > max (%lu) at pivot %d!\n",
> +			pr_err("node %px last (%lx) > max (%lx) at pivot %d!\n",
>  					node, last, max, i);
>  			break;
>  		}
> @@ -6739,11 +6739,11 @@ static void mt_dump_arange64(const struc
> =20
>  	pr_cont(" contents: ");
>  	for (i =3D 0; i < MAPLE_ARANGE64_SLOTS; i++)
> -		pr_cont("%lu ", node->gap[i]);
> +		pr_cont("%lx ", node->gap[i]);
>  	pr_cont("| %02X %02X| ", node->meta.end, node->meta.gap);
>  	for (i =3D 0; i < MAPLE_ARANGE64_SLOTS - 1; i++)
> -		pr_cont("%p %lu ", node->slot[i], node->pivot[i]);
> -	pr_cont("%p\n", node->slot[i]);
> +		pr_cont("%px %lx ", node->slot[i], node->pivot[i]);
> +	pr_cont("%px\n", node->slot[i]);
>  	for (i =3D 0; i < MAPLE_ARANGE64_SLOTS; i++) {
>  		unsigned long last =3D max;
> =20
> @@ -6763,7 +6763,7 @@ static void mt_dump_arange64(const struc
>  		if (last =3D=3D max)
>  			break;
>  		if (last > max) {
> -			pr_err("node %p last (%lu) > max (%lu) at pivot %d!\n",
> +			pr_err("node %px last (%lx) > max (%lx) at pivot %d!\n",
>  					node, last, max, i);
>  			break;
>  		}
> @@ -6780,7 +6780,7 @@ static void mt_dump_node(const struct ma
> =20
>  	mt_dump_range(min, max, depth);
> =20
> -	pr_cont("node %p depth %d type %d parent %p", node, depth, type,
> +	pr_cont("node %px depth %d type %d parent %px", node, depth, type,
>  			node ? node->parent : NULL);
>  	switch (type) {
>  	case maple_dense:
> @@ -6809,7 +6809,7 @@ void mt_dump(const struct maple_tree *mt
>  {
>  	void *entry =3D rcu_dereference_check(mt->ma_root, mt_locked(mt));
> =20
> -	pr_info("maple_tree(%p) flags %X, height %u root %p\n",
> +	pr_info("maple_tree(%px) flags %X, height %u root %px\n",
>  		 mt, mt->ma_flags, mt_height(mt), entry);
>  	if (!xa_is_node(entry))
>  		mt_dump_entry(entry, 0, 0, 0);
> @@ -6862,7 +6862,7 @@ static void mas_validate_gaps(struct ma_
>  			gap =3D gaps[i];
>  			if (!entry) {
>  				if (gap !=3D p_end - p_start + 1) {
> -					pr_err("%p[%u] -> %p %lu !=3D %lu - %lu + 1\n",
> +					pr_err("%px[%u] -> %px %lx !=3D %lx - %lx + 1\n",
>  						mas_mn(mas), i,
>  						mas_get_slot(mas, i), gap,
>  						p_end, p_start);
> @@ -6873,7 +6873,7 @@ static void mas_validate_gaps(struct ma_
>  				}
>  			} else {
>  				if (gap > p_end - p_start + 1) {
> -					pr_err("%p[%u] %lu >=3D %lu - %lu + 1 (%lu)\n",
> +					pr_err("%px[%u] %lx >=3D %lx - %lx + 1 (%lx)\n",
>  					mas_mn(mas), i, gap, p_end, p_start,
>  					p_end - p_start + 1);
>  					MT_BUG_ON(mas->tree,
> @@ -6898,7 +6898,7 @@ counted:
>  	p_mn =3D mte_parent(mte);
>  	MT_BUG_ON(mas->tree, max_gap > mas->max);
>  	if (ma_gaps(p_mn, mas_parent_enum(mas, mte))[p_slot] !=3D max_gap) {
> -		pr_err("gap %p[%u] !=3D %lu\n", p_mn, p_slot, max_gap);
> +		pr_err("gap %px[%u] !=3D %lx\n", p_mn, p_slot, max_gap);
>  		mt_dump(mas->tree);
>  	}
> =20
> @@ -6928,11 +6928,11 @@ static void mas_validate_parent_slot(str
>  		node =3D mas_slot(mas, slots, i);
>  		if (i =3D=3D p_slot) {
>  			if (node !=3D mas->node)
> -				pr_err("parent %p[%u] does not have %p\n",
> +				pr_err("parent %px[%u] does not have %px\n",
>  					parent, i, mas_mn(mas));
>  			MT_BUG_ON(mas->tree, node !=3D mas->node);
>  		} else if (node =3D=3D mas->node) {
> -			pr_err("Invalid child %p at parent %p[%u] p_slot %u\n",
> +			pr_err("Invalid child %px at parent %px[%u] p_slot %u\n",
>  			       mas_mn(mas), parent, i, p_slot);
>  			MT_BUG_ON(mas->tree, node =3D=3D mas->node);
>  		}
> @@ -6959,14 +6959,14 @@ static void mas_validate_child_slot(stru
>  			break;
> =20
>  		if (mte_parent_slot(child) !=3D i) {
> -			pr_err("Slot error at %p[%u]: child %p has pslot %u\n",
> +			pr_err("Slot error at %px[%u]: child %px has pslot %u\n",
>  			       mas_mn(mas), i, mte_to_node(child),
>  			       mte_parent_slot(child));
>  			MT_BUG_ON(mas->tree, 1);
>  		}
> =20
>  		if (mte_parent(child) !=3D mte_to_node(mas->node)) {
> -			pr_err("child %p has parent %p not %p\n",
> +			pr_err("child %px has parent %px not %px\n",
>  			       mte_to_node(child), mte_parent(child),
>  			       mte_to_node(mas->node));
>  			MT_BUG_ON(mas->tree, 1);
> @@ -7001,25 +7001,25 @@ static void mas_validate_limits(struct m
>  			void *entry =3D mas_slot(mas, slots, i);
> =20
>  			if (!entry)
> -				pr_err("%p[%u] cannot be null\n",
> +				pr_err("%px[%u] cannot be null\n",
>  				       mas_mn(mas), i);
> =20
>  			MT_BUG_ON(mas->tree, !entry);
>  		}
> =20
>  		if (prev_piv > piv) {
> -			pr_err("%p[%u] piv %lu < prev_piv %lu\n",
> +			pr_err("%px[%u] piv %lx < prev_piv %lx\n",
>  				mas_mn(mas), i, piv, prev_piv);
>  			MT_BUG_ON(mas->tree, piv < prev_piv);
>  		}
> =20
>  		if (piv < mas->min) {
> -			pr_err("%p[%u] %lu < %lu\n", mas_mn(mas), i,
> +			pr_err("%px[%u] %lx < %lx\n", mas_mn(mas), i,
>  				piv, mas->min);
>  			MT_BUG_ON(mas->tree, piv < mas->min);
>  		}
>  		if (piv > mas->max) {
> -			pr_err("%p[%u] %lu > %lu\n", mas_mn(mas), i,
> +			pr_err("%px[%u] %lx > %lx\n", mas_mn(mas), i,
>  				piv, mas->max);
>  			MT_BUG_ON(mas->tree, piv > mas->max);
>  		}
> @@ -7031,7 +7031,7 @@ static void mas_validate_limits(struct m
>  		void *entry =3D mas_slot(mas, slots, i);
> =20
>  		if (entry && (i !=3D mt_slots[type] - 1)) {
> -			pr_err("%p[%u] should not have entry %p\n", mas_mn(mas),
> +			pr_err("%px[%u] should not have entry %px\n", mas_mn(mas),
>  			       i, entry);
>  			MT_BUG_ON(mas->tree, entry !=3D NULL);
>  		}
> @@ -7042,7 +7042,7 @@ static void mas_validate_limits(struct m
>  			if (!piv)
>  				continue;
> =20
> -			pr_err("%p[%u] should not have piv %lu\n",
> +			pr_err("%px[%u] should not have piv %lx\n",
>  			       mas_mn(mas), i, piv);
>  			MT_BUG_ON(mas->tree, i < mt_pivots[type] - 1);
>  		}
> @@ -7067,7 +7067,7 @@ static void mt_validate_nulls(struct map
>  	do {
>  		entry =3D mas_slot(&mas, slots, offset);
>  		if (!last && !entry) {
> -			pr_err("Sequential nulls end at %p[%u]\n",
> +			pr_err("Sequential nulls end at %px[%u]\n",
>  				mas_mn(&mas), offset);
>  		}
>  		MT_BUG_ON(mt, !last && !entry);
> @@ -7108,7 +7108,7 @@ void mt_validate(struct maple_tree *mt)
>  			end =3D mas_data_end(&mas);
>  			if ((end < mt_min_slot_count(mas.node)) &&
>  			    (mas.max !=3D ULONG_MAX)) {
> -				pr_err("Invalid size %u of %p\n", end,
> +				pr_err("Invalid size %u of %px\n", end,
>  				mas_mn(&mas));
>  				MT_BUG_ON(mas.tree, 1);
>  			}=
