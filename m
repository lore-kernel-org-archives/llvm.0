Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0902D3727;
	Wed, 24 Jun 2026 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294503; cv=fail; b=CCsYX3tVOU38WcNzXIuMPUaQtazrG7xF6CBwUHsgB/krSWMs45A/Hb0tQVTZgC6UOZfRgvnFBmDFpCHiVp3429iQ6FXqp5+tgoC1YOjTzc5o3ISTQ7PjpwVuhplNf0jS8xMV6pnMPf6y2rHNc+s8vVg3gzOVfGAdut9mOjHgdZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294503; c=relaxed/simple;
	bh=YWFFpltyIB+9xlVPLdnnSl+WJozcld5HG1TETobE6UE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gWDOq0A4dRkGUmGgIVY1DYEWdgrjiixkY+OeqmB1X7Vtl2AWMJHykBBjo24M99dMf6TYjkNaVypQBNDLc6eGGzCI/s9qzM3yDgvXTK7QojRzuZnjjoMFSjf3djQJzlRgNev5qRaf5SNzGuc26aqj31HfPTu0GAlnd7nHDq1aKws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bF8XAsDb; arc=fail smtp.client-ip=52.101.43.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bF8XAsDb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxou92uCYsKmLHkJ8SMy4rcNtrIZWiIyUHojUkbocjoRq4Q8aAbrxzOe/TigfuzsJOC5p5TFLf5lHeNe8ONKQCmTTxQDd18mPvu+YMyfzpcITxKCKYvyM8ilv9A61eobWs0HSWcEIBmTBafBFlny2Ibz+CPbvl0b9c/VbMW2b9+QkrOPgFC7DwNiaPb54srD/23PV3XD2FOB55gBxl24KZ0avHTYlIumCOHHTvFu1rXxavLOqu/l7WJrFEFhwUs9R/gRHTpSDdJ1pyZlSlS2qzfu8pE9uOkvDEJgEvzZICtfn6T+ZbNLzfn1DuT/XtILvLIAbSpwsef4dBszMf1uSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbfQ5dZ6uzrVdsWDqhUSpE6yFI7QhLph3AQJnYkqEXw=;
 b=foCwFSTR2Wau3JwrAFsfdhpmHHOds8IKTbP58jjlhv9BqDwnQU+p56ndujmVvEZ8kkwQnQ+JgnCJrsfYIa6iyDzOinoWz6R3dJvAhS44x9mDLKsqYGWGwyE6/PxrwCYauREUhagYB8gau0VIJ/M6r3k7hiZNMVsQNB86qxwtXdMazUhvgsjWGAhyN4zdEunuV7tZQQY5LCOwFphVeAHyzUFokoLCpH1YWVhSIs3uQsXiK+NbP8DU394ywYBoNbAfXexM9Utkwh4IW0zagtheh9B4F5+ZQliYJjWZ3k6TTNGqcTnoh+2cbIeuvFm8WJ6+g0E9yfYFWjIwl3lYgMN1Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbfQ5dZ6uzrVdsWDqhUSpE6yFI7QhLph3AQJnYkqEXw=;
 b=bF8XAsDbPJs4oNO81YtJB7sOJWEuQhV/VOxFiWCrT7SOceJTXRDCk+ml56k+Bd7VYGCcfXxUaSWTJYUsy35KwIb+HlTIKfbwWVwp5/e+J9cO4w4SnoPHgq2yPx7yNhQulO/kSqyVkDZtb1zhKBq/0lMgNcwK7qWPWxLzbo9kEL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4472.namprd12.prod.outlook.com (2603:10b6:208:267::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 09:48:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 09:48:15 +0000
Message-ID: <eb2f60d1-5b6f-479b-9e4e-a4509dd65efd@amd.com>
Date: Wed, 24 Jun 2026 11:48:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 14191/14955] vmlinux.o: error: objtool:
 amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with
 modified stack frame
