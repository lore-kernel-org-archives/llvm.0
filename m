Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012034.outbound.protection.outlook.com [40.93.195.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE0A178372;
	Thu, 20 Nov 2025 01:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763601265; cv=fail; b=ivh40W2VgqsbBnv9+/3HWEJ3/T20XBtjXVopgUoEFjNiCmuyERCkgpxZFUgV46OFbNX9pt33p1CrZqqDnq8A7h4lKO8Iw6JS/T4RnUCKFpHHNfa9i9VyyRMZTnKscm5gOQrDspqpfskuCBc0CTljptCu0t2QhT28hU2R1TAa5Gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763601265; c=relaxed/simple;
	bh=bVuFbX5FXD0c0PYe5/h4UHQzfZe2ZRivJrNA307VcoA=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F+oqseTKj0nFIsdBY6kMGjlzS/cmhjMb/1V29tstcjfx/otoywqRc4RWhydUbE5QHmt9OyWb3aW8le9TNlKHcpxDEghabAc+jzFtO8P2h0YK5ZExYrG8tR0CvsdVM89SbbgAUgksveQzMFydlNRsDD99m7ovGVg2G8Dt5g7j1NM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MY0fImk1; arc=fail smtp.client-ip=40.93.195.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MY0fImk1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tloiBztQ9tBX7LPCBQMRuiJB4eY3WCVCX/gxTa1GbDtfxcOrhZMFV0M9aqW6qLCcRtK++6+0i/4KCSMGgQngQFbULfFeRI3QDQKoH6ee2w77uWSRkZoNf/f6+E9s8CaZb0jB3UPcpBuWkgBEVvbQFs5x6f2KLoZXJMPQUg8H0CKjGBz0AhsjFMSpGjdbzRrrmBabvTYMiyaUBkxLbTuwkR80JiGG0b9bUl4v6dmsJB0AuIojXIsGQPz902UF1snqhaMRXIU4nSqzDkLSnMbVi75At+LXd5VJAixBdIh6bcvCtycmHZu//Wv8ge6NNCsaQ0FAJX7scUbZ+KeXdXhUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAOv0Xe5ffQpuKfjHZSqH1TbyNM5dt+UTWsi/BJIiro=;
 b=twM36cY5vrLZu7PtNj2APIfDWzeN4x0q9p9WP8ndW6G9RtqhsDdmcjC1tK0xyBiYoEg6tQPz+/WJiWwLW/42jiHbhvxbi391wqf1YTv9BQdHuo2Umy/3GE5ZhOhf1PTv9ooe9aOFuspED0xsYdESFrCe68HMepKg8UKZPZStVy6Zsp4EmQ4aw3G0gIEc8q2/RXp4VYo/auiEARbsztQVwkjvzPvt4/5qDGVEm/hqNCBMT8Nn4l0iTDYSz1ytn9Ne3GaUBunnpumpo4uFoU3oG4yYR8+kGn9NSr8d8Bw6fV3d1PRVxw+ZQyzrx49rI1F2lNpZoax96Qwh/IT5yVGiCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAOv0Xe5ffQpuKfjHZSqH1TbyNM5dt+UTWsi/BJIiro=;
 b=MY0fImk1oVWKybw/mT7C2/laWC1yCpHFMYfLomu9GiSZW3lwQB/kIe6S2w/N3dk6fdkoJDYUZzGZJ+MNeLRXXxQMwyhDz6AV0BhXgkp9VLZyz5IX/rpmoRSRK/vQbtgs2Py65UlTYzMn0yZv2GV/xVuKVDQKZA9UN/xkwf3KXM2C9w5OTN7Tz2HXPz4B+tftWWAk372u1Z8kBBACj2PDHV2Yq7kuRTzh5YlxpaUJ/uFx+oTDp4eg2Y0t/hN9I0QcwRotQYY4gUhmyZGE8Yye1OEmAX4ZWJw3mNMkhEF/VpbS84LU+fzY8ZafoJRMr7Qd1Pg/VScbaqgEvD63zXVqPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 01:14:20 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 01:14:19 +0000
Message-ID: <90b9f17d-3b5e-4304-96be-8372928bdced@nvidia.com>
Date: Thu, 20 Nov 2025 12:14:16 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 169/175] ld.lld: error: undefined symbol:
 shmem_uncharge
From: Balbir Singh <balbirs@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202511200534.o4hsMNEt-lkp@intel.com>
 <aac99648-4db5-411a-95da-f8d5daaae17e@nvidia.com>
