Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010004.outbound.protection.outlook.com [52.101.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE4B2E62AC;
	Fri, 29 May 2026 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060198; cv=fail; b=BQITcPatHvGqRz1cMa0j06oSg85a6gpeuP8Df01fWaUp5gEpyiAC513lYBV5r5ZPMR0qOFaJECvpKBfMbKPDD8I69ygN+MVZu58+Lt8vK+JQBLlpfU2s8hoLBmSD3a4rfjP5fUPOAxXCB+cQv6miHZWpKGj2KR505EoeFoGk94Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060198; c=relaxed/simple;
	bh=V8J4zD2800B0vygsPOzSmSeTbuOIJCRjUf3PT8jrnRw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Oz4S+J8FB3i9gMww01JyVQ3uXmE3Y/8dbOOjO374TetfWjCjiOPIqqYqwHpI1tLt5R0gdYWPJq9rdSEZbom6NoXNnfPZAd5X4bunsAOvV6o/1YT5pXf4bVbm3C8ParDYltP4SLzpj96ULSaDet6e44mUArylep0g9JrDCUlbFKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fJT9DBUM; arc=fail smtp.client-ip=52.101.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fJT9DBUM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRFIuzN36tEwz2DjZzKVAuOP/BQov9ZhTmm/aru7jdDWs5WFaPELA6OoqwWrH7K8d1fX6V7VzdKVJQkTizAcLgfjURrWLFk40IS3rY15cjEDvQ30t4hNqOe13SyV7j82C8SEjCenIHzSARf5JWjtbxkCjmABO6B0aA/PEFSQWc0MqzNXWI1pKDJgt6t52sQTBKjZ36M/qSihyMGu6brFuZRKPsXcw/Lb3ZnCdEMG/8waJaFif7NL9Q7O05bg3O2KUHw5nHlkfLG7TtH2PozJH07tYSA/+V1pLBWSFa+ZF+wuNHD1cVHI6cV/A376qQmmv+1M55cHF1XkJEOO1IWMcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzU611s3KTpv14XGjoNvj583j6nNyqrOaQhkwPpC2M0=;
 b=g3JDn2+a/nX6r8DQsx8DVr9bf/mVPYJ8ji30BhYWspyM8asivyU1TeZNu6rAdUG0416otfS1N0r3AtwGMDmp2seGakmklHPs36Mq4V1zRPdt8MyoSXfc0Rx6DaptUjqmChos8TlR0P/FFMvShjZNWDbTxS7nxF4WOvwQLCbXz6bIp8dmE4qQFQ9EvbmvxBY2NvE+0F3j3d2xF3dNscCu7PDfTAB7+QeYGaNTlCqekOOzMb2N/g8QoqENmNO1FtaxsvaBhm6YnvrIBIUQQgZyefFFcRs5T3Lj2Pm6wFn8clcqkDF7gdSczlGhVd0iJMY8oGdXzYuU0jUBka+G8hZSYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzU611s3KTpv14XGjoNvj583j6nNyqrOaQhkwPpC2M0=;
 b=fJT9DBUMnxRMrF7MYWYhplNfK1X9C3OAiGOC0qBhMdyu59C2rPBOoHAd1kMBtG2p1S8HJtG7enBm/10vOgX/FSNdo2aYH5vmgoPFs0YTtRWNK+TdsCI2ywcKaCfMn9GVhSSWGAa7tOHLSSkhoint8PCjeFN6KdsVo9TL95R0rS2RRoJxLNZND36PgX99vfv/CX0ODysVAjmxXedqx7R7P+Bk8GSPndmHBKlt+1bJq6tmycBd2gM/urbM9FizOiWAXf+7tQEjejz5uazBlA0XeTnD2JtUHerqHAJKgLp3F5BgG4EweyPxacuxaFFG0xllIOHhVCM7nu6GpLmVkF7cAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY3PR12MB9577.namprd12.prod.outlook.com (2603:10b6:930:109::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 13:09:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 13:09:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 22:09:42 +0900
Message-Id: <DIV6O6TSXRU9.2RAEFRRAGX4EM@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "kernel test robot"
 <lkp@intel.com>, "Danilo Krummrich" <dakr@kernel.org>,
 <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [linux-next:master 3728/9137]
 samples/rust/rust_driver_auxiliary.o: warning: objtool:
 _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <202605291041.seNEWvLQ-lkp@intel.com>
 <ahkzosbjO4NdSyD8@google.com> <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
 <CAH5fLgiFo1rep3N5qGWGsTXT177hfSwW0=e1KsVCrrz2uRMoBw@mail.gmail.com>
 <DIV0HOKW3R1L.2ZK80B9TV36H7@nvidia.com>
 <DIV5H9S8ZN2L.234ZKX4RBF6BO@garyguo.net>
In-Reply-To: <DIV5H9S8ZN2L.234ZKX4RBF6BO@garyguo.net>
X-ClientProxiedBy: TYCP286CA0085.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY3PR12MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c56f4f1-9c8c-411a-386d-08debd838e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	/1OTIYE9nD83PhBKJYUddBRWQP4+rn08BlM31+Cvaag6RcYi5bNtuIqf+B57QlzZ3/MzdpIADXuc8iSWn5whNCH+eN5iA4N8ALXyrKaO4zWzhgVRA9kAyTMGJxp8Q0bC7J92XZDF1ekmX/TfwJVmdCQ7iecZp3QuKjjM8gQbM/MMptNcgfM9s1beugqIBNg5lQk/iBQE3NClcUogUUAYImZ15Qq458MyDC/5z/C5XaY9+H305qghtXbulrHCdqSqZAw1rPOSVe4bJbMHbfoOpkT2BTM+QqSm+5uBU69oMBfvoROJw8KiY6bY8NXplBph5T5NSVUbYtBjWcRiviKNb78C8J8sjxnAfdtI634Np5OVFyFDC3y+7ub0fRHsSm7nFCJBlbHS9Ju0geei5iGdkZAbqZrfcIMwdpLorlf3/VfRZpDQh15sfykFI267A7KTWkqaicUp4zEHLv7uZ8L7eRhZBZEIMe3YXl0ajyfaR1RJ0QYkHtJ5vepyNIxVwMpkzADkNxV9ih3hqQNOfuq1F9Hn7KFHKwePO4/8n+O4eReGzZelrYKnpYo201GcLq9CVCaqHROPIy7tdFIktn3JEPLo9P5ufK5A3wSUlbjp/+uQ5+ake32bTtya6tryPuR0gEd7ftP1E1usijjX3OQazhINrWJ78905auwbmP40JpYeA/Lbot+ek6ipcVOwyZbuleUcPSGGTLic02GYUopvrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTFlZmJwdWNaSWlvRjlxZ1hSS2F6THJNM3ZoSnJLQ00rUS9LMW5seUtXUEdD?=
 =?utf-8?B?Tm0wbjdNTWFDeTdTZFRzYXNDNEphdm1PYjViQWNvT3RoR3NLVThNQ2lRUEla?=
 =?utf-8?B?NWJpWDZncXEvaFAzTVVPaUpIUStDV1VydTFmRDJZMk4vbVhKUVhMU25pMERa?=
 =?utf-8?B?bmhWNmI0eE0xbE1RM2VmbjJBTWZsWGYrSE9nd2hCZTYweDN0WGNqM1huU2dw?=
 =?utf-8?B?c0ZEeUZ1SVBOUjRqd0RZVWo5WnNQVUtLK0NmVXFIeERiU3d6TUdsNnFRMXg5?=
 =?utf-8?B?SjBYUE43c29IWDM0MjdZVVV4cWRsUXFqdXRQdEZGRVdIdnprTXJmbk42Ykgx?=
 =?utf-8?B?cUs2blp0ODF5ZGliWUJMYjk1WWpZNk9KT3NKVHJOb0RVT3B1VHE2bmVjRG81?=
 =?utf-8?B?UjhzbnN3Z1JoQTl5NTFGMXp4Z1lKbjVLYkFzUDFnaVRveTd4Q0E3UlFsdUlQ?=
 =?utf-8?B?Q0h3MlBYa09wM3JoZUlxeDRhMlFTZzZNK0ZnbENiM3J5YWVxTUhHMituNVhj?=
 =?utf-8?B?VU9TeWtVWE1DWE5YT2s2Z2FRQy9hRUdOMWxpSGFBL1VmR2J1YVhzRmx3RVIv?=
 =?utf-8?B?RmFSU1paS0FUWGpMS044VUNxdGZnaEJLbTlXalFnM09FOC9HQTZSNmd4dVd1?=
 =?utf-8?B?Tk1rL1ZCNkw2ZitxbDBsQmFwUnVzc2NjVEViczhDMUp1aXpRNEtaaU1FYlV1?=
 =?utf-8?B?YmcvZHNtZFhra1FlWnlud1R6Q2NGYnNrQlNGdUcvTmttMU8zdmp0UVVjTVoz?=
 =?utf-8?B?UDJBNUdhaEF1Nm9XSXRVbERZelVqMTI3OHhpNEU5SjFtUDVvYkJyU3pZdFR4?=
 =?utf-8?B?a0JRcjN3aGdzUHg3dEJteUNFM0tFU2dIODM5MnR6Vks3bWVTSGFZZnNIbWN6?=
 =?utf-8?B?cWY5S1pNRFc4RGFLNHp5dktIZ1pkWXZhYzNhSjFJZ29vUlpGUE0wY1hHSko5?=
 =?utf-8?B?bjU3TEVvOGRwblQxT3l4dlhmNFdvUjVvWjFES21GR2pNWjFQREZXYXpRZ1Ez?=
 =?utf-8?B?eldFbUhzS1VrT0ErQ3N0V09ONW40SitrelRlcTEwY3FMRFBYWkFIVHRibTVv?=
 =?utf-8?B?UGdqMVBsYWY0Z0kwb2t3a0VOWkRDa0xUYVBuWENENXZSTm1JdDdBbFI0RFU2?=
 =?utf-8?B?TjRnOWQ1U2NWVVZXcWF2UkRmVjBjVGoycXdDbUNBSm01M3l5Y1EzS2hpUW1r?=
 =?utf-8?B?WVRoNVIzREVLQjhPNTJ6Z3dWUVRXdjJJaG8wV0h5QW5lUUVBcWdQMGIrdlNm?=
 =?utf-8?B?RzFzemxZOTBPUmRkcklnWkZkczlCUk9rSVBTenR0aDRMcWpPaG9tMnMwMTJL?=
 =?utf-8?B?amRRcHBSSmVKbG95U2lLdUZOOGMySURzelZUN1B4RGNHYnhwWkdVdy9RQUdr?=
 =?utf-8?B?bC9FRFo3L0wyTnN1TDE2aW5hQ1hDOUl5aXcrUmdrMHRoVHBia09OZmk5M2k3?=
 =?utf-8?B?WFlnODhvRU9YSjhiS0JZRDd1OGI0UWNvanh4T0IvaE9ZcStIVXJoZ3k3NS9E?=
 =?utf-8?B?SDlkN1VMMjM1Z3hJMFJGM3FiTFVjdk9TQmpzMXBYdHlSVHdGbXpvYnI0b0ll?=
 =?utf-8?B?QlZGYUhwMUNma2ZSdEg0SXhMcjk2bC95cEUyN1lVOXA3ZEhoZjhWKzU5UDJi?=
 =?utf-8?B?MUhYWkxvQjd1S0hnM2wwb1dXeTdGRXVURWRVTC9CaWF2V21GTXpaRXBHa1I0?=
 =?utf-8?B?VWJCK1JtLzZiaEl6UkR5RGVjUGRVV0NpWDJOZTdHaS91ZFA5bnZ2Y0JPOVdz?=
 =?utf-8?B?Tm1WR3hLMFlSZU45blJ1TXlxMHBtREpoalZSQjFxY3lHc0VCZVYyVEF4T0g4?=
 =?utf-8?B?R2kwRUlPVTM0aEE1NWFpVUpZUVB4bytFODNKM3VaNS9BN1VMcXBhTCt3MzZM?=
 =?utf-8?B?VnRxdVQrd2ZNNlRPL09RY3J3V1UxaDJLNHFoeUd1SzFMb040QTNNemNaK1l5?=
 =?utf-8?B?VXBva1BMTjJvVEx4c1JoSXM3TDRraHlzVXByc2dkb2N5aHArc1V5VE5Cd3JT?=
 =?utf-8?B?UTBsZTNuUzFyK1NSL0RPZ1lQOGJGeVhQUGRuSFh4MlR2L0huRU5lZGJSa3Jy?=
 =?utf-8?B?QnpCcWR2ZVMvUXpJa0xINzRMVHZxUmp4UitEODNJTTRseXdXU0xKNHFMb05T?=
 =?utf-8?B?Um1lTTlwRkJKb2ZuaitHTzArL3FiMURaWXU3ZStyRFhiSmpYMXJyY3JJM2NP?=
 =?utf-8?B?d0R5ZEpRd3V6NEJSS2JnWlo5OEdnaWRFckx2KzVuK3B0MDAzOFpmUUdBU01E?=
 =?utf-8?B?MCtYL3dMMGs2REh0MmRwTGZvSjR3YUVZNUFUcnNia2F6QUp6VjFjQnl4dVdu?=
 =?utf-8?B?TGE3WjNUK3o5ZzdCbWJrcUN4WXNvUHZCZEV2bGZQdHJHVGNzUG03NGloZWpV?=
 =?utf-8?Q?7ll1LwJ82i/uC6Rj9wQoFfNSE6A9XZFx41uY6Q5wrWkiU?=
X-MS-Exchange-AntiSpam-MessageData-1: xXL6hs9VqEZ1jw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c56f4f1-9c8c-411a-386d-08debd838e7c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 13:09:46.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KO4mSQMEfH2xdL+NmFxRyHG1hzTvabxwfs9/YmFpOGkOQJvmA7Lb0+9LZLgkfHeXSqBlvBCXpqcEG/QRgA50w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9577

On Fri May 29, 2026 at 9:13 PM JST, Gary Guo wrote:
> On Fri May 29, 2026 at 9:19 AM BST, Alexandre Courbot wrote:
>> On Fri May 29, 2026 at 5:00 PM JST, Alice Ryhl wrote:
>>> On Fri, May 29, 2026 at 9:54=E2=80=AFAM Alexandre Courbot <acourbot@nvi=
dia.com> wrote:
>>>>
>>>> On Fri May 29, 2026 at 3:35 PM JST, Alice Ryhl wrote:
>>>> > On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
>>>> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git master
>>>> >> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
>>>> >> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust: =
auxiliary: add registration data to auxiliary devices
>>>> >> config: x86_64-randconfig-004-20260529 (https://download.01.org/0da=
y-ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
>
> Ah, OPTIMIZE_FOR_SIZE build, it's always this...
>
>>>> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-projec=
t 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>>>> >> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>>>> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
>>>> >>
>>>> >> If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
>>>> >> the same patch/commit), kindly add following tags
>>>> >> | Reported-by: kernel test robot <lkp@intel.com>
>>>> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNEWv=
LQ-lkp@intel.com/
>>>> >>
>>>> >> All warnings (new ones prefixed by >>):
>>>> >>
>>>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.mod=
ule_ctor+0xd: call without frame pointer save/setup
>>>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.mod=
ule_dtor+0x1: call without frame pointer save/setup
>>>> >
>>>> > This one looks like this bug:
>>>> > https://github.com/rust-lang/rust/pull/156980
>>>>
>>>> Does [1] work around the problem by any chance?
>>>>
>>>> [1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556d5=
5@nvidia.com/
>>>
>>> The asan.module_ctor error? I don't see how it would work around that.
>>
>> I was referring to this error on the report:
>>
>> _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabP=
lh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDat=
aNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB8_9allocator7KmallocEIN=
tCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5Er=
rorINtNtB3y_10___internal11InitClosureNCINvYIBH_B1L_B35_EINtNtBa_4init11InP=
laceInitB1L_E8pin_initB4u_IB4O_NCINvMsc_B1O_INtB1O_12RegistrationB2l_E3newN=
tNtBX_7convert10InfallibleB2l_Es_0B1L_B4u_EE0B1L_B4u_EEB2n_: symbol name to=
o long, can't create __pfx_ symbol
>>
>> As this patch might help shorten the symbol.
>
> https://lore.kernel.org/rust-for-linux/20260527-pin-init-sync-v1-5-e20335=
ed2501@garyguo.net/
> would also help a bit with this, although I'm not sure if is sufficient.
>
> Also, regarding your patch; do you need `#[inline(always)]` or is `#[inli=
ne]`
> sufficient? Inlining shouldn't be forced unless there's a good justificat=
ion.

If the code is not inlined, we risk a build failure - pretty similarly
to the link errors of `build_assert!`. I'd say that justifies using
`#[inline(always)]` here, but maybe we should also add a comment
explaining why we do so.
