Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EEF156CE
	for <llvm@lists.linux.dev>; Thu, 25 May 2023 16:45:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apIMJmBM8EFufdUtEOUwUnEPO777TPBs4PHxqJ9C21qZJ+T6UIRQLo8Py5Shj9+h/kdG1RxppHLuxqOfm25VGTtrNFiBESaVuU3cTRNA0niy1aq48xgOihi45KLQ01YEAHL0E6ClvcwtYPoDusWQyUHYxEIcY+WROK23/AhbeTkb+nYxmRLY0w5YgM2solyhxatM6kYIyAokNdjf7avgfxApqzKj8ha7jVe27syLiA8DFAb+BSaJa7Zmu+ia4xTr54FRYhkLfc/uP0ssqoz/4atfRuYjm3/PdKmusnsEbz8U+P4rB44fZdHnercxapq3Fc6MmMzdySfgFACRehrtyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OhsB8msmF+vwEawe5vjqknvAKZ70E9EJCcnYrny8yQ=;
 b=bRsS5DLMG0N07fFC2jGOD3BwGsV5GIX8FA7KkqdFxe5vamDWA3tpeYxwd57obJhPR0tUE+hlBFFl60NPLB0Y9Z8lGtZBlyclHVuJiqjohIBhyKdRdwW1srFFHIQoDKwdf29lv1wVfjEJbOMYYrBNnsccnqL1fuhRFUKLBIZ0Kh8euYcs04KQV+9vuZWFrx3jPE0tj+TbeDq49QaXcdlMKqo8HNs8IPMluhxwlPce6lRaeezCKY5AD/4H7j8PjmRl3Vq7q3vGlhclRFqnmILtt2ZpAlVaGinyzMTYJHktU3AR/VgNCRTp0Y5XnavuBDFF+OVYYHblso+2jwlr00fJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OhsB8msmF+vwEawe5vjqknvAKZ70E9EJCcnYrny8yQ=;
 b=mN8xSyWJ2ZxHuWu9AzCbNaJ2hjdspIYGmxTW4On1Uv4Ys8uXaIBKmhu940fero5UC/rHTjGXe7GtIfRqIodNldfCmXlBSVh/leJayh2kHkARfxdeSBEQiRB9rDEcKpL177LKiJ+eqGEy6lY5FHkiV9ydTw/I4R+ul75lB+/3mw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW4PR12MB7288.namprd12.prod.outlook.com (2603:10b6:303:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 16:45:16 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 16:45:16 +0000
Message-ID: <895d3cb4-4813-2ec4-ec1e-f1ad962e17ec@amd.com>
Date: Thu, 25 May 2023 12:45:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-CA, en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev
References: <20230519124438.365184-1-srinivasan.shanmugam@amd.com>
 <20230525152247.GA187374@dev-arch.thelio-3990X>
 <c25b9e4b-535e-801b-12c3-8d4415c321ff@amd.com>
 <20230525162911.GA552113@dev-arch.thelio-3990X>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Mark mmhub_v1_8_mmea_err_status_reg as
 __maybe_unused
In-Reply-To: <20230525162911.GA552113@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0385.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::24) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW4PR12MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 522023ae-ddcd-416c-3c8a-08db5d3f6b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sQIbyAwXeC3AbxmjG7KTtlCEbIo5XcCu7UjsrVcyllI/Y26boKzMutu288jUjAY4Tplrt45iE+K/lQfBZVRPKr9lltT3H87vP591HoIsdbS3nPg9wkKW5M9ld0Bh6VJyl/L2GL4HNKloOjDwQkm6OwhQloRXn12Z0uva8ikPGU54ED0yb1PxWbTCtlZo63jfX+avbV/3ofdKyM+R2xkW6tSTl3gCpvMCJMJW5dwUhy12KIgMXY48uE4gn65eteNheWLExrX4lCQwdflSdRj/n5RJuz36/PWKIKYbyTT29FwyL3ZTu0WHXeJRtGx9LZW1b9nV3IQ7/HMlyJmjpwfneO/FlolgeHKQR55aeRhUnWszEsiqsyYslHSd1JFO7emny3kAur2qzdeXXxMPM8zZxo9R1E8cosGA8LBYeI33tIPkF7xah4KdSjXCe+MYqmI3XAmrCtBtdAeBhMDHrfRO3+926clcJKhUFv8Am40qL5zWoQeMaYdjI+Y1fdiDVzbsislLLDiP+MTYeFvjqaotCqcuwZE0TPnpYp+pVYrUuyhnVq9YdAk4DoUEKuCil+yMS6c4SnCN0y34/3qq1aBJXQ1iC5GgDg84W3CCuY3GFvndkFrjS7t59Yk3nsrtZML8+vh2lwFUBmZ+AqrBs/2lMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199021)(86362001)(4326008)(31686004)(54906003)(66476007)(66946007)(66556008)(316002)(6916009)(6486002)(41300700001)(6666004)(38100700002)(478600001)(31696002)(966005)(8936002)(5660300002)(8676002)(44832011)(26005)(6506007)(6512007)(66574015)(53546011)(36756003)(186003)(83380400001)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUNFSjNkaklWbW9tQ2xjbmppK09xWnMyVTFYU1haN2RiTjNHSnVQbFpWRllN?=
 =?utf-8?B?dDE2ekhyVTdGSmU0ajlCaHdMdGlUeHh5VjVHTkVMdHFWK0xncU1vaDMvaGJS?=
 =?utf-8?B?Z3JTcko5QW9KcGN6SmZvVS9lQU5FVmQvRGNmb0pzN0hDMnRMZ1VBNDZoWnI4?=
 =?utf-8?B?aGpJZGdCaDZISVZqWWpiNkNvQ2ZKcWpKZE9LWFVPdWZaVTNPM3JvRmdPZDhr?=
 =?utf-8?B?UTAzd0FITlhBY0ZNMzRzKzB4UkpuVDRUaE1aUWxsblFlU2IrNFlTaUNBQlZL?=
 =?utf-8?B?OXZqM1hhQlVFTzdocWF0THE4b3pybk05TnVmUnNaS0dZelJzd1ZXQjhOaE1m?=
 =?utf-8?B?MVNDNklONnEvcGZSUlVWam9Dd0JOVmYzTEJYYkhqcVlNUGxkMUtBZWFET1Z3?=
 =?utf-8?B?RGIyQzJHT1luTVplUFFyVzBoOTVrZGkrbHJKSWpNK1RBMWJ6NnZmSXFHVU4v?=
 =?utf-8?B?UUNsRlVNUGkxQmg1aWhEUlNURDljZzhmTXpMajJxZ2NEQXp0S1dLSFNCaFVQ?=
 =?utf-8?B?RENBeGdiV2p3M3hWNnREakdsZmIyTnA2VlBiS09tOUFJMDNWQkVhclRSSHZB?=
 =?utf-8?B?bWpNRFpoVjVzSjhiZ0h3eG0vb2h4bHBQc0ZnbTNZTGZicnZEWm4wVzdmYWg4?=
 =?utf-8?B?RkZXaFBKUnd5TDVJMTZWaWFsMlpKMlg0VDhEOXl4WlAwenZpY2d4aW5HUXhs?=
 =?utf-8?B?MktBcnZURkc4cFdvWkF5VUhmVGFsOFJDV2phdHltMEp6SUcvTTFyak4rVGVV?=
 =?utf-8?B?K1hUaWc1dW56ZmZYZTBzSWg0M0FIaExkYWxmczVpc2EyNlE1R0duMU9rMU4z?=
 =?utf-8?B?bkxVbzBldTVSM1ROM1pNNTlVWU9iQ2FFOVhNN3BVRE5uSncxV2dwNk9NSktJ?=
 =?utf-8?B?Zm5WRWxrM0VGNEVnS1E4RVNqLzFLaFVjNmVtaEdaS0dKeVNSM051V1l0QW9L?=
 =?utf-8?B?Z2FqSTBBYzhUQjNhV3NpcDJPSVptWUFiUC9jT1ZvU2Vld3hTY2NZa3hYaEhP?=
 =?utf-8?B?Z2lyWG9qVXE0RDlMTVcwN2QyRkJiSlJrNE8yRDNEWG9xNWNEd1ZKL3pTWEdR?=
 =?utf-8?B?UWw1eW9RdVYvbkcvWUhQRlpTVTBSVy9xOXpOVWFuNXhuWEJSZVo4WEg2V2c5?=
 =?utf-8?B?eHZUd0Q0NXc3SFVKV3RXMWhINEVDa1ZsVVFDOEh5WDBQQXhiRHRXOW1NdXBq?=
 =?utf-8?B?TlZCRlh4U2VlQkRqbmlCKzR2YlBEdWFmbFczOFVkNkR2UnFySHVwb1podm5h?=
 =?utf-8?B?Y3cwZHUzaytDQ255RHdlZmRGR0hkRjB5SjBWVktDbGVYQm9ZZW5sUExiNGtp?=
 =?utf-8?B?ZnVzMHpUZSswbkMzWHB6cit5Vi9GL1BrVlRVS1JxZ1BVSzhXejFrY1hxWGdU?=
 =?utf-8?B?ZndhUEp2S1lHT1BHaDQ4NHJwVGZPWklacTYrYkQ5YzRiNGFsd3NmcEE4ZStw?=
 =?utf-8?B?NHF3aDdtVzZLbDhaVk10ZThCcEZMeEpyVkNNNFEvaC81MzBJZDhFKytmOUJD?=
 =?utf-8?B?NTVXbWUzNW9FakUydUNkZ00xM0psbVEya3E3VDN6dVprTzdxdEdyZ01IczU5?=
 =?utf-8?B?TCtDK0psZFd4NVlxZkExdVZBWlp1bnVzUHpzRWw2Rk5hQ0NnSnBTcDdlMkJT?=
 =?utf-8?B?aS9mZ2NWZUowSCtDVGZlUkk0REc3d3lZdW01cHNJT0dEb0FpZk11YTROd0x0?=
 =?utf-8?B?V0EzMGJaZktydEJqTlFjU0ZUZ0ZRclJzWFMvbzUyTjlpSVJycnVuMTJURDZQ?=
 =?utf-8?B?eXNDWGNXTTQ0LzBFMDAyQThHQW1xTjIybmY2Z1hnbEY1TmlaZlhIR1pkTmg5?=
 =?utf-8?B?VU13SVZGTW9sbklaOXVlZ3pvVkkwSUk2cEh6bWYzbmVPb3owcHJjRTFQcmxq?=
 =?utf-8?B?bkJJNjNsT1dsSzdqSE0xQ3R5dlgwditPQzRFUTZqU3ZjMVB2Rk5sVGFjZjdX?=
 =?utf-8?B?dDBuTXF6N2RaWkZ3dzYxNC82QS9KTUQ2bnVrb1dUa0l3N2xFTElJSGJpczdj?=
 =?utf-8?B?a21vbW94bFN6S3hJVXBlMFFTRmNZait2ZWt5djBFWCtiNFFCVFM3b1NhY1Zn?=
 =?utf-8?B?QzZKVUdkQ2NMR3BBc3k0NmpZcU9VUVJzWmZDZUF3Q08zR1VSR3dhSEFLa1dk?=
 =?utf-8?Q?kTNeb/4sjqaGU5U/J9miudm9K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 522023ae-ddcd-416c-3c8a-08db5d3f6b16
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 16:45:16.5470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIcHeZd8ygXkfPmG7oRqF47XQY1YCVbTwf+CCMiZZmP6MelQTauOE4gwgfEh22Is
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7288

