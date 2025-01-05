Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020105.outbound.protection.outlook.com [52.101.196.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641123224
	for <llvm@lists.linux.dev>; Sun,  5 Jan 2025 20:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736107368; cv=fail; b=JnBFmtmoI3PrR6ThGCCLVirrRWfQpgJjIHLroMkv24Wlgc9GjWAPsHNdIo6k1Ijy90sNJCv7EJ4LzPrxP6L7eQRDH9hjAQzRQNOPsNYfZ4fBWVdd95wymWY0fC2usHTvix6uh+uk7v3gZe6jZEv5dA9BfUH62xF5J6zlpuk43M0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736107368; c=relaxed/simple;
	bh=UYW2wMfzb+Sngg3KsrCTtADe9SQD1r6vMLCKMkZaX9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=c/SvkdU26f893qGr//X4hBZFxVrxylbsFe+6ObtTKPURl5Vd7elSFQXlkTvqyHqfJg9gkByoqDJSioIofZWA6RCpLzspdulIOy0ZYPEPyvdUOW9sNlwn0Cjay4Bx31OFntRaPBaNzcVZONRVSRPtZXyAREkWTBrqvKnjkBfwxzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nPFuofaa; arc=fail smtp.client-ip=52.101.196.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nPFuofaa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUyrmj8R+HSuGipOPa/4dK9MqV1MijdwGC3dIk3sP7zs7Wbdc/DK/SeViXXIcJSua+Oi0UNzVtKEAjWIU4tF25dhoJYbsiqGwI6MOwv3IB/ExqripEJVI3VPZ8G0yfrdjY9lGlXRDpWe5z1vzK92aHiu++8HOT80sgjflzTcJ7ua1qETmUSd6O2jr5jslWmeGAfrD/7gXkQnbTxubrsjldxnhhdTCq3BP56voPB6xfNvI82LueNKFyr2oVG6w+LW/igJ2e6hfknSkEzvOGxTuTRMwFDyPNIl4D+UPNeOpnusQHg73g99fkO3lphNatnOf/gSx8Fmo1Wjq3VjKeqedw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XBQYKOI/SanTwrlBtxZZZvsVrooELeLr2m7bhofHrg=;
 b=qDYvY/AVilGkBqwJolREOC7J9QAUTnCl+hgT7R7XGLORLBDBD4TxopHd9yNfMkb1PCyAlgxg/N2o0i1aMdBuLuyVPDukps55ZvxQrxjh9qdvGX3XShlz9L7HXVWd/ngRh1MoOhzRY792CGw0emjVA1/T0ARiW9RQQQPYuvBVAEFwy5IxMmzC2aj6e2qi8CB1OfEh0/DcNK4EimtOwa2js94TFiBQFSWo25Av7u2PA76MkgRiB4nKIVp8wd3vqtbKbhDgmcNuQ3ugJSRBmkB32GcLtz6nDFMdH1A6u29FCbLbOWA8gKvJNCKUT0gMW8gMp0u9X/xLoFkikSHLUxTxTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XBQYKOI/SanTwrlBtxZZZvsVrooELeLr2m7bhofHrg=;
 b=nPFuofaaKhCnwNBbTY8OmY55c7tMekb6jvzNFt1NdO3DJoaasYTXsJbyiFb3tMc/nIuhc84FvEIOnp9nYEuENmDQ8KFmigXWoEHc6/egh5dxe8RYHGp3XkaBsc4INHQaWvQ6QxKKK4KHpTSmAnb59ZEYxTrdyzwkJrEfkT2Ot+M=
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
 20:02:37 +0000
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
	Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/3] kbuild: rust: provide an option to inline C helpers into Rust
