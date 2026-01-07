Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230BA35959;
	Wed,  7 Jan 2026 04:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767761250; cv=fail; b=PRulgWG4QkIlXO8ZdoAmrq5XE93BBtw2p2//yoOY2IknP9SZuw1xRfMbm1M1IMn+S63tI/t1NnvBMnEBz6KBkZmsHoDjjdeAM5xarcRKQ5V5z1MKeBKGBgXFqM+BmsFaRQpCrnNLymNhqZ+wbaH1PBX1nC+zeWyE7lI6k8eXYC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767761250; c=relaxed/simple;
	bh=F058fAcITo+TUFcERnslXYTgN9u+UeZRAmRI3L509Uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fxhS40x4rWj+r12q1PtyFFb5SU4hEA1cnyD8V9v0p4wXSuax9FSOBPKj/XUmmYx8zYdjytrojG0SdFxffjzVsoQH4i6457NhAcLIn+Lh2HLlJCsfO8KSyrkgqtfxz1NbnjzOS3o8IbCjOhddUWHwX7t0hgoODyVF8WbOicR1PXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t4ngXcF/; arc=fail smtp.client-ip=52.101.48.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t4ngXcF/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVRX/FHWVo2UKGze5HnElqZLIMRxnFyrXMZ2lk1/2HDkyOLhC2Y4rJ75mxEm0VY0skMs3+H15cuVilXJnFLnjyz/WPUdFNja2byChKeK97bBrDxpNJ/C46aVmvuSehx9woctuWW02CyCyuLmyQcbEuBdTMCEYVaqlS4WSQPlhgAXSxmkgmMZspSDzYcuHQ6ZRWBN7JRWx2gmiyiPl7rNqdPxMJMCdSK9ywdbvUSKQCp3eHKo+8ms0wY7E7rRwq9Qp62h5xvdHP7vLnZh9FSD9eESFs2i71OGMCPzYOK8Brcc47+MUKpPxgjs1y7NiRdX6ZhhbMnhmR7DbFfc3qafFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rSpKbUCaCCWBgVJhnqjR6e0ncUUxe4l/+5Bc2BVZ4A=;
 b=CkeqdFfiI7Z0kaqSdpMQTbLxgPitxTXt7slzCZK5lVgHauUnCvjFXIwa5JNX96kMNF8zCoonXRfz6V3j7d3XNlk0aRZF0PFHCb4O4m3A1BxeH1jiS2M7QPddZY3LTAswI87MBipZatmLmiOY4+zHIa1DocQd7PvfZm2qJr0RAV0mAQTJKQc+eRhrE77526InfZTYP3/R/Ij2UTXFz80SOZCxMIdzB9loIt4fooD7khimc3k2rKtBA43MKXFY2NlhdrSm2e3AySnbdR3NazFLU8SFbVbSmefIHR8+20EgY3rOXYRAxqHN14O+QUUMk1njK1cE3WFKs+4dJsozJFJqtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rSpKbUCaCCWBgVJhnqjR6e0ncUUxe4l/+5Bc2BVZ4A=;
 b=t4ngXcF/NOjTHcDoU4TC/6Wy//Mh8jIa4u0U+qqYWhIb6MkLcPzEk7kUHeJIvQsrKHXbp2Yo+BxcQoKwWEG6G3HrlSs7B4dZkpBNXaJyj1MjHBfmBOigRYABOZ2KiN/085qXyzWS7x8wZo7oRf5JOcJ1IAIAOYYpoRPeU3Vdc1s=
Received: from PH8P220CA0037.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::9)
 by DS0PR12MB6536.namprd12.prod.outlook.com (2603:10b6:8:d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 04:47:21 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:2d9:cafe::b3) by PH8P220CA0037.outlook.office365.com
 (2603:10b6:510:2d9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 04:47:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 04:47:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 22:47:18 -0600
Received: from [172.31.184.125] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 6 Jan 2026 22:47:17 -0600
Message-ID: <38d0a88e-5304-48ce-85df-d5aa8cc72636@amd.com>
Date: Wed, 7 Jan 2026 10:17:16 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] cpufreq: Pass the policy to
 cpufreq_driver->adjust_perf()
