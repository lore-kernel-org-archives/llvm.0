Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C8D1494C2;
	Tue,  2 Dec 2025 01:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764639193; cv=fail; b=om3LcELFqXBgDkqvHYgiF29uXTlm6rwB6KEiL13dT5/C1+Yza3grK1pQg8ja4KasBCaw41DaA2MX2nruJoKhxPg2YUFe8NfZBx8IQr5gepf9rIm7BCd/4KV6bIYC4gZ9AN6jqf/t1U/TZVe5QAcpw7/fhvOi33urs2LFoNaxyd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764639193; c=relaxed/simple;
	bh=xl1VihzihxM5IhpzKYlt9Np7RZZ8StbhUx1BXK1+Eto=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QZ5KtDVqLWm4wQRGvn7Nb9yYIjHwnDVYT6D0q6xm4O8Pkt6RcxCVdjKHMaSUBEjVpWPXjJR5T+NS90HhR/5y/1daMuyOqACyRT3Uvwv3EO3/dfT8q1G8RhrSifsnFO293HC0FRCLqHlfuJ7Y+hiobYNcGxh7wcFXnPqyqwR+k4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LC0M9UKF; arc=fail smtp.client-ip=52.101.46.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LC0M9UKF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNSEkVqFidshQC/euNMFDmOSAIV9cnghjuDIjiSH/N6QkLEvuV2zBsCfqFOhUvUxVwpF+gmtumr0ZweVoWSr6LDu8RWCJ+UTtTI3CgSnltT9TTkuHMsub6u72XuR1M+dtCs9hICfUQXKfNEx///RKawzNA899SUssjeA4ZAueTjtSsjSZ6jsqy4QBL46PYY7z+nT59yQS5DBAzf4NZ4UTVeabcTqhZyGix7/IcJnZIGtvQxbmeJ5KTwGKIzRP/Y8EhyGPYS5cjQdbnTb7sxhhAZPJHd5cQfIetIYQDqbZsrk0+lwbDGCrrOW/hNyzbm0rqJl2BR7MaMg/EhxUjXF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sh7VAjsQO9aoCAhhanSmjhyGuW360qiYOEFJHSzLBig=;
 b=a/p2g4RO8raaFJX9B/Ijee0wZUO+PoZYlhFduha9KXHrhbmPKRG6JWOun1IlyUMIW7YBo91HaI2PUaa9nLMUwRF2L3VfDeH6h7uN1YLF81J4oJvj2iGNL2hdWAp3UtO6wIokZO65oQ9LP0whVmV4EmsN/6a8M3ABdS6Uv866Fu9zBTwhR4c4m6szlGoUiuSkINuEvUzIRdpkAdzkE3pn9UE0ODAqERRNGZzncDPFdW+QQmqL55+P6SiaK1DnJp0BX00dU4jmKw+UohFslYh8yepoVvYjoo+0x4VRXkkZ7SyyKMeYxvoCaknHVQWk0QIlojgyNZ0r9fF8epAeWBUZIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sh7VAjsQO9aoCAhhanSmjhyGuW360qiYOEFJHSzLBig=;
 b=LC0M9UKFOdQ9+CzITLlmDk9A0Rw9GF25Ya84E0fjH/rudYc5CwBbIgDUtIOyrsvJ8XhnZ0KU0+8kkNDFnbm9ped7Jyp3VSugNCSYdvm/vZ0iyMri/PS+T+ReonzJtFaj0kYvoO44JeU/6gpINnKd16b7C3qDJ7yJEk2QIE+90ZtBu6HMp1toy1dhUIsM4mWdDBfMOWPp7QowI4Cj/tgseTR3IhInMOst3kcaYWAQDPI/7FGssDaYJvRBifZJ29KVpG0LzfyErVqbGPK6FjOe6cjVDiMCf3se9ZzTTluCARGzKDVPZvpbK+OdHImTBpJfBtVmFMf28Pu3T3JlzL4cjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 01:33:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 01:33:07 +0000