To: Peter Zijlstra <peterz@infradead.org>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: kernel test robot <lkp@intel.com>, jpoimboe@kernel.org,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
References: <202606232356.gwHMAJAW-lkp@intel.com>
 <CABXGCsMFOo-X_JeZ6qiwN8L=_4wOcf9xeS_RcDAb8XfzA6+WBA@mail.gmail.com>
 <20260624092806.GX48970@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260624092806.GX48970@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4472:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e2b626-aaa1-4a8e-3b68-08ded1d5b681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|4143699003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	h8neYAfleaUsuOo2wN69FsnWOAH/b5QITpo7NBKvmaB4rU1H4aW/HDCspxQv2KYvOBRcarmbleH7P5m2gNMwsd4xe0cLCDxY6MyWJrwGE0kOTNbSOxCNqI0VsOhCTJXz71IC2JpquHHjTqol/JJJxpH/2UMcxmTZ0pCKQyghWIONKbTErCxSxuti4ltpEo/a4qvoBDsT1GnV3/JIyFxnWT84HrPY0ARfgpn1Re9exChT1qKbdTB9NO7krWgX5/mtdl74MVJATP+FHR6mMPG2soZzbn52ZMjbh4ClZKvC+0n/KNUT6GFg0mydI61rPCih4HdYoKaLMqHIyG9r173k4HWw2q6AmnXQaWpPRrHc9hqhgcIsyS8VvXaNiyePsonQzkZRJkzZGmSebK2QD0Rxa6hciWvtsnBagiVsfje9ol62LuwppvZnO0zb3EUEs9ulSS6H3u9oXgv3ctiK0mZfw9APaZ8nNYN6rxmC/8SutgLCFigwMklHmtxNWV7E5q9k0sQiaWtl2pFizRVZv6ijeSt3J3SNgH4liXXYyQGBaI29wm5spyZv1hGMETeIb8828FQwzGS0/6JUGugcT5zYJSRmM1FNcWd1KfSjOAI/1u6BEvr2Mw9eIYOFYvX5FKbcjZnCfG3ccTFIqPjFutF6GkHeoqj594pwX2LVZaBfJ+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDl5WkYyV3hIb0hQVkRvVEZtSEJTQ0dFZ2Zoa09oVHdXanFGb0tIc2VVR3Fy?=
 =?utf-8?B?UlRZQzlqWmJtaHpud0FzN2phby9KWTFKcFZFRVRmUkwyZy9YYVREQWNqQVFi?=
 =?utf-8?B?cUtKSUpqR1lLQmtpKzlGUGI3MU9mc20xWkFLUjNMMVhZV05uSzVxWHBmRXRx?=
 =?utf-8?B?OU1Tc3VycmVieTNRbFN5M3VZSW1GUkFLZzcwMmFlOWt4c01jYUhjMm9aWEJ5?=
 =?utf-8?B?WURkS3REeWI1NVpnc0xCQ25KdngvMHIrWWlrc1ZLa082eWp1UGhYQ3JCb0RW?=
 =?utf-8?B?WDVJNzFaNEtzeHUzNTJXNWUrdXd1QVBISUNVbHhybXpPcG9OZFRoSUZUTXZl?=
 =?utf-8?B?YUJEY2tRZGZHNElqZW0xUGk3TU4waFZaZmpmRGNzYUxRQkRZU3NIOFFQLzc5?=
 =?utf-8?B?QkhYbHRXbFFzMHBTamlsaGF4dm1xMTlxTnNsQi9mV09DY0tCQU14dXVxdkhL?=
 =?utf-8?B?NWhYdWdRWTdEM1ZhWTJ6QU5zcW5YMmR5VVFwV0JBVVF5bW5VTDdwNlZ6aHg1?=
 =?utf-8?B?blNLdjl6QTEyNUV5RDF0U1ZaLzJ6QzBUcVZTc3dzNjVPNmIvYjBvV2xYVTVV?=
 =?utf-8?B?NkJKMzk1M3FXanQrRFFaREgyaW43ZWJnQk5IUy9ZM3ljcUdzdHc5b284cGZo?=
 =?utf-8?B?RHF6SnZVcEZxSkh5Nm1CWGxybmEwTTllOEZDVzNCTzE4WkpkUHRtQ2xlL1ky?=
 =?utf-8?B?ZlJVbG80MFYzSVk4UkFEMDk0UEN4ZERTQ0EwK1lPU2dselFSK0ZmbElXVnZX?=
 =?utf-8?B?MXl1T2x2Z01DbnZwZmhBenRlMlJ6TkYrWjRWUXI5bXNxZDkyNUEyaThzcU9E?=
 =?utf-8?B?cXR1QWh4bk8ycWFzc1RkbFZLZmMrdXlBbm1PWko5NkUvK0xBUXpsSmlQL3B1?=
 =?utf-8?B?MzVPcC9wU0krOURxelAwMGYranRycnNZRHFSdCtiQ1lTSVN1U0VPNW1ySENQ?=
 =?utf-8?B?YnZMYkV2MHkrYWF2ZW0vL3d1N0tWdlk3a1owWTFpWTJwUVBuaDlIbGR2RmJy?=
 =?utf-8?B?WlhZT3llVzZiNm10V3RXa016UWhFV1cvazJNYzhFQlhXaitSVkV4eTB6bVBW?=
 =?utf-8?B?d2VIcGpncTRMNzRPMEdiWU5pMzZaUVlJZS8rWHlZNEJRL292RUFGWjRyeGVH?=
 =?utf-8?B?ZDdKREJlOW1aOXVaN3MwdWw3UGFydmZ2ekRZTmlZeUFSZXlPcEFwemZCNGxK?=
 =?utf-8?B?dkYvQVI0VWxYU0Q4V2JzSFU5N25lYlh4QXFWNlNndXk4SENDWnowTWZ4Yml4?=
 =?utf-8?B?enhaUGYyY2NQViszYjhmREVpUTFNQUhYZmRReG0yVmtxK2hSTitnSDlrZWQ0?=
 =?utf-8?B?S0REQi81MjVrSW0xMkQrbElHMHRJZ2EvRmJ1eEN3Y0tPSVhMSUNsTXYwU3Nj?=
 =?utf-8?B?dTQwUUF6c0xkYWRrcm9JMXdmNXlleFhJeTVhcnpqdHBpOG5Sc2ExSEdMc1NM?=
 =?utf-8?B?QnFzY1BYL3hPNERMSjF3UUIzeWNrL3JGZjY0azl6bVl0TXh5aXU0bm1NdWFV?=
 =?utf-8?B?TUNUbENGK1N4bUphYm0wZWpIV0RnSHdjZFViVHl6QVBwMktCblJFa0hMS1JR?=
 =?utf-8?B?bHYzSUlZZW9ZazJSSFY0MlZicXVsS1BiVGlaRHBhL3lwWmFTa0l1b3pldlkx?=
 =?utf-8?B?cklrVnpLNGxKcWlKVjZ5UFhsN25DRTZmQitlWHlKc255eWNQUXZDTDQyMXl0?=
 =?utf-8?B?WVN4S2R5SjFzcjRnd1FiVWFuVGptTkZEK0ZpMjdGRWFaWUovUHNsNnN1RjI2?=
 =?utf-8?B?MHBwTllVU05GZUJId0dSWlBJT01ZMFdJNmZCajBYak5GaTFNeWVXRmFyOVNo?=
 =?utf-8?B?N2k3S1BRTHUzVGZBT1dsbVB6Mi83NGxteVZvY3ZDT0crczRpblJwd2hZeXIy?=
 =?utf-8?B?cFRCZWE5RTlVemhZbk9lVWdaT0NPM0IzYThBVmtQZjJlbzhMdWpnZVFsTlJ3?=
 =?utf-8?B?NVJjNDE1RFhGRlMyOUh3UDZuV2hmUEFiVk1EL2FXd2dITno2cFJ1SEZuN2Rw?=
 =?utf-8?B?djliVXdLTjRNaXFVdU5Cd0RRMVcyeVFCZkpVcDVCREd2RGZ0bHhJTy9QcG1W?=
 =?utf-8?B?eW5TKy9RYjdSNWZ3R3JnS1VkRnhMM0h1LzR3QVE1MlkzN2ZXSUpFcHlpRGRS?=
 =?utf-8?B?MmU1WGc4S2VoaUdEQ2R5YXRYMUtyWFI0dW9NMWlEc2hCOUJJa3RWQm04SFhP?=
 =?utf-8?B?cHVabEtsVmgzT1hRNUVQSnJldzVJeEtPNThYemthZm84dWNzWENPRU52RWxH?=
 =?utf-8?B?bzd4ZGtKVnlmTElyNkc4RHgvcFBTRXc1NkNKaURWOVhyeTZJRk5zd2lSL2lL?=
 =?utf-8?Q?pqGlHo4yKvHH7rRBIg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e2b626-aaa1-4a8e-3b68-08ded1d5b681
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:48:15.5008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRCT6J/iWaACwYFmYWtTsYr4/dOARUZanuFAN67duxnND9H4iy/Gr0fxXD//ZECf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4472

