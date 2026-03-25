Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020097.outbound.protection.outlook.com [52.101.196.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B343DCD85
	for <llvm@lists.linux.dev>; Wed, 25 Mar 2026 14:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449035; cv=fail; b=FRYz+v7le1OSksYS2tWnJgvNq/PVs/iqvksUuLlkQ2QKBH1tQQjp1jvc1DL6oz+KB8qRI7h+EzWfflGgfJsHBCZWcYYASK7YaBaB7dxIafxdCt3Ko/rzQEyGBq5cEG+TLyucbRLuB+l33joNWxw6BQtTDtpFtNpCDNnHqUStBU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449035; c=relaxed/simple;
	bh=clYXEW5np+i2JqZg0Pi7DAuj8nZwCV6R4R8lRQgna64=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=DPAK2lpEa1Ie0PnjoT4trOqMKL8ftbuhkQ//qBzzoCsEIba3fRoUxbyvN96w7z0YwyqFTuUXd6gYmycrSW6Ja9Cv8kf8LCTGfwtRJGide1rxl+YT8sEsULFYwziqDAZVX+Dr2uTB4s6uy1HUkLUNdipROZhvV1xCJBQfVzAo/+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=y5JqSyLB; arc=fail smtp.client-ip=52.101.196.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="y5JqSyLB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxt3aP395DBXalVcnJnTTzdXe5+WgqlJ0zzVt3aFeW6Nm/eV3g91dvu/2xWlHeUQrB1vNHmLirEC/9+G1WyvXP0mwFdR++LWiyP4tIHESVS9DzfnkbZaTOc9MBVJr2JRQd7KqCos0MEz0X0cKTof7h2eaEsKOeCsQW2Vw4a7txFcyAUYdH5PIKmh4PKPKfpirL+s1I9jXacRwrnsrWu+WTqp/ApJAwpiMo+VJRqsC2A0lLhdVnmsYx88CqAxoUGKW4TnOJPPhHXlHzDaljKm7f8lg93IwTBTYHFCN1lsrgTQhmrhMikaajFp3BGXYoKalgPJPHLkdMouIrsMVcbemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fifOcQG8r1fJHraWzDdwMCdZY7ObfLnfPOHaAoIawBE=;
 b=gsGkcYdoI31zsTQlyP6zkm8nQZLUpiMvr5d3zmCCrtl8pAGXwlOGC6qFqg37/MqP/C6Gmmg9gY6YrkqkT0rX2buh/SU9Vxz23bklfux6WpEDueI7YZNVBPIkxjSmjzWc1YsW4wHTHLn/dbAla1Pu8aCgHVubI2a/qTzXEIIIdgFo5bRObweq7eKW5zizn/Ho00T6KR446M7E9vX3M7Y7/hIJXA6NifMx0TNYcooHcPBTZXUGqL5eHJfLtQNypCvYHJH7T1Hc9ktiKfj/7Snkl37zS3S7MKoTWipuSJdAxU/zDpZPuqmTpu5Tt596pQHUuLMnygzoo9bl6nFyCMX/5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fifOcQG8r1fJHraWzDdwMCdZY7ObfLnfPOHaAoIawBE=;
 b=y5JqSyLB6cokGOjHR1pScBpNdymBBESKpT1xfAuhMET5YwiWx9/bvAR0ECFitfNzSoA1MEb+4PcLHpXUDeSRl2xHqstD/koWsTSC7FcdUq6L4CWa33NnrH5DAArnyCe3eQCgYmUdKCHFNM7rDky6zBsn5bgDbRylVG3UMk4dHHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3349.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:d8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 14:30:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 14:30:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 14:30:27 +0000
Message-Id: <DHBXOLR9OYWZ.22XQBZB3NROCF@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>
Cc: "Andrey Ryabinin" <ryabinin.a.a@gmail.com>, "Alexander Potapenko"
 <glider@google.com>, "Andrey Konovalov" <andreyknvl@gmail.com>, "Dmitry
 Vyukov" <dvyukov@google.com>, "Vincenzo Frascino"
 <vincenzo.frascino@arm.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <kasan-dev@googlegroups.com>,
 <rust-for-linux@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH 1/2] rust: kasan: do not pass -Zsanitizer-recover
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
 <20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa@google.com>
 <DHBTCP3NHE62.3N96AD6O1L7CK@kernel.org> <acPLYM0HtGfW1Q6X@google.com>
 <DHBX4GM8TBIY.1BPXJPVQAQAKH@kernel.org>
