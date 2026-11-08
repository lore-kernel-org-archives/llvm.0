Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794138118;
	b=q/yfUVxM3RsDMv4mUxpPRpe9gQ1G3IwTQvyvY5JCjE5F8OBWKKNAjdJkLCITdyRJeUQt
	 HwGamtvwFsrYHKwhwK0jDzUal3x7cd2yQG4jd8FWkomEJ49icvA493F0oOQa8Vbu2uuFD
	 cmKc85UJ7/mchPsTuUWzZaAnRJ0bi8W/6DYd7lWzjh2JZll0Mzay3JP2aCG5Xynb/clxe
	 Rh3BVt7OBhk5uomwlVYLQFLsR5+I8YhiiWmJ57Q+Z+BsopHcWxkwKi5u8+WODFkWQWslF
	 lpAhbUWcwkrreczihjModF/xoDPPLh2bSGDxsmhN2F/uErT9oztIbSd9i0Nz1YTD/Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138118;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=myMw34dGJqbO/vkvWv3Zhx/t7ID60GQZH/7vGkh2DxQ=;
	b=PMGbP+Vi0mSj0rCJZ0aYFpkQZqR3c9IbPv1o3NznweiCB7jK5SZUDCxWMdye23oaRmnH
	 sPuFraCclxmU5wOWrfLqiyVVsThC7SVg31bjxD4mad5yRvbkk0Dg+JuN+deJba2KlLOIg
	 Xv4oLojMpAcg4bWv7d9SlLXp9zarC2Tsf70jO52ZvYaJqf6fHosIDmp+MQ5IZQY6MDp7H
	 noIBfQScwkuy2JwtPR3F+a3ibTCvaY6tnQEgTtnM0yPAuNejZyCaOKJ3CvdZs687U/gbc
	 9iTNtAVxc2eplYEE0GTof/WcH3nj9A1HgcoRSs3x4xOusPO8RcsgwO/PBvWDkMcytZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xTGAWtc2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.51
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860EE606A321;
	Sun,  8 Nov 2026 11:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860EE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xTGAWtc2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVGhSFhQ357p1erMICop+d2sK6TX+94A0m5QPis4aFJHoGboa5PMl2SxgvnG6HC/mes6ce4wJF+2dd6yDzfGLJs7//VYh4+C2mNGF9jH7LsDqdMZYzvmFkg73p5TBBDzvBBMDcZU1fdryBZi2c0lSr5nSoW/8r74w/yC/SeIJzXb1SlrJyOZmjxh6Wp1zaRpZuxDwV8eIJB0sG3e6UB9imOHT/2W9jk45LeJWUD2keU//2w15Msz/YERf1/tt3kLMeyHCFKiJ1WC6PRP7EW3DEty18eDhI1XWzOIDXZGifu9I58ZY7WO7J5HRAE8e11/kROalP3n2dfiEDlOx9I0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myMw34dGJqbO/vkvWv3Zhx/t7ID60GQZH/7vGkh2DxQ=;
 b=NDpmfGBdbI+KgTXuFeReMB8mWE8d22l+wT5x6r1l6qnnSdJKGKx/yTE4tPfYVtWO+mPyOBnxGAvptEbAnzEYM4WyfLRvmgy19ndsqWCQi/+CO5xCknEqBCIBJNvJxgHS7295pZIC2lsB5nIGL6jIHBRBj8y0847psYVOrPGpVut0YLfeRQ7y/wafYJqqqckp04UXgG3CVQ5wMWvkzJrM6nxtOZRcpdlQJTWj0UFU93OZlUAhtekK9cPU/4v5zHNp5YXshf13WDchEMw0eozKArlMgj+uvxLUWIZMdZYpVswd/nKI1qtpw8zzcPN6IKz+6tjt76TWPminlf6fyi6bkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myMw34dGJqbO/vkvWv3Zhx/t7ID60GQZH/7vGkh2DxQ=;
 b=xTGAWtc2xmiSXu45AsnC9LK0r7TcpTwLGIz7Qh8gPCSHo7wRTnCLlgVwkZNUzu42sXN8zWV5FYskEU+v7E8j7cciJrI1GSQ0vZyWynrVp24GPrSpZwn2mGMXUoSMUbPjCfR4wTHtnKRvAX/gt+/rdMg0Ql5Vo2pQSHdDHrlWEpQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by DM3PR12MB9351.namprd12.prod.outlook.com (2603:10b6:8:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sun, 8 Nov
 2026 11:41:52 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.010; Sun, 8 Nov 2026
 11:41:51 +0000
Message-ID: <86544341-7c3d-43e2-8e92-163750fe6482@amd.com>
Date: Sun, 8 Nov 2026 17:14:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: SOF: amd: guard SDW IRQ work scheduling with
 interrupt_enabled flag
To: kernel test robot <lkp@intel.com>, broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, vkoul@kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 lee@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261107175339.3547918-4-Vijendar.Mukunda@amd.com>
 <202611081921.O3dE9COW-lkp@intel.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <202611081921.O3dE9COW-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::11) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|DM3PR12MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb70fc8-2633-4c62-e348-08df3d8d47ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006|261028144727099003|261026121527099003|261102123227099003|261022115727099003|261022075727099003|261022105027099003|261022113327099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261026140227099003|261026135527099003|261026130827099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	BHoF7FVBcuIubLw3uaebgoVTEz0I/iNsfiCMj2hvqoo21K5AlJrsjQzUgQONskGZGk8J+G0o6Kap4XKCq4aMdeNIAn1HauJ6+VJ3Uk0lAJrXvN7dqAJRFGNk0CrlAvzrWXWcQN3mCmf+xjGUQMZR5QFAp2iR4pXvHMznV5+4fn6DgqyP/B5C/oUYJ/WVH2nZ4yzSpBdXc+XBEQ4T7av7EBpdsIeMuhOWlGq+RitxiIguTsE28yNGtIJlXYgeh/fwolcLE073z2xKxlRa7DjJr7F+kwdZnMHtfD9NMoO6nUj7EiVhjPz/9bvS616jRDbGQtukpSOknYi4APQ4vXQwfnKlM5uJZ++/JwjL+oje3JOYj7WuYxS0kLVZB5Hc1jncr+kFJrE7sl51JE+9Cx4eJBdUCAyhk4x/aR7XHcqjJU5j9L0FEm+1+Cr4lhRzp33U7SY52dVOz5Y6Hron+9A9UvtxekknXU6Q6UVp1yJKH2fF55ZGKMD+zuzlmcn9YuPUIx0+/9wGRxg4vjAtAltiGbKS5wi4W/tBITSWgJ2Itcjyk+u5FhOjZUth3JDYhwF1kerlfB0zQ4lLdKJGO5+FtmP272qQocBrCrDCq5z/9ZY/57VIL34JCeGMhp51o4kA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261026121527099003)(261102123227099003)(261022115727099003)(261022075727099003)(261022105027099003)(261022113327099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261026140227099003)(261026135527099003)(261026130827099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3NITmhyeUdqQWE4SzRGYnc5Smd1SVpTcDB2ZDdPaXd1eTh5ZkFNVkVwc2tI?=
 =?utf-8?B?ZnlhN3hHSjZ5aG9WcVRTdml4R3hvdjFRNVVNYWxNRS93TGdZQUJvVEgvKzBK?=
 =?utf-8?B?Ym5NeGIxWEJ6N3ZPVjZuVzc1S2YwSGM5ck80TVo2Y3cxaDdGQ0lUYVRMb2Nx?=
 =?utf-8?B?ZE9lWFpmaDAyVGhJTndFRFh4YjNMelJtcGxNZ3ZBU3NyQ1VVeVkxcTcrTVpi?=
 =?utf-8?B?bFhmbFhPM0pTc2VUUEd0eGhxMjJoMkYxUDkvL2swWUhtVTBLSExVd1hwNmc0?=
 =?utf-8?B?Tm1UWnU4Nk1tR2s4SmpFaUNzVE1ISmNieGk3OGxydjNiOE5iZmNibUN3ODhQ?=
 =?utf-8?B?OEJLV3hXL0g3c3B6WW1wOVFEYTVCWDRoTllvdzNCSE95dmNrcmwwVUpkSDJ6?=
 =?utf-8?B?VEkvK1B0V2pDMlpzVUk3QjVhOXhuOUh2RmZZZnVzdE9QSHh0eURIdmFvQ2pC?=
 =?utf-8?B?THorNURoZkgvZGs5dXlydTIrSldCUFZMNSt0bFd5M3YrbFY3YlhYRFRxdGZX?=
 =?utf-8?B?TnhESkllOHhkUGNwWGlVNnZZOHl0c1ZoOFlibUkyeURYMlc3ODRSdFNveXV4?=
 =?utf-8?B?ZWRXME1odXo5UVBxZXA4YzhtUkkxYUo2ZDhtN3hsb3RMQnlWYjdsTmUwcG03?=
 =?utf-8?B?MU5oRVBlRXJ3M2lKdVZXSC9KbjBNak9seGlEZk9QQmZQMHpmRWZCbHcxNW1l?=
 =?utf-8?B?Rk9yOXBEMXFxbmh1NTkzVUpCQVczUjVFckIrNkh3ZnJhWExjYmhQNGw2TDVw?=
 =?utf-8?B?NnNQRmRINUJaRlpGa2dlbFNrVkIvTTJRU2tsbDkzdnVQQ0xOVkgzR3FTMytp?=
 =?utf-8?B?eUpHTVFXZS9FNTFnNFQ3aTZZb3RRVG5XTWZzUDBIMXhBQVVOUy9CdkRneGRa?=
 =?utf-8?B?M0VGQ3ZkbmpCY1R5UEdBQnJ5UFN1VG5zUFFMUnBRMGpyNTRLSm9JaFRBSW1V?=
 =?utf-8?B?T29JNXVyWTg4SFB0dVdTT2hQalowVjJ5Zlh2N3F2NG1ZT2VIdjJCQ2FJVnJw?=
 =?utf-8?B?RWtlUklTNFc5UW1GUGVMVDhhT0hOMHUyb1NzcU1tSkhJQ1Y3NGVOWDNHMkNl?=
 =?utf-8?B?aU92VnN2RFEyeWg3Z1ExQlZwOGFIY3ZyWUNENTE2K2dXek5WZ05ubGpiOThO?=
 =?utf-8?B?WXlhdFcrZnlqTWVHLy8zRExyWmhkb3Y3VWdsNElESktac2txNkttb0lid0Zl?=
 =?utf-8?B?ay9KYnNQWEN1TDJOcXh2NnMyRThURFlveWxpeTZLWUxqa2VTaTBGMTE2K090?=
 =?utf-8?B?Y09VSXozTjUrVXBTdGJ2Y2h1SURvVVJPMFR4N3c4WG9wWEhwM2ZKWnVsUlUr?=
 =?utf-8?B?T0VPcE9GVm1qVC9OY25ENDBXbW1meGpzc2x2NTRQeFU1SVM5Y1VMVitNMFJu?=
 =?utf-8?B?YW5lN2Fpd1dOdUpsb1B1Um1pTUJkV0hHWjRZR0pRcmRCY1lGQTJCMUEvdnN3?=
 =?utf-8?B?NklvQmJGL3RxVUY5bW55ejQyR3FlellsU0lTVmRxa3JMZ2dYb0JsZ29KRk9S?=
 =?utf-8?B?VlIzTk5EbHhEdkVad3ZaU2hmcktqZEFUdElYekVzQVhWUG1kdmZ0MXcwZjJj?=
 =?utf-8?B?Q3AxNW4rQXdadFN1K3kyMzA4SkxiMS9NTTZKaSt4R0ZzcVZQbnVXOEd5TFF2?=
 =?utf-8?B?Q2R4TW10OTFkMHp4YUVhSGdwREtvTzFid0t4MVBsaHQ1djBNZ2tCV01hWksr?=
 =?utf-8?B?eXVBdG03Y2ZqT3Z0NFE2M0tIamdOenkxMEtMcm5Bc3BOUkoveHFLT212Y080?=
 =?utf-8?B?dEM2QlJXRjFYTmZBWUIyTXllRS9TWHZNZEt2L255S01EWEpsNzlUcWJRWGxT?=
 =?utf-8?B?SGNnajBvckhPczBiTjI1SEJDUzJYTTdDWWdRc2NFOFk2T3FjNDVNby9KclhE?=
 =?utf-8?B?MUVkSWJURGw0QmtpU0R0TVRRcGt0b2JZaXVxLy9oYUVYTmJYbjlEcUJ6UlYv?=
 =?utf-8?B?cmFQb1kwK09lSGNCL0tPOFhJZTVGNEl0VXNrcTFvamxYOFRKU2haK21tTVR3?=
 =?utf-8?B?WTR5QmJEWVRaLzJWT2ZEY294eEZqQ3IvNzhaWGFydTcvK0ViK2VGdk4xb0hp?=
 =?utf-8?B?SEFlUlNtdlk2eDhodVprWi8rZm9SaGZPWHh1MHRlcVowMVpvVjRrdXpwcEho?=
 =?utf-8?B?SWx0TXFqYlpXbUlUT0k1WEt2MHp2dE5oVVh2WWpQOVFJK201Q2k4MGNkWU84?=
 =?utf-8?B?L2YwS3JSLzB0blRzalJCZVdmbmJXTWhXbDlRdmp1alYycHpKdGdsNFhSV1Ar?=
 =?utf-8?B?dUlwVTZETVREenJ2UFhSL1pKOTRteEN6WkRpU1FFTDdrRld2T3l4cUhJMGhH?=
 =?utf-8?B?NDZGbC9XSnEzbVo4UkdXZWQxVCtnR1pyeVRBSmZhaTk4dW5pZlZpUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb70fc8-2633-4c62-e348-08df3d8d47ce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 11:41:51.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3s1TUy2OPNn6WW7lqaRsn/v2FEz+hahPtyEYiUM+Q65dZhCPYLAfeUcx1rZZRIHqpiiYc/rR/cECiGI1ohsDrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9351

On 08/11/26 16:38, kernel test robot wrote:
> Hi Vijendar,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on broonie-sound/for-next]
> [also build test ERROR on vkoul-dmaengine/next linus/master v7.4-rc1 next-20261105]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vijendar-Mukunda/ASoC-amd-ps-guard-adata-sdw-dereferences-with-NULL-check-in-IRQ-handler/20261107-232226
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20261107175339.3547918-4-Vijendar.Mukunda%40amd.com
> patch subject: [PATCH 3/4] ASoC: SOF: amd: guard SDW IRQ work scheduling with interrupt_enabled flag
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261108/202611081921.O3dE9COW-lkp@intel.com/config)
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081921.O3dE9COW-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611081921.O3dE9COW-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> sound/soc/sof/amd/acp.c:589:36: error: no member named 'interrupt_enabled' in 'struct amd_sdw_manager'