On 2023-05-25 12:29, Nathan Chancellor wrote:
> On Thu, May 25, 2023 at 12:26:56PM -0400, Luben Tuikov wrote:
>> On 2023-05-25 11:22, Nathan Chancellor wrote:
>>> On Fri, May 19, 2023 at 06:14:38PM +0530, Srinivasan Shanmugam wrote:
>>>> Silencing the compiler from below compilation error:
>>>>
>>>> drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c:704:23: error: variable 'mmhub_v1_8_mmea_err_status_reg' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
>>>> static const uint32_t mmhub_v1_8_mmea_err_status_reg[] = {
>>>>                       ^
>>>> 1 error generated.
>>>>
>>>> Mark the variable as __maybe_unused to make it clear to clang that this
>>>> is expected, so there is no more warning.
>>>>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Lijo Lazar <lijo.lazar@amd.com>
>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
>>>
>>> Traditionally, this attribute would go between the [] and =, but that is
>>> a nit. Can someone please pick this up to unblock our builds on -next?
>>>
>>> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>>
>> I'll pick this up, fix it, and submit to amd-staging-drm-next.
> 
> Thanks a lot :)
> 
>> Which -next are you referring to, Nathan?
> 
> linux-next, this warning breaks the build when -Werror is enabled, such
> as with allmodconfig:
> 
> https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2QHtlCTz2JL0yXNpRB5hVmiP9lq/build.log
> 

Hi Nathan,

Thanks for the pointers.

Srinivasan has already submitted it to amd-staging-drm-next.

Seems Alex will push it upstream.

Not sure who fast you need it, we can send you the commit itself
for you to git-am if you cannot wait.

Regards,
Luben

> Cheers,
> Nathan
> 
>>>> ---
>>>>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
>>>> index 3648994724c2..cba087e529c0 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
>>>> @@ -701,6 +701,7 @@ static void mmhub_v1_8_reset_ras_error_count(struct amdgpu_device *adev)
>>>>  		mmhub_v1_8_inst_reset_ras_error_count(adev, i);
>>>>  }
>>>>  
>>>> +__maybe_unused
>>>>  static const uint32_t mmhub_v1_8_mmea_err_status_reg[] = {
>>>>  	regMMEA0_ERR_STATUS,
>>>>  	regMMEA1_ERR_STATUS,
>>>> -- 
>>>> 2.25.1
>>>>
>>

