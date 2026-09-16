Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2968950C284
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 14:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568482; cv=none; b=dVgFU7ECpAwDe/2Wk9aKYlYGdmNiv7DmAaghTDvuPZzqzGxQ7aYCnD0E4wXqPN2LqkpBTN2F14D6uUaAtKhBSaJsWLsAeW/lmUGtJUdkwAPffk6qrigxmQeIHnnPgEQWPm7E1EV0Zj2svNOQ9+P2/+vWrB9ys05yZpI4ScQIm9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568482; c=relaxed/simple;
	bh=c1EiGq1tPPNgiSwecQ3o0q2poq2y5FMhzPdU/yDl6wM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=obBbdp7aRi5xGpwxR6xITr1c8YQsJgnjzIF7fYMP0QU440ER1f6Ofup1PRbpxEym/gFjwVb3Rlq2zjypXscKHlunpoxPRsD5XVsXxX1Y/A6c+Zxm+fpJmpBDkze2vXntynkuY1J2gucQMG8rl8oLnvLCf/GkdaQi8hlm8BTJRTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id A63BF1EABAE; Wed, 16 Sep 2026 22:21:11 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 169211EABAA;
	Wed, 16 Sep 2026 22:21:04 +0800 (AWST)
Message-ID: <236f1c15-9532-405a-818d-9bf52349f25a@davidgow.net>
Date: Wed, 16 Sep 2026 22:21:00 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 2/2] rust: kernel: Add KUnit tests for powerpc
 ARCH_WARN_ASM bug table emission
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 ynorov@nvidia.com, joelagnelf@nvidia.com, fujita.tomonori@gmail.com,
 linkmauve@linkmauve.fr, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev
References: <20260915090453.1227034-1-mkchauras@gmail.com>
 <20260915090453.1227034-3-mkchauras@gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260915090453.1227034-3-mkchauras@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 15/09/2026 à 17:04, Mukesh Kumar Chaurasiya (IBM) a écrit :
> Verify that the __bug_table entry emitted by ARCH_WARN_ASM has a correct
> bug_addr displacement — i.e. the '1b' label reference in _EMIT_BUG_ENTRY
> resolves to the trap instruction — by calling find_bug() with the exact
> virtual address of the twi instruction, mirroring what the real powerpc
> trap handler does.
> 
> The trap address is captured at link time via a .dc.a 1b relocation placed
> in .data by the global_asm! block. global_asm! is used instead of asm!
> because LLVM eliminates asm! blocks in dead branches; global_asm! is
> file-scope and always emitted. BUG_KUNIT_TRAP_ADDR is defined as a .global
> symbol directly on the .dc.a word so the linker relocation lands on it —
> a Rust static initialized to zero would end up in BSS where relocations are
> not applied.
> 
> .dc.a emits a pointer-width word (4 bytes on ppc32, 8 bytes on ppc64),
> so BUG_KUNIT_TRAP_ADDR is declared as usize on the Rust side, making the
> tests correct on both ppc32 and ppc64. The global_asm! block is split into
> two cfg-gated variants (CONFIG_PPC64 / !CONFIG_PPC64) to select the right
> .balign since concat!() only accepts literals.
> 
> Five tests are included in the rust_kernel_bug_powerpc suite:
> 
>    bug_entry_found         - find_bug() returns non-NULL for the trap address,
>                              proving the bug_addr displacement is correct
>    bug_entry_is_warning    - the emitted entry has BUGFLAG_WARNING set
>    bug_entry_file          - bug_get_file_line() returns the correct source
>                              file (requires CONFIG_DEBUG_BUGVERBOSE)
>    bug_entry_line          - the recorded line number is non-zero, confirming
>                              the {line} operand was substituted correctly
>                              (requires CONFIG_DEBUG_BUGVERBOSE)
>    bug_entry_addr_is_in_text - kernel_text_address() confirms the trap address
>                              lies in kernel text, not data or zero
> 
> The suite is named rust_kernel_bug_powerpc and the Kconfig option
> CONFIG_RUST_BUG_POWERPC_KUNIT_TEST depends on PPC && GENERIC_BUG,
> covering both ppc32 and ppc64.
> 
> Tested on ppc64le (ltcfujiaac-lp3, 7.3.0-rc1+): pass:5 fail:0 skip:0.
> Tested on ppc32 Book3S (QEMU mac99 G4, chrp32_defconfig): pass:5 fail:0 skip:0.
> Tested on ppc64le (QEMU pseries, pseries_le_defconfig): pass:5 fail:0 skip:0.
> 
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---

