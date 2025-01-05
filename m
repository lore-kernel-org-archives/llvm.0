Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020096.outbound.protection.outlook.com [52.101.196.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814975473C
	for <llvm@lists.linux.dev>; Sun,  5 Jan 2025 20:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736107415; cv=fail; b=UWgHjJfSgKM5FBoP18TR/91162PluQuKVWjDJq9nUbjlGPyckgkZT6Xq/dVm9A0bAnfhg7UNUi4HqFhigM80m945hAUFOsn900iTR45CFa5uqCCpd52tnmO4gMyoNi1ZF/jtk0BltGAbj46BLTZMcrPJBU3iV2kNWdQa2aHy0pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736107415; c=relaxed/simple;
	bh=bGUGbYiLQcVlVdJYo9Te1q0PrHDIiAsbfQOHxEHw410=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RU265QkO1nzmbHdxHIEeThzyRaHvQSjmTV7R1mkO2YgRDSbHLXDRSvNxgTe8RyCBxRsJh8BzJIvTmXbcl4Udcj3g5SD4aGq6uAQCy1tFPUGyvMvAemDjdbXjRI+VM/I+NPzJSaevvq9vcrJEWay7UdDU0it6GT55+uPrqU4BqPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=OtUb4Cth; arc=fail smtp.client-ip=52.101.196.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="OtUb4Cth"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcA8Wsw8FwwIu3A23uVtqF/caQOhkO1xK5owqNDORvB+OYaoXeo1qMkhPZ3mbEUkeC1ihE0SHlxVnWCstpTju/pPaBvaFJqQzzEBf+W9MxAiS1b025mlmUmftvaJSh+VjT2mluauBH3VgtV5VNEqT/ykKHIHiPpc/rihC7quGgQY1AmGWyEl84a+9xZEJQ+ZcWerqbCSr06Y0drhli/exuwVvHvtgxNHmfxMtoUeODh9E3LpINeRZXJwRa4axa7mV7TE7whDGrWLMUuoXodxs9l0NdfvS9DRazwYcXn75akLBgpQbE3/Ir6JgprumU5TpzbGGPW0C0jGQlrC5YH70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzCj5Pd/zdD98sJKlOSLAwT/WunaGhQcn76iQfz5S1k=;
 b=WTN3+5N4KoRY5yK/uzFoknx59/+0NrjuDdFKwBVs2yDSjDSdtjkGKfpXJN2geerqv0hBFICdZNaozv3fjhhwtzpoO5W6z9ZIwu2YC+/WCUgHsmUIrLSU59cRD/KRaTTar91P858etqFSTTGnlZF3tpvvrLkQs8mEYhN4BsK+wNcyP3ml4Mjzpjy+P8GJrhApDOvqKSO7ThOJDbH/4oxb7CxN4y2CoQ5fNNXHDkWCDiPHi6WvO363v3cqTQs/y8hJqn/eHRBlcUT5eMqLL1kIKI7lSZc2Ts9MX9eotDLmKWyQFUZL0NIEh/iCQGpUMPfmC11udXJvIeqZG3YTpp/hWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzCj5Pd/zdD98sJKlOSLAwT/WunaGhQcn76iQfz5S1k=;
 b=OtUb4Cth0OOcfZs6PWO46UCWkaeNfJnxy3xFURiH6Qtz+gS5r1G4RE59mC5JwHvI6m6YNPvKSYjgrK3+3C3LpnhIJoX0Yn25R9BKEavhsS8zstx9ZFuFkw75flHAwfI+GJdDDwFWS1O8wu63Q/+e8+MbdGPTiGu3Nf0BMw1BfaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO8P265MB7704.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Sun, 5 Jan
 2025 20:03:27 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8314.015; Sun, 5 Jan 2025
 20:03:27 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] rust: alloc: make `ReallocFunc::call` inline
