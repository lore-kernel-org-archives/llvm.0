Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF6E37AA91
	for <llvm@lists.linux.dev>; Sat, 12 Sep 2026 06:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196387; cv=none; b=Yrv4ygU/gYy6S8urWLPKK1D1OdvbkrhLljTfyxvxWFqcNWqjzs2pLVTcFsIEYCWSEzgcy5vVf53WBVxM0kHj+UK2YjaiJZss4joZfFmATrvi4MTZ4He3Uf4iBDqIbgMM/xr0H+RjKhP+YgIDMyv4AonCAMQn/H9FuuDusGB2n0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196387; c=relaxed/simple;
	bh=BD08R8Sa4D4ClCOUP4lcnJAg26ODnIk2NBjsrklw5rc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ILzWiqjL3kksylr66v1Z4SW0XWjcddhkj2j3dW7LB18+PNZbDEKuxCgN4HEVaualPKGiO3St94nwSrLxW7UzfnPLUZTkt01b/kOfV85zq7QWep9RhD+5ELL97iXbA6ZcCsqPZHNBm9WTeyrb8NK038VcGC7D7soEDt9aG/3uYNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r3+a0LlF; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3+a0LlF"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1734010a91.3
        for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 23:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196385; x=1789801185; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQBQeHY/m2oxf/tBIxLoCVyblcJokzqcMJJjpX+vwvU=;
        b=r3+a0LlFMMyOQrk9Zw8n2wdUNNMjx8fAIhJ+w4K9/IMDMZjg4WQ0lpgtFJpQHfP7vV
         qaywjo2+gCoLsFpsAgft2b0CyLU4F5EjaII1teD/8BPcbTKV9b4Xu2wO3y95E355dh/d
         raCRfXToc4SPidM6fUKSQFK2PkNt2Xh0Kd/aPCoQilUyt0ioYCrYst+RvaDibw56clXw
         BmJCsMfzEcWJAT7lUT/jSiO2OgY7ewwqChf/1gmE9t5xhRcb6AlLK+CP+7ZVvoSneZqL
         hv3vdnxmvctXkw3th5isXRRwTsHdA4aH9QZn43uPncY+acxR2VXRmdTU+/rrC63Xp2o/
         2ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196385; x=1789801185;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQBQeHY/m2oxf/tBIxLoCVyblcJokzqcMJJjpX+vwvU=;
        b=OpiGnpjGYjP+ujceS+dg4QgYPcWFPlWDHXszl7YXt+wIApcR//6KTOJQKgt3M4ib6E
         Cqhd4LU3rYz3ZrBPbJgA17hkUHZfEhQrTUgyrDPH/dHrxiEJDzHukfqoprNN+62oQUx5
         1EhXyRMM105hr1D+4fVgTaP74IWAFlMuCODoxUC8xk5o0hWGBOB5Pc5RHiAXNMZswu9T
         vVWh/cejsvBsrjQJwt+gUugGvnQ0TP3eaSWzy8zp0YEmL1J3gHI0YZ4YH+MLh0MQFbmj
         lExPgMxEQx2OKNDaOZE2FtWb42dTlk1OUSE8TD6Kp/M8Wpo47bVswgGYhkbFjinIWeH+
         khHg==
X-Forwarded-Encrypted: i=1; AKwUvBxeLUSTf0hyHTG3t6ZJwWkShWA4JtC9zY3VLobL8pKb0HIAWhDCzul00asKepXcK0THRh5g@lists.linux.dev
X-Gm-Message-State: AFuF++lnKfip3S9ic/jv/TCP/tIpwzXM7J5PKoXY1QE/xkLexVvJGHB0
	1Q3dL4nGS+9EC4IHiC8SEZkOlyF4Tg6IFYrvzj52pE6Ge4n0RrXM9XgS
