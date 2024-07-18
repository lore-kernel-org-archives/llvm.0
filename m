Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2102.outbound.protection.outlook.com [40.92.103.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B0E27448;
	Thu, 18 Jul 2024 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721305225; cv=fail; b=SqmV1bo2KPgi5gmhewTq9VB3Gv0bMW+SChqW524mi9VwL1kAvLb0wngfdBQkiYJ9BJAn3+EzJVduZdXtwX3GItWO5cXzYNfPHuwX+Xr+dsq0pwJtLvi0ZZ3n/UOu+Nq8FhObxio5d5nudeAabgg5tONKk8RFjGZ+3Fzx3ndbb0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721305225; c=relaxed/simple;
	bh=2xdV+B9f6cHlayHhzClHlSKizy6ERblUMVKw5qWLMUM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e7+T8gXXcy3xIyUoI4SfGdcWiFPc3/e1L1x34Wsuk1mjnQ2+dfJHZJNIYbw7wjsUf4eYrUV5KHhRvjFLl6gRCnm46nDq8kMF8TLxEBRKpKnf+Z0ya/7TXCmWXnYwpx/2/M/JrqldB4LOxaF47fPNGZcQ9q3hDatpY31W4sFtffU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=NhgGHGV+; arc=fail smtp.client-ip=40.92.103.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="NhgGHGV+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4/Sy9Zico3TFj1fxQWwv0aBXEsFMc6XSPMjwYF13M5O6EfGkNzzRC8LhXsSToXfCmqwHq7TmEeXXUNFcMxH3RaUxcA/5IKz6pjtFtCNgoLXalLDPinY4a/HTTrnXGnDXocp+i03H8oru039NAnBbNyRyiWi47uVVKz56A3+0TqEQTS96s/fqN5pOtqJbB8bJjL7/W2EZIq1D2/QlkYb9bIQ1IFvIfIack8HdCWiw9K+nQAOusJa/vaPkUltzyygpY9CEPNo6HVn2dYl9FvFEhSWi/cymvQOm/90I/Bntct3dStf0zY9yx0o39XNUpC65z8h2ejGv4XnzqDefh0m2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2ZcePR6cbNuRJ2Ub9tuPL6pQGt7+k8LXMw5sJWc6HE=;
 b=Vz9w7I433FG6u9WprCWbHcmJSfZDEJwjxlNFsXLaGlpuhBMgYVLRIXyDxV5G0W2N/3crQ2ipEITbTcE5wrT1BfUMeAS4r7+0awMqhwsO6294qbt7moU0ZTXeOVr159xeT5N17vGaICj1MQd46jzAlFqQgxwiF7JgwLcQigs+NeDma7PZRMcglHfYt+uCplxkoGPxdH7rd3PwAP7fJIdv6jQDgFOnqauS2qi+SGGQYKGBCdS8ZMm1GKjNoNFsBD4mURoAixEW7g7OmgzAQV1Yuori9N3n7j4xLYu2PiedQIROESJKssg2YWmt105FPz2Nt+EhDXRpicWTmfMtOvJ80w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2ZcePR6cbNuRJ2Ub9tuPL6pQGt7+k8LXMw5sJWc6HE=;
 b=NhgGHGV+n86cZOLA/4w7X7swv0FRwbPQtSf9VQMak5UyhCuYg1XKdyxITmZgXyqqPTi6C6RyI8tQcg5Jinu5U9moi8+L8Ck3nR6BGGyPFKWJO3mGWoC+7yePPt9sKz5dbl2TL9DPRJg23j1tAIwg95+wFYWI1ch8C2TO3fEZ6MWe5V/d0J4rYZB18mlsofy0Ko+NpCRe+IFwFpuT/NQpN2M+XkebiCdXIu1tkdehVXYhO34Dkhuxf+4QclzIUMePjfxnjxgpj20djLgm/sfSH792uUwbfM6KvnRbV+NUDwPl93aYt+j9/10oO3Lwb6hB9AkpKr6luolQcbFywagJIQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB0975.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:136::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 12:20:17 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 12:20:17 +0000
Message-ID:
 <MA0P287MB28229582E5EB388ADB0D665FFEAC2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 18 Jul 2024 20:20:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [soc:sophgo/dt 1/1] arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10:
 fatal error: 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, Guo Ren <guoren@kernel.org>, arnd@arndb.de, conor@kernel.org
References: <202407101850.eIQyngoV-lkp@intel.com>
 <MA0P287MB2822C48F3DF670881D26E801FEA42@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240717143016.GA94990@thelio-3990X>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240717143016.GA94990@thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [cOamrZra0tcncy96ES43sXrDW8p/uLy+]
X-ClientProxiedBy: TYCP286CA0226.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::20) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <e3953b62-9660-42f5-b664-4617a5497cae@outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB0975:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd401d0-f669-4ab4-14f9-08dca723fbca
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799003|8060799006|3412199025|4302099013|1602099012|440099028;
X-Microsoft-Antispam-Message-Info:
	0dxhIoWL28DY3NX0FL//rgaIMvkIqIX7HJLxA8P6118g5+pIFBVJsW5/gwJaFF5B92YxlWAbH5vS9hnWcWLqbDZfyrxMkSeLogN3h376kNdBJ4U7By291eirKEhZNAHMzz06/iJwMQYnx6WNNeKzCrbErd0qrrsneCBKWkkFUhgf5QvZ1w4vkIBXv19vFDIofcWadVSJ9z6KI4KaEqZqhPxIrVESSbccBSW3/Wk44L0wJB4+24zARAwbu0WVMWpyPUMEPbe9FOY0kW5rdE7T52XhlMsgNNVGbMhQIPtN2hOBJMyPWznkZtPutLIihbbFGmZvgV+/WW15Fud8cNTyokdC23nlMpELgBYWS+zRoYFJX0VMf3pVK7DXoE5hP4gQKe6ErhPwEBHGGqUCTvO2X0hmMlDJFlJmY+iAKGsPWcE/ikmvVm7mTg8LU3MZdyAsH63aRTNudmSG2/FzphIeb1cRpaGn+vwl4UNQrvuXSV7YdS3h3WVIvjs9fGjTJamVpzISaHrb9j6KMqbpnHfuKchsYAB9ix9mKpaSPW+M9XLU6rKYdp0hgVlO9kDKitk5AVYf7+xXpr23OECkoHYQdMvmq4svNzBvedtAxaucWjdopqysZzN0ddfuS/xWH5RDy6oZzCKHysXfJLvOthS6mIGDllwAEcKtkTtvnYkIGNo0eV52SQjM2hNDNEUW4/Qa5Yn1LvLiXuC8sGW/7PxRykWUXwuRZ79LRl3NcEcTAwsoD7SiGslg2lW5fNwprsrYi88rzGV4tsGHsNGJj89e6g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkowV3AvN2NmcFpjdFVzSUp6Zi91dDRabEV3Z1lPQjBTMGtBczNCc0tHQ3Nm?=
 =?utf-8?B?azRHNzh3Rjdna1p1eGFBYUthdUZTdVgySjdmYzQ3dTE1ZXV5Q3htMzRVZmVJ?=
 =?utf-8?B?QTd1eCtSeWMrNWhyenV0eEhZa1p6MHhxcE9LbW9ZT2pqQTZyN0RFQ0p2V0NS?=
 =?utf-8?B?bE0zcmVhZXdSTU4wVW1DQU40eXpCNlBFZlhhYXNIa2xXN2dtUUM3ZjJNSlF1?=
 =?utf-8?B?TkxZVWJZUHdZUW1Rei91eVRjNGI4WndCYUE4VHE3N1F5OStWY1h3NS9iUXh0?=
 =?utf-8?B?czhESWdVM0VnV0hTMjFlbW5Ga0dyZkRBYXdDMWlMOXN4R3F1a3E4ZVRHQ3hU?=
 =?utf-8?B?cGhtOXlzVWQ3YmpTRHJsT1U1MW9wV05nVjlaZjNSQW1qUFpoVm8vdk9UZm5K?=
 =?utf-8?B?MkhQMVdhdDBvWlh4R2hPNUZBZG1XaGFPVkpKemMwUTRNRk1HN3lqNE85UXBt?=
 =?utf-8?B?aUt2R2loSzZBMFIvaUtldGxxTzZFSlRIRFhjWnVzNHhoN0FKc0FNd24xRGlX?=
 =?utf-8?B?SGJwMUxDQ0J4azdDZzQ2ZFRyNUpOam5CNGNnaUdETHFjeFRSbVAyNnBNYVJR?=
 =?utf-8?B?UnFQNUo4TUFZR3QxK1RQSFkvbExHcjFkcVJjTjA5K0VJQVNxVTlLOUZvNURH?=
 =?utf-8?B?eDhkYmxnQ3hWUUs1dXMvTEljbjBSbm9udzRmTG5obUhzVkJzRU56Rlc3K211?=
 =?utf-8?B?OEQvUnJJNVVRVVMvcFFOM3lqNm1vL25LeFhkdWoyM1ZZditlM21NVExDUzhi?=
 =?utf-8?B?dlUvam9hTEJNN0sxd1c0ODd5WDNPNDZYTjlVNnNrUnd5TGR6ak9Kam1qaHZS?=
 =?utf-8?B?WmNTRFJZd3k4T0pCTCtEQzlvbEpKc2I5RnhuWXBER3hxaEN2TTE2YzdJQ3N4?=
 =?utf-8?B?eG01MlF3VnVjNWMrVTF0OTJyQ0Rkc3dmWFA0UlJlRzdicjJsbDhRZFZPWUZJ?=
 =?utf-8?B?bHRMRWdiemxiRW9jSnFxcCtqZDRQQ0FaZDR5UGVnTGpkN1FSV0FJZ1pPb1hH?=
 =?utf-8?B?UTRWOVRGZjVzWCtoSlRSbHArVWF3UG83ZTVsbXRtMEFLeGl1S3F0T1UrTGlU?=
 =?utf-8?B?Q29uUmtzSzQ0ZlRMbDRFUndBTHk3Ry92ZFBLQlUvZ1hqS1B4T05rMWlSQXZk?=
 =?utf-8?B?d1dUMVBocHJaWmROeHVPYjBQT05rV2lnVE5jWXJGbmtnWUd0OG9RazMvN2do?=
 =?utf-8?B?cmI4RU1Mb0V0bWl1OGVJUlBCMkdwZittTVh3WEF6azVRV2dtaTJ3WUQzQXRI?=
 =?utf-8?B?RjVqU2NUV2ZweUpDaHJUc0ZaNXJBeURNS3ExTmRlMmxiaHVad2JQQmN2RDNi?=
 =?utf-8?B?R1FZbEdRZ0RCelpDNFJHSk1CQXpVNGtGOSt3aXcxU2c5VlRpWWg0RVVqd3Fx?=
 =?utf-8?B?RWd2MGVxUFpvalhyenNBVTJ4WHA4V2dTSW5PWjJnRGg2V1AyV0dIcjVDOGl5?=
 =?utf-8?B?QjBxT0wrZHlUdE84MnJ3QWlWT29wdGc1TjJZdmxuRm4yWjNQd1ExQk43aXFN?=
 =?utf-8?B?K250MVhIUjNaL0NqNzVDWFMrSkQ0dFFlVXVSb2dpTW1hWUZOSnNPdVpiOWJh?=
 =?utf-8?B?bEJKM2lQYk91Q2l5c21yVHVWeXhaVmk5VmRFTEJTeWwwTzhFcWNmRHZkdUpL?=
 =?utf-8?B?T0xQVkFjKytvcTRIakVvNmh2SXdFWTdxem52UzB6TURhR2Z6VmxJOGt3ZGtL?=
 =?utf-8?Q?9vft5fk4kvkbYxj7jTUb?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd401d0-f669-4ab4-14f9-08dca723fbca
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 12:20:17.1447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0975


