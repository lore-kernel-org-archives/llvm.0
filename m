Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2104.outbound.protection.outlook.com [40.92.102.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72A414D428;
	Wed, 10 Jul 2024 23:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720653000; cv=fail; b=k/sl4DOrMQ+lCsgV6EVcyYqeG8A0sUQGAU1Hditacre4BtNRtzcVOFSNcswLQ3F1Nd9vRruXX/wlTy5BfVUowppV8n7b7YEXQCCidvThge/xQm1RQ7BJa4wUpcJ1e4eFvXKQcOvGHjjbMhlqt7idrapJ86hCJwIlTDHdb+OaVek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720653000; c=relaxed/simple;
	bh=0XqOufcBnZkBetjjcciQABinS2pGpKQrzdgtm/Rbge4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IvKS3/n37gG8HJhFZlYSLa1zKZhrotcs2R7mVYFr8lX3E6sRz9szfDMo7sX4As2ctMgKxxOYPBNW5LccAxa4+1UlT/mxNodEW+ZrsQQGRuyFVnbqQkTvdNEM6l6tnxrI/UQdMgCQpnhSuvUk+YE5qJMv5X9UwxNEEEPFqrQYzK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=L7xd3fGm; arc=fail smtp.client-ip=40.92.102.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="L7xd3fGm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjuQROzT8/X1heptd2fJArcTUtWACHim+Q6XVaHVlDC4UEH4CecN9S35q3bp2kMpTaJfRcL95A/cWqV9ZcfUy59OGtlXtluR9ToeZr9vWpfKkJR0hpVE3wGgT8vIf1F5O8zn4xePU+8GVCnF7u91ycxgPtT5nHEqrnPN85T+R0XL8BwSs/EKCFLrOaQqcfvVcI+PgJ919OYpArTiaJHetR+6ksGBkcE3SE6PK1zqGDKTX/qPImJjvm2Ckg7YXfwVTy1UtxkCAex4K2DTybTq46naG5Eqpz6ba+OBdYrs81cWdAVbbPePbLrrfhIo1OYpa3HvPpz0MrJbQUhgjbT6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/skBeWFMcR9j/OaVeFd2IUR/prxHJggz9mhRnDsd4pQ=;
 b=X3inw1o4NTjjUo8HAd2gPFGPhRakabkPlcUbMBr1ADbFglIA5VFk5PHnzWh6p44sm4CHHB3hYhb8YnZP4mcljVS6XcUM4s4VafuvlZ3nVXQ/9SBCJJuvyvI4Z7AaRJtRp6gmWDUdPiUG+iRTEySCSYIZB0OotfNTOJoPjTZuOMeHDh7dOIQoGrT2GUbWHuaJ4d3VWo7k/X5qncu/4a2APTlEPWMtELHc4ZrxDoCLYFrtGZ02RwHygMaSVAhhEihDwAC4E6pXfoScu1WVNc9YM/qmymyz1niZhEThhX3fuV8DkbQlbEicKOEiOPpRW974G2G0fOIzj6hiZCulfyEHaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/skBeWFMcR9j/OaVeFd2IUR/prxHJggz9mhRnDsd4pQ=;
 b=L7xd3fGmKdKKaQ5u+sYzCT1hkzJU/zmVioIppK43Pg37Gg4I7DLX28rHMuL2ljozw3BDpnm1bwY6F52WXCcXVZMySETVQQApSMoWVyM9reeNsa+5FcAFzL97By7TA4P2QCjrD9s02DIjN+ZWnzHIVwn8RfJ8QMssQVJGcTB2zZ8BLPf3fjXoWSOR/RU4m8NuCx9EjDdD/+Q/uiUw4rLON6QX7PEnXq6s4Deqb+sO/j2HdNcmspqZ/zDL1j2RiyT+TnokR/kXUYyhFAF0E8n9YkQvUq0f1uzKXfBToX+q/aT2labSCGSFIdcN5xkJfFPjqZKLsrtRlMSHLkG2HtbYvA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB0876.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:145::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Wed, 10 Jul
 2024 23:09:53 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%5]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 23:09:53 +0000
Message-ID:
 <MA0P287MB2822C48F3DF670881D26E801FEA42@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 11 Jul 2024 07:09:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [soc:sophgo/dt 1/1] arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10:
 fatal error: 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org,
 Guo Ren <guoren@kernel.org>
