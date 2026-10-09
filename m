Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021100.outbound.protection.outlook.com [52.101.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F7A3C0607
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 09:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539442; cv=fail; b=qEcknqXbdB+UkB04DOaFZjCZ2DCZmgJzSSqfn8AXWqqjyiINQQGqhs/fYZyCon6lh6BNunZ/76GHYkBEbnh+XfQNVRkoweG9wcqXZt4CNpmCce4B2YomZM3FQ8fxHKNg19k55vkY86yZfNPT3IcJ1HAwAoFaze3dYobpTngAolE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539442; c=relaxed/simple;
	bh=nTZEDOzhZ55HuPQeg3dyNDPgS1GmJOtXFEUcftsIn1g=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=HnRSZRR0GmcFMRnNsOzAXwuxdp6gMY7rxcU4KzLBdfIG5WYNR32r0+UtLmB2Kzo9cocwPe9bN/RfigpUIsUldqmPcLW7n7uuOa9qnGHNRmOVlYja1qADnjgCOFRtihc3Wn7xVF4YqUltFr4sDLSxXrbnciZZjEsX0eyUkCjJdvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Hg/CbHhO; arc=fail smtp.client-ip=52.101.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Hg/CbHhO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouKtVNah6Ierv+mzATw0yf5Ovo46JeBGTBeZrtcBWuuSFGm8BJBhoiDA1k62KxcEMrvS3xZulzSEsOoNlByE29On5Jf72ZUQRSW5l6ovRuWi7MYN3NsGiwX5XHMxItn3WUEabHIZyRV/uC4tEBuhf2sYw8Hf2weE6AMNQ+7DBYBn4Kkg9IZh0DfLvaeqIbPTpXtUOr2BUnqXOZOfNUqeDtLO5AVYtCxBWQb960gkTzbPfCG1OJkHKGQBQsjGgZLSJr4uvgpGGucxtkFgOSi8IBKZd9Zo+2zGEwiSOJd0wAS504A12mVBc5J39ujBZgD7GvFCZzIUj6Pa01COui+78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dk00sA80zl+Hon9W94aNroHratLRiqzvmUuJQZmfDaQ=;
 b=qJeF94wK5yZIbwvnL5X1dMyjfa0Bz+qegJzbRkSzBsrB5MLhgzRs6x4TV0YmLFU2IiW4fY1It1BnF/jeSowmEZ9IX468YjHIJF9BGH4JVjUWolanFfGprs1Hl9dDXFRi1a/R6thu3/1I6mOcoBvZ1bq30J4XJfovDBBBFrDrLXxU2qbqREidB/seRVYq5FZtiYj6saYMunLI2QDrC+LZqZIKoDUaK3iryBNV3fwobiSZFa3KzuLuVk+tsOIKJPjm1+Npr4ceovfiq2DDYQfCxf66fwludxGv31/dM4WmccMuJ12m9kTouV0Uhf9s6ODFLD9fOgsbo3DxW/kkbiYGYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk00sA80zl+Hon9W94aNroHratLRiqzvmUuJQZmfDaQ=;
 b=Hg/CbHhOHu0xS5dz4BshKV4Lg+l6R3GGRzJ8mbP0phiceCChgdHFdJLZAduYcEHcupHiTuNQ1BGYi5XgM4eeXI5vCHxfJ3kxEPk2tQcYAWC6eDK5dECNXRrcSRTVhIJV+bSj5QPa+3McKgd8GwAl4I5Iy5cdz9OW/EjLESJ7ZAg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB551473.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:283::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 09:50:36 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 09:50:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 10:50:35 +0100
Message-Id: <DM07Q6JIZEB5.2D30XB0MBD232@garyguo.net>
To: "Karl Mehltretter" <kmehltretter@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "Miguel Ojeda" <ojeda@kernel.org>
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
X-Mailer: aerc 0.22.0
References: <20261008053746.49631-1-kmehltretter@gmail.com>
 <20261008053746.49631-2-kmehltretter@gmail.com>
In-Reply-To: <20261008053746.49631-2-kmehltretter@gmail.com>
X-ClientProxiedBy: LO4P123CA0044.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::13) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB551473:EE_
X-MS-Office365-Filtering-Correlation-Id: b45fac5e-c20e-40d8-9e7f-08df25eac474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10070799003|7416014|6133799003|10067099003|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+bS1+GOa9Z+kKBKUEETmSaexmifJR8VLjeNkgxr3byFNHZ6CDiGvm3BP++4wlmPmb2RMXoplDPN/y22YppnCw8iBcr6F180M6n6PkhamQg6J9tS11T8cUjE1catGqFG3Cb3yLn5uSu0M/v6Ot8P+Un4drtsf06a+jU5nY8CtlL48d79/fl/UFqSaESIX52o64fRO7SoIJLmPmLPyrbYwBNKDQjSPkhtoE+uKIky76pU2XEOuUiu7D5Rjjj+M2IhMv5tGfqQRWu/cFG6uITp19bbCmp4GjNRSZjROpKh4HJo+KIlkOXd2+JXAdJx4jRI5l1TOPSzLQDpRLKvNX10zxa2xcYjnl/iCyXSDmFtfGmkmPakLFbSWLf1gZGZcOXYYOlYVEVYSZc1htdMPKOuhgT/I4fdFST1Ps8+BUoDBlNxgBeBPR0HWVSTeHPodRvHRevuYWYVaT0Z0PFQiNAmOQJ/ucGxy5ZWIhVoPdXw1yRXw2KMIhQC9A2vZpR+sLk4evlXKvwugjpGsVgOXCrYAvrH3WZMDjdDzwuWagANpLT7kGcTYlW8G/7dbOjcLejo1PZt2bbx5BkVkSCzvN9XOwxQ1xaDeF8YUr4+PRN3uHRQv8LEPizfw+lBNBRxXHHK4fwUAxn53RUGXe7Lvr0JuQX17z+CG1cOfK4JucMXq3g4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10070799003)(7416014)(6133799003)(10067099003)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVJNc05BOUd2OS82VGhDZTVjL0wxd1ZaaVJpSnFyK0xLdXcrcGp3Z0p6ZVZK?=
 =?utf-8?B?TElDSFJCV0NiQVVTV2t4MzNLMG1qS3lkWVppT1NyWFdPbE5uZVVwRjZ3dXBx?=
 =?utf-8?B?dEIyRDBaSHFZS2swbVY3OHJkSUg5WlFiYWRSTFNZd0xIdDFqcnovbmdLS01Z?=
 =?utf-8?B?djZvOWxJaWFaYnFBQ05NYUFnTzJZMXRkcVg4Vmc1REM4QUt1Z3hBMWtsWUhu?=
 =?utf-8?B?NnpmVnhoVUdaUk5YZllPeEVXUGdoN1hlRG9jZmZjWGtUcldTLzdEOUYxc2Y1?=
 =?utf-8?B?ZE93WEY0NFVoWCs1eHJKYlU3UEhvR2JFQ0VpSUU0YnlUbDFsYjdKT011dzF1?=
 =?utf-8?B?Z3loZXFNZWZranphOVdqZEZkOEc0SXV4MnVQcERocGVhbmovTzN0RTdjZDU0?=
 =?utf-8?B?OVlMdDhSNTYwRkF6NlNleSthOVJEd1hXSm1BSFBQOXdTbEdjWlFYVTl0RGNL?=
 =?utf-8?B?ZUFIQUFzTXJFMWtTT3Y0QjY5VHRTMUR0bHZkOC90em9BRk0wRFZwaHVMdmFK?=
 =?utf-8?B?d2VjSTBSMWNJWEVBZUM5U3k5cEx6cTNsK0ZmT0FzekpIRURxUTZnbEtndUNS?=
 =?utf-8?B?dXhQK0Z0a2J1Z3lDQnY5YlVKQUloWmVha0tKTi9vWUtZVUdjdGZjQklUZEwx?=
 =?utf-8?B?U1VoV2Q2NW9lVkJ3bi9ZNml4a2todllNK1A5VDVpK0EzNFhySEZHbDBpWVFF?=
 =?utf-8?B?a05LVUFKdXg2VkFka2xob1RrazhsQnpqU3J5NmtCNWNYQXI2OStNL1A2ek1a?=
 =?utf-8?B?cE03M3pHQmNjR21Nb1IvWERtZWtKTFlDQmYxWjhUTzg1dDdwaUYzQU5aRU1G?=
 =?utf-8?B?aDE0a3NCK0VNZlBBYVgvQVBoQXVtYStSTWpuRnhJNVBqV0haRDQxSmQ3Nk1K?=
 =?utf-8?B?WHFuWGxtTTgxUk1ZUTlYaUIyMWRNcVNYSnc1bHN5bmM0UVJZbDdqckRuYWxB?=
 =?utf-8?B?ZkM4MzhmRnpDZitmZ0kvMmM4cW0valVtQkRZY0FSQjg4eG1sM244VzBwOWk2?=
 =?utf-8?B?aHA4b2lNaWl4RUNZRmp4YmRLQmdMUjVTODRFSUtvamF1dEc3d2tXL1JKc1Aw?=
 =?utf-8?B?ODNESCtpVUFLcE5Tai9uL0NBUVBLZ2FzL1RDckJVK0JwQ3NBL3NiU213Ni8r?=
 =?utf-8?B?V1pML0VxQkwzZGRpRTBIZkJJZm5MSzRDSExxb3lPdURaMUxaekZBZE1VV1Ux?=
 =?utf-8?B?bmE1UUhOZHg2b1ZYcXRvWFJRaVRGamMxMFhiWEJRd0tpbWkyQkVsaWxFZGZu?=
 =?utf-8?B?NEJpWmlqeHFaSnhZS284NmFoa1pEMElrTlJqcmZWUHI2TVc2eHUrNzRMb2I0?=
 =?utf-8?B?N1dpYWdScEU3VFRkaDR4cEpUU1JMN1Z3clUvdzV6QittR0k5WEJ1VW9yMU5P?=
 =?utf-8?B?dEUzNkJZVUtqTjIyNGpHbG84anpNNTB2Y1lnVTFNbHduSWlhUjZhQ0dDMzZo?=
 =?utf-8?B?TVk0RmtYOENYSkI3bHhhcFN6ZW8vaG1iZDhxcmxPS0Qrby9XbC9hVHRqMlJ4?=
 =?utf-8?B?TThXYmlQUHh0d2pVRTVQTjZRTmFlRDJrTGI4dDc1R051UGc3dmxBbHV5SVBL?=
 =?utf-8?B?S3hSMFVtTlJma3ljUi9OdDZrYmpGamZVenBqMHdiODVQc0wya1JmYjJPLzNp?=
 =?utf-8?B?ZGVGQmpJakFWZFRRdCtsNkhLYVZqeGJHZHE2WmtkcGhjZlc0YlNXMVNhYWhm?=
 =?utf-8?B?YnQ1ODNvWXg3cmFYMkdNQjVobHovbmk3eEdRQXRMWlNIdzZiZFRINDFia0Fi?=
 =?utf-8?B?bjkwdzFZQW1ZMWk1UU5FOCtXUm44Q0dXazR0d2htRlNTbDFTb2ZLQnhvQ2N5?=
 =?utf-8?B?SE55YlFYVEpaYUxQa0hXcFZZY3hCMFlaejAvYnVIcWdWeUV3UWVPWkxXc1NY?=
 =?utf-8?B?ejFMdkR5VyswUG1zUFVBRzU1eHU1cGttZEtZY1V4Y2JPL3BzS094SDVhRCtW?=
 =?utf-8?B?Z0NSZWhyVjNJd2x5dkdMYlUrRmNmbnRaUFN2VXdxWHhxMnRUdy9aaHNhTXpq?=
 =?utf-8?B?VDVxNmoyL0NZRzVFcU9sc1RtWXhXYndnek9UNDBKTXY4ZlFXY1hrekFIOWhr?=
 =?utf-8?B?OWpFaFlNKzlCMjBvajkya2hHSUFvK1ppWjRJUkhTZHV4dUxQZWN5SHMva3dz?=
 =?utf-8?B?K2lTdUtHNzJTa2dYZ000MXJUM2F3bEZZRVVjVkJNTGpSNldtbFJvRmFkK1pP?=
 =?utf-8?B?WDNUOVdTU1FsU2FrUzE4QzluM21xNGxoVTRnRHRBS2xUd2dKdXlsVGxhbHNh?=
 =?utf-8?B?NWNPcDIxWUVTeFJ0V05BZUJiSEJobUJIMTFIbXhCUy9BcjdSSSt3REFORThj?=
 =?utf-8?B?ZldsQnVBK3lyWVMrMkppRGNaT1VCSHhXTGFlS3dCVEZHTnpIUkFMZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b45fac5e-c20e-40d8-9e7f-08df25eac474
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 09:50:35.9777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+AelRTn/LzVAY8s+GOq9+c5bN4lXQtyMmpT2fFIb818hYm72tgLbBsBflfwNTUCMgCGfiz9n8IOfllYkG5C+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB551473