On 6/24/26 11:28, Peter Zijlstra wrote:
> On Wed, Jun 24, 2026 at 01:57:46AM +0500, Mikhail Gavrilov wrote:
>> [+Josh, +Peter: objtool question below]
>>
>> On Tue, Jun 23, 2026 at 8:17 PM kernel test robot <lkp@intel.com> wrote:
>>>>> vmlinux.o: error: objtool: amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with modified stack frame
>>
>> I looked into this. It is an objtool false positive on a computed goto,
>> not a problem in the patch, and not specific to clang 22.1.3.
> 
> Urrgh, computed gotos :-(
> 
>> Config has CONFIG_LTO_CLANG_THIN=y, CONFIG_FRAME_POINTER=y, KASAN and
>> OBJTOOL_WERROR=y. objtool runs at the vmlinux.o link stage (per-TU
>> objects are LLVM bitcode under LTO, so the single amdgpu_vm.o never
>> reaches objtool). The robot hit this with clang 22.1.3; I reproduced it
>> on the same config with my system clang 22.1.8 (CONFIG_CLANG_VERSION=
>> 220108), so it is not a 22.1.3-only codegen issue.
>>
>> What +0x186 actually is (disasm of vmlinux.o, WERROR dropped so the
>> object survives):
>>
>>   17f: 48 c7 c0 00 00 00 00   mov    $0x0,%rax
>>           R_X86_64_32S  .text.amdgpu_vm_handle_fault+0x196
>>   186: ff e0                  jmp    *%rax
>>
>> %rax is loaded via an R_X86_64_32S relocation with the address of label
>> .text.amdgpu_vm_handle_fault+0x196, and +0x196 is an unconditional jmp
>> back to +0x13e, the head of the second drm_exec_until_all_locked() loop.
>> This is the drm_exec_retry_on_contention() computed goto
>> (goto *__drm_exec_retry_ptr). There is a second identical pair at +0x194
>> -> +0x188 for the first loop. Both targets are inside the function; this
>> is not a tail call into another function. (svm_range_restore_pages() is
>> the inline stub here, CONFIG_HSA_AMD is not set, so that path is gone.)
>>
>> So clang materialized the label address as mov $imm(reloc); jmp *%rax
>> instead of folding it into a direct jmp to the label.
> 
> So, if my heat-addled brain isn't completely gone, then this all boils
> down to something like:
> 
>   drm_exec_init(&exec);
> label:
>   for (;drm_exec_cleanup(&exec);) {
>      ...
>      if (unlikely(drm_exec_is_contended(&exec)))
>        goto label;
>      ...
>   }
>   ...
>   drm_exec_fini(&exec);
> 
> Except, you've laundered that label through a computed goto to allow
> multiple such constructs in a single function -- because can't have
> multiple identical labels etc.

Just FYI: That's actually not the reason for this, the label name is unique now.

The computed goto is used to limit the scope you can use the retry macros because we initially had problems with people using that outside of the loop.

> 
> And then clang, can't untangle the web and makes a mess of it. Which is
> really rather unfortunate, because indirect calls are yuck -- also
> retpolines and cfi and all that jazz.
> 
> I do think this is very much a compiler issue, clang should never emit
> an indirect call for this. Doing that is just aweful.
> 
> Also, note that if anybody were ever to use a guard() inside this
> drm_exec_until_all_locked() construct, there is no guarantee the
> computed goto will actually trip the __cleanup(). Computed goto's and
> scope do not play well together. And the moment clang emits an indirect
> call, it means it lost track of things and things *will* go sideways.

Good to know.

> 
> And the only reason you want that label, is because nested loops,
> because without that, a simple 'continue' would do just fine.

Exactly that, yes. The nested loops are unfortunately a very common use case here.

> 
> That is, I think this drm_exec_until_all_locked() thing has some
> fundamental problems the moment clang fails to optimize it away.
> Correctness really depends on the compiler not actually ever doing a
> computed goto.

Mhm, that's not good at all but I also of hand don't see a way to avoid the computed goto.

Thanks for pointing out what's wrong here, I was already scratching my head about that quite a bit.

Regards,
Christian.

> 
>> For the indirect
>> jmp objtool looks for a jump table in .rodata, finds none (this is a
>> single relocated label, not an indexed table), and falls back to
>> treating it as an indirect sibling call. The frame is already set up
>> (push %rbp at +0x5, sub $0x160,%rsp at +0x16), hence "sibling call with
>> modified stack frame". Runtime is fine, the jmp lands on the intended
>> in-function label; this is purely an objtool classification issue.
>> KASAN probably
>> tips the balance: the function is inflated with __asan_* checks
>> and shadow tests, and on that body clang keeps the label in a register
>> rather than folding it.
> 
> Right.
> 
>> The drm_exec_until_all_locked() / drm_exec_retry_on_contention() macros
>> are used widely (amdgpu_cs, amdgpu_gem, etc.); the patch under bisect is
>> just the first to put such a loop into amdgpu_vm_handle_fault().
> 
> It is also the first to cause clang to loose its mind and emit an
> indirect call. Which as I've explained above, really is a problem.
> 
>> objtool question: should objtool resolve an indirect jmp whose target
>> register is loaded from a relocation pointing at a .text label inside
>> the same function, and treat it as an intra-function jump rather than a
>> sibling call? That would cover the labels-as-values / computed-goto
>> pattern that this and any future drm_exec user under LTO+KASAN will hit.
>>
>> I am not respinning the series for this, the page-fault conversion is a
>> pure refactor with no manual stack work. Happy to test an objtool fix,
>> or to help with a drm_exec.h workaround if that is preferred over an
>> objtool change.
> 
> While I do think we could teach objtool about this, I also think it
> should still emit a warning, because as stated, this pattern is very
> very suspect and likely broken :-(
> 
> 

