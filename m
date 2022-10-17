Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D514699
	for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 20:03:16 +0000 (UTC)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HJOt7s007874;
	Mon, 17 Oct 2022 13:02:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-id :
 content-type : content-transfer-encoding : mime-version; s=s2048-2021-q4;
 bh=TcRIJjeCDZ3c+AbvjBeYqjqpyhzBkyZAtcsxDIkTbbQ=;
 b=UFsO4EXY60lKxf0lYrYeXgvslxRTCOPXMm1c6+ArA1mhtzuTdhj27s89jAAziq6DLeSC
 q08JsStNVtEiFMSGr2Y0IgRceoUMobM9m7ULzwkb8rATF1KKyJrm3XIpDSRxqROhPIZu
 ecKTjyXcHTc/mK6p6g67NYHftePPgVsoqeVPWFe8RQ5a6nDEi5mwUkjqMaO59wv5AnpX
 4PCjifC1B7nL3fczUv3EkpzFLvncyRAd66C1GFhUGRAxUXEgrNGSzaTJs4cXNGSlP8zv
 A+zJXIFpT/ZN6kmDFORFrsFrNL0UJtoBK2F/YKxy/251zasvGHQL5eUmO+6rokVZpPdh Xw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3k99auu1pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 13:02:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yi4Ect4CJScCffC/G754J/o+2OWQ/Gwg00KPGwkntrq9MzzT1BU6o9bjjVixSb7T5ngDg51zM0NHpMR6Fx97tmpr8nMty9bl6Eofqs3qiuwr0BVMIpZiV4/RNLPaoLqUqi+CgxoA3ZDOgNbKF6MNzsJypSzMpyDDGuDM0CXa6uf5FFou1E1nOnsb5kaM4qol1pvEiySl3PKwsG1vEt0a5NXrCr/+l+0fwNmrjtTtYtqVUPiMpzOF6WIWu/8r8D3fZdBJHhgyXFKDMRRpAonB7llhgc8+c03iDr70ZssLrosCffAHCH+aED/jVBH+HQ30CfkmvDpRLxlXcE8oIz4d/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdW0dbvz4XTVxa6a2fdsSqrL3U0owUCtcbaiaZ/ddDA=;
 b=fD2s0eJDJJn+f9QFmRFBGQf6qE0S9Q3Rj9UdDEeMDL9B5qYZgOUXm0Zf+/enWaHB3HpT94n1tfDM04dj+s6NzFENmdAA6VGCJ8UWZJ208r6cPvBTZoWuED/F0tLIjw9/D1nnuc7Iw5KmI2w4kI1NMGecXKWwUqVmHQ6Sl93U+Y8wcgYzM3BZnS5QtXbABf6iYsIEz9DHJztfVgWbeHqjS7NmcSLpSskIvV1gWHLNoxvULgQg5nfzcIJlgiryEuCxSxX7qoi/ZHF/4do13SkmVJwYEbrYtnx+p5nlFLobF3kIorowz8leI1QKsVzJExCHWqwns17dG3pf2MVWw6lpww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by SN6PR1501MB2015.namprd15.prod.outlook.com (2603:10b6:805:7::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 20:02:38 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::14ef:d825:d623:440c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::14ef:d825:d623:440c%5]) with mapi id 15.20.5676.038; Mon, 17 Oct 2022
 20:02:38 +0000
From: Nick Terrell <terrelln@meta.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Torvalds
	<torvalds@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen
	<dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
        "H . Peter Anvin"
	<hpa@zytor.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Nick Desaulniers
	<ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>,
        Len Brown <lenb@kernel.org>, Nathan Chancellor
	<nathan@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Robert Moore
	<robert.moore@intel.com>, Tom Rix <trix@redhat.com>,
        "devel@acpica.org"
	<devel@acpica.org>,
        "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [PATCH v2] Remove Intel compiler support
Thread-Topic: [PATCH v2] Remove Intel compiler support
Thread-Index: AQHY3ZVFv9Qm/NYeCEaItXFQ4kEqp64N+oGAgANi94CAAa4qAA==
Date: Mon, 17 Oct 2022 20:02:37 +0000
Message-ID: <3F993490-0E9A-43C8-B272-FACF718E674D@fb.com>
References: <20221011171427.58891-1-masahiroy@kernel.org>
 <CANiq72kvaPGr=2S6J7q7gfEg_CauHUfhuLmABpktfUPfK+_Hvg@mail.gmail.com>
 <CAK7LNAQkSbH-Gw3sgMzxHyA9pSf3gLVvbCLg3yvbO43_vi5=YA@mail.gmail.com>
