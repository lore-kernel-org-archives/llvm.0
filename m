Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464202F693F;
	Tue,  4 Nov 2025 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762265144; cv=fail; b=cGRHUme+/P/+Vq7m0hUT1Xa/ip59S5JUysH7/nmRs5xVyAX8IHdTmqxQqFDhq2vCGr9gvpWwf5s2r6ObbcCzJR2RRicMrarEHKG7GIn+H+lAULrwOIsqZKsWch2o9g/mcGKt/IDAKasW/LfpZezywAwT+NjTdJa/LNy9ej8IaLA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762265144; c=relaxed/simple;
	bh=/SCQFQFPpdKyxLNnSUBBarBCWhLxXzHMkmar5o64aUE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Oz/WiLBltWIlDasZKq5huQ6jLc8hYyNTWCyj9rDbC+Aaeh0rJRkPHcshA78Ys6hcBx3dMaCxPy92725rqY4dEqU1rgdHxCL7Z2l70WUqkFBHGzB92f+vcy3kbNt75GDB8j9HZKdc/nfRgPtmWkTlrZhkZEbIAdpnSW6kOnv7bd4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SXiCUXhp; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SXiCUXhp; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SXiCUXhp";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SXiCUXhp"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mUSzp/5z3LzhZGDooS4yaNjUK30kMqgadceEaN+1hyMBr7B7zC0CHr4C20lDnO458zedMq3lb4UZ1kETDqZc0tQXTmqToZpcNDg9EbABT8wYNRYckCBTePOAIujC37M//wj2gj1EiZHL2IjLvHvRLcFf99vO8y6c+p6KSyBowb+5YVwxYd/vI8Z6ueR5YjqZGOOn6yu8wzA5yuFKcN+3JAKFGe7TMrYKNNjPED4hvy22D/ewRf/6TOXxLUkY/8rfXvXcy4vFjHxPT1WpvdFkhRgw6PYAZWcuNtM4IBRSlaO+dmERmD5Of8Q89HNIg4rivUnYIIw6OxZffwaOTUcg1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OffkVd69AWa8atEYErAkO2W1QB+e8cfzrk2vVbTewUw=;
 b=jdqheTT7TK3Mv/HCcPJeKSqGM4iORS9ISxwjvhgFoY86JceK9MVea0XHKpBebZ3BiPVZUTfQMxZI8f+Ejut9t5WwBY+qhoI9GBXo79lJOHxBwppOUTl5Piip2jlAkQRYeBP5yDa30IPjCjzavOJUaAOZGDnqP7xNahoVlTJfta97UZsH2uCKfRkGt0QQ/p4adPLUtVn0AE+AOxRuZhODAEF7Htj/Ydi+O09t8gecacnk3/lAXhbqb/sCbw00nKHr2QT8ANAPj9J6IAVApuS/oOXBpmkphHW6OM2fRRXicA0ArQ9wqO1lMiijCqY3KdOHJsfC50XYHbTb3Fom7QZ/FA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OffkVd69AWa8atEYErAkO2W1QB+e8cfzrk2vVbTewUw=;
 b=SXiCUXhpY8S6mNAQhOxwRqDlZXax+xhJdr5vQNY+xfOUTVxjUSdkXrPvJkw/af00A/0X5wvCE8yMUYi8IsuDQ+1UYLARQsihJVds3uCuFAxnQ66TzJlxpNBxLZ/qL4McZORdO3RMfU0YjV2qLwVoBCGt+33bpmg+jZ3fk9zhm48=
