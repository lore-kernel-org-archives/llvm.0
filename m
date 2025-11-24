Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020083.outbound.protection.outlook.com [52.101.196.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2C226F2AD;
	Mon, 24 Nov 2025 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763995698; cv=fail; b=tDzuJVSyBhFSrElh7Sn8r6nLeI8fDIWHRc8VMDoQKO9G9Q99v6Fhceqnic3JjPjJ+SLu+EmxxM1hi7mjFhasnxFMRDOgRrEH0Q3zzz8tGt4rTJOixg/kTCTxw4w14Dn5dBMihd+E734gnsQxan+DQL555W/IvvfkmxjaQQPOwGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763995698; c=relaxed/simple;
	bh=TtU0eoOLgRS7BjLUEYxJY5OIaIPbcDHrMGnPjffbMbw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b0Kkj1n77uvSPN0gZnxzaTl4oUbimc5MmKFrtACECzfzmt1CBaOr74hAntyPN8/3viMlAvDiBUPs7vqDmrSaVamgGtduNPMfuPZ0rJd1S7iXzqckykNvKQuymMHwJIHbn722qoTPkyQD1UjsqOG2iMTeXYMQrqDLY5pGWEtTFRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UGG++9Yb; arc=fail smtp.client-ip=52.101.196.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UGG++9Yb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUEwoMLf67bfkcc8EWMK1ODIbNTe+fdybZweTqwvVWqUJLWY9qlibWeWrfOevhQ8YRcjlfaqC2rQ0AHSm4x8YdQ4MtmVvW9W3WPfVGsabm/SHEBRU6YX2lxnbMdSDIJtq8g8Dra6C8Woslpj3W5OryBnUiSps77TLIfD4RR4w+7r/V50vROwWj0a4cff3ZOvpkTkUp6ag96lrD3OHWOGnSkf+av1irnFEMrA/AdeTDGcH+CLev6N/fGmaDByxl2vu1hn4Y0VlwgOFIewV5Bptmu5YqLGhjAK4AvDMRvGgx6ufqUd0zLEynrj0ilDesSNKLZv53dyuKhU072nmK5scQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aM/QIpC0ykOQ8yBlmrDb1apSPgrUZ6T75Z3AcbQ004=;
 b=r45tvho7I4y02XwZyjReMKxHqWfP7SjxzUXHGMfYqlPDCwY+eTkSg2jAOWtF+47bFM1bGQFohdW5UjtCEPVE93niC6LBzPNdSQreIZ4vcU6oCFm7dV7wHi3i6kg5IkzHn0FPvgLeiTKw2EmOX4WuiBkOHkIh+JBdq5UImqBW0HF8wpCfedEheJBrWL2y0EraiAjBc1CyOQDiCsfwVEGUSPq4xGpz1FT22M/gduV5V9z1W5N8F6q9NSPNhE6Xcejw27DlK7eIupw4XJQfURSvcpSiZgL3AoPoBlilcq4ryoFPM86Q7furxeX7LU+//n3jz5Al/+qBdHbaNhhekcBEYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aM/QIpC0ykOQ8yBlmrDb1apSPgrUZ6T75Z3AcbQ004=;
 b=UGG++9YbmWUGfGUkLAjiOce7RGaqExCy/RHqVuqiMpC7AhdQ+oe7zL8gQoCxL4u+5aIk6Kjz4QI2m7pToqeVcb67eQLqDhtXh53T4x64LX4bllgSzbsqiBhUWa1SIvK7R/oGKmLqtjzgQRCy854Y1/ublEE6EMiFMr6KJseFnCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO9P265MB7774.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 14:48:13 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 14:48:13 +0000
Date: Mon, 24 Nov 2025 14:48:10 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, "=?UTF-8?B?QmrDtnJu?=
 Roy Baron" <bjorn3_gh@protonmail.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol:
 rust_build_error
Message-ID: <20251124144810.2fb0e99e.gary@garyguo.net>
In-Reply-To: <aSQ1VNuGHhFXYE2e@google.com>
References: <202511210055.RUsFNku1-lkp@intel.com>
	<DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
	<aSAr-aA2U26lr3iI@google.com>
	<DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
	<aSBy3HQ9Z-h2LbB8@google.com>
	<CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
	<20251121143008.2f5acc33.gary@garyguo.net>
	<aSB623GKVDR2TBc3@google.com>
	<CANiq72kUk_R0HGbX4eW9iucCXergJqBBeutnh7cb8SNAzGjG+g@mail.gmail.com>
	<aSQ1VNuGHhFXYE2e@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0660.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::13) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO9P265MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: f04d468f-ede9-4715-9504-08de2b687e36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGcxN3AxRGRkWHk0eWNCQTRRNlRDZmx1bVF6Y2V4eTczWDRXTmE0ajJoYk11?=
 =?utf-8?B?dmhUVXpqMTZUYnJGMUdzbDdzWURRMjd2d2RpbGN1SVdtQmgzU1FIckd2TUUy?=
 =?utf-8?B?dmZoaFVLYTVidSt2bGZFb09rUDdvKzJqbGZCcHB3dFhvNTBzOHh4emg0NkFm?=
 =?utf-8?B?NHNmdWltb1RobmN2Zk5teS9DZUlpYVpSbm5kS1I5SFdieXY1enpRc2NhaEx6?=
 =?utf-8?B?RkRUeXUwL1dSVTdLcEduOWJUZVgwU2pxRlVCV2lOaXFsN05QZnJGTlo5S1Zt?=
 =?utf-8?B?QWlLNjJuTzhoQXJOOUwvWnMzTHlDalU3Z3JMdjdnVldLUTE2OG1QdEYvTm5m?=
 =?utf-8?B?VmorbVkzZjVWVFo5TEYrZkpBenppbHFEYnBoa3JOZEVMMUNQWmk0Q0JRRzZ5?=
 =?utf-8?B?ZUg1T3pLWjBEZXNESWwxQythOEN1S3A0eFk1OE5ZR29UaTcwZXJ1OE1rdi82?=
 =?utf-8?B?WDQ5WjJGaDlwSFBXYmYrazcrdVVnT0F0RW1kQjJIK0lJekIrTXlkRUNnZmJS?=
 =?utf-8?B?VWpqRVZ0L21zTlFRUmtIeC9aZ0Rpa3MybmczVlV4bzg5OWE2YWd5NHlKaTJZ?=
 =?utf-8?B?SzZocnNFUjRYcXFrZ2ZsR2J2S251ZjFLZlgrd2dOTU1mSndvNjVSN21kRHda?=
 =?utf-8?B?SzBvRnJHTjcvSjdPU3dWYXJhazM2TmIxb0d6UXBRSTdvZ240cjV5eGRCVUow?=
 =?utf-8?B?VEtFcG5FV2hxL1lKTTNFNkxhUExJZ0FGbm0zYVVsNkRXeFRZQUNURUFJaVhQ?=
 =?utf-8?B?Z3R2eC85WUQrVlFDQk9HYjVRb3RDMThRb0ZUQjhESmhVcWR5SGRlWld6dWNY?=
 =?utf-8?B?VHVMQzcwaTlrOTdHMmIzYXpnU2dxNkx3bUIwQ1g2MThLaUoxVFR3Q013UFF4?=
 =?utf-8?B?WGJxclJYVmk0ZGpGM0hNL2ZKcjAzSVdLZG84bDBiVVp4S0I0NFJFTitSOFNr?=
 =?utf-8?B?UFNNU0ZrZlR4d2NFWFVNMWprQkJPU2FZdEhyckRkT0pPaWI4UlRSK2pjN2ZK?=
 =?utf-8?B?a2trdlg0MVhxWnBVRmFDTTFIczk4Um5ldTExRUtiTTJxdytRcUpITGdPc3A3?=
 =?utf-8?B?VjZVZGcrMXp1NkhGbDZLYU9ncVArengyZFlSSU95ZjJNQy9IVWRIcFplYXp6?=
 =?utf-8?B?WG1rNW52RTRFWGV6WG1oWUpvbGFBb29mbkNCR0d0UWx5VGd1TlVqY2U0MWIx?=
 =?utf-8?B?TW1UUGxKcElzamlrak9HOUpxY2htQXJ2S1hscWdCanIzWUdJV2JGTHRGakRi?=
 =?utf-8?B?bkRJNHlTYm5lQmJIT0N2N0lDUi9jU3RCaU1KOEdram1EVjdoRmFSNU1GUEV0?=
 =?utf-8?B?R3ZjRTV0UTdRbFVKOXhwN3h3UWwyUmRqYUxHY0VQem5Pa0t6R0ZNaEVralRH?=
 =?utf-8?B?SzJWaDROeTkxWUkyVXNqanBVOVBlaVNZZjYyQUUzNjNYczRtVllSTUxKbC9t?=
 =?utf-8?B?b0J6VTZqdnZRbTZZVitDSlk1ZlVXYlBRTnVqOFRFKzh0OUJMQ2ZRUXpyNzlT?=
 =?utf-8?B?NXZDVTBYWSt3bGgrS3BBSjFCMEdPbGRzRmVnSk1wZU4yVC9pR2FoQ3VpU2ZZ?=
 =?utf-8?B?T1p2YVRyNDBDSHZTeGducEJ4MDhQWFZvSmNMckpxcEdDcFAzMnc1eHlwTjVY?=
 =?utf-8?B?ejYzZ1pPUjY0dXBTZzF0QVBpZEorRDZjS3NQd0laMjArMkk4TTRTeXk0dzQ1?=
 =?utf-8?B?NDlscU8yREovTHBWLzZ5MTJsZnNLV1JaZ3pVVmlXVGNnQWc3UmR1eGRaSTF1?=
 =?utf-8?B?enVTNHZhQWdXWVdSQzIwSW96ZDNkUXZrTXQ2eUNkZENqdFZPcVd6ZkE0TTJL?=
 =?utf-8?B?QkdEOTlZdThlUmsxQ25vQkxyWkxEdDRDT0UrS1lDWHJDSlVPcGJ5R3NNUkN4?=
 =?utf-8?B?cGcrN0YvMGxpbFhnU0tjMUZsWExOckgyLzJ3NGpmaDlPRm85R21hVWdQWVM2?=
 =?utf-8?Q?3rWpuIJtC+BmOn/TnAw1QToHPjOnmcsG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkFxbUN3UDFYcmcrY2Z2R0UycUVEK0dlaEpMVzM1cmt1NTl3VnV1WHp4YlJ4?=
 =?utf-8?B?TFRZODBUOTRseGQ4QWNOZkpwS1JpQ3JFaFpoK3N6ZXNiTEFXeWxYalFtTWI1?=
 =?utf-8?B?eXF0L3FWRlI4amxDalcyRWQrb3oyTXMyN1QybHZxR2Q4aXQ3dGs3dUFnckM5?=
 =?utf-8?B?NWZ3VWV3NnBEWWc0d1U1RTg4bk9LWVc5M0w2MldobmtWelYzREZEa05tNElv?=
 =?utf-8?B?WHdLcEl1T1lxMTdJaW1neWdxMHpIL1E1bWM2L3hKNnE3YU9BeFZ4aGhIdUFE?=
 =?utf-8?B?S1NhVHVNalBNalBYeDRoRjJ4dVZqeEFseWhYK2RpTW1GRk1pQUpzMlJTNHZ3?=
 =?utf-8?B?dWs4SGZMWU9mZkx2NjFnNkR5YXd1NjZlUmlkdHNzeTVnaGVEZ1NxVHhrRkhq?=
 =?utf-8?B?R3V2bXh0NzUxMzFHV1pkV1RsV1JFeUw5RkV6N04wQUExc2dkcXJMNkJNK2pD?=
 =?utf-8?B?VUZFUGtaYzg3eHpuWjljVWNsMDcrUkdWSE5nY2RoOStzZ3oxbUJPMllhMkdq?=
 =?utf-8?B?K2JINGpwVFBMaUNuVHIwbVNtWVVHdlN1RkU4RzZiNmdqdzhqSmVBajllcjlO?=
 =?utf-8?B?cGtBOVk5MlAzbmtjaTlMdGlIbkN1WGxnc2dFZzluL3piUHFiQUp4ZzRUS0NI?=
 =?utf-8?B?dWZld1NnNCtRZHhVVTNiTFNuSzFUOE55eTZQYjliNjZtczViNFNBMG9yQ2I4?=
 =?utf-8?B?c2M5czNsajBrS1J5emIzRGZGeU14UTBZQ0hCQWE1cUFOdmROZHU5MXArdmp2?=
 =?utf-8?B?TXdxb0h0aHU4ellBbDliNTBzVXBVWmVOUVhOTDdyQ1BWVHBZdmJ2RTJkeTJV?=
 =?utf-8?B?Ujd4Nyt1L1ZGeE5zOWZIWE1vd3Z2Wk1GTitMMlBYaGh3b2RBeW13ZDdpcGZN?=
 =?utf-8?B?YTVna1pOWS81bUlyQm5oS2kyQ016alFVWDJjdGRaaGF2cEh0dXdNb0NwUmZn?=
 =?utf-8?B?UUUvcmN6Rmw0cWY3ZW81UGVrT241Uzc5Mnk2dVpYa0NXYlkvQ0pNQUtLYS9n?=
 =?utf-8?B?ZkxQOGdYS2JrTERtV1RJdVoxVlJFbFdyOGxJK09RNmYycyt3TjBBTlAwR1pB?=
 =?utf-8?B?Ymd5cXcvb2RrS0FKMm5yaG5qOTcyRUxKbjZnWEZWQXVPeG5SZ091dW5YUFAy?=
 =?utf-8?B?VUZ5aUM3NU1MMDQ2Q01HbUJFZEhpcmlZTUhQKzc0WUNDMWFhcWVVQ0pmYzgx?=
 =?utf-8?B?S1FQa050cXE1OG9JamF2ZzB4SmN6QkFWTGJnbnAxUmd5TUJOUHJ6L0R4QjBL?=
 =?utf-8?B?d2M1VTQyUW1oWTUxc09tVVB0R2tCci81T2h5dzkvOTRlV29RK1NVU1NXbisr?=
 =?utf-8?B?YzZNTkZtM3NqU1dCL0pLQXdlMDBSRDJGQnBXdzZQVXkzQmdWT01hWDdIU1k5?=
 =?utf-8?B?NC9NYmlXMWhoa2ZCTDR0VVZqRVh3V1hpYzJDTGdNVVBiK1NyQTdsT2xRTUZE?=
 =?utf-8?B?WjVJNm0xMTdJS1dubEI5ZzFYN0JhcXh5ZnJKbkFpclNPUUoxK25QWVBLQUE5?=
 =?utf-8?B?L3J3N1l3ZS9KaDJCUTdZWDhadWg2Y252VVk2NCs4MDhCRVBtaE54eGh2Qyti?=
 =?utf-8?B?Lzc1cytTWS9NYmQyKy9VVFQyQlRIZGZMWmhkdXdmZmdhN1FnemtJd3dhdmhw?=
 =?utf-8?B?NElTTkVuT0NHV1dhYnBXSzYxWFpxZktHTlVXZVptemJFOEVSaGdvWjZJUnkz?=
 =?utf-8?B?Q3BkZk4wMFJ6Y1JBcmMvSHVkaWlVTXNSVnpMQmZuQmxselNqZVkxZFVQSk85?=
 =?utf-8?B?ZGdpZVhsVHhWVkZ4UEhhSjdLZ21TQi8yMm1XZk9pQXNJclo3dHhXOWswVUFT?=
 =?utf-8?B?NWdYWnNIYm1Eb1ZsNE1TbDVtbWdvQnJlamFoRTdNdklhU0cydzF6aXF3U1Jw?=
 =?utf-8?B?M2Q3SGI3cGtmeE91VTh6UWJRRERzS2MxUTVRV2JWUmkrb0x6Q3ZSYjRFSXdD?=
 =?utf-8?B?dlNmbnRUN1dSQnJBSEN3NmwzWjhBVEVoMDg3YVRWYXdsL3pxS0lWd3FWMFg3?=
 =?utf-8?B?bFJZckczNGQ5OWxRRk4xSnMvQ2xrUkQ3Sy92SzFjTmtISmlwOXZGTDZYL1Zu?=
 =?utf-8?B?N0NXWjE0RGF2OGV0UFJmdVNoanpwZUdLem1ONkxoTFBncGNyWTR6TkhNa3ls?=
 =?utf-8?Q?K+4DlEzQ28D3pKYGUTQoUXp5t?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f04d468f-ede9-4715-9504-08de2b687e36
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 14:48:12.9184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AB99XT/6YL3LsIdjK6qhYxBSDki/M+/aWamSww0qhrZSWFbVw0REo+QJ+VTllgfM3MZ+ELiVBRIGfqeBYgjjtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7774

