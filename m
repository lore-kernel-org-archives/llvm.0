Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020105.outbound.protection.outlook.com [52.101.196.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AF83224
	for <llvm@lists.linux.dev>; Sun,  5 Jan 2025 20:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736107369; cv=fail; b=gPq1hBKezctF18aiWOOgWjjUtD/Jx8ehG3hFwz3AQRRMZjT9uNXIbYsOD0zQnuoSpnM6L80Im0XJGbSiiTXYNCfKMafFi3Xp9eq3x0xM9+FGcV77l0KBBw8MMJ3yMds75kR3v8bUr2LDIMWBl7zFs0UXrNiKsMRJ+bQ/qm8+Pt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736107369; c=relaxed/simple;
	bh=QPtZX6mKZDnj1+8Zg/aMe74BtrEo5R9qY3rlUv0GHWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C5rGyDbQwCzkEovZXdvNRAhbxYyC7J8tkWRzoo7D0KhZGz4gDy8DRoEcRE+PGiRxDeJUAk88XXjcCtjJgdA0fEc9YIUhwK9NorBaOwNRZcVSeBcVMXMUMbKFwoxWvdBg1R5Orkv3LX/f6zgVcvVY9Nmt6LUD9mMoWjb1uPlzQF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=C9Lo6vAY; arc=fail smtp.client-ip=52.101.196.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="C9Lo6vAY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r26ikuptcGfPCTojaeXC2QGZdoAcWC8RqaN+6Pr+cB9720v+qWYdoGEKPCTXRTHiPTzGDhxrQARKnsbJUotBOTnNcEgo+mg7aEn2mm08rKvHgbsCeR/sqgtZotXwhemkrbXfSLnIEJOucQNnpjf2BOoPNu4SSS7/VEi3TJRs4BM4NECGKkoikhoi5e9BpQE5T8ACNSNVuG8ckJ+ZNY0+dM7aeR9UJ+KZQ2/gZXjcCD70rxHxB4lorzwFmquGganslZdB9XLxaRPytzFURffrENpVpS+F34a/EGj2n0hi8Q9Lh6Oic7bXTWJ3m/9HLMkDBsr/OhQOg9zzyrUUmOIt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avwPbbMixVi+x6wEkYTotrgDM1i4ITljx77YhgpOBPk=;
 b=WO0LGN2IiemdqqUjMC+zm2EYJSek8Flv/J/3gAWUfWHvswfxNv+cuSwqzaBVDks2EnnDqr6RvnCalQ1GJSeY/AseQJtZBBFvhjI/J65kKpLtn2dHRd7VPFgZ6eM0Srz6eriwqi/ms+bU2E3Av6lUwwAwUkzyIAwHYSuuyPmec/bVCaQjL0ANLfFhH5rF99OEOkn0QmWANnYJodWC8Z9ktobgzVhxbAq2NmdZCp4xQJcvYqylc181m/A/zY6rmgggjKxHVeJpP3fQBukpecGVEY0XgidssXUxOmflLUE09CJX+HlGZoE9dCxiHplMPtRKT5/l5hf/FOkRfnSX6OP1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avwPbbMixVi+x6wEkYTotrgDM1i4ITljx77YhgpOBPk=;
 b=C9Lo6vAYRvAhYV56yTZfErZ44nni833QU0yYalKw3GMs2QhHnuXDEkMy4jLPaBu1C/mqbfK2VKZwVa8T2CatyISLolGqY4aHv8L3UHF3+l0O4WQifN5NAfPzBEY5b5pBjN8z55tONOIp6dmRwMl4CRPfehbMBsObOWhjWE1aQWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO8P265MB7704.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Sun, 5 Jan
 2025 20:02:43 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8314.015; Sun, 5 Jan 2025
 20:02:43 +0000
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
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Yoann Congal <yoann.congal@smile.fr>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Jens Axboe <axboe@kernel.dk>,
	Chen Ridong <chenridong@huawei.com>,
	Jann Horn <jannh@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
Date: Sun,  5 Jan 2025 19:40:04 +0000
Message-ID: <20250105194054.545201-2-gary@garyguo.net>
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
X-MS-Office365-Filtering-Correlation-Id: 3d55d723-40dc-4bdc-4217-08dd2dc3e8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vF0l7ajiAnRsgyr+QglI2DWMnxoAXTaN+UKrigkkKzTvDtJHK8fGSdp4UN1k?=
 =?us-ascii?Q?C+kys9UXMUv14knZVA3Ro2cfxxODKuBUXd4A5H12shi8mIYYqDuf3pdk+Jw8?=
 =?us-ascii?Q?cVCh1K82+3ETK5TF8wUuv5xyroE76u/2VouayTFdf3++zCndj69UYTQiuu/+?=
 =?us-ascii?Q?zgsNurRJAMycpivCyQLfrrCjp30IAhzAWiZl1w2doR9NJV/JWBMYpXpszfK+?=
 =?us-ascii?Q?uApXYMNy4kBTuGWBel35qVYSU477Bm2J2JGZQtHOCENH809oBGhzjKK4GQ/+?=
 =?us-ascii?Q?SAiYoySMlDozUWRnoz1ASg6eECkumRVN0SeNSinMCwtz85maWsiTw+cn0m2Z?=
 =?us-ascii?Q?dTXTk/STOmwY0vz+dAYTyOJoBpjjrMimguFZMVI6e4Lt3tVQIWoGx6t5I8hC?=
 =?us-ascii?Q?i7nv+4WMf2wRNs7+5lTMIKioACfs9GgwgUKOj/c0Z6T2ANOoe9gOseGo7E25?=
 =?us-ascii?Q?/66CT5B0CZ4Pt+rKy362lI9U+A2HB237+S8OAppF6gTzHmjS6i8FFack0+TT?=
 =?us-ascii?Q?frWIX9RhfYSJGvXJE0hmA9rXvHA8oDdicXG2fQwF61yq2PRN3aFA7AVpKxmh?=
 =?us-ascii?Q?2QJbhvyjX8rClCkL03htNDfbVXNb6bXrGkPJ77BnTsgQvvxBH+HLUI3CWZS+?=
 =?us-ascii?Q?6b7FBlBJ2ScrxxwaE8+6DizeHf/pbVwykx2GLd9y3v1Ac6Diw2FPT+pcoyeP?=
 =?us-ascii?Q?6ld+ALIX+Wh/K3QSa/8GNYmVP2AC9s9jQZClzyRp2R9vSOyUcZSNxVqdHfZ2?=
 =?us-ascii?Q?gjQfq8bG9+xhOuxetBJdyV9waRvHywQrVGHz+cqnN6NKIxhFa2YvsXjfoVE5?=
 =?us-ascii?Q?y1oHLYElzYTZ9q1pa/HTr9NcPbObzFEKJsaDc2F+aaEMG1XbfgyBrTyKjpuM?=
 =?us-ascii?Q?fOkzYe2knKJP3y7iFMt46qP8JBt96HrgLWvR181rT7BAhR/j0NICTeiOW/7a?=
 =?us-ascii?Q?USjWPtCvJWA996zV2aahYlTdvttJQGBixFmUwxRKopBbluJ5KL7MGfsvRpMx?=
 =?us-ascii?Q?1OPfNXVvokNI4hEIthqz/9qfmBT99LbCmj/7hXYVZVuA2pwv4yrvqfGoKD5T?=
 =?us-ascii?Q?1y8EW9Ld8nW3S/Lu6kQkJ/VR95cJseApULHyxKVNxOXJKKZv+2X0QYtzMEOb?=
 =?us-ascii?Q?+O47S2XFxMIhrjonnaI+LGCqPPZ2Cfi585KWdhiWbfL0FuE1Ld7zz0IcfMZW?=
 =?us-ascii?Q?VSi7MEo6JBLC//FA2DoC72s5R7Ek5xyTPbNkejzJvHb/glNLBcaJyHXFuUXO?=
 =?us-ascii?Q?ynmnBhVl1xQv77BU4mDkuMjHe474gzEBfAcO5lxJRreNyWH6qNUnF0WXt0An?=
 =?us-ascii?Q?OTMA3bMRXNZm1oR7mTwZO3OGOqX1bufX9ZVrV9pxu1Mwz8uHM7/DCwnl9enA?=
 =?us-ascii?Q?kShEeF8vQKqj0ej6qB/NoRI4mflT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qg0VAGOt7JzF/p37ceGfHFZH8fVqSvsZgEF09BjOAk0cU2xXG5SmDgWwZAw2?=
 =?us-ascii?Q?9ueEeooax5QKDsDgoehTQvoDh4ZLkt7DjDtL9hrG/KzfnKZ/fm8BJTbLaJSk?=
 =?us-ascii?Q?do94mPtXjJ8wkJsPtOrOgtsbDktjppviNBzYcRnocHpVj7kxMq2ieNjM9kNp?=
 =?us-ascii?Q?FAC0OG7FOqanmPKv1juzPg3JREAo3C172rNg+isNvSkvZpZb+ic/Uuw06/G/?=
 =?us-ascii?Q?91/Qva+B1gaVIsJNpcQ2iUUwFXeR/bzXK7a+QzGY/cGxBFLOmrjVUr1g4R8K?=
 =?us-ascii?Q?NJV9X9nYy3fM3GuFIQI3maLoLXKxVksjoqqtUyjCw6cU4y1Uvfn9y0GciCI8?=
 =?us-ascii?Q?QtMY7UnTD/LOZK4bolCn1/54J+Pcwk/03BVPJveBIPUtzgEAmQTVnWEarR9M?=
 =?us-ascii?Q?MKOHzZ2iSSXKVPkb4WdRXD9XuO+VtqHeMnhdNYWeDTdWgXhqeaAvZIF+OE/C?=
 =?us-ascii?Q?OZ6t8EBTh0QVySdzhv4hUdHSKHZy6oM9qoe4yGs0O6IK1+wSVLKRMl7goGFk?=
 =?us-ascii?Q?ySmbV7f86AjZRPd1FU/gHKznGmGiAHrQWpLPPMQwRT0v/NAi0N/sAEl3wj9U?=
 =?us-ascii?Q?rNHma9lPFKOT+Vbswa8DFaxfUB/PTC/BZb6o44KsYKtxYDeUJ0yeyiEG9Li1?=
 =?us-ascii?Q?xhpcF+KPakEjj7DcJcVUlXDL8jx7KVOGQxpfB1w3oyAprzLmWcV4Jfch22wT?=
 =?us-ascii?Q?I84a4i6FKmp9qYHERvZrdg+o4C2X9ResiFJShLCet/XZyiYYeNOn+4xbNTnS?=
 =?us-ascii?Q?BOqBwkrCJlRUtsp6sD1JlfoTATAaxmoVV4A0AUl9rWA3sygZb0F/XtegnLXl?=
 =?us-ascii?Q?++Nhs2WK9L/XTLFBkftIL8PtN0SU8d+c6zrAiWD7Mr6OArujAdFKssqRVDVQ?=
 =?us-ascii?Q?k25Eoc4JqU4AGYsB5NwnR/Ak7eMeSbedCX1bMU8utVe28BbWLZoc/Pq9SJgu?=
 =?us-ascii?Q?uNERHbrtNp5oGMmEFnLLxmALHzqpYNihK7BMS3ZNG6dCv0vXNEHLML9l+RYV?=
 =?us-ascii?Q?8lq/nrobAT8M5Hlpg20gwosoXH8w8qywNHdYxew5kRvipfwZBbDxJfH2Nvnf?=
 =?us-ascii?Q?6xC3jThBMUj3/ZtnirnKcJpDGZm/5LGEzIpChd2vnV8JGUo84Nt139mXhVew?=
 =?us-ascii?Q?FyjjV0H8gyTagobJ2deqwsxDY4VX2ocgXqVzUIVqiU8zEmjkn2rZXog+3hHG?=
 =?us-ascii?Q?ge4iKLzpV8ylJyq/D6ifopsAS2VV+MBDGxmpCAWYMi5sjuAWU6AWeW1UPzrb?=
 =?us-ascii?Q?iy3V0uLteJdFcygDz1kCGWkzC4yiDwMqfQhMvB1Z55BGBBpOArNoKJfBZ7Tv?=
 =?us-ascii?Q?8HxpJe8+3s6vHX/iVwrxTN8tJWhukEoapIsApuDL96QUJWera/hBoiNvByEc?=
 =?us-ascii?Q?ljNUp1vbhvWAh6lY8oVMPLTpICsk2sN7BVcNAirN/zRe2yIPV1CCblE96IHS?=
 =?us-ascii?Q?vdx83+izz5T5DoSE2lRJK7k6KbHcSqS6GdyddQL4T4ESlReB4l3+JqfCD5+y?=
 =?us-ascii?Q?/gDl0yCRqginEV0g/hQPhca6KaXylti9AZvtr1QzVwafNgWOyhcLWPHACXNo?=
 =?us-ascii?Q?rx97F5ZSt+SP1CTU9T9cIZPOWyaX3oLmeEaEfHBk7B4MDw5zdXDu0XJsrv8C?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d55d723-40dc-4bdc-4217-08dd2dc3e8aa
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2025 20:02:40.3438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98zS4ROBmdNsrjsD2/0X6qE/yIMkFvZ/1TP1qgGpl/uQfU4vI7QUY/+CGx/K20F6M+XCpGmNIIUM5AiEg7GFOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7704

This config detects if Rust and Clang have matching LLVM major version.
All IR or bitcode operations (e.g. LTO) rely on LLVM major version to be
matching, otherwise it may generate errors, or worse, miscompile silently
due to change of IR semantics.

It's usually suggested to use the exact same LLVM version, but this can
be difficult to guarantee. Rust's suggestion [1] is also major-version only,
so I think this check is sufficient for the kernel.

Link: https://doc.rust-lang.org/rustc/linker-plugin-lto.html [1]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 init/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index a20e6efd3f0f..cbe4b2922ce2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -82,6 +82,21 @@ config RUSTC_LLVM_VERSION
 	int
 	default $(rustc-llvm-version)
 
+config RUSTC_LLVM_MAJOR_VERSION
+	int
+	default $(shell,expr $(rustc-llvm-version) / 10000)
+
+config RUSTC_CLANG_LLVM_COMPATIBLE
+	bool
+	default y if CC_IS_CLANG && RUSTC_LLVM_MAJOR_VERSION = $(shell,expr $(cc-version) / 10000)
+	help
+	  This indicates whether Rust and Clang use LLVM of the same major
+	  version.
+
+	  Operations involving handling LLVM IR or bitcode (e.g. cross-language
+	  LTO) requires the same LLVM major version to work properly. For best
+	  compatible it is recommended that the exact same LLVM is used.
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
-- 
2.47.0

