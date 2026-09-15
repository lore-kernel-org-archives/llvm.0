Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8228F3EC837
	for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 09:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463114; cv=none; b=EM/U9zyR/yKn0jkRC/vyFnjsv7ZJMORVQAla6IBNBcC0WYxwUcqELyxdMgTpfTy0b9OGq5Rh8VR+BWq1v6snl6+j12w30B0ut5NC6QsqAT1lcAYsuNZVh/lWvpicywIAVoDD6RdaWVsi/yfp0GDpJe/nB9efV0Tz2CIxi9SSwpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463114; c=relaxed/simple;
	bh=wINWkLDSvaASvwcaEXuWAF3ftuB32SUM4N8LFPtrmBQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oPy/9gzege5DyQrQWneqc7xUHAel1Zez2c5akF4TA6E/aLqjxyC7MyeTF/xHWTc3kDQPqevL9fKwahCtJwpqaisXjUcFOhQWrEx33S/ejJxrD9i5S1vnaWhrBcbsnsmWDlWPh4KErWb/tuly+BXk6sn+YKlKhAyDgOCnE8o4W64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZRGcgnE; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZRGcgnE"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so28196a12.0
        for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 02:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789463111; x=1790067911; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OftSuNw6O3AgitXo4CDVX+TOcz6GDkEK6rb5ipL/z0=;
        b=pZRGcgnEF74oIcxzlxrBywjpNCdQAmB2o1iITGSnqvnNkAJ+/mWAnc+NmZP9yoF3ww
         anrFvI8IFDZ2Xz2hmnVg6j2M7s1o43pHJJeR6s5YeQLZwZRKoWgYXzTJeJ0KFXySbr24
         QDlx+Wt0uWt2v1u1VW3R/yjvRYd899ZzvlXzkBi2CDRDCZN+EYUaaQskgXvBMU2B7Bg4
         /jfz9fFHx5Wg2aEKM7rQRM9jHJ5FfK8/6XCsBmv96/c15DhM7PCjaieN6GsPcG44SEJn
         ddYf1RsdxTOh4NerPePQEgJoqUfVpxkUdwhzFAXIo08ncLD4LAmWYNpw11hkXmlxY9Wl
         VCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463111; x=1790067911;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5OftSuNw6O3AgitXo4CDVX+TOcz6GDkEK6rb5ipL/z0=;
        b=DBjtFnZya6aWBNRNeo75GQ2rnF9Nq6PlXPZoqJ0gVxsTUBCJ2KsGeNIuxtLWCY3EEA
         OJDNZb4S+0wk/jECb5ihMyDsiWfpch6orr4PkN2T4nEdEzDb4lovOoaIYB0FMAOzfM0r
         lx5t64ZmK+Prk2NX7iw9X+/ZIdmfSKUrDqrsLaXR/9UapZmUhfsN8SV7Ftxm4EVD1Qu6
         CifHwhx7UJTcB+au1jgR26Dg59qv/018GEyrMYVDj84SbMJ55TtTPyP2+YMn7XeR8nb6
         PK476v7aoPArDNmanYcC9h2DMYIYN4Fh4ymp1TW4fyuSeoAQtbz26nlzHuDFxylzo0WM
         n0Ug==
X-Forwarded-Encrypted: i=1; AKwUvBxk+qq0kurxTgPbE3sV/2ymWi5bpBFu90oro8SXZJSZu0U0VS6opGyngsbUj4DsWrNWmRvG@lists.linux.dev
X-Gm-Message-State: AFuF++nd6rLt1PeN6hPO+F79qKrp72xKVGK4qavy9QOFb71dIZ4oTb6b
	yDbCpa0rgkg2fv3Ong0x81BNVBB7xBxc1mmX9owlDMnzlO0jijLf8VXf
X-Gm-Gg: AYBFou28GrzJytQRAC507FlL8Iwde7MbZ15hs4TYjJNkMz9XlrUKCExODVR7AZgdIk1
	HekkTpA65zXwOb9D6WQr0bXAMW4zfzYfB03mergzmUypZCtWKpZx7sezZdqUkmsNafRVarGYUaZ
	F35BKioTpTp7yi4ch9JDJtibcdGjBHRtXpUDgufeb6vkZaCAxHplGw6D157br7wz9mD6MN5rp+v
	2VUQuMmR0YMgAtLmk24aRvf1ZkUDuUdq7DzPW7VkaCgv9lsQ2Rc6yQECcTLUMZ3zAV2H4AGiTrK
	RVEXkhd8iCxz4ooQjjCQ+6qTdtg5TLcD3KfHuO2X26rzNa1QyN5pJZVY8Og4S3ESYu1bEFhWd7i
	KYRNOOpZyUCNyW6U6a1Etjx3YvTfdDgvz2zJOcwmozAiXaEPbiFs+Zr+VMgr7ejqoo+D+o6f/ta
	z8nGTReoJfOCBTozGy5bXy+hOYWHBEmLqnkdYyL4QAeD1yoP3/w8LwXAlftKsgJFg5sNQD0wcXS
	kapdopu8JbJSs2QePvcw+sAKUAm0Jp+5tebNVDOjGg85PlAiH+6
