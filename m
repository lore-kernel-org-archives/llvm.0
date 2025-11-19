Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B482E0415;
	Wed, 19 Nov 2025 22:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763591733; cv=fail; b=DsSpauolZNwBIwuCIKZrP0u7TQbotO4JKauWokZgEnawXrh9DqCdPK9a4Z97zG76ycgGv7rmFszxQKyXCOG6Brz6Fd5xgxpe9fd8EWV6t4KbMv6egiG36PziE+rSBYCBKuESqW0GR3yPfwLU2ro4XErfOUfg86kbF7WuQIl+g8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763591733; c=relaxed/simple;
	bh=bjT89wZ66WPNg1Tlx49K4lfWP5K4uqySdGZV0f18SuU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UYNLMSRzxaCCiBXcIYXKLEx940lCli8zazdimlfDZt3yt/T4bdHIWgibO2/bC+En9NUs2prXei4LOx4gIT817oMqOaUlxa2Q+pKCSR9oyWb2cHb1Vhn3fQ2PykLtZPZ3AjeFcL7mePbEujncV8G8CYH1tCW620bpx9C8O/HOjaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OHtcrOZd; arc=fail smtp.client-ip=52.101.62.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OHtcrOZd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtTxvb/mO0M54/SFx9qBxZDC/kniASc+aQjUabUTgmNkaLH5yFZ9CQgvIWMnW6NbcDnYceqceG69s4yuOJLBVNIB2G4j31i1NQxGPqXK7aYF7upT2Irrfh3L8BvWxX7llG6wQ54fkhSI63JVLit0JaQBH3Pt9nnB0dt4itDss8bsSTorIDoBcSQ/YurxTMQNQZ7ThRewPeIsVfTtRwuMjiEtrs1zCLWcSCTeunz1p1LBYn6gK3iXZTjvjNZwzqVMVXJp0IS9LYDwSItPvjM0BwQRRRwtSblRqoVSr7Mh2sGZ7wMRGUtGExseA/OApx6QtqIgBc/mNaGwSwaHnUz+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYkgUiyx2OBmwpfniRctS/tjYwvXJ0RUUOZTKenATeY=;
 b=ibCyNF2j1/hOR6ptVEgKkHn3xs8Ji7c12l9kD5HlKWrktUWYzfXrpU6UbkWKJEpbwe5l+jnS/99Pp6HBggZs3pRyUuaDjLmsmV5nH4ZTMHNzofAcgWGTisRksmpxnP7Bx0dLGD4ZzlzycSYCqeB/fHlmGNlERSfD2aq0sfgT/u7/3Cq5oF4WLEWawpJ59bOuSzdkKLr2LbB49cNO7rZGWv4kYYtn68GwWAsr7pcGINrjefQvYPT83sB8iY4Q4KCJ0r7GpxFv7oC/fpEu1+pV8HINFyL42si9rO3i/CxdqC62Nr3eeA/InKphs9CNbqXUfc3H8Dul2J/Gx6Lrkb94dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYkgUiyx2OBmwpfniRctS/tjYwvXJ0RUUOZTKenATeY=;
 b=OHtcrOZd877b5aFCCXHuVGENoYYiu8XHGSrEkDO1KOG+9ovBny7heQcSE9eYIHS6KEhcd2DiOQs/59z7SoYf4TkWedRPoiMV4I2gnHrSFLcLyktErkZ/BBHhQykEyAikghUKj8j03aDI03zta6gerVfpesrbYgapLAj1lj6wyQi1b3HWzLiWq6eUr//sprUshRiUEjOYoqPrvypCXaWIqg9JrSGkFVarvI1jboOIHuB0L0l3s2CzWLNrJQjgofQ6b1wTTPW0Yy4vkcfFlcWZlQy91Llv0EToN19qoXddlVydpKrR+4suUYo0ZLYXCWDaoCQxxF2X1GyVT7mw82Encg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by LV2PR12MB5920.namprd12.prod.outlook.com (2603:10b6:408:172::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 22:35:28 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 22:35:28 +0000