As mentioned in cover letter, Patch 3/4 & 4/4 has dependency on below
patch which introduces the interrupt_enabled field in the AMD SoundWire manager:

  https://lore.kernel.org/linux-sound/20261107154659.3358223-18-Vijendar.Mukunda@amd.com/
This patch series was prepared based on ASoC tree.
Will combine these asoc patches along with Soundwire patches and will re spin the
patch series.

>      589 |                         if (amd_manager && amd_manager->interrupt_enabled)
>          |                                            ~~~~~~~~~~~  ^
>    sound/soc/sof/amd/acp.c:621:37: error: no member named 'interrupt_enabled' in 'struct amd_sdw_manager'
>      621 |                                 if (amd_manager && amd_manager->interrupt_enabled)
>          |                                                    ~~~~~~~~~~~  ^
>    2 errors generated.
>
>
> vim +589 sound/soc/sof/amd/acp.c
>
>    566	
>    567	static irqreturn_t acp_irq_handler(int irq, void *dev_id)
>    568	{
>    569		struct amd_sdw_manager *amd_manager;
>    570		struct snd_sof_dev *sdev = dev_id;
>    571		const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
>    572		struct acp_dev_data *adata = sdev->pdata->hw_pdata;
>    573		unsigned int base = desc->dsp_intr_base;
>    574		unsigned int val;
>    575		int irq_flag = 0, wake_irq_flag = 0;
>    576	
>    577		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET);
>    578		if (val & ACP_DSP_TO_HOST_IRQ) {
>    579			snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET,
>    580					  ACP_DSP_TO_HOST_IRQ);
>    581			return IRQ_WAKE_THREAD;
>    582		}
>    583	
>    584		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat);
>    585		if (val & ACP_SDW0_IRQ_MASK) {
>    586			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_SDW0_IRQ_MASK);
>    587			if (adata->sdw) {
>    588				amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>  > 589				if (amd_manager && amd_manager->interrupt_enabled)
>    590					schedule_work(&amd_manager->amd_sdw_irq_thread);
>    591			}
>    592			irq_flag = 1;
>    593		}
>    594	
>    595		if (val & ACP_ERROR_IRQ_MASK) {
>    596			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
>    597			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_sw0_i2s_err_reason, 0);
>    598			/* ACP_SW1_I2S_ERROR_REASON is newly added register from rmb platform onwards */
>    599			switch (adata->pci_rev) {
>    600			case ACP_RMB_PCI_ID:
>    601			case ACP63_PCI_ID:
>    602			case ACP70_PCI_ID:
>    603			case ACP71_PCI_ID:
>    604			case ACP72_PCI_ID:
>    605				snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW1_I2S_ERROR_REASON, 0);
>    606				break;
>    607			default:
>    608				break;
>    609			}
>    610			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
>    611			irq_flag = 1;
>    612		}
>    613	
>    614		if (desc->ext_intr_stat1) {
>    615			val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat1);
>    616			if (val & ACP_SDW1_IRQ_MASK) {
>    617				snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat1,
>    618						  ACP_SDW1_IRQ_MASK);
>    619				if (adata->sdw) {
>    620					amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
>    621					if (amd_manager && amd_manager->interrupt_enabled)
>    622						schedule_work(&amd_manager->amd_sdw_irq_thread);
>    623				}
>    624				irq_flag = 1;
>    625			}
>    626			switch (adata->pci_rev) {
>    627			case ACP70_PCI_ID:
>    628			case ACP71_PCI_ID:
>    629			case ACP72_PCI_ID:
>    630				wake_irq_flag = amd_sof_check_and_handle_acp70_sdw_wake_irq(sdev);
>    631				break;
>    632			}
>    633		}
>    634		if (irq_flag || wake_irq_flag)
>    635			return IRQ_HANDLED;
>    636		else
>    637			return IRQ_NONE;
>    638	}
>    639	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

