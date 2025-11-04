Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011042.outbound.protection.outlook.com [40.107.130.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAC02C0F97;
	Tue,  4 Nov 2025 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.42
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762262815; cv=fail; b=BFx8AGp0aUxzHyJSdJ7fk27t1myGHU2XNNuTH4jTo+tXg3oNeo/UNxurJ1DvzYTWW3cIVWCXQsLGMMX/BkjSG5I2K3LJc+nEBnDUj7CWGqCkRThKDFmOfQdPcGzR7722TWnZGktABA27XRqhZPoc2R+LMyQNUVlnbe/8pYZJZa0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762262815; c=relaxed/simple;
	bh=FcAE0JFLtzidE7bGpSVrFDDuP2kUf+762k7KlLeV+Ls=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tMrJ06i+Or9R2klZiVNONLaZS83EHo/7aeEuk14YLwlh2gmcFWMQsNklvHfoYo55TU1Tl/bErdtbTOM57QbactrSixaxFaU8XiWjDA93D0SkHppVffq1Ac6Okp7+KgEkonfIx33zGNMaxH3WMHH4Jax3B9E/gVDx6wFMrg22/co=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Lq43tCQD; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Lq43tCQD; arc=fail smtp.client-ip=40.107.130.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Lq43tCQD";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Lq43tCQD"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kR4XIMAyDO7ePlW+QjHbEwnZZSZWwoa0CLM3swJptrqO5B06DYeRw0KmTv+Ha9lrUiS7YJB2LP6EarecyC7I5zBwcxFJtE6GqJkHTZ9ih0CiUXtovceTDFCLFuWfpwmZGWbV7EGDt4EuvdV3TzQF8zPavYsmS3g7whONWQ0JmkMZ8d7dTMwErkOMrwkw0bP+zrczeqJH/pDrzE1R9DGUAzyG9RATzXzQBa8n/+BtLvC37LjUyfwr1SD0u/qXTtYGikFbmerwcvqipiQ9dNofskkeSzkpM91nn8PmNcOZ9yMyxkVZgNLtr33R56x7T6kUPnRPeMaP5ik0bLgLj9bvOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OwojkEg9uhos+xZzFMXTwgqaTywtcxMWZFHaUldnnY=;
 b=xYrFlyOqgm96Y0dBdtE1nBsA2FISju/kf3D6EF6J47A+gykRDlnuYZe21FJdWoS2O/UTIvfLJ5lKZ1ZBjMwWpNq4qCbF5oKpY+QOqSzCSq98uniyDYus3d43w7s5cFDFNEfCRnxoAqCoMBLo1/IvxSjntjnZSt8o8iRZ+bUekd04a5mk+ZorIXeuGcBfaN4eJriMDf8bktr9L4YSP7JqygLtU/UoJ503wsoMrztJGcjdeCepv+TjanAO9sTGgeTFPP8yMqpGdLNchh+ohts+mYAmeXPAlrBqQa5XBlYuNo2BiOo+ljcMGCToor6kYbAhXR9nFByjjCWeIrjLAkD2cA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OwojkEg9uhos+xZzFMXTwgqaTywtcxMWZFHaUldnnY=;
 b=Lq43tCQDSmjeNhn+IR9l1XDrwG+fYEc1DDRqQwJOWv84lUB8W6UAG4bmbvtdrGJPKasNdXoHbtR7O37DIUbOZxBezQgnI32vTV6YJHeS/KuLI92Ai/7+U/BqRQrJEBDxffLK59LV58WiDDFqBB6BLN2FaYeuaczxA7i6jXlz7rs=
Received: from AM0PR05CA0083.eurprd05.prod.outlook.com (2603:10a6:208:136::23)
 by DB9PR08MB6345.eurprd08.prod.outlook.com (2603:10a6:10:252::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 13:26:48 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:208:136:cafe::19) by AM0PR05CA0083.outlook.office365.com
 (2603:10a6:208:136::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 13:26:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Tue, 4 Nov 2025 13:26:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEvPxSCo7Ig2YaUJABqsz/aeu5JiMpdgjkz4tr7w1uh1g9na1czriNUW3tnHQgZfL3QJ5yT7RzkwDRRX2bNrNfWfsgwX1pMhjCkwsCGoee5X+KoajHrrofKi7lZej6aAxkn5wqoWzaOMCRxDgYezk0Pdyun9/ySUJbHh7YuYi7OreANWhW9D48s3HumjuEGiIqWIhNQyWmlBllJxf3KL+KR2W6QSSSmQBym0HIYnoVYG1RHT4f0rhE++TRQlurhqwCPFHw9fj47oZKjFn/DF22u9MA6bEc45jy9etVYe2gqZ9HHF15AFmVuHjZbavnvh+nlk6sgnBo4xj+nR8jUiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OwojkEg9uhos+xZzFMXTwgqaTywtcxMWZFHaUldnnY=;
 b=rfPtKIy6tfomnKQbllQNBV4/PFZeiJ8gGBFKqAnt+XgbUcG8tvGsX6bwl5F2Zma6BvljtO/UV8bIP5xmNJeb0K/jv3NUg9PMy0Nn1eQD/2QM42wXEE7oupMhj/1jkOX0aCVYqogTsTOmDCJE5lC3EH39dZs88MvLhvmQiZSUO8JeIBMjSrgGYojgrhugElGxF6Rfh5UbaI2U9yUYmFA2AwF36IeXDnRUkxmlRY7sxjLKvwocedMZtIJ9jDBLtoIALmbp5B+bebA0M3CM91y55Mghf2HuCS04UfnfVsS7RInHYqrTwaLbYmRO15uicge4YnbPQQibjwKDBE/vCse/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OwojkEg9uhos+xZzFMXTwgqaTywtcxMWZFHaUldnnY=;
 b=Lq43tCQDSmjeNhn+IR9l1XDrwG+fYEc1DDRqQwJOWv84lUB8W6UAG4bmbvtdrGJPKasNdXoHbtR7O37DIUbOZxBezQgnI32vTV6YJHeS/KuLI92Ai/7+U/BqRQrJEBDxffLK59LV58WiDDFqBB6BLN2FaYeuaczxA7i6jXlz7rs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB8451.eurprd08.prod.outlook.com (2603:10a6:150:83::17)
 by AM0PR08MB5361.eurprd08.prod.outlook.com (2603:10a6:208:18d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 13:26:14 +0000
Received: from GV1PR08MB8451.eurprd08.prod.outlook.com
 ([fe80::8e8e:e64:2768:aaa9]) by GV1PR08MB8451.eurprd08.prod.outlook.com
 ([fe80::8e8e:e64:2768:aaa9%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 13:26:13 +0000
Message-ID: <5bba40c3-bfab-481d-8252-4f5a62e2b79e@arm.com>
Date: Tue, 4 Nov 2025 13:26:11 +0000
User-Agent: Mozilla Thunderbird
From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [arm-perf:for-next/perf 6/8] drivers/perf/arm-ni.c:433:13:
 warning: operator '?:' has lower precedence than '+'; '+' will be evaluated
 first
To: Will Deacon <will@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, nd@arm.com
References: <202511041749.ok8zDP6u-lkp@intel.com>
 <aQnzF7BNIgp37kcd@willie-the-truck>
Content-Language: en-GB
In-Reply-To: <aQnzF7BNIgp37kcd@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0244.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::10) To GV1PR08MB8451.eurprd08.prod.outlook.com
 (2603:10a6:150:83::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB8451:EE_|AM0PR08MB5361:EE_|AM2PEPF0001C714:EE_|DB9PR08MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b5bb47-9948-4ff9-1162-08de1ba5ce44
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cTNNblVhKzAvSzVkajA0QUE0SDltTWdiSmROWkJXL2VZUDFxaUFVRkhpZjZ2?=
 =?utf-8?B?NWM5dStpQ2t6OHF4WWVSK1VvVk9wMFNIZE95N3Z6eDhWZUdZaG92enlicTVq?=
 =?utf-8?B?L2hPZkZhWFMyOVBoRU9BdkRCTTNxRmtGQUlpbk83QWNiSjROOTdjajlXV21N?=
 =?utf-8?B?NmFuSjdXbGRwQXdkWm1MRHZmbUs4NWZMc2tVbTBYN2lTc28yVGFCdVhiTk1Y?=
 =?utf-8?B?OGE3V0IwNFRTT2ZJNGRpdlNXL2J4c05jQVA3ME5aNFpDY2xSYkxvNEx5ckhr?=
 =?utf-8?B?bms1a3pzN1dBV3NZd2NEcWIwUXdSSmc5YlpWVmpHbVJYTWVJZEJrU2RZRmxp?=
 =?utf-8?B?WUZrVVQwaGhxTmlzelZoWXRUc2V3Tlk0Z0YzN3YyTFF2OEF2VFVSZXBOOE55?=
 =?utf-8?B?Z3pOM3BXTGttcmF0Z3JaVUdyUDJoZFMwQTVyN0NJQ2YrMjRtZS9MU0ZIcUxY?=
 =?utf-8?B?RDFDSU92dW1URHRkc2tZTC9kZFFnclFMTkdtZnJOYmVnL1hraDExNnRqbE42?=
 =?utf-8?B?cXgzOTZTWTdzbC9YbkFZbURvZVR6V1VmZ2gyaVdRYkJreDlWYjV1YjN4Nktl?=
 =?utf-8?B?RmUxVURDMXZTTTAxMUVwSFp4bU1uWTQ1OXVXdUhqWWRqMi9GRzZTOStLeFYz?=
 =?utf-8?B?UFVVMVVOT2dHL2x3ZkNOdGIvVGNVUTk3NnkxdTZLQktleW1uVXFibHc4T2pr?=
 =?utf-8?B?eFNmMVkxZndpZlNkdEhoSmVIK2NyeFliSjJGVzJXbElsNDN5aWFDMDIwSWF2?=
 =?utf-8?B?WG83b1BJdUtQQUUvalFMb0VSaTRSaE4rVE9PMDJZZ3hIM3dLNGozdndnZCtZ?=
 =?utf-8?B?SkFjWWVmQklwQjdCM1VQSURhZnVheU9lK1RHUHdkb3ZDcUtKaXVYUXFZNkw3?=
 =?utf-8?B?R1BmRXppbGovLyt0SU5TUzdMSlhzNVdITlB5MzVDcUg5S1o5NXo2R0FOMmgw?=
 =?utf-8?B?TzhHR0RVQlJlNjl5L0oxSVJQK2VHaVRzQ01WUEtISitueUlhQzduNzRwc3Fk?=
 =?utf-8?B?MWsrQzRTMUVWSDAwQWhhZk83Zm9YaFcxQnRHb0dPK1RVS0huc3pIc0dnN0NK?=
 =?utf-8?B?WkE0aE1DVC81TGNqTm1tK09VV3BoLzd0Z3BpNnovc2ZHbUtJWmI2dG5VdHBP?=
 =?utf-8?B?bldna3lPNFI1d2lucVdOTEVEVVRZeVdSZmVsWHdwZUpBRUZBWEpXU0xKVWpk?=
 =?utf-8?B?ZGtzTGoyNVp1bklWYkI2NUJvQ0dMeDg0eUVrR3JEWFNQcFBSZE92VU9QREdx?=
 =?utf-8?B?bENFSU1lMWZDUTNZU21XTUxJNHNYODgrdDZ5d1kyUk9JOUwzYmZyS2NuYWpH?=
 =?utf-8?B?bTZUdlQwQVUxdG1OZUNJaWljRDY4bDQrcEVGRzZTUHg4RUZaNFMyYXpRTnE2?=
 =?utf-8?B?RnZJS0FuTUk5VllrRkVkMHFKbjBuMWoySS9PMkYrSjlVMkdQWGpDVTN3WFhl?=
 =?utf-8?B?bW93NFFjN3A2RmNheUI5YlAwSWlKd0pJWElWcGhDWkI1anhVanlnR0poTDJR?=
 =?utf-8?B?V0JEMzVGOUtVTnorOWtUcEU3N0lQRC9COVdCd2lRMTBEZjFnTk04TjV6SnpG?=
 =?utf-8?B?cU8xd1ZFOVpWNVdHZ2pETzBzVzkvVUlZekVXd2wyalZVSkJNTVhua1FZTjNS?=
 =?utf-8?B?RzBYSlRDOU9wbUpXckpXelovdjRQYUxobDk1Z0ZXUWthQmRzd3pGQUQxcFJw?=
 =?utf-8?B?b0NaK1h6aEU4blJZeDRGc0tRaU5FWlMxMkJ2NWJieFNrM002M2Nxd3VDWklo?=
 =?utf-8?B?UlRYMDAyY0s2bDJhckRNLzRyaTdQRnhrN2YwQjlvNDVHN0h5UkR5Y3M2aXVs?=
 =?utf-8?B?bUtUMmFTYjR2SkNaSkY0RTJtcTY4aW1uMVFGdGJFSk1lUWhzRStNYUJZMkVB?=
 =?utf-8?B?akdYaXNiTytMb0dPSmVJRlhBQytYbFFZbmNLc2pjeUFuMVVXNFg3Wit6R0tm?=
 =?utf-8?B?Qjcrc3Y4TytxYUROdkZjM0R2VmxpRGJVaFpNL3hyRnprOXI3QktMTGFmbnQ2?=
 =?utf-8?B?U3Nta1dxUFh3PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8451.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5361
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a13a3d04-2870-46ee-e143-08de1ba5b9d4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|35042699022|376014|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RW9ldGExNU1raStVWVoxNEt2VThaRHRhbXlFSUpQbTFDODN6QXhhbjdvekJP?=
 =?utf-8?B?M0w4OHJ0MUVYWWlVWmdmRzdDdVplUGsvQ0xiVjE0VDVPdm82Q1JLblhjQStq?=
 =?utf-8?B?U2p4UVhCZnVIb3lrWStWMlFEUGZvM3hUbVNXam4ybzZwaWpuQ0N1L1RmUHFL?=
 =?utf-8?B?bFUyTXFDOFIyYTlBM1AweU5QcHdsTm1WbHlxNWVmS1ZDblEvSlJRdTcrUmkv?=
 =?utf-8?B?bUl5WjZUN2RRV2hXdGN3N2dkV0k4R2ZnbmFmSDBnVGNtbk5UL0JrRW9ZWm1j?=
 =?utf-8?B?a2J3UWdLbFBEY2I1elRFUlRkc1k5SzdObmZXYnhjOFp2UHBjUDNQM3cvRlBG?=
 =?utf-8?B?QTVIaFkwMThJYVY1cTVmRW1Nd0pOTTZkbm1YUm13L2NrOTljTForUXJGWkxu?=
 =?utf-8?B?RXRZL0VObnQ4bzdnL0gvYVI2c1JxTmkzb3NEYTJHdDI3UU5zdld4N2NvekpY?=
 =?utf-8?B?ajdtdHZubWRGLzNGNFVrYVh5eng5Snpzd3pwVmtZTi80OTg3K0d3aWh6cmc5?=
 =?utf-8?B?R05EdDE0RVpHMW56akg5OXhkaXZhdGhXbFRpNFdvb28zS1BHTVhaVnhhcGRq?=
 =?utf-8?B?UkZjZUFnNUhJUnlKODd3WVNsV0tqZi9QWTVKVlM1U1dmSDlNSXByN1lVdXd0?=
 =?utf-8?B?TWptTlplakpqUDNqME42dVMwQ212SGRZVXg0UGZPck5aaE5GWVhXMkc4dFlp?=
 =?utf-8?B?U1AwNzBkL0pXSHdBS0ZRTzkxR2hHVm1JMlJJZm0zTEdvclVrdmlRYmtTYTFX?=
 =?utf-8?B?cXZ2VDVnNE01NkMrSjhJc3lxUHdxUlIwRjd4MXg0N0Q2RmpKaW1QbENpVi9X?=
 =?utf-8?B?RjIzZkRHZVJIc1d5ekpUVDdvTElSV3Y2dkMwYStaU0xtRmFHZVJmRjNyR3A5?=
 =?utf-8?B?M3JVaTBkVThCYW91ckJXYlgzQ0VPTXlodUV2dURQQ04wR1huWkJGTlRQSGxW?=
 =?utf-8?B?NkFoOUpheXFFQ3pMcjJBU2JabndLMCtkekJFK1dmeTN6a2h6eGlrMnUxWXVC?=
 =?utf-8?B?c1h0dUkvZXRmZUtsMXBURE9vd3lDQU5vL2pKZ3VUZWg5dnk2ZjUyemtRTXQ5?=
 =?utf-8?B?dkh0b3d1cllzSERDc0VkZjcyMy9XNHQ3bzAxV28zOXNpT2gyMm1pdFJPSE1U?=
 =?utf-8?B?bVUydVZhK1ZYYkIxNy9SMThQMkN4SDVwcHNsdFF0S3Z1cHJqNUF3QVNJK3dp?=
 =?utf-8?B?Mm5BaXk1eEZSU1hYeHVDSFdsUjlEbjFrWVd4Skt0NTZQOVBJUjdyZ3VBMWF3?=
 =?utf-8?B?dmdJT1dWYmU2czNtSVpzL0N2SFRqTXF6eDVYRnVhUDJ2aW9BM1Q5RnMvbHM5?=
 =?utf-8?B?WGJuK0xMcFFBTG5BL2VRTnpUbDRRL0M1ZHZORDcrdVFab203MEE2L1M3L1BQ?=
 =?utf-8?B?YkpNVkFmYVQ4L3lpaGVkeWE4WDErdzFFSEQwbnFFR0J2cmU0N2hLYTc2OGZy?=
 =?utf-8?B?T1VDemRYb0tVV1JSVStMcVl4ZGJYU3pjVHp2QXZRNkVDR1NOVGZ1TWd1TDZw?=
 =?utf-8?B?cEhndlB1aW5sZmFhUG4zUk84eExkaHBvamNtSmxCa3A0QmdlaXFuTTVaZEtT?=
 =?utf-8?B?RmlQNVJKVzNTNW5GRmRBYVdxd25FeUF4ZnVkRjVBYk1ObVdKRCs5bms1QitB?=
 =?utf-8?B?MFpWcU80RUg0WlEzeUFMckhwOE5XNjNtRmlqY1Vvc29GcUtlSHZHenUybDE4?=
 =?utf-8?B?N1FyaDd2Y3JKYkVJZVBUODIwalpLazdCNTdGUEJMcHdjMVJTV3ppTUpOdmNa?=
 =?utf-8?B?ZHZvQ05mTTZLZzFCQkptaldtUFo1TTFPcW14d1hCcG9LNXZ3T0dBWmlOTHNE?=
 =?utf-8?B?a0Jud1pMWk5EUlF4MFpuZkNrZnhNY2d4SVE4NEFtSGV0M3Y3Z0ttQmVmS0NI?=
 =?utf-8?B?allDTURId2tsK2g5TEp5WS9MTnZZUUh6OFVSKzkwNEduQWJJTkxmNldzQnFN?=
 =?utf-8?B?WGY4VkVnaktGRUlxMkdEK2RtUEtaVUxRWnRzb2wvR3hIUGROQ1hXYm0xNmQ5?=
 =?utf-8?B?dXdXMS9sSktydklCUzhsMXF3V2hjN1JHTnBlNHZDSXBvaHNnMWFPZDRZdVBR?=
 =?utf-8?B?Tk91TWdXeEpqZ2RkT3p3MTAwekVRejVicnRTUFV0UVJXUktWeWdpRlR6c3ZN?=
 =?utf-8?Q?vmA2+oVfyxjiMBub+ipSZ9zXS?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(376014)(14060799003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 13:26:47.6338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b5bb47-9948-4ff9-1162-08de1ba5ce44
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6345

On 2025-11-04 12:35 pm, Will Deacon wrote:
> On Tue, Nov 04, 2025 at 05:43:40PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
>> head:   989b40b7578a2be7b0388522d33d751b257d59d9
>> commit: 8fa08f8835e57e1fd5e2994c9cf76c84dadc1235 [6/8] perf/arm-ni: Add NoC S3 support
>> config: sparc64-randconfig-002-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041749.ok8zDP6u-lkp@intel.com/config)
>> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041749.ok8zDP6u-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202511041749.ok8zDP6u-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/perf/arm-ni.c:433:13: warning: operator '?:' has lower precedence than '+'; '+' will be evaluated first [-Wparentheses]
>>       432 |                 hw->event_base = (unsigned long)cd->pmu_base +
>>           |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>       433 |                                  is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
>>           |                                  ~~~~~~ ^
>>     drivers/perf/arm-ni.c:433:13: note: place parentheses around the '+' expression to silence this warning
>>       432 |                 hw->event_base = (unsigned long)cd->pmu_base +
>>           |                                  (
>>       433 |                                  is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
>>           |                                         ^
>>           |                                        )
> 
> Hrm. Doesn't that mean this is completely broken or am I misreading the
> report?

Bah, my arm64 W=1 build (which I did do in the hope of catching any such 
sillies...) fails to flag that :(

Truth is this is a fresh refactoring of the mess I originally wrote that 
got tested by someone else 18 months ago, and I don't have any hardware 
to functionally test it myself. Feel free to drop it and I'll send a 
complete v2, or I can do an incremental fix if you prefer (I already 
realised I could have streamlined the version check to a one-off in 
event_init as well.)

Cheers,
Robin.
