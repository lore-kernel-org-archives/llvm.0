Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1663031BC8B;
	Wed, 17 Sep 2025 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758108141; cv=fail; b=t70Xo6MZt+g2gQUlcsHI+XYYsY436XXLWVtW3XvDlpTlg/kngQz0VNxGVySCBQ5PK6gJlZ4PVBZcsD/wzosDSsvNcTWU6/EpRalPLBZ/8dzmCFspnbp7OWn17qJPNQT6PNlPcibS36sY+CTGlMz0y9fxIylvr13e7lWYVluSO3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758108141; c=relaxed/simple;
	bh=7eHnUR9Nm3XjqhgfHq/iJU3cx5NfglbEkKCJ0yt02/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jAZl6WdD20xg0PMwadi+bZ8dK7SQ79CadKq1AH4p53beNYkYPOvFDsZYirgAXA+rc6uxvbdtjSDloiJiJVONEtqbcOL6Dz4xdQDfQDuuNvwpuFocyq8DLAj3ICqqIcX+OjA1VXCp4cWHRqv9hdHzvo1eUuOCMLKSmuht0t1+jO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DnOeOSjn; arc=fail smtp.client-ip=52.101.52.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DnOeOSjn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCmJFIn6vBHNxEtmCwCqztI6Qw17Jcu3bZoNg53D5P4/HQTshoxa/KGDE1OWk8w0Li6NCp6LnaOHW4i64BffspRXXnxMNbVRRDhbSE5HNXyefft63jmNdBTckutcV0lKkb3ONQ0zelpj4CFJY2YobAfglsLuyAAiG6a73KRRmIkvFDZUW1+IGKrbpNSfb9HgQliIDjDGupOxHtW6RU5k4EurLqhPPZMrftf2ZFkXMAHs+YEXEevExQ2r6NHozr9lphdCc53InxEEOMkBhdRITPjSCotA7W3FdAT2C9yYjuQ5FCR+UOg4cwJpPNYrYW2v0RvK6oeMVw67sSQtZnKq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vYitWIGmkY21MEJR+0fvYhDaOe33OmW7aooJ+Xx84w=;
 b=krXYf9SzaL/jSss/PnSuRAreMxGo1JAhZJx/wpR8ab88ShML6Zs4BfZYESw45WU9UBA10k6xRAbjmNSdCCvMscw4jWOB6d/0G7UycS1S4y5lkA6gBU0JccPKeVf/xa68paacCkzKNUEo3LlGr6yTlOAsip89g6Qhw170JSH6ZHbY72xtuNKL1HLg45rkG+HNyvXHFcgl66Y5dwfwcov6biPA4hOIZG62Cm/ZZDvDY8JBMXz9dN+MbX6oZJjNbVlSzBATskX1RxOJX5Jh197ZA/GYD414pqhRt2MlkNhs2X7vlegcMZWMLrxBsBGL5TVtzeQIYAdQWOc/3e4zM09cwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vYitWIGmkY21MEJR+0fvYhDaOe33OmW7aooJ+Xx84w=;
 b=DnOeOSjnqsc/rkOZnU+vxS4ZIdlkD/IR64EJl3/niqrHiFIwERk7doJ487WOLjPU5kWIcySe3AzEHVfGKTe1NgfoZSEBpWk33epb5t8KCcq9Pmafj0pwlw10rP6cGBIprHrPSKbFWgQkc/MUNLnWtCqvkeX5W7tg/fR4wnIP78y2GWoBmtJBM5UVQw/6jtfddx6kcdd5NmiZ+VH+zuGpqOWBc8vKevkmv8QsH5eVVMtUcKr5Prr4ikDcY0WcfR5rMwASZugDpQMrW8DWVQ0fvDXfVGgGnUx+OtrwTbV1spl7dXeeUJUHKAoIIV8S8omg994Qy1obYLwectk4TccYrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 17 Sep
 2025 11:22:16 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 11:22:15 +0000
Date: Wed, 17 Sep 2025 08:22:14 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Oliver Sang <oliver.sang@intel.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [jgunthorpe:iommu_pt_vtd 8/34] ERROR: modpost: "__udivdi3"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Message-ID: <20250917112214.GY1086830@nvidia.com>
References: <202508271856.ixwxgh3g-lkp@intel.com>
 <20250902124856.GE186519@nvidia.com>
 <aMj38M8HeDSQHQPf@xsang-OptiPlex-9020>
 <20250916141256.GF1086830@nvidia.com>
 <20250917022043.GB3106929@ax162>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917022043.GB3106929@ax162>
