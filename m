Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022140.outbound.protection.outlook.com [52.101.101.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07F83431E3
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771514490; cv=fail; b=e/fEOGFoY9lc8t8m4DdiYHh0/s0J8GWrXeW9WxSOcbICd4wWCY834xdlOe7MVGetNMme2zrcuwoD8K/AKJTSX0kQZhJtVt1csEGpRD8OV7sOgAnu9VyOKB7JHtDLX+1XooeEXdcZnoUsDTJDi7TqxSfBJXlUvPyfXwD180jChY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771514490; c=relaxed/simple;
	bh=jg1qpdGjOvsjljG+P8aTVboECwwC/XiYy7/8RoUpMcQ=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=GBWfNsNHGxmVbtBIlktk5KwoykJAZ0MqHHDJ/HyXY/DT8BGpsBTCQyD4wPuuGrzaxTLgerdgtzvQZfRRVl5bjuHqv2Im1Ye5Fqy/cxYNlqqMunLonmcv1jWiJGHW3P7akHJ+6+nQmp3TL1XJvcbm8Xm9AnEc3TMY41EglD6qc8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Itpty5Bp; arc=fail smtp.client-ip=52.101.101.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Itpty5Bp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXNT+5zbHT3lw0LhHtd1wDclEet4JPoP3qNOTzskBwsK5/zXlrROVtj2rWeFO9PVXMhxumyIBRinFP+VwrKEpbw5wXXMNX4C9FX9PfurcsgkICJRuAaBa74SIr1plyn0eV1obks7z3SO6I2P87svQuGBs7nIE0rMtU7MsG71yCzoQ3ot7VwSGLmVmitF3zKuj7mlfXk6CZcY6+VE1PGW6gy7GXabvz3D2mMiPxruSDmIOx46/uKxap7R0s2c1SEQ11nbzmhh+iAKmXNX3VpEGZ8P9vQC/NkM8BnPBklhtQzlFcV3tc1PtpaCauvSemgHphxvyO+MEw6TLsJ/thXOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEEtwjOwF5/I2vgQ8rwrZ/fmlmrenJ1wQQQMa/9A5Ys=;
 b=IiwpU7fT3KBCmIi9fg+cWAYHPj860kBuQlg2m/P5viKfKjEPwcv01IbL/nO5h+V1rsuxODSThRUwDVHMzxEH2eeunjfAQs0DG+aMOTs/dXF+sxVJzfsewYz5YanAGIaunU4ALkiZpGuwl7/A3DOfGyh288nsY7QftOfQIvQrGB2UgElaF8qzuBHqyM07VsNVMtjGUV8ZQo03THpnh1ziZOP9R4N9q5AtTF2mQ3yjYdaJb1uG9XFoewtivpXxCfo7HFlv0jhFITrjn7BtfFnt3Y784x6KhH0RfHcIaqjuB0uavgtekNz54v1CmexD0nF7i6q879D9E3RGZ5l/kbHI3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEEtwjOwF5/I2vgQ8rwrZ/fmlmrenJ1wQQQMa/9A5Ys=;
 b=Itpty5Bpp+6FQBZTaXQuylTA0oUJvLlxA0pKKuEbh2lebFU2jv7iX5SDI3hls4ydB2E250e1vanPNq0tBxIoWzQvX9lIof4PLNzvhqTGdmX0LxAXLOhJ9sCHlh9fcQO2Cx+0x7uaD/bWVwaZ+xPaSNfpzFcH25KXDq5J2WGuGVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7527.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 15:21:22 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:21:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 15:21:21 +0000
Message-Id: <DGJ1H1TJVYBF.PA8G6HMJ0V6W@garyguo.net>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
From: "Gary Guo" <gary@garyguo.net>
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "David Laight"
 <david.laight.linux@gmail.com>
Cc: "Marco Elver" <elver@google.com>, "Will Deacon" <will@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Waiman Long" <longman@redhat.com>, "Bart Van
 Assche" <bvanassche@acm.org>, <llvm@lists.linux.dev>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Arnd Bergmann" <arnd@arndb.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "kernel test robot" <lkp@intel.com>, "Boqun Feng" <boqun@kernel.org>, "Al
 Viro" <viro@zeniv.linux.org.uk>
X-Mailer: aerc 0.21.0
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck>
 <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
 <aYNUmEfDzq7lTFFr@willie-the-truck>
 <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin>
 <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin>
 <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
 <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
 <20260216110915.4f0d5490@pumpkin>
 <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
 <20260216174324.75d47e37@pumpkin>
 <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
 <CAHk-=whFGxN0nUffzCsR_NZnQ5TTu+8QFGSfca1j42kDK1a1tw@mail.gmail.com>
In-Reply-To: <CAHk-=whFGxN0nUffzCsR_NZnQ5TTu+8QFGSfca1j42kDK1a1tw@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0324.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 007347f6-9cf7-42a1-a446-08de6fca89d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emFyL2J5VlRKNGh1OVJHWERMZU9zT29hMzNaSXBwVWRveUhxWHhUNldYc1RM?=
 =?utf-8?B?NHVnOUg5Y3lpeHd4dXIwZGMxNnlyWTdyRWV1K2J5SVY1RVFvaEdLbFBaMHZY?=
 =?utf-8?B?alVEZGt4WkpzUWdudUx3RG1kNE9jcGZVVW91WndJSnNqZ0FJcDluSGRUYURm?=
 =?utf-8?B?N1hYQnNzWk5CdHRiekN0TzhqdllqT0RjWHFUYzVOTVp0RlRGQlhETjNkOG91?=
 =?utf-8?B?c0s2VFJWL1ozK01NSHRBVXpybjZIQ1RidHhLVS8wTTcrRnlWUituUkNQdks4?=
 =?utf-8?B?TUZyZ004L0UrKzEyQ0d1dDJrSkVMYU5GOU9ySkdRa0lCVVZIZnh0Tmp1MnFa?=
 =?utf-8?B?Q1RPNS9oRG9HL2JLbTdJNVU4STBlK1FEZXdYbDVrNUJmSlZ4cjNLOUxqWTdt?=
 =?utf-8?B?L092cExBNWM4ZC81RWkraGpYdytkSW4xOHlla2dqNE9MajEyNXI1a2p4UDht?=
 =?utf-8?B?UTRZU2hmdUlpQ0ZiRVRGM0l6M0tkVXpnenZnUjJFd3VvTzFxbElqYVhYZE04?=
 =?utf-8?B?OG5CdGJVQ01yNnp3NTBGOXFlTGRTZ1Z3L3dtcUo4MzhlMVFjNDRjczNsbVhI?=
 =?utf-8?B?aHRSNjFjS241MEFibUhYaUEvaG9Gc2hXcXNNRUVwNmRqQzRTeDJOMkRtUm1Y?=
 =?utf-8?B?LzVUTWR4VS9TSkd2WmZFQThUbWFxRUd0OVllMXV4K3pOclV0eXRSSHZLYVBj?=
 =?utf-8?B?MTFqOXhpM1ZCcGpMUmFvSVI1aUxYbWdnTUFSTDJ2cFIzQkd0Ym4yWTNqT0ds?=
 =?utf-8?B?TXVxNTBRQjZLdlBCMUdLMGFRODM4SzJsc3MvV0ZoV0RCR1I3Q3NiOUw0K3o4?=
 =?utf-8?B?anRndXkzNW5Kd3ljK0hCcVlKbjlnaW1HYy85NGxjR1huMHRFMWxjcDdFY3ZC?=
 =?utf-8?B?MTZiVGtnL0dwVlJPSS90c3pobXc4OE9oSUNiUUxsbkU5K3R3UEROb2hUSGdt?=
 =?utf-8?B?YlNRNnVtTlpXSTlTdDgxTE9DYUFHNlB3ZE1rTHpwQzJFaHNuVjI2c2gycDFD?=
 =?utf-8?B?d0Qrd2F6a2lnaGU3alpHQzg1Vyt5eDJQSWt6TVU4bndXV1JtdXNKMURDY09B?=
 =?utf-8?B?ZFpiUlBEd2xVVi9wd1E3QmUwc3FqNjl3YWN2Q1lJZ1U1cUtnUHhpSDNabGpH?=
 =?utf-8?B?WmN4WGlxbHcwNzlieUUvK1JBQjdOdXpqSGdEc0E4Qmo1Nko3ZTFLazhwNWNm?=
 =?utf-8?B?dGdBSGNWdUtJc3ljdjN1MWJPNy9hN1FpL0M3ZncyMlM2TFVJeWh3VHlxcmNx?=
 =?utf-8?B?SUNDTXg5eENGRnd3YmdSRkRVcFhlU0lxaW0vK3o2cEswVlZnc2JIUmc0cWpP?=
 =?utf-8?B?VFdLZTZOTzZTZEl4V01JWUZ0cjJTbmVRZmM0YURHUVlya01kejdSRGZZYkE5?=
 =?utf-8?B?amROSmNFN3N5S3VOditvbE1TTmcwQ0FuVmNtUjZlQ0w1SDBxeXBOeHN6OXlD?=
 =?utf-8?B?YUMybWxkVVkvNXBDWGNOR1ZaV2JMYUdrOTMzOE1MRGZxMXNELzVUdXhkTHhs?=
 =?utf-8?B?bmNYS0ZHdGdVT1FSQkE4cEZ5NzJ0dVROL3E1bWNkMHBoYUVkYkpBUjYxSkJq?=
 =?utf-8?B?QWVpazllOWovcHJCQytEbGJscTVqU05RbGJ2QnpuTmdmekg5enB2TnB2Q0RV?=
 =?utf-8?B?N0Z2cjBHNHE2cllackFPUG9vK0h2dEJYRmZrZUd6Z3MrNkNUSjZrMzlzSDJO?=
 =?utf-8?B?dG42SFhFaVpFRkF6ekZCcDBuRXc0TVZNMExPK2xhb0YvRUJoZjlMc29aS01O?=
 =?utf-8?B?VURDRDBNQklZbmZjU1grZTVGTitiMXpYdnlBd3F6MWUvTTA1QUgvc0JWU1I3?=
 =?utf-8?B?U1BPZnJscHBnTndIVlY5MjA5U0tjRmx5NUVnTElqcGdEWTBraXI4cVpNYndn?=
 =?utf-8?B?Nm5KVmhtejlVTVlLSnpadnIzVkErZW5QZGJpdk01V1lvM0N4K29mNWZFbDJX?=
 =?utf-8?B?WE5vQXlxZHp2N2RQNGZ2R2NPVTNibUNjK25zTVZmQnZHcHJ6UFBXb0FLRWhJ?=
 =?utf-8?B?cTRpNEQvMkVYNmNiVzBXZG0raTl6dm9rQUJCUnJxdXFkaVMxeHU5UHZoZUpQ?=
 =?utf-8?B?YUszTjFLRVdHUVhpeUliOEFXV0NNWFhlb3ZPREhsMjRLekgyMmVNRFVIeXVC?=
 =?utf-8?Q?Fxwk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk9Ccm8wMkQ3QmNSVlNvMW1ybjBIbmtCQjZIYXk1cE5TL3lzeU1qaWdYRTFa?=
 =?utf-8?B?cGpTbXd6YkpYZm44dDl6WnVGY040Qm14WmFXSTVKZWJoMkgyQnJpL044K3l4?=
 =?utf-8?B?ZnBFdmtmZVlWTU9jTjhWSlVTM2lFNnlXTWFEMi9GZENENnhadFg4cndUT05L?=
 =?utf-8?B?K3AzN1JJQVFGYmhSOXdqd2g4QjVUejBHSnhqK2pIei8yWkRXbHU2bSs3TVBo?=
 =?utf-8?B?Lzl5d0NaS21CWWJlYzcybER4bW1ybVFFRXZMV2twR2VSMGd0M1ZucW5OSHVM?=
 =?utf-8?B?TW5HUzlDbm03K1dZdGhqY2ZjUExGSGhqbjFhbW1aMUpIL1Arb3JEdTRJa3pn?=
 =?utf-8?B?OCszUExtdDZ5bE04YkhYbjVUQm4vOEhDTVo5UTYyVE5rajRKR29SOHNQZUJY?=
 =?utf-8?B?UEpGSldpdlJzQkFXWEdFMFFzUGU5NTlXNm14SEc0c1hYNUtGaTE4a1ExcVFV?=
 =?utf-8?B?cjVxQ0lDcVhaeEZtZWZWNVQxZG1mbGZBZW40Z2x2a3pGR2x4Y1FFT1p2cUth?=
 =?utf-8?B?L0g3MDNkOWNVU3h5S2NwbUl5Ky9JRkhoOXRJRVFLNDlSaEM2dUVyQ25MWHhk?=
 =?utf-8?B?ZGs3ZmkyUG1neUZZMzQrcHBrV29RSzc5R1hoRFZjVFpSVXBVVlRLY1VTT1lj?=
 =?utf-8?B?SEZTdVNPakoreTdKZ3pBNVNoMGYrNWUwd2RmaFlrdXVpTUFyZFZLM1EvcWFw?=
 =?utf-8?B?akF0cjRRaXdWZVVXT3JxUW8wM1lMdERSTExjbFRKd1V5Kzl1dUQ3djdYVmFJ?=
 =?utf-8?B?ZmpWcWZ1K2JkRk1NN0NPeGFmK2wrSHlweEJvd1dZbE9IVHNhTHpFL3hzWkly?=
 =?utf-8?B?WjNTdUpJeEo3TllEa2ZCb3I1NVlhMS9xb1ZGV3hiajlhNjJPaGFBaGdQUkE0?=
 =?utf-8?B?cTU3RThaQXBwRG5IWk1ZbkQvekI4Qk9FTm5Ya2tLSW5ObkJHaER1VDZXdlRh?=
 =?utf-8?B?Y1BEaTZEK3QxRkFRN1NBbHpTZWhMWWxLL1NGYVk4YzVSUnlVQUZOK3N0a2Ni?=
 =?utf-8?B?enRGSUovVHlwWTJPRzRDblRjT0lvM1R0RlJEZkY0RXd6VXc2RUE2MnY0bDVH?=
 =?utf-8?B?SkdkRXlZZWlQUDF5RzNLUXhmSm5kQTNTOGh6VEJjUk9TdUZDd215cFBNN3dk?=
 =?utf-8?B?d0REMVV5bVBwbnBnaS9obEVsNDBQMFRBbWhPc2x0MGxvTUNHV0lCeVU3S2hM?=
 =?utf-8?B?RG9IY25iOVBSMThLVVVaYTZpRHQxYzJ0UjU1NlZIWEZ4WFUvNU1pbXhHWTF6?=
 =?utf-8?B?R29VV0k0QWR2T05iYWNWa2RmdHZHVWdRdE0vbWJnVUdJUEVSVnhJbWR4aEk4?=
 =?utf-8?B?bVNPcGhHQzdEd1hjV1dFZFBtOXdGM0t5YUI3Qy9adUt4T0Rpa3A0WGl3OFJQ?=
 =?utf-8?B?dEZlVHBiaEhrMTg0LzhGVC83d3ROdVluaWxHT0gzMHM4QlY2QmdOS0s1bTVE?=
 =?utf-8?B?WUxxczZEaDE0aHBmb3pFdmhneTZla3ZCSzBNWXpxV1UySktZak93N2xveWZK?=
 =?utf-8?B?MjRBMzVPL3BZbWdpazFucnpHTmVwVEJYVmNzUzZ3eE1WdmJBN29EL2pNYW9W?=
 =?utf-8?B?YlIyMStWQWprajI2MnBKcHNPanBRd2tpK2FTYlMwK3hrTVlwcXN2dzRrRE5m?=
 =?utf-8?B?VmhrNDhWcFVHdTVPbXFIREtMSVZPWmtxNHY0dVh1aDAvYWFNQ05MK0dwQ0xp?=
 =?utf-8?B?Yy9Rd1NmQVNZUXh6WlFEcEpBUDNQRmxIVS95clFDMS9MZFl4Q0RjZ2xpczAx?=
 =?utf-8?B?TlQ2Ym5QeVB2VndGYzhpMFdvTzVzV3U2blM5UkN3eE1RQkxQMHhxOXBOb2c4?=
 =?utf-8?B?QnYwd01DNHBNcWlzT0ZuWXVhYy9pQTF5TlpNSXhmTVJ2ZU9DQ0NmTDBQT0RS?=
 =?utf-8?B?MUViSlkvdnZpSzZybzFvNWJwbEMySXhaaVZPcThFQ3BsT2pSenB0cFhMcTRL?=
 =?utf-8?B?Z2pDUFB5SXNMV2xFYWIya1NVeXZGdTFPQ21tVzdMd3BxcTJ6Y25LbGtHK3px?=
 =?utf-8?B?WDlSSkVTV1BWNUZkUzNoL2VENzRhbnkxdGM0bzVkcExyeUZsaXFKcVB4QVVS?=
 =?utf-8?B?VzJRVFh0K3dJcDFob3JlY09TWkpIdmJpQjJPYWYrVGpGckxPdEZMSGJMQnpN?=
 =?utf-8?B?aWFwbE9vUzgvTjQ1N3V4V3B2NFJCVC9PUUhJNEl0MlNnZExoaUtMZ1hsR3Uv?=
 =?utf-8?B?K0xEUVVmSzRQbnRrNCtRT1pSTlRFdFpBVmk0WjdJT2FlSHBaM21WU0FrM3Ns?=
 =?utf-8?B?Q1BCclVnell6emM4d3pESnFFTGZQSjZEODdhM282LzFib21wSVhHczQ5Qk1I?=
 =?utf-8?B?ZkVIOFF2bTh2QXlpQ1RteU9GOWFHbXBCbTdyQ2dYVE1XUUlmLzdUQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 007347f6-9cf7-42a1-a446-08de6fca89d4
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:21:22.0506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buvHkfVXjy0f7szkjaj6IMu81c+ep5VA9JKgBrWgfpt5GG5OtucRypMPZ6wV/+St5ROBmvuPfW/2IGRgDkGI3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7527

On Tue Feb 17, 2026 at 4:32 PM GMT, Linus Torvalds wrote:
> On Tue, 17 Feb 2026 at 08:23, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> But last time I looked at it - which was admittedly a few years ago -
>> the compilers we supported didn't actually do anything reasonable here
>> (ie the built-in atomics were fundamentally worse than the ones we do
>> by hand, and even basic things like __atomic_load_n() weren't
>> actually; better than just using 'volatile'.
>>
>> Maybe that has changed. We've upgraded minimum compilers since.
>
> I  just checked a few test-cases, and I don't think anything has changed.
>
> All the trivial things where __atomic_load_n(__ATOMIC_RELAXED) *could*
> do better than just our old code using "cast pointer to volatile"
> resulted in no better code generation.

I think compilers are *very* conservative in implementing any optimization
related to atomics, to the extent that normal atomics load/stores are
effectively volatile atomic load/stores and thus the optimization you are
referring to here does not get performed.

However there is some limited optimizations being done to fences, at least =
I
know in LLVM multiple fences do get merged.

E.g. if you have=20

    atomic_thread_fence(memory_order_acquire);
    atomic_thread_fence(memory_order_acq_rel);

the first fence is abosrbed into the second.

>
> So we're sticking to that "cast to volatile" not because it's great,
> but because it continues to be reliable and no worse than the fancy
> modern versions.
>
> But at least it's explicit in the code, not hidden away in code that
> *looks* like it just dereferences another field in a structure.

The implicit load/store is arguably the biggest design failure of C11 atomi=
cs.
However we can still typedef like atomic_t or use "cast to _Atomic". But as=
 you
said, currently this does not really yield any benefits over "cast to volat=
ile".

Best,
Gary

