Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08on2063.outbound.protection.outlook.com [40.107.100.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EA12F2F
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 20:28:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3QuWy33fLTBo2rPACcbe0JK61eaBmTE6KDlS78MdGIdjC9zerk/YNayULPII/4nH2AtsP9VBdi7F1hAuMCKtofhMhs7U5vUNwf9FkAARQqTC6LvtvMJqQSwJVE2i9Pd2k7pRSqJpPzdnhMaWZTSOdPk5AVP5k6rF/VWDp60OPwP+fqhOLFXrj90PLMv3dHVs4SoJDn5NJrEQWj2PFVdd1O/hqr08xnu3xQjoQBvWXZBVu/2nylthE14uNsfyFKcEaE8yD3Gbrag+6XOprL3xW2Wbt5IqrJvRnTmMjwvWqtftD3vicTFZiQKHY2A84PqUzVByYr8bpvgZVFFslJS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0kvLxA2OjlRLAw6hcLvIIi0a7QxZE8XXCECDLt52oI=;
 b=PB1oYukWH76q2714P/tnElrXF4HKVTiEmIb7O9Z9n4uhgMz0X2osmsqpHbUyOO88erJ2ZLtjQGM+m8gt44JHPw1rDBooPDy9mbXc16lwIvx6f6S9mzAJFedtG/e7bbO4X9U/T/H/VHm2AiXpgPZKnqj7933qhfmkWFtDddW4qPnJ4RXSNzqyBOedMpjrcHi7lZBdtmk/sHL9LPQj39ueE01bAkTSaKb6LRTSLoyDwl0xBzWanuzJaTO3DLXirn2iC6LC5QbV1gGdNi78hbpDKeGM3gkhSPcLeUbpKFt/81cgXaOXn/w1CpyyA9eqfwoq5nWhTKaA7x+b0D/qH4FJAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0kvLxA2OjlRLAw6hcLvIIi0a7QxZE8XXCECDLt52oI=;
 b=EmG3V4oQGErle5uIPqF9a0SwXohOI6aEU/kXaG7RvPwMqKWWVqVR0b06suao6G3eUtP8bSEIMWnPJGFoV95b65BhA9yjlapdTJZ3DXX4o4S6krvWT+92HqwIS76RWc5b4eV7nwpPQDAjJnIArRqVK8HzsQIwANlDjicHI3vqsv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN6PR12MB1698.namprd12.prod.outlook.com (2603:10b6:404:106::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 20:28:32 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b030:b1ba:4eb2:7fb7]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b030:b1ba:4eb2:7fb7%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 20:28:32 +0000
Message-ID: <5ee5a777-874b-bc86-7116-b30f184dbd87@amd.com>
Date: Tue, 8 Mar 2022 15:28:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] drm/amdkfd: judge get_atc_vmid_pasid_mapping_info
 before call
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Yifan Zhang <yifan1.zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev
References: <20220303080514.680150-1-yifan1.zhang@amd.com>
 <YieOPO1WaQ/VnqdD@dev-arch.thelio-3990X>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <YieOPO1WaQ/VnqdD@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::30) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a3503e3-efbf-4741-3be1-08da014236a6
