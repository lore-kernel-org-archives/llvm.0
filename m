Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020127.outbound.protection.outlook.com [52.101.195.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8766E343884;
	Fri, 29 May 2026 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064704; cv=fail; b=u+0dmXDeM0Dzd+KwAX/GnNWKX7UgP+PAea7zW56Y30JJboqhglS82UEDu++Os6hoNp3S5MCSLUP1MYw0SwzMQHyubojgo11Zk+vZgGNyTbkG+t5m+P1xnZ3Zl5lJpcC/dQoAuj12ZNiq/YJVl0NZCnalmEI/oQJi7WS3kjKhdhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064704; c=relaxed/simple;
	bh=FLL0V7rAPe7epv+V0PyRoczqqz+2TUQEIuRRu8Jj8/s=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=NxM2cTcm/rCrPMpUyflhD1CB+x45OkZ5P1P0mIMeLPpTGHBX+Pvx7FPDwA+4iM9h2k6SzuMbh1D/iSSYapNxn8oieZBtu3dA5+kMx86RF8susMINYbGyNFCBi/3bE/DYU8/nNDwvkU++0kXtqnUijCyrYct+lUFfutIA8WZa8oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=hD0icOM3; arc=fail smtp.client-ip=52.101.195.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="hD0icOM3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dR4WZe3DgkLJ7TwSyqWDtu9KOJIkyffoiYSxGeu4Pen5zZke8CVOBXFe0GnS//H2+i2A7c55DaMFfMQJkgVUxgocDxiiuFC2U1FJxToIEs1AUDMqd0oAPp+l7LOFMdTO/UStwSev5BXX1jEO8DFO4GhELxg48RuXZVkGMJqlYUWFveosnNZLdZr1sW+ji/IU2lJt7eOYuTCSbv67c4h25G5a26RLpCYKDWxfZ+eZdjLzPwSohg33B1Om/zAyLnFGY7oGCSULRqjT/A1drtkGAINXpMjSp/jW93xfLKaLWz8zKkMXrX/uvFgDW56rFf+CazkKguwKsr/fQjFwYzpL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpSwpj7CxV2y5bTihOMVPdZ3eifUGPLGd/2hqm6ps38=;
 b=nEExndqPRkkqw/z0U8v92E6RXJO2IpqjTvdFvRtpdlu6I9PbNuxBfQi8WHMWBXsBQLQcjaUNvpwqfiygYCvOtYI+nRfkqbw41npKt/J18VPGyCk/vECVs4IHjXJ7K2uPTdHXB45hcwgVBaIIOaTd6nsj4fGNcL01/lF3NuVazTh9PbY0jRHXqHjqO2tcmZoQjx/UhMBHrOXNAPwAvd7NWBgS7zJYZDKTSuja8e624Ue0jasRBQpFXBYlCkvnvWJ2QQHpSZTGjMgsp/Cw7x6Ue20BZxWHfb2hmoDlWivjikUXEsGC4Y9wvYgMpjzNriZ5BaucmNIJ35LHNIyvSHN66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpSwpj7CxV2y5bTihOMVPdZ3eifUGPLGd/2hqm6ps38=;
 b=hD0icOM3r+CK0OZYQBxL39bhU71IjG9bnhxzfyaSK89AqvQTyGZtguD3Q1FimL9BPiUMLw5ZbZlQGd95hHF+4PjHeE4PxbeUTLg81odelr/MZ+8yqgsQh0U70LJghw4Sm7ukN7sPa0u2N2KuhPCgu70bE4HAo5xTraZ/rimYlG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2248.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:79::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 14:24:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 14:24:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 15:24:55 +0100
Message-Id: <DIV89S3WNBBG.1DWPGA9DDUQOX@garyguo.net>
Subject: Re: [linux-next:master 3728/9137]
 samples/rust/rust_driver_auxiliary.o: warning: objtool:
 _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "kernel test robot"
 <lkp@intel.com>, "Danilo Krummrich" <dakr@kernel.org>,
 <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <202605291041.seNEWvLQ-lkp@intel.com>
 <ahkzosbjO4NdSyD8@google.com> <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
 <CAH5fLgiFo1rep3N5qGWGsTXT177hfSwW0=e1KsVCrrz2uRMoBw@mail.gmail.com>
 <DIV0HOKW3R1L.2ZK80B9TV36H7@nvidia.com>
 <DIV5H9S8ZN2L.234ZKX4RBF6BO@garyguo.net>
 <DIV7XF0O2B5A.QMQBUMXB3EJP@nvidia.com>
In-Reply-To: <DIV7XF0O2B5A.QMQBUMXB3EJP@nvidia.com>
X-ClientProxiedBy: LO4P265CA0107.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2248:EE_
X-MS-Office365-Filtering-Correlation-Id: a12ddfae-f795-422c-5935-08debd8e0eb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|56012099006|4143699003|4133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Tl+j4fq1E+j+Yc00CnsG7aXWw6B1/LxTWLOXFba04eGeorMvGyxrKrziC4x2iOAEQPnbLWjaa5ToFky0moezdcd8uM8+gB1TcWNB/gOHFg92Tl3BRzPyNUcHPwueoOYNwbnZS4unfLGqZ76wwPGyVTGIDDkdbpvABKMxUHG4oo+3xGarsfyowMtwBJVM6h9LqZWbt0eXUii8PjOl8hBFWbZ5FtIcVnRsOFuhe4WGg5zDHreoJUsOWFepDi6HtSjyU8lj8Se9wfpDGVZtG79EB+l7hsylxN7Twj/9eZDjox4BB8U+x2CmdeYHP6JBvodmOV/xNkx0j6eKZN9X23Pw3VP6PXvg9ORZU8ZJQtJtFwK9SZz2VYOzw0okNIaFOvlbo5ldveGkoRDAbrGjqfPRUzesCzbdFhZ0DUwBe3ojITfFPW+0CnEaL1Y+Bzdb5JwtcFcl06amXdcFNCm5PMWxKyq09thqOQfHiqIieNeAuXvPmuskPlqRMdXwDRhQdk6t+/uB9d4KQC6FVEhsB43dzCjpYQc5brmuL8HZ1BTAtje94uEtY6coYYBJCkNLidQSwIXVLdl9GzLdxeYjD2CXsMX6VbFf/E7Woe3d+/Ct20u9R7ujklXYQ+a8ekO6sFnObNJCgRCHjiGxd54PiISzYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(56012099006)(4143699003)(4133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGs5T2VFSmRHR29EUGpwdFRLYkN4Ull0YmcxWFRZSTdEOFI5U0ZkRDluRVYv?=
 =?utf-8?B?b295Wkw0aUtXTHdsRE8wbHR5TzdSbVl0QzFVeXA0eUZvT0dQeGZjZkYxYnNN?=
 =?utf-8?B?dXNhR3pranJBT01oOXVGZXM3cW93RlBFZm8zd2VRVTJHcWViN3g5WXNRRjNh?=
 =?utf-8?B?aHladkNhZEVVcEJPSS8zUnBEb2s2M3Y1N2ZkczVWRS9EUnZuZzYzSHUrb0Nl?=
 =?utf-8?B?T2JuUUpaSDZCNWN3emNHakR6clpKQTY0TTR3QUtZcGpVeHB6ODFMTHM0bktD?=
 =?utf-8?B?MFBucWI0WVFsbkRjMSsrdXNYcjYyK1Vpb3FJdHV5RjA4cCt6cEZQSFV0MlFI?=
 =?utf-8?B?eGxJNHdzaUVXQ3JkSmdtc2kzMHNCdHliTmQ5bE9MSFJTMVhjYm5LQlhXM0tE?=
 =?utf-8?B?NVFCRkpvR0RLMGxrbGVoelBOMThuZHVuQUZpTlNKTzN4UVoyakYycGpQTThm?=
 =?utf-8?B?SGNzdEZGWlRaR3lRSndsQUR6alBGY3REbGdBaDJBT2l6UVRTYzcxUkwyblNV?=
 =?utf-8?B?WEZ4bW1rcjdBYzRobHlWcW9EK1lCa2lWNVVsTi85Wmt4K0J3NzRXR0I1WlFy?=
 =?utf-8?B?Ymcva2xXSHNOcG5WK3pBdnBXNmNDM2tLVVBSOWZETk5sVjdHbFMrWFM5SmNv?=
 =?utf-8?B?bXdsekVQZzhlYjIvWk1UREYvTnZodU0wRjJBTXVkbTNva2toYlRDSlhhS0s1?=
 =?utf-8?B?Z2JuUjZqYVVBQ2pETnp0RkM2SVFrM1RBcXFQM3dzMGV1OUN3T2grRy9hNWlx?=
 =?utf-8?B?eG5Bd2w0UVhJbHMyQmZsVExEeldPOHYyOEJPQjI0Skd6NXFHZlZ1OUtBUWZm?=
 =?utf-8?B?Y0xDR2lCQWxFcWErKzVYQU45K0orRjZoLzU2N2Z4dTBrMlZUVlQ4aU5wUWVN?=
 =?utf-8?B?ZzRIQzZlMDBXbUxGclZ1TTN0Y1JYOVpoRS9ZM09YWFkzMXI5TnBoNTNFcmlX?=
 =?utf-8?B?WVE2YjVvL0EwQ09QRVV5elUrK1d5dWRhamtuR0Jtd1pyK2lTeWZNcjNjVlpk?=
 =?utf-8?B?U2ZPbS9JR2t3NjlZbmRDcFFBdkE1cTI0QWJKVWw4elVGeDR1eTRmMndYNDJa?=
 =?utf-8?B?YTRVMEhrS3d0MUxtTjRwRzczWWI4OFYrSi9DQklTa0JPU25DS0VjWjh4U3Vx?=
 =?utf-8?B?VUFyK1VuS1dHbXJFMlR5WVN0NVNENDQxMmRINm5pSUxSSzhwYUl2cktwdGZo?=
 =?utf-8?B?RzFsSVdFV0VvRENRS3MzSkEvVEpaclEyWHhhWnZjRytLRGQzTkRhT094QUFQ?=
 =?utf-8?B?ZHZFQ1lqRG1xU2dTOUpkeXoxQWM0WTNzMGU5ZWNCUk5QWHFiTXRmb0VoYlUx?=
 =?utf-8?B?WVlVMW1pM2l1U2Z4ZUo4UUc2N2loRitTakUvZkVLa0dMME9jUk5xMmNIU1ND?=
 =?utf-8?B?WGRzZ0RFTStUTGVZNFU5RXM2aGFZeWNVRGJVM3ZPZFJnQmgyU0RXdWhMTkho?=
 =?utf-8?B?SGcwZG1RaEdjVkZKSDdOd0gwODR0M3dSUm5YQzg1SmllRmtpSC9XVlJobzNR?=
 =?utf-8?B?RUlpbUJ4NzZENzI3VCtzOHpleGVoRDkxS1I5bHMxbFNuUkRNYlRFU0lUTXVs?=
 =?utf-8?B?VTFxcG93K09wa2RHaEFTa0FCMjZwV1dMdndmaXI5eVhFTmpaK25uOC9hS05Q?=
 =?utf-8?B?VzI0NVlWTG9rbTFuWXZ0QVdXRGpiVUxIL3c2eWdsaHZia3dUdE5tNmhXUlcy?=
 =?utf-8?B?aDBSMnBhTm1xcjR0aGhYeVZOMDFuaGh0MUgxUVhSSXVKNW1mK01BWVhaWDRU?=
 =?utf-8?B?MnZLaUk3VmRHbXVoNHZvRUhmZmNyY3IyRElQQ2FkaEdPRk02VjdzRjA1MWZm?=
 =?utf-8?B?TDlZWmtRQmtvdzJsMDRSSXlOLzlUeEVqSWlsYjY4cHZLSEpqUzR4dEtBNlpI?=
 =?utf-8?B?ejRxMVhIZUZyTXgxa25kQVlUQldBaytJNDBnNDkyZ1pHSSs5R0NUM1FqbzRa?=
 =?utf-8?B?NHBhclFpbkdmejFJMm1UVCtVOEpYL21WR09pZHR6bVpPMUJrVjk4VFpOYmZO?=
 =?utf-8?B?dloxR20rY3pOWFF3SXh4NzJRTzNPTHI5ck9oY3c3RFJJY1haUU1iT2pERzY5?=
 =?utf-8?B?OGtKNElnRTlueVVtVEd2U08xbGtnZzhDenZkanR6aVhiYmRLSGFOQWM5V1Ju?=
 =?utf-8?B?aGk0VzJ5TUFMcHNXYWpJRGtpZ0ZScWdTSXR3a2VHdFo4d1M1ZFV5bjc0OUxs?=
 =?utf-8?B?SWdDN0ZFWVQxV3RiOXFhSVJBc0RsUGN4NzNMbDFGVzVydkFBbTZhY3RXTmhl?=
 =?utf-8?B?a2hJeEtuSUlCMnhrQTJvVkpPOGZMVW5HcVNuNS9SZWdHajlBMXhkQ25obndj?=
 =?utf-8?B?bmk4a1haS3c0TGtuTXZ4ZS9zUWZxTElsQjI0ZzRxZk16YnpTK1pGdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a12ddfae-f795-422c-5935-08debd8e0eb1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:24:56.3612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXTNq54Y6xBo/6KK17ZuRFcirWaJAAuBGIo9CcvZI0mQzFPjFnukqFAyDlrkQZJKZWmKhPXt61wmAGOJQk2nEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2248

On Fri May 29, 2026 at 3:08 PM BST, Alexandre Courbot wrote:
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
> So using the config file and base commit from the report, I get these 4 s=
ymbols:
>
> samples/rust/rust_driver_auxiliary.o: warning: objtool: _RINvXs5_NtNtCs1E=
KtwoKEMO2_6kernel5alloc4kboxINtB6_3BoxINtNtNtCs1peUGmbrgHn_4core3mem12maybe=
_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCsfAKt1AHk10R_21r=
ust_driver_auxiliary4DataEENtNtB8_9allocator7KmallocEINtCsfxcgfq7FLKi_8pin_=
init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3y_10___int=
ernal11InitClosureNCINvYIBH_B1L_B35_EINtNtBa_4init11InPlaceInitB1L_E8pin_in=
itB4u_IB4O_NCINvMsc_B1O_INtB1O_12RegistrationB2l_E3newNtNtBX_7convert10Infa=
llibleB2l_Es_0B1L_B4u_EE0B1L_B4u_EEB2n_: symbol name too long, can't create=
 __pfx_ symbol
> samples/rust/rust_debugfs_scoped.o: warning: objtool: _RINvMs0_NvNtNtCs1E=
KtwoKEMO2_6kernel4sync4lock1__INtB6_12___ThePinDataINtNtNtBc_5alloc4kvec3Ve=
cINtNtCs1peUGmbrgHn_4core3pin3PinINtNtB1a_4kbox3BoxINtNtBc_7debugfs5ScopeNt=
CsgkhUnUyOK5q_19rust_debugfs_scoped10DeviceDataENtNtB1a_9allocator7KmallocE=
EB3s_ENtNtB8_5mutex12MutexBackendE5stateNtNtB1z_7convert10InfallibleINtNtCs=
fxcgfq7FLKi_8pin_init10___internal11InitClosureNCINvMs5_NtBc_5typesINtB60_6=
OpaqueNtNtCsge5g75tgsAU_8bindings12bindings_raw5mutexE8ffi_initNCNCINvMs0_B=
8_INtB8_4LockB15_B3Z_E3newB15_E00E0B6b_B4x_EEB2G_: symbol name too long, ca=
n't create __pfx_ symbol
> samples/rust/rust_debugfs_scoped.o: warning: objtool: _RINvXs5_NtNtCs1EKt=
woKEMO2_6kernel5alloc4kboxINtB6_3BoxINtNtNtCs1peUGmbrgHn_4core3mem12maybe_u=
ninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCsgkhUnUyOK5q_19rust_debugfs_scop=
ed10DeviceDataEENtNtB8_9allocator7KmallocEINtCsfxcgfq7FLKi_8pin_init12InPla=
ceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11Init=
ClosureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7c=
onvert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB=
1O_NtB1O_3Dir5scopeB27_B6a_NCNvB29_17create_file_writes0_0B27_E0B27_Es0_0B1=
L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name too long, can't create=
 __pfx_ symbol
> samples/rust/rust_debugfs_scoped.o: warning: objtool: _RINvXs5_NtNtCs1EKt=
woKEMO2_6kernel5alloc4kboxINtB6_3BoxINtNtNtCs1peUGmbrgHn_4core3mem12maybe_u=
ninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCsgkhUnUyOK5q_19rust_debugfs_scop=
ed10ModuleDataEENtNtB8_9allocator7KmallocEINtCsfxcgfq7FLKi_8pin_init12InPla=
ceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11Init=
ClosureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7c=
onvert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB=
1O_NtB1O_3Dir5scopeB27_B6a_NCNvB29_12init_control0IB4F_NCNvMB29_B27_4inits_=
0B27_B6a_EE0B8k_Es0_0B1L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name=
 too long, can't create __pfx_ symbol
>
> With [1], we are down to 1:
>
> samples/rust/rust_debugfs_scoped.o: warning: objtool: _RINvMs0_NvNtNtCs1E=
KtwoKEMO2_6kernel4sync4lock1__INtB6_12___ThePinDataINtNtNtBc_5alloc4kvec3Ve=
cINtNtCs1peUGmbrgHn_4core3pin3PinINtNtB1a_4kbox3BoxINtNtBc_7debugfs5ScopeNt=
CsgkhUnUyOK5q_19rust_debugfs_scoped10DeviceDataENtNtB1a_9allocator7KmallocE=
EB3s_ENtNtB8_5mutex12MutexBackendE5stateNtNtB1z_7convert10InfallibleINtNtCs=
fxcgfq7FLKi_8pin_init10___internal11InitClosureNCINvMs5_NtBc_5typesINtB60_6=
OpaqueNtNtCsge5g75tgsAU_8bindings12bindings_raw5mutexE8ffi_initNCNCINvMs0_B=
8_INtB8_4LockB15_B3Z_E3newB15_E00E0B6b_B4x_EEB2G_: symbol name too long, ca=
n't create __pfx_ symbol
>
> I also tried to apply the patch you listed, but it didn't apply on that
> commit.

Looks like the commit being built does not have pin-init-next integrated.
The symbol that you reported should not be present with latest pin-init cha=
nges.

I think we're looking at a solved issue again.

Best,
Gary
