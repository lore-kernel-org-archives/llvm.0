Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012039.outbound.protection.outlook.com [40.93.195.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B9F11187;
	Thu, 18 Sep 2025 00:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758154059; cv=fail; b=e30RdNjpt3lF+vYe4wEqblZUGBfkduEZusqMWaWSEg8GKUaSuYRCo69cuB0BjfUSMc2jYsYflZbxZOjmfY8YfYDdtRxA6BgGNtmKDE4ClwoFiyAOWsrBVA6pJaLROzsSjvW7qIoyLsr9g8E3xPqXCs0KkYv7uJJ/ulc5DVx5QWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758154059; c=relaxed/simple;
	bh=bCNq647ZOwRKmjQG6GErgwfd+svpnYZFzw4BcRLqX/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ruCA9UnSDSTiPxYwY+WSO07zpm/AxjMfcXKIS1PQY800CMNl8w0wnhfAtr+QAyPw5u6ufHmEpfGnCpEK/RpzZFt2pYvZ1r3jOzqr1MAFtPvf/Xv7YQqIX72vce1xJ88Rg4JWO/XnYlWaJH0iWAMir0q7AMGfRDlXb7wjE+6UuEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p+/L5ze+; arc=fail smtp.client-ip=40.93.195.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p+/L5ze+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/UwcLcAvWUIeJxajeLtTSdmpWROdxGNjHiY8iveb3QVk9gOavoYulvClrsXy/GR7Eor1I9XHvhuEq8Pe4eZ1kwc9fIbTt2b6DZP+eGRW9tt4fa3LUIyFTz7+85S4ngo+jCedQOS38tsM5/0rMu5psFwsi3SWk8ZYMtExLBK0h2wzvoigsbEsfquYIaGp3ZgqZqvYpxGlj8K92CkBLWejrjYBo8GNUw5J9isazb8IiU9WdbTZVpXZuhAZhzGPGLDvjREliiPRawRwQcpLRPG6kv+hEqBh9TqHckjavpr/F+uZv+Eoi212So/2WDqgv+shYyMpH7twcuJqqr82UcOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCNq647ZOwRKmjQG6GErgwfd+svpnYZFzw4BcRLqX/A=;
 b=YOJN0zXiypcptrpd85w7NZgPdhxhZ1GWbE2TVxWDVSR49UdwvoG1UXen/yTLuMjK2phwMftXyk4qAND+gp5gpS0VyOqbsdKnZ64AgBkkG4DeEwh/8htwnCP7KwrGWlVUDJTK5RdwfkEQYJeKcyxBX3aDLAGhJ8YKaRlmI03ne0/racbYIe31s/9hktly57hd81ZXQ6YNgRmJ1SHOJ2lg7CF3TYXWph2kAxmGc/yBv7WPNn7OhmORqviQX6PEtWI84sP4FbaikuAlcC1Utu6zqk/8T/h1KI83lOGGLw4A3g0hHp7/p2dt3OlxyBMnkHhiBOMUPZqNiIxk00MefXW/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCNq647ZOwRKmjQG6GErgwfd+svpnYZFzw4BcRLqX/A=;
 b=p+/L5ze+nRbgfusJjvzKRdlu9Uq2w+6t7btyu7D+VcGbctYXV2ncXRrWlIcRQFSGMgfnYnt6RCPdCMcRoU6MQyUPfPxEAww2ivu4lLdaEyVIXfh4Z+3rYT1MpzXeTfNQakAL76JBWPN7zbccyOQNxWRYKaZLBU6RWCIHwhrpp6FuzSY0OITT/DJiZHCxpXUlCDDagwKfeglnUOgW7xdvvJuLcwNgbFfFgg4KPdlh/hMRg0l4QsGpTwwJ228gq2gAEMMDbKE9aPzb+DU5tgWnSSOJLrbT33ez/VdVR7QCLsfUBIZlYKVLfRe5o1FhE0u6bpyB9yY/QHb32Z6Rr6F+OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SA0PR12MB7464.namprd12.prod.outlook.com (2603:10b6:806:24b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 00:06:12 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9115.022; Thu, 18 Sep 2025
 00:06:12 +0000
Date: Wed, 17 Sep 2025 21:06:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Oliver Sang <oliver.sang@intel.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [jgunthorpe:iommu_pt_vtd 8/34] ERROR: modpost: "__udivdi3"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Message-ID: <20250918000610.GK1391379@nvidia.com>
References: <202508271856.ixwxgh3g-lkp@intel.com>
 <20250902124856.GE186519@nvidia.com>
 <aMj38M8HeDSQHQPf@xsang-OptiPlex-9020>
 <20250916141256.GF1086830@nvidia.com>
 <20250917022043.GB3106929@ax162>
 <20250917112214.GY1086830@nvidia.com>
 <20250917221217.GA650176@ax162>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917221217.GA650176@ax162>
X-ClientProxiedBy: YT4PR01CA0450.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::29) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SA0PR12MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 2afd8432-fbc8-46af-2ee8-08ddf6472d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qcNefA1Q4hxJ/qLiZuQfFguKzHxkCm0RL6h3QuSSXtr3MB3XqJn+j6vW0UUI?=
 =?us-ascii?Q?YMPihY1S7FBxht63g/7w/CTP9Gz3FhBCsmdQhNzUuQJLxkx01mDLWThntqCZ?=
 =?us-ascii?Q?0ACoRrtmgG+ksOpl8YUnhFeWGxZwfIeEQvmFs5XAdS9i6WrFhZFJLh7tU2rj?=
 =?us-ascii?Q?hMvY2ZzH3yQFeAGmpazPmNrrnrtUa0ZI6qLaOij7/mb5hauuCV15H8OXYolz?=
 =?us-ascii?Q?fAspLShE+L4IY87MUvqPxrb/JXaMnfF8a60D1vDwhoN9Bj1VvuRfrspr1Gwe?=
 =?us-ascii?Q?EipNAFAUEOJwH5Jo+wotMEeyzgqUWV8xY6dGCuAmMSvHl44YUl0aSUvEDVZ4?=
 =?us-ascii?Q?PSuBBwMPbFKzABAWgc6DbWi4tyLy7HPT8HJxSP2MRlgX6U0w572kOvjJvYfu?=
 =?us-ascii?Q?7eNasSbcRZN1WJDHTu2AsRbhaFk1QJECzQvvbq0dEiVS+4Bgarikgnbn834Z?=
 =?us-ascii?Q?eN5hdxOXEk5RUWxYHupYkf5OcTJ6vPUzw78L+fE2TjkJw65Q5ZDrnhto1tbu?=
 =?us-ascii?Q?jWKumG0bbE7MPzzvlrz4/kiTCWLECYv4QRDYA2myEEfuJ9OQbs02Gci6idhE?=
 =?us-ascii?Q?1FPr4viVZZPDx9aUzrb0lLmYBdiEILtc6O7oxuil8Gdw4HlhYJk+sUAHVd9z?=
 =?us-ascii?Q?RO3yM/SHQNKX/LuXsUf5+c+QgB4GUgprinzzHCq/aHrJy6DEErzS39D1A8Iy?=
 =?us-ascii?Q?6zaPa/fBtO42dDzruiTBnv/GBvOP93D+0YzQ3z3HnJ791NiZh/jIr8RyyZk8?=
 =?us-ascii?Q?quXl+8VmqcprX799HvRHVjcR8f92aAoO+Zdz55GEX+t/h8kwMrSzYTyEVZQT?=
 =?us-ascii?Q?mDsY+3REZHr40cI0Wnp89EOCa4X7z+mhJEbTThnhasT51qo7hq/mJs/Ndm49?=
 =?us-ascii?Q?okkFmREGJRV0Gspkj3aTWrCar1zF2Z9AsgcORU6CV5JwfCrPE54xUwl2yLwE?=
 =?us-ascii?Q?zCnanGlYNWInD6AhudK1ueEe1ubRmW334cEu+ZW+XKW1JdeTIHqo3b9HTLIs?=
 =?us-ascii?Q?gRmtPjyi2UA/X8WxCXb9UVX8NE+0DEw98iih1ewpXr0pBiG7Ia+1mv6zDzAb?=
 =?us-ascii?Q?wVlSwgfcC/ZMBpx5vXUcY7qOkoNpipSdbUqUxtbMymC4dXClafAZYWsG2EzO?=
 =?us-ascii?Q?soZIkiMRN4lLqS90opQXIkbMVhPiBlee1wsHKInMQkVwn+GNv91clvn9gJds?=
 =?us-ascii?Q?WUcCeDlfRRw4owFg6IVXJr1LqX6EnwZ/AnoV8J1OANmrE1wXcvHclp/XX9qi?=
 =?us-ascii?Q?ta+45J2I7RDbCdG9uNkVaAw8nuc8ER6w+UOwhgw9zmQJrUWsHtYNwwpuvfAz?=
 =?us-ascii?Q?OJkYMYRZ8n9ua12DZJJymZB979C0ECScA5n/zfleOxq4SUBpoHOOsteh2397?=
 =?us-ascii?Q?TKDumbOfj6T+R2TZs/WXW16gHkxAMa8sa/0tb4PsI8xLtvT1WDLqJMrXZ7dm?=
 =?us-ascii?Q?YyxuLz+lAzc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?izMlhps9tLGGTkmzi736egpCCYXXDEMBu5SpVm5tIahMGrGnWWkmkP5nQksK?=
 =?us-ascii?Q?1+TIC8gbhJ2inCWnr6WP7rI2dTeBew0Lsv6J9RKbuC5HxKCCCkQ5lUysDqpV?=
 =?us-ascii?Q?JjNZ81EQaAJJsi1bCC538P/Y4NNipAzSEXvi+QuZQJyzyWchWWV6h1jVsGKE?=
 =?us-ascii?Q?3ZYuK85PCOzMGppEh5w4lGCQHDSlhWuXKDlxhqdTVdGzfPHIX1Up4smmppiB?=
 =?us-ascii?Q?IN8OO8Xg5DNcS/1IEmBG9ZbGOhxceUaBfZM15ZXK/7JzUGMpS/cywzfgvVKh?=
 =?us-ascii?Q?YEfEDh4gH8jQogHn80VDx5fU4mXwHkGi/cmBesF2eVmbOtB3wuxhPtThK8pt?=
 =?us-ascii?Q?aToE5f7GpwdiVJz5+GEsltEZ2WZNKEj/RLl5B0A2F2bnNT/UB+EhlXXgKq42?=
 =?us-ascii?Q?Fx40aFN62tpZxBkgZQClMNSn4kCj7+0DZghKWeTWEXt2vub6dSJ6FQakux/a?=
 =?us-ascii?Q?Fw/Td3FSfnpPyAeZOw9xmS8SUtJMLfW5JfobAJ6P8yn2ruygIiNxqy8bo3tZ?=
 =?us-ascii?Q?Orc2pM2LXtPvmcik4A01FtFSCqG6qy0eCrKaZ/mXjIidWIkcI1s+iqueK6Cv?=
 =?us-ascii?Q?BQNtGiw2aKZxyZ1Cm8rR8QCKVDlleDqUD649LelohKXjIJYTn9hUxxszSp0x?=
 =?us-ascii?Q?dl1ZDWU+HLPq5R/8ZqBTgi0SFrv0pFq8H7Upbr0NCtWDTxuJcNvyBqAqpUNQ?=
 =?us-ascii?Q?E4EJ8m4d/feGQIvCd3BRU8Mzq5w29EceecnZdYLumaJn5KkApKYdQ1HZILge?=
 =?us-ascii?Q?XWGRCAgYWNAeUw8IuIQ5rlHnUPx7PIzhqEy9kpAXlaDjRvo19t1IvNd8JiEQ?=
 =?us-ascii?Q?MqqE0SGd+BZefgdjtuB+1b0r2qd5m2lWeSHxi9XWbSI7lADNGjDrC3kIRUKq?=
 =?us-ascii?Q?m1QjSXEyuHszwsCNugBONqt3EHjZ0aPUmfRFmwINZ99vRNUswBFmsxkbxmJL?=
 =?us-ascii?Q?dHbeSBueKvjCVU0q3z84wo4jDm/BeWtvBiHTEuYP3USmaFqcvB4fqQaVxBu2?=
 =?us-ascii?Q?j9dpborBCndQnYM4k+30ETv8YRjnrLpop5hgL7jNMyQMcSSqWt1gL3tJ9vLv?=
 =?us-ascii?Q?Wf0LTAkT5jHwApOYZ4gdpNeLeVSwE2Y1QRVvqE+DZXqarmOy4jNJOScbtYUa?=
 =?us-ascii?Q?bA6OOeWCc7hj2/tiYc8c7wYkzzRL6T4mRJdZF+fuFODbxS+oOkOtA+7quqct?=
 =?us-ascii?Q?nBCZzLsUe+LmNSdx3ViPeWZtjrLkfuQoxU6TwMnL8I2xAFCWeTXvfXMjA+mo?=
 =?us-ascii?Q?Rcnp3gHDUG9wZcdVmBj897Q/iGADowbey1BlK9sS0nHgDSRzkDkno21wVQSd?=
 =?us-ascii?Q?foRKNxgtTSNUmdmJOPHnuItO5Ds+tws/k/i5NjSb0Dr11SFbkcfcHj5NPoyO?=
 =?us-ascii?Q?IhdRKs8+I3+z/N3Arfh1HSdyz1jd6rxFFfTX1N4GnB2wNJ2EY3HaoZyrv+WC?=
 =?us-ascii?Q?EhzpMN/MzGe335460MLfV+Nw+ki/n7gUVoV7p3p+wNUWZbCkSJqwufWkqd/t?=
 =?us-ascii?Q?Mz81oNkHCgHp0QWshDkY2bRZ3YhYy21g0h+ZxzTnZecpBcRRjxrdDLgZET5Q?=
 =?us-ascii?Q?J4fUu8bxQQLJO7cMFq4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afd8432-fbc8-46af-2ee8-08ddf6472d2f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 00:06:11.9851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBinkZLsS0lm7H5hbMZIOrymQOnz+9fCm6HE5imujsYFfAaJwkXZmqvxUbz+X95Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7464

On Wed, Sep 17, 2025 at 03:12:17PM -0700, Nathan Chancellor wrote:
> Looking at the preprocessed source and making some educated guesses, I
> am guessing with inlining and constant folding, GCC turn division into
> multiplication by the reciprocal. Clang implements some of these
> optimizations but not all, if I remember correctly.

Oh interesting, I noticed that clang was measurably slower than gcc
for this code, maybe this is some of why

Jason