Received: from AS4P192CA0041.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::11)
 by AS2PR08MB9893.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 14:05:36 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:658:cafe::9e) by AS4P192CA0041.outlook.office365.com
 (2603:10a6:20b:658::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 14:05:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Tue, 4 Nov 2025 14:05:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJwBwMXm3GXHzGigbkHjveuyewjmiDKaQCb0VndUMbX1G57QLJDP9xfzJOIP09LSEdfoCJtmQAA9Sgylq6DkVrPN2HFRPQ2bRfRZ5belBmW8ExjKWTECptl5T6v4QlBL0EjULnt58o2XAHrOxIVHUj2aTcpQTdelbSYFTlQauycyKR/4X1bv56urgJVgvp5RuhEyWMhGMf3Gij2oeDaQQKYrC19/WdfV7pXtu+C/k/VnCdoZRHJ2fTi5eKUAjnRlTtglN27jVFPM4I+DD9YwKO5CqesVzF8dBXQJQwSRFzUre6LiYJX0E6Jz7ZlxzypN5hBIsHd04Hi7pSfS0y8obg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OffkVd69AWa8atEYErAkO2W1QB+e8cfzrk2vVbTewUw=;
 b=edQ0voDJ6VTShD0SgrmSMVjTb0aZ8UqpmSV/2w456Qm5GHngA8PXX6uiYh3zDbYwuQylIdPgeXskdr0O7haLQvRJPvufXyqCQjy1eJLZSoPJco0fvsstlpZQ2aMpQlJRDp+KG78Fm+5+osHc3fjDlEkrAiB5G5pNmRDIOqcJS2Rtc/A0Vfxnh+czLuxCsGowkJiZMcX9PFkvCACgoKPHReOJYrUq1V6/6Up06SCLs6vnKswiQEGXjoBTpFkWKZt/n9ev1PLnxZftOi58jpeS8ijJdUI4H6Su69YDrNBASuo+2X5woZEeuHD1KrI8ih+qmm7D6Ow4I1ii0RGZvJRdpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OffkVd69AWa8atEYErAkO2W1QB+e8cfzrk2vVbTewUw=;
 b=SXiCUXhpY8S6mNAQhOxwRqDlZXax+xhJdr5vQNY+xfOUTVxjUSdkXrPvJkw/af00A/0X5wvCE8yMUYi8IsuDQ+1UYLARQsihJVds3uCuFAxnQ66TzJlxpNBxLZ/qL4McZORdO3RMfU0YjV2qLwVoBCGt+33bpmg+jZ3fk9zhm48=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB8451.eurprd08.prod.outlook.com (2603:10a6:150:83::17)
 by PAWPR08MB8840.eurprd08.prod.outlook.com (2603:10a6:102:339::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 14:05:01 +0000
Received: from GV1PR08MB8451.eurprd08.prod.outlook.com
 ([fe80::8e8e:e64:2768:aaa9]) by GV1PR08MB8451.eurprd08.prod.outlook.com
 ([fe80::8e8e:e64:2768:aaa9%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 14:05:00 +0000
Message-ID: <3e9e655f-eccd-425f-a243-161e84d801a8@arm.com>
Date: Tue, 4 Nov 2025 14:04:57 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [arm-perf:for-next/perf 6/8] drivers/perf/arm-ni.c:433:13:
 warning: operator '?:' has lower precedence than '+'; '+' will be evaluated
 first
To: Will Deacon <will@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, nd@arm.com
References: <202511041749.ok8zDP6u-lkp@intel.com>
 <aQnzF7BNIgp37kcd@willie-the-truck>
 <5bba40c3-bfab-481d-8252-4f5a62e2b79e@arm.com>
 <aQoAUPtvbBrlymuA@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aQoAUPtvbBrlymuA@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0219.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::17) To GV1PR08MB8451.eurprd08.prod.outlook.com
 (2603:10a6:150:83::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB8451:EE_|PAWPR08MB8840:EE_|AM2PEPF0001C714:EE_|AS2PR08MB9893:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f7d1da-4ca1-45d0-451c-08de1bab393c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?THRYWjlPY0c4Q2dtOTdyWjF6U3ZzRGk4b3dITlA0ZHZoQlJkSTJ4WXU5dzdl?=
 =?utf-8?B?ZjUzb3FBUUV3OVpXcklySi9xTytBd0FGUUozZGYzOExxUDdHWjBDWFNHZk5u?=
 =?utf-8?B?TFd1SGYyUWZWS2pyQkFaUTF5K2hKTm1XTU5DSFdORWtzTnZKNnp4aS8zT1Ro?=
 =?utf-8?B?MUhiOENsckRCeE8xOVlycG9SU016UXZZY0JWc2x4emUyV016RlFENkJkTFlj?=
 =?utf-8?B?RlhwakNxcTBDcTZVL2FJUlFHQzlUMWxabVk0bVhHS0JQY2s3YU9mN3dSV1RD?=
 =?utf-8?B?RmVEb0dHUS8xSHJaNitFeWlqZGRIUHhuSGRIRG01V2h2TWllbGlQYmxaWXoy?=
 =?utf-8?B?YzJjdTJOZHR2c1Z0VU1tNEdZbFJEcWxUNEJTNFBRTkdrZFhjZkNvNlh5N2FB?=
 =?utf-8?B?dk54a3EwLzlwWW90VGF3bHZ5UDZLdGI3aDZaRm9oV052TDQxQklXdnJVUXdN?=
 =?utf-8?B?N0dvbGlIZGNRK3FmTk1qYXBia1h4K1F3YWRWZ0UyUWlpQndyUHkvWndrRzQ5?=
 =?utf-8?B?UjBpSzQxSjk0eGxxSjh4TmJqRTNBc0c3VmtGNGxGVUdVR2ZZSDZPbTBSajV0?=
 =?utf-8?B?eTVac2psQy9WOGJUSWV5TXE5WkJrakVoN0U0QzJLMlRTN0s4K29qc1NBa3hO?=
 =?utf-8?B?VDNZK2twMHJWREVoSmgzb0loYk9LN245VU1MOEppWVRNby9kUTVoNzgrWkRy?=
 =?utf-8?B?aXUySmVpMWs1dUpnOStVZjVwRkNQZEY5VkNhSk5EZEVnb05RMXdOU0ptdFB5?=
 =?utf-8?B?dDZnbHArRlgwME80N1BjdzE4SnBKUWxSOXJwNlRTNGNCZXZmWWhudkYvcUwx?=
 =?utf-8?B?bWcxblBQVFc4MThwenJnMSs1bFpZWnE1ZDV6dkUwTVZ5OVVzR1hPcmU0R2E1?=
 =?utf-8?B?MEJxOTNEaEdNTEJYVkt5QTZIREU2Yi9HZE9KS0g4aU9VaGpNNXBsUDRVWXBF?=
 =?utf-8?B?VG5tWU4vTmdxcDFsb09MQVRtaW5Kd1FiQjBva25hWGNjNWRCZC9WSW9xdDY5?=
 =?utf-8?B?cmgybzdPbHhYMzVsTldPTW1Rejk4SDFRKzlrZzVoVWdGeE9GTEYzMWVYTVRH?=
 =?utf-8?B?QzVNRUFFUVhoWXBnR09QcytVMkJLMW0vb1NqOVdWeTJHNTFneWtRV0RXSjhC?=
 =?utf-8?B?SUdJYVl1aW1EeEZhbFBRdDFCUlJCVU9kd3hNc21IY1NVY1VMVzRheGhXRE40?=
 =?utf-8?B?ckUvb3U3VHl0L0tQQUR1ZWhtekkrbGNUZUQvaWhuVmRYMVFYcnZ1aFZQNk1a?=
 =?utf-8?B?WHIyMXpBTldUbnI5LzdmK1h0Njc5VGFyVWt5NTdxOVlGQzd2Ky9yVDYreHFF?=
 =?utf-8?B?VnVoangyUm5ZbDhpQk9yS2REQXljV09UR0FkdzM4Wi92ZnMrRHZkMEVOUmlI?=
 =?utf-8?B?dXNaYVVaYVVPOFRqLzR0a1djNnhHekw0OTVSYTlqNTU1N0RNT2dJVmZQNzRu?=
 =?utf-8?B?RFlCWGFwZ0p0SGY3N29TUjl3dXA2OVBDMWtqZEJjMHdyeUg0UWN6Z2YrN3Rx?=
 =?utf-8?B?d21lNE1JUWNGV0NobWREUWhpTGNsT045QU9mNDEyQkNlbEtBMVR2TzczOGxh?=
 =?utf-8?B?RzdmTkNNc1c4OFI2K0tMeTV0aE9XNWJ5S1ErS2FxYTQ5M1Q0bmpIaUp0bFhI?=
 =?utf-8?B?UWcyR0h4K2V5bUlzT0hkb3YrV3BiU1FlWjRacU1oUjFVY1pxdXRNRFh2eWZK?=
 =?utf-8?B?VmxzQ3d0aS9uc21VZXdTdXQrRFVSMjNJb05SV0p3TGJFazFyYisrUmZ1WWpp?=
 =?utf-8?B?RU9VNHUzcTZSVGllVWFlUHAvVWFmeXM4UnE0Tm9MV3pTMkREOUw3RWFIZjYy?=
 =?utf-8?B?MER4cU5lUVlsNVpYT2tGaE1RSjR0SzlOOEh4eUtiR1lvWmhUMXZjd2F4cDNs?=
 =?utf-8?B?V1RPa1M1QlFTcllCQjd2bWtxS3RBZmlqM3krNEtnZzdpNUhwd1VrZjRKWjJn?=
 =?utf-8?B?dGhRVGxpM3NZSnZ1eE5hS0M2dDc2QXRHa2xtYW44aGdHWkdPZUJyaGFwd0lp?=
 =?utf-8?B?Rk5uQ3NCY0ZRPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8451.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8840
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f29dcf87-3f0f-4fcd-e628-08de1bab2472
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|36860700013|1800799024|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTltWm8zZkR3M0JJUllub1VpSFBLWmZUS2YrZk4zNThnQlRNaDNKY3RGeXEx?=
 =?utf-8?B?WUZBckRnRHZ0cDBOaEJ2TmlUUHI2aVZQUTNZNTZpaDBJWkdQV1J0VXI4d2JV?=
 =?utf-8?B?R0F1SzFIQkR5RVMyYjh4YmIvVVlqQ2lyam1GNFlPaFZ5MXBUUXhMQytDTm9M?=
 =?utf-8?B?S1dpQ0s2UkZpaldmWmpQVGY0UENWUllTcWhUaGp3SDZDNmsvU29FUDJWc01r?=
 =?utf-8?B?bE12N3RDRzRIOEhVT1pSdWE4Nm82UnlCVDRxb0RQWVhyeTlodjNVR1Q5L0gx?=
 =?utf-8?B?M2NCMmZCZHN3eW9sVzFjUFF1ZG1wakpaekV0WWEvSTh3VkVtT01WbHNkM1BH?=
 =?utf-8?B?V0FWaXVoL0FYbnhCL1BuSTdNM1FmTHRBa01uaU1qVmR6bjRTSy9vbmdxQytu?=
 =?utf-8?B?YzFvaG9TYXJxZ3ZaRFdXNkhDZ3UrWUZMZGxsWUk2dGx5bEQ1VEdPalUyOUht?=
 =?utf-8?B?blBtdStwc1MzTVhjd3NMSGRkL3VmcmRDYUc0ME5HaXcvUDdJYk5SN0JKSmJY?=
 =?utf-8?B?VCtuWm00dytjU0RQRjBJSGRGQmY1VFBrTzE4cXo4N2p2QkxtenByT052SGU4?=
 =?utf-8?B?MUhQUXVVMm50c0czUFRNK2lBeVArNEZXY1R6ZVFQVHJoYXdYOE83eldjYVg3?=
 =?utf-8?B?NzNsaXJ6Z2ZCV0xab1JLMVIrek9EQWliSHpZNy9zUVZFcWtFSmJDUlVlOHNS?=
 =?utf-8?B?VzBJRURGZytjaHl5NjdTVkozMGUwMzdVMHBuV1NmaXBuMHBVdzNPaU4rQXZO?=
 =?utf-8?B?elZTYlRLeG1JUE9hUjdiZGN6MksrRkNKeUdaY3pidExEanIxcjVSdmJzbHhI?=
 =?utf-8?B?Mk9WaWhPTmJjSEMxc2tMZVFqVTZCWERBMDdHWGRFaTBtK2FneTIzNUZhVmx0?=
 =?utf-8?B?TDhBakIxRi8rRU1LdHZnTGJoanMrMWxWR3dsMCtVUjJJcCtqMHNCSm10UWdQ?=
 =?utf-8?B?aXJTNzI3QkpMNkFwd096bVpDTmcxa3ZtVEhhQzdJczltdHBTOUx2bkI1K2Jn?=
 =?utf-8?B?ckdRaHF2ZDJ2cDlKUTlXajN4RE9iNWhwSXhqbk12SUV4RFdVUHQ3NWVqTkd6?=
 =?utf-8?B?TU9TUzVoOG5JcTZTQXhwTE1WMThoMU55UVhXNTh0MjJXanEwbitlVGFaSm5Z?=
 =?utf-8?B?UjBXR3IxQi9MNzNFWkUrSTRNYjBXaVZMRk9VNXk5SWYzM25GMmx0K3FVeXJL?=
 =?utf-8?B?N2p1clVjTXpROHZXY1pXQkRnRWoxNkYzZVlyNzh3NlZwVzlhaTVWbUx0U1hr?=
 =?utf-8?B?a3ArUkpiWUlnVXk2N2tSRW1KK0hYb25PeXNmSWF3YUd0WHkvYTdJWVlsNFRL?=
 =?utf-8?B?M0VlVmgyZUt3aC8rYlNOSGhPZHpqT2NyOE5LS3YyaUxRTlVBeEs2VFhmbmZw?=
 =?utf-8?B?aGd1N0JtTVljSHBDVkFoTE4ySzZ4OTBVNFAydHRLdHJNUmNhMnV6aFZiUllE?=
 =?utf-8?B?MjN4SklVZ29BZkFRZ0hudElRckxTQ0FNMmhmd2lBakY1WlNSSWlvdjlGQk1J?=
 =?utf-8?B?bXd0WjlNSjVYVkdWRVJ1d2FvOHM5K1dLWlMzNzVGTkw3ZUdoVm41K05KUGR3?=
 =?utf-8?B?OHVBOTE5NGNzKzYyREl2OWxNcFd3VmtSdFJqcUxNQ1JWeitjSjF2WjdEQ0pL?=
 =?utf-8?B?Sm42ZWJ4S25wVG5ISTlZSjlLSzJFN1BSRUpTWWhYVjNYV21UTFRpbXRVUXNs?=
 =?utf-8?B?UUgvWm1lRUFDUnZCVE5GYjBqZ1JGNk5iVUhsclFhNXRBdUJ0bDkzYmhuWkZR?=
 =?utf-8?B?Sk9lclpQMkZjMXhIVTM2ekJneUVXQlk1ZjRQeDg0UjBEY1AzVXlkeWpTWkpZ?=
 =?utf-8?B?Q3pkWmdHa3ArZ0VMU2dzNkN1anhvbUhVNWQzRVJBNEJqM3pBN1A3TlV3SXp0?=
 =?utf-8?B?VEM1YXhFaHBtMElnS01LR2xWMFlhNmtXVTlBNVNjWTBLQ2VDU2x2UFUrQnNa?=
 =?utf-8?B?QzdmMFBGblprUjM0bmpEdUVjSWEwVEE5V24yVTNVeTRCYXFpdi9TTDFVL25V?=
 =?utf-8?B?YkovL3pnZkNjdWFUcXdON2dPU3NjZ2ltZFpxNkhOajhYYkFEU1kvREtXUjdj?=
 =?utf-8?B?bnlFUkZvVkYwdW15R0pRRHFoeGtwR3J6bnp1UjhNTmVSNFhSVWU5dDVJL2Ix?=
 =?utf-8?Q?jNYtsxv/NCOKE4k1RKnR2PznX?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(36860700013)(1800799024)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 14:05:34.5679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f7d1da-4ca1-45d0-451c-08de1bab393c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9893

On 2025-11-04 1:32 pm, Will Deacon wrote:
> On Tue, Nov 04, 2025 at 01:26:11PM +0000, Robin Murphy wrote:
>> On 2025-11-04 12:35 pm, Will Deacon wrote:
>>> On Tue, Nov 04, 2025 at 05:43:40PM +0800, kernel test robot wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
>>>> head:   989b40b7578a2be7b0388522d33d751b257d59d9
>>>> commit: 8fa08f8835e57e1fd5e2994c9cf76c84dadc1235 [6/8] perf/arm-ni: Add NoC S3 support
>>>> config: sparc64-randconfig-002-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041749.ok8zDP6u-lkp@intel.com/config)
>>>> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
>>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041749.ok8zDP6u-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202511041749.ok8zDP6u-lkp@intel.com/
>>>>
>>>> All warnings (new ones prefixed by >>):
>>>>
>>>>>> drivers/perf/arm-ni.c:433:13: warning: operator '?:' has lower precedence than '+'; '+' will be evaluated first [-Wparentheses]
>>>>        432 |                 hw->event_base = (unsigned long)cd->pmu_base +
>>>>            |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>        433 |                                  is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
>>>>            |                                  ~~~~~~ ^
>>>>      drivers/perf/arm-ni.c:433:13: note: place parentheses around the '+' expression to silence this warning
>>>>        432 |                 hw->event_base = (unsigned long)cd->pmu_base +
>>>>            |                                  (
>>>>        433 |                                  is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
>>>>            |                                         ^
>>>>            |                                        )
>>>
>>> Hrm. Doesn't that mean this is completely broken or am I misreading the
>>> report?
>>
>> Bah, my arm64 W=1 build (which I did do in the hope of catching any such
>> sillies...) fails to flag that :(
>>
>> Truth is this is a fresh refactoring of the mess I originally wrote that got
>> tested by someone else 18 months ago, and I don't have any hardware to
>> functionally test it myself. Feel free to drop it and I'll send a complete
>> v2, or I can do an incremental fix if you prefer (I already realised I could
>> have streamlined the version check to a one-off in event_init as well.)
> 
> Damn, it's not ideal that we don't have any test coverage for this.
> 
> The patch is buried under some others now, so I can either revert it or
> take fixes on top. Up to you.

I've managed to break my git-send-email setup at the moment, so I hope
an inline patch is OK!

Cheers,
Robin.

----->8-----
Subject: [PATCH] perf/arm-ni: Fix and optimise register offset calculation

LKP points out an operator precedence oversight in the new NoC S3
support that, annoyingly, my local W=1 build didn't flag. In fixing
that, we can also take the similarly-missed opportunity to cache the
version check itself at event_init time.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511041749.ok8zDP6u-lkp@intel.com/
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
  drivers/perf/arm-ni.c | 21 ++++++++++++---------
  1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index aa824abc629e..66858c65215d 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -323,9 +323,15 @@ static int arm_ni_validate_group(struct perf_event *event)
  	return 0;
  }
  
+static bool arm_ni_is_7xx(const struct arm_ni *ni)
+{
+	return ni->part == PART_NI_700 || ni->part == PART_NI_710AE;
+}
+
  static int arm_ni_event_init(struct perf_event *event)
  {
  	struct arm_ni_cd *cd = pmu_to_cd(event->pmu);
+	struct arm_ni *ni;
  
  	if (event->attr.type != event->pmu->type)
  		return -ENOENT;
@@ -333,7 +339,10 @@ static int arm_ni_event_init(struct perf_event *event)
  	if (is_sampling_event(event))
  		return -EINVAL;
  
-	event->cpu = cd_to_ni(cd)->cpu;
+	ni = cd_to_ni(cd);
+	event->cpu = ni->cpu;
+	event->hw.flags = arm_ni_is_7xx(ni);
+
  	if (NI_EVENT_TYPE(event) == NI_PMU)
  		return arm_ni_validate_group(event);
  
@@ -411,18 +420,12 @@ static void arm_ni_init_evcnt(struct hw_perf_event *hw)
  	writel_relaxed(S32_MIN, (void __iomem *)hw->event_base);
  }
  
-static bool arm_ni_is_7xx(const struct arm_ni *ni)
-{
-	return ni->part == PART_NI_700 || ni->part == PART_NI_710AE;
-}
-
  static int arm_ni_event_add(struct perf_event *event, int flags)
  {
  	struct arm_ni_cd *cd = pmu_to_cd(event->pmu);
  	struct hw_perf_event *hw = &event->hw;
  	struct arm_ni_unit *unit;
  	enum ni_node_type type = NI_EVENT_TYPE(event);
-	bool is_7xx = arm_ni_is_7xx(cd_to_ni(cd));
  	u32 reg;
  
  	if (type == NI_PMU) {
@@ -430,7 +433,7 @@ static int arm_ni_event_add(struct perf_event *event, int flags)
  			return -ENOSPC;
  		hw->idx = NI_CCNT_IDX;
  		hw->event_base = (unsigned long)cd->pmu_base +
-				 is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
+				 (hw->flags ? NI700_PMCCNTR_L : NI_PMCCNTR_L);
  		cd->ccnt = event;
  		arm_ni_init_ccnt(hw);
  	} else {
@@ -443,7 +446,7 @@ static int arm_ni_event_add(struct perf_event *event, int flags)
  		unit = (void *)hw->config_base;
  		unit->event[hw->idx] = NI_EVENT_EVENTID(event);
  		hw->event_base = (unsigned long)cd->pmu_base +
-				 is_7xx ? NI700_PMEVCNTR(hw->idx) : NI_PMEVCNTR(hw->idx);
+				 (hw->flags ? NI700_PMEVCNTR(hw->idx) : NI_PMEVCNTR(hw->idx));
  		arm_ni_init_evcnt(hw);
  		lo_hi_writeq_relaxed(le64_to_cpu(unit->pmusel), unit->pmusela);
  
-- 
2.34.1


