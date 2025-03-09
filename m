Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F41418C011;
	Sun,  9 Mar 2025 20:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741553259; cv=fail; b=lxnaoZJI0fCoAjn/COLYjEP8ExJtp08fHDY0pLYUIM2BN9nKo+vVID9D/e7d5FYhRVdBB/iUxeHdpjSBUrqj+KeCCBlVQ3dbwh+9JsEw1UA5HliokNkW5mTlPgCPSVXWofwQv+0fRWprwlpkCDkTidCbhNmIcP0XoqnMnUNRFmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741553259; c=relaxed/simple;
	bh=AXLGQmDT5D2Klt6PtuZOsjPmNtbJ3t0t0i6EueHhhq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MqkkjTMdYYwG0OxR4bT/JX55/aqZSgB/jO9llQRt2pnVjO1rqx7ylaLPj6pdvdKYN0PLg7JHUYw9XJUINwqhPfhsaac/jVdIfAUoa9Pv9x+E/fUT08fLQo1zxN85DU++ELVcjvbLSxM44wxFHn1IQ821WcHlQZIuMspBdw3QUIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jyZDD/aS; arc=fail smtp.client-ip=40.107.236.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jyZDD/aS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y433uLMnI2rVI/JhsrLjtOS0vlTUSJpoMpgda6/ELs/V/fmVacqM6a1LRNTb7iPpJ8RArxLniCu65j4ya3794UQs3A/KxdJjF/rxEgEGY6vv3+dp99fkHarA0Y1oRRM9WxNIMbQB2UJ9klIL1xZk5fj1XELyGVzZ1A69cI5T/rCYj0h2zNzvGvbmDfGoB1qxr0MqHzv73KI8a5FO0YLdSNNsxcMY2aKEHw6wNH9oUq5/MwAD8MIFHAL3fps07eQeORpTXWQQcgl/7eDX8NxrD8269BGv2m3PZ5sc4n9qRyAp+ujv6U1EHtwm8SnK0kiTSv21pham22DRG9tW8buKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qE0Hx9uqUFJiAgmDq77d3OhlVwtbvgM7ToZN3G3rd0=;
 b=wEHK32kCtIxKpZfvQlnosub/pAyESYsiN2ugq3GNuJhluv4w7rsavk289d1gIt6QVwPnKGVcdGKg2vNdE11OQYnyBgDafzvfIfpPZKbRbMn5XYssKOQ23ojDrh+OToM/RSkUWStsTOt+Pt38OaDKZcEo/m/oOQInQmpCOzakcGF7hIp3uBVlcVMKslli/waCCvDukhjTipKIQ1W5BbmCC9pSa+murUtDkio5LpiW1SiNzsPhSpGkMTcumn0W0awhEhtAcFDrcw79tdvrxnvIPL0PEZaEiwxe9O55L48CyzO6GOBGnspYL2vVqrLxkyTzRtBRsrDuDG3MkvE9EDjvsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qE0Hx9uqUFJiAgmDq77d3OhlVwtbvgM7ToZN3G3rd0=;
 b=jyZDD/aSKSLnM5f9H7dcB15yi09ppBE3BtQieKp+K8d7EX2SGQODad8NLQAkMriMfCgD6QYydd2di1IHcQSeJw/BXeaM7I0XXAGwf0E4xSsC8VLRNCCOc23DbfpHOhR+O1IncTiJuMBHdA7Y7O5cXh17eRSy/EnmvIE/L/2B2Y1JV7Zau3OCYPHD1N3aJxzqopN4oPpxaAE51tSMSefm8phVTMjQ6IVzWS3802RzsJjGxRwI9qyQ95ps6jqU37AVSOk/om09EhSn+3iymq2FRl5wGK1vpyDWyVbrvNlzhimZAJrmvTbGgeXh7uOhtpBP4L80q5XjXVyanRuE9ilfPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CH3PR12MB8510.namprd12.prod.outlook.com (2603:10b6:610:15b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Sun, 9 Mar
 2025 20:47:33 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%5]) with mapi id 15.20.8511.025; Sun, 9 Mar 2025
 20:47:33 +0000
