Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF55E288DA
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 22:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743631979; cv=none; b=Apvg/iyrBMLbs3hLzRh+lUMIu+DhFsUJF50dlchkVsKTzH+JGOHsZPwDnJCaDVyJq91DfOj3If289SaesZQZtO3hTA3mV7zP2S79neal/GhoJkpgL3p7syO+6tMXbKGbzgRsqtjThtQTijHUd0qAk+GMx3zbB+4PRodhXILv4Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743631979; c=relaxed/simple;
	bh=N/S8OOVe5xr0/JnHBpC5RJRQZwys6OonPMJLX3WhJj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQCW0MvGPbzV5JFfkUd5j9P+nfadobNrRTeuV/MVDjg2PF2hJTwZo8BvIrJM8nMRBp7s0+PpGHYldu2fJH01EoRSf9ZtPCsSgPz9WAY7EYXEYNrWxwUv9pGSzJa2eWJ/43pRZRfIDNTp/nUyER2HsQ+QMmDcPoiryMIX9UEsUP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fiy+mxX+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fiy+mxX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EDFC4CEDD;
	Wed,  2 Apr 2025 22:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743631978;
	bh=N/S8OOVe5xr0/JnHBpC5RJRQZwys6OonPMJLX3WhJj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fiy+mxX+hhBs5FqFfXJaHRcWD9ajsOx3kXV9VPHwm/Q3U2YAlilM9/gfXksAHfX0f
	 tyIqKU7ehuhAFmxSvGqdAtYHtZ/QgZ9jJZZX2HwzFRfm3Y1NRTTYHpJllFLTyKmYJF
	 QV/ZdAd8lt0ag0UqmDWm2SN8cAT9A4pZekRVDnk/iofuqKDDQh3//4gJnRM9jdBRMo
	 RKqlRgkxKVkvl37yX82uzHjaTeedqPtd7O24WDbMDc/XKryc5qag6S6yLRY0okJm76
	 jM4bzfV5BMSFFZdwb1VW6eCOcTsDiAySKIT7IU4QJx/xJmr8bWzjCV0xjjVSw0rcFI
	 fW/9xjxPfj8FQ==
Date: Wed, 2 Apr 2025 15:12:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: linux-um@lists.infradead.org, Johannes Berg <johannes.berg@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] um: mark rodata read-only and implement _nofault
 accesses
Message-ID: <20250402221254.GA384@ax162>
References: <20250210160926.420133-1-benjamin@sipsolutions.net>
 <20250210160926.420133-2-benjamin@sipsolutions.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210160926.420133-2-benjamin@sipsolutions.net>

Hi Benjamin and Johannes,