X-Received: by 2002:a05:6a21:920e:b0:3da:f21a:23ca with SMTP id adf61e73a8af0-3dd52a2a52bmr559662637.22.1789463111413;
        Tue, 15 Sep 2026 02:05:11 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65a8120sm6495512a12.30.2026.09.15.02.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:05:10 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	mkchauras@gmail.com,
	ynorov@nvidia.com,
	david@davidgow.net,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 0/2] powerpc: Add ARCH_WARN_ASM and KUnit tests for Rust WARN() support
Date: Tue, 15 Sep 2026 14:34:51 +0530
Message-ID: <20260915090453.1227034-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

powerpc currently has no ARCH_WARN_ASM or ARCH_WARN_REACHABLE definitions,
which causes Rust kernel builds on powerpc to fail with a macro expansion
error when the generic Rust WARN() infrastructure tries to call
ARCH_WARN_ASM() through generated_arch_warn_asm.rs.S. Every other
architecture that supports Rust (x86, arm64, s390, riscv) already provides
these definitions. This series brings powerpc into line.

Patch 1 refactors _EMIT_BUG_ENTRY in arch/powerpc/include/asm/bug.h.
The old macro was a positional-operand template that hardcoded the 1b
label reference and embedded .org/.previous directives, making it
impossible to compose as a free string outside an asm operand context.
The refactored version takes explicit (label, file, line, flags) arguments
via string concatenation; .org/.previous are moved to each call site so
BUG_ENTRY() can continue to pass sizeof(struct bug_entry) as an asm
operand while ARCH_WARN_ASM supplies its own size string. With
_EMIT_BUG_ENTRY composable as a plain string, adding ARCH_WARN_ASM and
ARCH_WARN_REACHABLE is then straightforward.

Patch 2 adds five KUnit tests under CONFIG_RUST_BUG_POWERPC_KUNIT_TEST
(depends on PPC && GENERIC_BUG, covering both ppc32 and ppc64) that
verify the __bug_table entry emitted by ARCH_WARN_ASM is correctly
formed. find_bug() is called with the exact virtual address of the twi
instruction, captured at link time via a .dc.a relocation in a
global_asm! block. .dc.a emits a pointer-width word (4 bytes on ppc32,
8 bytes on ppc64); BUG_KUNIT_TRAP_ADDR is declared as usize on the Rust
side so the same test code is correct on both. The five tests check that
the entry is found, carries BUGFLAG_WARNING, records the right source
file and a non-zero line number, and that the trap address lies in
kernel text.

The global_asm! block is split into four cfg-gated variants covering all
combinations of CONFIG_PPC64 x CONFIG_DEBUG_BUGVERBOSE. The split on
CONFIG_DEBUG_BUGVERBOSE is necessary because when it is disabled,
_EMIT_BUG_ENTRY drops the file and line fields from the bug table entry,
leaving the {file} and {line} global_asm! operands unused — which is a
hard compile error in Rust. The split on CONFIG_PPC64 is necessary
because concat!() only accepts literals (not expressions), so .balign
4 vs .balign 8 must be selected statically.

Changelog:
V4 -> V5:
 - Fixed a build error with DEBUG_BUGVERBOSE=n
 - Added a label for bug entry
V4: https://lore.kernel.org/all/20260912065902.24017-1-mkchauras@gmail.com/

V3 -> V4:
 - Fix Label with appending b at end 
 - Add KUnit test patch.
 - Tested on ppc64le pseries:
   pass:5 fail:0 skip:0.
 - Tested on ppc32 QEMU mac99 G4:
   pass:5 fail:0 skip:0.
 - Tested on ppc64le QEMU pseries:
   pass:5 fail:0 skip:0.
V3: https://lore.kernel.org/all/20260910100801.2159785-2-mkchauras@gmail.com

V2 -> V3:
 - Add label argument in _EMIT_BUG_ENTRY
V2: https://lore.kernel.org/all/20260910071252.1950488-2-mkchauras@gmail.com

V1 -> V2:
- commit message now has error, fixes tag and closes tag
V1: https://lore.kernel.org/all/20260819084825.969116-1-mkchauras@gmail.com

Mukesh Kumar Chaurasiya (IBM) (2):
  powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust
    support
  rust: kernel: Add KUnit tests for powerpc ARCH_WARN_ASM bug table
    emission

 arch/powerpc/include/asm/bug.h |  36 ++++---
 rust/kernel/Kconfig.test       |  13 +++
 rust/kernel/bug.rs             | 222 +++++++++++++++++++++++++++++++++
 3 files changed, 251 insertions(+), 16 deletions(-)

-- 
2.55.0
