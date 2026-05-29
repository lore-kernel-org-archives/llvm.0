Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022115.outbound.protection.outlook.com [52.101.101.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D856133859C;
	Fri, 29 May 2026 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780061510; cv=fail; b=dYLKk3enpfg51h/yh1PjL5B4+HvoZ4MOZZc3uJaa9RHmbtjCE4CATgoYZ+kaICsN1CdZ4PhDPEGIryKXfBSoowjzm60fqJMsWH6N2BjhKJUkGtcY4m94/G3Nxz/2NiL+d8V99HDaYoyw1PqAARGY27WPqTrzZGrQmAMezqggFZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780061510; c=relaxed/simple;
	bh=PNAy2ovIyRcabnXTxdu1jHzg8P9+DrOZSARq3Qs+DZ0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=aDfg79seSfVuz8BgpVlekwkdo78Y1/sFbxwqApBhvEFXPc/xRvp3G78EsZnNCeO4K5YNp/afM9w8jbdxBOZRuYl4VEMF37HC2xQCijbEcUZb246ZZEoPz3jrApreMuVMmZcdeDKuN+TY0JbezV9WZm3ZVXvQgSmBt+PUkCgOjeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zkTVV9Zr; arc=fail smtp.client-ip=52.101.101.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zkTVV9Zr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCVfZRUMCnnL7+s5APwCHh5LWwRyw7wYcXLITlrrvMV6e5dcsrhmCqhFOkeWmqiVHJgG6lLnQ1wkZQf0KZLrFkQKIqojInIvHEm9zE8GZ/LJme1AN/EukChsXqawfTbypiG/97oLVXFuHkoJNpN0sk2fKE2/NKbGi5gIkJ/7uUSQcZSFqEFnt1aU+HYs8Qqd9rsDVvV56gNoH8jFWR3xbWQl2j1r3lL8blKqyNB2ZSxvYSIcAue+0lyZOVnY8SQeX5/G0msuQl2dNTqyeLsFz7qelPqlc+DBwyoUhNfQScwG/9pNhOQRkqAvI3CDzdb8XSG9SDbaJgBnCpscGk7NRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjkpkov86ju/feilmBr2sp5Y74+VHKzUZ32UEid3Sr4=;
 b=o5sl8Dl8uYrx8MOqIhG8okKflfVx07hQm055xBi7aPSqqXxEhesxO6BHRvWR6q3Fpu4Sib40zaQDJdAtYRCT1ZlI6PUInruBPK+f1dVfnWNHX6L1irro8t15mH0Y1gUu61pX/RU4/p0guEOpqmAJxNeo0jEwhcrLK+z1Q42pOahtseg7N0ln/LOSD3FnR3MEZNbQc/zRWUX/7KhgWFwbe+8pDJSm1kBmUqbbyTYxo+/tjPmCCkLocQDxEWDXvSv6kVuDdG19U5iXHldINst7Cr2Z+E/D08VxYMI0zfQW56SY6XrCZWp4Iyge6z9hucPKgPy6a02z98Xme5kvDj6oHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjkpkov86ju/feilmBr2sp5Y74+VHKzUZ32UEid3Sr4=;
 b=zkTVV9ZrMcQoWAqPEcgTqrzbmzXvvMfgKOEfz4q+NExLOxqeySHd1c3dl1Xq/BVnmwze5qjHx2wUZH9q0YCOxWeKurhNZ0OCXOlU7nyuGY9bvG4YlwtwSta4H65/qd9ZpPzuAijq+Msx9uNTQ1SZ/W1GkcTJsqFHPgzu5liP5C8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5627.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:274::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 13:31:43 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 13:31:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 14:31:42 +0100
Message-Id: <DIV7510GLW8P.1KP88LYA360IC@garyguo.net>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "kernel test robot"
 <lkp@intel.com>, "Danilo Krummrich" <dakr@kernel.org>,
 <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [linux-next:master 3728/9137]
 samples/rust/rust_driver_auxiliary.o: warning: objtool:
 _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <202605291041.seNEWvLQ-lkp@intel.com>
 <ahkzosbjO4NdSyD8@google.com> <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
 <CAH5fLgiFo1rep3N5qGWGsTXT177hfSwW0=e1KsVCrrz2uRMoBw@mail.gmail.com>
 <DIV0HOKW3R1L.2ZK80B9TV36H7@nvidia.com>
 <DIV5H9S8ZN2L.234ZKX4RBF6BO@garyguo.net>
 <DIV6O6TSXRU9.2RAEFRRAGX4EM@nvidia.com>
In-Reply-To: <DIV6O6TSXRU9.2RAEFRRAGX4EM@nvidia.com>
X-ClientProxiedBy: LO3P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: 982b33c0-59b4-4a19-5765-08debd869f27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/NaxbYU8eBPcQYvlmJylfHFpTmdGAZYqanp6XS1nTgni8kgZH9BnSvzsOSayf3fG8lnbdkUDoAkMaaD+//LxA4/YQqMdiDygbAmAGUdBNR39+gXcVfB+hPx6c1/sEPp2UTRo09H3WJxaGCx4JR29PSZIexw8LMFPVrBXNKiIh/W6Y4eCLBr+i0SQJghWwyRcuwbRdh9MCFoxMlQ+7CXNo8XbDKi8TKpHePirIo1KFN463FqynNWy2YbJBfVsk/8ru4Od1SnA41GyB9X54sxXPoJ9CMR0uAh2pdRY8KSk4Jpld60IlEw7Bp1JFKmHC6/ZbB4ifZDxCR9h+uj2x7DO3qYxOlAsbgVuoFkC0gZ5ioaTkI5uhjdCh6ZPMlyBZyNF26fQyLAnnkpTK/0WazCuL594XPJJ8MPWEGkO3RdvyfBPQ7AUZmxZEYG/dCwjH4G5dQdMaWRIru7Jc5EgZiywEKgQlBqZN3lFiJHEpndl2QCScMzf2gn/TYxRFcyn5CqBiRgc1vuKZwZzCX7dpkGEEVKOjm1wCA02osKCWUK3HpqIG8gLQXqVsriuOQLsvuNm++cxe7k0EZNxVqzcEzvCLIPChPEFTt8Bx/G39PalIKMclJa1LtaPCXVKiJcr/u4HRgrx+3pP5LGUWh9NrSdFEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXkzQi96dVhsTmZXTGdSMVhIc3ltRitaSUhLMG1hYmZaOVI4elZEdVFtamp1?=
 =?utf-8?B?dVJtcm45WHkwMkovMktYa1pGTlh2NTRTcENUWVVXTTJxQ0U2YUdmMmE5SlVh?=
 =?utf-8?B?c2F5MHYvNUdNZEthbFRGU3RlRDZLVkNkYUoxM2JMdktJcVE3bjlhM3Uxb01R?=
 =?utf-8?B?U1ByWjFkZ1dlMlBtZGlUUkVxYkF4SE5aZjF1QlV4bGZNeTZqSHNSQ2xucnNN?=
 =?utf-8?B?QU5hODgyeUZQcS9rcHgyOFdMUjNKa0RkOHowTlRoZW1zdkZGeDhNc090clNs?=
 =?utf-8?B?MVc1eTl4cmxuMzMvZGxXRFREQmlielZzdXluY0E1Nm4zOU5JN3ltUjloYjhh?=
 =?utf-8?B?cENYc1dHOUxMZm5QWngvamV4Vng4SGxtQUJ2WWNtaWZaSXF4NWhGTWlvWWlj?=
 =?utf-8?B?a1B0NjRvRVMyNnUza2NJQ1ZPbFlKcVBzVmY0bVp5WWZmSlg1bktGVWpLeW9x?=
 =?utf-8?B?aWpOUkJlQjNtTHIxaU93RlNPOHY4SFR6aVh6ZnBLcThxK1RrUFpCT21qZjAr?=
 =?utf-8?B?ZW9Md1FvdktNT1FqeEQrYlRqMmZWb1FKRXpPaUZrSW9KNkdlTitudzdsRmZN?=
 =?utf-8?B?VDNjUXRrbG9td0RZc1duelFIZnRnSG0yRnIreENaQnlyS0dON1pGTGZ0TWVv?=
 =?utf-8?B?VkRUYzlnN0NCQUtkMGU5WTlNL3NuOHFIZGRKYmRUQXBwck5UREJqNWc3c1VI?=
 =?utf-8?B?RVJZNmZlUkErcDZ5SmFjc0xFQUdhaDcwRFRqNGZlS0dLUGxoYlpDM3BkMFBr?=
 =?utf-8?B?NDZUSDUyWEZzZmNEdGY3bThXNFRiK05UdEFZbE9KaHlaNzBTUUZxSEpvOXBa?=
 =?utf-8?B?K3FuQ1ljSVFPYWZWUzYxbDFoaDZsWThpNnRtM2RvazhuUE9SbzRMMG9GRWM0?=
 =?utf-8?B?Vk5hSVIzTGdGaVo3WUJEWlMyUlF0b0RMSDVZbDFUMnJBenZVbjRrZjR5SFNG?=
 =?utf-8?B?QXVOcy9JNFFjNmxXam5oaHlkcmVaUE9XcXQrOUZGa291aEVldG5FT3dpeFUr?=
 =?utf-8?B?RlhCSU15Tk13ZFRjZkpodmY5WmpqdG1Wc0lhaEZBT1BjcDhzVjQ2VTNzYWVP?=
 =?utf-8?B?YTdRUWxYZ3p4MzJQTm1ZUXh2S0hqOXAwTTVxMXlqaDc5OU9ybHJyRVU2dXZq?=
 =?utf-8?B?bUNrRmZvM01WRGNUK3JtcDVNc0g0SjgzSktoaHB4eVpkeXVyNFVnNFRadnZJ?=
 =?utf-8?B?SXJRK2lqYjZXQUg0NnJmVFJwQ0pwWXpzbS9wR1BkbHZZelFrME5XRFVDSm9M?=
 =?utf-8?B?bXI0T2t2MXJTZTRkY2pWVDRNSDg3T0JXNExGZ0JGZnEwbUIxaFNhZUh1YXR1?=
 =?utf-8?B?VFFLOVhUWXRXVjVrOGo0dFZPejBvR215TUg3Yzd6UHkwaHR3TXU2QVFHNmJK?=
 =?utf-8?B?RGZmY0xiQVRvT0dLOURmRW9FRks1Vkw2SUZzMlBSRUl6dTZ2bWJaTkdBVFIw?=
 =?utf-8?B?VmpmTTRrUlllWHJUMHRTbWI4Sk41czM1akRycTFYYW9TbUVxNHp6cmFrNXdG?=
 =?utf-8?B?UnhxdjZVSGtkSFE0UnV6VzljdjY0SnV4WkJzUXBMZ2x5VUhPK1E0YnhqYVZy?=
 =?utf-8?B?U2RuTjRXT1BZWWQ0ZjRuUG5mdXd6SXMzM1FaTjBYSEpMT2RXWTBTOHUrWFBY?=
 =?utf-8?B?QlZYL2NlUzRhUmRaaFUxRldUOGRQSVVaRUlQLzlXM1NzSjNxMFlxQ09rTGhw?=
 =?utf-8?B?MVRxbHNHVTMvTmhaVXRIaGhscTRvSU4rS0k5aUFqaTlzdkQyZHA2UFNRNC81?=
 =?utf-8?B?bWR4WCs5cHlxM1BMYUkrelRIYytmZGpoVURySUw4cmU2SzZyZ3dFTE9GOTBY?=
 =?utf-8?B?SkJ6OTRHT1R4ZGQ2MnAyQ3BSK3dIRm1yUVN6SktsUDNHSGdGZWkrSEMxRUR0?=
 =?utf-8?B?VC93VzFIMjRKM21naEJwLytrNjdUS0tONFZDWE9OaUVUVTBseFdQdDl2TXZr?=
 =?utf-8?B?TjVON2VpNUxNTXBiMHkyYnV3NmRlOFdjMktySXc0eU1RY3ZZRGdpZ2xFTWZx?=
 =?utf-8?B?M2Jycmx6anJwU1FQQ0d4NDNMYkRQU1lHclhweVhFS1h0by9VWHlZemU4ck1P?=
 =?utf-8?B?Rnd2d0VLeGRxOE5xNG9PaGN0bDVJSkpJdjZZVzFIRzczd0RnY0xhbWVBZm9t?=
 =?utf-8?B?a3FRWDFRZ1ZpV2xRVGxXNGQvV3MyeGVTalEwaW5kMEd3R3p4SzB5eEY1Tkhw?=
 =?utf-8?B?TEorQ29LU2tUek4xY2pDYVJwWXhLYUxObXFwMDZDeXJjMDVRM1h0S1JpdWNu?=
 =?utf-8?B?ajFLanBxUDA2YzNoS1krblkwYWdQMmdXd3IzVFJtbHg0aC9laldoQUhZRk1N?=
 =?utf-8?B?ZzZBUkhBcW0rRTVVYUM4UjVneHNYbytwS2p5V3loSGtaTENrMlJ3UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 982b33c0-59b4-4a19-5765-08debd869f27
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 13:31:42.7491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsH9dKYw5RZuX4reAkP1WiRSsb+JZXWNsJ/jNd6lccCqfzGpOWPRfBbVAAxFw9I0Ct+2JL/vIcCqRKc/scTnyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5627

On Fri May 29, 2026 at 2:09 PM BST, Alexandre Courbot wrote:
> On Fri May 29, 2026 at 9:13 PM JST, Gary Guo wrote:
>> On Fri May 29, 2026 at 9:19 AM BST, Alexandre Courbot wrote:
>>> On Fri May 29, 2026 at 5:00 PM JST, Alice Ryhl wrote:
>>>> On Fri, May 29, 2026 at 9:54=E2=80=AFAM Alexandre Courbot <acourbot@nv=
idia.com> wrote:
>>>>>
>>>>> On Fri May 29, 2026 at 3:35 PM JST, Alice Ryhl wrote:
>>>>> > On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
>>>>> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux=
-next.git master
>>>>> >> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
>>>>> >> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust:=
 auxiliary: add registration data to auxiliary devices
>>>>> >> config: x86_64-randconfig-004-20260529 (https://download.01.org/0d=
ay-ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
>>
>> Ah, OPTIMIZE_FOR_SIZE build, it's always this...
>>
>>>>> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-proje=
ct 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>>>>> >> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>>>>> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-c=
i/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
>>>>> >>
>>>>> >> If you fix the issue in a separate patch/commit (i.e. not just a n=
ew version of
>>>>> >> the same patch/commit), kindly add following tags
>>>>> >> | Reported-by: kernel test robot <lkp@intel.com>
>>>>> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNEW=
vLQ-lkp@intel.com/
>>>>> >>
>>>>> >> All warnings (new ones prefixed by >>):
>>>>> >>
>>>>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.mo=
dule_ctor+0xd: call without frame pointer save/setup
>>>>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.mo=
dule_dtor+0x1: call without frame pointer save/setup
>>>>> >
>>>>> > This one looks like this bug:
>>>>> > https://github.com/rust-lang/rust/pull/156980
>>>>>
>>>>> Does [1] work around the problem by any chance?
>>>>>
>>>>> [1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556d=
55@nvidia.com/
>>>>
>>>> The asan.module_ctor error? I don't see how it would work around that.
>>>
>>> I was referring to this error on the report:
>>>
>>> _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiab=
Plh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDa=
taNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB8_9allocator7KmallocEI=
NtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5E=
rrorINtNtB3y_10___internal11InitClosureNCINvYIBH_B1L_B35_EINtNtBa_4init11In=
PlaceInitB1L_E8pin_initB4u_IB4O_NCINvMsc_B1O_INtB1O_12RegistrationB2l_E3new=
NtNtBX_7convert10InfallibleB2l_Es_0B1L_B4u_EE0B1L_B4u_EEB2n_: symbol name t=
oo long, can't create __pfx_ symbol
>>>
>>> As this patch might help shorten the symbol.
>>
>> https://lore.kernel.org/rust-for-linux/20260527-pin-init-sync-v1-5-e2033=
5ed2501@garyguo.net/
>> would also help a bit with this, although I'm not sure if is sufficient.
>>
>> Also, regarding your patch; do you need `#[inline(always)]` or is `#[inl=
ine]`
>> sufficient? Inlining shouldn't be forced unless there's a good justifica=
tion.
>
> If the code is not inlined, we risk a build failure - pretty similarly
> to the link errors of `build_assert!`. I'd say that justifies using
> `#[inline(always)]` here, but maybe we should also add a comment
> explaining why we do so.

I think for long symbol names it's a very difference argument. There're man=
y ways to
create complex types that can lead to those. With this logic every generic =
code
needs to be `#[inline(always)]`, which obviously is not what we want.

Best,
Gary