Date: Sun,  5 Jan 2025 19:40:03 +0000
Message-ID: <20250105194054.545201-1-gary@garyguo.net>
X-Mailer: git-send-email 2.47.0
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
X-MS-Office365-Filtering-Correlation-Id: 9da33397-8887-4da4-e133-08dd2dc3e6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gGH1ED/ToOHrFkLAi4qjK30HSlo20YPN6APqOiySkd1sJRLJaGTj2OulQBJc?=
 =?us-ascii?Q?JXzswfN/0xN7ex/o/PdbwT+cls6q3eFpojEci0bu6DoBGR6+O+p6HKun+O1I?=
 =?us-ascii?Q?pUost/51vKvWeUt4tuw2mnpx5rgfiPVuwia6WkGAywp7tt6I3wlu507aLj1n?=
 =?us-ascii?Q?eHiVv+4MRW2YcVC4/aFcvHO0MM8nVSAxkuAz/y94xI/8/FCUtjR1L8oC/L0C?=
 =?us-ascii?Q?ffnnQGZBsI/EbLCS1oFKVqfsCk9y9J4A4BHsmqKkQ+mf4TZg0wMFVSBtmt/X?=
 =?us-ascii?Q?ZnKM4TC6MasQ0chmUxkgfPO06JqUQQeWiKQ77fQW1Fkkr9VcPdS4FVmkyB74?=
 =?us-ascii?Q?USJWV44Rfet9CA1y0DwQGwn/5rbWNfbQCnLzSNox6+N4BTLdaVQR8/N1RZzg?=
 =?us-ascii?Q?251aE41Lp0Re3mb6wSjRkN6vHMCH6TCRBMQzocOFeaehuJgfg4nAaws62zOw?=
 =?us-ascii?Q?tM5FMZhY9EWb6a3i8mGHLdE920ccaFfLip7EyzMJ4JQyDCttbfDqq93mE4ab?=
 =?us-ascii?Q?LPCgiOGFcZpnWAqO2DiRxwPZF8ZkZhiNGV4FpojYTM5ErMDaxanrhS9/Dlqi?=
 =?us-ascii?Q?vYQiAQakUJ7Vp4/g9Gq18HPzZ6V6I4lNsITq6jaH80B45LngNyHCbJCXKAYf?=
 =?us-ascii?Q?I1ng8n9P6Zb665NAt1K5watlavmQOX49d7tvYdZO7+bPsmWqNptIE5DHYmnt?=
 =?us-ascii?Q?BRyWrxFUAJhKI9BV0MWEWEhoClZbiodcSfE7b5shasHCNidz1nOrFchnwgio?=
 =?us-ascii?Q?fcvAXHTZ2n1FBjiJIq7CLD3ph/WoFmimiBpMQEY7DbmrWnySFhu/3IDGhWhC?=
 =?us-ascii?Q?dW6rqt69IMdSbeBy52ZlOwdsrA326LJfPZH/LyhEPnLTt0GzoKP1gx5W2VMk?=
 =?us-ascii?Q?NaPAjq7hUQ4G1xo5DQeBYsyRyHI8nrXTwQT9bMpgDh6an0ilJbVNJurLcoOx?=
 =?us-ascii?Q?9+5GhDuDup81afxsxK2rW4BFIohimQTjz4hGZd2Bp3UHgm9vtarxO74yfJM1?=
 =?us-ascii?Q?GDuGJVzHHcF2571vYZydTUHWTCsjY9d563Y8QxDKsC//j4tR67rc4CsQrGmK?=
 =?us-ascii?Q?sK+FKhQuv45K6FhdBs3ZRHCi7BlEU9swricbG72A6L82wYxuFE9JUrs91/C4?=
 =?us-ascii?Q?txbERbMntY5k7LQ59pQ7lHjqeFbuL2zCCm7xMCUuy4eHjyRevVyVC1sXN5G4?=
 =?us-ascii?Q?vKifqsnoOfhbSHDaAgMrjdYrCcW7ZhciJN8M1bhtgzDakIdBWD14I8W9TpFF?=
 =?us-ascii?Q?7inACxPWtBP3IDwsfPGGVjBq1FIMxtCpfx7tsmOIjeDFgBA6n56DG3vlZ9Gk?=
 =?us-ascii?Q?ZFRt4pU5AuSGZB88yfh6Kp1SYmjS2Jq//bCwDNukbVVOgqoYFmag1S5UyLTZ?=
 =?us-ascii?Q?/XzK8TNVoW1T1tmCWGkITMgGGt/BoF/O/VmGE9DRzqgqVXROPIu8fjKmCqZW?=
 =?us-ascii?Q?BA5mJXx40yY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RFZUyAb/fhVaop8RRg4oHj7pxvesOWwwNOz9MAAjDW1CBUkuaM4gPbZ9jiAf?=
 =?us-ascii?Q?GPbtp5oQNaXw0r7w8oJiRgItD8MCmZ2uWK99xmKnnlheHHyaM7LV/L2PPctM?=
 =?us-ascii?Q?nog7PWChOXEzo74kx+1K9Cruqaz+iWMwqDer6lJky6kyLz+KlsvRFwrj+zgb?=
 =?us-ascii?Q?5xqQdBbl17X79Itpa/BuSu/XjfWXsknkawv9I6wgb9DSChBdcmPgPtyfjhZl?=
 =?us-ascii?Q?W45rVXslgnUZltweYdEEDpWLAwIQbQo4puv/fSzfP2QgmpC6JvbzzDvq3421?=
 =?us-ascii?Q?c1RhFWgEv19+q/iVKUNgzpUqDNLHWAlcZZpCbU3pMUpuPO6BWw3hj1sKeGpe?=
 =?us-ascii?Q?7rqYH8h+auo8UFQbGlFBxC+YItIXRijyr6pHIOW8nkX1g8L7YOcUzzh7ZYd8?=
 =?us-ascii?Q?XlMlDUJHVIGGFhn0iBYyDqm6FIDun6Laiq6+c6++UblGt9qo8PK1xB0zi0b0?=
 =?us-ascii?Q?f8ul3HfiWClOm6QFkZgOZMbPuY5Zg38n2LOoEwQ2ZfGwLs5vIJR0nknD6J1l?=
 =?us-ascii?Q?TThijyw/BcAhsAn+C4o9yDQLEMq0e9OxZvgzAPnq64744hDoY4kwb3pRyDF4?=
 =?us-ascii?Q?7GwPvPx4DShqiLJraXUT+jtmIz5yKaOIAZKpoyd3JHfAN9oHDaeEZUaMmyQV?=
 =?us-ascii?Q?Bomtc6gC1dNFtgtE6K0uLmTdzHpBREWLenKvpMDyjbh0Yr2Bkhro/1RvY4mw?=
 =?us-ascii?Q?74XU7UazQiTFFiJtzBJjIT9ACd2FfBnbWdKyA3W+Ah66pQ3GfMWd1ay2wBtu?=
 =?us-ascii?Q?4Ge+XXOja6pmaS1ythgiQpyKzD7SfU7jK3askzNxoIZdn/xd/oTr7Gq35mrr?=
 =?us-ascii?Q?FR1xsyeyXNFoeFB0XSvSAyoIKeUv7tm/bc/kiGSPR9K0jEfXXbSmWvzb6qMI?=
 =?us-ascii?Q?BWwvBj6RrG/ZKquXHF2duJfo8aqPTU49CjjNsU2KAC6Blue9MXMzTJUSCPeg?=
 =?us-ascii?Q?IyHqlJr8jWfU074vV//SuBLznCrS6Y3KnRFZFEcnvz0Iuqt887iY/RObJi9g?=
 =?us-ascii?Q?CmVkXdbv9XgeAaufOKpWUIvjF/48hnjkd/sro84JgsYRpmp32eUrcFulO70Q?=
 =?us-ascii?Q?myGZhGHQpMS+4R6uY1sc/CKgwIe6BW3Xgbzm9GsDCALojT4CmP5/DeP3F5Te?=
 =?us-ascii?Q?w1v6n1s1CgYa9hs+JcMoiGlHYx6wO0fmxNoILG/2qc5/pqrj79Q6V0xNmknA?=
 =?us-ascii?Q?VY9NsBxo8kAN0+3relTYQI636TvAZBdNr/E78hZ1b/5aCCrR4X97TnrhlBji?=
 =?us-ascii?Q?86mQVzrQHbPpJ8UKHgPSTc718iNzJO1tWt+M0DbNFpYLYXfx9D2Yir8gcpvu?=
 =?us-ascii?Q?HUcGbXUKmZzMGqzyOnH5oiQVKAS1rmw8G3Y0Ag9FZYehanXnOd/O5ohYYBYA?=
 =?us-ascii?Q?z6DBC2oZteOlb0XapviZJAw9q2hS7nqnf8zzqz2rd5rsBqKvWUBpeljF8QHS?=
 =?us-ascii?Q?/H8vHEAjUWx5NYamfcFU4fygh4Put9BTw9ET8ZJY4A0m+kRq0p++JTfhMn2u?=
 =?us-ascii?Q?WPqkHYfN9BZwwUQG1eGaTTeN5tqXBvAVYE8HDX9etNaPjjZL6VP3PJiKivme?=
 =?us-ascii?Q?5GvwIiQmSGBmaMzKN9T9Dy+d/nZe7gH0qOVfHS1nFUuH4KqeUgURS3nbYpBC?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da33397-8887-4da4-e133-08dd2dc3e6be
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2025 20:02:37.1660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtO2U6ucLQn0qIidfwWh5KZm2u5FzPOlDTFOY4n8R0jZaKmmQyb+FI6p0Zh+oTx1ozsBmMO+94qGYhtLv0QzCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7704

