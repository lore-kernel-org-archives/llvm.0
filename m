Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022076.outbound.protection.outlook.com [52.101.96.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B041A34C815
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692039; cv=fail; b=EjrZXlfY4DkKGO0rL8cS/yiVNX5Y4gbw3UtM12jwQbZSXFLTgaFcPNfNYzXCpDVyoTFD7syUtWbkCEbppOL3HfRj/SHG4Qt8u55hlJk5aQOJmh4QtS/KzzRLxkhNUKMxu8Gmo6A8Gs/Coj9XDxGFv+lV8UGiWb1k7/qwV1WvXH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692039; c=relaxed/simple;
	bh=KpoaE5WPQLdyhhc5fbXGWgWstjo1szQ++FnTbKJW1O8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AzVwyR4hwHI5+hr7uXFYYRTTBEn+eLvf2D/MWWDM+uEHKdyuDtMXUlw88bEIHnQ44rA14TLgxe9A/m4iknAL1xLfLy7GUqAYGN3tOp8Sxcc9v0q38DMhuQgF2ToxJxg1BPLzxxE6QWUbaEASMwaTEaaMmnFbAPRYayBQZffiyCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=c8KerQpN; arc=fail smtp.client-ip=52.101.96.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="c8KerQpN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGdRX+WCupzaCO64xVCO/cFsl2Jhanhldoe7brr4b9yzdt0/NwSCzqiU/ozEaJ4qn9qy2MBNtBLHthaaZ3sc3cytyvA6Yf8kUSmYO82GHow5KqWzJGj5CCbbLEK6G6rPieOuAX78VDWVtq+TaYm8vRgRu1IdSM4IYPRc3z6LLyVsT/RYcK4RkHxWD7GvaJhNLY7YQfO8lDzANV2awOTDMXiemy2EhiebAtmR3GFWkoU+FFg0x999sKCPscL7o2ZxwlZ8QVE75UZBYFrB9PRwMhOvlnmDe6lEXpiU0cyDfhD4ZUxo0/OrWP2Din2oLTmXgwLb/Pej/6vss5HI1lKZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpoaE5WPQLdyhhc5fbXGWgWstjo1szQ++FnTbKJW1O8=;
 b=y3qyYo6AoQrMh/aR/1BsDfT8sG3OhoS166HQifsACOlZnzGHZghcENv3PvmJ34McnHa3AJS9MO7w2yezYlkRwcFu1oXKBj05VEudIiMEgpziVBAGr2HONx6GAWmzSjtWlkQG8StEhI/wOOwg9j8dgH/jqijQSrUbq9mW8HpZkRnrE+XhNPrzhpapd8n6Ac1HBcqBwhPLRg2FYhXWhtL6nne60OoQqtwU2MN1jcVYOlrKbqsCkcwOaoLKHAku5r8AOV3dlgTAyjIj4TYM5bZQY3/eK7ZLC6kWVAiWxR6/YvmFOsSJVZ4gr0MEIEFew5sj2zhhioD3JgvU7Vw+WZaDWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpoaE5WPQLdyhhc5fbXGWgWstjo1szQ++FnTbKJW1O8=;
 b=c8KerQpNjJe/M38xpLAkB6ghr4786CJk5P90DSGy6ltMJiOUZVVJ7yS1SoRwckdHSd088XRWZQQH9ugxDlYAdRBal+kbLXfUfbPWdZdZPZ7ztgwSOSXmnx/meH4aPQ/7FTYNkZFzSejWAugWGa2lTrfMzyNM9HiSG3xYcBTWis4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB2636.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:14b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 14:00:34 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 14:00:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 15:00:33 +0100
Message-Id: <DJUY1ZYYW5K6.39XJ3ZV7DGZQW@garyguo.net>
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH v2 2/2] rust: std_vendor: add `likely()`, `unlikely()`
 and `cold_path()`
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260406095820.465994-1-ojeda@kernel.org>
 <20260406095820.465994-2-ojeda@kernel.org>
 <CANiq72=mCc3XQ-fpkxBdEVkjDyt4tKzrdCuWgqMkQOyqBMej3w@mail.gmail.com>
