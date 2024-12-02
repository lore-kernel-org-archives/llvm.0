Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2067.outbound.protection.outlook.com [40.107.102.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8511F9409;
	Mon,  2 Dec 2024 08:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733128045; cv=fail; b=W+ghJ8QlCxdYIvNvP98DH0dUIHtJy+pSexxUIiIHtCNwfpt+V23ZazOQWE8cMLVXuG9+YSFo/SE98UBZ5cOpVCIvvlBC76qEejXwlyH7Vvq7dOF7R7PQHs95WDhozD8C5TktqOJc/r+9GJobNYTVs1jx7TwI7gFUIXnhgEQbHZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733128045; c=relaxed/simple;
	bh=1eUR/FBS6ji/lHLY8MAHYzhgJgGyBgz3w/5+Ch/nH1w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jm4LSupjAqhHzMROrzgcUyhqltqq6M7IBuWQU7PF02obzZ8Wh7BeygxG+1bmcwxNdBBHAnbiBEt/sDLgRnJZhNDOzR2rGDajkS5UxUJE9GRlDPeMsOWSkx2gIqJdOskYbBnd4s7XaFuwowvaSmL6KlPzITL+c0mGboapP898rzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L0Zh+3N/; arc=fail smtp.client-ip=40.107.102.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L0Zh+3N/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iq+cV+tXVe+avuN26yDCl6bYuPvdF0kpcjoQOgivRgcQXK9hccwTUHow6RtUq50+H9w6Dh4yfTHZUQjhjdHF6sj+C2zKq1LVfkri0q50sN44HXq2WED9nlZzX5XnUxXRduuc0N6PGMDaoXGUoVtjUYEZ0ZQFX2f7DfbjKY0tlJ+VKc5+reTEsq0deRtl4KmH4luycgYSs9/uXqj1Vm7uTtJprdXC401nUWl/JVmdx4w3Zzkuka0WF80LpwNvmmAwvQxCW0cep9H7wDu1ijy0/wgVAnShcgyVrRjBOlThe9lxNwJGzhRUgntkfkas0u0BJEmo1WyR9xET4Y4/REDXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nc+FGNRZtozt0Tjle8fSEH5yG5hJ+lz2x8qW3vqJmA=;
 b=fUuHFMnlN+ciDHRRtDExeEyTMvurBkOJ1vtU3VPld6VcsAF1YsqTYDiT77l1hawN0pXwU5muie7sTk8MIae1SCGr3vAlLdCQxl/My9BIosIw8i6z0DPA2M8onNu9HvGOTjyqLzsGYIF7WdQfbLg7A3mCsp4u5j1sYRa/4FJf6mfOLUz7Zcwh2NyeNtTlv727PFoqcexiHvuZIwDGkUSLhmPyYF6PSNHTafZDloq0gxG+vPOfvsusYj9Y4dZnkH4POvRcVUZQYXGSjh1DAHHYmiEJtI9UVzSUjZeOfD3iUl4toI1GvJD48TrcklOnzgTC7yMq3zG2d9VEiYG/WHxgnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nc+FGNRZtozt0Tjle8fSEH5yG5hJ+lz2x8qW3vqJmA=;
 b=L0Zh+3N/o0EeGyUFDrAmRTphOy7hXB1gfnu3sqOboYFFe75Ak1J3pFM5GmfWZ85FMf3jsoP4kyhuYIImBJ7CDgXZT2jm2ALbkVHi1W53PZxpYx+Fx7xOpD7IX+HVi98Xp4EkvNpHWolMZXKGVBTgA8Ol0nJS+FiXSBGQONVa+NE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 08:27:21 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%4]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 08:27:20 +0000
Message-ID: <434ab94c-d195-414a-a5b8-5f7979a057fc@amd.com>
Date: Mon, 2 Dec 2024 13:57:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V0 03/10] mm: Scan the mm and create a migration list
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <20241201153818.2633616-4-raghavendra.kt@amd.com>
 <202412020401.kTXL2n6L-lkp@intel.com>