X-Gm-Gg: AYBFou0l9GJZm/mcPtg4fgDAnryEL/tiQuXWXqkflGVURh+vRIICcc6Ia+a7QacUEvx
	87iHUk7kFR+eS5mrmxjMhCO7mK26IVWB2GrKJJv2B+oKkok3uqmfcqwjJHuPAQl4U1G4zUm5rZN
	GR228EUH4UyuGBAqSFFk8zRhqu0iaIjvtab/ZWFBb4rxEm3ZUnmCoRkXZTYFZpZb4vHkd1+urUa
	NFFhZLJysNLgzqQXW3Cd/6HZDJGFFv0jGQ7JKh3X8Vs1Ld2hYg1RUpo/ghhy4mK1lvCpVUF4Xtw
	qzlzHDDsPb6HmMHz16VF8XmnLpAi4EAms1jBbnI0G1XlbPdSvnE06wrYuM7gioa1QtvTWS2r9OA
	EucdOr6JViI59hDUy82EQ7BOqn45Rb9/V6WosbSIPggRRM2tlcZtfwAKQO5Lf/Qbm4PPOh/fZbQ
	M6DuAon5xSakuv8rUa58vrvMbcKCgdDjV9vnJU86zBwca51b1/iTLkrLL2dmk/2iBuLOcflC8Ba
	yG1wvHgoz4mzE4f6puu6cinxLPQPPI8pIyXRp1AECKU7w==
X-Received: by 2002:a17:90b:2689:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39d9bbc81damr13190186a91.1.1789196384673;
        Fri, 11 Sep 2026 23:59:44 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm10777777c88.8.2026.09.11.23.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:59:44 -0700 (PDT)
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
Subject: [PATCH v4 2/2] rust: kernel: Add KUnit tests for powerpc ARCH_WARN_ASM bug table emission
Date: Sat, 12 Sep 2026 12:29:02 +0530
Message-ID: <20260912065902.24017-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912065902.24017-1-mkchauras@gmail.com>
References: <20260912065902.24017-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Verify that the __bug_table entry emitted by ARCH_WARN_ASM has a correct
bug_addr displacement — i.e. the '1b' label reference in _EMIT_BUG_ENTRY
resolves to the trap instruction — by calling find_bug() with the exact
virtual address of the twi instruction, mirroring what the real powerpc
trap handler does.

The trap address is captured at link time via a .dc.a 1b relocation placed
in .data by the global_asm! block. global_asm! is used instead of asm!
because LLVM eliminates asm! blocks in dead branches; global_asm! is
file-scope and always emitted. BUG_KUNIT_TRAP_ADDR is defined as a .global
symbol directly on the .dc.a word so the linker relocation lands on it —
a Rust static initialized to zero would end up in BSS where relocations are
not applied.

.dc.a emits a pointer-width word (4 bytes on ppc32, 8 bytes on ppc64),
so BUG_KUNIT_TRAP_ADDR is declared as usize on the Rust side, making the
tests correct on both ppc32 and ppc64. The global_asm! block is split into
two cfg-gated variants (CONFIG_PPC64 / !CONFIG_PPC64) to select the right
.balign since concat!() only accepts literals.

Five tests are included in the rust_kernel_bug_powerpc suite:

  bug_entry_found         - find_bug() returns non-NULL for the trap address,
                            proving the bug_addr displacement is correct
  bug_entry_is_warning    - the emitted entry has BUGFLAG_WARNING set
  bug_entry_file          - bug_get_file_line() returns the correct source
                            file (requires CONFIG_DEBUG_BUGVERBOSE)
  bug_entry_line          - the recorded line number is non-zero, confirming
                            the {line} operand was substituted correctly
                            (requires CONFIG_DEBUG_BUGVERBOSE)
  bug_entry_addr_is_in_text - kernel_text_address() confirms the trap address
                            lies in kernel text, not data or zero

The suite is named rust_kernel_bug_powerpc and the Kconfig option
CONFIG_RUST_BUG_POWERPC_KUNIT_TEST depends on PPC && GENERIC_BUG,
covering both ppc32 and ppc64.

Tested on ppc64le pSeries: pass:5 fail:0 skip:0.
Tested on ppc32 QEMU mac99 G4: pass:5 fail:0 skip:0.
Tested on ppc64le QEMU pseries: pass:5 fail:0 skip:0.

Assisted-by: LLM
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/kernel/Kconfig.test |  13 +++
 rust/kernel/bug.rs       | 171 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 184 insertions(+)

diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
index e6a5c7a795f0..5a82f0812c89 100644
--- a/rust/kernel/Kconfig.test
+++ b/rust/kernel/Kconfig.test
@@ -83,4 +83,17 @@ config RUST_BITFIELD_KUNIT_TEST
 
 	  If unsure, say N.
 