Content-Language: en-US
In-Reply-To: <aac99648-4db5-411a-95da-f8d5daaae17e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::39) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS0PR12MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ad37b8-ca78-4697-b7ed-08de27d2216b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnZLMmtJQlVPeHJQbE9rbGRrWmNQQllEdVN0MnVNY3doS2VLeS9adkdFQU5i?=
 =?utf-8?B?Y2dBMlZKNHpHSmJickpvTm1IWGdnOU53TkVhZElPcTRnQzJNUVRWbHVteTNa?=
 =?utf-8?B?ZjlUamptUk9aYnE0Z1hiWk9FVHZnc0o1ekF3T3NYMnhQR3cyNE85QjMvUlRM?=
 =?utf-8?B?K0Q2dGJoQnp1Y2hVTW9XUE5Md2FBNktBR2RzczkrR09teXNib2V1azZBUDNj?=
 =?utf-8?B?V3Y4NHU2c2k1MTZRUU5nL0p5UTAxTldza3NzYlIvNWFWbDV0VDQrY2pwWXpn?=
 =?utf-8?B?bHN0MFlvL0U1OSswUTNVWWF6bCs5T05WV3VoTVdmdGo5cmJPTVFTcnI5Nkxy?=
 =?utf-8?B?eVFlOGhDb0NuK0N2cFEzbTVrY3JIeHU4bERWRnNvd3pTZjJvdkpVMDc2YzQ3?=
 =?utf-8?B?Rkl5elBlbzdlUys3SER2L1lCL1E2NlBoV3VDM0xBdy9rN0JPaHVnZS9CYjI4?=
 =?utf-8?B?NkFid1lURk45YUI4dGpqVUE5RkNmZ0xqUmcrVEIvNytmbXRoMkdLZyt4WVBU?=
 =?utf-8?B?akxTZTV5RGdDYjA0R3hpZ2ZQR2dsTTd4NGZNTlVVSTJlT3ZOcE50NE9xLzNT?=
 =?utf-8?B?NnNNR2ZkTDhiRFgrb3lyQWx3RjJnT09mT3lodVRkUmNsL3B6S2l2dmlrQWtO?=
 =?utf-8?B?LzFvUTcwVTloalJXdFNqY1hQRWJlamN2ZjVmVG9NQVVkdWRCTXFvbCtiMStk?=
 =?utf-8?B?ZjY0ZmlnWDZhdzArT3FnK3VQb2ZjbTJPdlVFUHRpWTZpQnVEQzc3VXl0RW1O?=
 =?utf-8?B?dlAycTA1Sm4rUUtrdlRwaitoUFRqQTJTVXVxNFJUSy82aTM0RGd3Y0lKR2pO?=
 =?utf-8?B?Tm5FVkF1Y1pFd0k1aVBna1VYUklSOVhjTDdOeHBZNSsyL1ZpaGJ6L25saldi?=
 =?utf-8?B?TkUxR2lpeVl2bGxrMFlDTG1Ha3pFQWEwRy9kdk9XMWI2Tnd1OFptaHZjdmFG?=
 =?utf-8?B?bkVtR3ZPZkdyc1JFMHhYMGpSV0dKR1Z6cS9yb2xtbGZlemFOR0tJbnB6b0Zr?=
 =?utf-8?B?QUNZaVp1Q2pDVit0akdCb3dJMmZJemN0L01LSjk4NEp4NHJzZHpzQS9iZ2VJ?=
 =?utf-8?B?b1pDL0NSeElGdmFCQWxDcmVabXR1eGxpQnZ3V0t6TS9Ia3Y0VnJkTkFxR3hq?=
 =?utf-8?B?K1pJRjJ4UTNacjlzUVhRamxodURlYXpYTDRtV3NoYXU2bVp5aTl2dHZ4aEs3?=
 =?utf-8?B?TWs3NFJlVVpYQ3R5bDRnKzJyV1EybUs1TkFZeHRuVWxOa3Z3cVRRcVBnTzVS?=
 =?utf-8?B?ZDM4bkFPQ3hNalZ1aGNzSWFMaWQ4Ri9WNnFXdUxFalI4blJucU9ndkNNdEVQ?=
 =?utf-8?B?RTRBVy9HUDhYZnJGYXU2ZGFEVUFkaHUwNUJBc0NhYU1DOFBtaXNnaEFWcVNh?=
 =?utf-8?B?ZHAwSU80a3UrYUUrR0o0c0JEYlBFL2xIY0E2aDRJM2R4ZERtK3FzRzY2R1pG?=
 =?utf-8?B?Zk1td2tXaU1QRGJmTTduWWdWVDg2eFlJMG9uYzdRRGF0aEx4NEJIZTNVb2hs?=
 =?utf-8?B?L3hUSG5MRUpoU0s3YUpOanpNaHpSNXF1c2c1eS9LOHRXQk1qMjY2bmF5b0s5?=
 =?utf-8?B?RStBMzF2NTh4TGlobnNzV1JJeUpHT21aV1NoT2thbk1abWI4VGkzY0h2OERy?=
 =?utf-8?B?bWNBeElGUkNhVUdRMy9ScTI2eXloVUpMNEpldUlGR040bVB3dXZHNmJsNXZH?=
 =?utf-8?B?M2hBYXpXcWNtRG5kc2FGSm92TjNWOHc1TUpHUnVGczlxbHRjSDhiN0ovWFRT?=
 =?utf-8?B?TUdiUThnMUtIUlZHTG9PQWJSRndadzIyWUV6NGd4RThzTHZQeER0UVhSekJK?=
 =?utf-8?B?RExFRCs0b2o4RWxEeS9UUk85UDd5WkhvZkdmL0VFMDg3ZHMycWRmOEV2citU?=
 =?utf-8?B?SE9VRmU1cGJUU1Y5Wm1Rb0JOeElOQzJHRkJXdXhEa1VJZTdhNHVOK0RKbUhV?=
 =?utf-8?B?UEExQ2xVWnZvcjBSNlFITTAzNUJiZUVFZW4ramh3SVVHanNlL05YdHo1K25R?=
 =?utf-8?B?UWdMOXJIZ3JBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWVQdEIwUDJCQ3dJM3pPbGdnS3Rla295elpkOFhXN2ZzWXFySExGZlV0aEY3?=
 =?utf-8?B?Q2Z4WVhCWEZjdEdLRUZZZFJJSkNHKzRlaStKWUlycDlPSFlUVERoZWk4NXBO?=
 =?utf-8?B?NVBWN1BaZ3FrSnN0OHdiWjFPRWJkWEhHa0VaNENIV1ZjQUJ3d3Nxa0FQZXQw?=
 =?utf-8?B?THdSRU4rM0JMSHEvejBCcm1CQVQxK2VFOFNMWlRGNnpDTmxwK1duK2JkdmRp?=
 =?utf-8?B?a0dpWkxhMGxhaEt0V3JFdWw0YU1uRTNlbWJvdHNSS2k3aFJsSThJbFpMSXVW?=
 =?utf-8?B?azllbjJHcFJrK0diQzlHS2tuYzMxcC9KL1NvOEd2enZIRjRhY2tRa1dpSlU0?=
 =?utf-8?B?WHUyU3BpQ29pN2RkalNSempISktjQnRpSXhvUmlieWoxdlMxblJXUlR2dkxK?=
 =?utf-8?B?MEV5VjRkZVE3bEdqZm1NenBRSlBORmNoZlVHTDJWaEpZcTNwV0F0bDByUkQ2?=
 =?utf-8?B?OVRuSFN3NTVFR0UyanZ6ODdjREFiUnVOSG5BRUdXSHF6cUpDUUNrMVVocHNE?=
 =?utf-8?B?T2RBYlhaSmhFbUQwOWg2d20xRXJJdWRXR3BoV2s1NEhpWFdzVXB1eEF3L0Fj?=
 =?utf-8?B?OFhZN1BBbk1raHBTLzR5MGswUnVhUjYzdkwrK21qTE8rUHhqZnIzSGhzNTJm?=
 =?utf-8?B?SHZCVVRzU1pXWERkb1c2aGhBam1kcmFFaUlmS1p5ZExIK1M0QUFjU2F5bXMz?=
 =?utf-8?B?VGFoM29DcGpKaWVRZ1k1cEV0Q01EbFhQanFKODloUGR5SWVubGlFUXFzVWxS?=
 =?utf-8?B?clBxUUtyOXphSWpQS1lYSllnT3F5eVZ3SDNSWEFXU3pkY2JheE4vTUJUSzc5?=
 =?utf-8?B?VFdhYUx2WEFGclRhZGt0aUt2V1MzbDhtejBYV3MrekhuRzNwSDNiOThBdFhl?=
 =?utf-8?B?NnVBa0wxQVFSTmxORVdNQis5TnNWa1NhVWJVd3Z1dVY2SE5zbzNoby8rb2oy?=
 =?utf-8?B?VExwT3J3UXpma3R5QVY5eTBJTXA0VlJhbG5HQk5CSUcvZFU4cmNwNzRYYkp4?=
 =?utf-8?B?NVk1bElQWnhZSFQrWTh3S3NUY3l4dkxjYW9RTkpvUUEyYXhuQ0ZHLytGNjFw?=
 =?utf-8?B?OGNUREIza1hodURFaCtQODVMN2t5RERuVElUQkdXSGJva3FzUDlRZXh5T0FK?=
 =?utf-8?B?RGVXRkJrUzVrT2ovdEhHUWQxL0kwbHFqTTVVN24wdTA4R1d6QWdsNHE4L1Zv?=
 =?utf-8?B?K3dpQUlZdEhBL1JHaVUvWERpQ0U1S3FvMktwT2ZEbGFqSi9MR1Z4WGVFMkl3?=
 =?utf-8?B?dFd4MnI1eTRVUkt1TExHV2lNT3hEeDgyU0hkZStjM29pbEtWZFFhUWVCSU5C?=
 =?utf-8?B?dzdyVDdHMmhKM2ljWjdOUXZsck0rUkk2K3FleEozOXZpVmhRSzBqWVgrZUNj?=
 =?utf-8?B?VlRiMDVTc3A0MzR6ak84WTJ1cnMzeDlXdmY5cTdZajJUcDFpY055dmdzUGht?=
 =?utf-8?B?QWFBNExWamVZcExjaWo2R1dzU1hQUlBOMjUzWERIU0RRK2lGTzhVQVkrcjll?=
 =?utf-8?B?NHJkZGpBSWFpejY2K0p2Uk1lNFFna3Naem9pd2MzTmdzNS9xWTlFQ296WDZ4?=
 =?utf-8?B?ejIrMzVJcEFFSnZaRUx3UlJTa0J4Ym5Pb1JFRVBXR2ZwZWhQRzdyeEh3ai9J?=
 =?utf-8?B?UlpUNzI2bWtiNzlmNHdnNjFONUhkVmNVMW8xNmVjSFFHcGVvb1YyUGx2SmVz?=
 =?utf-8?B?SzVCd21jQ29jUzVYckR3d2dRa2UwWjlJNFhaWXB0eDNyTUdiMzBvSWNFNFVY?=
 =?utf-8?B?WUVxYmVwZGlEdGpVS2U3eHJHaldLT2RMZk9UYUJKdjNlbXpPdEdkZFpzUzln?=
 =?utf-8?B?TDNiek5rVmhVRmRJaGxBeEhxUXp1S2RBbHo5TXdxOG55TXpQWFZUeUtiYm9C?=
 =?utf-8?B?Y2lac2M2cERHak1ic1ZHYWlHQisvVVJ1RDBpekZLMXNPaDErYUJ5VksvZEl5?=
 =?utf-8?B?eWRiS1dXOHJmaE5ENFVodmdUa043VFE4b1BlRldlY2dna2orQU5ZUFd0TWRF?=
 =?utf-8?B?NjVUTXNNZllSRk92bVgxMndiOGtUOGp6VFo5Nm1pQ1BNd09SRHZCNUJQUFM5?=
 =?utf-8?B?MXN4d1ZGREY0bnYweFdqYVY1RlNmSklSYWwxejRITVVPeHc0THNuYTliR3lo?=
 =?utf-8?B?Q2FxNUdOZFNlUUUrKytaWXlXQ2s0Q29uVk85SWkzeHdmMlR2WWNNaCtGNTJs?=
 =?utf-8?Q?E5p0O98RXIv+STzznGCqMrbL1m0QSnfej35eift5KVGg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ad37b8-ca78-4697-b7ed-08de27d2216b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 01:14:19.2122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0RHtFfV8cxuNR4gBniRCr/6kudxcvIJjv4ZTa0f8/fm4qP15PRw68+N/WdPZjsCBNAnn1TpmhMnt4MzB9kAew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020

