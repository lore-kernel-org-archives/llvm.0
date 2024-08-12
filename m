Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2D637B;
	Mon, 12 Aug 2024 04:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723437048; cv=fail; b=BHmGilb0KvDsT53CbkH8bJJNR7rxq4woGXzyY12HyGy7J/DOZepW+pLAQqzFBWKwQ4M/fW807LBtom8Fvo7PPpL5xzkieuAdoNEyLtdQnwYzhV9Gg0f0o8lfzSUiH3gC0OPzou5+62eAGZ6CNYcvTNXhsEemlX/ld2rjSJP+ZH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723437048; c=relaxed/simple;
	bh=QbeQxTKGoz4+c14ojtUqpiOwJuH8SqY1lzB5w818naY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cb1KbYNRSq5Rvu6LG41XWP3MzLQBZ0nVrBsjdY7V1H9uzRod8iOpcWDNEF7cWi7s2G7r9Ubkts1jEUUfQIzo8y7zSXkYV2hkHKA8cgl7bzqzd8o5nc79/gl4InyoWUUsyip9VW+083olo6So8FgdLFNcITPwmiD9TXCfBOtok5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s/9Vnumn; arc=fail smtp.client-ip=40.107.100.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s/9Vnumn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKqW5F+EMaXMCjWWDKFIa/yyFkMaTPPxNWSKE7eWZnbpz9VeO43u/Ujr3M+3H7zcYTJaUB741El/INX0WFnLIHD1bt3UVeBlO9acR1cq+i89yN7d9rKCLhAnyLYoX1UEQqF1CezfQF899dBxnD3OVjDZW0/mTYy2AF+9ZU1knlmB/WFICOA8gq59T1thTPGFO2gsgLdxlRPSfZoCWmOQlb1+QADH6oIu2GoNJJT6ZmPfE8LPGKxtgrSUIrGy8v3LG4ODxifKCBisW4G41tn5Pr/L1njQ/CeF1pjFwzyG5Grgm1HDVaUtXxdzP2kvsflhsQ5jifH/SyLTPkLvthK1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96APsr0G4PjpW7gVADe/tJ7JQf3JXIS67zStInFbRaQ=;
 b=awXFNSsyUB+aDELgKM9R+plWvVQGgT/Gwf9AFhcinckt+E2SRRyv605MjpZl0pk0APIBz7OOnotwE/aBvyYDY8mKhFjWbzUMKECn9hutUL+MXHoz754Mu4iY2r1FxG1GqfNFN44+ZW/ZsmrQXJdGjcI3B6vUhthTI5g2wZKF2sJMFC1GYfdfYhZh4Jdx/aKg5xHjozECkY9tVzbvYof22Jdii277knBSjYuOJPL9z3r2jqus6uAx6jtGN8IlyWZ7PP/D30tkTRsJukaPS/rCSu2gy+iQ3RC5vD1YLylw3zVuDO08TMXwgk6qtttHlF6iZJwE7bcvBKbrpGWXyo8TbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96APsr0G4PjpW7gVADe/tJ7JQf3JXIS67zStInFbRaQ=;
 b=s/9Vnumnuq12tOHvVkJRdK6j15jgCVA8Exz3DQbz3xXTPXwj0P5s3eoHujB0mn7l7V1aEchL/22QUBTPG7UZEONYbY2JMLTqBWHHN0hk1WAf+ErVHsyGU/yacc09hhoxEX7qRxMBBIEeATgxSPBvBbzA4Z5lhB5u42S0yILVevo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CH2PR12MB4248.namprd12.prod.outlook.com (2603:10b6:610:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 04:30:43 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 04:30:43 +0000
Message-ID: <b9a39271-1ec7-45c8-b52e-f3cd675a12cc@amd.com>
Date: Mon, 12 Aug 2024 10:00:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [broonie-ci:filehZ3h8g 26/28] sound/soc/sof/amd/acp.c:407:14:
 error: no member named 'pci_rev' in 'struct acp_dev_data'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <202408100634.3r9TDvav-lkp@intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <202408100634.3r9TDvav-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PEPF00000183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::49) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CH2PR12MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: e25fa881-5364-475d-860b-08dcba87870f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODFMYzJrUUlRNzZKUUVPdU4wUmtLeVVuMW1GeXJldFoza01pc1g5TGlka2sz?=
 =?utf-8?B?Vlo5eWF1dHA5WUthSWI3blh5dEdneEo2SVNWTXF4bVlBQlVXRUFmdy9YdlBK?=
 =?utf-8?B?V3VLUm0xLzAxdDlCMTlYYlBBNVk4K2Vudk9ZQnpHTUNsWE8weXZBbGVyeEhs?=
 =?utf-8?B?SDg3aEVTR1hIbERJM0s2N0xVa0dnTm5rd0hzd1NnNFdMTnNtZHBLeGFQR0ZF?=
 =?utf-8?B?VzZkRXNBdUNXbG5WV3FkUDBoTjhrdlN2U2pSNmhLSVIrWHJtcUVTdEs4Vmpq?=
 =?utf-8?B?SGVWcHMxZUV0K29NZXJob0I0TDhHNXM4VnlRWS9MY0JYZlFsZytnQ3h0cXRN?=
 =?utf-8?B?SUtmTk9aQy9IbmRNVkRqMzk3cGhMSXBSZXJ4cTVhTXEyekRLZEtQekJmMURR?=
 =?utf-8?B?YVBCN3o4clBuMTVmOGcxQjFwcUREVy9LOWhUOWxySFZrdWFGUHdScTd6eGtZ?=
 =?utf-8?B?QlpIdUprZHNJSjB6SGhjWk45bjNnZGlJTlQ2RkZJb3Zqek5MYkxhQ1RKd3FK?=
 =?utf-8?B?SWIvM1JmUTI1U1hreUpzbnZmdzdvQXFoZnIwOXZsbm04bmlKbmxqdmlwNWQz?=
 =?utf-8?B?bHhjWVJYdzdHYUpiVXNkOHphSDRxRjY1Sk9ZRUZpeElDRUs2WVNPNTFUdE1O?=
 =?utf-8?B?RW84UCthdDZkR3lYQjBQY2xDY204amRPdlpEckpOMGZ1VjhkaUMrSm1WMk03?=
 =?utf-8?B?SVpSMzNPZnVKSWZHUktGek9nSzVHczdDWTUxcU9zYU1MQVh1TXlVdWVXa3l0?=
 =?utf-8?B?bkVWTFRXL3N4RlY1UTMxQkZXbk03a2VBd2JDZys2ZkREOTNWSVAzbUV6T2Uw?=
 =?utf-8?B?eXdiQWRoQVJVT1JRV3V3cHZaWFIzK3VOZUZuNStUd2JTQ0NsVDJscjh5OFdz?=
 =?utf-8?B?cjJYRXF1aXBPRng5d1AvaDRjcDQ4VnRQR3hSMjNYcTFkeU1Mb3lRRFZqRDFZ?=
 =?utf-8?B?K1BjTVozQXE5Zmg0VU11cHQ3dFdSdTZaZU82aDBMSkgrSW85OUJsTGNtN1hK?=
 =?utf-8?B?UDROaTJhNHhGMkd5K0NYZGRDNHRHSFIzRlVOQUNPbUo0Rkt2SjgxN3Vhdnl5?=
 =?utf-8?B?OVFvWjVBVVljNVVGQ3lhd0k3d1dJN29BOXRwbjRSeVJZNG9lZW1wdlpyK0px?=
 =?utf-8?B?d0ZPdTZHb2xLZU8wRG0xbUpHU2RkL3hnTGhzYnQwa3FRZ0phZFc1S2pLMDlR?=
 =?utf-8?B?amN1RWQ0V2c4cFQwQitZdWNGc2czc0E4eEFyNzMvU1RSRUNCVlVJcU5mdGZs?=
 =?utf-8?B?Q0YvZ29DalpPSktOd2FUZTFWMkdxMzdlU25Ld0FUb2tQb0ZZSjVkakhjcE55?=
 =?utf-8?B?LzNsVG4xRlNtYVJ1VWhUMlRlKzBrOFFUeTdSdFhLcEpnTWIxZ1Nsd1ZDL09U?=
 =?utf-8?B?dW1CZzg1UDRlYTA1c3JSMlIxRFJ5SmdpMnBHNTdZRHFwU0VGM3lGclNzV3ln?=
 =?utf-8?B?QmNmRkE1R0ZGTkN3NjdmYksyN3drT0s4bHIrekIxSXJtRVdhU3c3WnoxbFJ4?=
 =?utf-8?B?cGtac3gwZW5JS1Nsa2ozUEdJa3lBQlZPUGpLQ3RJS3VBdkRwcFQxS1JQOG4x?=
 =?utf-8?B?QlY3Rnh2Uk5waWNFeEluUUlqOVZGUDRWWHIrZ0thNk1ZM0FydlFPSXpxVEdO?=
 =?utf-8?B?SzhXNHZyQnMvVzVXK0o3cEtoWHZodTE0WkQ0UFN2eGdCd2UzYWk3T0RCdzJl?=
 =?utf-8?B?RUcxbDg0RXRZbG10YlVreFFNSEtia3pIYUZBY2dsQzJJNEVxMjJQeC9pZGZ4?=
 =?utf-8?Q?q5g5EKu7t7Mpmyqp1SLPYVEEtYQi0TYG9rY8qI/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDNmL3hjS01LZzlKTWtnNGlqWXdEaUtDdVQ0ZytnaFhtUDZKSFpSQlR5VjB1?=
 =?utf-8?B?WHVnUUwvQjlCZ0NTcnZwOHh0UXo2MWZBeWVaWjlLUFl6NzdRVkVlMHR4UWd2?=
 =?utf-8?B?RSsxNVhwUkFtMk1oekpPYU5JQjhTZUIwRTZ3NDRGWWdUSnVtTFRnRVlrUFda?=
 =?utf-8?B?MzI3clBMSm1xcWNTQ2Q4RG1nYkJVN0xpa0h2cWhzdW9wcld6ams0T2xlTk9S?=
 =?utf-8?B?QzNKTkFSMGhwRU8vdmcyRzd6MWF3emF3N2pyUWpYUHdoZG53bFYyMXBOeDBu?=
 =?utf-8?B?OC9xeThYQ1pQY3ZMc3FPYWRiRlJpYmdaVVRqODhaTDllcWZ5NW1hN1ZvODJi?=
 =?utf-8?B?S0lsN21YTTVTOG0raFpCTmNQbXRTOWlSeUxnQiszcVhEWHFlSC9RWThONkV0?=
 =?utf-8?B?QzlGV3MwVWNJQmMrN084SHpGV3VKNm1IRzYzV1hHT0s1TXZyZmRhc05FbUw1?=
 =?utf-8?B?NlJNaFNXa3JZZGw1OXlZTkRQOVZFUEFUMDN4NFBZdDI4UkM1Z3d2RFhaZE9k?=
 =?utf-8?B?VUZwZ3dCSG0xYlVZWDZMQUZqS2RWVDZMRWtPNEVhbXUweklHWXJGYzdsN0hy?=
 =?utf-8?B?QmR1dU1zVGtNQ1hZdnA2NVdraHViK0prL1RIYjJHNkxYd0duUDlKMGJnV1dz?=
 =?utf-8?B?WnViUjF4NlAxZjM0aWRaQkNEZUg1MUFpQ1ZYQXhFb24rNk1wVnFLQlQ4UFVy?=
 =?utf-8?B?YVpLL216NjRZSDlHVDljUWkyUlVQYVFWbndQSi9ER2FUbk1WbVJjKzBmTHVV?=
 =?utf-8?B?MkNmN2YwaEladHBGcVRzSDdGT2k2bE9lUnZCbVlXS1BiN2ZJdVQxTVBLajNZ?=
 =?utf-8?B?bC81cEVXN3A2MHFsb3EzT25UVUhmcVMreklubkcxUVVxRnNtdEMra1luZkU2?=
 =?utf-8?B?UE1HZURzK3ErcTNDZU1MUEoxSHBvaWZUalNDKyszc3NYSlRieDA2TjhEOHNY?=
 =?utf-8?B?bGNhaXJPV0hkNnhGQktkYWU1eG5ScnZTakFVNFdnNGxtUG1MWG1adi9QOW5U?=
 =?utf-8?B?NHRQVmxhNDlwbzJ0OStNb1pzYVZsOHZSWEdJMEhSZGc3NHRMNXJpRnJHZ2JX?=
 =?utf-8?B?bnM3eXVrZndYWXNQZEhXVXp6QU9hZjgzdlZSeStNSk5Gb3lTcTVmVUVPNXov?=
 =?utf-8?B?NDU0VmsyaWlKRTJuZURPWTFUNXdvYmQvMDJsRld4THBNT2JBYzNuV2xwaVFW?=
 =?utf-8?B?VGVWaFArM1U4amxrRCs1VmVKMzZZckZBNEJMNUdVSTMvT1dtclpWclE1Y2Q5?=
 =?utf-8?B?K3g2Yk9HVm0ycjhOVi9TSGNiQXNncVpxeHEzOU96YUVsajYrWEtqT1J6S0Jq?=
 =?utf-8?B?ME50SWZVZnZ0TmJjczlOUko0eWtWTVRCTE4wL0IydUF6QVFvYVhPVUF4UDFm?=
 =?utf-8?B?cHRrOUVmcUxndEVqQ3E0UVVPalZDdU1zY1UyeTFqL2xwMnNOS1gyei9zbkZt?=
 =?utf-8?B?R2dkbjJGUWNHY3M4eHdZZVpqcmZZSkk5ZzM2bTYxdEkwT201bC8vMCtYaFFE?=
 =?utf-8?B?RWRPUVJmM0VPU0xVYXNtbHdrQmRPcWEzRnE4V043ZkoyTURDNmZlK1VPUEJK?=
 =?utf-8?B?UHEwUnlIaGJMdC9LQ2g1OGxaVUJMS2MxWEVMMnF6SXNLOUsyQ2VzSEI4ZzZB?=
 =?utf-8?B?dWU4OFVDQVlJeUpmcDFvSXJPTTRDK1pEZitYTktyb2xRM2N1ekF2TGNFNHE2?=
 =?utf-8?B?V0FuZHN1MkNiTzE2bUVkZzdwVjMyRHIvMGQ0aGlyWFI4UGwva1A4RGtaRFdM?=
 =?utf-8?B?RlBSVE1EM0tab05CeGtRN0k5NVZyTk9ZYmdBcUlSdXY2N0g4UkdPVFU1NFZz?=
 =?utf-8?B?TmtmU1R4UXN1S3o0K1k1SUhMcTBtODllZ3o3WStBQ0J6cUw5SW96RTVRWkor?=
 =?utf-8?B?TFRzdlQrT29ZTDZLUHEyeHVNRzVCWXBXOFlQRzFKNGhiT0V1WUxIRlFBNTQ0?=
 =?utf-8?B?WEVQNngwZzRIdHozeHpTd0kyMXBrZXJLbkRwUUpjTzVSMis4eW8zeUsxLzFi?=
 =?utf-8?B?T29GdWlkNmtUelY1cGNNY0I0UzBLWWhZbExLYmZVaUI0Qks1TTh6Z1k2OEx5?=
 =?utf-8?B?bk12a2hDWml2M3pVNUI1dWU0U2tURFV1cUFQT3Z4dGFtNEJEWjJZYkF4Y25l?=
 =?utf-8?Q?LKpgslKE223o3sOaiwE33Ihw4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25fa881-5364-475d-860b-08dcba87870f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 04:30:43.1991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mF328tQ95WeeTQ4gm80LS5ZbmMvO9zfuojzPhYlDyiyDegHTO5WWzCsTPfD9JYjctGOM7ukIHvWhvbyUzPgM5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4248