Date: Sun, 9 Mar 2025 21:47:23 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Tejun Heo <tj@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	clang-built-linux@googlegroups.com,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [linux-next:master 3203/9634]
 arch/powerpc/include/asm/bitops.h:126:26: error: constraint 'n' expects an
 integer constant expression
Message-ID: <Z83-WxJsAN53G6Pj@gpd3>
References: <202503090435.wITkzD2e-lkp@intel.com>
 <Z81TSQHHaNq_Aj4x@gpd3>
 <4967dc7d-dc87-48d9-a44d-2d667c2841f0@csgroup.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4967dc7d-dc87-48d9-a44d-2d667c2841f0@csgroup.eu>
X-ClientProxiedBy: MI1P293CA0018.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::12) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CH3PR12MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 20360160-25fa-4aaf-d80a-08dd5f4b9dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+fiGtick91AODN9gbRNj5lBvLXsuZc7zDr178mmQNXajjP1fp7XxSfYfC+Na?=
 =?us-ascii?Q?NI0AwN7NthV3pGsdN7egi3IobWWA0Ho4Xe7dYtZK77H3i5ZNilHD69zfhNxS?=
 =?us-ascii?Q?+2VpoQSeS0lg9sUIbEqByXzs1Qpm5J/DD3nVAoiM7eoB80gSeX66upWd4O3L?=
 =?us-ascii?Q?d4TIo5mdLtpEJ5CW4YmMc7Q0n1KVG8crPvQYZ6+5jViDq0IWiwTY8kdFdcM0?=
 =?us-ascii?Q?wL6HbHwJIOMEnHx3w+t8G83nAw3UgzusH+KUicjadj4a7U0TZMdtkOd5l3Vx?=
 =?us-ascii?Q?GEPfSbQypLn5/o8mZhX/9LmU7Z4fQgp8xhlYx0ECp3zL81h4PIv4e5fBalrc?=
 =?us-ascii?Q?zJZXNW6CHnndL2Z49lQxfqGnUnp13/iQpt7aP3Ogj2Rq1K2MG5DWfPjsKyHM?=
 =?us-ascii?Q?Y7lX7nBHAFSi1LckUmyFWWNAhwKPkMJ/Uz4yO3PJAqUsvYQX8Xv99yDSmbo2?=
 =?us-ascii?Q?ICx7qYTswA0244F38/KTaeXpWg9ajE5g75wrcTEytA5ZfBA8U1vm3CzGXcUz?=
 =?us-ascii?Q?IIum3DvGPcPrEIe/CcVXpd3+fnWVQ8zGZvwy3LU9/IbO5aWejQAhVDZeJBEP?=
 =?us-ascii?Q?ncBE7LpuYJpGwZJ7fnWzWOfqNpmJyk8H0mRu9J/zuFcLBA0AYucMfHPy3OUp?=
 =?us-ascii?Q?X9nCwzuEbE5Nya6CrifVNE+dMOndpxgJ0nI40rXdXRoyMVCmm0Tipw81dGhf?=
 =?us-ascii?Q?uVPQfolzjjKXPR/mBjunDoHNdRbx6El4yBPZZopgKxbjIyz6DX6obbVmGKD0?=
 =?us-ascii?Q?pxx7sUvG9cNb+nkVlzW39S/GnvJEDecsxRfuJSaHl4nVGMUu1ZfQbjVtnZDT?=
 =?us-ascii?Q?xikfVmNWIxP+7BPFsavJns7QlwmQqjrn73/RHEhUpQTuMJZ5oevWZgzAkC43?=
 =?us-ascii?Q?BZb539Smgk18hfOgR9iCl8CUV8hnDcNrDVx1yA1oN8iJLWEgsbb0cO7lboQy?=
 =?us-ascii?Q?eiSIKtwItJSisO30wYS2mZW8MjGm42Wxg2xFRvEneHumQrd3rOIykut+57SM?=
 =?us-ascii?Q?RFNMF1YXnnqzgs5WQlV+fHqfZYCYE5VhddXS1GZX+qKvj5/u+IbfviW1QQ+P?=
 =?us-ascii?Q?JFVZMDYpu17lRxTALyyZjqKIYKKZ8gSsYMzwHofURuL00itAqFoQ7jqG0b8v?=
 =?us-ascii?Q?UV/5v/+Y2gdSEIQ8GrVlTmDlJ0npn+lKNtYiRrIAnfdnnXM1u3W/X6v0d2YC?=
 =?us-ascii?Q?sIICF344UyA0Qkl8P2ZHpunjiLQP2gH6trRNHVv3sODnQVStB4G2ohdxWTRT?=
 =?us-ascii?Q?WTYglUvanyZV3tcu+WIf0BFe1uveYH7xvqZ53YYpAmezJSUZ014Q6SxAzBTA?=
 =?us-ascii?Q?YM3kB/YTMiO9wwPeqW4zPI/RVbqm2dpYacS5k/aK11jZvNgVSettDokDJwOt?=
 =?us-ascii?Q?r1jbjR4DsE/eR1yZ2J0yl2FRhVS2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V9upLsecKWYo/INNhq1HbQWMvZHReOLvQBEh6J1XpyGgNFKWQe17E3xU+/rL?=
 =?us-ascii?Q?KK3yalQrwuUCRp2jBVt6rtRVDY0ma0fzXJ/LxXcRH+IL6HrtONuH5ozE1iQK?=
 =?us-ascii?Q?m9f30dsAYnVWrF5BHMMWlcZCOPxzWfyXEQWxMjQj5jyhZFXTvtQgVdtGqXGr?=
 =?us-ascii?Q?tVUkmmu5aKak1WJL5yVKL5I6OhjVdFKrESNNPOMH4SIuGTn79cwNAggtosAk?=
 =?us-ascii?Q?FoXjb5VML9trfQJZ3FtGnTM7hAcNLR4S5E1reQQn9aw1JtsurakgCbFRisr1?=
 =?us-ascii?Q?sGGMJeK0+9Ly4ihBHCQ44uRj2c52+OHAce1NLGHzioss7w75Jg57gEapTFVs?=
 =?us-ascii?Q?A+SbVSc4MVlTzrt7w3R4s7sf2OLsF2ONfwEoJel2HyD79FTKjmXtUkbVfxRQ?=
 =?us-ascii?Q?Onu7c/bPyx/UhIL5ZnMGmBxcxnn1xxyBOaPo9jd2NWk6t8nPBnNnKu4drWjM?=
 =?us-ascii?Q?Z1THQB8ztvfMs1LrbabLk4GtiUTAxFFintYOaoQ9Y7NJO/eFZc0mfnad6gDp?=
 =?us-ascii?Q?bILHdJHec7PbbhoFnL7yj2x8D6JZIA2lKEop7Vl1/rQVCKbiisDkqkbHmBzw?=
 =?us-ascii?Q?FyjatkyXYs4aBh5CWULohd9PNf7+wMGDGTdlD5N9pmeOsq3i7eC9MsICjNUn?=
 =?us-ascii?Q?A+wnoJe529Q5cFOP0HON9E0WPfuFoQ4x8G83/QuGzuLfVplaK9lrBjHSJWST?=
 =?us-ascii?Q?rycOUnw1GzdeZG09T8d4jchyCAV/+3mVK27KolRBdTsctBUvwnpVnpEoZxNc?=
 =?us-ascii?Q?U+A3N1gLyPp93xxaLXPAptZ8uxzD99iqW1UnDJKs8zvPyd6DK32uqweIvDf6?=
 =?us-ascii?Q?CM1cH6v9Lt3GYccu7J8IRdlowDMLT8r0NJIdzcOmzx2unq3KbVjsz/zt3khK?=
 =?us-ascii?Q?IJN/OykcVGXy2W2HSOdqasrTqk7H7ZnhTrPJ3EGV5CETSkfclC8R4ey+ilBi?=
 =?us-ascii?Q?YAK/+g19DJtEyz8ZANHAbl7mRyw8QxzNpatCvrob8ARQ3wQqdQeRGgR1/dZq?=
 =?us-ascii?Q?3Lo9Jjo0M0QnEXsvlJDaCZMYfxM3GhryT9BkeiYm8uFcRNNMd2bzE0ZUjYCy?=
 =?us-ascii?Q?o7iAXiig+Dv8wD6UlwIYzB7dfUhvu6gcVquulsXYRJ3Hc9kF2tEuanp4cmxn?=
 =?us-ascii?Q?lRgGcyQgCJejyaYdGpD0sjTzGpYMN2QoMojjqlhZ167K3kfSCug8L3YB7z/J?=
 =?us-ascii?Q?B7MSNK8fPqc/+g+ohNundbZBh5V5E03qmqqu+ewauRerrRJMjq+cjzCIqYbX?=
 =?us-ascii?Q?Erlq7JvT/Us6y1PjPnJ7xrQ6SqbM6USTKmfMUt7OKVEAqOW4fbazj0YbIUmQ?=
 =?us-ascii?Q?7USs87UG5EWWY8r79c+qR9/Q74bVvOiRI68c4mSTXmsLigDAsamAjiXW/nzw?=
 =?us-ascii?Q?m5MWKejVXgHRvmT9gwoxzjpauoDA1b835eHNzRPtW3xUpFrEe+vqv7f+g6+e?=
 =?us-ascii?Q?9u10fz898A0NZLKcU+my3iT8GpgxhLJOJhP4rJPyODyA5t4LAC93FfOEpp7o?=
 =?us-ascii?Q?Sk69z8Iecj5pyCMnC4YLMp7Bobr9vuZuiyGVCAzSLg6dJzMflsrnzCsObV7t?=
 =?us-ascii?Q?I0YEI3HAEw2Rv5O1UM2H4sP967ij3bQr4opyvQBA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20360160-25fa-4aaf-d80a-08dd5f4b9dea
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2025 20:47:33.4250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVTBr6BWDP5SNZZSlf+N32uNVU0IHLJl505BUngVt1Yp3+JzYBoX7OUeKozlbwBUTCiTF+BnW5F35OkOCUjRHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8510

