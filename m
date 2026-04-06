Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022136.outbound.protection.outlook.com [52.101.96.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784753845D1
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 14:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486765; cv=fail; b=FULsm9xxZmfFd2XhF5HlmUx4lZhLdjt4a/oHoXOPMh/7AefIswUs0/tAYLbg0pQeGpNbeqW+pw7O5mF04cwS33ZbS6dqlXpzLn0Br9lOcRW4v45Yb0+TLNSzjQYdfHQBB+GIj6NvXRA5pAB79Wx+oLIXSvd83z/JnUBBdUYSW7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486765; c=relaxed/simple;
	bh=ccZ7aJO+UZ0HTWKPxrvYabYJzIs4qxnp+4piWCgpT0o=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Qxkqgs8IaFmhQ3cLZnYuyHlADFr76nDf8TrHGZbVNep0cTBLCe8KAngB/AYCPV5HaQgTKSYPn2h495V+/YzdcEHQSQfo9bAU8Eqw2QKdPE6c6kn/6dXII0GufkqaXSSyfTA9e+uEi4r1Wl8FdbA4My+ZD9RIDUwN7I1yJTveLNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DqhOylPD; arc=fail smtp.client-ip=52.101.96.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DqhOylPD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3MImqsj25kEsaVdX5ThzXFYQgLNuaYsLvpHZ2xmjW3m/vh+fjo4InHA6Ibu3gFI2uP15Op7GSw0RYPU6qihtfmEkWvl+3HqvTP7WEsbaZJyadWWM7cF3453K+8abn/B2vQs0Xs0nic9FV7lKbDuz7FVouBVoz819B6LseSoC5B+7ylDfTJsnUtS3PI+4p/36WEgwIiCswReXnx2Hc2AvyPhhtdA5wdTlcXeEoO63fNU6IkRqjJtFgduD029vhvBhn4mtuSGuFSEAtvXXjw7KQK05b7RRbZSpza9FcyrT70YrA/Sr7xq6H3eIt+XGRZg3ZUuiYU7bmJoSnCN4nF7EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcAhm6kkTKCYXoIWhZGpqAWO3xqaUGhDWdl/uY2yJfs=;
 b=e64wwB3ANOwa3zWjR8nFI+jsiu3Br+dq2wHIDU5JwOY37bcLMjpzV7o38EugVNsxDBbyV44RNw+98SysL/8KrpoVdQ+ryvRynoAfcDOeq6iVVO75qPr2jHZoj+afvTZwnO9h8H/aPnLHERvSjyg9n9JNP8yw48MZJfRNLm3L3pnPkYHPBB8khQb4eBMwmlQFjtXO6zlNlf6XbzKkGiZ0we+ugqbE2S9VsM2sKanoSkleYEwoUyiUSw+QT2bmzuNj9YO/0w+gB2aUTcbcYnPuGnXqB2T1KXPMQINerSWi5ePnF2+hQKZA//vPd7rN/6kULfREaprmAQv4IxAz0cIXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcAhm6kkTKCYXoIWhZGpqAWO3xqaUGhDWdl/uY2yJfs=;
 b=DqhOylPDCISJRg98Ithawpfgzv8FeF0/WDpyumIaOA3QEGh+bSsYxQq/03yJGCWwKPN+KsST/aan+5cCvq3mwpH9og3Z0B+WRy9E20jJUtUxbIMjOoUr2EUhc+4ILf85HorJ4xsfma7AwyWDW9gtRoiQ8fNN+gxIO77z1g107+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6390.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Mon, 6 Apr
 2026 14:46:00 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 14:46:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 15:46:00 +0100
Message-Id: <DHM5J1FOI08C.2WB2KB9O30G6L@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
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
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260406095820.465994-1-ojeda@kernel.org>
 <20260406095820.465994-2-ojeda@kernel.org>
In-Reply-To: <20260406095820.465994-2-ojeda@kernel.org>
X-ClientProxiedBy: LO4P302CA0039.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ec3325-f07e-4c1e-95fc-08de93eb385c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5y8eI8xZTOg1DkzVKeF1VMhrjw9QygemLjzUcACy56qqSOg8eKdxZkLWUvbKYRCcl8jsx8duJD6369yw5hYnF/xe4cNhA4AG3c7GHj+ob833fIlFHfmVsSfYPaMEyFzm7DCoZ0QkbpkG6ofAD0id3F7aIv7ddGrlIGERYB1tyUta+1hOWtbXl/IB6YtQKYlYuMmSdP+4n2vzFXwhTtFIv/yIJiB36MGBfNS/PiW+j1eoCz6vYhKxx66vJgf885zjzG/y1TcELecQOPT7wHNsCA2ui6tAqJOtsmUTnsNL7wM3JF48BhD+KYaSDs1wG22Jb6OqYXgDf5YBIdKrMufJAvwtnLkpY7znsJVRLr6+u5c4cnlORkLgq4pKIef8A/fBvqt+aNsbuIB9XhPmcWN5TsohANSMCGnfW8a45e/bzjtCAP22Qfd3A+RU53RQQ0SMq0P5k434qyQpSmdm3SJTFKfsV19LekXP5jGhSdNdbXJNjgqeJFMF94Czcdgz1IaUjOjlHGjR2enPmH3o9d4eyffBT4NCOIXA8/4fqMDj3dCusv2536vsHTCGmu02SkV2385MEg3XuodGYx+BWfSgpmae7a00AXdZHxouFiY0/kHGAp1shZtxDdsNi2TJxf/kjAB74KDrKUJ2zJ/A560r5fYEyblp429hHBEdT6DJvLoZAHFxAYR8hSUmSPtA/Cf8drnVTvZtTJRIxGMpyjZJ4RSM7H0Tr2Rh53pVt7NYf8Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm42c2ZZeGNKTS9VK3pNNWhzZjZUT051cEdScU1LN0VlVDJiOGprS2N0eGF3?=
 =?utf-8?B?aEZ6alJ5KzRsSXNCZmlOWktYU3RFS0VKN0ZiVHBWdzAyaGMxYmNLWFk2T01J?=
 =?utf-8?B?cTQwbGg3K0JPMCtibHJ2SEhGM252dW9TVE9ia3pPdDE1bXp6ZVpNMzB4ODhn?=
 =?utf-8?B?YnQySWhVOU5lNUdMWVBpWVZTSUFpZ3pKdms4aTRqZ3RjcWJ3ZHQ1TWFJVHZC?=
 =?utf-8?B?eGlXMXYrRTBrNUZhQTREN0crS050UGwyMSt2dFRRRGRNSG1QbWhJTmd0c1JI?=
 =?utf-8?B?dCthUlc3M2Erd1MvUllOb2lDcXRodnFvTFFLaDNDdEtYS1VzOWtYempvRUlV?=
 =?utf-8?B?NFpZNnBYTEpGMW5GWjJ3YkhXL2Y4ckxhcGNjd1Q3WjdFRk9pU1AxbitUVkZE?=
 =?utf-8?B?clZicDJvQmNXSm1ZTWQwc1R6SzdZcUlZOEdjMUxyTUF4UmlJamdZTEswV2Ri?=
 =?utf-8?B?azNZNjB4MktDaGFhdDRudWtURHF6WG9BWXBWTWFxSFZjRnZRR1hXemliWUI5?=
 =?utf-8?B?b1lwaWh5SzRidVgrb2xEdC82UFc1TmZITVFxNDd2THZ3TWRCN1NaU1Fvanhh?=
 =?utf-8?B?WEpPTU1PWmVPaFl4ZHVta3c5Y0R5bEdXblFGak5vc1B3QW9GdVRUZG1ZVG9p?=
 =?utf-8?B?TWh2ZlE3TmlKb1p6M3RCbnlBOXdpVG95QnFMZmNyRjBNTDNyc1hkZFQ3bFhp?=
 =?utf-8?B?eXpsdDllZGVRckJaMVFvQnM5QlZsazlyaVhSTUZiWHR6RHVOV3V1dnZyd3Vs?=
 =?utf-8?B?czFQUlBNL2ZPY2ZQRmkyMUE4WjZMckVENlc3M3BlTzZzOVBlMG1UWlFwQ1FT?=
 =?utf-8?B?REZUa3ViNGtTTkJVc1NjRHFXTHZ2MExpSXhrb1dHUnBFNDRiTldidnZiT0J5?=
 =?utf-8?B?RWpWTGpzdTYwaWQ2djFhSjIvQUZPTFl4QmhKREZFMC9hSmpHNmM0QlpSdHlv?=
 =?utf-8?B?VithTlRPSFNyOTY3dkwzMzY4NVVMRS9CRXRsNWJnMHhpZGpDTjA5ZS8xY0hq?=
 =?utf-8?B?bU9malhSdy9CSDE1TURDTHp3dDFCZHZVYU1zbkdicFEveGhmOSt0Wm54SW44?=
 =?utf-8?B?aHZ1Zk5NYWQ4VnJrUlZzR0EvSWdnM2JHbDFSU2NPSVhXd1NtUTFBMWJucVVj?=
 =?utf-8?B?VU1EbUF3anpkOFRkTW1BRVNRZEJzUnZJSnpFb2RHeUVqYzRtKzh4eUc5cTNR?=
 =?utf-8?B?YXZ4TEcxc0crN3c2WWpnTlAzOVNIRFUzaTcxYW56MXFacFJobldaY3NyQU04?=
 =?utf-8?B?VnVzQVg5eGVpL2VEY2EwNEZYeWdPbUt0YVBtYjByWThmVk1JdEc4VFU0Y2wv?=
 =?utf-8?B?OXp3c1h2cGI2RTAwb25IVDlyNVpBWnZOMHhHUDFYdnZybHBQbzR3WXFLVnhq?=
 =?utf-8?B?OTNpSlJlMVlZL1UrZ3RWcnFmUFpYckYzVHBoYkVaVCt0REJnYjVSY1R0Wjlv?=
 =?utf-8?B?SWhuYzk1T2tHaFo0QmtuZ09OcVR2amN4bDRxR3pCZ3pUbmVuSEI2bVlpdC8w?=
 =?utf-8?B?R0hMZjlVczdmejAxaDBla1B2WjFvaW54RHVpOWtIaVd1NzFxMUF1MlN6QTEr?=
 =?utf-8?B?TjZFemNMM21iVU5ONnNFTlVZb3c1WVpOUkYvWGx4RDZtVVVBUFl6TlVVM1p6?=
 =?utf-8?B?ejJRNjZNZnNiMDRkVE1zQnhNUEtuSUVDb0FwWDJ6YitrRWpKSE9CUG5OTGJX?=
 =?utf-8?B?YUZkSUhzcVRncXM4UVJKQWx2ZmtvdlVaZ2NHRVllbTNvWWVhNmd3NUp2aXJP?=
 =?utf-8?B?MXRTdUd3Z2d2MG41SnRVVzNZcmlYcGoveTRZaVRLWUYwbmhrc0lodVJlbGph?=
 =?utf-8?B?a2VIWjVVQW55bzlUd1k1STc1Rm8yejgvMTNiY1FYOFVsVmlBcEUzUEtOQ1dy?=
 =?utf-8?B?MWIzclcvMUMvejV4N3dVZkRaMitqUC9IdlFremczYVFnTUIrSjgwWnY2dnZr?=
 =?utf-8?B?YW1PZFF5dXpydkxNcDVvNmlsbGNvenk2dXNIbjhubzZ0aWxJem9oMFdrNjZu?=
 =?utf-8?B?QnBSK0lUeXZwekc2dTA5aDN6RmwzYTg1TkMwK0hmVDk0NmVBTjlRRXFLeHBJ?=
 =?utf-8?B?YktmQTNHczc4TXZnbkdPaVg2cm54Vk1ZTWszcmk1MkRZcUxESzg4ZEIwVmlq?=
 =?utf-8?B?cHMrUEp1bkVsOWE3RUthYU0wMkZYVW1tZzlDYWh1NG91aFVJYWZGU0NYZUR0?=
 =?utf-8?B?U1BNclpxQTRSMU0vQ3g3b1RXOEVTQStGZ0c3dlNLRlRCWjFNS3hhVTRhU3Iz?=
 =?utf-8?B?dkVQZ2xiYWtCcXRmdVpFTW1ScHpsakVqblk4cUs0cGFYMzQ3NittaDg2TURs?=
 =?utf-8?B?QjJJT0NNWnV5Z3FXcG9ZK0p1cWRkMTFzTnFxcmZyVktPd1B0elN2UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ec3325-f07e-4c1e-95fc-08de93eb385c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 14:46:00.6038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpGEXb7EbEVKpOQQeGfkJK5f5jkJKaVooeOEfVFoZWoOuR7vBHKBY8YQLD6sum2s9hWY3pJMg8kTuFJREW+1rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6390

On Mon Apr 6, 2026 at 10:58 AM BST, Miguel Ojeda wrote:
> `feature(cold_path)` is becoming stable [1] in the upcoming Rust 1.95.0
> (expected 2026-04-16).
>=20
> `cold_path()` can be used directly, but it also allows us to provide
> `likely()` and `unlikely()`, based on `cold_path()`, similar to the C
> side ones.
>=20
> For instance, given:
>=20
>     fn f1(a: i32) -> i32 {
>         if a < 0 {
>             return 123;
>         }
>=20
>         42
>     }
>=20
>     fn f2(a: i32) -> i32 {
>         if likely(a < 0) {
>             return 124;
>         }
>=20
>         42
>     }
>=20
>     fn f3(a: i32) -> i32 {
>         if unlikely(a < 0) {
>             return 125;
>         }
>=20
>         42
>     }
>=20
> LLVM emits the same code it would for similar C functions:
>=20
>     f1:
>             test   %edi,%edi
>             mov    $0x7b,%ecx
>             mov    $0x2a,%eax
>             cmovs  %ecx,%eax
>             ret
>=20
>     f2:
>             mov    $0x7c,%eax
>             test   %edi,%edi
>         /-- jns    <f2+0xa>
>         |   ret
>         \-> mov    $0x2a,%eax
>             ret
>=20
>     f3:
>             test   %edi,%edi
>         /-- js     <f3+0xa>
>         |   mov    $0x2a,%eax
>         |   ret
>         \-> mov    $0x7d,%eax
>             ret

I haven't checked the assembly, but otherwise:

Reviewed-by: Gary Guo <gary@garyguo.net>

>=20
> The feature itself, `feature(cold_path)`, was added in Rust 1.86.0 [2].
>=20
> Previously, a PR in Rust 1.84.0 [3] fixed a number of issues with the
> `likely()` and `unlikely()` intrinsics (by implementing them on top of
> the new `cold_path()` intrinsic). So we could use that, in principle,
> for Rust 1.85.0. However, it is just a single version, and it is simpler
> to avoid intrinsics. Instead, approximate it with `#[cold]` [4].
>=20
> Thus add support for `cold_path()` by applying several approaches:
>=20
>   - For Rust >=3D 1.86.0, `use` directly `core`'s `cold_path()`.
>=20
>   - For Rust 1.85, provide a `#[cold]` no-op, and vendor `core`s
>     documentation.
>=20
> And, for all versions, simply provide `likely()` and `unlikely()` based
> on `cold_path()`, by vendoring `core`'s unstable ones (the one from
> `intrinsics`, not the `hint` wrapper, to save a layer).
>=20
> In the future, if `likely()` and `unlikely()` become stable [5], we may
> want to use them directly as well.
>=20
> Now, in the C side, the `likely()` and `unlikely()` macros come
> from `compiler.h`, which means it is pretty much available everywhere
> directly. Thus just add these to the prelude (instead of e.g. re-exportin=
g
> them in the root or in a new `hint` module).
>=20
> This will also mean less churn when we can remove the `cold_path()`
> version from `std_vendor` (and potentially the other two too).
>=20
> I tested that Rust 1.93.0 generate the code above and, in a previous
> version of the patch, that Rust 1.83.0 and 1.78.0 do not, as expected.
>=20
> Link: https://github.com/rust-lang/rust/pull/151576 [1]
> Link: https://github.com/rust-lang/rust/pull/133695 [2]
> Link: https://github.com/rust-lang/rust/pull/120370 [3]
> Link: https://lore.kernel.org/rust-for-linux/DGA6GUR58QJ7.1XZZ0P4VZNW86@g=
aryguo.net/ [4]
> Link: https://github.com/rust-lang/rust/issues/151619 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> v1: https://lore.kernel.org/rust-for-linux/20260208224659.18406-3-ojeda@k=
ernel.org/
> v2:
>   - Drop the intrinsics and use `#[cold]` for Rust 1.85.0.
>=20
>   - Sorted after `feature(file_with_nul)` since now we know which was
>     the stable version when it happened (Rust 1.92.0).
>=20
>   - Rebased and reworded accordingly.
>=20
>  init/Kconfig              |   3 +
>  rust/kernel/lib.rs        |   4 ++
>  rust/kernel/prelude.rs    |   5 ++
>  rust/kernel/std_vendor.rs | 142 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 154 insertions(+)