+config RUST_BUG_POWERPC_KUNIT_TEST
+	bool "KUnit tests for powerpc ARCH_WARN_ASM bug table emission" if !KUNIT_ALL_TESTS
+	depends on PPC && GENERIC_BUG
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests that verify ARCH_WARN_ASM emits a
+	  correct __bug_table entry on powerpc (both ppc32 and ppc64): the
+	  bug_addr displacement must resolve back to the trap instruction so
+	  that find_bug() can locate the entry — exactly as the real trap
+	  handler does.
+
+	  If unsure, say N.
+
 endif
diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index 3566f0234ca4..da43e62ddcdd 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -152,3 +152,174 @@ macro_rules! warn_on {
         cond
     }};
 }
+
+// Test-only constants and file static referenced by the global_asm block below.
+//
+// global_asm! is file-scope and always emitted — LLVM cannot eliminate it,
+// unlike asm! inside a function which is subject to dead-code removal.
+//
+// BUG_KUNIT_TRAP_ADDR is declared as a .global symbol entirely inside the
+// global_asm! block so the .dc.a 1b relocation lands directly on it.
+// A Rust static initialized to zero would end up in BSS; the linker does
+// not apply relocations to BSS, so the address would stay zero at runtime.
+#[cfg(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST)]
+mod test_statics {
+    use crate::bindings::{bug_entry, BUGFLAG_WARNING, TAINT_WARN};
+
+    pub(super) const FLAGS: u32 = BUGFLAG_WARNING | (TAINT_WARN << 8);
+    pub(super) const SIZE: usize = core::mem::size_of::<bug_entry>();
+    pub(super) const LINE: u32 = line!();
+
+    // Null-terminated source file name — the assembler references this symbol
+    // for the verbose file pointer in __bug_table, same as warn_flags!.
+    const _FILE: &[u8] = file!().as_bytes();
+    #[no_mangle]
+    pub(super) static BUG_KUNIT_FILE: [u8; _FILE.len() + 1] = {
+        let mut bytes = [0u8; _FILE.len() + 1];
+        let mut i = 0;
+        while i < _FILE.len() {
+            bytes[i] = _FILE[i];
+            i += 1;
+        }
+        bytes
+    };
+}
+
+// Emit ARCH_WARN_ASM at file scope and capture the trap address.
+//
+// BUG_KUNIT_TRAP_ADDR is defined as a .global symbol right on top of the
+// .dc.a 1b directive so the linker resolves the relocation directly into
+// that symbol's storage — no BSS, no zero-init problem.
+// .dc.a emits a pointer-width word (4 bytes on ppc32, 8 bytes on ppc64),
+// matching the usize declaration on the Rust side.
+#[cfg(all(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST, CONFIG_PPC64))]
+::core::arch::global_asm!(
+    concat!(
+        include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+        ".pushsection .data\n\t",
+        ".balign 8\n\t",
+        ".global BUG_KUNIT_TRAP_ADDR\n\t",
+        "BUG_KUNIT_TRAP_ADDR:\n\t",
+        ".dc.a 1b\n\t",
+        ".popsection\n",
+    ),
+    file  = sym test_statics::BUG_KUNIT_FILE,
+    line  = const test_statics::LINE,
+    flags = const test_statics::FLAGS,
+    size  = const test_statics::SIZE,
+);
+
+#[cfg(all(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST, not(CONFIG_PPC64)))]
+::core::arch::global_asm!(
+    concat!(
+        include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+        ".pushsection .data\n\t",
+        ".balign 4\n\t",
+        ".global BUG_KUNIT_TRAP_ADDR\n\t",
+        "BUG_KUNIT_TRAP_ADDR:\n\t",
+        ".dc.a 1b\n\t",
+        ".popsection\n",
+    ),
+    file  = sym test_statics::BUG_KUNIT_FILE,
+    line  = const test_statics::LINE,
+    flags = const test_statics::FLAGS,
+    size  = const test_statics::SIZE,
+);
+
+#[cfg(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST)]
+#[::kernel::macros::kunit_tests(rust_kernel_bug_powerpc)]
+mod tests {
+    use crate::bindings;
+
+    fn trap_addr() -> usize {
+        // BUG_KUNIT_TRAP_ADDR is a .global symbol defined in the global_asm!
+        // block above, placed in .data at the exact .dc.a 1b relocation word.
+        // The linker resolves it to the virtual address of the twi instruction
+        // before any Rust code runs, so reading it here is always safe.
+        extern "C" {
+            // .dc.a emits a pointer-width word: 4 bytes on ppc32, 8 on ppc64.
+            // usize matches the native pointer width on both.
+            static BUG_KUNIT_TRAP_ADDR: usize;
+        }
+        // SAFETY: read-only after link time, no concurrent mutation possible.
+        unsafe { BUG_KUNIT_TRAP_ADDR }
+    }
+
+    /// The `__bug_table` entry emitted by `ARCH_WARN_ASM` must be locatable
+    /// via `find_bug()` using the trap instruction's address.  A NULL result
+    /// means the `1b` label reference in `_EMIT_BUG_ENTRY` resolved to the
+    /// wrong address and the real trap handler would not recognise the site.
+    #[test]
+    fn bug_entry_found() {
+        // Non-zero proves the .dc.a relocation was resolved by the linker.
+        assert!(trap_addr() != 0);
+
+        // SAFETY: find_bug() is always safe to call with any address; it
+        // simply walks __bug_table and returns NULL if nothing matches.
+        let entry = unsafe { bindings::find_bug(trap_addr()) };
+        // Non-NULL proves the bug_addr displacement in _EMIT_BUG_ENTRY is correct.
+        assert!(!entry.is_null());
+    }
+
+    /// The emitted entry must be flagged as a warning (not a hard BUG).
+    #[test]
+    fn bug_entry_is_warning() {
+        assert!(trap_addr() != 0);
+        let entry = unsafe { bindings::find_bug(trap_addr()) };
+        assert!(!entry.is_null());
+        // SAFETY: entry is non-null and points to a valid bug_entry.
+        let flags = unsafe { (*entry).flags } as u32;
+        assert!(flags & bindings::BUGFLAG_WARNING != 0);
+    }
+
+    /// With `CONFIG_DEBUG_BUGVERBOSE` the entry must record a non-null file
+    /// pointer pointing back into this source file.
+    #[test]
+    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+    fn bug_entry_file() {
+        use core::ffi::CStr;
+
+        assert!(trap_addr() != 0);
+        let entry = unsafe { bindings::find_bug(trap_addr()) };
+        assert!(!entry.is_null());
+
+        let mut file_ptr: *const core::ffi::c_char = core::ptr::null();
+        let mut line: u32 = 0;
+        // SAFETY: entry is non-null and valid; file_ptr and line are local
+        // variables passed as out-parameters.
+        unsafe { bindings::bug_get_file_line(entry, &mut file_ptr, &mut line) };
+
+        assert!(!file_ptr.is_null());
+        // SAFETY: file_ptr is a null-terminated C string from BUG_KUNIT_FILE.
+        let file_str = unsafe { CStr::from_ptr(file_ptr) }.to_str().unwrap_or("");
+        assert!(file_str.contains("bug"));
+    }
+
+    /// With `CONFIG_DEBUG_BUGVERBOSE` the recorded line number must be
+    /// non-zero (a zero line would mean the asm operand was not substituted).
+    #[test]
+    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+    fn bug_entry_line() {
+        assert!(trap_addr() != 0);
+        let entry = unsafe { bindings::find_bug(trap_addr()) };
+        assert!(!entry.is_null());
+
+        let mut file_ptr: *const core::ffi::c_char = core::ptr::null();
+        let mut line: u32 = 0;
+        // SAFETY: entry is non-null and valid.
+        unsafe { bindings::bug_get_file_line(entry, &mut file_ptr, &mut line) };
+
+        assert!(line != 0);
+    }
+
+    /// The trap address stored in `__bug_table` must lie within the kernel
+    /// text segment.  If the label reference in `_EMIT_BUG_ENTRY` resolved
+    /// to data or zero, `kernel_text_address()` would return false.
+    #[test]
+    fn bug_entry_addr_is_in_text() {
+        assert!(trap_addr() != 0);
+        // SAFETY: kernel_text_address() is always safe to call with any addr.
+        let in_text = unsafe { bindings::kernel_text_address(trap_addr()) };
+        assert!(in_text != 0);
+    }
+}
-- 
2.55.0

