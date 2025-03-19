Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020134.outbound.protection.outlook.com [52.101.196.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976B016F858
	for <llvm@lists.linux.dev>; Wed, 19 Mar 2025 20:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742417530; cv=fail; b=T/mcHHKK8PbY7DgJPqTL3G7U36y0aVreFzIzFZpURjE+dCt0nRlb6Yu7fntE41NdxUG5ndgPvyNZhJ3UZ5O7Ps07vZ+ZxhEqC/nuNynZ1QdzywThKpggDTJ9fY8aAwS+pU8vP5Cj9+7R62+DWed+lHwktAK5GWkRhSgEQuP3Gq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742417530; c=relaxed/simple;
	bh=FnUXTEkg0qreaDfYo9iGJFuXFoBz558Q1f85TsRRZ20=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qdJq/XgZaHV9xV10Ry1tdl7hOCSZZc8/lcNxvPKcTrdQKuCHWPKFXh83tuUnqMHXcrXT2vNi2RbV3xvdNhvrheKN0XvMhhg6BKcsRIsDV/HsIN55Jjx8ryj5VVoymxD8QEpCaD+EcxYH2Ef8uDqK390mzWmgQMiimFlz7GvI6MQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GMKf2z3L; arc=fail smtp.client-ip=52.101.196.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GMKf2z3L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sk+5mnrsk5Qa95byp5n53bEcgjjt59Iqmc1bJZdsQigXXwTTFQGhA8bBsKPHB5GLPQcXVoN265rwgNrSruZdBE1A6QeRHhIIyBV+R2MveejLmkywncecHUhDuAGoqxsm0ECzjBMqu8H1V86bvtprWwaAj2qysN6/HE+0vAmrbdDmUEXU60JoVurr1uIsi6WUgtPKTO8WLkPBxWKBFglP74rsoeT6kt+0yB8V2HgW7KVVkJwZYKa/eG2dKVOcYJhrAFHND1leHoVLAsn05uGNkpl0TlF9C5qkr5I/l3F2I8cBSTaYOobmjq7J30IXfod/pXXhY/e92fY89rLH2sTL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjEoEdQXx9GgoVW+9mfrnOgnKCCCc3t8b2gTJF7fuFI=;
 b=R7YKZIWiJxKCLDnMHeQPbdWjW2cfXixDrL002XgAv7OExMmVUgSitMcD0T7wsQBp3XNDm8TJEHIBLRRtehhqsLtdMojoQ7Cdv94IJVP0wcFMLoq3JjUQdyxItrwydH7XLJths75g8IINhCI6lQR/51AEvMH7BSioVZhjN8MU83nC/TL0GkU4ueehkFol5YDY1kVwEu2J4unn+NIp66QQDzJ1oqn6YHlewNmZdMjDOegKgXE+3AVcPwD9sLmmvsy44dfsp/Lf1IqE4CKcMOgIcUueHCq9zIUEFwRMpm57cC0WOUhyP2I8dg1ScjhJJgwFe+PZU9p8pIOEzGc2qWL81Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjEoEdQXx9GgoVW+9mfrnOgnKCCCc3t8b2gTJF7fuFI=;
 b=GMKf2z3Ltm02s/bcEq0VVlqcrvMUknkFKAXyN9Sslpx0GX5tUbd9AbMx7BLDSMicRdm8CKuF6tPDxZPK/Oig+lett7d5zODoVehz5OOKuX1Ny+zW8fwl6oqIvcM2nj4B3HSo8PIDzmnDGN1q5fGq0LazsicqOKKl/E/CSMgoAJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB6182.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:184::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.13; Wed, 19 Mar
 2025 20:52:05 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 20:52:05 +0000
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
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/2] kbuild: rust: provide an option to inline C helpers into Rust
Date: Wed, 19 Mar 2025 20:50:37 +0000
Message-ID: <20250319205141.3528424-1-gary@garyguo.net>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::27) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: c097b052-b9cc-4ba5-8643-08dd6727e7d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r1kCVWfd0qWCkFtYIpwfHkV52VguUYEdeKCrTY017EZX1hipD2pze0yT79WV?=
 =?us-ascii?Q?4Bgm+XDwnKy04OXehVGaFigS+U9Xc68L/Lm4++Vty6hehku3NrkZpQlSX3uH?=
 =?us-ascii?Q?NWCdfQI7F9Rz+oCwK5xaazFDTJWd/+MfV6P3u5vbkBzp/44aMLZLYQ6StHqP?=
 =?us-ascii?Q?U4W5CSv6KrHw0f+NjLjrMhEtK6lkth/goa8Dy5jB+QXoZ4ejvo5lD3u/hxkK?=
 =?us-ascii?Q?8LOyprj2p9Byzm/y5Ct14KzuolMedm1nJ7bIIpTIbDO+Ozy+CJO4qSiVMpsU?=
 =?us-ascii?Q?4h11jOb4M1ogWRw8Zehu0pHoTV1RB8KPblvM7ptTgDTSg0H/1m/SJkmTzvB/?=
 =?us-ascii?Q?WxjmNOU5ispYyXBr/0oqRYJGZUXEIAcOXl7oPrzG5Uqk8sZfHFkfjJik9wrF?=
 =?us-ascii?Q?bETH883OBMlSWWPbkhf/6vDoFPXwhLiEQ+0/aYj6GOAvIDFx+u3YLiqpyi94?=
 =?us-ascii?Q?tJuSuX/8En33AKROTbDnDO9LjVcQB48sNJJAOxeO/LiTV2vcTzS6MsC3wPqP?=
 =?us-ascii?Q?KLIwCcKlcFcCMnoN4RYZlZSKMPdbG4SuO6KPfdgw9SEIrBlPDNq3BlWu/TzG?=
 =?us-ascii?Q?bUGdj0PZCq8PEEGfxXiLxjYoA3T/WV1RTLFKCmsv+6GAIzH9/o4/9LHp5oGb?=
 =?us-ascii?Q?Na/vRNyNNEfHw+dWbaoSP1bbMaI8BLjQ+UHPQ6Oz6ZtxR2zlGuO4NlTFdYxL?=
 =?us-ascii?Q?dlUaeeav41y6Zpi/ygxu391dMxoTxaoPwH2j6Rco9pDjeJqCOo6A1AV+FHON?=
 =?us-ascii?Q?acKH8jIskERN6Kr7j2J+BCV1SVEIO8DNnZDh02VVUx431d84acKKXj/0/IuR?=
 =?us-ascii?Q?Gf3jUoZQ9L/LSOcHvwihHLyaVlCmY23FBl2P86V1iH0/iZwxE6pIBFK+khlU?=
 =?us-ascii?Q?kN8v74kcHPqhLfInfnJ36TotXrSNaYe5qISWSCQGdWRlo0BeYmqmgZOxJeg9?=
 =?us-ascii?Q?4vgy1jYP0VoJleLNCRl4GxLIrCulTnamaE7EWVLbfjL8eS6EU9mFPAQYBj0Z?=
 =?us-ascii?Q?z0TaJtWUKFXVy6KixIZWa0242UJIC1B79cYZyVxD4SkI8kFGHwVwRn84ie/U?=
 =?us-ascii?Q?0EFWdACqVJQRiPjU3gJxmECmbeSbR0gy4EeIdt+zpLnVRvTb4TyshFpgp4zx?=
 =?us-ascii?Q?l16C62KjEPja/FkxAJeibCHBLAHfQTdm5bNiRKeVJqIZO6GyvKtTSEAphkvL?=
 =?us-ascii?Q?LaCcj3DRdw33e/BQwMQTYxYhcKIrxQL8+HZb9pF1tS6zLu4Jd8osD2G3q7/m?=
 =?us-ascii?Q?CUNpoebcY4TsMxPwa7ceqmQOog4dtb/B+3HdzW/f54iRTniQySSskHfEI0aR?=
 =?us-ascii?Q?39BVsXnM7/s/ygc1igXG7N4z1bXLA51S58S5n41taP06i8Sws0EtS6A/Olj6?=
 =?us-ascii?Q?Bx21igo0ZFFRhnc2H5FI3ymB00dO4U2hsczV0kxfG4xYCQciR7fICVj9NbYk?=
 =?us-ascii?Q?cuM15qvbwmQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/0qHDwwtpVcMcC6UwpYH64MCQM4f54+DX8DbGCvmF+zcqmvrfWnEAUO5W1JX?=
 =?us-ascii?Q?dmCeA1BoJ61BDtD5D9/wfBBnnswI3OBzM6p3OIWUEhL09KTdqiuC6GdmPojq?=
 =?us-ascii?Q?tw+XCSzted9XtGWsOLxyZZ7RBr+g35akFiAMBKRJk322IhwmBAtRPa+dd8sD?=
 =?us-ascii?Q?aSLILjNYqbAqeeJOx9dSr6HVbSZJyJTrF96NjIR0bdVmZvwy7szC9XhMzaYs?=
 =?us-ascii?Q?UmnKWy7TfR2+tiGweNCNg4q2GBwgVMgb8rexl7MZfgxA0zaZ4lVNZWgudInI?=
 =?us-ascii?Q?W4nNXMosBtuNSA/9hJePCRnqPzDIHfp8rxnUALIVgUw97tm+MqCbAtO7Oqt6?=
 =?us-ascii?Q?EQfbj0j/+BhfBbHJIqQnxJHtLy/c61axXByzG6H3OCwlj+Hh5COYvRmCW3oR?=
 =?us-ascii?Q?kitLptSjhe2LSPFtXwawaTaFqSxwahiCJ1qBsIaTw5TtNs46Q3rWI9lXdRAd?=
 =?us-ascii?Q?OhgyE/xjgoSvP+ZGzUjod+ILYhHeOrcU48omzQ6j3OuJt14d+wEIjZ3s9FUD?=
 =?us-ascii?Q?KobMj/3C1x7+97Pr37FjH2L5Zl4zn4LGHpkA/dz08fXXjxTBEQwP/Wu9frQx?=
 =?us-ascii?Q?ejwP/gM6fxwquSm3aXias24WxYDDGf33ZnmjmnInHgCqAIpJFTTibFjBo4SL?=
 =?us-ascii?Q?BNhPAbqexX5U2Z6lXiEn+cZqT+sgl+g3aNyK8hUQiC0ltiAz8VC2AyxQze95?=
 =?us-ascii?Q?ObGbHHk79JmCnFo0FnXJ4dFcwfxok47yY6K9G4Ht2d5URw5ZcCBg0q1vs4v+?=
 =?us-ascii?Q?WSKFirqDTs6f6inmRhNILPpBOrUKj0s2SaGbucXnT3B3awdYAxGbMr5oR6I+?=
 =?us-ascii?Q?Ig0Ei6udl8GI67kVpDqND4Vre8fcMvJHI2U06bIy8+L4YXn1qDYYQ8rp4pHi?=
 =?us-ascii?Q?QCxW2Fh+my1xwinCAT82AwSrOo3jV5U1bYfEdS3otL8+IKj2/SDHHxd55OvL?=
 =?us-ascii?Q?u+wJlRxVe6E+8uiQ0fqj62DnKdqmulgwBUq4OyAyvpllUOY9COnMDS9mkLq9?=
 =?us-ascii?Q?YY5YcIavNqxnJgfqCL41IqPDGEiQnfxOOJ2OnRxDjlCC7HUibyStWLiP2ann?=
 =?us-ascii?Q?QHOBvhv3pWYJ93bhEeBu4PYj286jRwUPSW45ly5Q2PCP6qz90Am7PSd5ERAS?=
 =?us-ascii?Q?k1kVPKrCqWxi4PC1o28gUS0k9Mrv7xqq9qA8pn1qFuRvjWYNzBNboXKIqXpv?=
 =?us-ascii?Q?FshtLeuP7aCKvWStj3CD+tqM6J3DiqrXK6+yW4WvPpZpCKvRFWFoepovVmEi?=
 =?us-ascii?Q?5aQX4bIcGkIi3cqlVQemfgdGkUL3YCNCuWhE9sefbakBwG8xyl7u7CJjT/Md?=
 =?us-ascii?Q?R40AdlTanF7c5PgNzjDQAifPCYyo3BEOUC9OfsUfJFr/yPPrNFgxT0jUO3JC?=
 =?us-ascii?Q?FimXfwDNZVFeTIvZcDqJewLthFq3Tv6iSpAZG8svNYZDd0dVurQRjwYsTvJV?=
 =?us-ascii?Q?VlSC7kckGzp888X1Erx33mUP0pQAAiX8r/9TMT8okr2i7Ab+9D83lwxOEbcO?=
 =?us-ascii?Q?F132t0S2twCD0jIKolZf0unbM+FYfRdji0CNzr1TeNneXmKEbjNdP2MNgqud?=
 =?us-ascii?Q?PLtyR+yWkhMI8kr7yXL6usCQtmaRkwzlTuOzURJ9aPG5gh4ewhdeOXMA2i5D?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c097b052-b9cc-4ba5-8643-08dd6727e7d9
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 20:52:04.9631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EILQ1gWT+LNxemDJ+knWEghfZxtSl+VlNs+nqhG8u7vl5ocalcaHS4/mhdSDm5gzoEawJSl9QqljjyLOrqHtFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6182

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

