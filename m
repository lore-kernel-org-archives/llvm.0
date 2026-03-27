Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021112.outbound.protection.outlook.com [52.101.95.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAF2349AF5;
	Fri, 27 Mar 2026 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613995; cv=fail; b=Y/jl2b9Wdu8azb6cQgks/gdphwQopCKWStUEAjGTdBOifCN10JkLvzbBOpPFHAbDqujVMGrSjMp3yBaI3BUjLo6UzNFTIt3sJwET1EW5xogtayH/AAxNcjLmoBPDFzVrHdKu7VN/S6ftgf9oB7zdKvOEpmH3xA7LX7bLxjF90/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613995; c=relaxed/simple;
	bh=O9w2vv1cO8UWioSWz2SfjhInPw0VLLcyyZBJOgWhjOA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=CbGq1HQAbzqEIyynhVQQAG0UVFtT9j4TgtCFwpLQkm6+IvN6CCPtLCtxU/+ufXR2uW8cts2vjXYvX7N37x66/glr5HXhwPWyH+QJ6edowOmwUuS0Pl8MN/odBEIxOHoyoU7XgUzz7G87bFL6kLAHPBwwrPkDHcqno/BhYnTPJiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=viCS229L; arc=fail smtp.client-ip=52.101.95.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="viCS229L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7paV+kMoy8IKHTXLwlnqNJsrD2WTCTKiftbYbVkDDRaED/kukPOx6Ujx6MdXNekUWXV/BIcZqrKu4qfpypCdJ8SjjB9nAzOg5QOH1v/3Fcu9UuatEQS7Vk7itp41makmcpEK4PNjMLwzK4GXy9axvB9ukIc4JDsH1Qf4C6AuiI/MJPzCTY6GB82HkxmI5drHR/jcT7f9IXzePCv8G+ypTZBZ+zhHboGJzaSkJd8MuqDNsnkgPHJZslr8JKfEp/Cfye3F4+Tf4QORpn/+fFAiQsEJMNylgIl/QMi1J7lsJa9YRVyCsE5MTJlfslq8uJisH50avMkgppN9RnVUHFHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxCD3NtjYZ5S//WV5seCOEwTI/dZySB5LMNUiowrw0M=;
 b=SxwmxqAldYo8cBIFJ7P7HS9NaE9GsjWDO7n5AVUhnwDPAnVxVpPwv0H37pT4YAFOEfwIsBnQUY+mDtJ2XsoOBVIQXQyw1QrkwKg9i5lhvUkxhE5kTKFVL2RWlD8oL69qNekW9IJkMp6xmnz9Pb63rJpnbtoZ+O6Z+3hcgPIYdJ8eqIyZvzSyB8fRQp9PxQNM69FCGqfMPogOeKlHMmxmDVegksZljJ5zcorGLYuN3307fdAVC+5adC1vbb88+dx6fxOAN8DzDB+XUDC4rbChhnPWbm+IzahQjqIi/ggl2z3wxaLItdpnDxiPvg1x6ykUm6O8Zm2CqxEPzHy4ElrCiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxCD3NtjYZ5S//WV5seCOEwTI/dZySB5LMNUiowrw0M=;
 b=viCS229LEyoB9E7mbarBHSj64jhs0p+3e7ft61o4HYnvvPlENN6Ffen922wBxeIN/g1RVzGS+QsUmL3HEyjapluyhzfedyuM0jC8M1x2FKVTNMnvYR9gQFdkOguDVRy4W7VYhZ2LPL5uPfoINDQr1/uNBZs4lsj8NcNNIL8GSxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7552.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:216::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 12:19:50 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9745.022; Fri, 27 Mar 2026
 12:19:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 12:19:49 +0000
Message-Id: <DHDK5NZ9XWKU.2QCWDPHTPR54K@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH 6/8] rust: io: add `read_val` and `write_val` function
 on I/O view
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Abdiel
 Janulgue" <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>