Hi Christophe,

On Sun, Mar 09, 2025 at 07:48:56PM +0100, Christophe Leroy wrote:
...
> #define DEFINE_CLROP(fn, prefix)					\
> static inline void fn(unsigned long mask, volatile unsigned long *_p)	\
> {									\
> 	unsigned long old;						\
> 	unsigned long *p = (unsigned long *)_p;				\
> 									\
> 	if (IS_ENABLED(CONFIG_PPC32) &&					\
> 	    __builtin_constant_p(mask) && is_rlwinm_mask_valid(~mask)) {\
> 		asm volatile (						\
> 			prefix						\
> 		"1:"	"lwarx	%0,0,%3\n"				\
> 			"rlwinm	%0,%0,0,%2\n"				\
> 			"stwcx.	%0,0,%3\n"				\
> 			"bne- 1b\n"					\
> 			: "=&r" (old), "+m" (*p)			\
> 			: "n" (~mask), "r" (p)				\
> 			: "cc", "memory");				\
> 	} else {							\
> 		asm volatile (						\
> 			prefix						\
> 		"1:"	PPC_LLARX "%0,0,%3,0\n"				\
> 			"andc %0,%0,%2\n"				\
> 			PPC_STLCX "%0,0,%3\n"				\
> 			"bne- 1b\n"					\
> 			: "=&r" (old), "+m" (*p)			\
> 			: "r" (mask), "r" (p)				\
> 			: "cc", "memory");				\
> 	}								\
> }
> 
> 
> clang says "constraint 'n' expects an integer constant expression" ?
> 
> The only place I see 'n' constraint in that macro is the '"n" (~mask)' in
> the if __builtin_constant_p(mask) branch. As far as I know if mask is a
> constant (~mask) is also a constant ?

Right, that's my understanding as well.

> 
> Must be a clang bug ?

Possibly...

> 
> Maybe try with __builtin_constant_p(~mask) instead of
> __builtin_constant_p(mask)

I tried using ~mask, and even tried to use just mask throughout the
entire macro (although the code would be incorrect), but I still get the
same build error.

The only way that I found to fix this is by adding
!IS_ENABLED(CONFIG_CC_IS_CLANG) to the if, which isn't really elegant, but
maybe it's a reasonable workaround? I'll also open a clang issue in the
meantime.

Thanks,
-Andrea
