Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6A38003F;
	Thu,  8 Aug 2024 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723133332; cv=fail; b=WHFz9Bjdk+4wrLJFpKbCJ8EyyKHBGnaSfZfoWkFIcSuV4tpqqaeVgjb6zy5A8URiBsbTQS80AMzfeMo6mDjAIFEpS8LFMUsv/zWfC1Akf36W3fi53LIKMxxK5PVDIoHupOAkGao3URkyy+kOcJMDTFZfgehqWjuj2yIJ2Hs5a5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723133332; c=relaxed/simple;
	bh=FGL7Y1jfL1tpXWv5I4qypMs6jTotFZCnWPMivs22NpI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o78SgYVAsBb8YuOVIbmHwQ27SLjt1vCwNZZlMKS8Pl52xFW9ci0kttcKHaZwN3BtqYFQ3oyGGvFJmv5v5N6SCvJrgFUWkmuBAqbo9fMfnP3eRzy/owtjafQK6gn05Is5OcC8llWoCKTUwBb03P5X6HHiwQIwUplcYhEkPaZB/Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FkAmLWsB; arc=fail smtp.client-ip=40.107.223.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FkAmLWsB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pi6KuVqUprhIJcrPzaIH8DBlqSVvAv9dxKFnAiLhPKk2yc5sdYwWFACvey3ZrKAA9EDQBlOPePvV15BeQYIyaS6OMe1mDiAykQWnUbEjfLuh2j4jNU/3vyWAXZ1Scwo1MVyyeyGeAcaqIsdDrd5a2DnbJrn0UGc/bCr04/DicgRPjKarXLOBEqlVj6SL9DDmMamoxKMSm+bZQCLAdGU3Hnvgz+X3VPatSEkjcpow2EZtUYtKYApca2lKUbull7ENiVhfre3v0nhbsat7SrHY/EeAmrYoOKSWZxkIR52v5gDdxVC0ZSL5wACsDyORpZIG7rPWPYZJur+dYZsnYyqQQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY2hOq/c4V59anZEi28eZMXdGCWIgS9ZvM9UX+2G2AA=;
 b=QUprRX+geN+p9Cxwt425lmdC8JtDnEswXZ+IgCqR+QCXIPofMuipqWxRvIr7cWgTcjXZcY4O707zJv81BpPbPCA8UbCwrXXeZGYppVwihch/Toc3RMWEllc1aejIgRTNK5ieaaGnVL/geswrOv1x9GNiu/mMvt6mwesWucjNRqyZk8sd61I2ER82B8gMjMeE8NYXcrdNcORvESRKY5v1MWBpYuvfpX97K7iTUjO39HV53JL1fN5uY96xQU2AJTocS/S9r1+WtwD77n5TKu/aDxGaNnv5ArE1S4Os9DtF5E3XjbYY9qFA4us88/i2Qs2BGShRzM/RoeHy9GZzrsulQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY2hOq/c4V59anZEi28eZMXdGCWIgS9ZvM9UX+2G2AA=;
 b=FkAmLWsBjQC7PnzVDaBstbxTJtQaYsNWZPdNslUJX6Df/027dtd2gmj6XsjRmySsyBRRaMUiUqU1t5KYyNjkAXcdmVVGmWJLKm8y4CZ+/J9kuhvOhj1lq96ZYElotyTeMG8LhUKilPShicllsBK5jfzH8Kj41XTYERqxyLl6hZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 8 Aug
 2024 16:08:45 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.7849.014; Thu, 8 Aug 2024
 16:08:45 +0000