Currently we have quite a few helper function to aid calling from Rust
into inline/macro functions in C. These functions are typically
implemented with macros or inline functions because we want them to be
fast, so we want to actually have them inlined without the additional
function call overhead. However, we also don't want to re-implement
these functions in Rust to avoid accidental behaviour divergence.

This series add an option `RUST_INLINE_HELPERS` to inline C helpers into
Rust. This is similar to LTO, but we perform the extra inlining and
optimisation per Rust crate (compilation unit) instead of at final
linking time, thus has better compilation speed. It also means that this
presented approach work for loadable modules as well.

This option can only be enabled when Clang is used as C compiler, and
that the LLVM major version between Clang and Rust matches.

Changes from v1:
- Added LLVM version compatibility check
- Adapted to account for newly added helpers and removal of alloc crate.
- Added a patch to make `ReallocFunc::call` which prevents some helpers
  from being inlined.
- Link to v1:
  https://lore.kernel.org/rust-for-linux/20240529202817.3641974-1-gary@garyguo.net/

Gary Guo (3):
  kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
  kbuild: rust: provide an option to inline C helpers into Rust
  rust: alloc: make `ReallocFunc::call` inline

 Makefile                       |  4 +++-
 init/Kconfig                   | 15 +++++++++++++++
 lib/Kconfig.debug              | 14 ++++++++++++++
 rust/Makefile                  | 31 +++++++++++++++++++++++++++----
 rust/exports.c                 |  5 ++++-
 rust/helpers/blk.c             |  5 +++--
 rust/helpers/bug.c             |  3 ++-
 rust/helpers/build_bug.c       |  3 ++-
 rust/helpers/cred.c            |  5 +++--
 rust/helpers/err.c             |  7 ++++---
 rust/helpers/fs.c              |  3 ++-
 rust/helpers/helpers.h         | 12 ++++++++++++
 rust/helpers/jump_label.c      |  3 ++-
 rust/helpers/kunit.c           |  3 ++-
 rust/helpers/mutex.c           |  7 ++++---
 rust/helpers/page.c            |  8 +++++---
 rust/helpers/pid_namespace.c   |  7 ++++---
 rust/helpers/rbtree.c          |  6 ++++--
 rust/helpers/refcount.c        |  7 ++++---
 rust/helpers/security.c        |  7 ++++---
 rust/helpers/signal.c          |  3 ++-
 rust/helpers/slab.c            |  5 +++--
 rust/helpers/spinlock.c        | 11 ++++++-----
 rust/helpers/task.c            | 23 ++++++++++++-----------
 rust/helpers/uaccess.c         |  9 +++++----
 rust/helpers/vmalloc.c         |  3 ++-
 rust/helpers/wait.c            |  3 ++-
 rust/helpers/workqueue.c       |  9 ++++++---
 rust/kernel/alloc/allocator.rs |  1 +
 scripts/Makefile.build         |  5 ++++-
 30 files changed, 163 insertions(+), 64 deletions(-)
 create mode 100644 rust/helpers/helpers.h


base-commit: 0c5928deada15a8d075516e6e0d9ee19011bb000
-- 
2.47.0