To: kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
References: <20260106073608.278644-3-kprateek.nayak@amd.com>
 <202601062141.sfoMtUSB-lkp@intel.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <202601062141.sfoMtUSB-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|DS0PR12MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e442f2-e280-43b2-f481-08de4da7d6e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dm1OcjF3bFlmU1FHSDM2N0NFTFE1OHhMd3NTQ0p2ZTdNOWRMWERVTEIwT285?=
 =?utf-8?B?WWlYOEVrLy9JdW04SUFHWk1rd2xYc2lZOGxrT1h3T3JCeTFsZzRadW0xSjBu?=
 =?utf-8?B?ZkVFaWZGL3kyZDk3S2hYK0JFZVRvelA2SlRUQmxuRnBvU2l2Z1FYZ1p2dU9V?=
 =?utf-8?B?WHVqTWYzSEtlZklJSG5iN3BwaUUreWRBRXdpSGlrRUNEZStxd3FzNmUvZjJS?=
 =?utf-8?B?cDNxTTY1Q09Wdkk3MTVDQVQzemZVQWRQY0FFVGpXYzFkdHltSDJpeUVyUEJm?=
 =?utf-8?B?V21WeGVqWWdUMEZuT0tDanovU2lma2FjR2xTeXdVVWU2cGlOYnNvT1BKZE9K?=
 =?utf-8?B?UXFYc3R5YlhCWCt3aFNrREZzQUhBWFhhUHl1RjZxZmVzTGxSOENHM2wrWExC?=
 =?utf-8?B?ajlzRDJEK1hDNGJ5dlExVjl4SVhud0k5K2oxa3BEREVWUDRZYlA4SjNtcmR2?=
 =?utf-8?B?STR1Vk5VdzNXMWd6S25KNkhhUXF5OXlmZCtBZFp0UUl6WlNPWWUyTjBiRmd2?=
 =?utf-8?B?MkVCZzlLdXIzeWdtbWZINlBHcEQyeWN1M2FNbFpyU0wycHJvNHljYzErbkgr?=
 =?utf-8?B?aEpOY0FRQnM0elViYVNBZ0l3T1U2SEJQYmtkV01sNlFCa3dBLzViTGdZUHJi?=
 =?utf-8?B?Zi85amhuT0dsZjJFT2lYc0ZFVHI0YWxEUGNubytSWW5ROERwNFFXN2htbzdP?=
 =?utf-8?B?cDhyTkN3OVdaMml2YXdld2VtNm9BUEdNYTNTMEQ5ZnM0RjFoNmVmOEJmYy9D?=
 =?utf-8?B?UGxHcXJGVWdVLzJXa1A1LzUvZ3lNQnNiZjJla3gwVmd2QnRaVXlTejBMT3dh?=
 =?utf-8?B?bW01eEJ3b1JKY0hXZGRRbDdOU2N6N1VIczZTMVZXeWxNUDh1NVQ0bXVLVnBt?=
 =?utf-8?B?SHU2bVZUTnpXMFByMERzTVkzVzAxZk5jaGh3b0xiMnVRQlYwNmxGazNORkZJ?=
 =?utf-8?B?RE92RDhDNmM1RDltSDNFVFhpSnE5c0ZDZlZ2NmxNbXpreUFXbVpaM1RpcjRC?=
 =?utf-8?B?S3dvNDlYbk9wVy91ZHJ2RG12ZTgvUmU2UkhHVDk1S1MzTXFGc1ZtU3V6UmlX?=
 =?utf-8?B?cGFtRkc5MVRhSWsybC8rYVB4eUk5ZFBlQjYxaTUrMGlGYlo2MzVXMlJGM0lQ?=
 =?utf-8?B?RngwN1ZqWEdFSTVycFdhUHE2Nk1KU1B2RUZtZFgvNXZGZ2E2Y0h1VWZYbTE4?=
 =?utf-8?B?YllHY3NWYUQzN2tZNzdvZC93SUR3SzloZ2xGN1kvNE1SNS9mMlFSUG1ONEpi?=
 =?utf-8?B?Z25VSEpPL2RSbHFGM0ppUDc5UHhZWTRtT3JsY3dKdUtvQlhDU1RIQmJBc0Fx?=
 =?utf-8?B?NGpuUXBMYzdFOUExckxSeVdDVWtNREw3MEhsdEUvNjMrZHM5Tmp6TXVyKzlO?=
 =?utf-8?B?SU9EZXcySWNldC9ndUV0Q0JHTm5xU1FrNHpMdGZhRE9NVm5FVlIwTUZGZUw2?=
 =?utf-8?B?dnhUUndZR0wwaU5zSWJaQnhrMXVpWFpESzI3Mkc1VnZLNXdJM1o5eWVEZytG?=
 =?utf-8?B?bCtpUkM1c0lOem9sRkVUTWZVWGw1WkphT3pOT1pSTkI3N09Pd08wWlJxK1hp?=
 =?utf-8?B?Y1Y4MU1CM2ZGZUhWQlRpV2VUc0dqN1VEbDJHRTlJOGVvbzVDeVpWRUFaWTBM?=
 =?utf-8?B?Qy9nem0xVFpSaDJnU1J3NjMvd3BPR0JvRXpwdWpxOVgvYjB0WkVNRFBhV0hD?=
 =?utf-8?B?bTlGQWFGdThHT3diRW9lajhjdEk1emF0Z1FKQlA5bENJUU9acmRLWlZqQWc5?=
 =?utf-8?B?RzNjcWh6ejBJNGZJYzh3S2xqdmx5QTY3VDVBYVYvVTJ3UHdWazBHOWhVb0VJ?=
 =?utf-8?B?b3RDZHQ4Mko0bkZrS3BFSE1WU21XUVFYdUJYOFBMSUY0V3N5d21VVHpVRlla?=
 =?utf-8?B?NG1weG5ZUHZsTktxQnBUL0xQVjdPM2ZZZTcyQzNKUTlkRmg2aCtHcVVHeSth?=
 =?utf-8?B?Wnh3RmZWdHJWeGg3NkpTRVN2UUVFT1JuQm40TzdCSUhITjNidCtDZis5ZFRY?=
 =?utf-8?B?OEpkSGZqc0N6dG1qcnV0aEpyclZRRDdRVFlmMjZleUN3NXdxVFIwbzliVXVz?=
 =?utf-8?B?L1lUZG5aNHh1V1JuYS9oVC9mME5EalcrZU83a2NDcVRmZ3owTE0vak44blNY?=
 =?utf-8?Q?LdSh8+ziLvaJBwUILZ+spefoG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 04:47:19.2918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e442f2-e280-43b2-f481-08de4da7d6e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6536