Message-ID: <133aa723-b26f-4d69-b1e3-e7fb1ba76f52@amd.com>
Date: Thu, 8 Aug 2024 21:38:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [broonie-ci:fileZMvsMi 36/37] sound/soc/sof/amd/acp.c:277:12:
 error: no member named 'rev' in 'struct sof_amd_acp_desc'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <202408082001.IkvZrxTk-lkp@intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <202408082001.IkvZrxTk-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::9) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|PH8PR12MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: adf9974f-c84f-4eee-bc94-08dcb7c460fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVhkV09nTk1CQVZySFNzN2F6Uk03aEhrVlRCRyt0eWhZSjQrM0tKanp5Zm8w?=
 =?utf-8?B?RXZkclFNNCtjU3llcnlWS2N6dmQrM3NsUzhrNS9XakZydG1BV0J4NHl5d1B0?=
 =?utf-8?B?bVpQazBYQ2taTHlzcEdxYSswZC9iamdWazBEaFd4WTdzSllsYzI1bndQRysv?=
 =?utf-8?B?cEs2dDBMaU9DOGxCNjlrU3NXaWVtNjNBczdvK3VOdm43Y3E0a0l2Q1FKeUkx?=
 =?utf-8?B?cjFiVHhVLzdLWWZwT2dhalNSd21vMjJNUEk3S0xqTi83VlVLVDUvZnp3bjVa?=
 =?utf-8?B?SzlKS3JydGpTWkViRTBlNmMwNnRwK0duRGcwaTBlY21WV01xNStVMVNBamNn?=
 =?utf-8?B?ZWUxa0dKck8wYjVWTEZ3RVhSdFZmWDJwZ2dmMjRBRkc3NmxzeEovckh5b1RJ?=
 =?utf-8?B?ZDZCZ3dyTHpqSGZDYUNzSkpqR2kyak9WQWRCOXhtYUMrcy9ycUNTVTdPckhR?=
 =?utf-8?B?Z0hQMk1Ka3VueUozQmFWT2F5eC9lRGFWbkkydzE3eHN4SzJ6SmMvcGpwZVZw?=
 =?utf-8?B?MkVCWFF2bHBOQVlrMzQzSjNVVk1mcE8yYTRBNVJYd1FtOEdvVHl0dTlBMDBD?=
 =?utf-8?B?L0sxODl1MERkRHlDQVZncnc3c3VaaDg0dDBxWDB2c2Y2T2RPSzU3Y3BkS2pG?=
 =?utf-8?B?dnpVNWlCQWdHbzd3YnN5S1JwR2ZXQkE4WnRoaThGVTA1UHgxeXJLS0tlSWdO?=
 =?utf-8?B?UXFySGNMTjhEbWNNK000N09JVU1OTWVqTFgyNUtob3doMEYyTEh1U0NONCtC?=
 =?utf-8?B?Vm9UNkRiVk81eVpqVTJQMTJsV2QwK0p3TDZzOXV0d1BRRnB2V0dvVE9Sbnc2?=
 =?utf-8?B?NTdZdFJxVStOWjBhL3RaK2lHUTJ5K3JUUFJ5eS9OaGVXWVVPTmRiZnFDL0hH?=
 =?utf-8?B?OWRrMFlmOHhWdFQ3dzhIeEpwb29DR0ltZHJOKy9WNHJnMjJUdjFaNGFBNUdr?=
 =?utf-8?B?Y1pyNEFob01YT0l2eXVseGxVZnRyRWhnaW1zMnRMZVc3S1N5YW9pa3RtNGV5?=
 =?utf-8?B?eWZmc3Q2T21kVEM0aUxISERhQ0wzMXJXbmlNaUlnYkQ1ZlROTDVMSHYrdHBH?=
 =?utf-8?B?anFUeFRxL285UHVNTExJTGhONjc0RVJyVmk5RUZ0ckRvS0FCK1UrMlc2SmdE?=
 =?utf-8?B?MVN3RlZzdE1TK2hsWkFVU0h4V2szZVhMQmYyWVpqaVJveGEzV2x5Nlh1OWRX?=
 =?utf-8?B?S29nbXhFdHZHS1hEQk5tL2NMNmlNMWlISmpqRFpGSjN6T05Odnl4bDg3eEN5?=
 =?utf-8?B?Z09iTTZWeENCdDEyalBoVFc1SGdrQVFlL3dDUDJQbWJmZ1MvUU40WEE1MlJL?=
 =?utf-8?B?Mlo0T0ZxMFUrOXRSY2o4S0dOSG1qV1B6S2ZJV0RmemlRUy9rV2s1WlQ1S3V3?=
 =?utf-8?B?ZjNUU1BvUERwRlNHR25lYlk1dmN0VTVPekNsTEQ1MU1GYTBpQzZWNEM5K0pP?=
 =?utf-8?B?UUozS0ZyQTJOZVUyZEp1Rm1CWExFaUpEaThIbVh0VldMbm41QXRHRWgzZXpM?=
 =?utf-8?B?SWFQREtCd3pKRnoyWkNTUTBJMGpybW0walYrbDUwMndHMjBJMVpsVDY1SFpZ?=
 =?utf-8?B?Rm1GTjkzVWpIQWVaV01vM0dRbVNkQURFVkUvVVA1ZGhnVUhCYkgzempYMi80?=
 =?utf-8?B?RUxFRk96UHh2M0lxTFJXSExZVEFDLzlWajVLZmhjZ24wQXIzMEJaRHZYeVhi?=
 =?utf-8?B?eXduWHNvcWFTcGtFYktxV25mZnI0K3BXOThoYzlnNklDYjF1SFdFUHpIdjJR?=
 =?utf-8?Q?ShkJb2Wk3wnbO1eHZ10hp2CAm45Bo/zAUIYv+vo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1ZpdklJeThmSElteXdYbktaOEdldlFwMUswRk41QXpnK0wyY2J2ZXFGWmZ5?=
 =?utf-8?B?TmdpaUczamJocEdkMElkU3JCSmNYclR3T0VDUmFwek94YTFCRkRBaHVUTVVy?=
 =?utf-8?B?WU80QU9kSGJXU1NQNmQ0WkJFKy9NZ0xkOUdtQ0N5MjdyMzVuK1M1VGsvWmF2?=
 =?utf-8?B?NXJ4R3h4WEgwbndaekRZYlEzUmpWZUY3VkU5ZjlBenI1REZmYk1TckZ0VWYr?=
 =?utf-8?B?UDg3OXZveXg1K2o0Vzl1YmQ3RGR2aUIrb1RXcGxNcDh4eFluNS9DTVdGTzdQ?=
 =?utf-8?B?N1NZR3RiWUFBdWErWitvSjZpZnVxMXZONzhsRmFtTFBUWmNzbnJ0LzdPKzdw?=
 =?utf-8?B?ZFowdnFtYkFRbDEzL1RtTlQ3K20wN2dZZTNlMWNQZjdsL0kydnVXL3d6cmow?=
 =?utf-8?B?eTVyYlVoT2dKM0tQNkwxRWFBRVp6TjlNYy93YzlmMllKYU1mbVdqZlZtTXRn?=
 =?utf-8?B?aGFsOGM5Y09VakgvZHhZbGZ1dDZUOW1SN3dLTHloQ2todno1OW5UbW5hVi9u?=
 =?utf-8?B?V21IbUJtOXNONlYvd2UrdFpMTVpXRkpzc1dJMnJVWktNRTZjcThNQXNGSTRq?=
 =?utf-8?B?Q0k4c0VFTkh6M2VoeTUvWC9jNHVPdFFPWExuVldDODUweWtrUU9NSnluVDlY?=
 =?utf-8?B?VlM4SXBGcFQ1MEkyUjNsemFheUNvcndJcHpCaTFPOHQ1dHcxQW00Y0RLV29T?=
 =?utf-8?B?dWpiNjdSYnkvZFFQTUdkaTQ4emRER2lwY3dUS0VWRnlVVVJXZEk2WFJQellx?=
 =?utf-8?B?M0ViTmIzL2twK1Izdm9TSGw0ODlJZ2ZPcVBlb2l5MklrRWUyKys3MEdHSmw1?=
 =?utf-8?B?ZXdqMnQ3K0JGeVhVeXFPUUNuK2pKR2RvMld3bVV5TCtrS0J2ZVZVc3ljOUhK?=
 =?utf-8?B?SFI5T2hsdC9UeWs3dHRuYW96MEJBRFdzRWdFbTF6aEFNc1E1OHhFczRaRXF3?=
 =?utf-8?B?dXF2NWVML0FuYllmNVBiaFhUUCtrUmg2ajFCdWRhOGRmbExkcTRhUUZZUERD?=
 =?utf-8?B?UWh5bUt0TzZROFNIbzN3ZUNRd0p2c3Q5WkhpUDR5NERaNGZrNndoQ3dtb2lq?=
 =?utf-8?B?aHVBNFN5WkZIcCtMbkgzdmRGbDk4QmlRMzNZYWZhcDMzbTNZd3hnNUR6VDhH?=
 =?utf-8?B?Q0hXU0xRWldPc2xmaFE4U0hyaFhxUnJYa1pTZzgyUnMwM1duTGt1QlZYc2xo?=
 =?utf-8?B?R1pMZ2p0REw3emZTdkx3R3hZQ1BMem5ZUHNsMWc5VnBJNUtMWTdaRkFKRUow?=
 =?utf-8?B?SXJ0aDE0SHMweXMrWFRsblpOL0Y2ejhIMWdZd0VWZTlFMm9uQ0xqOUpXYUFG?=
 =?utf-8?B?R3pTUlVGQ05qYXpRbzlOc3NQc00zYTFob2F2cGlBZEV2SWxoai9rSENOOFdq?=
 =?utf-8?B?dFZuNlpPYjlVZjFqUnpha1Jhd3BGME12ZFJTRDI2NUhWc2JIVCtzU3JtNG9N?=
 =?utf-8?B?NlJDVFNUaHdhdmlTUHRqOGhTMVJ0S3NmSDk0cDJ3MG1zN25sV05UNmIrZklL?=
 =?utf-8?B?a0JnS01xc2NFajdHZDBTeWdnSE0xQnZyTzJiSVdvdEE3ckR0cmpQRlBraloz?=
 =?utf-8?B?M1V3WXQwQk02dzJKeFNWM0FYQ0JLNDZjRm90a01LWEQvMWd2RWx3cEx0N04v?=
 =?utf-8?B?SVgzbDNXZzZkYTIvRzNyd3JCdUlKTExHa0JGYmQyNGNrdm9UaWZRM1VTSVQz?=
 =?utf-8?B?NS9JWHduNlhxdGh6MUlaMjN1cEZQTEJVdUY1eUJCNkZneXZEL3U0SFhOaDZs?=
 =?utf-8?B?aFpVZlJLQ2wvYU80b0YyeEk2Mk9VVXRsc3pRRTgwdTlFeXVpajRkZ0dDTWtX?=
 =?utf-8?B?WmtkYk9wejZ2bFBYbXozMjJKOXVsbHlYK1JqalF0dUlQdTQ5Ti9xRFpoNlVx?=
 =?utf-8?B?SFRVNmpsNnZGNGpQcytBdlJMNms4SEIxdnhGNkhyL2ZBWTlqOVo3L3ZoTXMz?=
 =?utf-8?B?RGNsd25uWmwrQVlQQXBsUUZRMmFlNjhTb1dTQlFRYWNqU1oxRTJPYkZVaFF4?=
 =?utf-8?B?Znc4SmpnM2thSUVSUWJJc2NCb1A2RUZBMkthZ0gxWXdZZm96UllnVjJjSC8r?=
 =?utf-8?B?aU9uS3ZjUm5xS0wrUkpuNXk2bUg1VjNDQTRHWlpHUkhkb1JEeUtEQkt0b3ow?=
 =?utf-8?Q?yUu+uPDVoe9rXj7MHjU+uDQHy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf9974f-c84f-4eee-bc94-08dcb7c460fd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 16:08:45.0052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZfPl8fOj8LiZLVNNzeSOH5ZGs2/qx9h0zV643+6Htc/FY6iNxMl6IUHmgkkjqAFrgcxRr1QOcKNxDfLQ1DMakA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447