Message-ID: <aac99648-4db5-411a-95da-f8d5daaae17e@nvidia.com>
Date: Thu, 20 Nov 2025 09:35:24 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 169/175] ld.lld: error: undefined symbol:
 shmem_uncharge
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202511200534.o4hsMNEt-lkp@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <202511200534.o4hsMNEt-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::9) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|LV2PR12MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 274e497c-d729-4c57-25bb-08de27bbf09a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0VROGpYYjhETFdCOGZNMDhyRWNXRHRNRkVtKy9FOXlFbjdHaG1JQldZaTgw?=
 =?utf-8?B?bWUrZE9rbTZUZURHek96bzlzZ0xwTTlnci9mK2llbVBDZFBXNWxLcE1nRjhk?=
 =?utf-8?B?dEphRUFrWi9iQXhMYkxyd29MSW9ZVy9jbGxrUFVsU3NXZzByQTRBUkhJemFt?=
 =?utf-8?B?REFhOVJqWkp5MWl5Z05ieTIybFo4YVdadDdWVjhOL2ZsSEQxcWFKRW5lYnh5?=
 =?utf-8?B?SkV3ZTJ4VnhId0FlQVNMa05qNGdrZFYwei9GVCtWWHEzQWxrYUV5V05IM09h?=
 =?utf-8?B?UTR0c2RtbkorTkZWSTY0VmNuV2lyaGsyRXhMZHdxVmRMV0Q2VytaYUhzLzF0?=
 =?utf-8?B?SjZVcmhzZWg0NDh3Ni9qMXJNMXlwQnQxamxyRWNUbko5RCtYMVdrQTdZQ25l?=
 =?utf-8?B?c1VBTXFVNmlYdlpRaWlyb29xRHNQMlJ2SlFFMzA4SDVSN1ZUQStTVnlBZFpX?=
 =?utf-8?B?T1R2WkJHQWdTcWdCQUxraVlQUE5OTjZVT3AyMWJGZG1nUjhzclFRMmhFNk1H?=
 =?utf-8?B?UnlHM0I3VFdmengxNzBaM1lPR29QWWh5Z2pWR3N1Tlg3S1NOWUlhS1V4NU5j?=
 =?utf-8?B?TnpFVDJzUmpHZ00xQWZ1eVkzUDJnakFST2NSckJxTFplZXFVZHc4aHlBcy93?=
 =?utf-8?B?bUdsN2kyZXY5NlV1ZkdpSDBuZTdQVDdYYWJwN0UxVTdiQllWQXVGb21EUmls?=
 =?utf-8?B?NXRvTUpnaTRDZVBjdUxKN05mL2gxNHBCc0QrK2dLSzVYZmxjenZibUdjSDA5?=
 =?utf-8?B?TERTMTF6K1Y2b1pwYkVjdGYzaFRvNWtKNWJKUlJXQnBVTXFjWERFRlJMK3Nt?=
 =?utf-8?B?ZlJrbEpUWFpONXdrZllQM2pGRlVDM1RMMWpFUmZkTVYzUnp4eTlDbUw4WTFD?=
 =?utf-8?B?azhsVDNUSy9tQmNUSGxNcWEyczZqUnh0d2U0a2JiSEdjOTZNN1JEbkNjcTAx?=
 =?utf-8?B?K2pOREI1czd6SXpLM1RmcUcwZXdUQUgzL0VZVGV1ZG5oQjhteDgvSVo0dHll?=
 =?utf-8?B?RlJZUEtxSnJVSXhxamE3bTVNZ1JFZ3FxL2VRenZPeGZOcEFvQktGcGNzSU12?=
 =?utf-8?B?QkNTdDIwWDFoSUxHUWRybjZaVWYxV3ZkQSszQ1k0N2dUWUxMYnRMRDdBZmxF?=
 =?utf-8?B?L01qWVlGaDdyOHE3Y0l5c1NWWTdyd1drWHloemFxdUxWcG41ajlHQUhsaEtm?=
 =?utf-8?B?K2p5TEJYOXNKWXFZeG9sbWovdHpIQ0hQZU5UR3F2bXZqOElmTkZpWENER3pv?=
 =?utf-8?B?VitFVHJITHNVMkxIOXdFMTFieHMvTklyQUVFNGNJa0FSUmlVSzZUMXlpb2l5?=
 =?utf-8?B?ZC9BYStZdGJFQkZqbFRUVjV6QTJJNitjcTdNQk50SUt2Z1BYdC9QMkJjUytY?=
 =?utf-8?B?K1lCR1dyS2pxN3VLSWpQS0dQVWhucUlsSDh6UGQreS9ZNUZTZy82WWhVc2ZO?=
 =?utf-8?B?ZEN5UXlOU0pVbkdoY1pXdnNxQTZXM3dqVFFSRlM0dHN5dWtFVkxkVSttYUMr?=
 =?utf-8?B?RU5keUJONmNHeTBwL0xtdkFxSHNQeG82TWZmS0FNc0lYMW8yZ2FtTHpDQjZs?=
 =?utf-8?B?MStQbmlTTktIZlltTi9Id1FGZDVwRWZsWnlYR2lwVnZkWFdIUkNuUDJUMGxr?=
 =?utf-8?B?ZGtKRS91aVFDN2RTYm16RjJhazRVYTNyZEl2ZWFTRFRaalorMXcrTFlxQWVY?=
 =?utf-8?B?c1A3ZmwvVXFiOEVBL1IvdXc3VFgxUGNBNjRSKzU2aTBQQksyYmpmaG1Rd2JK?=
 =?utf-8?B?Mnl0azBSUERlNVNncTg0VFI2eEI5blZwbVA1QVJTTVZuU2x3elMrMmlENHVB?=
 =?utf-8?B?NHBWNU8zMUNKOUtHQUFuRFRDVWJKWUc3eUVUQk9pKytXMVdaMHR1Q0hzOU9l?=
 =?utf-8?B?aFRLNWpQRWFNTHdGNzd2bGlzazFMbzAzNmZrOWhiak95cFVlOGRUSDFBNThl?=
 =?utf-8?B?NktwQjNQS2d1Z0RyRFdVZnI0NU9aQmZHSi9oOWNJMXcyWTVzRW8xSDRVVmJQ?=
 =?utf-8?B?UlBzcStlQjNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG0yMTErTGlvT3FkY05CY0dzbVV6dyt0ak9DUEpLbDhBazFJNnRHMjVwNlFy?=
 =?utf-8?B?b0dhbHpidmpmZmVGVFBIejJjbGN0ZkRNSUVpTnZ0OFRTNG50Y2FYZ1I5NEVE?=
 =?utf-8?B?bjR4anpScFZRUnVwS01nS1dyQUN0R1hMTjNGTDVjclRMeVJFeDVYOFpscGsw?=
 =?utf-8?B?YkI3eWl4b1o1clZ6UFFVWFkwYkZ5TjZxUEpjMEJLdi9qVDRnZzVyNFh0UkhL?=
 =?utf-8?B?alRtbk12UXNaeDBEcWxzTG11elAzRUpvSEh5bXg3NjhXM2tqWmdFRkR4bTFv?=
 =?utf-8?B?OVhXNE9Gd0lhSVZnZTM5V09xUlZia21zN2xTcUJTVHUzejdid0x6alJiaFRj?=
 =?utf-8?B?ZEtZblYxUWdaNHR0bFJ4NmFncHU5aE9OdXRrR0tQUnIrYkFEM1RWcjAreFdR?=
 =?utf-8?B?b2NGVTFSUUEzWmh5WmJvWXBpSVg4S3o5bFJ4SUs4ekZGQkp6TE5TM0FOVGFq?=
 =?utf-8?B?NzVnTlZDd3h3TVZkajlRR0E2cGNSUWNaT20yNmRscDdOY0pLanNlVFRkaVlt?=
 =?utf-8?B?YXlpd0lCWGw2RHFjWVRWNzhFQjdBZnJJaWx4Z0lxNlJMdHFJbkZDNXplN0Nr?=
 =?utf-8?B?MUJyRnRacVpTR3h0Qzl2VzV4M1hsUlRoVVFiTzVscHp0OCtXQ0lqZ3JuN3Bi?=
 =?utf-8?B?bmtOWTVJZnVVNHBIN251N3o0MWNXQ0wvQU5hMlFuQnVkVFFDazluVEJJUmJC?=
 =?utf-8?B?cUN3UnRwQUk4UC91MERRaU9HbHUxLzFqOGtxRk1xZXNWaWx4OXlSZFF6NUVs?=
 =?utf-8?B?L3N2WGlyeHRvUHV0bkRGOWR4bDllSnh4L3JpWTNZelVvbm56aVZjNFI4OW41?=
 =?utf-8?B?a2JIVG14V1JZTUw2L3BPSXEwT3hFbWtsZm9RQm5pV3FHcjhzR29TRVl5ejRO?=
 =?utf-8?B?SC85UEtCZnZBNk5YNUFXNmN0TnYrQ2sycnhmQ1NkT2xHZWh1Yll3dkFKY0Fa?=
 =?utf-8?B?enVzbnRQNTdRK1NCN0dxZFVodUhNbDI3NUdXSmVyb0xwWjNFRVlyNlgwWGsy?=
 =?utf-8?B?dGdpSFEyN2FURzNUVHJwbUhuMzdPcTZScUl0Zyt0RDFyYVVQZkd4MW5waExl?=
 =?utf-8?B?MXB4Z3BmQnVjdmV2WitCTlR3dUNldXBJVkJTSmpxUUJtL1YwSjdXRXlNZWZo?=
 =?utf-8?B?Q1F6eTh1VURVaWk5NVpNM3pjWHVsQ0d4MlpGU3RRTFlYMEJNWnUzcVlqUFkw?=
 =?utf-8?B?NVhhM3Zqb0QyL1ovSGl3QncvU2xuZmZlZHNjNEZ0eVoxMSt2WHo4WERqbjhO?=
 =?utf-8?B?eThvWEx3Um43U3h5UmNzSUphTzRrZVVZVU5WcW5Ock1qVmhiWUtYQmpRL3RP?=
 =?utf-8?B?MUlWakdtZzZ5OGRjWUxLVXVRY0Yxdk40aGtNOGo3bWVSSTBoRXc2dzEzazU2?=
 =?utf-8?B?Q3F0azJoNlNjbGgzQVVoQjA4K2Eva1NuWXNNOHdJejJzclY1VGJyRjhiaUVv?=
 =?utf-8?B?bmNvYldhb3pFN0pMRzNMYmVyTmU0YzVVZ1RFaGlrYzFSb3cva3RQN0gvTnRy?=
 =?utf-8?B?bndrNkZ4V2ttYVk4ZW84bVNnM0lISTBCN2lYQXlpY0VBRzNZNk4rZ1FQOWhx?=
 =?utf-8?B?ZHlwU1dlanJndUt2UE1qWjdaM1l4RWprcmxRRUJwQ24wSlNvZEpnMFpsYjRI?=
 =?utf-8?B?RHlRcGF0czVQbXVjWU5SVG5BcXM1ejBvY3lGN21NSVdmR3U0T0RJbm45cUZE?=
 =?utf-8?B?b1FMeHUvZWMxdGFsc1puRm5PdmFzWTJXWXAwcHVXTXFudm03eG1OT1hVallU?=
 =?utf-8?B?Sk1vVHNEamxBZU1vVFp4a3B3ZEtWMGRJNGN6WThEaXJJTXJQaGNaeEl2dVI1?=
 =?utf-8?B?MnFpdEFOWTAzcmxaMUpWeUxCQVo5dG9BSTBlcGwwcXB0QnNpTWJBNCtsWWd2?=
 =?utf-8?B?SVo5aTNKUlF0Y0g1YTBxeGFWeXM1eGxRbU5BS1hEbENWWlZIbDJyK1pydGEw?=
 =?utf-8?B?Sm5HOTkwSzBXT25QVWdEdDhWaUZYNXhUeHlQVzNkOHpONnpQc29WdlR6Zzkx?=
 =?utf-8?B?WHpwYldiNDFFVzVrSUVCUlkyRnQrWWkrL1paTzlKZGhsaFNWTUxIeGNpalNt?=
 =?utf-8?B?RnFOQzB0dStKYmIrZkxMUnlXckMybkdwODVOQVJ6V0J1M2FoVjk2ZUhFOWxT?=
 =?utf-8?B?ZXB2RTNHWE44eWdlbHQ3bExuakJGMmUvN3VuNUJZbEwvTndrZnJCM2pxNW9K?=
 =?utf-8?Q?KQHL2FgDGWesXCVqfiAeftGR3BiNODNOnJSkZS+/p8XT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 274e497c-d729-4c57-25bb-08de27bbf09a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 22:35:28.4238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5rkXpRdac3x+dBgwSxqu5fyR++fKysfyADW+dWEvnsGV5qDnLOBhVhrKz3gQhvi8ufRBA/7r0c6xNdnsT9CqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5920

On 11/20/25 08:26, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   102494e6776f316b6cf2924976681d790f278cf1
> commit: 9a655bd0773b41af6d8515502de102544f3ec4c1 [169/175] mm-huge_memoryc-introduce-folio_split_unmapped-v2
> config: i386-buildonly-randconfig-002-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200534.o4hsMNEt-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200534.o4hsMNEt-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511200534.o4hsMNEt-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: undefined symbol: shmem_uncharge
>    >>> referenced by huge_memory.c:4053 (mm/huge_memory.c:4053)
>    >>>               mm/huge_memory.o:(__folio_split) in archive vmlinux.a
> 

On first glance it seems a bit strange since I did not change the use of shmem_uncharge, the
computation of nr_shmem_dropped did change. I see the config has CONFIG_SHMEM not set, I wonder
why this triggers with my changes only.

I've tried reproducing with clang-21 and the provided configuration without any success.
My command line was CC=clang-21 and LD=ld.lld-21, but I am going to try with the script mentioned

Thanks for the report!
Balbir