On 1/7/2026 2:11 AM, kernel test robot wrote:
> Hi Prateek,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 8aa9e2868a8e38ccc5228399fc641d54aea444ed]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/K-Prateek-Nayak/cpufreq-amd-pstate-Pass-the-policy-to-amd_pstate_update/20260106-154118
> base:   8aa9e2868a8e38ccc5228399fc641d54aea444ed
> patch link:    https://lore.kernel.org/r/20260106073608.278644-3-kprateek.nayak%40amd.com
> patch subject: [RFC PATCH 2/2] cpufreq: Pass the policy to cpufreq_driver->adjust_perf()
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260106/202601062141.sfoMtUSB-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601062141.sfoMtUSB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601062141.sfoMtUSB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Warning: drivers/cpufreq/cpufreq.c:2250 function parameter 'policy' not described in 'cpufreq_driver_adjust_perf'
>>> Warning: drivers/cpufreq/cpufreq.c:2250 function parameter 'policy' not described in 'cpufreq_driver_adjust_perf'

Looks like I forgot to update the doc

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 8bdc8f9b8d86..87fcf9456dbb 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2225,7 +2225,7 @@ EXPORT_SYMBOL_GPL(cpufreq_driver_fast_switch);
 
 /**
  * cpufreq_driver_adjust_perf - Adjust CPU performance level in one go.
- * @cpu: Target CPU.
+ * @policy: The cpufreq_policy object of the target CPU.
  * @min_perf: Minimum (required) performance level (units of @capacity).
  * @target_perf: Target (desired) performance level (units of @capacity).
  * @capacity: Capacity of the target CPU.
-- 
Thanks and Regards,
Prateek