References: <202407101850.eIQyngoV-lkp@intel.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <202407101850.eIQyngoV-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [Wp0f8Z9mlTuuB203mjE8+K+wYxOZvByv]
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <8336cb84-35a9-436b-9412-083fad681f5b@outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB0876:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb1d7b2-8e56-4f11-07dd-08dca1356805
X-MS-Exchange-SLBlob-MailProps:
	ynsnEk/J89d8okb5et3JV6t97Zt6rZvlh9KL+3PERtPGroyOURFxzwcK8IsgVLYZ+KIxeR4o7sn6pxSzAEF5lTqL0gr7g6tfT6MdzOSJv+AJrul3Xg28O/d/3d2jOEVS3JSFGUy/SOWCsYj6ZYvJR3e1tKd//V3q50TwDchSjOZB74zUhFdjttqs1kvM2oOYOAkTSdh9Z2UC3aj8u7hMqq3V7LhtjLLfPZmcOHD3GG09dNRlMRMrW+F8Av3gjj+hpLsOA0KuytLLjHxKaMMMJiupQH2PXJbaZdBmdORQKwA680qOJLeDvt34BidUnQFhTdWgPcP3Ca8zcTKEP/3LHyh/rTuKV/0Zx98FMqwcWhkmKcSYGiB8iMKdJs6I98yfV9Wjtm4ZVcsd0wsMFdkNVlr/1yHQ6DQrm+DapKGKivB9dz+eA3F16eEXPgT99sS4YYeMzb9JXKnev12nFGdyo1keEJfne4aSMpv0Qmh1uD8XDv5iKAWof7ywafYtg2YXahWUE8uwhtbnRc3/5dLVkFfFzP3Lg/zagHt6B/yeOm9RixjrGKtRNuVv+rHYO/1vl/X/4q6ry+mElAhMQ2IUZK3ty/PHapHP5Aa+AU9DKtbxT3wkhiJpSe/NhVn6qhN9F2MEzc5Wl9Cmw6X7hrt0eDPnLrUDjPO2I1j13FHGTy6jUfY0GTGoqS70tjOxLcayMERdC5ingRBr0PwQLwLCS4d7yU2Q6QQ7fi9cu4zoHRo1s4ib5N3/Bt5dpaYh/GlkZhmaxEElBY+x2dFXXwuDKwlwDNymvK1GsYynb8ZPcDPg4VivnUebPZ544s1Vcngj+reqyhxor8A9LvEFJYQA566r0RRED8hhfzvhNfrkHSSCBJqIyKcelM8DM2Xf0vp2pmApz2uzCH0W27MLfvZJMg==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|19110799003|461199028|440099028|3412199025|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info:
	5ZvfINhozcecYfcwS9lMFvsgOYiv8A1WTsjcAhuID2FVobT2DnrwbCPhFXI7j3IdndZW0LgxtzYHMMmB94mJNfcZm0UTfbJnQoUO0cuwvRW9361I7Mm45I5Ps+9YEAGjerWACrrjYoJV/+jWra6VDDEA3hxQhEpdi4X1yXTfu335yiCyiEKBpKiB4vGjgdA35IK+NNH/ZVKEI0ott7MqBqQCTooaIyFZkIADnwWrS4fpANHY1WPIB+/yK4BbMsmcNKG6zj3nC5ilKzz16Cvyk/WbxIpXpomx6kxps6ciWt5vma8+gGDCZyzrOhxp6sdQ1vZwRWBq4bob+vmhv3DbG8J1XZXmjU3Eqn+FSDmemGAiRViIAmZgAKAFCADBGCahn3+rOlNrkAZ/xeWG/DMBu3d4kQyMDWP7WFweNyhABkuacHC8wJGScSM6k57XubA80qj29OIKiJhDx3Ohr60kzhFYoDR9s3dAhMfvLJiNYZ1gSoewFiN4A0EFmSwfyPBJBrBc3yKZeY6teM/4ebo50gzHwYeMl8NDJMG9DI1QpfZRPxPreFeSqPHtJD9507mQEuaAd8IeyQl9SV1NuD5mK0ZAvIxddAhOLhP7X77oTKRUCxIqedg2MlS0GKQBLdgcnpi9WbbtSXvHLXJzO9yd1p6mEiMhbN+QmgqM2zRhm7i+j6jVyVxBLV/YlueRi5f9AByu1W6JGQp3HV5gs+Y06xL3jtDyD/0yGOtgXN1gC3napp5xumWoIB6wgbQCgUBkuDJTZ4hJbI/+reldDfzjpw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THdFckp5TUFyM1pUZnhmZm1taXdlZW9DYWRYditPNXRWSDJzam9VM2xQSEYr?=
 =?utf-8?B?RE9WbHZRMnFGWllaUlVDL2wwUW5vV2RGQ3FJNnozSzhFR09DbHpPeU5TVjhk?=
 =?utf-8?B?YWhFSFVGaVI0UDVpc3pVaG1yaVY2SEVwK3grVHR0dzc5SEE2b1dsRlBLZTgz?=
 =?utf-8?B?UGRINFhOcHVDL29iMlpDZUVRQnlTdGhYbk0zSmRnMEdXZGQ4NkNRbzVEbGU5?=
 =?utf-8?B?QVhQY0VZSTZENTBjcXRQTDRxNmJYcWpyMnpRTXZka1dzQjl0WnVLcWM0Nksz?=
 =?utf-8?B?MEtSWFNoQlBWMVZCYkVEams1emo4TTJFd0VqN25hRDBiQmNpNFFId2xJdWxs?=
 =?utf-8?B?TCtwUHNZRUdvUTV1T2liekRFbE1ieVhJSGNtUjkwN1U1aGNFdDZ6cklaUDF4?=
 =?utf-8?B?eFJ4Q2VPei9MTUs4cHZkVHV2YUY0eGVLc1hDL0ZRazJkYWZPQkloYS9iRDN4?=
 =?utf-8?B?WUpZblg5cEpOWStMU0dBNGh4b0h1TWhFSnZFSFlnUGJNd0l2NndUWk80N1Zu?=
 =?utf-8?B?d2tKTzZ6OXZoL1ptNTBVbXpzakdCL1dCclEzR1NrQjRjRmxMYnpuVFpBR0tv?=
 =?utf-8?B?TzdFUkRqclptU0x6SFE4Z2FXbTZsVVRwR1lSY2VHTXBNOW5jdnhabnUrOHVm?=
 =?utf-8?B?T0xtdVpCamUxMWpyc3ZrcmtyQjgzU3gycytnUFFkVDR5TTRkVVYxeFJCRVVv?=
 =?utf-8?B?UFF0eFppak95a1lYQWFpNDhFMTNMWjVwTnc2R1NnUzYzS2pmdnFMc0hMR2FQ?=
 =?utf-8?B?U3ZBeVFidDZhM0t3a1hSMHBuck9qWUlodS90M05ZazlXOFVCN2YyM1NRS01X?=
 =?utf-8?B?N1hZRXNkaGhhMzFpNXk0d3BSTXUzY1ZZQ2xHMi9EcmcySlZJcWpXd0dpRnRF?=
 =?utf-8?B?YytxNXhpbFRRZmw4cmZxbkZsQXNIRW9oVWRZbDVQMCtMTWZLMVU1RG1hQnFT?=
 =?utf-8?B?bVFtV1grZ0VZWFBjVXJoNnZ0MjgrcTBpREJmSExvdGRFbjlDR21rYzhBOXlm?=
 =?utf-8?B?VEE3d2dSeDJsUFpNNDArV21GREQvWVlTWUpqeVpaUXV3VURPOTI4citQbVlH?=
 =?utf-8?B?N2JjUGxpbnd4N3liU1M3ME53eS9CeHQwOUh3VUhpeGluT0V4dU1pbkFVT3pU?=
 =?utf-8?B?TEdlWXBJOTJoSk5LTHhhQnkwcnFOWlVQY2lQNXFYUXk5ZDV2aTB6V3VWZEVX?=
 =?utf-8?B?dE9HNlVZRTVRZWFOSUI0U0pFelBpZ1l4SGdvMGRlUFJ6Z0R1TkE2WmE4N0No?=
 =?utf-8?B?K2t3OVpiM2FIR0tjQWg5Y3BHN1lodXl1eVFEYXlKK1lxTFZoaEhuRHEraXhr?=
 =?utf-8?B?c09wNUJ4bzd1dXYwaDNVWUxXTmZaamNmdmN1RG9TR0Z4Q0taWEN5eHg1UWwr?=
 =?utf-8?B?UU4yMFZ0akFwK0xFR0lmKytQQXZxdTEwcjZ4dFBoWncvOVUvcUt4SFdab2Nm?=
 =?utf-8?B?RWZiVHVzSDV4UnRKdThOVVdsK09kVWFTNGpITWphUnpUeVE2dHhHVzBYcFRo?=
 =?utf-8?B?cGlyYVIzaS9uaVhaV0x4Q0pTTmtiQkNYUlRkNWlHWCtLb3AzT3BrMTV3MlA1?=
 =?utf-8?B?Yjg1QTl1MzNYdDJHZTJ0V0FFYnRGM2JLYVdwRWoydnRpN0dhTkNSYzQ2Vzc1?=
 =?utf-8?B?MU04cE16WGNVOThmc1FSa0JmUENzcDFRWXdsTDhQQ2lJSTlFdWtYbW1oSFJz?=
 =?utf-8?Q?c83pxClczGKQBza1JCoJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb1d7b2-8e56-4f11-07dd-08dca1356805
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 23:09:53.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0876

This build error is due to the changes about 
"dt-bindings/clock/sophgo,sg2042-clkgen.h" are still on clk-next and 
have not been merge in the master.

Thanks,

Chen

On 2024/7/10 18:56, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sophgo/dt
> head:   b1240a39511b9206293b82ac372c5114d6e15821
> commit: b1240a39511b9206293b82ac372c5114d6e15821 [1/1] riscv: dts: add clock generator for Sophgo SG2042 SoC
> config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240710/202407101850.eIQyngoV-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407101850.eIQyngoV-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407101850.eIQyngoV-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     In file included from arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts:6:
>>> arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10: fatal error: 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
>         7 | #include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
>           |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     1 error generated.
>
>
> vim +7 arch/riscv/boot/dts/sophgo/sg2042.dtsi
>
>     > 7	#include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
>       8	#include <dt-bindings/clock/sophgo,sg2042-pll.h>
>       9	#include <dt-bindings/clock/sophgo,sg2042-rpgate.h>
>      10	#include <dt-bindings/interrupt-controller/irq.h>
>      11	#include <dt-bindings/reset/sophgo,sg2042-reset.h>
>      12	
>