This works for me under QEMU, but I have a couple of small suggestions.

1. You should use the kernel CStr and kernel::ffi::c_* types, not the 
ones from core. This properly matches the way the kernel uses 
-funsigned-char. For any architectures where char is normally signed, 
this would fail to build. Which brings me to…

2. Why is this specific to powerpc? Shouldn't it be possible to do this 
in a way that works across more architectures? (Indeed, the current 
implementation happens to pass on x86_64 with the above fix, though more 
would be needed for other architectures, and there's probably a better 
solution overall which doesn't hardcode a special bug address.)

So this still seems like it's something worth having, but I'd much 
prefer it to not be architecture-specific if we can avoid it.

Cheers,
-- David

>   rust/kernel/Kconfig.test |  13 +++
>   rust/kernel/bug.rs       | 209 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 222 insertions(+)
> 
> diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
> index e6a5c7a795f0..5a82f0812c89 100644
> --- a/rust/kernel/Kconfig.test
> +++ b/rust/kernel/Kconfig.test
> @@ -83,4 +83,17 @@ config RUST_BITFIELD_KUNIT_TEST
>   
>   	  If unsure, say N.
>   
> +config RUST_BUG_POWERPC_KUNIT_TEST
> +	bool "KUnit tests for powerpc ARCH_WARN_ASM bug table emission" if !KUNIT_ALL_TESTS
> +	depends on PPC && GENERIC_BUG
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables KUnit tests that verify ARCH_WARN_ASM emits a
> +	  correct __bug_table entry on powerpc (both ppc32 and ppc64): the
> +	  bug_addr displacement must resolve back to the trap instruction so
> +	  that find_bug() can locate the entry — exactly as the real trap
> +	  handler does.
> +
> +	  If unsure, say N.
> +
>   endif
> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> index 3566f0234ca4..cd90bd511479 100644
> --- a/rust/kernel/bug.rs
> +++ b/rust/kernel/bug.rs
> @@ -152,3 +152,212 @@ macro_rules! warn_on {
>           cond
>       }};
>   }
> +
> +// Test-only constants and file static referenced by the global_asm block below.
> +//
> +// global_asm! is file-scope and always emitted — LLVM cannot eliminate it,
> +// unlike asm! inside a function which is subject to dead-code removal.
> +//
> +// BUG_KUNIT_TRAP_ADDR is declared as a .global symbol entirely inside the
> +// global_asm! block so the .dc.a 1b relocation lands directly on it.
> +// A Rust static initialized to zero would end up in BSS; the linker does
> +// not apply relocations to BSS, so the address would stay zero at runtime.
> +#[cfg(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST)]
> +mod test_statics {
> +    use crate::bindings::{bug_entry, BUGFLAG_WARNING, TAINT_WARN};
> +
> +    pub(super) const FLAGS: u32 = BUGFLAG_WARNING | (TAINT_WARN << 8);
> +    pub(super) const SIZE: usize = core::mem::size_of::<bug_entry>();
> +
> +    // LINE and BUG_KUNIT_FILE are only referenced by the {file}/{line}
> +    // operands in global_asm!, which are only present when
> +    // CONFIG_DEBUG_BUGVERBOSE is set (the non-verbose _EMIT_BUG_ENTRY
> +    // drops the file/line fields from the bug table entry entirely).
> +    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +    pub(super) const LINE: u32 = line!();
> +
> +    // Null-terminated source file name — the assembler references this symbol
> +    // for the verbose file pointer in __bug_table, same as warn_flags!.
> +    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +    const _FILE: &[u8] = file!().as_bytes();
> +    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +    #[no_mangle]
> +    pub(super) static BUG_KUNIT_FILE: [u8; _FILE.len() + 1] = {
> +        let mut bytes = [0u8; _FILE.len() + 1];
> +        let mut i = 0;
> +        while i < _FILE.len() {
> +            bytes[i] = _FILE[i];
> +            i += 1;
> +        }
> +        bytes
> +    };
> +}
> +
> +// Emit ARCH_WARN_ASM at file scope and capture the trap address.
> +//
> +// BUG_KUNIT_TRAP_ADDR is defined as a .global symbol right on top of the
> +// .dc.a 1b directive so the linker resolves the relocation directly into
> +// that symbol's storage — no BSS, no zero-init problem.
> +// .dc.a emits a pointer-width word (4 bytes on ppc32, 8 bytes on ppc64),
> +// matching the usize declaration on the Rust side.
> +#[cfg(all(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST, CONFIG_PPC64, CONFIG_DEBUG_BUGVERBOSE))]
> +::core::arch::global_asm!(
> +    concat!(
> +        include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> +        ".pushsection .data\n\t",
> +        ".balign 8\n\t",
> +        ".global BUG_KUNIT_TRAP_ADDR\n\t",
> +        "BUG_KUNIT_TRAP_ADDR:\n\t",
> +        ".dc.a 1b\n\t",
> +        ".popsection\n",
> +    ),
> +    file  = sym test_statics::BUG_KUNIT_FILE,
> +    line  = const test_statics::LINE,
> +    flags = const test_statics::FLAGS,
> +    size  = const test_statics::SIZE,
> +);