Changes from v2:
- Rebased and add __rust_helper for new helpers.
- Improved commit messages and add several comments, including
  explaination on why target is considered incompatible by LLVM.
- Drop the `ReallocFunc::call` patch as it's already taken.
- Link to v2:
  https://lore.kernel.org/rust-for-linux/20250105194054.545201-1-gary@garyguo.net/

Changes from v1:
- Added LLVM version compatibility check
- Adapted to account for newly added helpers and removal of alloc crate.
- Added a patch to make `ReallocFunc::call` which prevents some helpers
  from being inlined.
- Link to v1:
  https://lore.kernel.org/rust-for-linux/20240529202817.3641974-1-gary@garyguo.net/

Gary Guo (2):
  kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
  kbuild: rust: provide an option to inline C helpers into Rust

 Makefile                     |  4 +++-
 init/Kconfig                 | 15 +++++++++++++
 lib/Kconfig.debug            | 14 ++++++++++++
 rust/Makefile                | 34 ++++++++++++++++++++++++++----
 rust/exports.c               |  5 ++++-
 rust/helpers/blk.c           |  5 +++--
 rust/helpers/bug.c           |  3 ++-
 rust/helpers/build_bug.c     |  3 ++-
 rust/helpers/cred.c          |  5 +++--
 rust/helpers/device.c        |  6 +++---
 rust/helpers/err.c           |  7 +++---
 rust/helpers/fs.c            |  3 ++-
 rust/helpers/helpers.h       | 13 ++++++++++++
 rust/helpers/io.c            | 41 ++++++++++++++++++++----------------
 rust/helpers/jump_label.c    |  3 ++-
 rust/helpers/kunit.c         |  3 ++-
 rust/helpers/mutex.c         | 10 +++++----
 rust/helpers/page.c          |  8 ++++---
 rust/helpers/pci.c           |  8 ++++---
 rust/helpers/pid_namespace.c |  9 +++++---
 rust/helpers/platform.c      |  7 ++++--
 rust/helpers/rbtree.c        |  6 ++++--
 rust/helpers/rcu.c           |  5 +++--
 rust/helpers/refcount.c      |  7 +++---
 rust/helpers/security.c      |  9 +++++---
 rust/helpers/signal.c        |  3 ++-
 rust/helpers/slab.c          |  9 ++++----
 rust/helpers/spinlock.c      | 14 ++++++------
 rust/helpers/task.c          | 23 ++++++++++----------
 rust/helpers/uaccess.c       |  9 ++++----
 rust/helpers/vmalloc.c       |  5 +++--
 rust/helpers/wait.c          |  3 ++-
 rust/helpers/workqueue.c     |  9 +++++---
 scripts/Makefile.build       |  5 ++++-
 34 files changed, 216 insertions(+), 97 deletions(-)
 create mode 100644 rust/helpers/helpers.h


base-commit: cf25bc61f8aecad9b0c45fe32697e35ea4b13378
-- 
2.47.2