Message-ID: <594de273-6e64-4928-8407-1afcccf42479@nvidia.com>
Date: Mon, 1 Dec 2025 17:33:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: error[E0609]: no field `class` on type `bindings::pci_dev`
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
References: <202512020539.vRk7h3HD-lkp@intel.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <202512020539.vRk7h3HD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d8718e-8bc0-49d3-289a-08de3142beac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFhlRUpFU2JHWE5MU2daYkcweGwwK0o2NGZJRTRaS3RmMEdRaDV6MDVZT0pV?=
 =?utf-8?B?am5saE5Bd284MU1LbTl2WjNFbk9wUDV1VjYrTkRIWGljZjNSVFdsTzMzV2RW?=
 =?utf-8?B?MlMwU3VKeFRPOWRRbUMzZ3RKb21uZHczNWwxV1pPSWVCTEpPSUQ1elFMS3Rv?=
 =?utf-8?B?WjV6ekRQSzQvWTVCbG1TL3pLd3RTS0JJcEJxTlBWVnJrVXNIMmxXc1dIMmFu?=
 =?utf-8?B?VnZYY1hYVjFVVjY2akl2bTZUdXNDZFdKYmFydkgvQmtPN1I4ZUxsSUlDTHU5?=
 =?utf-8?B?NTJidGtVUEtubWp2NHJUWmNpRVBJYTFadExQbG9JNTlkUWwwODhyb0hDNmNx?=
 =?utf-8?B?dnl3a0lzYVZSaEFFcGxITnorOXdqWHFrQXBJeDdvMi9lTVpCekZJeTFqeHFs?=
 =?utf-8?B?RFcwckt2aXJLRXJBZ0RKZU11U0ZxQk1NYVhNUGhINXV5aG9LbHV5VXRPTDdn?=
 =?utf-8?B?US9IZlN5WTErNnpCdi9vallVeDZ2aTU4ZXgwdEt1NG12dkxSSXY5MitXRkRK?=
 =?utf-8?B?cjREdjQwT2FIMkFIMXdaUFlGaGdKN2ZqUk8wMzRpOThXRTAxeEQraDQ2TDFC?=
 =?utf-8?B?UnVLZzRuVXpFU2MzOWhCM0FURXMwY3QvZ01UZDB3NGloUUV3TzdrYmRZdXZ5?=
 =?utf-8?B?VHJRTWRFT1FZWFNIcFRkQnViQlZVVEhtNDQwQm1zakEzQlY4VEFoL09acmVV?=
 =?utf-8?B?Q3pkK0FRb1p2Ykp1aUs4WWdsWGdQZlpkTm9ac1hoTkppbVZNaEtCL3d2bExB?=
 =?utf-8?B?NmNFNE1qcXF3Rlg5NVgvUFE1RzAzOTNpK2xteUcwMnJReHkyamdUM3F2YnF5?=
 =?utf-8?B?ZTdXUmhuTzhYVGMyREUxN0NzZk1YZklhVFpPOS9QcHkzYnp0bDl6cEs4NUNi?=
 =?utf-8?B?Z2t5akg4clc2M1NnS0huNEtlVTJtUU9oalhSQm5uR2dOUWt3cXRhbjNFZ3BJ?=
 =?utf-8?B?K0pwOTRmdCtSYmo5WnhndWcrck5mOVVwUnlEK2kyS3dyaURvWmhRMlJwRkFE?=
 =?utf-8?B?eVpwbFd0RmFtVmYyUERvTVpDeUZicHo0a3RUYXNubmpKaytKRndZaHBNdG4x?=
 =?utf-8?B?UnZWL3U5WGNMMUxXeC84WmdSUHpuRHpPZ1YwUnc3cGJqZ3oxTElzbHo1UVFw?=
 =?utf-8?B?ZzB1Rm15cjNYTFp5WU9URjlLZGFOdXRESDJpQkNScHJhL1ZKdnIybVZ1YTE4?=
 =?utf-8?B?cVhpMmQzdzNTK0h2azByVHUzblJXUFduZkxtZStVblQwb2tUTDBxL2UxTkxP?=
 =?utf-8?B?K0xQMTk4Nk05UWg1Tk5ZaU93cUdBVHlTc0RkVE5aT3g3ZVYxY21DcHBMcGkv?=
 =?utf-8?B?WDZCYytrMFlFdDFOQjNnZW5QaDV0dHhFcFJiYjZ3V1dxYzBMbmw2YnhLVFdj?=
 =?utf-8?B?YmRxcm84RUs5WGZHTUxsZ3p4cTBOenV1VzZtd2RWcUEvZjJhWjF5V3VpNXFT?=
 =?utf-8?B?OWZGSTFETFAvS2ZSaVJyK25TMGJuMnZDUVJGdmdqVVpuRWZxZlBxeDZrally?=
 =?utf-8?B?ZkI0TjdCSDlVenF1NFpxSmo2SHg2bC9WeGZVYzJUK1BhWjFFYWN4Q2dET3p5?=
 =?utf-8?B?THlVSlVvMnFzOHFBbVRZUURiSWFOYWlQUUxUdjk1SWFOSEZ6QTZSeklQVXhJ?=
 =?utf-8?B?S1pJVjhFNGUxUWJ2K2h2V3dPOFJVS2tnWjNZMHJGa0lPYURkK3JTbHJrSmV5?=
 =?utf-8?B?TTdsdkxCb1pGSUFvSHhTMkZUMHFXM0dXTVZGVStHenhmdXk4MmtvRlNPNHQ4?=
 =?utf-8?B?MG1peE5aRXRxM3FaT3ZHNXVpTkVmWkJpODY3bDkzTk9BSXVEbmlxMW9rY1pV?=
 =?utf-8?B?dXJ5cXcvUjRhRm9BNEk5NWFPRldvSWxSczB2bmFUUm5QamY3MnVTNkptN1Zi?=
 =?utf-8?B?cnFjNzVlS3VkS1dtOURvUWFqVjQ0ZVo0ZFo1b3N3UWxsZ3R1dEJiZW5RZytW?=
 =?utf-8?B?UlpuV3lET0p3Z0p0NGFPa2JPQVhxN0wray9UNE1WMDdNRnpBRW1UNk54OWhG?=
 =?utf-8?B?dFpwUkdKSWxRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWQ3aURQc0VLTmsyTW5lQWJsYWwwZ3BEV3RKYkxTa3NSL2NTU0ZOUnF5d1Nv?=
 =?utf-8?B?eFZvcFlRa3ZDWTdSWWZiV0dRdTBOQk02eWQ3SEpEMFVDemdhdXdiYjFNMHEr?=
 =?utf-8?B?SHZaTVlQSmpBZWZLQkhkeVBLOFlocnI0QkV2UGUrZDQrWjJKOUxpdUg1VGpq?=
 =?utf-8?B?em1YNFBod1M2VmVmcml3emRWR0gxQzVEdXc2bjZtK1ExanRNU0FyanQ2N1VW?=
 =?utf-8?B?UWE3UzNuR2lZRS91RER6bGlJcnh4Z1hHcFZGL2VwNW9QMjNXMnltSG9oeHdX?=
 =?utf-8?B?b3RrQTdyUEtEWlRhWndIbEY2S0MzWFF5M2lKclI5UDl4dUtvSS96YnBNdk5y?=
 =?utf-8?B?UkpmczUwYjdUUWMyQ0wyMzVNa0FVUFJVbEJTWSt5djZua2hHSnExcDBNdjBI?=
 =?utf-8?B?NHZBZUZRWWRSTmh6d0dZdXVOL2R2U1VnczhtMkxJWko3YTFJMmJDUGZlSnRL?=
 =?utf-8?B?UEFkUEFXTDVpdEJpOWxibjBnNGVmSEJLeThsODc0aU9tUVpwZ1lSVzlCQjNZ?=
 =?utf-8?B?dzBYckpNdThTeld1bXNycTV0NjVNb0UwUkdOMVVrUTdxT1hINGZhTTVONHhP?=
 =?utf-8?B?SnI4Vzd1c0RMT1d4SVlhMmpkdlBiVGRYWmVFanFhQ2hRZHhKM0xzcTdYcC9F?=
 =?utf-8?B?RHN3UEZlVmZQakhMMmt3TDR3OFkrV1dxeStra0kwZVpvQWZEaC9rRDRXNy9I?=
 =?utf-8?B?dGp4UFVJOStnVytXN1hwajJxTktWUVRHKzI0alJ6UkRwQTZiWEJkUUFKTytC?=
 =?utf-8?B?WDFkWmx6QUxvNVpnTVVKdE50dXE0TGtmd1JMUVNIdjMvWVVCcE9lUUYwR3hm?=
 =?utf-8?B?MzMxaTVFSnJrYzE3UmFjT3J1VEVVL3R2cndNb3RPUldnTkxLRG1CQWVPNFNl?=
 =?utf-8?B?WExic0VWaHpoQUtDR21zSER0UStGUnROb04vNmQ2ekVRZGxvSTM3VWFsMUNO?=
 =?utf-8?B?bGpHTFNXcGlKVkVxZU83UzRQbFdsQmxGV0hLTG1wZDlBWUN3MmxMeUdtb096?=
 =?utf-8?B?TU81b3Fia25VMEdqeThDUTNIRFlMUmJxR0FsbVowdVVlUjNmOFZwVTdCM3NB?=
 =?utf-8?B?dkdhbU5iTys4QmZlZUY4aXVLRzNMbEhlK3kyMzd3a3M5SnNDaEhHMmlDU0o2?=
 =?utf-8?B?RjVncCsrdktyZ2FOUVhUbURDNDJQVVNyWm82UXk3c2h2bTVUQ1hTcklqSDIx?=
 =?utf-8?B?VHYwU093UllpUjVwV3N2YmJYZnVoSVpmS2VqZ2JxRXRoZ25pb044SnI0cXVI?=
 =?utf-8?B?U200bGVzVTJqSFUrU0d0Z1VzTUVHTEdwS0szYm1oWnVnbkg2U2drdkczbkIr?=
 =?utf-8?B?VWtIaThDOEFIeExsaTZRZk5QNktCZTNUQzgzbjBkdTcwU0czL0c1bm9tVDB5?=
 =?utf-8?B?UzV3Vlpxa2ZnQ3l0TnY3L2dwMGVGUjJqRCtIY1h3WFpGWEJjVmpjUUtrMDA2?=
 =?utf-8?B?SzVPS2JRZ2NlaURJb1ZrTVBQNFpacTFqWTZWQ3VYL2g4dEtvdy9lSHFnR0sx?=
 =?utf-8?B?M3k4ZmxEYWtHdGVEUHc2UWtPcDNubzFtcUxyemZWTzZoelBZL0lFa1liSnhN?=
 =?utf-8?B?aW52aWJKaXRva2JoRnd0b0l1cmU4WFRTckc5VkJGUHdxejhNMmZONDF0a1NK?=
 =?utf-8?B?bjdPZ0lSSm0xZ1JsU2NoZUhPajI2OXVSNndqeG05VksrbWdINW5lNUJEOSs4?=
 =?utf-8?B?ZW1hUVhYempUMzZlZ0V5bEl6S3hxdERkUjErS0pkTnFiY3JrWEU5ZkU1TXE4?=
 =?utf-8?B?VWZnSXJodFRxZWc1dlFVdnpIdWF2Qm51d0pVMnJXSTJudHd5TUZENXU0N1d0?=
 =?utf-8?B?MTJGbW5MajhvQk1RMGxJOEtnMS9VZFBNZmtuU2l5bFpMNnlaYWpLVkNmVXEw?=
 =?utf-8?B?c0MwY05nM1VWMlhpKy80bXRud0pWRk1RV1pmdGpuZlgrVmZacmFLeDFrL2N0?=
 =?utf-8?B?TXFtWHpzZ1RkbUFTaEp3a01yb0FhS0hIY3pXZzhEKzhwQitscFVicmVWOEg1?=
 =?utf-8?B?OW1QNFI3NVRYSXBIWHVxWXVUS25ld2J5TEt0UDdablV1ZW03czdHR3hNNGk4?=
 =?utf-8?B?cWRMbStGUGwwdE1RSDlXZEppQTMvRnc4SERPOVEzSUlmYlFBWnd4dndyNWVo?=
 =?utf-8?Q?iaCL2oonVTrcb5ZwK4z5wMgfv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d8718e-8bc0-49d3-289a-08de3142beac
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 01:33:07.1204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucMlLYAAWlRFVTsEDAu3+DU3R05fcPZuA6B8TJJcVW4uIhxACEhvmR0tCZtKVxW8BqFoq1JC6Rzu58JgYqYRtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6420

On 12/1/25 1:24 PM, kernel test robot wrote:
> Hi John,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> commit: ed78a01887e2257cff0412b640db68b70a2654dc rust: pci: provide access to PCI Class and Class-related items
> date:   3 months ago
> config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020539.vRk7h3HD-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020539.vRk7h3HD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512020539.vRk7h3HD-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> error[E0609]: no field `class` on type `bindings::pci_dev`
>    --> rust/kernel/pci.rs:471:51
>    |
>    471 |         Class::from_raw(unsafe { (*self.as_raw()).class })
>    |                                                   ^^^^^ unknown field
>    |
>    = note: available field is: `_address`
> 

I vaguely recall that this is due to an infrastructure shortcoming, which
is being worked on. So I'm mostly ignoring this for now.


thanks,
-- 
John Hubbard