It'd be really nice to use the warn_flags!() macro here (or even all of 
warn_on!() instead of hardcoding a separate implementation here. But 
even if we can't (due, e.g., to the need for global_asm! vs asm!), it'd 
be nice if this were more similar to the warn_flags!() implementation. 
Not only would that reduce the likelihood of these deviating needlessly, 
but it'd better support more architectures, too.

For example, the commented "{size}" would help on architectures where 
size isn't needed.

> +
> +#[cfg(all(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST, CONFIG_PPC64, not(CONFIG_DEBUG_BUGVERBOSE)))]
> +::core::arch::global_asm!(
> +    concat!(
> +        include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> +        ".pushsection .data\n\t",
> +        ".balign 8\n\t",
> +        ".global BUG_KUNIT_TRAP_ADDR\n\t",
> +        "BUG_KUNIT_TRAP_ADDR:\n\t",
> +        ".dc.a 1b\n\t",
> +        ".popsection\n",
> +    ),
> +    flags = const test_statics::FLAGS,
> +    size  = const test_statics::SIZE,
> +);
> +
> +#[cfg(all(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST, not(CONFIG_PPC64), CONFIG_DEBUG_BUGVERBOSE))]
> +::core::arch::global_asm!(
> +    concat!(
> +        include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> +        ".pushsection .data\n\t",
> +        ".balign 4\n\t",
> +        ".global BUG_KUNIT_TRAP_ADDR\n\t",
> +        "BUG_KUNIT_TRAP_ADDR:\n\t",
> +        ".dc.a 1b\n\t",
> +        ".popsection\n",
> +    ),
> +    file  = sym test_statics::BUG_KUNIT_FILE,
> +    line  = const test_statics::LINE,
> +    flags = const test_statics::FLAGS,
> +    size  = const test_statics::SIZE,
> +);
> +
> +#[cfg(all(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST, not(CONFIG_PPC64), not(CONFIG_DEBUG_BUGVERBOSE)))]
> +::core::arch::global_asm!(
> +    concat!(
> +        include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> +        ".pushsection .data\n\t",
> +        ".balign 4\n\t",
> +        ".global BUG_KUNIT_TRAP_ADDR\n\t",
> +        "BUG_KUNIT_TRAP_ADDR:\n\t",
> +        ".dc.a 1b\n\t",
> +        ".popsection\n",
> +    ),
> +    flags = const test_statics::FLAGS,
> +    size  = const test_statics::SIZE,
> +);
> +
> +#[cfg(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST)]
> +#[::kernel::macros::kunit_tests(rust_kernel_bug_powerpc)]
> +mod tests {
> +    use crate::bindings;
> +
> +    fn trap_addr() -> usize {
> +        // BUG_KUNIT_TRAP_ADDR is a .global symbol defined in the global_asm!
> +        // block above, placed in .data at the exact .dc.a 1b relocation word.
> +        // The linker resolves it to the virtual address of the twi instruction
> +        // before any Rust code runs, so reading it here is always safe.
> +        extern "C" {
> +            // .dc.a emits a pointer-width word: 4 bytes on ppc32, 8 on ppc64.
> +            // usize matches the native pointer width on both.
> +            static BUG_KUNIT_TRAP_ADDR: usize;
> +        }
> +        // SAFETY: read-only after link time, no concurrent mutation possible.
> +        unsafe { BUG_KUNIT_TRAP_ADDR }
> +    }
> +
> +    /// The `__bug_table` entry emitted by `ARCH_WARN_ASM` must be locatable
> +    /// via `find_bug()` using the trap instruction's address.  A NULL result
> +    /// means the `1b` label reference in `_EMIT_BUG_ENTRY` resolved to the
> +    /// wrong address and the real trap handler would not recognise the site.
> +    #[test]
> +    fn bug_entry_found() {
> +        // Non-zero proves the .dc.a relocation was resolved by the linker.
> +        assert!(trap_addr() != 0);
> +
> +        // SAFETY: find_bug() is always safe to call with any address; it
> +        // simply walks __bug_table and returns NULL if nothing matches.
> +        let entry = unsafe { bindings::find_bug(trap_addr()) };
> +        // Non-NULL proves the bug_addr displacement in _EMIT_BUG_ENTRY is correct.
> +        assert!(!entry.is_null());
> +    }
> +
> +    /// The emitted entry must be flagged as a warning (not a hard BUG).
> +    #[test]
> +    fn bug_entry_is_warning() {
> +        assert!(trap_addr() != 0);
> +        let entry = unsafe { bindings::find_bug(trap_addr()) };
> +        assert!(!entry.is_null());
> +        // SAFETY: entry is non-null and points to a valid bug_entry.
> +        let flags = unsafe { (*entry).flags } as u32;
> +        assert!(flags & bindings::BUGFLAG_WARNING != 0);
> +    }
> +
> +    /// With `CONFIG_DEBUG_BUGVERBOSE` the entry must record a non-null file
> +    /// pointer pointing back into this source file.
> +    #[test]
> +    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +    fn bug_entry_file() {
> +        use core::ffi::CStr;

Please don't use core::ffi::* in the kernel. The kernel provides its own 
CStr and c_char implementations. Otherwise, this can lead to issues as 
the kernel builds with -funsigned-char, but core::ffi will use the 
architecture default.

> +
> +        assert!(trap_addr() != 0);
> +        let entry = unsafe { bindings::find_bug(trap_addr()) };
> +        assert!(!entry.is_null());
> +
> +        let mut file_ptr: *const core::ffi::c_char = core::ptr::null();

Again, core::ffi::c_char should be avoided in kernel code. Use 
[kernel::]ffi:c_char

> +        let mut line: u32 = 0;
> +        // SAFETY: entry is non-null and valid; file_ptr and line are local
> +        // variables passed as out-parameters.
> +        unsafe { bindings::bug_get_file_line(entry, &mut file_ptr, &mut line) };
> +
> +        assert!(!file_ptr.is_null());
> +        // SAFETY: file_ptr is a null-terminated C string from BUG_KUNIT_FILE.
> +        let file_str = unsafe { CStr::from_ptr(file_ptr) }.to_str().unwrap_or("");
> +        assert!(file_str.contains("bug"));
> +    }
> +
> +    /// With `CONFIG_DEBUG_BUGVERBOSE` the recorded line number must be
> +    /// non-zero (a zero line would mean the asm operand was not substituted).
> +    #[test]
> +    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +    fn bug_entry_line() {
> +        assert!(trap_addr() != 0);
> +        let entry = unsafe { bindings::find_bug(trap_addr()) };
> +        assert!(!entry.is_null());
> +
> +        let mut file_ptr: *const core::ffi::c_char = core::ptr::null();

And again.

> +        let mut line: u32 = 0;
> +        // SAFETY: entry is non-null and valid.
> +        unsafe { bindings::bug_get_file_line(entry, &mut file_ptr, &mut line) };
> +
> +        assert!(line != 0);
> +    }
> +
> +    /// The trap address stored in `__bug_table` must lie within the kernel
> +    /// text segment.  If the label reference in `_EMIT_BUG_ENTRY` resolved
> +    /// to data or zero, `kernel_text_address()` would return false.
> +    #[test]
> +    fn bug_entry_addr_is_in_text() {
> +        assert!(trap_addr() != 0);
> +        // SAFETY: kernel_text_address() is always safe to call with any addr.
> +        let in_text = unsafe { bindings::kernel_text_address(trap_addr()) };
> +        assert!(in_text != 0);
> +    }
> +}

