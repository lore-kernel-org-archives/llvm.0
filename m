Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388E336B05C
	for <llvm@lists.linux.dev>; Sat, 12 Sep 2026 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196361; cv=none; b=q218yXV5E/U4pRnd0UxNi077f006lK/pZyKj5C6w7ilDigIOkH/YDe6H1xIwNPaI5V9/v8ZM1z5hayPvInBsaXGYAwx0nF59U8xauOpMHu+G6J4ki53zhCtwCTRaCVi+ZuKyD/POTwkDsXrlrFugTXwvttcRJs00tqrLT7CdlyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196361; c=relaxed/simple;
	bh=k5hpwsx+B1BmldwynOEu3ZO95bo2YrG+JYXgr8Zs1C0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sXyr6bPuhGc/9oCIrQbjyvdkMlEzJXNINSUuttv0GZTJt6bAbqHFZFZP/0LAnbz05vg4OY3CVGPfi9NNQS/95yILf7WMJ/nV6O5TkgOyyAPpiNcOR1oP2Z86gNql9kiF8o7XmQ58d72bI1bjOlqsLGExInjC/dcpw3hgmQi99x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgznMHTK; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgznMHTK"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so2419129a91.0
        for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 23:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196359; x=1789801159; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPtC1KNwT+749TftCz7aP1Y3qEPtVYfk7lU7EbxfQRo=;
        b=MgznMHTKfHu4cEWEaCunkWQd73vAB15Bjl/a47h+YAaHdTBY1Nw90f82kTtCwS8L6E
         mXnYYpk1copEYJDlRd9jifVmzt0uAqvtJwWixzJo0eTKSl541VPqNiN5kaNY8X4876vY
         dqLWEO4q8+lvJWwOiInZ5isvDHvkeU5FfEFiqDY4zNLsU1oxngK3V0o5KuvIBj25YRc4
         4v0clvzUBQr9/Ynvaiz8+5gLM3T2xE8dC/goFy6k/K/cVdAQbmjiyIFi8+qp8fLN/a3v
         sT4ECnuwlqst3H4Sg9hzx68pVY5XOrLwAlfuCVGistDhPig2XN81U99I4J2CxRzQt8Om
         Nk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196359; x=1789801159;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPtC1KNwT+749TftCz7aP1Y3qEPtVYfk7lU7EbxfQRo=;
        b=eTvxe6Ks5GkgFdzivMSYdkWqxELUgCY1qBC/1CnH4pmP0aAkYm4VqZhQ4+gQ4bzlUE
         JpVSKDQqIAs6SMROaOaaEWn03aDnSpRSs1OAZtQmJ2A8O+1XI+d86e7v/Zcac2w6/2Gc
         jXKIJFR2YtIguCc4Jh+uSFMAcQguJwjtae7Enp3GRCutsmvXmEA890I8gMcOHX/hasvE
         hZ221c7hP6+ihe9hsrBNR0c9WZgsPgYJLW7VtVS6A7hQYaZZGDeJrjuF/snOdfmZS/xx
         qQjyjqo4aM8RCAS8u7FvnXSWjuolvEKiJnch0Do/Y1ZGrLwFFqaluvFE+K4619rPEsvA
         8kqQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4d6L5BPHzCIjwALnW+7ABLK78a0DsdYHre5PiZMWp/1uxN3nEqvfDOS/eqNgm6awGmGgt@lists.linux.dev
X-Gm-Message-State: AFuF++nxPCkqIQv9AgoXi9XHxzP2EjRvZ0DVO20E59wPRHiTdeF99Kl9
	sQ6SL4t96sjEYgT06W/m8rStUzkrcImjQs7PU28a+it80XJVp2jIuX4A
X-Gm-Gg: AYBFou1BcPPLh6ZRZ9f/JIZsXV0axE3WFTww7dF8BXoMfCzHXVA2m0deEqQr+swxW/F
	Ec4cajXgegjL0wwr6dVjkWiOqVz8GVQEBaxr/OkJ0c4eJeKq13rmnGrD5J+PCwOY1/3398DSLHh
	hOwqmPmUlzZAcnLdTYS0q9XkhfAG/zaMsG646KqV+u1eqNFaExfYSIV/cB4TOvk+z0AJ0o9KqDW
	+p7PFDYs4zaIxMbofA1PoiBcotlniZD8hqE9VoayaOkhpfTQRoYBk9ZanxQ2RxRxzXO6wDa3xo+
	dWgBI1tiCznsX/s5BJUmElsc5OYpl7xZ+5IFKbsobr06/+zElZvv6H+3r7nrfC30uaVDCHjb+gK
	UuCS8Cp0sLm6MZvmcxmDfMcojs/Ffl5ylBYZyXTKarnBY7Pjtay/1lc+e/Mz6MvnsDS4qlPxCDb
	Br8KyQwAHZeVfmuzyw5tawDu6pXGidzYekE4mIegeAmLW6pAzwJUJX1Ew9kRT+rrt8qWzUg//rJ
	fA44EDQKNq1vzczU3bddICPspda84aj7hs73uE4LqkW3g==
X-Received: by 2002:a17:90b:2d82:b0:39d:6c95:7e4 with SMTP id 98e67ed59e1d1-39d77d205f7mr15936166a91.31.1789196359477;
        Fri, 11 Sep 2026 23:59:19 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm10777777c88.8.2026.09.11.23.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:59:19 -0700 (PDT)
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
	ecourtney@nvidia.com,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v4 0/2] powerpc: Add ARCH_WARN_ASM and KUnit tests for Rust WARN() support
Date: Sat, 12 Sep 2026 12:29:00 +0530
Message-ID: <20260912065902.24017-1-mkchauras@gmail.com>
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

Changelog:
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
 rust/kernel/bug.rs             | 171 +++++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+), 16 deletions(-)

-- 
2.55.0