In-Reply-To: <DHBX4GM8TBIY.1BPXJPVQAQAKH@kernel.org>
X-ClientProxiedBy: LO4P123CA0193.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3349:EE_
X-MS-Office365-Filtering-Correlation-Id: c921c933-0ce5-4707-3735-08de8a7b0fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CJa0Ky4IlhsjyXUPnARbWtHnr5C4C7TuYtE1f17obsWn9K7wKOoD72t5rwlZrrZ9D06nhCxrd4OqW14pKjaAp0T8V4IXyYLVxeiWhER24Xg6/dsucIm41p8f+y/pTCO66BRlxUWqsqppX2bSplgNhdQ4MQ5VesVQyN80QtGFARCuHcAtIk7zPPW5VBoQE9DTznopfJi7fwhhlKJeeJt62Txt8xlBSrHOxEkcpXmt+Hwz3H+zzyx0JvJAsZjOHDaa5KT5LtAcXBy9YS6gLWwuIvU97tgU4gNjdfiGHV6JEzcZtMWSugHYsUlm5wgWoiWhNvJQIxKJeCSzumo8fX0nYA4Hlnp6Tw1/Z43AD55NGcUOWSZCD3B45BUc1zqEi5rILeGX6jH8R/qtrK3vhgttuhLWrD/ZJe6GUX7L+LyRTT0qiseC6bMwqoeDwnLMtYL3hEwjvBdPbssTFJ19Glbjln4omdraTtKYJZainXRtHrRNRmJSZNo0aCexPsrq/y3L13P74FXaipK7qGBTans77jcMleWcmfu7SzWOMxqs4us5DZfcmI7WxKzmnkjEvTDpJdMMpfnNAp6xbZuOcRrY2xueII0hrhDXExo3FCbCqgJQbFgWx1MVATvmTniEgGc7HEvrWaB0LT+CY2Y1sDzLKQYrkztpbQ96yl67tC3dGglZlPkE6de2sEwpA9B9Nny7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzlRYTJwU0lQNjMrdnl6dGN4Yjl5djcwRG5hV1JDZFY4ZTVZdXVhZFQ4YWdZ?=
 =?utf-8?B?MGRKWXJxNHBrV2V3bHJKOW9xdGJEWXpveis2L2l6U2hpQVVCekRkL0lSMU5S?=
 =?utf-8?B?N3JyeEVmbnAxTVVCMGduSDV6M0ZSQVU1NlJKMUtKWU85WXpPMmVCd1IwQ2d6?=
 =?utf-8?B?M1ZZaUsxbitXWmVuZVRVYUxxMXpxR05CZ21ncnFRTmJHM0QvRzJzdW5OMlQy?=
 =?utf-8?B?Z1ZrZjhqTE9FczB5cHRhcm9PaEgvRlNvQ1ZONndYS0xXZTlvTkpYUGV4NEN3?=
 =?utf-8?B?Y0gvWHBkTlNLZ1BqRVU5amMvRUxIR25KbzhXdkEzNVNuV3pMMGxPM2lsQk1t?=
 =?utf-8?B?WCtXZW41c3p0OERRdTIyd3Y1WENGd0l2ZmpYVFQwcGFOSTZlZVdkUDhTYUxM?=
 =?utf-8?B?eHhUem5rWlIyc0JpSDYxeXhBQkprOTdYMEF5YXB0c29CZXJiazhwbi9ucjYy?=
 =?utf-8?B?cExiTkMyS1RTY1ROckhlNjRUb2JFU1NLNmpPckZYYnBwekRnclZZSU4zOUNS?=
 =?utf-8?B?ak1ENU1nL3hLSVYvQmJ1NHQvbHZlcHQwQ3dEUUFRYnE0cHBVYzhEdDBGeUhi?=
 =?utf-8?B?aG0ra3QrY0hjNVlSVVdqand2QlFBa25wOE5SZXBVaVZXNTVLRlc1NitUNjRt?=
 =?utf-8?B?N3EwdGUxRWM0cTYxRTJZYVhNckx1T3NDYmszSGZ1R3N6MjBCc2lsUTlEd1J5?=
 =?utf-8?B?bUtIcEN6K2djZ2swZk1icnhvUnliY0huMWRsRkpUazc5cFhEVy9BdStsSTdV?=
 =?utf-8?B?NEM3dkJ1WlVNNGphb0kzYkc5dis0N2JOeEJsWVJhRUE3Y2ErUHFXZXFpNFJ3?=
 =?utf-8?B?NVZNZXVqR2poSTJQTUJTa3lzOXhPTlphMit4UG44cE41QXV1bi9Ub3FWS0Z5?=
 =?utf-8?B?Zzh5TUpRYkRFQnhNZUNsUU9yUDl4eXE3alZGMTFFWlFIMHppZmVubTlRVEts?=
 =?utf-8?B?NlhQQjJycTFTYXg2WW1YOVdQN3pldXJGcm02VmxHSUp6a2FPeU9HLy8yMExy?=
 =?utf-8?B?ZCtQYVpnUkVSWTVDK0E5aXFsL2FzRk5xakVoQnBuSFdRU0lOOG84UEIzYVpT?=
 =?utf-8?B?d041SnphNmUwa2s2YmorcmhiSTFrcjZ5S0FiOUNQZTU1U3FYM0hJVXN0amR0?=
 =?utf-8?B?ZnpqY0FGWUtEUVFscWxCWDlaR0VtbW5WNjN1Tis1SXhxRTJoWkhZVDlBWktw?=
 =?utf-8?B?UTVNSTFKOTM5M0NyL2pVeERrOVorYzd0bnlINUZQQ0hrd0RWM2NKYXdsWFhp?=
 =?utf-8?B?VGZyR1ZQRUtSSTBjM2dYd0hUUjZXa2lUNWdOb24rNGFnUk1aaGs3TWJrT2R2?=
 =?utf-8?B?TDFrOFVicmxlUjU0M0syMUVBSVkwdzdSMXhOaGlaVHh1TjlDSHVqWjNxWnF5?=
 =?utf-8?B?V1dEQWNtRWtrb2JuWVJna3lxdk9qQmtvaGl0WVRGNHJUYzlRd29oVkdNa3RN?=
 =?utf-8?B?UkZ1bTkrSldPcUY0T2k3MzgyQnJlK1krY3NHSmtjNXZiRmVnSFNaUlRVNlJY?=
 =?utf-8?B?TXRNcllZckFhTmRWTEdwQkNlS2l3cFAzOEdxdUJUeTk5bldlSk5VbVVBWnFU?=
 =?utf-8?B?Sm5UR1JxaXJDUWw0RE0zL3FBQWk0SXJjcnlndFQ3aHN2Q1ZQOTZGRFpaZjBT?=
 =?utf-8?B?Tll4YUJxRHFBeE0reHFsUXRPRjdpMCtSUVN2NXJlQ1BFaDR3bE54UC9BN1Vz?=
 =?utf-8?B?ZmQ0ZUlHakd2ZVZLdkc1RU1rR3JJaFZHY3l6cDBZVllneW9kTk5NUVZPd2Q4?=
 =?utf-8?B?MDNOL21nUUg4U0ZFU0tzZUdrYkgvcjJjMlN0dTVoS016dXJpa0tYRFE0dVBz?=
 =?utf-8?B?Y2tqVEU3SVNUbUhJV1JsdEd1ancxc2RQbXNMZHNqYXlJOU5hbTk5S1NETjEw?=
 =?utf-8?B?TWR3eEwrdFV6Wk5sYThWcHkvcWpZcS96NXJIT2c2enovRFVkSmlnUVE0NzRX?=
 =?utf-8?B?NEcvOExNL0FWLzhzVHpabGxiRkZXaytUaWV3bi9PQmJic2hXd3NIOVZpN1Nu?=
 =?utf-8?B?czhwc2tEUGRDcnM1K2dBRndpRlhWNEwrcEp3UTBsd1NHZXNGM2RqZ3BQbkN5?=
 =?utf-8?B?SnlsUlYyWGZiZjR1RGNnSE9vN2dHYWRyNUU4T0Q0N1NMa2l4a0g1R1Z0Sm5F?=
 =?utf-8?B?NlFEbmFXRVdmR3g1Y0NxM0R4U2dyWVBEcWtJc0lCSjVqT0thS0Z6VGNzNWFr?=
 =?utf-8?B?UW51Q2lycDVGaWs3NUd3SDlRcUsxZ0FhSTNqRG5paHFMYllwWDJMOTNjTFJL?=
 =?utf-8?B?bWhtT3pDWkRGMWZRWm95L0RudXVabnhEd2Evcy9SOEszOGU0NkIyc2pWN1dn?=
 =?utf-8?B?d0Mxb21EWkdpYkdSOTdHQy9kc3BnTDJNV1ZrYkcwTFgxdFNyK0xkZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c921c933-0ce5-4707-3735-08de8a7b0fb9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:30:28.3485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4wbj8tQ4wrYoY0E2/un7k2I1Oib2G+o9PB3xk+vepILU4MMlH8+PlPArd8pXXpWwvfnbQ8pGSoSdd+UyUBfLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3349

