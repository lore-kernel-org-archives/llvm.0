Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022120.outbound.protection.outlook.com [52.101.101.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BE53F58D8
	for <llvm@lists.linux.dev>; Wed, 27 May 2026 11:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880544; cv=fail; b=X1Tw2Lha3OnQJVgRurEWyDmLuVcy1TVyHakJSqx6t4QWI+pS2Aa3U144gbwytLy0MKNa+grlgFU5OeNKabCQna501DX0MQVK7AYEwc8uHudsTQVbdRJGqNCviMQuqPMEPr3QteQzoVSb1uMh5IM88/Ftm/ylAPOKGhoScNUQyEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880544; c=relaxed/simple;
	bh=AGCEdyDuE9hzRA691Xlbmb/1XCOVc+mGTZwJJjRnKPQ=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Ti+wDNfPxwVTwoOCtv4GuSKEVinSpinZDNxEolLSkU4tfJvA06sZrBJo8OPJepditjchFT/iwIk6MHN5+LYV0+KXyZuLMIkBZ8FPoirsjdEZUOH8Vo4ARJNJ9rU3U2o5EFfq04KgiFvj0lu59zJGt5Ft9yw1mPvYgxfLRSK80eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mkgs4YIP; arc=fail smtp.client-ip=52.101.101.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mkgs4YIP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6OxdXl+fWBmy08KVNKVutqFSc3JKF3k0pHBR92yqhgYao+BhsoKz3stTOyYVzuxQWa1O5LG59A7da97HcjErVjrA9BXmCeaN0hx/dMw/Cnwy3ruBMqV5/Pe9dpdSUoaWDrKu4Kk6dNHlXgfws/PJuux5hFZmARQiymHsNg0dbBWQU9EqpGPaqM8uuUoKgBnlpknWBQXz0TmDlpYyt3eAsumOmyKrh/UHtU077nH/KJid9Krqof48rkEXsVObu8pVECR4ZJvhdrFvaFbJGO3nqa1JVBKktjQ+FaNrbjnnSN2eLKKo6CQ9zNlRyy6Mza5jDqD4Qkbf0sy9aT5bwSWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGCEdyDuE9hzRA691Xlbmb/1XCOVc+mGTZwJJjRnKPQ=;
 b=wSNMonhmTuoxCs9GUCYrDxZhV4Z4UCij+eo7hJaX7iuAwcs1Pro41RsE/Roa36h4bTlEuCnvlN7yw6utBgdhaf/aIAQq+bs8Qb9qx67VrSigyJ2+1QMBeM/iDF8/8u+jjNo12iWk0+PtHS+pOGqRPH4MvseEZUCXQ9VDENSplcZ959tDjAcNPvMsmNvnEHRlQmQ7RBawWjVcZW/nyTnYGNSSFyoaI6fcQ+buYd9TbXelZvbUdHsAFXdw6Jdb5jhx2l/Qggms9/CxgtUYosT0KuxUsc82fgIM42lK3T9Yplkug2UfG5ZEVH2EbTcNcJqTF9z/44YWuscgSKW2DqOYyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGCEdyDuE9hzRA691Xlbmb/1XCOVc+mGTZwJJjRnKPQ=;
 b=mkgs4YIPPYaLFLANlQDM1Ul7hHYAAih6assaJWUD/p2uFeUfdZkYThhDn4s3Xm1K/co4ZmXDqvmdAzdnG34NPGcYqXm3wXMoKoUEoKcCV70DDHXufabH1vnI97AZ6HVSKCbO4i1lPAqcQSdS7otWXfmX5ZB14m+9nizef5dJoco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6358.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 11:15:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 11:15:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 12:15:39 +0100
Message-Id: <DITEZRMNTOX2.1DKO9U58508S8@garyguo.net>
To: "Mukesh Kumar Chaurasiya" <mkchauras@gmail.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: <maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
 <chleroy@kernel.org>, <peterz@infradead.org>, <jpoimboe@kernel.org>,
 <jbaron@akamai.com>, <aliceryhl@google.com>, <rostedt@goodmis.org>,
 <ardb@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <nathan@kernel.org>, <nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
 <justinstitt@google.com>, <daniel.almeida@collabora.com>,
 <acourbot@nvidia.com>, <fujita.tomonori@gmail.com>,
 <gregkh@linuxfoundation.org>, <prafulrai522@gmail.com>,
 <tamird@kernel.org>, <kees@kernel.org>, <lyude@redhat.com>,
 <airlied@gmail.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
X-ClientProxiedBy: LO2P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: 4977c0c5-0aad-416c-d524-08debbe148e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VlYvOckzg9OTndtLestvKO9eCdwjUm3u+s/T6k5zz//J1tNiZqkA4sN9eM0DGJvPa37BPCqw1p+1NofjiudXIwprbF5RzJqPUqvKdwEFqUm7XTQwL+C8KGWWoTre+QjVq3Pl4QZu2n1ihPkt56dv5qH7qQSsxdfQrjDOjxGdlt0HfG5vn8FoVmXQSn8KDb3BoQepq6jBUDyGgYhZ7aNqbLfKoyJvSbQJW6yiZa1s8J2+8VOZprAseeQsopDEsH7lgiFtmmjixTasTCagZEhdVcjzkLYdiTk4d07QYo+5wfNCByI6Km+WzvgePNM9UqlgkqtFqlXYGcZwmQG2rMPu8jgrzcJWc1R6skKadvJmvv3u7lFjRqWA2K1i/kbouoSlZpemvva5tCxvQT/YjGglTO+u/bq0H/zbfFju93PQWMRiYuVmhmRDRGMrCJ8C9vswujNrLnxL3qoKenptl355owt2+AXPmtq51iuG+q5D678sKNSLFpWyL+UP3X8YyhhmcT1MtrfKKDHa+HNX8GBqYsmWcuRT3vd2SiOXE9aziZ4gqTKpIQupDi2fkWQMxA3GAedJzYwjTc5D3wPHbsEZmQQL80bY1v+O+51m8EMKAyFZZeF17sg/rzMZ2b/DaAEnRPBMJjoeH2S+ymdmvRiGapMxDFOE7zkbTMv8PqxnNQV36NsjYekT8bjiXlPyx4iQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1ExRUdKUFlGMlVDMXgwTld5YlV0YzJrMW51aElFTE9MbGFUeitTd1c1SThu?=
 =?utf-8?B?TGIvMnpBL3dwSk9vSC80bWRXTllna21qR21BcWQ0aU9XSFpIaUxtTnJLWkwv?=
 =?utf-8?B?ZGZrYTc5Z0phS1JaaGIyWXc2ZkRPVWVOYVMza2lyeGZMN1NIRm1ReTlCelQ5?=
 =?utf-8?B?SmhSQTIrWmNSZmwxUVBRUk9JTlphZ3JMTUcxdUxvcDJnYnYvU3dxTE9pcFdO?=
 =?utf-8?B?MFVZZzRvZVhCcDNHejJJcGhzUlBMT2JEOWNOMXR3QjRhd01rSmZnS05ETGdz?=
 =?utf-8?B?aFBMV2ZsUjhoWmZ6Z0xYQzNpM05sUERYVTFzS2duNGRZdnkzaUgzbWtjblFQ?=
 =?utf-8?B?UlBrRkxaNFJSeDRZdUw5WkEvNnY3bXRiQ1Q5ZUcwbzN1eFRGNlQxRTQ2NGxk?=
 =?utf-8?B?c3dFeDJaOW9sR3dxYUt6aWx4aTR2RXFHSUVzSjFtK3lUa3hPVXcyZnZKVjRD?=
 =?utf-8?B?Vlc2NjdaV2VtdGcrVThHQmVUZnh5UEpNdDBjNUdMNTcyOHU5aS8vZW00N0xm?=
 =?utf-8?B?aUFDdHdMRzc3dDhRcWlNVm9nV1RiUWZGMG9EVzdFdXAzRDhNeXVRcURyVEk0?=
 =?utf-8?B?U0hKSVZWOFRCTzExT2thbFE5Q2ZKUDI4TUZBOTBBZUM2d0tCKzlKcUswbFl5?=
 =?utf-8?B?YUZCV1lhVHFPSnVsbHAxZWsxTVlqalYvZG1FNFBlZXZIamI1VHdiM2lvbDYr?=
 =?utf-8?B?UnFNUWZlSnVwaFUzSGJoYjZaK2oxZWYyRFhXZFdUZWF0MDhvNVo4QTJ5NVV3?=
 =?utf-8?B?Y3B2aSsxUFZiNFVpc29nYUdhMlVpYmRTSFM1TTF3cUVSOEExWFVWQlZhWng3?=
 =?utf-8?B?azJFaVpYSVdFUUVxa0lKWTFGYUVydnZSN2l3YU8vd1BHcTZNekdGOVdrYzZ0?=
 =?utf-8?B?VGQ2eVFXcWVpL2hnNTd4NXpWR0daZ3ZRNGtodmc5Q0I5WElQTTdhRG9zTkk5?=
 =?utf-8?B?SVVpNjVlQjR2YjRTQjk1czhlcFpDdzFwQ25WVG1vQld1VjFMRFJoemM3N1JM?=
 =?utf-8?B?a1oxMHFpblRVM0QxWWRCYmdQUWxMeFVoaXVLN2ZQcldPeTlubmMvR0ZTaXVI?=
 =?utf-8?B?L3VaQU1neVRobGxaTUFwdjFrckxXT2MrNlVQS0tiRUpmZFhTaCtHaWliQjY2?=
 =?utf-8?B?eFFSck04VGNxdHpwTzlpR3N2Z2JnRGp2N2hOZ0ZlYUtHUjVpZHdqbm4xOGtH?=
 =?utf-8?B?aXFnVmpsN3JmeWpBS1Fvd09WTHQzS01zd1gwRmxvU2lDalNwdS8yZ0VzUXcr?=
 =?utf-8?B?Tzc2UVNqYi9EOGJSWEU4TmJweVpBaW1lY2J5T0hXbi9vbjBydDB2QVBCYVdQ?=
 =?utf-8?B?b1k0NFRRL1pYcFNwWko1ZUE5ZlpJd2FEb2tVTTMvWnJRTnpUL1plWFBEbzRu?=
 =?utf-8?B?TTNtdVdzT05wMDM2dDJLZUhVZXFVSG0xeDg1TVlWSzBRd3djUzNMbk9BRDZU?=
 =?utf-8?B?YytXK1ZaY1o1S0hMSDVUdEROMk81YnJXN1JoSXRnNURDUWVJdVI3Z0poOXBm?=
 =?utf-8?B?cGwxWkY1aXBBb3NOdnlTamdPUEV2c3JCN1plUk9jMGx3clErM0NSY2FCMTlM?=
 =?utf-8?B?Ykd1clhmbXBBSVMwU3pCYXZkcFhDYnlESWl4RFM0Y1NIeVVvZzRWVzB4cDRH?=
 =?utf-8?B?T2ZHQVQ5SWl4SzdCQ3dkWVBldk1UdEtmaDdXWm5YU3BBSWNnZk1TcUxGc3gv?=
 =?utf-8?B?WlFsNEFlcXRWbzROYkwwQ2hJRlpWN3lDOHZyMHgveTd0UDZROVJIUWlDblNQ?=
 =?utf-8?B?S1lUcEo1TThzeWhPbFozZFAwTFo4d0tuVGtKVmIrZFpMQUZXcG9tWkx2OVdG?=
 =?utf-8?B?Vng3UkVMVk1kV0FJZUtpVkJ3a08yRUdwaHZhU1o5SzlydTJ1RTJVeithMnIw?=
 =?utf-8?B?K0V2VE5WcCtJYmk1OHFuTUhkTnpPTkhtazBrUlZmWjd1WW9MdkxoejQ0RVln?=
 =?utf-8?B?RDNaZ3d2M2xCdk9SZWYxeHhlakJLZ2tRdGhPQnZRZkhWV0FnNmUrS3NFUzNr?=
 =?utf-8?B?TTFSNTQ3WE5iUHRwMGQ5NXA3czg5RmVnTThMekpBdS9EaytpeFZHN0NUeU9V?=
 =?utf-8?B?dkxsS3d2SmYwVlo1TFU3cnByaTF3TGV3ZmJZank4WGQ0RGNrV2lYeHJOcUEy?=
 =?utf-8?B?Wi9IcEVRZm9JSCsrVUR3RERkUWZ1UkhUVmh0QmJtV3JFR1BVZTFNcS9PZkNi?=
 =?utf-8?B?bjJpOVFEUXFidWNKaW96MWRUMWswQ2VoaElRSTUyQ2dvUHlQVVZmUGdxZVJI?=
 =?utf-8?B?SGt1TzlXU1RUcU5DVkY1TzM5UlIyZ0djU3ZueUh2OTU0MnBVVDU5djBmREVj?=
 =?utf-8?B?SUg1SzRlYm9xUkNYNmFJWVRWMXpqekdSWStDblJVYVdmVGloNEs2QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4977c0c5-0aad-416c-d524-08debbe148e1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:15:39.9138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7bH4D0pniisW0qTRfj29aQf2+B8RElnxq8GFHnnxwVn38iMIluUJ0W+Ty/grxw+yctsGWfjrc59RJHCMng6Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6358

On Tue May 26, 2026 at 9:52 AM BST, Mukesh Kumar Chaurasiya wrote:
> On Mon, May 25, 2026 at 08:16:53PM +0200, Miguel Ojeda wrote:
>> On Wed, May 20, 2026 at 8:48=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
>> <mkchauras@gmail.com> wrote:
>> >
>> > Minimum `rustc` version required for powerpc is 1.95 as some critical
>> > features required for compiling rust code for kernel are not there.
>>=20
>> Which critical features?
> Hey Miguel,
>
> Right now i can only think of inline asm. I can rerun the whole thing
> with 1.85 and figure out the issues with 1.85. I'll get back on this.
>
>>
>> > For example Stable inline asm support which got merged in 1.95.
>>=20
>> It is not needed that the support is stable, but rather that
>> everything you may need works.
>>=20
> I wanted inline asm be stable, I was skeptical about inline asm to be
> unstable and potentially messing up the whole system. That's the reason
> I waited for the stable support to get merged before sending out this
> patch series.

AFAIK inline asm is only unstable for archs for their surface syntax (i.e. =
name
of register and classes). The rest is just LLVM inline asm. If there're cod=
egen
issues, you should gate on LLVM version instead (Rust supports multiple LLV=
M
versions in a single release and distro may use different LLVM than rustup'=
s).

Best,
Gary
