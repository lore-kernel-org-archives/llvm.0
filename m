Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020087.outbound.protection.outlook.com [52.101.195.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25AA472067
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450101; cv=fail; b=hHGo9sTqyvftI2sFsoqitgHstOUVDnudgiX6CktCF0iaaET3UzArHueMyR494xdIttlJcPKnRzsMXi7i0o0IcX7KU8RmIP7/EslLZZBXXnx/ZWirJUlsB6UTt9O9j8v7zQeKXOJjCRCzrcH0elX5TJ9YANGOJKLKPOSqrufMLrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450101; c=relaxed/simple;
	bh=tUJ1CAvzqSnr7EJsvsq9KzFUpM4Ps+wu/ItDk33YRjQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=l+LlBcHv9CCFy9IZcQ2Nvuy/0ZGwUU54OwT16n94e0d0BtJhFsD87nO8rbONpekek/B23r3EMGTxyNsSlWPdnJp21jpWwjkDkHy0pOeywQXPevNVNJ1WcND93sxTX7cO1n0KP7R7KNAEtrI4BiiZNDCDhA43CQjechW5lr9P2PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=vqVNxh6N; arc=fail smtp.client-ip=52.101.195.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="vqVNxh6N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gu2Rr8FWyNVEIEJVl2hSSEm3BnBBe7dHfRKi8Q3uRajdjrcZ2v66hgbXKx53F+RmYty3wiFvaMJeAYMxXSvsPBYHr+Cm8CZ6vfBrco8BBWXvlSeOrwjYRZi9+sJKqj2Jb/spjWFWPxUbDJ2cmqQ0fOHxsP6I6JbQiL3k6r0M/zGt3Jywioj0T3ZGd18aa3sAIL9ipfFUEKsSUrD57y2pe70ayDQ5DQSpDDNePkRFsuu0LEJ5SD5EZFRigrnN7QjwqIXIOeRn/PTVRNDOZKy2+/E3MKn2Vw1Xgs9ArHA+0gFe4FOxvEZeMuxPTHeep6yby22QwWW+ARDPEdjFMeP+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouOAMQyWVowsJM1zyurKGDRQXpGvt5Pel5QcyYczK60=;
 b=PHCI+ll5MBIoInN+uckV+62H6RMNnbkh7l1fEcT3bqwp4tPquNyvfLXJVT12Azf+dhmGFJklpOU3d9um4Jbmo0qgA8GhBQ62yQCjT5cRw2OuGvOTrUTNnKtfPzawNRKYbTxxCGzug0SD6gtX2nr504JcZ3bmsTBFDjzjn6FUNNMPUCNbYreXMa3QrtpMi+XAOgqyI1eXrg06gZ/wx96pTKHD/DbosNBxQk6dVeWUQrf+v/D5DJms1n5DMSqkm9tOmUvmfsl3QMDK8L4kH2GwTdDqEwUdE7QJd+wpNR1XpFesmEjd26IPfQrx28XqDxfgRetQzN7bvIzGozaXPCDUhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouOAMQyWVowsJM1zyurKGDRQXpGvt5Pel5QcyYczK60=;
 b=vqVNxh6N/MzvuxrfFoAZvidRzS/TwtpCZr4LXY2IaqJAeqZH43cNSgbRQixzkwHdOzoPD2rnMg3gWYlvgT/0uOphpNWjA74rByuQUVjHCrmIeDKuqKFgv+M8NBd2OQaat9Li+Rg/h4athMSOX5THtad7braW9QAxbTLuc8EEmPw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB1946.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:10b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 09:01:35 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:01:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Oct 2026 11:01:32 +0200
Message-Id: <DLZC239PAA53.3S5GIQRJNU1V2@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Arnd Bergmann" <arnd@arndb.de>, "Linus Walleij"
 <linusw@kernel.org>, "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 "Bradley Morgan" <brads@mainlining.org>, "Paul E . McKenney"
 <paulmck@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 <linux-arm-kernel@lists.infradead.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] ARM: cmpxchg: always inline __arch_xchg() and
 __cmpxchg()