X-Mailer: aerc 0.21.0
References: <20260323153807.1360705-1-gary@kernel.org>
 <x9CNNH_pSn2n9-PCo7dX7L8m_TykniwA_-YZSe604nqWvAJAKe534_yo9gacCO-pD833mKwNx42DshdzaPgehQ==@protonmail.internalid> <20260323153807.1360705-7-gary@kernel.org> <877bqxy96y.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <877bqxy96y.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO2P265CA0397.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::25) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: b58f0b60-16d7-4b39-0679-08de8bfb2465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	Jp3LviLCaXvq14RE6f5/jXYlvkijWdUNYw5pvaI77X9Aoc0mdY90eMxlCnYqFE7lkVuY7dyzCTDLfO2erwlLfuGDNDEJManmjFkiynmQCCOCncFyREwCY/X6w7y5/38jG/Z49XWfNN0gJ4H6RR+foF+9BG95wcR08oOHdjCYPY9sVZlysj6Y+5i5qWlSOH93WLVDU2H3YoqoE2c7dX1yExzm01fpywZ+VtrZ1QomAG9lqY8iU2uQVBxD1RQat4+Bx+oDG4m5feVbVtr+7EW0UffuRyV1VSh3IYhDeczhCqQsFCWTZDZmJ2ysVyVj6qMxl/DeaCrl4mwWCnptUmuiMjbuRT6bskVf/PMioC/NZuHu6ANlpPR45s9nmh1mkTf92I1yozDdPt7LU4i0aldcxBkuJgRu7wznaVppjTXv3ohy0ACOhkPa/7KUSLtSnqok4Qp8wLTAX6S3/trBIL7obKjqAqHNBxnquBnFWSSx9xqT9KsMajdrScO5Y4CRoWqto34Qm8eSqKodTsUkzHMk1mnstSG9Po26pNemFJMf3sLo+30XVswZctGAyUX3XIh1khdVi83Kl2N7b1ibaZFeAe/vMzIV3mkIsQsVTfsTlnS33CfNAUojjIJtgY/Q0Jj10QnYxUHexFeT+wThDNb5zVCQPvZlIITajFiK6bdxXfeXtfOwW+jRvd89kjzVWVKFoA9RAM4H+/o2snkq/X2zO1rncWFIKqhV0YNbcHMF6hajvEx3m5L+kvP6hl55ukhYtwmgNv0cDUPfvbfmBPMFAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnVDTVAzVXN6ZDdYZWdRUzNhdjNETXp0VUhBSW5tQVV0c2Nnb1RnRitSbWpm?=
 =?utf-8?B?SkhmM1pCUDFkM1NwVUc4U01obk1LczFDcTNSVnRYamgxK2Z3YWRoUUVkM0Uw?=
 =?utf-8?B?aDVQbXgyUFJEaGV2Rytoem8xQnNrcnN0ZWhqVXhUT2hjc0lHL1draW94Z2Rh?=
 =?utf-8?B?WTJIY1pZeWFHRTYwYWgxcG9tZUplNzJheFlFM2kyNGN2L2lObVdsc3hTVkw3?=
 =?utf-8?B?TEhZcjRpWHdaUnBtV3ZPMlFCOEpNUWhnS0tNMHZuTUdjQnJOcUVvNDZjWFU5?=
 =?utf-8?B?Q0FJRWdsd0t2QjBrL2N2NU5hWi9DQjhoQlMzbG4wSWEwVVRERmxhMHEvTkEw?=
 =?utf-8?B?Tm5IOWhmUnBINHZKamdXbGllcXBQVHdVZW9qdUpEcU1zNHZDOFZBQTFydldl?=
 =?utf-8?B?YWFVMldmUVorYmdxSjFsOXFzZzlMYXMwMWlJTXkzUjhGSnNxOERPS3pCTEFG?=
 =?utf-8?B?K2VZblhkWDdmdjVpSUQ2ZFdwU3BVRWV0QU1LcHN2WFYwRi9oR2NqdVQycndy?=
 =?utf-8?B?YUFOb2NDQUZGNFVBL3MxN2VwYTVXZHNCbGM2QndSaWU1dzdCS0llODl3ZHVQ?=
 =?utf-8?B?ZENUVVlqNitVOHdCbEZESzVoekZkU3dUWDR3Z2Z0NXFaUHV3MStiN09ncDI2?=
 =?utf-8?B?Y0puYU5Ya3hwQWxyaEU4Wk4rWWVHOW1LTHgwRVJGNDRIUXpuemJSeTNYU2JR?=
 =?utf-8?B?cUtaekM3VmlkUW9WSERoQTlOSWZ1d0lTbjFSaVBlZUJkZmZxVGw0cG1DZ0dB?=
 =?utf-8?B?eGQ3bGNqWGJwQ25vRSt0V3lTTXFrL2R1YXBzQlZvNkYvNTExUDlremFLdDhu?=
 =?utf-8?B?dEVwbmpHK2dRcFd5Rm1qdWNuWTc3RTg5emlhbGYvRnFndFRSUkFoWExEOTVZ?=
 =?utf-8?B?cWM5Q2lKcjFRYTY2ckEwVFJvK1lyNGdjTVBPeHpLZVVoc2VQU1JkOVZzSVBL?=
 =?utf-8?B?bGlnaERzQ1Q5cEZIMGMremJmSnlZdDQxV1ZHU1JiaVBqdGJXaEEyODU1UE1O?=
 =?utf-8?B?cWNqcWpUUnlpOFpEL0c3N0ptbEpsOXllTHFzYTNSWFB3ZUhmNHptdTh6ZWJm?=
 =?utf-8?B?MnBWTTluZ1d6UllEVDVCRmxZcWo3aUNhOFd6b2E4RnplcXQzUFU1ejBvM1BD?=
 =?utf-8?B?NjY1TEpPWmF3cC9UeTBEY2lMVTR5UEpQbUpBWXZ0L2FQZEdJL2FXYmY5cGNO?=
 =?utf-8?B?N0ZGM2hsUGhPNkQ4WjJhRVlLL1F6dHRZQkhsa1BzU0lDaTlsUWRpZHdVMzl6?=
 =?utf-8?B?NTRKYnlKRkFlUkpPODhVUm5lSW5KZm9Za24wZ3VDd0xYN0o4VE1IWnRGUmla?=
 =?utf-8?B?am5HTFZwOTB6TFBiOVJOcTdrQlJIOTkzRTgyVGwvNDN4aXJYcDl3eXRxVmVv?=
 =?utf-8?B?UzJEbHdsMFkwa2tXZWV0blFmektaZzc1eEtqSCt0VVhOMGdWS20vVlRqenBJ?=
 =?utf-8?B?VHJEWndSamtyMjlWOVNwT3U5QnlTWEFjYUhkWHZwd1dEakk3VFpWTjBuaVBR?=
 =?utf-8?B?dm5MNVArNlR2Zmo3Z0tSZVU4c0RRQUVFMzg1MDlYOHR2T1ZkSTd5aHRUMCtF?=
 =?utf-8?B?L1B1QlRyQVVYSUhIcWhxNVB3NXJIZkZjV2wvcVN2bVVoajZWK0R6UG90VWpl?=
 =?utf-8?B?ZmhIczlVdXRGVVR0dStyMm41UHhEMmtMSzkrUk1ZUjZVMnYreEE4bWs5cTNh?=
 =?utf-8?B?akQvNXJaUys4QTVXVW05dXdLNW12TFYreFJ6TW1TbWZoWG9JZ1YyaHNVMFlx?=
 =?utf-8?B?dWVyNVVsNUtsWHQ1VEx0TzZsWXMwSW5KWldlQjlsd0QyMlJPS0s3OG4xVWVU?=
 =?utf-8?B?c0xkT2FmL2FXVCtJaTQwTU8xMTJoU0JFYzNzVjZ5SFREWWlnaTMrL01sTFZj?=
 =?utf-8?B?ZDdmcURkVmJuT3N6d29FU1NqL2VEc0wxUFllT1FuTUFCY0FxSUV0U1ozZUV4?=
 =?utf-8?B?VzQzWHR2VEJ0aG0xWkMyN3VLWmkxOG0yYmozMUp1VGZQQ2RJa3A0ZVJpUG9M?=
 =?utf-8?B?VHRJMkRsK013cFBFL0JNUjNFbWt0Ny9wbEtkbzNpT1RrRjZuekN6SGx3ZE4v?=
 =?utf-8?B?SSttaE8rcDBNTm1SQVFXdjJvVXVqckxzbUxPWHFyeFVtY05mQ3pnMXdtcms0?=
 =?utf-8?B?eFpxMDZyeVVaZUJWRldJa25IdkpqWUhiUkQvMTdCeDlPK2RwdEV5akhCU0ZT?=
 =?utf-8?B?VDk0VWZuTlZHN1VSb3ViYTJlbWFLMUR4dHZxVytRRm1RaGhtLzlXVExSRU12?=
 =?utf-8?B?NnRCNnlpdi92eU54bWpXaE1GZmU2WHZka1phSHhFMEZuTkNSTGtsSmJMK3JJ?=
 =?utf-8?B?WmFRcVlXdWFvR0J5OVhpVEV4emJ5ai94RjlYNHZEdW0yYmg2dXdUZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b58f0b60-16d7-4b39-0679-08de8bfb2465
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 12:19:49.8133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUYI2ZsADYsvO2KjAapcU/p4RRdQqXlL1zjQd9YkU2sTiB6Rsd93Ksb+2RQK3TyprshPnVUXyGOxSMAdrSH2cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7552