In-Reply-To: 
 <CAK7LNAQkSbH-Gw3sgMzxHyA9pSf3gLVvbCLg3yvbO43_vi5=YA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR15MB3667:EE_|SN6PR1501MB2015:EE_
x-ms-office365-filtering-correlation-id: 861d5ec6-dfa7-4da7-8676-08dab07a8a60
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fiBdoQeoQ04Ycn190QgYRLryCEu2DdRP5jknut9NfWrWDRWK6WYt45RN0oltV9DwAHRyUzQLJ3L2xJMEpRgaKHwooMBVu7pwqVBAjRsj3Jdmazk+HMisGGHAs7QtMA/w3XNdFLJt2L6INdT1zsj6K8qp0RmHdgcGgpOIVzrmNlaB+8DDtInizGhlQ+08RrARa1lfT2M2c8phPBzlyeJHznNRZ1vlJdI1AETIjozCUk8jroZC5c/G/46vcihnddSIuyJtTbCkBz/Qu3y1uGk9PgQU9tTb1E8WnaAORDi83og6n0M0NxqT9kuTeyX4pnpmEU6TvZCbtzgNw6Lws2FBXF6wdvKu87c6nSKY3LxfyNgYp9BaV2oOEQVIIDCKnm8hapwgZxgkVZ2wsiPl/doNfXlhbnoEJSCULa9uzrZvAYviSN8j+oBzzH3/LeCM3goIwkRZcbSO7UrQEaNYIBICkvoPkGwBQJqF8whO4fDpr0YO7yjMaPD3DIMwS+m9JDJl044VMpvsLjtofZSoXoYgoknZZodMSzAAX9jSgV9/KOkRiLC4kEXsOE7qMojRkCJmahLac8CA4G+PuSCgNJNv73nT8NFqzsFEUhxbFkMrMbNBvXUNT1ReYkMAxpF7/jZQWkDmQZQ0WmwFpNiC3BFY51/H4XeLfqMBK7kYwxeDV8Ik7vgN9PO9XwGLwQ2mAUOI5H6m5RSZyp9Omo7gSSkNosUrNchroxto9p2L9fywn2GI0FtJ7uZqEpMju3j4Phg4jg839gURiRvqUPB6KqFihZnj178WkghqLeRu3UqLotZgbKFFWdPp6984Cn+tzF/WemJqS2Y8lmvbvGnQFhb+3g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199015)(4326008)(9686003)(6512007)(53546011)(478600001)(83380400001)(2906002)(7416002)(5660300002)(6506007)(186003)(6916009)(41300700001)(316002)(66946007)(66556008)(71200400001)(8936002)(64756008)(966005)(8676002)(66476007)(76116006)(66446008)(6486002)(54906003)(86362001)(36756003)(38100700002)(38070700005)(33656002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TGqxLdC9943vmQU97q3vbUE7fpXWF8ri/mnKLP24tjhelBHOlWnZBUxnjJRk?=
 =?us-ascii?Q?yDf7AIwZd35ffkev8ymlYHvn3nDgXPwuC61LVju/tfZvnRZ5PFfExzezJxUq?=
 =?us-ascii?Q?SraTnUZwg6YCb0IUctM94G+kPQhyrDQK9V1qAc+l+4W/P+ZCq3MhWkyj2UMk?=
 =?us-ascii?Q?0yiONbxz6ICxG1fxsJ7juBa2E5QsEMboRlSvxlilFzYPr7a+B5bTDj0z9YZ3?=
 =?us-ascii?Q?yFIy/ZCWl2v3cI1sURiBzoF8AGNWPSeyP4h09pwcjnbcpUM46nWoK4d8X43B?=
 =?us-ascii?Q?Ajxg8Fs+s+/YoBsy2CQg7hFUrbhqXosTe7yqCV72GeZ8uvAOlbziS8ZVwzCZ?=
 =?us-ascii?Q?qqofCGmN8WTRiWLGOb18QNeW6hF4Ka9RdCJTdCLaEPm2uIWkSEFtHQpV/UmQ?=
 =?us-ascii?Q?eZE+7kvhnj+vSb6ttaj2DZ/kqZNTRrbXPZkg/sBut4pUBT3qxGTq/g59aLGO?=
 =?us-ascii?Q?GccHLLSEqdv5dciEGi25zGEoNkfgpngIEVs9e2p/Af1RFeiQEOGAE9b1X49y?=
 =?us-ascii?Q?qiQ0KKR32iFip3V/N5fGywAjoSNe2c+y+gzY1gVJGPRoXZxhEoYwJUlwy1ih?=
 =?us-ascii?Q?XhIMrw2nv6AypAK9Weu0YSS+jhfsasakVxkUWa/yx9lHcvsSIzhPi0/6jzrQ?=
 =?us-ascii?Q?8xm5xqIS8DAUPYe8Mde1MC7ZTr1yT3tgVganGSuTsKkGrFy17WJU3l/Hq3+x?=
 =?us-ascii?Q?XhsWUGx1+hrakHG0J6kIF0VN99pQSmTSwrxm4oTXLhBBV3RzQDmORP826HuZ?=
 =?us-ascii?Q?DUOz5Q5L6+Z4pjardEygDblxTfQn583JlhyG6PdMAUMT757ctDsCYV2/b+qQ?=
 =?us-ascii?Q?5wBp6EM4M/ETrkKNmVOG9P9J39WAqsDAaYxr+nvqjF6hZ82AB8CT4H2rReLR?=
 =?us-ascii?Q?hiI8rQVYZsXTZxJVUSZ7jpaTxxpVZVD3TZ4h5Wabwush6diIyyI4v/XztUyt?=
 =?us-ascii?Q?IY30JveknR7NuUpVI6CQFssTSS6gLq+ulalqZIGevr2f8rzWbinXDo0kxMdt?=
 =?us-ascii?Q?fosMDcD0RSOohVmADRamVBf6j6Yyn6slz78gmPsu2NRRRjW6qkdcH2dLjpZH?=
 =?us-ascii?Q?IR7pJ2HsVLJggiDw2WJyNUeNhot5XCEeWhO/xC7iDA4+JX5rDjWCYsJDzE8+?=
 =?us-ascii?Q?CzSr+XvzdqTM48eQ9vNQtzkkpA65anFjMA+KkJAXRZCSMs9dbZq/iQDUap2U?=
 =?us-ascii?Q?Hd2JnEb4msVLAy5FqlxLhUql4kup4WZHKvJRS0ZYZ4ORiqEI83sHzOq6W1Ms?=
 =?us-ascii?Q?gs9csxsqfCWHvVsHNs1kTtVgcYhE/nV7gBFcPEbJLFwv9MDUjQjy32XeER/g?=
 =?us-ascii?Q?DILDj2dWhg6RVXxnz+b00gKqaYajABiSkIvKHximXwZZnqm6FQvJVMTPzvi0?=
 =?us-ascii?Q?Xm5oWUO1CCD6klpQARnKh1nQbIecuZzCV4YetG+j/yCaCLBVlbSJi64Rl6if?=
 =?us-ascii?Q?LdQcrA9UqOtbgChwem7M+5xN+ImzKTQte7v3ZlOeY1BLGdf7BVwkYpMonf2o?=
 =?us-ascii?Q?c+ENUgkodlEffN2j4ENm/AX38Kl/eyaqVVrKABLcqF/yeW4VMY3UrFDB8+xN?=
 =?us-ascii?Q?W7FrVMGJgIbhPeQ45Y/LeANK09MzaUslnbU2OSMzX7d6AuP5LlDMcn7ibvK6?=
 =?us-ascii?Q?Hy14g9N5r0rH/gm3ExpXg0k=3D?=
Content-ID: <48853B23F303654E88CC17E704500B3F@namprd15.prod.outlook.com>
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861d5ec6-dfa7-4da7-8676-08dab07a8a60
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 20:02:38.0270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rv4bR+xXH1EkeXVE804QIP8ARhRkgWEt1OyCwiV2Yx8L5+jh5u772V/uIFpWUfjtYS+Fgz4kp9cCUpCGnjdPzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR1501MB2015
X-Proofpoint-GUID: AEyfXq-DxqDYH_SQnhi5R0_IohMhZrtd
X-Proofpoint-ORIG-GUID: AEyfXq-DxqDYH_SQnhi5R0_IohMhZrtd
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01



> On Oct 16, 2022, at 11:22 AM, Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>=20
> !-------------------------------------------------------------------|
>  This Message Is From an External Sender
>=20
> |-------------------------------------------------------------------!
>=20
> On Fri, Oct 14, 2022 at 11:40 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>=20
>> On Tue, Oct 11, 2022 at 7:16 PM Masahiro Yamada <masahiroy@kernel.org> w=
rote:
>>>=20
>>> diff --git a/include/linux/compiler_attributes.h b/include/linux/compil=
er_attributes.h
>>> index 898b3458b24a..9221302f6ae8 100644
>>> --- a/include/linux/compiler_attributes.h
>>> +++ b/include/linux/compiler_attributes.h
>>> @@ -64,16 +64,10 @@
>>>  * compiler should see some alignment anyway, when the return value is
>>>  * massaged by 'flags =3D ptr & 3; ptr &=3D ~3;').
>>>  *
>>> - * Optional: not supported by icc
>>> - *
>>>  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes=
.html#index-assume_005faligned-function-attribute
>>>  * clang: https://clang.llvm.org/docs/AttributeReference.html#assume-al=
igned=20=20
>>>  */
>>> -#if __has_attribute(__assume_aligned__)
>>> -# define __assume_aligned(a, ...)       __attribute__((__assume_aligne=
d__(a, ## __VA_ARGS__)))
>>> -#else
>>> -# define __assume_aligned(a, ...)
>>> -#endif
>>> +#define __assume_aligned(a, ...)        __attribute__((__assume_aligne=
d__(a, ## __VA_ARGS__)))
>>=20
>> Thanks for cleaning the conditional inclusion here. I double-checked
>> it is indeed available for both GCC and Clang current minimum versions
>> just in case: https://godbolt.org/z/PxaqeEdcE.
>>=20
>>> diff --git a/lib/zstd/common/compiler.h b/lib/zstd/common/compiler.h
>>> index f5a9c70a228a..c281a6430cd4 100644
>>> --- a/lib/zstd/common/compiler.h
>>> +++ b/lib/zstd/common/compiler.h
>>> @@ -116,7 +116,7 @@
>>>=20
>>> /* vectorization
>>>  * older GCC (pre gcc-4.3 picked as the cutoff) uses a different syntax=
 */
>>> -#if !defined(__INTEL_COMPILER) && !defined(__clang__) && defined(__GNU=
C__)
>>> +#if !defined(__clang__) && defined(__GNUC__)
>>> #  if (__GNUC__ =3D=3D 4 && __GNUC_MINOR__ > 3) || (__GNUC__ >=3D 5)
>>> #    define DONT_VECTORIZE __attribute__((optimize("no-tree-vectorize")=
))
>>> #  else
>>=20
>> These files come from upstream Zstandard -- should we keep those lines
>> to minimize divergence?
>> https://github.com/facebook/zstd/blob/v1.4.10/lib/common/compiler.h#L154.
>>=20
>> Commit e0c1b49f5b67 ("lib: zstd: Upgrade to latest upstream zstd
>> version 1.4.10") is the latest upgrade, and says:
>>=20
>>    This patch is 100% generated from upstream zstd commit 20821a46f412 [=
0].
>>=20
>>    This patch is very large because it is transitioning from the custom
>>    kernel zstd to using upstream directly. The new zstd follows upstreams
>>    file structure which is different. Future update patches will be much
>>    smaller because they will only contain the changes from one upstream
>>    zstd release.
>>=20
>> So I think Nick would prefer to keep the changes as minimal as
>> possible with respect to upstream.
>>=20
>> Further reading seems to suggest this is the case, e.g. see this
>> commit upstream that introduces a space to match the kernel:
>> https://github.com/facebook/zstd/commit/b53da1f6f499f0d44c5f40795b080d96=
7b24e5fa.
>>=20
>>> diff --git a/lib/zstd/compress/zstd_fast.c b/lib/zstd/compress/zstd_fas=
t.c
>>> index 96b7d48e2868..800f3865119f 100644
>>> --- a/lib/zstd/compress/zstd_fast.c
>>> +++ b/lib/zstd/compress/zstd_fast.c
>>> @@ -80,13 +80,6 @@ ZSTD_compressBlock_fast_generic(
>>>     }
>>>=20
>>>     /* Main Search Loop */
>>> -#ifdef __INTEL_COMPILER
>>> -    /* From intel 'The vector pragma indicates that the loop should be
>>> -     * vectorized if it is legal to do so'. Can be used together with
>>> -     * #pragma ivdep (but have opted to exclude that because intel
>>> -     * warns against using it).*/
>>> -    #pragma vector always
>>> -#endif
>>>     while (ip1 < ilimit) {   /* < instead of <=3D, because check at ip0=
+2 */
>>>         size_t mLength;
>>>         BYTE const* ip2 =3D ip0 + 2;
>>=20
>> Ditto: https://github.com/facebook/zstd/blob/v1.4.10/lib/compress/zstd_f=
ast.c#L83.
>>=20
>> Apart from the zstd divergence which I am not sure about, everything
>> looks good to me!
>>=20
>> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
>>=20
>> Cheers,
>> Miguel
>=20
>=20
> Thanks for your close review.
>=20
> I will drop zstd changes and send v3.

Thanks!

As Miguel pointed out, we sync zstd in from upstream, so any changes here w=
ould
get overwritten next sync. If the idea is to just remove icc specific code =
for code
hygiene, I'd leave zstd as-is to keep it more in line with upstream. Howeve=
r, if there
is a very strong reason to delete it, we could remove it as part of our imp=
ort process.

And if anything is broken, please open an issue on zstd's GitHub or email m=
e.

Best,
Nick Terrell

> --=20
> Best Regards
> Masahiro Yamada