From: "Gary Guo" <gary@garyguo.net>
To: "Karl Mehltretter" <kmehltretter@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261008053746.49631-1-kmehltretter@gmail.com>
 <20261008053746.49631-2-kmehltretter@gmail.com>
In-Reply-To: <20261008053746.49631-2-kmehltretter@gmail.com>
X-ClientProxiedBy: VE1PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::23) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB1946:EE_
X-MS-Office365-Filtering-Correlation-Id: f9308408-0403-44d8-822d-08df251ac180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|56012099006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	mbJc6wZrlT4rRciVXa/i7rS3+QTAsl9E4m+FuEbsfGdvPZpguy+oQjoHp5HkGNrVeJ5IrKU6lnP+QP8az7M84m7dTvzJ4Zpqm57i8RvgfqwUKlIOwFx+2iTbYBKY4ynEJ072E0D31ezTPwXWjeXH8m6Zz331ODOqqcNT9vZJzwuNmpNEXVHyNQZ1zuRRWDWMoYrb69bztoun4b1IQ5FBcK/4DSVowtF71v5IF74UVp350EtRxstC6cHarYjJmFfdN/U3DKFIpIdHvuBBbjlPDz7gL+akv2nv9f+Zs+vqhfQSdwP0eGeCVMsG2OluKkq7kY76kHEsYPIQP2GyeHOlQ7jHHYg7UFojvyZ8eNYnNHj+128yeMDid4k5U1Nl8luzLHRrj8nUvIty5IkUD0qLonrCFGZ+CgrUOgWVT1FAcogSuWI2pguQdyiSp/1yQA+KUzvWENNRoi9kdky2i2x0CnFVPyjNXzxC2mCRbs/LCJ0NKZ2aiv7c1uzjCS6FkzqnYbXOC3fvmXLb4OIG7q21lCVXyc6gsp1N7/RnXn3I0Pspb7AiAjEV1iHO4Vj78/AjLN3mQKSNibdA0hm2ZbiBQ3Z5Hih0b51tOonpg028hCwLSGBcJXVvSUbe66pGrQzy2Kl9WFgL3ipPZ8aX+E7Nf86/pCeUbWxoKFamxsqpWzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG03eCs1bU10OEJEbnJwb0lVYmRuSEluck9aZXgwL1lYZEhVRmZKQjRpaVhU?=
 =?utf-8?B?aS9JaVpLN1d0cFVhOVBIb1RuM29mZTBSTS81UURZSzhwRTJxQVZXTFZRNjcv?=
 =?utf-8?B?Y2hmZFJpTFh4a1VRdVZkNnRvQkVUZ3VSOTVlMURKMVkzQ3ZGTEtlbWcrc0wv?=
 =?utf-8?B?bzZSYVdBYXZFWEhDSFl5anp3VHJIMW00dnpLYjNRMUFYM1NKUkNxUHRodUx3?=
 =?utf-8?B?L29nU3lTbk9oTlJjam9vUitmakpuaW8rK3JnNFZoZm1ONFphcHdGVXY4aTNr?=
 =?utf-8?B?a1ZjeVFFcitDREpJYmxTVVY1aW5iR2p6dy9pTTBBUnVSMUQ3UytXSXMydzVF?=
 =?utf-8?B?c2Ivd3AvVFFNQ096ZnNzZ3M2RW5YcGV1K0hhTWkwZVkyNG4rSE83SWVaa1R3?=
 =?utf-8?B?QjlpSFpKUi9RSmNFVXJSQjU5RHZJcyt1d3l5czhqWjlHZFVPdVBOQlNDbWNF?=
 =?utf-8?B?WlVQa2Z5WjhHUFBjYWx0b2psdFJURFhYRlM5RTJLVm96ZXBxdXV4Und0QlJO?=
 =?utf-8?B?VjNjNytQcllOK2NaU1FjTlh3b3dDM3hQUHVzb1lHQXZzZ2RvN0VmeUxacmpt?=
 =?utf-8?B?bDhKV1VUcDExRUo0Nlc1MjdmY2xBN2kvcXpEV2FsOW1UbmtCeVhwNWpoWGZH?=
 =?utf-8?B?SktzVytQT1RNTmZYbWU3WWphQm9OOTdsSEthWjhXMzZGdkZkWEhPYzdGNDlG?=
 =?utf-8?B?cTFtOWRFdDNNMDZwTURRSFpxRStjalg0eGNUWUJEcWtCZmN0N0V6dUZBOXpz?=
 =?utf-8?B?RUhsWU11THZRcFNhSXA5R0NWejlGc2pVeTNnR3d6VlNWQVlMdk5IeWpsRGx1?=
 =?utf-8?B?QnVBVjgxbFdCSWdaK2RTdlM5cWxMTnZWVXdNaGYxRDNmNXRkRklUTU1yNHYy?=
 =?utf-8?B?VVZKNEJCQTA3Ylp3Sk5iYjZKNGlPcEo0R0hSc2pWeXFMR0RCQUJDUE9YMmsw?=
 =?utf-8?B?OG9NMFVsMHVJNDlyOEpqaUxtczNidjZuTkIwRWkrcmprQmhYbEgrUnVNekEw?=
 =?utf-8?B?bFlKdXZ0aUdycS9EMzMvMjRSdmlWSk51dE1NQXNVY3kyZkkyTXV6OGwvVE1h?=
 =?utf-8?B?S25TRlJpTjJoek5zMkR0TVFxQ29WYzczUktJVStDTEMxVEtjNTZvUDcvdDJi?=
 =?utf-8?B?Q3BzZWREdkJoUmtCRzc5U1daR3pMQ3hxNXRGTTVoSXp6Y2h3engyNkNTSUlR?=
 =?utf-8?B?ZUxrcWErSGNCZ09ySEFHVkliRWJwcHF5UXRyNyszc1lRb2ppenJuaFlueUJ3?=
 =?utf-8?B?UHhBWDFwZEp3cFQrZG5KZWtlOGpReDZZNnVPanV5WkxNY0VSaVBhdnZ0dzFF?=
 =?utf-8?B?QlhaMDR0M1Bxa0FKWm5mRW4zOG1zOHRFbjdFZEY4WWdnNVA3aFIzZlVQNTFQ?=
 =?utf-8?B?di9UdnI5SUJNb1JMZVhYRTh4cEcvaFZCZHlINkJKMlM3eHYxS1FBaXQ4RWtN?=
 =?utf-8?B?QXc3K1NMZkFsSEd3dHAxZFdtSHNjYnRBYnJyek5RRFl1VkNtNjZNcmNOTm9v?=
 =?utf-8?B?aUdBaDMyNlBiMWQ3SVNQdG9hcks1TlVCMzhGNS9vVlhJWmVkcUhUcmJ3Ymxt?=
 =?utf-8?B?TUt2UXN0OHYwOHlWbXRwcVh6Ly9tU05mK3pxMjNFWUdhc0tHTnozczhTRnVE?=
 =?utf-8?B?cENQN2dIQlJ6dTJJR1hUcFZFYjYxUEFBNHRsUmVhbU5ZbVdrU2hoVUQ5cFVz?=
 =?utf-8?B?Z01MUUxRUmx5T3ZENlR6TkNnNzdnZWJqV0x1NEFOUC9WeCtSSmMwazM0UTZa?=
 =?utf-8?B?T0hxczNMRW1NYkVRNDlNNnp1c3cvbzUweTk5Z0ZtSTlIS3l1YmdHcjVFV3lo?=
 =?utf-8?B?aXUxdDJjM2tjTlc5SUE2N3VMTitXNmZzL2ZYWXVqNVFLZHNRYW1abmQ2ZEtX?=
 =?utf-8?B?aUFNRk51WGZ3cVE2WHZjNFhwWUY3UGlJbWswR2lLNGJEVnFIcHU1b0xyNmhz?=
 =?utf-8?B?SmtxK2dwZGZEVDgwVjF1bVlhbjFhVlRmWFY5OXBvV3daSkZ0eVhHaDNRWVlV?=
 =?utf-8?B?aXhPNy9kdVJsWlNBbXlEaXNPTUhGMTFsMDFtVXQ2MndSQlg4dXp3bkNPMG5G?=
 =?utf-8?B?NGhKcUVCSXZxOUJsZGt4clowV2JER004VmJ2MGpXcUxrMEUraEorWE9wZU5H?=
 =?utf-8?B?WmM0WjY2WVhCOVM3NGZNWDdjcFlKU092UmJpcFYvUlRsTnJkMldaLzNySktm?=
 =?utf-8?B?MksyK0E3bnRBOVhIWTRKY0JtT2lDU09KdC9NKzhId1YrWVJPbjRIdDZuZUhn?=
 =?utf-8?B?YVhnVWZ4L2hkVEI0aVpHSWJ2RUJKRGpncFptODN3aHpwZGw3dGlJSFBZUThs?=
 =?utf-8?Q?g5CO58ASKMUL68whJx?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f9308408-0403-44d8-822d-08df251ac180
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:01:35.6942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mq1Q/ESfZZktgYqc7J/tKLiZehI78vsynsC15xAAK4fdrBzr1md5BeX4lXLlDnqGCNosE1G4+ib8oAkIPas68Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1946

