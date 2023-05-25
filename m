Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9416A1C764
	for <llvm@lists.linux.dev>; Thu, 25 May 2023 16:27:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYekP12Mz9hWJXaxE0RaUWZUsQlYvj0WdIZpDspdcmhjAxnHTjhsT9cU9nGttwJ371U2SpFJATa/xbwhOldR1nauKffyF1c+nCxr4D/14NxeBNMoq3m8I0LT2P8bwOaro5D0TsW5ySsafEfsDh3rOZC0NYVSYOSxtN8O/uMnJzOe5YTgj38Pk9Zh7GAESnJMSgDHP2yq3vj85AxmWbhbl3Wee48iAvTwhs9Hh69bybUqQrft5bXfxZoamBpzHsA8NAlgt1mC0z4DDPRFpSiQDsSeA31i+/oFT4lLrk+sbW4MAsqmv2uYJ38KvGn/H3QYm/MUo9Dyc8aC+NqjDcuSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fk/C79KkWc+VORZd1NY9E6cPlFjoGOhZYS+GNwRQCQ=;
 b=CoPT15eUtOgUZEIyRD1B5vvT5vW11LXBLjouW/k23Xj2R6jAnR99fY6wFdN87waEJ3gR1aVP/THYa1o22LhwWXEc/2OhhwGrRjwFko3kiP4rTBGjmGp5gKOh/2iMJcLXnYlMzMmj5pO1CB2Xc2yoPFsc5X33YqEzpt4RK69sMGWXkDo8HPi0Zg3zI8eZVB4ZTKSB6VaiTFM2ej2KJ2Fkh7X++4j0Cdrb+TMIzWjOE7SCoBt14KemTMERmA2BRtQwdp9p2pvgoM3OFS/fo3GBIvJN3zfnuqVWr8nfDCq2wwzaesSIZNF8bhPyPqqm6I1WYuhft6z5rSX15/wehRch1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fk/C79KkWc+VORZd1NY9E6cPlFjoGOhZYS+GNwRQCQ=;
 b=v2plye/ZtTH6e8cx5qBYNrjB2qc7ku9sTzwP+W+DYAVMkYRVG2Jp+OjVL5frKWoURCllMxUGzgm0TkStdRfp2TWqVtdOIGEzKY+iBCsXUQs74Z1jQUSwV0sLCHeqL0oBFSyfBokkSURIAehti+QHyKSy5hPHiWZvbj//sIAeoME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Thu, 25 May 2023 16:27:00 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 16:26:59 +0000
Message-ID: <c25b9e4b-535e-801b-12c3-8d4415c321ff@amd.com>
Date: Thu, 25 May 2023 12:26:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Nathan Chancellor <nathan@kernel.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev
References: <20230519124438.365184-1-srinivasan.shanmugam@amd.com>
 <20230525152247.GA187374@dev-arch.thelio-3990X>
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Mark mmhub_v1_8_mmea_err_status_reg as
 __maybe_unused