On Mon, 24 Nov 2025 10:37:08 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Fri, Nov 21, 2025 at 04:53:26PM +0100, Miguel Ojeda wrote:
> > On Fri, Nov 21, 2025 at 3:44=E2=80=AFPM Alice Ryhl <aliceryhl@google.co=
m> wrote: =20
> > >
> > > You say that this kind of thing would be a compiler bug, but I don't
> > > think the compiler devs folks would agree with us on that at all. I
> > > mean, sure, it's a bug in the sense that it's a missed optimization, =
but
> > > it's not a correctness bug. =20
> >  =20
> > > I'm not advocating for adding unsafe blocks to skip bounds checks.
> > >
> > > And, fine, there are probably a few cases where it works reliably and
> > > has no real replacement. Such as the VTABLE_DEFAULT_ERROR check. But =
I
> > > do not think bounds checks are a place where it's a good idea. =20
> >=20
> > There may be no guarantees, but it is a similar situation as for C
> > compilers in the kernel. =20
>=20
> I don't think it is like that at all. We rely on non-guaranteed behavior
> for data races because we have no choice and we had extensive discussion
> about it with the compiler folks who are comfortable with us using that
> particular exception.

This is not about LKMM but that BUILD_BUG_ON also relies on compiler
optimizations and reference undefined symbols if compiler cannot
optimize them out.

