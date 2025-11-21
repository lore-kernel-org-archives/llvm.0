Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021083.outbound.protection.outlook.com [52.101.95.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A5434251A;
	Fri, 21 Nov 2025 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735419; cv=fail; b=SXfByZWLJ/+45GfA1OSMtZopXF9fO3SUmftOpfBGBBhM2qPYh+A75ywMu1ZxAoqSW21d7vHBsDUlfSL16zjyQtA3ociJJHhH5K1YWag8u3iNdwSr2uh/29ma2ut5fq77Z7dJeOIHpJIbqrgcT22LOWBV2N41qoBEqQRQVQTgsw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735419; c=relaxed/simple;
	bh=pRTAZcFRmeoayvXJQ2++qxDCUcJa2rSA/PsVQ8RwkqI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=khgue3nHjU/o3znoUklDSWPJ4ppztgBOOZLqzJ/ompK/kTOtbsPPljum9dOGcwFCO7cHvHzBmjaRO1IYwR6ALXilQ5WEtMd47Xu6ZBU468MbNqWrbjVQjsCXv2sl2gDwNyAxXaNOYKQ66zyJJ2wQ2vNBhYcToN6/3qhiUjSQC8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dWVz0PyV; arc=fail smtp.client-ip=52.101.95.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dWVz0PyV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITPAJ9IKaPHlZ+2fCrUFhkR1mqCeK95G/4eMhUwrlBYQZ2cpM54i5wJimW9FU3tMqMctQo9YfTk2P7ibvIkHBiUmMlB7gLcb4oEHFSkCaXVEuf9RKhuS+6cUJ5rXQP3fkzJ76DKZ/wzpiGhglE1/ecqjPLu9sb4eMOTjlS2lk56xcsirPOCz8qvnhki7k7eAp5nQdiekyB9IdC4nM1QgFUjvLziyVwATpPL8u+83ahZN5MK5EeprabJgy5I7d7dBwy455F4Pu/WlU6yFPDEYUgpxRDVOwZX9CXFw5po5zJ4RgUrCVgzMEvNJ04gw1haLilNqmmANBi8GdOKSO2ZVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRTAZcFRmeoayvXJQ2++qxDCUcJa2rSA/PsVQ8RwkqI=;
 b=FYpqw3WxORyWmTRrP1b8Cg7LifjEwnP1EfeDS0euN/lAS0FCrpnCDUIIUj6d9YqnKjBzBPJYjcsXn85eclQTEHNXwzuP6YgehdWWRL1byI6p/MuGllwOQyMF3nipf0c/3KQouRmZ1nCRIT7N4MJ74fmQxO03vNcuny/PQwyR5eD+1eMnMyDYVhxYinVcmLHCvN9fFFzQFIGnGbM7XPbKpUiwJFRzkQSXvKsLja+cEDVPTgklOqUImtAE9gSMYXWJ+s6bfI7XO/uFiTvH7HvWoPonGIQGPGw1ncydIJ+xj1Pb4xHkOBkbtDgmNbreGjEoR7fhJtGph8ZagPUr8JXF+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRTAZcFRmeoayvXJQ2++qxDCUcJa2rSA/PsVQ8RwkqI=;
 b=dWVz0PyVEH+1wnQYBPi7vy4EsLRisZ7gChJ8SlvEqui5leclts9muWFsRliUhsEet/bVQwL1z+6id9QNdGdxxnZ7+4YLuAp+XpITCvAQJ4QVu8rwViXDTV8AsTqM1MAIM47zj+q6H75zy+tmAN+MiA6OKnJz+wIQxils0/MujTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWXP265MB2807.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 14:30:12 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 14:30:12 +0000
Date: Fri, 21 Nov 2025 14:30:08 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Trevor Gross <tmgross@umich.edu>, Alexandre
 Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, kernel test
 robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol:
 rust_build_error
Message-ID: <20251121143008.2f5acc33.gary@garyguo.net>
In-Reply-To: <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
References: <202511210055.RUsFNku1-lkp@intel.com>
	<DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
	<aSAr-aA2U26lr3iI@google.com>
	<DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
	<aSBy3HQ9Z-h2LbB8@google.com>
	<CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0064.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::20) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWXP265MB2807:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fe362b-c425-4547-7559-08de290a7aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVlqN3gvYW1WWTV2MlB3SFdCN0VZd3pIam02YythMlNmS1V1bXovbVo2eVRy?=
 =?utf-8?B?d2U3cW1wOHA3MWVvSUNKZjh4clZDbDEvVWl5eUVXQy9kSm9sNkJ4WGdKcjVm?=
 =?utf-8?B?UE9kWEZXTERnclltUDgvekxJanhueFBtM1Y3cUtMdncrdGhpRTlwTnBmOHhY?=
 =?utf-8?B?T3dDc3Uya0xvdXBub24xcU9PWW5vMXFQQy9FSFkxRUNwWlFOelI1ZHZPYmVz?=
 =?utf-8?B?LzljSC9Qc1hlMWQveEk0b3JSVTNzemdtbHE1MUxVcHhGbHk4TUw0QzBsempn?=
 =?utf-8?B?Z296QzNxTDdmL29nbGlGdlF5VXhGbTZrSGI5ZUNzVkNSampxMVM0allDWnFX?=
 =?utf-8?B?M05nUWxiamxKMmFLYVl3RW9PN0hXZmJ6TWprRWZxQXd3TXVocHg4cmFSSUdT?=
 =?utf-8?B?VjJNQS93Z1FYWnN0MDRyVjFTYlJLdzZPYUc2NHRVUy9mR0lNaGg5cU1CSjlM?=
 =?utf-8?B?YWJzeG1JZzBWQUVyVzVOQ1diNGo2b1cwRmNiMGxKaVBQdUJEVmhBbVVJYVBU?=
 =?utf-8?B?bFQ2Y1NNV1NENnAxTGZacmhnZlhkbnpRd0RxT2tXSkY2SWVaZlc3aGx6QmxJ?=
 =?utf-8?B?ZldmZUJwc2hVVmNETGVvV01qT0hzcEtyMWl1b2ExYm11blJGZE5rRVNSNmlN?=
 =?utf-8?B?UjBqajU1RUxZSXhacldnQUFmNW1OVzh4MlNyZm9Oa2dNQ0tHZU40N2lMeUU3?=
 =?utf-8?B?K01LY0E0ZWFuamVKc1p4YWxlUFRNYVN3TjltbFlmYWNRWEpCcFlDcXo2cllP?=
 =?utf-8?B?QUdkUTJNb3ZicVRBbFp6bnJKYWJiZVNBVk4rV1pxMUJCOEhoMFYvT3VzVUxj?=
 =?utf-8?B?NExPQkp3OE80NVZnVTA5VVpmalgwNFBjSlRiY2NsVzY5SjB2Nk1hVThjL2hh?=
 =?utf-8?B?V0x2UUI3QjlRN3MzVldCZTY1cDdEWHMzNUd6K1RwNk9wT3lzV3BKZzFXMFp6?=
 =?utf-8?B?RUxub0tuU1hSV1NXRGREajRIcUlRcjNzWk5rL3ZldnB4MFUyQlROVnVRU3A1?=
 =?utf-8?B?Y0V6R2xQZlVHN3R1VzYyNVUrenI1Ny9xUmFORStOdVVXMTdSQXJEQk9mODAy?=
 =?utf-8?B?UndUTzNKNnBaZ2FjM3FvWnMxRVlGRmd2S2lzUnpqcG1xOGtYeTd5elcwdnBh?=
 =?utf-8?B?TXNsZ0k3Sld2SCtKTlFvaWh5ai82T2o5MlFkVmkzMkwzcVBmQkUxckhvMUI1?=
 =?utf-8?B?S0lVdFZSYWdSSDlJZDVEWHY1T1IyV3RXY0ZoNjIwYlhJTzBxdDRvZ2FWbXFR?=
 =?utf-8?B?VUlkcTcxNjdISWpBb0EwSkZzZ1oyY0JzcFpGczRPK2Y1LzJocEg3VCt0MDcz?=
 =?utf-8?B?VzZJWEN1azV0U0pqVm9hVEROQm5jQlBDeEh4ZVEvVzcxczk4YlUrcDZLRktk?=
 =?utf-8?B?dXZCM1BlTHFDWU55Nzd5L2IxbmRXYVdBU25JVEFTR1Z0MWFWYkc0SGRmYWJx?=
 =?utf-8?B?MVBFdU13NklWT2ZjSkVQUDlvK0ZTUTVpV3lkNEpSOTIxbnNxWUdPeXFTQ1B5?=
 =?utf-8?B?MXBFOGk4ZnJHTlhrR3BxalZLUlozTkxrRHk0M2c0aFJCYTgzV0dYRG5ydDR6?=
 =?utf-8?B?K1ZKV0h6Ri9CUElHRGxTVDlvUUQvV1RwSTZGb3VQemNBTXZ3WTcxcWlvNVYr?=
 =?utf-8?B?VUc4clVHbkZualdWRFFRaWpjZko5TGtYOXNUVFpPcWlYaG11Qmh4TElqYmMx?=
 =?utf-8?B?Y3BOUUh6eWRLOEt4cUdmNVBSZExzcFhvTXV2K01TV0NsT3NQVCt2YVRzNU04?=
 =?utf-8?B?T2FKRVNxc1Z3bUlYYkV0YXdOWFJRaTM2OURHRE5EaHFmQVJDMmtyclVkbmI4?=
 =?utf-8?B?NXZVeG1qQ3ZzVXorQzZTTUI1Q3VNMUlRemQ5ZHJ5RmlSRW02OU5vaG0vWnFN?=
 =?utf-8?B?Um9wRTQyTElKTy9Ca2xiUk0wOVI3Y1JDeDU1RUNQdUpudzYxMGpyYldzQ2k4?=
 =?utf-8?Q?3i3SwoKuw42yHDtVYXQWZ0aS0w9f/Y1Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnVVSFIrRUNYVEZhWk5kdzN1Z3ZOdkZTZFJmWTZYSmEwRE1vemlGTnIwUU11?=
 =?utf-8?B?c2FNMnpZRkhzU0RYRjA5T2FuZzdjUGwvQWxMdlNBR0o5SmF2YzU2MjlKSHJz?=
 =?utf-8?B?WDdyY09CbEdVOHpaTk9WdzAzQ0JibDRydHB3ZVNBUnVvRHB3NGZ4N2hhNlFE?=
 =?utf-8?B?aW0yVnkwVWZqbkVZZzRrMmdnWE83cGJSWUhub0FtTVl0MFMrejlMYXNNNkV5?=
 =?utf-8?B?RFRlam8wTnIyZEw1bmh1SUhUUDNudG1iQ3BoejgybkJhbXA3dWxRdlBseG0v?=
 =?utf-8?B?endRNjBJTldJNUREQ0NxVWhiMkFYb280Y0s1ZDBLTmRRVEhJNDBXb2trQVpy?=
 =?utf-8?B?VTdpRXg2Nmx6SWkzNFh2cXFuRU4wOS85SnE4cWRaUkxkK0pEcDB0eVRrbUxp?=
 =?utf-8?B?R1hUdWpBcWozUWpiZzh0ak9BNlJOWk9UTTl5S3pYakFzQmhjanlIMGg1MmVX?=
 =?utf-8?B?VkpmVzRJUDZzckc3YktpdGFtUktacmtEUjZ5b2owTGhKREFBMTU2RERwa0k5?=
 =?utf-8?B?NjhYRXpxLysyQ3dMTGJpMnhlQ1FSZklTY0QrenRvYlM5TXZqU3JLaEhFa0tp?=
 =?utf-8?B?RC9tSjRYN1ZjYlFJUjhKTk1VL2dxRDVjZERyb000cVRMb0tLOFpQZEs2c2dq?=
 =?utf-8?B?bEF2K2NwWFhCdHpkOEFmMkVOVEQyaXBqOHpsb04vckxncVBycVVZUE92c1Uv?=
 =?utf-8?B?SVhxRDUvK2UwRlB6Q245b2VWVTdiNU1ZMnhJUXlEZm5vWHZSMWNrNnVka2NO?=
 =?utf-8?B?VFZ1OTJRNVRLTkFTZDlnM24yZWJVSGU0bllEWEZDRmV0WkFRTG9Remp3OUdk?=
 =?utf-8?B?c0Z4cFR5QUMyZFdmOGtjSmxMQWU0MVZIdm5qVFZGa2g0OHFSTmROdVBSbFN6?=
 =?utf-8?B?NUVSclpSVi8vRVgyVm01RWkyZEh0UTJYdlNTYUV3U1haQlAvTUFMUnVpZktm?=
 =?utf-8?B?SG5Cem96dFlhcDZnbTA3TXFXNzg3ZE9aRmZUZkNVSExtSVdZeUkxeGo4T1RY?=
 =?utf-8?B?TUpSWEVHOXZRcTFOZVpoYlNiT2pXTklHRWZmSTVmeWRIVW5CZnNGb05ZK3NR?=
 =?utf-8?B?SE42U1A2d3NYUjYyeGlMVlQ4a2dPK1k1SDFpdkZQV0VBTzQvV3ZmTGs0QzFS?=
 =?utf-8?B?VkM4TURYdU9SRHlVc2pJZU56Wk9pSGhIUXRDeTVEOEpBN3ZyV1NlZm1YSDZr?=
 =?utf-8?B?OXJqMHdkSzdRaldtVjJXSkdwVGxuZ3hlVEh3WjBEWWxMdWtVelhOQnJ6SW1z?=
 =?utf-8?B?MFJ1VFhLWFlYVFZ4MkFRRFU5MUp3R1hPSGsyV2VxZDVGMFA3MXEzSWgyTDI2?=
 =?utf-8?B?T3VnNDR5cE1BMTI5UjN5OUVTd2l0aE55OXZuTHV1MHFEbnlqM0dwZHVPNnM0?=
 =?utf-8?B?RUxpUUVUKzZ2Y096WnVob1h5VVc4ejVCRjBMaFl5dHlzVm5XMjZjcWF6U2xJ?=
 =?utf-8?B?UE1IdlVIRkx2N244bFltcjhEVTVtY01IN0RiL1FWc25aVDlKd1p0VmFCOUh4?=
 =?utf-8?B?RFZiUS9LWGw4WStYTXBwalVDejJUTWdva3ZOS3FEZWpEZVN3cDRZelVPakxi?=
 =?utf-8?B?Y08yYllpbzcxWUk3UDVCN0pVUjdZTlhKVWdXR2ozZ3ZTb01TTUFiK25rZzRx?=
 =?utf-8?B?UkhXTk9nc2NGMTFycmtpT2xyenRoeTRMZk1Bemo2RVFiYWdWMXJCdFNhbHV5?=
 =?utf-8?B?NytHWU5YYk4zRCtFdWgzcmtYVXR3MXVZTkN1dktLbFFQTGNHdldTT0g0VlMy?=
 =?utf-8?B?Z2hjbE4yYkV3bE9kNXMrU3J3YVMwdWM1R3B2RlhsdkZkRzFnd2xOSGNualB6?=
 =?utf-8?B?dVV6TmlFOFBmcG5IdzRXek9yZktPaFE0cFlnOTBVaEtWb2l0aEtKYXZWTkl2?=
 =?utf-8?B?NVZ1bFVhMGJoUDZhVGtGd1J4TEV0VHpGd0ZrZ29ZczYwVTVtaUtwL05iNTVE?=
 =?utf-8?B?dTJMWE5RbllrQ2k4elhBcTc5TE5RdDJLNCtGRTVHSEhid2VDd0V1a2NUOGN2?=
 =?utf-8?B?aDZWUzN3R0FsT3AxSXYybjBoNXdPYUhiVGZjc0hXMXo3MzYySXlQRmlVMTg0?=
 =?utf-8?B?SWxRU0NmdUxibHlKTHhkbmorM2ZmcHYvZ2VOdXlvWHpYWHJsMjBsQWtJTkdJ?=
 =?utf-8?Q?kpSSkKkD1ZkzBr2J4e3f+CQc6?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fe362b-c425-4547-7559-08de290a7aa9
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 14:30:11.9298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6KgJPXNJH5VzpBbVrCnERxaJA/Z/uJbvgQAR63TWNwcijYF2O2RWFki9VpBUWFWBEV6AlUbxfw2UhJvRklgog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2807

On Fri, 21 Nov 2025 15:21:45 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Fri, Nov 21, 2025 at 3:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > This kind of thing is why I keep saying build_error() is too fragile to
> > be used at all. =20

The case here I think is a perfectly fine use case of `build_error` as
it's completely by-value and does involve references. If compiler can't
figure out, it's either a compiler bug or a source bug.

> Adding `unsafe` blocks for things that should be able to be statically
> known isn't great.
>=20
> `build_assert!` is just too useful, so it is best to try to understand
> what can be done, or find an equivalent solution. Gary et al. may have
> some input here.

I'd argue that these build issues actually helps us catch missed
optimisations opportunities :)

For this particular issue, I noticed that none of the functions
involved here (`from_expr` and `fits_within`) are marked as `#[inline]`.
I suspect after marking them as inline this case should be resolved.

Best,
Gary