In-Reply-To: <20230525152247.GA187374@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0106.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::17) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA0PR12MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: dda4a860-576c-4f65-5cc2-08db5d3cdd37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K9vSpUW9QAPko3tJzffFVvqcOLBfDNkKpp+rbxkmHERK8hpVYX+OcwccqpthwrzkjE4y+SsCIcc+ZF3oY0SYtmI80TtQ/rJaVFiykP74pzrsysJDCFxWrOSMT5I/noDNiR+U0siOGAfq/QlHgqN2MS6mtU/ib5vwirITjB/icL0Xv30tHLRmp/FzRVOk5abQ1J26SWzgWUHxc5AeN4iWP5WQKE/cUrar8fSrOQpMfV0B+E1EAnrrxTl+4vy7w5taPtoBHxa1geDZBSDDhjSCF18G4veqpVcHF/v9vm2WaGSIxP8fcF6LUFL6sq9reXNw8FGlnf5bP63N7oXNKaXk4Szf0ofahaeXz0/yL95iGAjF+UsCkCNojgtXeHqz1tgBRTLohHL0y3CW753P2T79psMbsnWoSr6yB0cCMuszyz3uyHk6htw+HjsQZrXFEYVR3+b9uayVTHhGJAvRqeFGjAw4k8cMkgqpvInmqEgtCm//2KCtCasO4+e/tgZVkHo7/xjtZZCehcS8gVYvwmWUlg9Qjehx098OS9IxpZyPmljuZXGn/Mv7zZH5RHcbyY9cIhTx4lZeiYqyco5mQOe+Qc/4P6Umeg0MnCNcZWM0uaE7urM0k4hBIixDNZ8Tc3OxAj55vW59Q7FrCLrJzK0ejQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199021)(6512007)(53546011)(26005)(186003)(6506007)(44832011)(2616005)(66574015)(36756003)(83380400001)(2906002)(6486002)(6666004)(110136005)(316002)(41300700001)(54906003)(31686004)(38100700002)(31696002)(478600001)(66476007)(66946007)(66556008)(6636002)(4326008)(86362001)(8936002)(8676002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WExTVFZGaUx3SFpGNDJQckRHaUJoTUszTy9DMWY5ZXZoL053QVlIY0d1b1RE?=
 =?utf-8?B?eWNhakdYN2M4clZGOGk1MjJKcjhObXVTWUJSelBIdlpEdnRZOG5HN0VuTGdy?=
 =?utf-8?B?dTJQREJ2eGZtalpWajBFVE1JTGRyQXdVcmMzR0hPWVBBUDdHTkJUL3dDeDNl?=
 =?utf-8?B?SzZBdmhSZmpiditLQlVOME5jdmJSUkNCMkVIM2MxVkZRTzF3T1lOSHJrcUFP?=
 =?utf-8?B?cVpqR0RENmdXd2YwUitGcnpva0o0RHF1a2Q4OFRaZEcremdvTkU0bjVrMGhF?=
 =?utf-8?B?YTI0UXBwZkp4MkJUdGc1Mk85KzNZeVpJR1c4bTBxQWtHK0lUZ21LRjVnenRF?=
 =?utf-8?B?clVINlVXUnI1Y1kzMTA1TWI5c056Q1Z4ajZGcm5lNmEvZ2h4Ym9nZ0dsdWZD?=
 =?utf-8?B?MEVNZC9HVHFrVlpzWlIyRVcxMWRiZEd1enNOdnIxUDRWQ2JXMmJhYnZkM2sz?=
 =?utf-8?B?SDI1U1N1Rmhvd1VyS2ZvSTBmS2wxb3ZUWDQ4elVySlBuQUtVVkloVnUzVzhw?=
 =?utf-8?B?a0ZOM082Um83bTlkcjJnQmxpeHVHK3ZONldZeksvY0x0dVcwMS9rWFhCNjhj?=
 =?utf-8?B?Yjl3U0c5NDlzUzltK1drM0FiVFhET3JHTlp5MGozanVZY0pZQmltaVhjK2d2?=
 =?utf-8?B?Nkc1RkVrbmptMmRqakMrVW0yVVJ5eDQwRURXM2dia0s4U3NYb2RuT01ndTlp?=
 =?utf-8?B?SnMwcEVId3liVWVYMUdSbWNYWjlBN3JiQ3pRbzN4VTJSaWJDZHhzN0R6TTM5?=
 =?utf-8?B?ZEF2akJRWFBvQXd2NFZ2V3AzcjVMSW9ZbWZBQ3Vla1dkeXZNdnZOSTlmMG1S?=
 =?utf-8?B?eVM5dlJuVmVVVDV0R3VTTmFoYm9ndk9GaGc3Q0NiVzNYZEptY0hoMk1hV1Mz?=
 =?utf-8?B?OFUwZGkyY2g2UTY3blo2bmxWYm1JeFVyUnBvRlBuTVRLRGRuYjcvQSs1SXB1?=
 =?utf-8?B?VW53dWFrZVI4Nkllb1RlWDhZSmorZThIVTlqeVZ1NXN3R296WEVWckoydkVM?=
 =?utf-8?B?UTBJc0xUckNGVDNUdFczYXdBMWJtUUdtbm5xN0taR2VOUG9BWFJZS2NWd1Iv?=
 =?utf-8?B?d0RJY3Jsa211NTZxUTZsRXlvM0NTRk5HZGZBcjZKbEQ3TTVWTW1wcWFCYVp0?=
 =?utf-8?B?ZW42VFhuYldOMGh3dGFGSEdpOHE0dHhaTVlianpWMVhQeXNoWkJFWXFCWUVN?=
 =?utf-8?B?NHJiTDZhYUthRXFWeDlpQVhFZ0R4RHJFWDMzeDhGbVcrcWxud3hBVUJjQmJ1?=
 =?utf-8?B?ZW5WK3QxNFBQMEt2T24xUzVWdGg2bDI5TG8vS1ZWL1EzRlhnU2dLNDI1RnJP?=
 =?utf-8?B?bkRXbmFGaHdWVTRtTFZuNjg1K2pVZEpwMzVQYUUxQkpiM1ZzU2xWZ2JLaFgz?=
 =?utf-8?B?clFlRkJlODhFSnBiRndVeHRkbFBSdUJsaG1vRHdBQzY5ZWNPZDF2Ti95MlRn?=
 =?utf-8?B?Ulh0eFEzaGFUd0s2TTRLZWRFKy9zWTBVWVFYZjRBblZXdi9kUEJWWjRqY1ph?=
 =?utf-8?B?cm5vblcrN3NXUEphUEkrVThjODJDZDZiYnBaZEUxdUd4alptNFZzbnl4aytU?=
 =?utf-8?B?anIzbVM0em13a1I0dlA5Mk9DR3BaamJVUzRZa3ltcWN0Y0c5VWpWSUJxNlF5?=
 =?utf-8?B?bmV2QzdyeHZHV29BUUJiWXhUMllWbXovVnRmWWxISmwxVVo5cnlmZkg5aGEv?=
 =?utf-8?B?RS9ta1hEdlk1Y0VmMlo5RUQ2aWROTXY4MHNKZERSNFhXSm51UmhSMm54Z0d4?=
 =?utf-8?B?NkRzZjZteWxJeVMzcGRSY0dBVkpneWdxQzJCYzVkb0Zxa1c0L1BWaEdjLzZ6?=
 =?utf-8?B?c21SeXlKMElRNXlOTUJRZWFkam5zZGc3a29aNkQyZ1c3RWpMelg2VVlKczYx?=
 =?utf-8?B?NDZFMGJkMitITkdodDVZa2dqL3haUW95d2dkV1FJSERWSU5DWnhQLzQ5dFBN?=
 =?utf-8?B?dmJWZzdmSW5VNUxrbk4rWkdQZzhJYW5uWEYxMWJXR0p3M1pRbFZkQTAxcDN2?=
 =?utf-8?B?UW1RYzdCaEdWaXlkZGJMaktlN3dZc25YRmVzSG50NUFid3RhYjJjeVk5ZFBx?=
 =?utf-8?B?d1ZkRU01UWZJcHdYVUkxcjFXRTI4dVFRby9HQjJpaUFxYXZtSTNLUEMxZWVV?=
 =?utf-8?Q?S6XAInkvQ8hr15kqsE2MWI/ZH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda4a860-576c-4f65-5cc2-08db5d3cdd37
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 16:26:59.6924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FrOXw5jEV0w87GLxA2xwBWOxgYaJ9NeEH3yctqSFroxHIu6AC9Ue+NhMJNR4w+f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430