`build_assert` is just a nicer Rust way of the same trick.

>=20
> > Compilers can of course change behavior and have bugs and so on, and
> > thus avoiding to rely on it as much as possible is a good idea, but I
> > think it is a good idea to get build asserts reliably working as much
> > as possible for certain use cases. In particular, I don't see why
> > simple (local-enough) bounds checks cannot be one of those (it may not
> > be today, but it could).
> >=20
> > Of course, the best would be to get the language to a point where it
> > supports this sort of thing natively. But that is a longer road.
> >=20
> > And, in some situations, there may be no good alternative (i.e. const
> > eval / generics / macros may be too painful to apply), and thus people
> > may end up adding `unsafe` instead, which isn't great. =20
>=20
> The difference is that someone adding unsafe to avoid a bounds check
> screams to the reviewers that something sketchy is going on. In
> comparison, drivers calling `Bounded::from_expr(_)` with a non-trivial
> expression looks like entirely normal code even though it might be
> relying on the precise and definitely subject-to-change details of when
> LLVM is choosing to inline various functions.
>=20
> If const eval / generics / macros are too painful, then perform a
> runtime bounds check just like everyone who uses Rust outside of the
> kernel is doing.

There're 200+ uses of BUILD_BUG_ON in include/. I see this case being
similar to those usages.

>=20
> > In addition, I think upstream probably wants to know about this sort
> > of this, i.e. sometimes the changes may be unintended (i.e. if we see
> > it changing in a new nightly) and they probably like to hear about
> > "obvious" optimizations not being applied, since they are potential
> > easy wins for them (or, rather, avoiding regressions), as Gary
> > mentions. That is also part of the value of building the kernel in
> > compiler CIs etc. =20
>=20
> I do not at all think it's obvious that upstream would be happy about
> this, considering it comes with the serious trade-off of us relying on
> these optimizations happening.

If the exact use case does not involve a reference, it's exactly same
as BUILD_BUG_ON, so would be a LLVM bug that equally affect
clang-built-linux.

Best,
Gary