X-MS-TrafficTypeDiagnostic: BN6PR12MB1698:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR12MB16987569F0F2C1E54FA88CF992099@BN6PR12MB1698.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FxdPL3VBlvVo/bUBONyrf2A9CH6NhBsgpSi2AmYgibalgQiGi9LzC3meWBhsGzM9c4gwsZN7MzzWjn+c9X9lT2gLbqMoN4w4YCjyH0jNGK8s2UubqwbKkaC3m7nHkP0496fjWsPi9eXrptK04xKOrxGUXkSMnekBCbl7CPkEU+u0ytP7ctNJWBGslNZtBqpxn/+TtY1xpUhuh6Vo0twsDLhl6UTZ90a66anjyz8tVRCiDCwSme6JQHS6yzpWdOO2GqzaT+a+/KZidompMSZCNhtHu5lnJF04Q2R95HMxbgCvuSQP8Jqz1tTogUXk5w8UNjBH54mOlLZCCiI3C7PHpyC6OX26S9Cz1T6Ti32CwtfchEgKLzggl/RvlKoKsNklkQwUMwz30/9Vo0GpWgt2OzyYH8blLDAbcS29rkDBnl0RDU0F+h49Cd7oooOlYw4+1BPKb9ggsFEYqBxauXzj7lyhXOIKKZU9kKjN1bdAZaF1JlgXmd7IU3uTNJdfaTtScqJL914Pz5zqG/6i+nvFMnfRSdxREwuBUU3ApjCK6wAU2lvMxRtSTp41qdk620vUnxEsBrHfmeCJbV1vaCHOa/ch6z2p8cY3OpxKUHPHUsqF09arAiVWOjzyxWQBtHnKKk5d7vgBsojh4Em2ZEfDr20sW2G4GcsutFS1EdMGByO5X3fXxw7gZwI+VrgeyWzAzKbdF980iBYNOr2j1n+1KkAyqfjL7yWcxsR6yS1mq4U+HkQA1X/bAg3GifG0Fx6M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(4326008)(508600001)(6512007)(44832011)(83380400001)(66946007)(2906002)(36756003)(66476007)(26005)(5660300002)(6486002)(8936002)(110136005)(6506007)(6636002)(38100700002)(31686004)(2616005)(31696002)(316002)(8676002)(186003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aURjdHBQUnpLM1ZGckxvbGcvZW12cDh1UTBob0t0NUxmbk1sQXFhdjFEUjRQ?=
 =?utf-8?B?Y2NreDFkUWh0M252aFcvTmtCNFVpVjBqUzFuL3VkK1hnZXN6NXNjUlgyekl1?=
 =?utf-8?B?M3c3RHRmT0JCOWkrcVlGVTFPdEd4ZjhkakJVeWhiM2FmaTlGbzdpNENtZWpG?=
 =?utf-8?B?NkU0K1I3WFhpdXA5TmtrcVdKZEUwdlZRVWdOTmVlYTZ6SGNOQWZVRG1rNVAr?=
 =?utf-8?B?bUljUnlKbUMwejZkM1JPRHlKRjY4Ujd2R09UL25MSVNpWGlwa1cvMk1pckla?=
 =?utf-8?B?QlY1UTB3ZUtrNVh5QjdmYmNpRGswM3YxSG9uZ0JaLzQ0MEd0R3BQT1NVbE1q?=
 =?utf-8?B?S0RPcHd4WjA0MHBqUm5GQnZneG1MeDQwcExmalJMTVFpVjA5RUo0cDRBaDY4?=
 =?utf-8?B?M0IxOGFuYUtWVm11N0QrWGxPaXN5dDV1L3NMZUlHeU1WdVdQR2lBQ1AzWGsw?=
 =?utf-8?B?OWdTMzJRTUkzMHdnSHM1RDljbEovT1dQV1g4NFdkZHdNNzJieTVXbU1vSWpw?=
 =?utf-8?B?VUY0MWhXZERpcE16L3R5bVdOV3hTNjVZNXYxbE1Fcko1ZmtJbkRqMzM4eUxU?=
 =?utf-8?B?NkVuS1RLWDlqanlhL0E3VnhwbTRMLzFCYUJwTkpJM2hsbEY4RE1sVXAzeFZB?=
 =?utf-8?B?aTNNSUphaUdUV01Ta1VIMGFBUWNMaXNjSGFFZmM4RHh3SFVoZ2JGdmU0bFpO?=
 =?utf-8?B?ZVpISVdYQm96OEhIUHkzTFQvTGFCUUtXMGxvdU9TRDZyell1NnRqWXhud0gr?=
 =?utf-8?B?Zkx0U3lqRDY1V3VqVHVJQ3N2bjcxZVJjWXoyMG9tK0xPcmcrL01OL0QxYVBx?=
 =?utf-8?B?SVdtbDVFdjIwU2R4c25kWjVvOGZpK0ZhQ3g1ZmZVOEQwMmN0WXMxOTQvdVNi?=
 =?utf-8?B?QnNUVld6cUkrSG14ZkEwL1ljLzZBT05FQk1ONERNUTZCV3RLM1lVblNFZkd1?=
 =?utf-8?B?Z2FTU2I2QUZWSFdMczdQRk1xV0pMS2VPMklSWWhldzdOSFdiZVdLbEdRaTdQ?=
 =?utf-8?B?UWw4Zjdxd1p4NFRVcGVuYmJLc0ZjZHV0YjJ5MkJ3ZExLKzdPcEt5Zjh6aGRn?=
 =?utf-8?B?ZW9jVEJJSk00ODZXeUxUcUdXWEp1UFI0T3grMldxcDVxeGY3eWJFVktNdHV6?=
 =?utf-8?B?eDVaRWtUaUZDcW5wZkFaRjA5WXlTNDJwNFVFc1A1QmZMQjlYbkZvbjh0cUNz?=
 =?utf-8?B?Z3piZU5Sb3ZSUW9FRGIydCsrNFlaWWhIQzdCeWNvRXJpMUdvM1QxUXdmVENC?=
 =?utf-8?B?V3dsTmIzQWw3WlZjbTdIMEZoVCsyWGRnaWxjUEpldmdwRXRWRkZibGp3eXpG?=
 =?utf-8?B?TTBjSFVHRjkvS1lPckQzZUtjNXBtZXpZeWtLUTd0YjVwK29aeE5ZNmpHajVJ?=
 =?utf-8?B?Q29CZzdaTlBaQXZrM2dFQi9VTFpQSEp1MExPSzVCUmYxYWNOaXFudnRhNlVr?=
 =?utf-8?B?SzdtVGdTY0dWZ2VLUldrcFhqVkplVEgvL1JmU2Zzb09pWERnK29WelEyZDdD?=
 =?utf-8?B?U0R0K0NBVG1uVjFYdDBqdm9JVVRiYjM0STNwSEFxK2VFb2gybVlKYi9HaFhO?=
 =?utf-8?B?KzJlTXhneTFEd3ptbmwzOGU0R1FsMVdBUnB2YncrdWhUeGk4SThGZERDbnRH?=
 =?utf-8?B?T3FNY0ovaTlYQjg3K1NiWnJiRlNzREJiclR3OTNnR1FrbzVSSmxyWDhjMXpw?=
 =?utf-8?B?cmlNQll1d1RUQkhNcTZHY0FlSjhYMHlVeGZqRFNaTnZ0QjNGbVdlMzFLVGMr?=
 =?utf-8?B?ZG5oRllkeHhDR0xqaDV0Nmh6M3Q1UXFzWDFSMmExUXZtdHBTMzZpeWx2MC9Q?=
 =?utf-8?B?TGQ1UTZyYVhGckhOYnlGb1gwaHZTaXM1WWV5NVJJcG9vMFFNVHRiQkpPUzA2?=
 =?utf-8?B?M3hoZWZiUWxWMzduWG1ITmdBaTJZOHY5dFNCRkRTYmdPTWpheGxtZ3k0WFJt?=
 =?utf-8?B?OHZvM21mN2s2M01qS1dGTHV0RTZ1dVM5YkRwK1hBYXhZczJweVlBanJJQnJy?=
 =?utf-8?B?bGt5a1ZISHpXdEYySGNrSUlGbWh3UjIrRXo4MlJyWlZwMms5NHZ4d2NXa0tq?=
 =?utf-8?B?c2FTK0VkcjN4VE1YZW8wQXloR044ck1mb3hjSnBQam5PMHpWcWdMRnpKbk5r?=
 =?utf-8?B?Zkwvc3NZQXU2SzA3NlZLT2I4aEx3UCs2LzVzdzVtcDNMeDFqRjNoR0pWZEZ6?=
 =?utf-8?Q?fjUSt0Vcd3WFY959Jsd3HwU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3503e3-efbf-4741-3be1-08da014236a6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 20:28:32.4241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9B1HgopYy7lioE0HGpgoUNQ4LaoOSBuivCfKyEojZp4xIFe8/z/en4xW8pdzixbkg2xmIqpmB1dB1IqsQfMDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1698


Am 2022-03-08 um 12:11 schrieb Nathan Chancellor:
> On Thu, Mar 03, 2022 at 04:05:13PM +0800, Yifan Zhang wrote:
>> Fix the NULL point issue:
>>
>> [ 3076.255609] BUG: kernel NULL pointer dereference, address: 0000000000000000
>> [ 3076.255624] #PF: supervisor instruction fetch in kernel mode
>> [ 3076.255637] #PF: error_code(0x0010) - not-present page
>> [ 3076.255649] PGD 0 P4D 0
>> [ 3076.255660] Oops: 0010 [#1] SMP NOPTI
>> [ 3076.255669] CPU: 20 PID: 2415 Comm: kfdtest Tainted: G        W  OE     5.11.0-41-generic #45~20.04.1-Ubuntu
>> [ 3076.255691] Hardware name: AMD Splinter/Splinter-RPL, BIOS VS2326337N.FD 02/07/2022
>> [ 3076.255706] RIP: 0010:0x0
>> [ 3076.255718] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
>> [ 3076.255732] RSP: 0018:ffffb64283e3fc10 EFLAGS: 00010297
>> [ 3076.255744] RAX: 0000000000000000 RBX: 0000000000000008 RCX: 0000000000000027
>> [ 3076.255759] RDX: ffffb64283e3fc1e RSI: 0000000000000008 RDI: ffff8c7a87f60000
>> [ 3076.255776] RBP: ffffb64283e3fc78 R08: ffff8c7d88518ac0 R09: ffffb64283e3fa60
>> [ 3076.255791] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000000000f
>> [ 3076.255805] R13: ffff8c7bdcea5800 R14: ffff8c7a9f3f3000 R15: ffff8c7a8696bc00
>> [ 3076.255820] FS:  0000000000000000(0000) GS:ffff8c7d88500000(0000) knlGS:0000000000000000
>> [ 3076.255839] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [ 3076.255851] CR2: ffffffffffffffd6 CR3: 0000000109e3c000 CR4: 0000000000750ee0
>> [ 3076.255866] PKRU: 55555554
>> [ 3076.255873] Call Trace:
>> [ 3076.255884]  dbgdev_wave_reset_wavefronts+0x72/0x160 [amdgpu]
>> [ 3076.256025]  process_termination_cpsch.cold+0x26/0x2f [amdgpu]
>> [ 3076.256182]  ? ktime_get_mono_fast_ns+0x4e/0xa0
>> [ 3076.256196]  kfd_process_dequeue_from_all_devices+0x49/0x70 [amdgpu]
>> [ 3076.256328]  kfd_process_notifier_release+0x187/0x2b0 [amdgpu]
>> [ 3076.256451]  ? mn_itree_inv_end+0xdc/0x110
>> [ 3076.256463]  __mmu_notifier_release+0x74/0x1f0
>> [ 3076.256474]  exit_mmap+0x170/0x200
>> [ 3076.256484]  ? __handle_mm_fault+0x677/0x920
>> [ 3076.256496]  ? _cond_resched+0x19/0x30
>> [ 3076.256507]  mmput+0x5d/0x130
>> [ 3076.256518]  do_exit+0x332/0xaf0
>> [ 3076.256526]  ? handle_mm_fault+0xd7/0x2b0
>> [ 3076.256537]  do_group_exit+0x43/0xa0
>> [ 3076.256548]  __x64_sys_exit_group+0x18/0x20
>> [ 3076.256559]  do_syscall_64+0x38/0x90
>> [ 3076.256569]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>
>> Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
>> ---
>>   .../drm/amd/amdkfd/kfd_device_queue_manager.c  | 18 ++++++++++--------
>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> index 1cd2ea536bd0..77364afdc606 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> @@ -505,14 +505,16 @@ static int dbgdev_wave_reset_wavefronts(struct kfd_dev *dev, struct kfd_process
>>   	 * to check which VMID the current process is mapped to.
>>   	 */
>>   
>> -	for (vmid = first_vmid_to_scan; vmid <= last_vmid_to_scan; vmid++) {
>> -		status = dev->kfd2kgd->get_atc_vmid_pasid_mapping_info
>> -				(dev->adev, vmid, &queried_pasid);
>> -
>> -		if (status && queried_pasid == p->pasid) {
>> -			pr_debug("Killing wave fronts of vmid %d and pasid 0x%x\n",
>> -					vmid, p->pasid);
>> -			break;
>> +	if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
>> +		for (vmid = first_vmid_to_scan; vmid <= last_vmid_to_scan; vmid++) {
>> +			status = dev->kfd2kgd->get_atc_vmid_pasid_mapping_info
>> +					(dev->adev, vmid, &queried_pasid);
>> +
>> +			if (status && queried_pasid == p->pasid) {
>> +				pr_debug("Killing wave fronts of vmid %d and pasid 0x%x\n",
>> +						vmid, p->pasid);
>> +				break;
>> +			}
>>   		}
>>   	}
>>   
>> -- 
>> 2.25.1
>>
>>
> Apologies if this has been reported and fixed already, I have not seen
> it if it has.
>
> This patch as commit c8b0507f40de ("drm/amdkfd: judge
> get_atc_vmid_pasid_mapping_info before call") in -next causes the
> following clang warning, which appears to be legitimate.
>
>    drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:508:6: error: variable 'vmid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>            if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:521:6: note: uninitialized use occurs here
>            if (vmid > last_vmid_to_scan) {
>                ^~~~
>    drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:508:2: note: remove the 'if' if its condition is always true
>            if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:490:19: note: initialize the variable 'vmid' to silence this warning
>            unsigned int vmid;
>                             ^
>                              = 0
>    1 error generated.
>
> Should this function bail out earlier if
> ->get_atc_vmid_pasid_mapping_info() is NULL, rather than skipping the
> for loop?

I agree.

Regards,
   Felix


>
> Cheers,
> Nathan