On Wed Mar 25, 2026 at 2:04 PM GMT, Danilo Krummrich wrote:
> On Wed Mar 25, 2026 at 12:47 PM CET, Alice Ryhl wrote:
>> On Wed, Mar 25, 2026 at 12:06:50PM +0100, Danilo Krummrich wrote:
>>> On Wed Mar 25, 2026 at 10:26 AM CET, Alice Ryhl wrote:
>>> > We do not pass -fsanitize-recover to clang, so for consistency we sho=
uld
>>> > not pass -Zsanitizer-recover to rustc. Thus, remove these flags.
>>>=20
>>> Isn't this because clang forces it regardless? Is this true for rustc a=
s well?
>>
>> I forgot to mention this in commit, but I'm actually a bit confused
>> about the situation here. If clang forces it somehow, how?
>
> I previously had a very brief look at the source code and came across thi=
s [1],
> where
>
> 	static const SanitizerMask AlwaysRecoverable =3D SanitizerKind::KernelAd=
dress |
> 	                                               SanitizerKind::KernelHWAd=
dress |
> 	                                               SanitizerKind::KCFI;
>
> But again, I only had a very brief look and it might well be that I got t=
his
> wrong.
>
> [1] https://github.com/llvm/llvm-project/blob/main/clang/lib/Driver/Sanit=
izerArgs.cpp#L750
>
>> I don't think rustc does anything like that, but not sure. If it doesn't=
, but
>> clang does, then maybe rustc should too? Depends on how that happens.

It looks like there's no similar logic, and Rustc is passing recoverable
settings based on the command line options:

https://github.com/rust-lang/rust/blob/8a703520e80d87d4423c01f9d4fbc9e5f653=
3a02/compiler/rustc_codegen_llvm/src/back/write.rs#L644

Best,
Gary