Content-Language: en-US
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <202412020401.kTXL2n6L-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::15) To PH7PR12MB5805.namprd12.prod.outlook.com
 (2603:10b6:510:1d1::13)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_|PH7PR12MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 608f0b2a-0c70-44d9-2eae-08dd12ab2389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0RQVDJpV2M3UjlxclA4a2tIcVllbnpubWdPOERsTS9SWVJXcFFEeGEwd3ps?=
 =?utf-8?B?RHFTMkp4L3NvR1A0R0tTWWxJVG53eVZSTWhTZUgrZXBpV296a3ZkbXJxYko5?=
 =?utf-8?B?NzRTdHdtTlkwRjd1V0pxYm5KT29nV2dlUnRwSElyTG5ObWNRZy9CT0kxVjFB?=
 =?utf-8?B?VU44YWVQaDFaOVpZendYeHMyREp1ak10dUMrdGs0YzdZcmZUK1NKZWp1VlN0?=
 =?utf-8?B?RlhrVExFVVZZT2d6eElCUUhQdm42WW9TWDdaU1h2TUlaYzlSbUJXd2pYeDRk?=
 =?utf-8?B?QUJzYU9zWmJnNFlRdWw4bXRZMTdld1VFM2NOVWZGUkQ0MXVFUktSOGVGOUJy?=
 =?utf-8?B?MVQ1Q1pabzZ4TFFXUXA4WXZpM3hpMGJNbHI5SGxBN3ZVdjJ6L0hvWWVYV2Vk?=
 =?utf-8?B?RFRJQnpkUThGN1g0SFJuOGNDWVNUVVIySHNSOFJ3T2RNT3l2Kzg3YUVyb1ZC?=
 =?utf-8?B?dGg5SCttUFA5OHZCTHlta05hbGZ1bU93bEQxdVV6aE5kNXRBdWlTVXgxZ0wr?=
 =?utf-8?B?V0JYUG1XYi92WExEVllDYmNVTjl4QUNvT0xkbFVWM3hpK3RkNUtxc1k4bzhH?=
 =?utf-8?B?d1QxdERhQU1oOVdOUDdxZ1d4RlJCRnROYzRzZmNoL1FTSVpDTWd2dEZxUURu?=
 =?utf-8?B?Z0JRWHF3VVBJVCt1UVNLQkJwcUwvUk55K1NzdXlQQ295QURmaXcyVHJINUFT?=
 =?utf-8?B?VFRIeGxBcWQwTzkzekNaaWFXd1hxcTE0RUI4aXNRSm12WU4xR2lvcVJkeGkr?=
 =?utf-8?B?ZTlEbkxGUFZOMyt3VVQyUm52Yk1PWk4rZEhIbTVCK3lhamE0VGJsWElnU0R1?=
 =?utf-8?B?L3BGSmFiemRSbURXU2xlb2pEQnFCOUhZYUpxSi90cFZaR3hWajhFNTFrZHBn?=
 =?utf-8?B?ZjI0RUxQMnRoVVNFUkYyY3pRNWZvaWFQRW4xbStzN2dJMm4rWldpdlpKZUdm?=
 =?utf-8?B?dTFGU1BsOWt1eHdCUWtvNmQ1K2VSTnNIMGZRLzd0UEdNaWRxYzRJYlAxRFVu?=
 =?utf-8?B?dEI4cVBUbmtqOExoNlh4Q3BIenVmSy9WOE90VGpZVFNCRzN2RS9jTmJnam5W?=
 =?utf-8?B?YjMvN2pZRElmNlFxY1hjRnNTR0ZDREFPZnVyV3g3bzZnaE8ySE5ieEVta2xt?=
 =?utf-8?B?WmNCMFdvMFlQOVBNNEJJaExJRmlVSWJKTmloL2QxSlJnL2EzcjFhY2RybE43?=
 =?utf-8?B?c1hMZ2YxRzJNdVlkd3JwY1pCVDZNeXU3M3pLblcwWHVYSGxVZnZKMmxpMWdN?=
 =?utf-8?B?bWRnQmpGVUloZ3dPdkxqbCtOZkJYQkp2SW1pN29qWlUrdE9sc0R0S3Z6Umww?=
 =?utf-8?B?UloxU0djUDlVSDJvOFVWM0I4NXdrMzRyMkZVUGZ4Y1pnTk82UEdCMEQvYjlk?=
 =?utf-8?B?SmNlVFY1eHU2eTFSRmNTYW0wQ0JhbUZ6RUVSbnNJWjI2UXdubmU3anp6UXVm?=
 =?utf-8?B?N1l3Uis1SGkwYTJpYVJiTVFzVHQxWUUzTTF2bWs5bG96OG51WFVkb1RTVWRy?=
 =?utf-8?B?Q1kyclRaTVhYT0JGT25qUVFhSWhSai9HUm1UWXpKdWo3anJ1OWt5T0k1ZkJj?=
 =?utf-8?B?NzRKZ1lxQStNbVQ1VWh3dHVNNi9JdWxUTXZjNkNEeUpzUHpRWFBWdm1RNEk4?=
 =?utf-8?B?ME96QTJKZEJUdjhUY0dxQjlOTnFLdlBtcjdBMk5TMlJWUy9iTmYrQ1hnSUZq?=
 =?utf-8?B?Z1Y5S2tOYndVU0FmUTZiSDh0bzJsbnU1VDNvV0M5bVVOdjJseEFwWUMxdEt4?=
 =?utf-8?Q?BqOy3x1UXOe3TqdST8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXFUOVVTQ2Qyb2FhR3dlYmVjMHNBcGlaSEtFT1NNSWpXdXIvTkF2UVhaSFhq?=
 =?utf-8?B?cFhSbHRlOERWOGFCWWIxQWhUZTRuZnBHYng1bGtXRk95OE9xckg1dFE1RzFR?=
 =?utf-8?B?ZGJOUHdQY3hwUGpnS0FFeEY3cTRMWTZpQjVYLzRsUmw4a2ZDazcyZXdxaUgz?=
 =?utf-8?B?dldrL0gxTGxOeS9FRGJ5aS95YlRxQUVFWElsUGNGS0h6SHJRbCtIbG1iaDhv?=
 =?utf-8?B?RW85dnQvdHhSSHNFc0ozTWFxeDJIVUkvNm5UK1pkNCtIM3VCSXVHaG1Vc2th?=
 =?utf-8?B?eDlwZE1TN3FZV05JalE1RzFvKzdSdmtvOUk1LzZZZ1VSSWowSjlCUWwwY0tZ?=
 =?utf-8?B?VDhMdGdyQm5pb3ZqWGl5TDhYcG5iWm56NFhyR3VRSXRRNmlBTSsxejVDdTN6?=
 =?utf-8?B?azljUXNJSW1vcWZOeUdvcEM3N1Fyci8wVUZaNkQvNjRWck44ckNNcDVRZlph?=
 =?utf-8?B?dEFkSmdUVUEzNXQrTncwb1hGSmhmQWxWbmpEMm1UOXRlWU5LVUNuZFhxbnBT?=
 =?utf-8?B?T1VPTnBTY0diVHpaUWZUbjVxd2t5U3lsZ2s0WDBxaGlremRNU0NJNnhrQ2RP?=
 =?utf-8?B?QU1BQ1gzdmFpUWlpZ1ZJZ2JVQytsYWZEZ0IzcjF0TWUyTnpOc2ptalFXeGFt?=
 =?utf-8?B?d3U3Q2lZL3grOFNlMUFPNHF1OE1abUtKU0RLVXJWaE1RbWkzeDFodHBsd2lK?=
 =?utf-8?B?QnFNclE1blV0WGlDdWNhUWhiMmZLUmdhSFVwVWJQZVVYS3lSQ0M0UjFwT1BK?=
 =?utf-8?B?cmNaT2FKOGZPL3pDSWJVRHFqVFhOUml0QlNDdTZZTThwVFAwcFE3NXZETXhm?=
 =?utf-8?B?Y1VCbW1mS25pRkZ3WktoeTlLclhORVY2RUdwd1JiV29IQm55NDhBdThlYS9y?=
 =?utf-8?B?Ulh3TUg4bkF6dEpzeWhETDBTSkU0L0JIOWtmeXI2S2hSc1JRNmlTclAvUVln?=
 =?utf-8?B?VFdPb0hiMUZXQ1RwVlB1RjVBOWlMMlpmanFmK0k2Q1U2dU5XSHhKZjh4Mnll?=
 =?utf-8?B?ZlgzanRSSDllQjB2R0V3VWg0b0k4dzBVT2tuUDhRV1QwbDkzUWdyeG9mVzBh?=
 =?utf-8?B?UE5XcW5MaVpsdHN6bGVmcWQ3a2pYUFN2N2wzaStMTVhZR2JuMzRLa0l5QSsw?=
 =?utf-8?B?Y2IxNTRleG1nQyszVlZsYm5DMVdsbzRIc1JUS0RidGg2U0FuWCtLVUdaSFdp?=
 =?utf-8?B?eVNmSEpkdUd5Rm5pSElhYlN3a1MyMWpiZzB3clRMcXdkakh2SzVVK1FsaWhU?=
 =?utf-8?B?LzVvK3hzTGZQL2dnblRZNG00aFFILy9OMGNLL0dKdm1Ld0IvajB5cDZOUHls?=
 =?utf-8?B?RzVLR3haQlhObFVmWEdCWEdTOFgrL0QzTTFOT2NJWThjUVhoTFpubGM0S0Qx?=
 =?utf-8?B?TDgyUUVQZ0paZERpdHc3MlJ0MTBmbFVqMXlmcnpENXI5aStXU3REMEhzaWtm?=
 =?utf-8?B?QkNRT3ZKSjgwYnlkRTFZSlYwVDgzVEI3U0lNWDdOVzBaMnVIYURySkcrR2pw?=
 =?utf-8?B?VUx5bXhrRWEzblVDOEY3YWQwQmYyMWVEcXg5Y2FLRmI5Q3R2aXR1ejQyMmdQ?=
 =?utf-8?B?TDF2Qm91Y0RXdDNITm8xZ0JWVHJLeVo2bjczc0JobExEeFJpS3luSkJFeTZq?=
 =?utf-8?B?czB5NXJWd1FMWnhjSWluNWJNS3pmSVJtd2pRdjFhMWFWNkpFNmVZTDlQenJD?=
 =?utf-8?B?S3FLbXY3RHVOd1JDK0RZei9kRkw0dVk5ZVFrRkdCc0p1QzlUTjBaRnkvTDVW?=
 =?utf-8?B?WXVjWkhjMGt4T1NtVkhnd25NeDVOVGIxbEh6ZFZGTEhhRk9QbXpzWHorSFVR?=
 =?utf-8?B?bkVmTW9XQTJIdFA4djNKcTQvR2FMeEpKdnZtd2FldlI2SnA0ZmdZamU5YStL?=
 =?utf-8?B?RWMxOWlQNTQ0MXJCbE4zU2xjL1NTNENHWExqMUZyYWJWdGVUV2ZVbGF1RXJo?=
 =?utf-8?B?WUFxTUdpY3VBQzh3V09HT1p6SUhsWlNaWWZJd2RkQ2ZhSGNFTDFNQWhTczdZ?=
 =?utf-8?B?L2krZHF2cXhGSFRMT3V2NmNJZGpuZEQ2R3M2cXlIN3FOc05kYnVaaFg0Zjcr?=
 =?utf-8?B?enRtVzduRDlVd3dIbkp6bjBZZnpacVFqZkxyT0ROVDNkRG5raFRhdHdVbmJF?=
 =?utf-8?Q?iHLHia4B6nz5dKsQaubdLa4QE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608f0b2a-0c70-44d9-2eae-08dd12ab2389
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 08:27:20.5338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dGGHImUebEQHSPCroLFfMhvIUKQvv3O4ZrVs/ADD5GO81+9Z9mlyEgC+H5FhixWfp6Y85G1h5MAi3TAZ0Dslw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8178