On Thu Oct 8, 2026 at 6:37 AM BST, Karl Mehltretter wrote:
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

The change is okay, but the commit message is typical Claude style verbosit=
y.
Especially this paragraph. Just describe what is the issue and what is the =
fix.
The mention of what other okay config you tried can be stripped. Mentions o=
f
v6.19, v7.0 and v7.1 are completely unnecessary information.

Consider something like this:

    ...

    They are only marked inline. gcc 8.1.0 with CC_OPTIMIZE_FOR_SIZE decide=
s to
    not inline them in rust/helpers/helpers.c, which calls xchg() and
    cmpxchg() from many small helpers. With bcm2835_defconfig and CONFIG_RU=
ST=3Dy,
    linking fails with:

        helpers.c:(.text+0x424): undefined reference to `__bad_xchg'
        helpers.c:(.text+0x4ac): undefined reference to `__bad_cmpxchg'

    Since the absence of inlining always produce a linker error, mark these
    functions as __always_inline instead.

With a better commit message:

Reviewed-by: Gary Guo <gary@garyguo.net>

>
> Mark the functions __always_inline.
>
> Fixes: ab717dd98bee ("rust: helpers: Add i8/i16 atomic xchg_acquire helpe=
rs")
> Fixes: ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> supp=
ort")
> Cc: stable@vger.kernel.org

Arguably the commit in the fixed tags are not buggy themselves. They just a=
dd a
ok user that triggers the symptom of lack of inlining on an archaic GCC.

Best,
Gary

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