On 08/08/24 18:26, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileZMvsMi
> head:   43e41a7c8601d155489d208c40809f96727ea7fe
> commit: 1b18e9f7176f8bec6673befed88068f03fa6d254 [36/37] ASoC: SOF: amd: remove unused variable from sof_amd_acp_desc structure
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240808/202408082001.IkvZrxTk-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408082001.IkvZrxTk-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408082001.IkvZrxTk-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> sound/soc/sof/amd/acp.c:277:12: error: no member named 'rev' in 'struct sof_amd_acp_desc'
Complete patch series is not applied, resulted in build failures.
Will resend patch series.
>      277 |         if (desc->rev == 3) {
>          |             ~~~~  ^
>    sound/soc/sof/amd/acp.c:284:12: error: no member named 'rev' in 'struct sof_amd_acp_desc'
>      284 |         if (desc->rev == 5 && !(adata->quirks && adata->quirks->skip_iram_dram_size_mod)) {
>          |             ~~~~  ^
>    2 errors generated.
>
>
> vim +277 sound/soc/sof/amd/acp.c
>
> f063eba3e7a6ae Ajit Kumar Pandey      2021-11-17  232  
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  233  int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  234  			      unsigned int start_addr, unsigned int dest_addr,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  235  			      unsigned int image_length)
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  236  {
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  237  	struct snd_sof_dev *sdev = adata->dev;
> b1db244c716fe3 Mastan Katragadda      2023-06-30  238  	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  239  	unsigned int tx_count, fw_qualifier, val;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  240  	int ret;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  241  
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  242  	if (!image_addr) {
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  243  		dev_err(sdev->dev, "SHA DMA image address is NULL\n");
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  244  		return -EINVAL;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  245  	}
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  246  
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  247  	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  248  	if (val & ACP_SHA_RUN) {
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  249  		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD, ACP_SHA_RESET);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  250  		ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD_STS,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  251  						    val, val & ACP_SHA_RESET,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  252  						    ACP_REG_POLL_INTERVAL,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  253  						    ACP_REG_POLL_TIMEOUT_US);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  254  		if (ret < 0) {
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  255  			dev_err(sdev->dev, "SHA DMA Failed to Reset\n");
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  256  			return ret;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  257  		}
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  258  	}
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  259  
> 33c3d813330718 Cristian Ciocaltea     2024-02-20  260  	if (adata->quirks && adata->quirks->signed_fw_image)
> 6a69b724b2f82b Venkata Prasad Potturu 2023-08-09  261  		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_INCLUDE_HDR, ACP_SHA_HEADER);
> 6a69b724b2f82b Venkata Prasad Potturu 2023-08-09  262  
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  263  	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_STRT_ADDR, start_addr);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  264  	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_DESTINATION_ADDR, dest_addr);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  265  	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_MSG_LENGTH, image_length);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  266  	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD, ACP_SHA_RUN);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  267  
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  268  	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_TRANSFER_BYTE_CNT,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  269  					    tx_count, tx_count == image_length,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  270  					    ACP_REG_POLL_INTERVAL, ACP_DMA_COMPLETE_TIMEOUT_US);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  271  	if (ret < 0) {
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  272  		dev_err(sdev->dev, "SHA DMA Failed to Transfer Length %x\n", tx_count);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  273  		return ret;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  274  	}
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  275  
> b1db244c716fe3 Mastan Katragadda      2023-06-30  276  	/* psp_send_cmd only required for renoir platform (rev - 3) */
> b1db244c716fe3 Mastan Katragadda      2023-06-30 @277  	if (desc->rev == 3) {
> bbdcd3d590cad7 Ajit Kumar Pandey      2022-04-21  278  		ret = psp_send_cmd(adata, MBOX_ACP_SHA_DMA_COMMAND);
> f063eba3e7a6ae Ajit Kumar Pandey      2021-11-17  279  		if (ret)
> f063eba3e7a6ae Ajit Kumar Pandey      2021-11-17  280  			return ret;
> b1db244c716fe3 Mastan Katragadda      2023-06-30  281  	}
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  282  
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  283  	/* psp_send_cmd only required for vangogh platform (rev - 5) */
> 094d11768f740f Cristian Ciocaltea     2024-02-20  284  	if (desc->rev == 5 && !(adata->quirks && adata->quirks->skip_iram_dram_size_mod)) {
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  285  		/* Modify IRAM and DRAM size */
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  286  		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | IRAM_DRAM_FENCE_2);
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  287  		if (ret)
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  288  			return ret;
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  289  		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | MBOX_ISREADY_FLAG);
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  290  		if (ret)
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  291  			return ret;
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  292  	}
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  293  
> 2a2f5f2384b979 Ajye Huang             2022-12-05  294  	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER,
> 2a2f5f2384b979 Ajye Huang             2022-12-05  295  					    fw_qualifier, fw_qualifier & DSP_FW_RUN_ENABLE,
> 2a2f5f2384b979 Ajye Huang             2022-12-05  296  					    ACP_REG_POLL_INTERVAL, ACP_DMA_COMPLETE_TIMEOUT_US);
> 2a2f5f2384b979 Ajye Huang             2022-12-05  297  	if (ret < 0) {
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  298  		dev_err(sdev->dev, "PSP validation failed\n");
> 2a2f5f2384b979 Ajye Huang             2022-12-05  299  		return ret;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  300  	}
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  301  
> 2dc643cd756398 Pierre-Louis Bossart   2021-12-21  302  	return 0;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  303  }
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  304  
>
> :::::: The code at line 277 was first introduced by commit
> :::::: b1db244c716fe300e36428aeb0874913d2e0a91d ASoC: SOF: amd: add revision check for sending sha dma completion command
>
> :::::: TO: Mastan Katragadda <Mastan.Katragadda@amd.com>
> :::::: CC: Mark Brown <broonie@kernel.org>
>