On 12/2/2024 2:35 AM, kernel test robot wrote:
> Hi Raghavendra,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Raghavendra-K-T/mm-Add-kmmscand-kernel-daemon/20241201-234153
> base:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
> patch link:    https://lore.kernel.org/r/20241201153818.2633616-4-raghavendra.kt%40amd.com
> patch subject: [RFC PATCH V0 03/10] mm: Scan the mm and create a migration list
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241202/202412020401.kTXL2n6L-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020401.kTXL2n6L-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412020401.kTXL2n6L-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from mm/kmmscand.c:2:
>     In file included from include/linux/mm.h:2223:
>     include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>       504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>       505 |                            item];
>           |                            ~~~~
>     include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>       511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>       512 |                            NR_VM_NUMA_EVENT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~~
>     include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>           |                               ~~~~~~~~~~~ ^ ~~~
>     include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>       524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>       525 |                            NR_VM_NUMA_EVENT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~~
>     In file included from mm/kmmscand.c:14:
>     include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>        47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
>           |                                    ~~~~~~~~~~~ ^ ~~~
>     include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>        49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
>           |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>>> mm/kmmscand.c:159:36: error: use of undeclared identifier 'vma'
>       159 |         VM_BUG_ON_VMA(address == -EFAULT, vma);
>           |                                           ^
>     6 warnings and 1 error generated.
> 
> 
> vim +/vma +159 mm/kmmscand.c
> 
>     145	
>     146	static void page_idle_clear_pte_refs(struct page *page, pte_t *pte, struct mm_walk *walk)
>     147	{
>     148		bool need_lock;
>     149		struct folio *folio =  page_folio(page);
>     150		unsigned long address;
>     151	
>     152		if (!folio_mapped(folio) || !folio_raw_mapping(folio))
>     153			return;
>     154	
>     155		need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
>     156		if (need_lock && !folio_trylock(folio))
>     157			return;
>     158		address = vma_address(walk->vma, page_pgoff(folio, page), compound_nr(page));
>   > 159		VM_BUG_ON_VMA(address == -EFAULT, vma);

Thanks .. will fix in next version..  vma ==> walk->vma. Normal config
did not get this error.

>     160		folio_idle_clear_pte_refs_one(folio, walk->vma, address, pte);
>     161	
>     162		if (need_lock)
>     163			folio_unlock(folio);
>     164	}
>     165	
> 

