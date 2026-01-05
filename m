Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020097.outbound.protection.outlook.com [52.101.196.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9153093D8
	for <llvm@lists.linux.dev>; Mon,  5 Jan 2026 15:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625833; cv=fail; b=rcDMvtdcvefunPlkdMbn0GmozvE+HSRG6cKDnr/3VnOKp59hpvBCzEtC8p1YqxhgW5Pz1+tEUxL4Js7BzG0wZ13xrj7DJZiKCCeOWRF4qOd/NwC529o4LUPbywN2XIlvK88lTYDZImnmxrOx29n59WFn5NQky7hmi6XZqoY829A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625833; c=relaxed/simple;
	bh=kwL/ZRiLessFJ8bO3lQHfp5dCg2GtQi83Z7dF5P5pPE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XBEsONE1vTvpJXryek1UVeXxsOvAgIhtTBE4rkzgC+Vh25teUtFDhr2Nm90ooq8rGsmx+7GxWRCK/cejENOaWin8NwQHDH0rY7X4qRMNGC28RSISYik+zaB8uyZv7tLoOaqlHYrjdTVr2X4InEPhXS1C+waD61ZzSiOUIdKgDDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=POEYDGhQ; arc=fail smtp.client-ip=52.101.196.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="POEYDGhQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sby4s1FFzm39pSBNm48XyoZFLXj0LxjU+3doscKjYDO3pNT59yxGXdqW5qfcvY6ep1Zik6eWKElZX6ueQoemL5crK4wG1nOMcu/Iqc+JgFz8gOlXZaasQsWAwmh13N10NHFIfZXtY0m36ZZOozBWoERSrV/zzLNl116QwdeqMQZCIOSIOhx9g+gJVIXsBsnNWu7Ck/cU9eED9iLK7R1Upr4U93gdOcxuk2VTnbdxjCA/CdUXO4lgJ3HlAhmdAlPwbrbTgDRR0TsdDYpJaevZThL2r295JzkT2uvlnaLrRfIFaHhQYMS4M+qYb4grR2txbbrMhSK/jbaL50IfprlkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7MQWqEGjvWnhH1Vq6v+rZJcMkAWSK5/tIHneI81tes=;
 b=Xfm3EnKL0J03BxrsANnYZzj8CfOuCQGP+OIWRMA75EyM6ZLB1u2rblnXiq2q4MA6kc50AtcMPTzPdQINJtU0DRJdmKJJZyvTKNKXdL7n6lITdfDVDxu4WRmWsKqPjeSmcvvMlDHLkyoH871fWEwrxNYzFQuuGs3Qz5oZNJChAASm08ymDM0/Y2nQ+dLFwbCltCs3LkLcpEUiVnSluccC3cUgz70euyH6FKsWG7m2w7Ln80iqNX8ktW064Odw0Kw1iBBmzQZUpNUjHceTqsNMYB68rooMCjRboYBtWsLtYQSICsL1Ri8nFKKsAS+IF3gvSuhjaEguK6ZJRRW32bkw3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7MQWqEGjvWnhH1Vq6v+rZJcMkAWSK5/tIHneI81tes=;
 b=POEYDGhQ7dp4kYUP3OV35R8y9e+/b/JHouZVq3+1w883vUFkI/JPFzRxhb2nxBvD4V+z3Q96OcQfERndcJtknEazbA/NoQ1XjMyPZfJEh2/H+1b1E0Y++FibiFtTud+XltkZzLPgCL/RkU/DtwQEy8sdi8blHEX2nZ8mWUXtTcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3189.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 15:10:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 15:10:27 +0000
Date: Mon, 5 Jan 2026 15:10:25 +0000
From: Gary Guo <gary@garyguo.net>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: llvm@lists.linux.dev, ojeda@kernel.org, boqun.feng@gmail.com,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remove sysroot assertion in generate_rust_analyzer.py
Message-ID: <20260105151025.174d5902.gary@garyguo.net>
In-Reply-To: <20251224135343.32476-1-work@onurozkan.dev>
References: <20251224135343.32476-1-work@onurozkan.dev>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0087.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3189:EE_
X-MS-Office365-Filtering-Correlation-Id: 638484ba-8709-4b36-121a-08de4c6c8f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTBwUVdvWlh0bUxYYXh1RmxNdnVTMmNyMGk3M3JZM3JXa1pGYXZjYTNLTk9y?=
 =?utf-8?B?c3kzWFNpSGFyOGFubjR2ZEVyMkp0WjVnWTR2NlB6eEt0ZldPQXpZVkwrRUho?=
 =?utf-8?B?N25PM1psekEyeHU5a0xkd0FPd2FzOXF0d1BvL1lobENtenlMMUJmT3FTOVpv?=
 =?utf-8?B?MTdiU2ZpYXZsOVRpemprd2F0eldZbm14Z2VzUjVFaGtLK0RybG8ybFVnbmZI?=
 =?utf-8?B?SDNlblNCNzVYMk9CeUFiUDRGVXNuSzJYMHpkejdseDNjT2NaeE9aVWNWRlQ3?=
 =?utf-8?B?U00xUGFUbUJpTmF5T2IwUHNwQ3lkMU5UYW9wVVFZMVkyakdTTmMyQ2VDdEZq?=
 =?utf-8?B?eWczdFFIbTFDUnEzY1drVzNzQ255YTVKZWZ0clUrckg0L21udEUyWVUzWlk2?=
 =?utf-8?B?V2ZlUkQvc092dEJzVVdDcUw4dmNkc1o2ZDllLzhrYVlJWFo4TGEwb3h0M21B?=
 =?utf-8?B?RkJXVmhZaXRTdlMydUNMQXlLTllIbVFPbkQwMDNBMk5tYUxQT0M2cHZYM2RK?=
 =?utf-8?B?bDB1WVZoQ0JPanpLQzZvWDFOZnEzUGtIeE9JSGdPVkhaUDIvVURKdkFmelNk?=
 =?utf-8?B?aHQ2cmhKRnFqRzJKaDdaQjRzNXNwQmdXVjZPcjRQbDFmV242RzZpVDB5bE04?=
 =?utf-8?B?Znk5MlVWTXBBR1p1Q2g3UXVXUHZBTTByamFUZkllK09BQWhKNVBJcFR1ckp4?=
 =?utf-8?B?UmI1VERJQTZaaTAraHJXcWZhVDU3U1EzSWFtYnJKZk9oMzExL2c3dGYzcjN0?=
 =?utf-8?B?QWZpbDQ5Rm1lS1VkWXI5NklnQ3BIZS9Od0R1aStPL3F1UkJiaW9OOGFnM1Js?=
 =?utf-8?B?cjJqZElQVExFcE5QYTVDNHRSamJBd3FzQjF0NEJZWDZCRkN3eHA2WmwzNEkz?=
 =?utf-8?B?L3dVVmg4RXhId1dIaU8rQW03ZW5pR0E4Mkt5TEp2WENPbVU3eHJVSllELytr?=
 =?utf-8?B?QWRZcUJjdW94WDE5bGlPMlRubVkyenVNdCtORUkvU21rd1V1OElkNjJTVHE4?=
 =?utf-8?B?dWpMN2lLTzAvMmlDK093MCtsbE1ObXRFaFEwb3VWb3VhL2tlQjFUOU1IMWw4?=
 =?utf-8?B?dWV6WVREc0U3M0FqWjlUTmtDUVQ3d3NBTnlTK0lyOUpxdER2c3hJQ2Z4TzVP?=
 =?utf-8?B?bWdpZ2VMazd2WitKTnViSHljZ3dPT21PYm9CeTJiR29xc3ZnMTAyREJDY2dE?=
 =?utf-8?B?NjJBbFRuSGhTcHJtc2JXd3BFL3VIdDYzVlova0FsZnZ1NUFrWEtyTDNXcUkx?=
 =?utf-8?B?amdrRVFCcEpTOGs5UCtpMzRLTHMva3ZQbVVralJSU3pheTdMU21pbXVjQmNt?=
 =?utf-8?B?UkZiNElFejd5UnNaWWVUbWJud3BtYkxQVkt4WDVsNWJHS2tQaXVnTDd2YXNq?=
 =?utf-8?B?L1VxSktBRWxweVVPMjI5dC9DdUFqcEtZZitqNENRK3F4RFo4dTdoT0hBK2JF?=
 =?utf-8?B?eHBqVnBGbS9OK08yK0RObXhTTDRLOGUxS3p1UG43NFo1eUxGdjQ0RUdLZTNs?=
 =?utf-8?B?c1JkOE5pSGJPYnhaMVBYaDlPUjlTYmx1SmlKZEd4Qm1LTnJabW5QcmMrd1ln?=
 =?utf-8?B?MktpTC9vU01WNWw0TWdZbUNUNTV6WmtGNUk1T0hVNVgweGx5R3YwWmxRMVFW?=
 =?utf-8?B?RWRrUUtmZXRrb3dZMjJhNDZEbzBCTFY4VXJTajFjT1FPVnJzL0ZtTDZ6SVZp?=
 =?utf-8?B?ZHgrUW81TXJ5eEN2SC9vbzkwdjkwTFFvcnYrNURSU1pGZXRuTHhxTEZvdFJi?=
 =?utf-8?B?SVVGdzBGczAvcDU5cXVjY3RGSVhQdFZ0akxPckpBczQrM2JtMjh4emMyaHRU?=
 =?utf-8?B?NEd0Tndhem1RWnl2Z3JzaWNjcXF2ckFmUXVOdlVyekExaVRGVkVWOStLV2R5?=
 =?utf-8?B?a2doSDFENndtcjlJdWNTajlneFVmNi91ZllmdkNodjlZaXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OCtZSnkwMDBqblowK0xOTzVmcWVBNzIwVVNZK3RLdS9CbU1qd3NuSXlQN01F?=
 =?utf-8?B?MWZ4cDJUUUhlT0s3M2tDcUtyaVEwMHpNTlMxZ2g5U2FxTGdScE4rNlVOSWcw?=
 =?utf-8?B?L2ZCZWUwdGl4OEozT2c0aE1haXdYcmJSdnM3RGhLRWoxdkJlV3NyVnUwOCtz?=
 =?utf-8?B?RHlCUlp1SHVtVmxHZjVDYVMyQmVyQ2cwTktTbTdONWZ0MVU1dHVXTUdvNGlY?=
 =?utf-8?B?NE1KRi9STjIwMUVnanNkUHdOVkZHNnh4L3NudW9QS3pXaE9LekZvUmkyMk1I?=
 =?utf-8?B?aHdJQXl2emU0OVBya2ZwWW9IL2dpY2JUYTE3b2xzczBvRzZSTnlKaEVvMUtX?=
 =?utf-8?B?MXp6SER1eHhEZklBSFJLdlRWZGh2TzE5UStUdlY5eG5GUkZEdGxjcGF1Uldp?=
 =?utf-8?B?THhSZC80b3E3RVFUb1VUUXFaUnhGUWtwdzJmb3ZPcS9xZmlIL2dDbnkyRVg2?=
 =?utf-8?B?b3F0QmlqMEtERlg4MzllM3F6eENCRmlFUTJjR1dYRjY2TDk0YktqVG9LdDNj?=
 =?utf-8?B?RVdCeHNuMUhHYUxkZVhFWW8yQ3VKVVkwdW9pY2JkMG8xM1lGUHAra0ovYUh4?=
 =?utf-8?B?Vy9Ndy96SXhVNDhtVjVNbHBrd056V2pzbmkwSmNOL2RMNTdUdXpvQThsVytQ?=
 =?utf-8?B?T1NpdDdKR2RVSzlPOElXUGJEK0svVzE2NHBmWTlVWFRCUjcxZEVYenlTdFlp?=
 =?utf-8?B?Wm51UU53cHJPOTFSWG92QTQwV25sUUZaVy8rMW1WQ3h6SDl6Nmtha0lhVzRV?=
 =?utf-8?B?L0tYMzBoZm4xVmpZVFdJWTJPa1UzVDViajBkWkdjOGkxK3hFaEJscmoxVkJv?=
 =?utf-8?B?UmtTRTA1Z0lZbElBdng2NHBodHd2L3JwQ2s5SzFtdG00azdNVWlTa295QUo2?=
 =?utf-8?B?akRRQ1dVMDJSSkRQT216dC9ITjd3SDNJcEJiK0I1bDZ0bll1SCtFS0lObGFH?=
 =?utf-8?B?MURkODdiWjAwQWRhYk40UDlWWjY3OWlmckxlTy85eURvTHE2OGhtaE1uZGRW?=
 =?utf-8?B?Vm9jaVJ2a0hLYTFHMElUM0xYVFpwU2hzekdtaUFQVHU5Wll0cnJhOGxtRUhN?=
 =?utf-8?B?L1JoeXZtUDRlcFg3dlBPZmVzUHIxR0pWRUFtSkJsY1hFRzI0SkZGeXFoWkV0?=
 =?utf-8?B?SHBDc3VVSHlTV3pYbWJoSU5samtUdTQ4NWYyb1p4c2tpWktXUlExTHZmbXNV?=
 =?utf-8?B?WHhRaVdEOFNvQSsvNFFla1hkL2Z4NXh3Mm1SL014dVlhYzFhMU96bVlSenpn?=
 =?utf-8?B?Q3VCaFhrQjErbFJSM2RpUytnaFpsT3VLK2VtWWtKVTBKT1A5QU0xYzAreWRB?=
 =?utf-8?B?WHNoRVkwcXk3MlhIeERxOUpEa2dkWitxTTZYbXE4WnlTeHBnWWZzOUxxR1hi?=
 =?utf-8?B?czc1UkYvMDMzVi9oeVJ4T0VVMmtJcXNKalkrMmliMVZSTGZUZnN5ZXhYQktP?=
 =?utf-8?B?UW9rTTZRTEgzZmFrVW1COC9nWWhvU2FVK3RMRUdXb3BsZkhleXJtQmlKeXlq?=
 =?utf-8?B?eERaRkFFOWlPSTNFYi9FcS9ybkJkK1d2VE9USlJWR2RkUk1yZU9ESlRzWkxS?=
 =?utf-8?B?TC9MSHhEUHVrN3lNbWRvOHJhZkhMQTdDNWJqQWhSMTZUdEJGMk5jcGJEb3Ny?=
 =?utf-8?B?R0pvdkZ2Smd5ZjFyRlZSQU8rZWxJRFE2MmRmbVg4T0ZLZVdQZktMSytnSEJT?=
 =?utf-8?B?dnFWWFEzcmV4SElKQkN5dWwwZmlycGtoeDM1OHB6L2EyTVlaSk1vWDJmcU0z?=
 =?utf-8?B?MmQ5azkyelRRcUczQWdRNUM2dXFzdmFpc1pNUlU0V0grVlQyaEFWMzFta2RF?=
 =?utf-8?B?Wkh1ZFdwd21TVUduaGFuaEtzbWhCMVhjR3YwWU5GTUZyTXlYRWZjVG5lUkxB?=
 =?utf-8?B?MGNUbWtmb3ZpcE44akFtVTRTL3NiN1g3UHVxa2JJVlovSXpPc29DdEx3bklj?=
 =?utf-8?B?VWJSVE5NelBudWJIenVmUlJ2S3MxOWdTZk5LaWROTEM5N3V2enZlVFZsaURq?=
 =?utf-8?B?QUQzdjZnSzNERHlQVEI3K0dId09pb21xeXdzajZmdEFOckpVV0orRjRkNjNm?=
 =?utf-8?B?VWp5b1NOeWZZWXVNNWdvcHM4cHFhL2h3L0JhR2VqelV2TThzRkFWaHJaVm12?=
 =?utf-8?B?SWJLVG80aUpUTjdPQXVKYmdyU0dBTWRkbS9NTjJNTTlwdUREdXVxQkxrMTho?=
 =?utf-8?B?RkhTZ1RqQTFTeHFtaTZ6S3ZITnhlS21VRmVCczZoVmphZWRRdkxveENuUWM3?=
 =?utf-8?B?VWN4a1h5NFlnclhQZ3c5YlhBOXRsa0RaS3pNMzNpejA3aXk1TEVQSTFBN2NY?=
 =?utf-8?B?d0NiaU5nSnJsbTVtSVZZdVhiNzAzTVpoSVRyZ21CSkt6RGxDTTFLdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 638484ba-8709-4b36-121a-08de4c6c8f45
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 15:10:27.7971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMhaBj+cTN6us88YkAt2qouWEKGNkMc/rD+FQBDA8748vDPxHK4j5cQypdo7Nzd/6rfvm7xFCm7vTBw0mfRLyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3189

On Wed, 24 Dec 2025 16:53:43 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> With nixpkgs's rustc, rust-src component is not bundled
> with the compiler by default and is instead provided from
> a separate store path, so this assumption does not hold.
>=20
> The assertion assumes these paths are in the same location
> which causes `make LLVM=3D1 rust-analyzer` to fail on NixOS.
>=20
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/x/topic/x/near/=
565284250
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

I can confirm that the assertion will indeed fail when using nixpkgs's
provided rust-src (although rust-overlay is fine).

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  scripts/generate_rust_analyzer.py | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 147d0cc94068..e69fa5e0a9b9 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -213,9 +213,6 @@ def main():
>          level=3Dlogging.INFO if args.verbose else logging.WARNING
>      )
> =20
> -    # Making sure that the `sysroot` and `sysroot_src` belong to the sam=
e toolchain.
> -    assert args.sysroot in args.sysroot_src.parents
> -
>      rust_project =3D {
>          "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, args.core_edition),
>          "sysroot": str(args.sysroot),