On 2024/7/17 22:30, Nathan Chancellor wrote:
> On Thu, Jul 11, 2024 at 07:09:48AM +0800, Chen Wang wrote:
>> This build error is due to the changes about
>> "dt-bindings/clock/sophgo,sg2042-clkgen.h" are still on clk-next and have
>> not been merge in the master.
> A tree needs to build by itself, so changes like this need to be made
> atomically. Mainline is now broken because this change went in before
> clk-next:
>
> https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/9966522897
> https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/9966319154
>
> Please ensure this does not happen again, it is really disruptive for
> people who test the whole tree, especially during the merge window when
> we are trying to catch breakage that went in without being in -next.
>
> Cheers,
> Nathan

I'm sorry for this, I will notice this next time.

Regards,

Chen

>> On 2024/7/10 18:56, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sophgo/dt
>>> head:   b1240a39511b9206293b82ac372c5114d6e15821
>>> commit: b1240a39511b9206293b82ac372c5114d6e15821 [1/1] riscv: dts: add clock generator for Sophgo SG2042 SoC
>>> config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240710/202407101850.eIQyngoV-lkp@intel.com/config)
>>> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407101850.eIQyngoV-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202407101850.eIQyngoV-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>      In file included from arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts:6:
>>>>> arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10: fatal error: 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
>>>          7 | #include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
>>>            |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>      1 error generated.
>>>
>>>
>>> vim +7 arch/riscv/boot/dts/sophgo/sg2042.dtsi
>>>
>>>      > 7	#include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
>>>        8	#include <dt-bindings/clock/sophgo,sg2042-pll.h>
>>>        9	#include <dt-bindings/clock/sophgo,sg2042-rpgate.h>
>>>       10	#include <dt-bindings/interrupt-controller/irq.h>
>>>       11	#include <dt-bindings/reset/sophgo,sg2042-reset.h>
>>>       12	
>>>