On Fri Mar 27, 2026 at 8:21 AM GMT, Andreas Hindborg wrote:
> "Gary Guo" <gary@kernel.org> writes:
>
>> From: Gary Guo <gary@garyguo.net>
>>
>> When a view is narrowed to just a primitive, these functions provide a w=
ay
>> to access them using the `IoCapable` trait. This is used to provide
>> `io_read!` and `io_write!` macros, which are generalized version of curr=
ent
>> `dma_read!` and `dma_write!` macro (that works on `Coherent` only, but n=
ot
>> subview of them, or other I/O backends).
>>
>> For DMA coherent objects, `IoCapable` is only implemented for atomically
>> accessible primitives; this is because `read_volatile`/`write_volatile` =
can
>> behave undesirably for aggregates; LLVM may turn them to multiple
>> instructions to access parts and assemble, or could combine them to a
>> single instruction.
>>
>> The ability to read/write aggregates (when atomicity is of no concern),
>> could be implemented with copying primitives (e.g. memcpy_{from,to}io) i=
n
>> the future.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>>  rust/kernel/dma.rs | 40 +++++++++++++++++++
>>  rust/kernel/io.rs  | 95 ++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 135 insertions(+)
>>
>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>> index ae2939abc166..fcdf85f5ed50 100644
>> --- a/rust/kernel/dma.rs
>> +++ b/rust/kernel/dma.rs
>> @@ -877,6 +877,46 @@ fn as_ptr(&self) -> *mut Self::Type {
>>      }
>>  }
>>
>> +/// Implements [`IoCapable`] on `Coherent` for `$ty` using `read_volati=
le` and `write_volatile`.
>> +macro_rules! impl_coherent_io_capable {
>> +    ($(#[$attr:meta])* $ty:ty) =3D> {
>> +        $(#[$attr])*
>> +        impl<T: ?Sized + KnownSize> IoCapable<$ty> for Coherent<T> {
>> +            #[inline]
>> +            unsafe fn io_read(&self, address: *mut $ty) -> $ty {
>> +                // SAFETY:
>> +                // - By the safety precondition, the address is within =
bounds of the allocation and
>> +                //   aligned.
>> +                // - Using read_volatile() here so that race with hardw=
are is well-defined.
>> +                // - Using read_volatile() here is not sound if it race=
s with other CPU per Rust
>> +                //   rules, but this is allowed per LKMM.
>
> You are not covering how we satisfy "Reading from src must produce a
> properly initialized value of type T." I assume you need a bound on `T: F=
romBytes`?

The macro is only used for primitives. I'll add a line explaining that next=
 version.

Best,
Gary