On 11/20/25 09:35, Balbir Singh wrote:
> On 11/20/25 08:26, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
>> head:   102494e6776f316b6cf2924976681d790f278cf1
>> commit: 9a655bd0773b41af6d8515502de102544f3ec4c1 [169/175] mm-huge_memoryc-introduce-folio_split_unmapped-v2
>> config: i386-buildonly-randconfig-002-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200534.o4hsMNEt-lkp@intel.com/config)
>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200534.o4hsMNEt-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202511200534.o4hsMNEt-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> ld.lld: error: undefined symbol: shmem_uncharge
>>    >>> referenced by huge_memory.c:4053 (mm/huge_memory.c:4053)
>>    >>>               mm/huge_memory.o:(__folio_split) in archive vmlinux.a
>>
> 
> On first glance it seems a bit strange since I did not change the use of shmem_uncharge, the
> computation of nr_shmem_dropped did change. I see the config has CONFIG_SHMEM not set, I wonder
> why this triggers with my changes only.
> 
> I've tried reproducing with clang-21 and the provided configuration without any success.
> My command line was CC=clang-21 and LD=ld.lld-21, but I am going to try with the script mentioned
> 

I've done more testing and followed the instructions provided to reproduce the problem
with the provided config (CONFIG_SHMEM=n)

1. I cannot reproduce the issue with COMPILER=clang-21
2. I can reproduce the issue with COMPILER=clang-20

Turns out the compiler does not like my change because it can no longer predict if nr_shmem_dropped
is 0 and thus optimize out the call to shmem_uncharge(), which it did prior to the change

Looks like I need to use

       if (shmem_mapping(mapping) && nr_shmem_dropped)
                shmem_uncharge(mapping->host, nr_shmem_dropped);


Fun times :)
Balbir