On Thu Oct 8, 2026 at 7:37 AM CEST, Karl Mehltretter wrote:
> __arch_xchg(), __cmpxchg() and __cmpxchg_local() end in a default case
> that calls an undefined function. That turns an unsupported size into a
> link error. It relies on the functions being inlined, so that the
> compiler can drop the default case for a constant size.
>
> They are only marked inline. gcc 8.1.0 with CC_OPTIMIZE_FOR_SIZE does
> not inline them in rust/helpers/helpers.c, which calls xchg() and
> cmpxchg() from many small helpers. The out-of-line copies keep the
> default case and the link fails.
>
>   helpers.c:(.text+0x424): undefined reference to `__bad_xchg'
>   helpers.c:(.text+0x4ac): undefined reference to `__bad_cmpxchg'
>
> Seen with bcm2835_defconfig and CONFIG_RUST=3Dy on v7.3-rc1. The same
> config links with CONFIG_RUST=3Dn. It also links with gcc 15.2.0 and
> with clang.
>
> v6.19 links. Commit ab717dd98bee ("rust: helpers: Add i8/i16 atomic
> xchg_acquire helpers") in v7.0 triggers __bad_xchg. Commit
> ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
> in v7.1 also triggers __bad_cmpxchg.

I think the issue is that when you get multiple function calls in a functio=
n,
GCC starts to think that not inlining can result in code deduplication wher=
e
that is not actually true.

But I am surprised that it hasn't been seen in the past, perhaps there're o=
nly
calls with single size from any translation unit previously?

The fix LGTM, but Sashiko's report is worth looking into.

Best,
Gary

>
> Mark the functions __always_inline.
>
> Fixes: ab717dd98bee ("rust: helpers: Add i8/i16 atomic xchg_acquire helpe=
rs")
> Fixes: ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> supp=
ort")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  arch/arm/include/asm/cmpxchg.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxch=
g.h
> index 9beb64d30586..0ce5225af442 100644
> --- a/arch/arm/include/asm/cmpxchg.h
> +++ b/arch/arm/include/asm/cmpxchg.h
> @@ -26,7 +26,7 @@
>  #define swp_is_buggy
>  #endif
> =20
> -static inline unsigned long
> +static __always_inline unsigned long
>  __arch_xchg(unsigned long x, volatile void *ptr, int size)
>  {
>  	extern void __bad_xchg(volatile void *, int);
> @@ -155,8 +155,8 @@ extern void __bad_cmpxchg(volatile void *ptr, int siz=
e);
>   * cmpxchg only support 32-bits operands on ARMv6.
>   */
> =20
> -static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long =
old,
> -				      unsigned long new, int size)
> +static __always_inline unsigned long
> +__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int =
size)
>  {
>  	unsigned long oldval, res;
> =20
> @@ -220,9 +220,9 @@ static inline unsigned long __cmpxchg(volatile void *=
ptr, unsigned long old,
>  				      sizeof(*(ptr)));			\
>  })
> =20
> -static inline unsigned long __cmpxchg_local(volatile void *ptr,
> -					    unsigned long old,
> -					    unsigned long new, int size)
> +static __always_inline unsigned long
> +__cmpxchg_local(volatile void *ptr, unsigned long old, unsigned long new=
,
> +		int size)
>  {
>  	unsigned long ret;
> =20