On 10/08/24 04:21, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filehZ3h8g
> head:   45576eb691a6ad128c577d4b904380458359e3e5
> commit: a8d93b9b3a43cbb342fb6d37c0f0ad5a1a0e503f [26/28] ASoC: SOF: amd: fix for acp error reason registers wrong offset
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240810/202408100634.3r9TDvav-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100634.3r9TDvav-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408100634.3r9TDvav-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> sound/soc/sof/amd/acp.c:407:14: error: no member named 'pci_rev' in 'struct acp_dev_data'
>      407 |                 if (adata->pci_rev >= ACP_RMB_PCI_ID)
>          |                     ~~~~~  ^
>    1 error generated.
>
Dependency patch is missing resulted in build errors.
Will mention the patch dependency and resend the patch.
> vim +407 sound/soc/sof/amd/acp.c
>
>    377	
>    378	static irqreturn_t acp_irq_handler(int irq, void *dev_id)
>    379	{
>    380		struct amd_sdw_manager *amd_manager;
>    381		struct snd_sof_dev *sdev = dev_id;
>    382		const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
>    383		struct acp_dev_data *adata = sdev->pdata->hw_pdata;
>    384		unsigned int base = desc->dsp_intr_base;
>    385		unsigned int val;
>    386		int irq_flag = 0;
>    387	
>    388		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET);
>    389		if (val & ACP_DSP_TO_HOST_IRQ) {
>    390			snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET,
>    391					  ACP_DSP_TO_HOST_IRQ);
>    392			return IRQ_WAKE_THREAD;
>    393		}
>    394	
>    395		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat);
>    396		if (val & ACP_SDW0_IRQ_MASK) {
>    397			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>    398			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_SDW0_IRQ_MASK);
>    399			if (amd_manager)
>    400				schedule_work(&amd_manager->amd_sdw_irq_thread);
>    401			irq_flag = 1;
>    402		}
>    403	
>    404		if (val & ACP_ERROR_IRQ_MASK) {
>    405			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
>    406			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_sw0_i2s_err_reason, 0);
>  > 407			if (adata->pci_rev >= ACP_RMB_PCI_ID)
>    408				snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW1_I2S_ERROR_REASON, 0);
>    409			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
>    410			irq_flag = 1;
>    411		}
>    412	
>    413		if (desc->ext_intr_stat1) {
>    414			val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat1);
>    415			if (val & ACP_SDW1_IRQ_MASK) {
>    416				amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
>    417				snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat1,
>    418						  ACP_SDW1_IRQ_MASK);
>    419				if (amd_manager)
>    420					schedule_work(&amd_manager->amd_sdw_irq_thread);
>    421				irq_flag = 1;
>    422			}
>    423		}
>    424		if (irq_flag)
>    425			return IRQ_HANDLED;
>    426		else
>    427			return IRQ_NONE;
>    428	}
>    429	
>

