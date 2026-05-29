Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022138.outbound.protection.outlook.com [52.101.101.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE143E0087;
	Fri, 29 May 2026 12:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056830; cv=fail; b=khWciM/nfJLTJGVHtItZaqagEwdrOtm4lBbKViVuBOMPu5VKjs9egBf3no+PtAx2d254GaOPOtJtOigt6fqz5qHQx+9gOfRLWtBbxUnk+raKFxWnHvlnfw8W+V72ad4e3JbIy0JnTsl0wWZmw+80wHTtCQCnWFVki4nubg8/8X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056830; c=relaxed/simple;
	bh=gLWu6EXehftzTZTZMx82gpAraw4auWfUeZHBA1265dc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=LYrMQZ/gMDPdv6FJCKcczkKu6i4zsEwUy+SAxbiivY7FygQEam3n2r3w7W6JBpQ0Jou6pvK3/L6lZ5GsFoc9cqOsFTUfzZBw5mfqyhkHPVJpmArbPq1QpyyowFaWqT3O/Ls1bsiwIt0vSu/OReCDBN6/RSs9TU5Z9sP2SdBFX20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=bXC0AfFZ; arc=fail smtp.client-ip=52.101.101.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="bXC0AfFZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6WGrpGey8FsAxhJ3EH8FOO5mv5CjOhNrdhFBto8k3ta26Vl21mZcZ0Xuo/oIPblxbFuF51L7Z0Ns3QhW6ZdtqCYUmlQuccSsV1ZaLGC2OJuN116JB2YlWpi2VUJ3Osj6YjIm/9gQO4yeVXnKdvN9ky1QsF/68cGl6G526kYrIUuNobVz80qs0FzamI3n4QhpWplMvFQm6panp8W2Euss2BeKB1CicA8atVYPOeolAkxhWEP96X5usD1vy9SlAnRGmFfPKoCfgzf57xJEwqOzTbyL8RMkRYxc6LXa6EyISzfmhylxwqEgp1x7oQizyPdtFNwlLroWN8L2kU+V2LkjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+AONA20MBALR9vf0gr/rU9gKPNX7QyxMne4JXn8ZFI=;
 b=xRUbmm0XOEq6uOjElwnnvXfAihyPosFj72P/B22700TVXFpd39h1jzz9h9K26l9dIOhr5rv1T+VKcaw9D5k9VgzrTczAy+m3t6DUui09wuoZQWdnN4CnoyDlxtOkhydUI5ZCXQNSRk4FzliBrNFRUBncAKmsE1sW3t6FeuorX8gpizlE20iVPdrX9YF7Pr8JgG7QCVem0I9rktDtjrR6H8FIZbA1wtpFzAIAl//cjRAbRFk44MobwCHYtSeQPKliTyEfmvsD6gKP5OiZ6DvV8PqUUS/MVmS8p5wXYoCR0pHoIMur0sG6/gWTs+yiDQbNN14HuRpqOl4SAjLsm67gFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+AONA20MBALR9vf0gr/rU9gKPNX7QyxMne4JXn8ZFI=;
 b=bXC0AfFZdal8hYQuEta3fZrQu1OSANjnpN5odfGWdbfTBJlENqtOXJScnmKFBtXi61nRFzcfN/IZov1dwjz+98SpQ/kMYNq0QwO5k2JqXyFTGv1/UoNwG6w7TA0yED4TvfhMNfI1QbjgW9f3qS8H0Z+4pQofYwMfvYWGV1tfJjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2755.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 12:13:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 12:13:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 13:13:39 +0100
Message-Id: <DIV5H9S8ZN2L.234ZKX4RBF6BO@garyguo.net>
Cc: "kernel test robot" <lkp@intel.com>, "Danilo Krummrich"
 <dakr@kernel.org>, <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [linux-next:master 3728/9137]
 samples/rust/rust_driver_auxiliary.o: warning: objtool:
 _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <202605291041.seNEWvLQ-lkp@intel.com>
 <ahkzosbjO4NdSyD8@google.com> <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
 <CAH5fLgiFo1rep3N5qGWGsTXT177hfSwW0=e1KsVCrrz2uRMoBw@mail.gmail.com>
 <DIV0HOKW3R1L.2ZK80B9TV36H7@nvidia.com>
In-Reply-To: <DIV0HOKW3R1L.2ZK80B9TV36H7@nvidia.com>
X-ClientProxiedBy: LO4P123CA0479.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2755:EE_
X-MS-Office365-Filtering-Correlation-Id: ff864cd4-ce2a-4d64-ebcd-08debd7bb7fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	m/7sG31qWbTcFHvItZo+vHQQm04P4ZLKuobGWDXUylwlAyj3re1/YfS9N/QYqwSWFL6Mw0Y2Ka0Qzx8AWyGYluV9t4ClYjHWyQrrUdvpc0CNbEEe7UOoVzzlS0MDfJ/KMzad/e4k013ZAI4wJ2rUjwzWsj3lM8TuhMhggqHTlrCqRhdF354R79So8YsXI+I/hS6Zglj23ywu+FVnnrz2mn7wz1arUcX5atJYb+hw6AIEw6bCAgZlZwHBXqemYmdnwY2DEZc43bLlkg7DVZLFu5xbe5duw+zNvjP1jDKefFzxjvI8HvYxcl7l+N+6ZGv30dGsrVDW/pRGNqnh7vSalhyXXAYHBmcwTWVPQSMSaYxx/aBcx15Ff5Y8X/7QpPHLn+x9mIjSGK+0oHKwNVcOxcO2Xwpo64EI4CzcIhFGC2vGjDrAmikicSNK9gVabJMAKetpCs/Zyd2e9wnSIBywcDubNhpNX6Ol9dCPDwh0940p5yZfXlfOfVIn0Be67yFYpmpXPXKBCg3/v3PgC+eOlvz9ayVlf03lOn54+sw6dmeSlQUX4e6fHNvlpUrsZ7KzogETj/Wf0VKe3M1BE9Xw/Cbf3oiznBxVEhRnCtp39uTKCfyJ8f5/dSgIOBLJ8zA2VNAk78OQo2ch/66o+Doq0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VngyOU9OZTVsV2NOR0lhRUthNmVDdDJhaWNoc1ltWGhadWpXc2o1aEZ5RFJW?=
 =?utf-8?B?S0l6bDlNcHRia29Qak55SU9LMTRTOFJNMDdNMFc5enY0NUhGQVMzL1BtR0NQ?=
 =?utf-8?B?R0lsYzdKcm5RWnlpek5kaWpoTEdwbTZ0eWMyazREMGdSR0hTb0hFMnYxQkp6?=
 =?utf-8?B?S2ZtVjRuUDJHTUFXSjJjS3NTR0d2Ukt5SU85Q1k0SEVqQkM0ZGxQS050NHpR?=
 =?utf-8?B?YWRmSlZackw0N1ZlVG4zU2VUT3RVODIwenRVVzA2N3Z2NERSbmd5Q2haTXdV?=
 =?utf-8?B?MUJsQ294VUhXRnVIRVRzMHdlc2p2S0dGK1BXUS9vWkp6UXJTY0xEclhQWkYr?=
 =?utf-8?B?UkJYNU01M2VCdlQyclc2cmhwdm01aytyUUpKc1R5NFhZWXR6c2h6clB0dWgz?=
 =?utf-8?B?eFdydzFxQlBvL0pGL2hXOVdaQUtjNkMxWEdNdmg5eVVOQVh2cXptd0x3d0xY?=
 =?utf-8?B?cUJkUnJtWTQ2SEk3bFdsaVBmRUVFcUZUNUlQZmd0UEFZcmZuem5VdU11djZC?=
 =?utf-8?B?dVk2UE1oWTRoTVRZQjZ3M0JkYmgxV3g3S1lpd05ieW1hU1JJZzQveWhiREpj?=
 =?utf-8?B?OGNkS3FoRzVMNmovaGRQWkhCdWFkTkhmZkVWVHVZVUxwZzRlUm0xSjVFSGl4?=
 =?utf-8?B?b1RmY3pDUHBJV1hxMXZQYy9jQjRRVkxGR3BhY3FjNnVjV01VVkZoUFg3V3lH?=
 =?utf-8?B?dGVFNWVRU0ZlUXJ0OVpnU2h4cC9qUkptRGZLYXdPaGR4SXNhR0daOTFEZWF2?=
 =?utf-8?B?eWM2a2JkcHJibC9FbHNkaUk0UG5YTWZnMnpjUGdjZ2RPZ3JoNzdtOWVHZ1Vq?=
 =?utf-8?B?M2NuN281MnJhLzR0THZmLzg0UGhEQ1hHWmtJdDRPamNUU0wxS3U3Mkl4ZlJm?=
 =?utf-8?B?RXFRdTI0MmFHYnVPNHk2UUQ1UjZldWUrSFpFUUhsOC9JN0YvajBycVJjRGda?=
 =?utf-8?B?RmNVeGNZWW5LZ3JkcS9vdXNNQjJ4Q29RUCtNbUwrNm1sVFJvVlU4b1FCaTkz?=
 =?utf-8?B?K3dwN1NKOXBVUFVyb0grTGNHK0YzSDJ2amVmSmEzb3hPZGlpaDJFNUcxaHhX?=
 =?utf-8?B?cGNGTnFUUUpBeGw2SlVPNkVEM3c2d0VVWkovYnYxWEkyVVplaFVNcEJScXEw?=
 =?utf-8?B?NGFaeGwrVTFJemQyL1FkL2Y1WXBIQnZ2RmdhMDgybVUrK3dOSnp0YnVaeUhN?=
 =?utf-8?B?K1BQcldqR2lpN0kwWHNTVVI5Lys0VGtkNkx0c3RvcDZVNFRlbk5XK0d3cSti?=
 =?utf-8?B?VFVlOStiMTUvLzVXdHI4ZTZ0N0xQRGVuNlE5L2pvUTU0Rmg4czdUMGloOWMv?=
 =?utf-8?B?N0xucFpsVGx5bnhlM1JjZ0t5STRZUndDS2IxSjJtaEhZUE0ycDh4L1hPSFpw?=
 =?utf-8?B?ZmQ0MkRTSHljeHN4UGU1cWNadzRPQ1pWQTUrbm94c1FwekdIdHVoT3NBR1Zq?=
 =?utf-8?B?bWxMcDFpWGZENkFEajBwY1RGcVk4bXAyaG4wcEUrRE1YVVVoR3NCWWxxM05G?=
 =?utf-8?B?emJlK2RFcnN2UG5lR1FnTStrYmhpWmpSbEM0Vmg4dThVay9iNDJrMTRFbklV?=
 =?utf-8?B?MExqM0dnL21IRVMxMVFHblBrSXBvS1E0akJuWVd0MThUNTdzL3FkeThMbkxP?=
 =?utf-8?B?YjFzL0xSVTU3WHNMWnNjL2E1YzVXWml3ZU0xZHh4ZnVjRDNNSlgvWkYyQy9S?=
 =?utf-8?B?VVJ3Y1Bta2YxQW5hRVNrSGxLdFRrYjZ0RWpOcktaTTFxNWRTZjZIUFQrUElj?=
 =?utf-8?B?ZnJ4WTdtSmNZblQyWkV5K013OUdOa0c4b01qSHVpZVF4SkdtUWZmNG0zY2Rt?=
 =?utf-8?B?OHlaK0xuMGMxMXVEeVoyYmhGeHpWNExiNHg5Ky9Qcm90ZVNNbHJ2NTh5Nm1B?=
 =?utf-8?B?Y3h5K1haUmFSK3ppZjhiNnBNY1l5Tnl6WFMrNERDWU9zUDhyZXluZlFNOGhK?=
 =?utf-8?B?N0JKVS95NmVOSGk0RHNac2ZDNzE2RlMyYnpYODNqaXM0TWVrV0JSNm9kcWhy?=
 =?utf-8?B?YWNKYUUwRVl0aDZOMXFyOFNBcWFrYU85ZHk0eTZZcEJqb1I5aXBHekdpQkFx?=
 =?utf-8?B?cFFuUmNucGt2ZVVsWERqV0c2VG16djUxUUdnUDZRZU5mdW5OODJOK1RPSDhx?=
 =?utf-8?B?RDFqZm5mWTM4MG9RSmdwemJYeHhWTm83Yk9hYmVoQ0tEbi9CY3ZzYVBYeGln?=
 =?utf-8?B?NkJNdm5ReW1FUzRIbFNpQ0dCMXZKaGdnYVRBVnFJQ0VnTlFCYlluVFRGY1RY?=
 =?utf-8?B?UjhRNGFOMnZHdkRDQjF4cHpyMDhEKzc2SmtoWFkwWjFXV3NXRTVwRzkwaUpT?=
 =?utf-8?B?c2JiS2F3czBSVTJ5T1NOVU1qcWU1Q2hZOWZDczh0UUpqTlBOSWxOZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ff864cd4-ce2a-4d64-ebcd-08debd7bb7fc
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 12:13:39.9685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOsdfGCaPCaeb+ceXK/bXbkv/TifGqFvVjQbNxKLvYz5D928Np0utIzHYC09wyp216LWwcZjUOb90yIwPfQdzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2755

On Fri May 29, 2026 at 9:19 AM BST, Alexandre Courbot wrote:
> On Fri May 29, 2026 at 5:00 PM JST, Alice Ryhl wrote:
>> On Fri, May 29, 2026 at 9:54=E2=80=AFAM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>>>
>>> On Fri May 29, 2026 at 3:35 PM JST, Alice Ryhl wrote:
>>> > On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
>>> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-n=
ext.git master
>>> >> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
>>> >> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust: a=
uxiliary: add registration data to auxiliary devices
>>> >> config: x86_64-randconfig-004-20260529 (https://download.01.org/0day=
-ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)

Ah, OPTIMIZE_FOR_SIZE build, it's always this...

>>> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project=
 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>>> >> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>>> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/=
archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
>>> >>
>>> >> If you fix the issue in a separate patch/commit (i.e. not just a new=
 version of
>>> >> the same patch/commit), kindly add following tags
>>> >> | Reported-by: kernel test robot <lkp@intel.com>
>>> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNEWvL=
Q-lkp@intel.com/
>>> >>
>>> >> All warnings (new ones prefixed by >>):
>>> >>
>>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.modu=
le_ctor+0xd: call without frame pointer save/setup
>>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.modu=
le_dtor+0x1: call without frame pointer save/setup
>>> >
>>> > This one looks like this bug:
>>> > https://github.com/rust-lang/rust/pull/156980
>>>
>>> Does [1] work around the problem by any chance?
>>>
>>> [1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556d55=
@nvidia.com/
>>
>> The asan.module_ctor error? I don't see how it would work around that.
>
> I was referring to this error on the report:
>
> _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPl=
h9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationData=
NtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB8_9allocator7KmallocEINt=
Cs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5Err=
orINtNtB3y_10___internal11InitClosureNCINvYIBH_B1L_B35_EINtNtBa_4init11InPl=
aceInitB1L_E8pin_initB4u_IB4O_NCINvMsc_B1O_INtB1O_12RegistrationB2l_E3newNt=
NtBX_7convert10InfallibleB2l_Es_0B1L_B4u_EE0B1L_B4u_EEB2n_: symbol name too=
 long, can't create __pfx_ symbol
>
> As this patch might help shorten the symbol.

https://lore.kernel.org/rust-for-linux/20260527-pin-init-sync-v1-5-e20335ed=
2501@garyguo.net/
would also help a bit with this, although I'm not sure if is sufficient.

Also, regarding your patch; do you need `#[inline(always)]` or is `#[inline=
]`
sufficient? Inlining shouldn't be forced unless there's a good justificatio=
n.

Best,
Gary
