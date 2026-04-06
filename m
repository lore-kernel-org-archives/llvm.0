Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020105.outbound.protection.outlook.com [52.101.196.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475D6328B7B
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486424; cv=fail; b=CHULa9/Hn8QrJE7XFtUDZJgxF4ZMsuV3TDNXQYUlCi8FxW9p3B1PDztNKkU/z2EAmvd+rVv5EnRix0Wc0Meuzc18CvYEojK6w36OJhs9bSRaDKP2YAiHV6XF4T7iZn+hk87YpTpsubFNNSpK4roU75sQLtSpruEQBJoZKgSkqgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486424; c=relaxed/simple;
	bh=G6UDwO8h1C4JmM6fGmWld+iD3dXFvw5D/14HPvRvWyU=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=NnRzrKFAKnmZ9dLwMHurc2M4ubMlHQEJHT/5oveA8wTqyxbOn5XJdHvgpfglcDNNUnur7xTwagbzcUsutGVjfydMTKnJeh4i0xyoBi+uo7dZbKHhmYGH2prBqtVeiYMHFVtfdwNXaLq/4Mx1Kv/0cJECh/AtQDbM3Egcc+nPKhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Rm+5ZqRm; arc=fail smtp.client-ip=52.101.196.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Rm+5ZqRm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zI4Ju6A/oKuwLtJ2/pxpuT19jH824+viV6+6XacJOONbCX5D2VfchXEqkzwe+HwWzSghX6Xyet6XVs3QrlimTN6GVI4KEraQGfl3pGqHcTNPh7yZYBPG13PMlsX2+rzfAqNnPO5uZj4ZlV7VxlJHN9QCgWh5lyMMr6JaRTdGxdOclzhyvbry9yV1pD3kZhH68ac9WUZdLLalp3lZObGwLXHXK2yBbYtnr8S4wdcGEMvzLdcn7N4d6z6fIXXMyueazyy5gMTgdqckg2qVSNVIJYH5uJn9uHMB84vQDv12J6cpn/TC5F9N8EkdzuCpfFqG+u65Dfqow/7r3Awvpy/AJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUOgCG9ymtMGr3dpILdhwI8qjRTbWokxgW/eKrtsY8I=;
 b=EaJn78toeslti3OUZsGsWqnC4vR34EhLfgakorw8zoLqpu6o66kc/+VbC8d3w4/x+m5Kg56XF84l5h3YHjjKeEvAjkSR3VjoZw9lO1Y1JivUxuKuekbvMlZvZYZv36xr9yxPmFwiiP15lxNrmWr2crbXLEBmxw8P5HfEBGi5zKqbBGSJuMnq0ynCMkyOMYI3ESwjUIDKaJUq4D6pmMjE7cvgeHiGuIKcPRwsRxijO1RW9rCrNQI+FIOHq3kCtu/LHlZ+9Q0UzfwyCPsbO62ZvHQS4xnUtBJ7miK86vcw/T5q61XoC4pFWNoFEFyeCOv3RwEcKjmcPR/1jP4NECAzyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUOgCG9ymtMGr3dpILdhwI8qjRTbWokxgW/eKrtsY8I=;
 b=Rm+5ZqRmU44g6E0SVt4mdSP180qfEG15dA95W51XTtao0WGwT+uZdnx8funHCmQReAi1UCAETHafQNOdMKn1aBpSI/aBDgTqd+1HdTAEy8Aovasfv0HxDDm9Dj7EzkPM6WGH/IoZy2ocXSIS13Ui9uz60LbqQvg+kaCAEst2RBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7527.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 14:40:20 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 14:40:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 15:40:18 +0100
Message-Id: <DHM5EONZ3WWV.1076LV3UWX6YB@garyguo.net>
Subject: Re: [PATCH v2 1/2] rust: kernel: update `file_with_nul` comment
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 <llvm@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260406095820.465994-1-ojeda@kernel.org>
In-Reply-To: <20260406095820.465994-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0619.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e26dd5-d6bc-414f-64dc-08de93ea6d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mt/RvRRqBow6dMMlHJLwkdsUGXRWTXQKFHShPYbMdrR3l+7eyCjMlJNv+IaE7+YX6oku1mU3bnVY0rCAgDNNtcy4h3SQqgX/8nCzyoxTudxP4hAFt6OC4Z3V/IcvWERtsDMGF3UhLMnncbuz3FKUnnnZxR/PXekArNVlBWHIbOte9fSnspWE+SImpq1/GcAQr8hz/Ui0jLhoptmttZnMfS4lgdPZ/5ATqrJGjU9hApwYPdKlR+LoOKyOrXtWTyyqJ2aLIyVexcyEUASxoR+OhD1rSBuBOu+LF0gBly4lzv4kh4R8fopKXVm+uPOZHGtJkEK+2rrywE5AxD+81AM17oCs6ovN9p21o2JtPo1ncew/vyPiRYjtiEcMudjv2HHLDhexf1JMA23GI43HVLaCZzK9kep6SdEzdjMmWAEpWiUh+evIt9BYN0w3GmRP1gaupKooFqaRSR3wg7Pq64e6iDI0o1E4gbQjtfnw4b732rRGJ0/25IbhpaC5FjioUG7691I+QaVDxrdaY7wO/pg5FqQ881jajT7/yXzjaLXXbkCj7KfUeKcPE5nJpNup62jVwsOs1j/BdQfqAW2TghCwfMolAqU77lbXO02ZfM0YwiInkRN4NSxoRWF4HTO2Lil8E4VZe007cSgUcaVcDNFcIPK2zAUMVtwb2FZrW9yUcCIBrTxjkJpKIV31X/XjSSFsvqQRQwOgjyORtLgKOyvhvq5SGi8sv5+NL0jCuonhSbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWJRMUhkZGljKzQvWVFiM0IwWVdHZHR0UTZCR08wdDZCdWNrRzNpc2ZmVlNl?=
 =?utf-8?B?Q2tDMUExOHBpdWlwaVNINVBweEJFeEQ4ai9ISXY2N3BxKzhJTlpBTFc2ZStj?=
 =?utf-8?B?OWhmZkFmSm5nYWROZXRJaUc0MGlydFNUbEtOQk94SGN6WXR5MVhrNUpjeTF2?=
 =?utf-8?B?d3prelkzZGFFMlBMbi9Kakd2WEEwZU9GWDdEM2xKbWlqSVgrUkhjR2RlTm9l?=
 =?utf-8?B?Z3pPZGxUVW5aVDgwcGxsMXg0RGtKeUFIMUNpSjVuekc1TW1sRXpGdm1QOFZO?=
 =?utf-8?B?ODdnT0FEVW1salZ6MFlNMTFyNzdXODdpTlpJQTFMUFVkMStibGY3a1A1NU8y?=
 =?utf-8?B?cHluN3VIdm9RY2VkK1paMW9lNTJVL2xpeTRWUTNRT1V2akZiVW1sbzJsa2tm?=
 =?utf-8?B?OXJlbkFPN0ZHVkp2b0xUWUFkTDNwM0JSMlEyOGVPZi9RalpVMlNxb3dIQjdD?=
 =?utf-8?B?dTIzd0NBbXlYK2o0WU40WmRwRGhTc2R3UHQrN1JRdzhJMDg1WUVhYi9EbDhp?=
 =?utf-8?B?aEdNTHZoSGl3UmM3bi90eHVjOUh4N2c3ZTMzak5sK0NvOGNBOGpqa0hXT3FG?=
 =?utf-8?B?WHJ0U0NIaG9aQ0VEMHdkZUs4Zzc3M3ZjNm1jM3ZUek0vaGl6MDNVbjFlbFB6?=
 =?utf-8?B?emR2TFl5UDhtN3EwQ0w3d0duZ0FvL3RwWW1DaFdQVUpjQ2lCRy9ycEJyTGFK?=
 =?utf-8?B?US95OEJpZ2srK0MwbkR4Z1hxdWFMekcwYzhGbzZhNERzendFL3lQZWVkUmJ3?=
 =?utf-8?B?Nms2NS9xT1Azb2F3cmZzcUV6RkJyU3o4TFNMazRmS1Jya2duN0lRK0MzMHJI?=
 =?utf-8?B?RXNxRXMzcWJuZ3VEd0J2NXoyMHFvRHZrQkJqSkl3VytNdkdlTDNzUEpickVG?=
 =?utf-8?B?a09scnBKWVp1NDVGTWd6M0orWDJyRTY3a0RXVklwTWc5cHpMK2RkZk02eUwz?=
 =?utf-8?B?dmZoQmIvSk1RRXV6cXFYaG45cFVsWnoya1VsdFllTjN1ZURFaHpjUEtJTjJ6?=
 =?utf-8?B?ZzN2TWVTYUVNdURFTmJVd3lFVzFEZDRYQTNNVTFDemQrbjhLdlg1L05ET1o3?=
 =?utf-8?B?VmkrdlVKS0NJdWsyZVpGb2c0TERLQlcxQ0IxWmovdVBKWEdYL0piNFZPd1ZK?=
 =?utf-8?B?TXArUHFGeVExS1E2U3hheUZqMkhSUVV5YjJ0NEY5cFA1RjJrTFZyd08wOEtj?=
 =?utf-8?B?a0l2MGx2MFJRUkZMSFJsVXZmOTR5NTdpZ2NKdnpBbXR4WUdZaFhidGt4U3Vw?=
 =?utf-8?B?ZVhVVUNFay9TTk9abGxMVWVnbys5YUlyd2Nqc3JQVnFZMnNVRmN6VEZoMzhZ?=
 =?utf-8?B?dXJuaURNdFI1UVFqNlJ3eSt4MnpkR3IzS3B6cFRpdG80M0pKSXpkbERITm1Y?=
 =?utf-8?B?NXJlZlFVZWltQWR4dzZpaGFPK2RSS3pTT3UzdUpZZlpYWHJkdVVXV04wQ0hC?=
 =?utf-8?B?bTJLaitYSEVwVHAveXJrNUUvZmszRlBTZ2I4bE1aZGY0Y3BXcnJKQWd0dFRB?=
 =?utf-8?B?RGErQWxBSmpZclllZjFVTmkxeFlpdkttVjN6Z0tHQ2VJODhsRnBTZ1FmaXB4?=
 =?utf-8?B?RzNRckJNdHQ4VjVGcU1KUVNoL2s1bHZFZDVmNEtrR3BZM2J0S01CUkh4b1hs?=
 =?utf-8?B?Snd4dEdPcVQ4YjBobjJQdmNYYWpDRm9xMWYzZTRLSGZBa2lMRSswbFUzWUpL?=
 =?utf-8?B?blFOYThTMHNaZUpNdVdyY1JsOFB5ZkljcFh6M1F2QjArMlZqNFY1VDR2ZmEr?=
 =?utf-8?B?blY5aGovakdJejd3WU9iUitvUmgwYWF5OFhoMkpGcmJUV2tzMFE3YWpOSlRt?=
 =?utf-8?B?YjNnYXUyZ0Y3b1g0aEZBU25aU3FDTEZ4WTZNV2U3U3dnRGx4QmRMSGhSWHZV?=
 =?utf-8?B?Z2RhRmtTMXlQV0JCeHBDMHhDSUtMNVU0N1V0eHBNdEU0RUlVak9KaHRZUG56?=
 =?utf-8?B?T25RU2I4OFRjK3BFT3JwSzI5VzNhVFM5bGU3ZytRZWFYa213YkJxU0RpZVUv?=
 =?utf-8?B?SjZLUlpTRDhmSVFGR1JRQlVqTk1vWVppU01jVnBsb1BtMVEwdXB6YlNDeHgw?=
 =?utf-8?B?RlFFMkNrOWdxZTVOM1VuL28zR0xwbmZHam42RDdVQURhanppUVZFMGE1MnM4?=
 =?utf-8?B?R3k1VVIzcndvRURTSVg1eXprRlQ3b0hmTzk3MlpYL3Y4WTdWeisrVjd4ck1v?=
 =?utf-8?B?K3p6RDQzSWdmVzBGUk44U1JSdzkzZE9RbFUyUzkvQVpabVB0YjVZSHhiU1JQ?=
 =?utf-8?B?d1Y1YVlrZHMyekNISlRmTnVjM0VBaGJjamhmQjQxNnd3TUl2UkxObXBBZ3k0?=
 =?utf-8?B?N2dqN1dyMEF3ZFJGdmlrRFJMdkRxaHo4VHlXM2hmSnltYnhUdGxtQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e26dd5-d6bc-414f-64dc-08de93ea6d2d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 14:40:19.7667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qu+rHJ9pS9KQPPiLghD8YHLIZ5qs7MZ2aZg0cV93I3nUxd+hAGV9D4sHzoSOmJR4YYgZdIn1jVZCoD7KgHMw8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7527

On Mon Apr 6, 2026 at 10:58 AM BST, Miguel Ojeda wrote:
> `feature(file_with_nul)` [1] has been stabilized in Rust 1.92.0 [2].
>=20
> Thus update the comment to keep track of it.
>=20
> In addition, this will help to sort new conditionally enabled features
> (i.e. `cfg_attr`) around it appropiately.
>=20
> Link: https://github.com/rust-lang/rust/issues/141727 [1]
> Link: https://github.com/rust-lang/rust/pull/145664 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/lib.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