In-Reply-To: <CANiq72=mCc3XQ-fpkxBdEVkjDyt4tKzrdCuWgqMkQOyqBMej3w@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0495.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB2636:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a247cae-59e4-4ca3-42ef-08dede8b9c76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|376014|7416014|1800799024|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QW9usQJlcGI3HI9ow9GdjjVBj7M6+kA9ZlWDRTYkpZ5CPrsBOwRG2AaBdOZjE0hX4Ighlt7xgOaSxE3pclcKzt5NGvKOBmlhymZ4o2PN0KglE8Xxx53R8KqNhhIs8MKHpAwtjWMIIZ4xFsjiIwDvq8chKR9yHmDJftJG1wkZlGyBbDPVieVhdBHCUR+MmcqaoW6UkikRQ8J3Nc/E63xkac+WwZe6YxqA7bZOYBekbL8tynMs9kbZh9g1DEwLsnwhSXrwG8/zLyBTFSB3y746x5eWQJoVRWyJ0pMd8G2iD0fYdl0QRFODrV6MUbfCRk388ous+f3/tgMxf45h9FIPL6KRfWCVvB8PpveIDT8FQoZDqvp5JgbfMdPRpb3HD3HlK1PLhkI3H7MoGOYCon6MboeaEPlqIBXHv7GnVJF33rRHJAv+A6Y/xb1y/t6fp/NPEPCJTuNKWfyyMNc3hWVGCBxUKystKsjg+vx+Kbzw4xOQwQDvGl7Bg9sTWaBdKqLnwPBCubqsxxFk7znHhTHs55GceLlXxJcM55mkv46LuhzeYMkkMkDnO+WqGoYfemlx6vkDJnCIwip9ck5enbobdGWQm+jyPZy5P+1NXegg8pzHHyOc17w7Ex2pzzXy0p4CX/UlJGtrHFFghLNVv+SqEutAjR6eecFX+m1Ho6oHeSk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(376014)(7416014)(1800799024)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlV1RWpzcUd3VWNJSk9rcGp1ZVJsVEdVQWF2MjNnT2RNOEV0Qml6RFJ6RStn?=
 =?utf-8?B?b0RmOE4vNnpQRDF0K1lqQ2ZwMU94bEFPK0lGNEdtY0RvUWlYaUNWQ0I3UWVu?=
 =?utf-8?B?Z1pJMEsrSWgyblBDRlRiQnNJejY1a0R5OVVYR3Y3eXpRZHNDbVRuM3hNV1U4?=
 =?utf-8?B?VVVvMkRQaHNmOEordklBTE45NTF1RFQwRzNwcGpqOWtNZFE0MGYrd0tsbUpH?=
 =?utf-8?B?VGM1a0UzNVpod3FCUldNeWYwOEdjbURiT1UwaUh2bC9tamhhOHc4RlhvcTJx?=
 =?utf-8?B?UjdOZ1ZiK2hXNjBhdUhmRE0yMnhZQ2dtTnFIZnZHY2tlcTZ2RlRQbThSNWwz?=
 =?utf-8?B?QWlDelRTby9xR2R0RUlnS1NkQWpKVnlZKzluUjVSYVNKVlk3bnB5WG1sWGhv?=
 =?utf-8?B?elUweWJSRGtxbElkVlNmNC9Uc1VKYm5UbFdoMTNqZ1EzTmpJd2l4Y0tPdTNG?=
 =?utf-8?B?SW1BbEloTHBjU0Z1QjBVUWg5VU5FekhFRDVHTHYxQXlnc3ZTSVRQejk2Tkt2?=
 =?utf-8?B?SDFNa2xHam10bndMM1dFanQ4VnMzcFFPc1FuSkNuUG5HK1p0a0VPRDBVc25K?=
 =?utf-8?B?RExmakpzZEdvT0JrUjRhc2xSQXpJbWxhTVRtd0FMMUl2NlMzcTM4MWdnOWR6?=
 =?utf-8?B?MEtvSVR1bGtjSkQvZGIyU3pCUDB4SGVXUjVWY0IxbnlpVHVBTUVvdTIvZ0Jp?=
 =?utf-8?B?QWl0Q2RuUC8zWm9DcDQzT3FGS2YxN1NVU1ZqVUFYTnZWaVhoektjTmphcDcv?=
 =?utf-8?B?bW12ZHd1bUNjV1lDNC9pM3NSYkdkNGFFdVNCZ1VteVh0SFVoMzMvUjBIR3dv?=
 =?utf-8?B?Ry9wQmVFendtMXRqNXRIbEdpUk9LdlBQcXlnd1hKdWRGdUx4RzJSZExRU1Qx?=
 =?utf-8?B?V1JNTksva2pXT0FsKzFOTTRjMk1peEgzdUVVS3RRRGNNZTdranZacEg1WGZU?=
 =?utf-8?B?dll4RFRGaHhyM3hyQWNORWlHOXhzeDF4dmxzdUI2QWdoOFdqK1pKb1crNmdR?=
 =?utf-8?B?SlRadzVwTnBtMmVmL3VBR1FldkwySDA1WExFWkhRNkRwa3R6bXFyekltVWdP?=
 =?utf-8?B?aWtvVVBnalFQZVg4cWpGR002QnJCVWxJRExyNWdobVNOcG5iYW5TU04yRnZt?=
 =?utf-8?B?MGJLcGZudFJMc1I5c0tjN3RMTDFhWmNkM2p0KzcwYkdCK0VQbmxqZHJNRHVR?=
 =?utf-8?B?aGJjZHh1UXJ0cU5Ec241dzB3bmdMcmE2S29XT0VRWmo3KzVLcmxpcTE4OXZO?=
 =?utf-8?B?TWx5R0sxQlcyWUtPWmZXeks0YzBkMzl6OWNxekNuZ2ppYzNidEE0L08xUmRL?=
 =?utf-8?B?bDZEYi82UzladXQ2azBrcVM4QUtadXFtK3NnN094MStrbXZwNnZ2YXU1ZW0v?=
 =?utf-8?B?OVNqRWNnK3ZteTlMMVlxN3QvcHBRckRTWXBGdmF1Z2JVSXFGYy9MbDUrOVM4?=
 =?utf-8?B?emZiTkcyM2o0YzBLbVdZUHptTUpZZGdTQk1reXluSExwd1AvWDZseUlncDhv?=
 =?utf-8?B?K1lOR0hMQStMTGxpVFI5Ry8xeDd4anlrNml4K0g1c3pMck9uaHphWXJWdnpq?=
 =?utf-8?B?ZTc5U3RnbHBzdmhVd3l3eWxuVUROSHBYT2tRdVBybHMxNmNsNEpicWQzM1VI?=
 =?utf-8?B?dUhITkFsZzkxL3d3ZUhKYXM3OUFncHRWSUYvYmNGbEFlN2kzU0dSYXRnRzBB?=
 =?utf-8?B?L1A5YXZUUEtMS0xCemoyYUFzSzRSK2FmcnI0ZElrOEF4bkRzNnBBb29OenFE?=
 =?utf-8?B?QUhGVVpwK0hITFczTDBiTG5BbGhzQk0rVllJTjFOS3hVcEZ2TFFObndoWXJE?=
 =?utf-8?B?eDNseGlDS3pFL0RENjVsbVNIeUQxSUN6RnErZFgrMjdYQTNzWGs5dkJmUlRC?=
 =?utf-8?B?SkJoRXhTNnpEQ1duaUFWZ1UwRVJYNkVoYkx2OGx3aExGVlRLL3A0WTRzTnMz?=
 =?utf-8?B?UnRCeFV4NURFdEFvQ1VZV1JNbjM1RlE3U0E5eFF3MHBoM0MxY3FEMzNtMXdy?=
 =?utf-8?B?WHdtSGsrbFEyT0dadlVGaDcxU3pvdnBDRkJSMVVzYkwyMGZKUnVEcEtlbmRn?=
 =?utf-8?B?d3VKellOMTF6VWhwMXI5SXdZVUFYTm5ZQjBxMWovZXNoSjNyczVRYnV3R3lw?=
 =?utf-8?B?eW4vb0RQRzhIM2szMHpybGhGa0U5S3d3NWEwQmZURGJXcndGczlvanNRd3VT?=
 =?utf-8?B?MS83WEVYN2krZ0hobVdKY3YvS1g5ODdCR0ltNGhvKzlsNTNNOWExTUNBeCt4?=
 =?utf-8?B?aFkyZ2E3RlNMRFdIT1VJejBNMGd0MFpJdU5WV2tiQks3T0pXQXBqVmQyZ05P?=
 =?utf-8?B?NnlMN3YwOFJralpzVC9nQm5CUnYwU09raWZlY0FhcEpldlZ6Vmx3Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a247cae-59e4-4ca3-42ef-08dede8b9c76
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:00:34.1177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0IkqUgg4e4cmej4Mb2We287FGTqYVZWXO8ZPzT77at0v8/xdxi3Tko2bvORwbWaKEdM43nTro/V1D+xYLo1FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2636

On Tue Apr 7, 2026 at 11:39 AM BST, Miguel Ojeda wrote:
> On Mon, Apr 6, 2026 at 11:59=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> w=
rote:
>>
>> +#[cfg(CONFIG_RUSTC_HAS_COLD_PATH)]
>> +pub use core::hint::cold_path;
>
> This works inside the `kernel` crate, but Sashiko is correct: we will
> need to enable the feature to use it later.
>
> And while it can be done, it is not as simple as usual, because it is
> conditional.
>
> I was already on the fence of making a single function to share the
> signature anyway, so I think I will just do that in v3.

It might worth adding a user for this too in v3. `warn_flags!()` would be a=
 good
example.

Best,
Gary