On 2023-05-25 11:22, Nathan Chancellor wrote:
> On Fri, May 19, 2023 at 06:14:38PM +0530, Srinivasan Shanmugam wrote:
>> Silencing the compiler from below compilation error:
>>
>> drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c:704:23: error: variable 'mmhub_v1_8_mmea_err_status_reg' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
>> static const uint32_t mmhub_v1_8_mmea_err_status_reg[] = {
>>                       ^
>> 1 error generated.
>>
>> Mark the variable as __maybe_unused to make it clear to clang that this
>> is expected, so there is no more warning.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Lijo Lazar <lijo.lazar@amd.com>
>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> 
> Traditionally, this attribute would go between the [] and =, but that is
> a nit. Can someone please pick this up to unblock our builds on -next?
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I'll pick this up, fix it, and submit to amd-staging-drm-next.

Which -next are you referring to, Nathan?

Regards,
Luben


> 
>> ---
>>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
>> index 3648994724c2..cba087e529c0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
>> @@ -701,6 +701,7 @@ static void mmhub_v1_8_reset_ras_error_count(struct amdgpu_device *adev)
>>  		mmhub_v1_8_inst_reset_ras_error_count(adev, i);
>>  }
>>  
>> +__maybe_unused
>>  static const uint32_t mmhub_v1_8_mmea_err_status_reg[] = {
>>  	regMMEA0_ERR_STATUS,
>>  	regMMEA1_ERR_STATUS,
>> -- 
>> 2.25.1
>>