X-ClientProxiedBy: MN2PR01CA0064.prod.exchangelabs.com (2603:10b6:208:23f::33)
 To PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SA1PR12MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 502f82f4-7cca-4d7b-2e3a-08ddf5dc74bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3SOguMtfjFcChZDEDhabzJhkcRcYQtAWZhuNjLuT50RUTtteCiLwQE4WPPwX?=
 =?us-ascii?Q?tvDruOBcvN7Dd50hW2OsP+9TCwGWZqgFQSngSg6U9xc02fH9YC/OSa3sglo0?=
 =?us-ascii?Q?QfKtVuqG6MnPs+R65tQ5hQbkNl9n+j153/oRjIprmp9y4rMKOiT+Gon/mkfB?=
 =?us-ascii?Q?gMbimFSBYtfzWR8uKFyuVnccop2ivWY0z3Z1MovScUKzvvvcWLdncbqfAJAr?=
 =?us-ascii?Q?5ypfp8dwnzk+YtXUXDOIEs0h89hRBELivPC7zaqcIulPr5Dec47r/MQNpHaR?=
 =?us-ascii?Q?ddDgRckv0Wt7DfKf8i7jNehxhwwunBXgCKDP42fj8IppoPOhKn8RV2nqNtJs?=
 =?us-ascii?Q?IKTs14d4GOfMP2lerTCAhMeQ1YukpKuDjnmCwGBh77jZoAlhs+ZwFjwP8lBj?=
 =?us-ascii?Q?D8UU7p+cNQdaKycg2LGCkH99QPB68MfUsYdYw+bUmInY/8kBlaid+Smwlmzj?=
 =?us-ascii?Q?aqqr/pw0uS/TH74UrfishXlrI+Qh5TzRU1XH7TFwmhueZuLszzPjoWcx8B+a?=
 =?us-ascii?Q?Axh1n5UA8ILpnP+P+Ld7mEfgyW/9IhOko6YXK9eq3f9AaJlkPNj9uxgUg7TD?=
 =?us-ascii?Q?kWMx5MLu4E2381rsE2nQX4eRTfIqzRP4lOymHewL9tMrebwMqG6HoSh16EeR?=
 =?us-ascii?Q?N8LysPkUH2TcUF576pAiSKeO3BTVmql20TF5zP1ZKLQPPyp67EIdH0fzZUNa?=
 =?us-ascii?Q?aCnSMPTlw1kLcwD06uxQSRnKM5jCpZpF4Hy+X6T7fwJ2VDFBKFnY48GbBB1v?=
 =?us-ascii?Q?ZPEd+pcUafncwynBBh6DRrgAOiSA5ZfcRmKMIXOrKZx8vXztDGCw8YTDUC/c?=
 =?us-ascii?Q?Xlf2vK58gNXBb7lJDDQVV16jRW+7+YFrr7iaS7agmWlspsvM0WQ2M9J7CPwP?=
 =?us-ascii?Q?GiBaDql+hIfd7UYRVQiGdsRijrClSU3SjDTL1UwTvBw2UKKC172TLC7loyiq?=
 =?us-ascii?Q?HzQ7/7yxBFxyhbNrQ7z6nSQDZq2in5/0uJyurLh2EPa1Fq04JjrR+bilvRnG?=
 =?us-ascii?Q?cMFw6KVrSleD782nOiBqalHONBS5qVy0wgPjrWnUquGA2RGH3tIuAo2ziG/d?=
 =?us-ascii?Q?1dZLojLhWxnQ3X4BO2iFsdC34fPzQ9E89hsC3d5jeiVc5511APGbrOvytigz?=
 =?us-ascii?Q?oeRUZAHSIv8tXZL7NkkJPkMhCkmtGK3CNuTGRByX5FUKUhrhC9KmPN1CbrT9?=
 =?us-ascii?Q?6RfkKdQ9ZcL2yQ4CD3IytQ+c9XctWbIG8vfxKalVIb7ozQjLDlpCRsmFSBhW?=
 =?us-ascii?Q?7mbEGW0Sum4Sf5KBebs8jgEnlxNotNVrW9FW9yxcvNYAzqBHTGYt3UbeH6RT?=
 =?us-ascii?Q?gHISaVTMnD9GUHgHinehYy40aI/YwPmJySPjyj6EJWnVX1k3U1C8M8pVzLlj?=
 =?us-ascii?Q?8THtDG0962bIIanjuyBbrCmvSvUp6bACIYxC4+aYQAb3bE5dmMbRsBDxG+gH?=
 =?us-ascii?Q?8tFYqmllTIw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lSJh/Ck5L0ss6HVKg3Gf9N1/QSQ5Pe0skof8xLNV8xAb4VvixGM5sHrlaOb0?=
 =?us-ascii?Q?YC76HbTeOrdikMd926AGLrzihuYbutvbYZsf/MCLkuh9bXYYIozgjrWU5rmE?=
 =?us-ascii?Q?38l7+kATRiNhmtTno5OCUJMNyzFW1IqFBVSkAdUybl0fk6z4HvISUevsd79j?=
 =?us-ascii?Q?K04ou+AsTQI7kZ9CCvUgaLfuJam9SvrMUzaMvzIfwvf13ZlPEdAbyUyLmkHT?=
 =?us-ascii?Q?6CRWOKS4HQB9aUZR5NW4Wty4d9AUZm44v6xv8OkfhwUsaChYp4isaCQsfXIg?=
 =?us-ascii?Q?OeT3Z1ReLXwmjiFUfEduUKEO0jWZlElngAdAZ8hQ1mHkV7vpoLtis6kBTshv?=
 =?us-ascii?Q?d9Cbx/YnjXtmylGwxFwDhOxueCAzkoDgBt9Z6xXYmQNZyDeKUSDSuoqrvTOd?=
 =?us-ascii?Q?6c+NisLiUzJeb36ZmPXHVpBgz7xB5FP4ug8pZyccZ80wow4JrZvkt8g0J2nX?=
 =?us-ascii?Q?QgHtzVuSptg9l3Yjgrz3c90dcKUeRQJHTSf4jA4v8bALfcDCFzm0iSXMWMDf?=
 =?us-ascii?Q?sSxroEmOqesGGGT5Qq73Mhul8dcDiMB1xoeHBpgILlrFWbFLkOvVk+zBuxXJ?=
 =?us-ascii?Q?4Wh6wAk+QSyanazcb8OUuaWxvtrxi/wtey73yrITnTZFjJ8S/KjWmZwKs9R5?=
 =?us-ascii?Q?BuVDslCg9CavWasrLfZgvPcWPPdOnnvHdOC3qykaWGrQjnX4PyjA7I08rheT?=
 =?us-ascii?Q?exXk5OMPvLnThTWIMWcuYpD6RRwwvU7IRl/dwoJF/zGWxlMXg+Fo9co2oWcM?=
 =?us-ascii?Q?tCKfoiRQw4hFDQjzWZQOeD7RRxr4iQqn/nZIH4nfxJUFD/OWRIAmjS2x/BK8?=
 =?us-ascii?Q?YQHlRg+XbuDF2dRZHfOS45WqdlyJeNlVXE3uguXRJ7fyk8wON/5lQUmYSET0?=
 =?us-ascii?Q?BCdi/MORF5LQeOjy8sll5pl1Juu5uKI+7srbHSKiPAKWrcQtvqEo5T/mY+G8?=
 =?us-ascii?Q?qCZf2nxfxTAh4GUvWX4PImf4Gy2Gu+5aCstG1+6AVA//zUXeI62+MN12kobo?=
 =?us-ascii?Q?YLtsIK5LQOM0T23I8aLFoO8CHDhLXZtNJTgnXiPGwho/rP353OrPDwq4fLKy?=
 =?us-ascii?Q?KI9Rz0XvBkJCHjugCzqSG19j/+212diIqWEhM1fKeJmYLc1ys1GPW3+oQ/Uy?=
 =?us-ascii?Q?k6JNY0GxUAU47OXB7Ky9/lM1hmjJkd7ZQ/tkxw8GH/+p4tdWnh9sxmmmVuCp?=
 =?us-ascii?Q?sRV4tVsI21GOz7uA5rupE+50HyPP54hgU+f0AZBdYPffMbYo1ULgs6RCuLil?=
 =?us-ascii?Q?NQ1i6cRqw++6/qoTXQOoL2i3rRsYMLK5lV5J/Mrwj/eTTDxAebMM/Szc9P+3?=
 =?us-ascii?Q?urjQXvoCs74TJ5/kzpJq46ar4isJQRVKffTHGyIRfdQbLQAhj38uiG18SWnb?=
 =?us-ascii?Q?p107050fYa68FnG8Lb5QeH2D+zPTTnrB7Ow475WNxc/10PSHF2+tK3Sd/eaP?=
 =?us-ascii?Q?NesSU2jv7glhuYwnGQd3un/0jUwqpnO8vB4ppbLH7152o0tgvLFqE4Bd2sAl?=
 =?us-ascii?Q?e2ppPYWiDut0pXs7f/+n80Vv5DtcRn3DTxQe9Lmp6Nh1fFeDFIW0OPGxGhJy?=
 =?us-ascii?Q?Ump4Hy71rgk7m/ROezUcG2QB9iEJIyPwXh7dmB2K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 502f82f4-7cca-4d7b-2e3a-08ddf5dc74bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 11:22:15.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4wAjaooHTEb5CHhej91HAkMkmK8tDAlYTFrmqLVS8qO4mJTdQoK17J7MhT3ooPr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7366

On Tue, Sep 16, 2025 at 07:20:43PM -0700, Nathan Chancellor wrote:
> as the bad commit, which certainly makes sense, as C23 made this GCC
> extension as part of the standard so clang needed to account for that.
> As far as I can tell, GCC did the same thing in
> 
>   https://gcc.gnu.org/cgit/gcc/commit/?id=3b3083a598ca3f4b6203284e01ed39ab6ff0844f
> 
>   "The standard feature gives all the values of such an enum the enumerated
>   type (while keeping type int if that can represent all values of the
>   enumeration), where previously GCC only gave those values outside the range
>   of int the enumerated type... this patch makes the change to types of
>   enumerators unconditionally (if that causes problems in practice we could
>   always make it conditional on C2x mode instead)."

That makes sense, I did not know it had changed like that

But still, I'd expect the compiler to retain the original behavior
unless std23/gnu23 is specified given that it does change codegen and
causes errors.

Though that is even more perplexing if gcc has been working this way
since 13 why does it avoid the udiv..

Jason