Date: Sun,  5 Jan 2025 19:40:06 +0000
Message-ID: <20250105194054.545201-4-gary@garyguo.net>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250105194054.545201-1-gary@garyguo.net>
References: <20250105194054.545201-1-gary@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::19) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO8P265MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: c12a04a7-dd49-46aa-e345-08dd2dc404e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QjgZf1NBd3u7NUMFe1CoHvC4AGN0Ubf7FXvR3eV1q15bSNHUa1tTB0T9oTWG?=
 =?us-ascii?Q?Ts2GGXWo9BTSTaeXLzluvVA0Qkj+tO1EOxWailGGhfEwPMaISB14X/IEDOV5?=
 =?us-ascii?Q?MfjHi3CCc9jvS8JELfDsMaVpSRR4JhSy1OdAUgG09Q1vFrQyk0xD7C4HPgX/?=
 =?us-ascii?Q?AhM3tR/N40AiG0aRmBaDLYX0lWPgLLOHICO8UUDu27F2i1H5cqEBpMxXEW4W?=
 =?us-ascii?Q?/tL+e+fXBLBzZKYCpHQDZu/ql2pF82RirCWvuUG4XnozR2TySH6sY15U32av?=
 =?us-ascii?Q?JPj7a9/941c0VxJH/4J9fH0hW+bxOs4g+Y+L8xx3Ap3cTZkQr4wnC6l/JAGE?=
 =?us-ascii?Q?KJlBiTLeKr6FSbfmutSTX26bGXMFd2cjhm0K7DELoaB2fGuBl/0LEHuBY9D0?=
 =?us-ascii?Q?Yh/TwEye2ywoCyiAiH9DW1wk8ZJGN8+qqRRMUgBJRtB14Sjnnylewtf1edWl?=
 =?us-ascii?Q?dPXTFga0Ck1nAlJ4UOjdjXGEI3//LbegOC65OTr9nMFmnL+TutAna6IFSBNq?=
 =?us-ascii?Q?a7SwlL32XY16NVvTjfW1rhy/jUR8YyCRd/cA2q1J7C9hhTqth2RTXVV0D47w?=
 =?us-ascii?Q?DgIGrVc/18TLktvXPeb9OSOntNtaFTAuZ79dClVk+GmtmsDR5uLl1rYJl+zP?=
 =?us-ascii?Q?zKC97od93j0pCGfO+sgc3GQwWvsOXaKPNvATvEEBVjVWwnzYc9vHSvmogVUh?=
 =?us-ascii?Q?IretTnsdSoFi1RrXUJxivzXQa+Y0dO3efZQ5LmfR5UCmfUORMijYoX1z4cPy?=
 =?us-ascii?Q?Zm2lJH+UuRJNY02auLchYLc6pvwSc0QXBclKi0mQQLx8085Oz3YaQCMjpIQR?=
 =?us-ascii?Q?HOmxZlKj1Wvz+F4N55j2kdLIORdJB1LH1AcQXMyL3AOL7Ewah62APi5wFHLz?=
 =?us-ascii?Q?LnxLmDl+ffcImOM2KyOVCkfK4mM0mBbDBwSXxwj+Q8bzlChGm42OE8pm/URp?=
 =?us-ascii?Q?Inf7Ffn8wFsKCKMgcxvd4Y+d7TnTHykLC2NJtUrtZu6Rzlt8qzM9rrJyfbOe?=
 =?us-ascii?Q?pVbd+Rx/gMbJ6uPGz9b2/UeaPgo8ADBWR8y2XOcjpKlv8AeUZZJEXR5VqGlE?=
 =?us-ascii?Q?XBu+MHjkoFNPQq5EpHKCeCPFKMr9qUJwUgWKM+rRTMRT+iOyT1rXJTtyIh2I?=
 =?us-ascii?Q?R/ipBXomW3HJbPvNkDusxxqSu7bH3nGr6m8nsI8HsYP6oyOdmoJvQQPsW65k?=
 =?us-ascii?Q?DEGjI2G5uH3QQV75+KNio2dZhhxyFqLZnTyidOggeqT/eDdR+F++nB2udzVC?=
 =?us-ascii?Q?8nvth3iMsibM7cfuXm3Tg0ey6kXafh1mJ8wyv1jqzZERavGVXP2GRS6rx3c6?=
 =?us-ascii?Q?XG1IrF658H4O29z0sBFutEE+wmRvq8xUVKZDBeaveyvufXODLqPk2PIQJHVv?=
 =?us-ascii?Q?FqvMNByOdAIOieEr4axCyHZift1tnwAmVe0ZCH/RbAHKo/2IrXfKuUV3C6HL?=
 =?us-ascii?Q?Zgz4p6beHnk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ycwa6wGZC24km8K/WkzrTzKQCrqCTyzjHuOcjqjZM6n+W2jV44z6AblkEZAd?=
 =?us-ascii?Q?NLBAbOggmMKbXfLphsLkkNwcJw9gOwKnoK+genNbeY9dTxEXe/OyMDq+vmJF?=
 =?us-ascii?Q?qPilz6T+b2Y9nmM4spHSgWkvNOK0Ar1cw5h1SxC76vkvCdy4y7x4UuNzSis+?=
 =?us-ascii?Q?+KJ1ba/qQpD0gnF23DmtTZHE/+gRGHULgJh3dRXvHHsGcJxswUq2cypJjdNN?=
 =?us-ascii?Q?pFDLN1zt4IXDgF4fcIBPkaqOICB3U5VmLlUdg60QgtITB5e5je9Mljz1XnlK?=
 =?us-ascii?Q?UbBCmqyQ4Gq8Uja3YP5Kak3Nt0gNGKCwsAadBtCbwATAefDDTYOZedW+7KZL?=
 =?us-ascii?Q?4hJItT7zOJUMPQZ/+ZiWsFeGWIGmg7NqrZgkR32R3ZgXY2dXemHpEjsyeJRS?=
 =?us-ascii?Q?aGYCCH+qKFYJZL8DvfrkRhRqWoe41JAGIfZMYX1Cjmjv+Yc4C6+TQ+5NEEV8?=
 =?us-ascii?Q?MaFyWr+IpLsFG7Ycggb8LncImJRq2CgW4ajsecKMzW6LNezeNtmdVWpaD+JA?=
 =?us-ascii?Q?4nrhmm5ZPylg+FhCLRsd+/RE4Kklkoccu4oOskY7hPLx3OGY0H9knSpukoat?=
 =?us-ascii?Q?EPx5U1R++yHDNeJlrP1oCRptJA3ivOgHKi4M4qoAd8JLjGe5pn9AMAWwM6+d?=
 =?us-ascii?Q?swKeNgzZAcc96W1iD6fQQ+MCszJ5b8ssbGQwwxNH5EEwgeF7Clx6biC7ZfdW?=
 =?us-ascii?Q?K5NpNpib332BUsjmBfeh3mGv1Rj5Dr+1CpdQZsSPF3QVF0cNENd8/RLCFkiv?=
 =?us-ascii?Q?oCYXMnbqlNgWNfMB+z/skv7sWIoLvUXhbhmr0doj2JvHWc/FoDb2KmIBALEb?=
 =?us-ascii?Q?IrBlVqW5Ifyalz2eaberLjzIwblDds4kdWoDmCJvxEVfslTW5fyEwVXGtoRl?=
 =?us-ascii?Q?sEiXEB21I3mrktB8ZstiiQMEJpZIKWsFsR//MSxrb/goOW/NbnLDfursiC2I?=
 =?us-ascii?Q?b/TpuSNiRvTvl5HIqDJmu8cwLo732qV8pSehoklgb5JhTkXcvf+7ejj7TmZD?=
 =?us-ascii?Q?Fh9/DIOHQTwFeSBPWQseMuftft7E3qewl42Z11SXEPZ0dH/H7WCpi5+YFnzh?=
 =?us-ascii?Q?4/7bbZU+NuL3q0EvjM3f/pfb+Pd2Xsu/Y9G4zvPPRTqhor/diYDLREsRZEpH?=
 =?us-ascii?Q?PKnhMNBEocc7AU538n+diDOeCgJWZOhIK6CWNGItEAeInfcJdjrAbVMmt4ev?=
 =?us-ascii?Q?N7dxjCzxTJvUh39WBAKdAw7Q3dxakB56sGhthcg5RA2IQnC23vD/JTIKQwfV?=
 =?us-ascii?Q?BjPqu/HpoeTBMLQDKrG8ijsofsbcEb1791BRMU73DpbZl0fIyL2h0Kc7HuAD?=
 =?us-ascii?Q?cjc/3eRHqolV+GR8UwJuX9BQvX6DZEIBksETUaTqRXe/YLZyLs3+48XyCBB5?=
 =?us-ascii?Q?+IKH0rAWMSHULZEiyX7a9O4rJduhghMgheHaz34aKcZbH68g7+tNjtOtjpQO?=
 =?us-ascii?Q?FuwvaPhkiON7Sh+6YyIIpK0SbSS8yeGj5DQ+3ak435c5TdyHRJnj/vguo9eV?=
 =?us-ascii?Q?7qxBp1qPT7AXVCfhBNhco6T8bXUHAB6klbktSHqJKR3Bi0dSNu19X+7LpdDG?=
 =?us-ascii?Q?HLERH1ivE9BAyC4pml6IQUm7ofKUgeP/d01YItn5cI8dv0iq1F29WCwt1qPB?=
 =?us-ascii?Q?Fw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c12a04a7-dd49-46aa-e345-08dd2dc404e0
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2025 20:03:27.6653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoMOEZuYoT2HdxSRr/7HRwrg6MdBJNK8RN/U35deHPzs5TqKsWInN7N0TgILLBZZ5O7DHLv2xYjJmg1uVwSGLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7704

This function can be called with different function pointers when
different allocator (e.g. Kmalloc, Vmalloc, KVmalloc), however since
this function is not polymorphic, only one instance is generated,
and function pointers are used. Given that this function is called
for any Rust-side allocation/deallocation, performance matters a lot,
so making this function inlineable.

This is discovered when doing helper inlining work, since it's discovered
that even with helpers inlined, rust_helper_ symbols are still present
in final vmlinux binary, and it turns out this function is inhibiting
the inlining, and introducing indirect function calls.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/alloc/allocator.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 439985e29fbc..aa2dfa9dca4c 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -80,6 +80,7 @@ impl ReallocFunc {
     /// This method has the same guarantees as `Allocator::realloc`. Additionally
     /// - it accepts any pointer to a valid memory allocation allocated by this function.
     /// - memory allocated by this function remains valid until it is passed to this function.
+    #[inline]
     unsafe fn call(
         &self,
         ptr: Option<NonNull<u8>>,
-- 
2.47.0