On Mon, Feb 10, 2025 at 05:09:25PM +0100, Benjamin Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
> 
> Mark read-only data actually read-only (simple mprotect), and
> to be able to test it also implement _nofault accesses. This
> works by setting up a new "segv_continue" pointer in current,
> and then when we hit a segfault we change the signal return
> context so that we continue at that address. The code using
> this sets it up so that it jumps to a label and then aborts
> the access that way, returning -EFAULT.
> 
> It's possible to optimize the ___backtrack_faulted() thing by
> using asm goto (compiler version dependent) and/or gcc's (not
> sure if clang has it) &&label extension, but at least in one
> attempt I made the && caused the compiler to not load -EFAULT
> into the register in case of jumping to the &&label from the
> fault handler. So leave it like this for now.
> 
> Co-developed-by: Benjamin Berg <benjamin.berg@intel.com>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
> ---
>  arch/um/Kconfig                          |  1 +
>  arch/um/include/asm/processor-generic.h  |  2 ++
>  arch/um/include/asm/uaccess.h            | 20 ++++++++++++-----
>  arch/um/include/shared/arch.h            |  2 ++
>  arch/um/include/shared/as-layout.h       |  2 +-
>  arch/um/include/shared/irq_user.h        |  3 ++-
>  arch/um/include/shared/kern_util.h       | 12 ++++++----
>  arch/um/kernel/irq.c                     |  3 ++-
>  arch/um/kernel/mem.c                     | 10 +++++++++
>  arch/um/kernel/trap.c                    | 28 +++++++++++++++++++-----
>  arch/um/os-Linux/signal.c                |  4 ++--
>  arch/um/os-Linux/skas/process.c          |  8 +++----
>  arch/x86/um/os-Linux/mcontext.c          | 12 ++++++++++
>  arch/x86/um/shared/sysdep/faultinfo_32.h | 12 ++++++++++
>  arch/x86/um/shared/sysdep/faultinfo_64.h | 12 ++++++++++
>  15 files changed, 108 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/um/Kconfig b/arch/um/Kconfig
> index 18051b1cfce0..79509c7f39de 100644
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@ -12,6 +12,7 @@ config UML
>  	select ARCH_HAS_KCOV
>  	select ARCH_HAS_STRNCPY_FROM_USER
>  	select ARCH_HAS_STRNLEN_USER
> +	select ARCH_HAS_STRICT_KERNEL_RWX
>  	select HAVE_ARCH_AUDITSYSCALL
>  	select HAVE_ARCH_KASAN if X86_64
>  	select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
> diff --git a/arch/um/include/asm/processor-generic.h b/arch/um/include/asm/processor-generic.h
> index 5d6356eafffe..8a789c17acd8 100644
> --- a/arch/um/include/asm/processor-generic.h
> +++ b/arch/um/include/asm/processor-generic.h
> @@ -31,6 +31,8 @@ struct thread_struct {
>  		} thread;
>  	} request;
>  
> +	void *segv_continue;
> +
>  	/* Contains variable sized FP registers */
>  	struct pt_regs regs;
>  };
> diff --git a/arch/um/include/asm/uaccess.h b/arch/um/include/asm/uaccess.h
> index 1d4b6bbc1b65..3a08f9029a3f 100644
> --- a/arch/um/include/asm/uaccess.h
> +++ b/arch/um/include/asm/uaccess.h
> @@ -9,6 +9,7 @@
>  
>  #include <asm/elf.h>
>  #include <linux/unaligned.h>
> +#include <sysdep/faultinfo.h>
>  
>  #define __under_task_size(addr, size) \
>  	(((unsigned long) (addr) < TASK_SIZE) && \
> @@ -44,19 +45,28 @@ static inline int __access_ok(const void __user *ptr, unsigned long size)
>  		 __access_ok_vsyscall(addr, size));
>  }
>  
> -/* no pagefaults for kernel addresses in um */
>  #define __get_kernel_nofault(dst, src, type, err_label)			\
>  do {									\
> -	*((type *)dst) = get_unaligned((type *)(src));			\
> -	if (0) /* make sure the label looks used to the compiler */	\
> +	int __faulted;							\
> +									\
> +	___backtrack_faulted(__faulted);				\
> +	if (__faulted) {						\
> +		*((type *)dst) = (type) 0;				\
>  		goto err_label;						\
> +	}								\
> +	*((type *)dst) = get_unaligned((type *)(src));			\
> +	current->thread.segv_continue = NULL;				\
>  } while (0)
>  
>  #define __put_kernel_nofault(dst, src, type, err_label)			\
>  do {									\
> -	put_unaligned(*((type *)src), (type *)(dst));			\
> -	if (0) /* make sure the label looks used to the compiler */	\
> +	int __faulted;							\
> +									\
> +	___backtrack_faulted(__faulted);				\
> +	if (__faulted)							\
>  		goto err_label;						\
> +	put_unaligned(*((type *)src), (type *)(dst));			\
> +	current->thread.segv_continue = NULL;				\
>  } while (0)
>  
>  #endif
...
> diff --git a/arch/x86/um/shared/sysdep/faultinfo_64.h b/arch/x86/um/shared/sysdep/faultinfo_64.h
> index ee88f88974ea..26fb4835d3e9 100644
> --- a/arch/x86/um/shared/sysdep/faultinfo_64.h
> +++ b/arch/x86/um/shared/sysdep/faultinfo_64.h
> @@ -29,4 +29,16 @@ struct faultinfo {
>  
>  #define PTRACE_FULL_FAULTINFO 1
>  
> +#define ___backtrack_faulted(_faulted)					\
> +	asm volatile (							\
> +		"mov $0, %0\n"						\
> +		"movq $__get_kernel_nofault_faulted_%=,%1\n"		\
> +		"jmp _end_%=\n"						\
> +		"__get_kernel_nofault_faulted_%=:\n"			\
> +		"mov $1, %0;"						\
> +		"_end_%=:"						\
> +		: "=r" (_faulted),					\
> +		  "=m" (current->thread.segv_continue) ::		\
> +	)
> +
>  #endif

I bisected a crash that our CI sees with this change as
commit d1d7f01f7cd3 ("um: mark rodata read-only and implement _nofault
accesses"). Unfortunately, I only see this with clang, I do not see it
with GCC 14.2.0 but I am not sure where I would start trying to figure
out what is going on here.

  $ make -skj"$(nproc)" ARCH=um LLVM=1 mrproper defconfig vmlinux

  # Get rootfs via
  #   curl -LSs https://github.com/ClangBuiltLinux/boot-utils/releases/download/20241120-044434/x86_64-rootfs.ext4.zst | zstd -d >rootfs.ext4
  # if necessary
  $ ./vmlinux ubd0=$PWD/rootfs.ext4
  Core dump limits :
          soft - NONE
          hard - NONE
  Checking that ptrace can change system call numbers...OK
  Checking syscall emulation for ptrace...OK
  Checking environment variables for a tempdir...none found
  Checking if /dev/shm is on tmpfs...OK
  Checking PROT_EXEC mmap in /dev/shm...OK
  Linux version 6.14.0-rc5-00002-gd1d7f01f7cd3 (nathan@n3-xlarge-x86) (ClangBuiltLinux clang version 20.1.2 (https://github.com/llvm/llvm-project.git 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247), ClangBuiltLinux LLD 20.1.2 (https://github.com/llvm/llvm-project.git 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)) #1 Wed Apr  2 15:07:50 MST 2025
  ...
  EXT4-fs (ubda): orphan cleanup on readonly fs
  EXT4-fs (ubda): mounted filesystem 267f8e03-3e3c-4aec-979b-f4d9b964b716 ro with ordered data mode. Quota mode: none.
  VFS: Mounted root (ext4 filesystem) readonly on device 98:0.
  devtmpfs: mounted
  Run /sbin/init as init process

  Modules linked in:
  Pid: 24, comm: mount Not tainted 6.14.0-rc5-00002-gd1d7f01f7cd3
  RIP: 0033:_end_0+0x38/0x45
  RSP: 00000000648bfca0  EFLAGS: 00010206
  RAX: 0000000000000000 RBX: 00000000609c7ff8 RCX: 00000000606350b8
  RDX: 00000000648bfc5e RSI: 0000000000001000 RDI: 0000000060c0c000
  RBP: 00000000648bfcc0 R08: 0000000000000000 R09: 0000000060c0c780
  R10: 0000000000000000 R11: 0000000000000206 R12: 00000000648bfd60
  R13: 0000000060c0c900 R14: 0000000060c0c9f8 R15: 0000000000000007
  Kernel panic - not syncing: Kernel mode fault at addr 0x790, ip 0x600c268a
  CPU: 0 UID: 0 PID: 24 Comm: mount Not tainted 6.14.0-rc5-00002-gd1d7f01f7cd3 #1
  Stack:
   600c25e9 00000007 609c7ff8 608c4780
   648bfcf0 601533ca 601533ab 648bfd60
   648bfdb0 608c4780 648bfd10 60152ebe
  Call Trace:
   [<600c25e9>] ? copy_from_kernel_nofault+0x0/0x64
   [<601533ca>] prepend_copy+0x1f/0x51
   [<601533ab>] ? prepend_copy+0x0/0x51
   [<60152ebe>] prepend+0x60/0x67
   [<60153379>] prepend_name+0x1f/0x51
   [<6015335a>] ? prepend_name+0x0/0x51
   [<60152bad>] prepend_path+0xb9/0x1d8
   [<6003cb83>] ? um_set_signals+0x0/0x3b
   [<60152e17>] d_path+0xce/0x115
   [<601867f5>] proc_pid_readlink+0xa1/0x17d
   [<6012b182>] vfs_readlink+0xec/0xee
   [<60138920>] ? touch_atime+0x0/0x162
   [<60120341>] do_readlinkat+0xbe/0x13a
   [<6011f91b>] sys_readlinkat+0x10/0x14
   [<6002caad>] handle_syscall+0x7b/0xaa
   [<6002ca32>] ? handle_syscall+0x0/0xaa
   [<6003f687>] userspace+0x289/0x4a5
   [<6002a8e3>] fork_handler+0x56/0x5d

Cheers,
Nathan
