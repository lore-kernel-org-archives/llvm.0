Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCAA2907
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 06:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743661231; cv=none; b=fVm6ZTmHeE83pHSArZXdwACe2L+oVozp8YCM9lUevvs770K599sQoErYY0FXhezw+drfnjHflS4TBbpXKt8y+WNZeyV3VjayevGclIvicadMlQczgeEPTz/ehY97J56frDzYpseDXwDDEY/3f8DjNEnnNXWQQM0nU+B7rPOSYHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743661231; c=relaxed/simple;
	bh=CTth1d0ZkDH5D8qxwrL2wJZSPpXyp4IOM0f8skGyvrU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=USFC0JPBBwPuzhBQTnDtEZaaQJ/GTjTzcbAXLmb8sRLPoT7h8p3KQ/7adyfojhcL4DMzYcBTA8PzqJCbI5j9nXqpuSrUd/+0qGLv95XDhvYycQgywW5IKY7gYgBDLzrLRDGPyoWWziZ2r03gLtfeTliOAwZztxd8xvXsW8iIwZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=FYYRHn3s; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="FYYRHn3s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=7rKrz2gNKkSDV5SeDo3unXXkHW5Lf9z/AiSUNOOJd4Q=;
	t=1743661229; x=1744870829; b=FYYRHn3siSyBSpCaialkzqlyGmJyGKljHJVdbR8Zj0ZMkY4
	Rb8aEwAwk4E3CdXw3fybYwcTPiTLxgFOkBpQdB4ZOKbMdfZR4titg8qrcaqYClLdSKz5j5s5dEg1k
	mU4WaKBg05tA5NInw/t/jIQrIkg/o72jPF7M7+tpb0L5J2GLMaKuVaZB+awQzzfieeRERU83tx827
	3SKXo3KtI+C3+kUaLteYYJcVyJFfUawUWSvW0i4NjRK/13JRxi4EG045Qr0I5oqDWxkvgPaNlWdrT
	LsADoDZPpqtkBYHsVxteRzdTNazaRy4I9V68cZ/u+fuCnZj+3253ajhA1Mb19QIA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1u0Dw8-0000000EdL9-2ldz;
	Thu, 03 Apr 2025 08:20:24 +0200
Message-ID: <413669a192e65d67059245d38c03828f85d20717.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] um: mark rodata read-only and implement _nofault
 accesses
From: Benjamin Berg <benjamin@sipsolutions.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-um@lists.infradead.org, Johannes Berg <johannes.berg@intel.com>, 
	llvm@lists.linux.dev
Date: Thu, 03 Apr 2025 08:20:23 +0200
In-Reply-To: <20250402221254.GA384@ax162>
References: <20250210160926.420133-1-benjamin@sipsolutions.net>
	 <20250210160926.420133-2-benjamin@sipsolutions.net>
	 <20250402221254.GA384@ax162>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

Hi Nathan,

oops, that is a little logic bug in the code. When we are coming from
userspace, we may be running as part of a user task and have an mm. And
then the new "current->pagefault_disabled" logic is skipped. So when
prepend_copy is doing its nofault copy to evade a lock it is crashing
instead of failing gracefully and retrying.

In segv_handler, can you try moving that into a separate "else if"
block just above the "current->mm =3D=3D NULL" check?

Something like the patch I copied below.

Benjamin

diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
index cbe924a0fa87..8a2e68d07de6 100644
--- a/arch/um/kernel/trap.c
+++ b/arch/um/kernel/trap.c
@@ -330,20 +330,20 @@ unsigned long segv(struct faultinfo fi, unsigned long=
 ip, int is_user,
 			panic("Failed to sync kernel TLBs: %d", err);
 		goto out;
 	}
-	else if (current->mm =3D=3D NULL) {
-		if (current->pagefault_disabled) {
-			if (!mc) {
-				show_regs(container_of(regs, struct pt_regs, regs));
-				panic("Segfault with pagefaults disabled but no mcontext");
-			}
-			if (!current->thread.segv_continue) {
-				show_regs(container_of(regs, struct pt_regs, regs));
-				panic("Segfault without recovery target");
-			}
-			mc_set_rip(mc, current->thread.segv_continue);
-			current->thread.segv_continue =3D NULL;
-			goto out;
+	else if (current->pagefault_disabled) {
+		if (!mc) {
+			show_regs(container_of(regs, struct pt_regs, regs));
+			panic("Segfault with pagefaults disabled but no mcontext");
 		}
+		if (!current->thread.segv_continue) {
+			show_regs(container_of(regs, struct pt_regs, regs));
+			panic("Segfault without recovery target");
+		}
+		mc_set_rip(mc, current->thread.segv_continue);
+		current->thread.segv_continue =3D NULL;
+		goto out;
+	}
+	else if (current->mm =3D=3D NULL) {
 		show_regs(container_of(regs, struct pt_regs, regs));
 		panic("Segfault with no mm");
 	}


On Wed, 2025-04-02 at 15:12 -0700, Nathan Chancellor wrote:
> Hi Benjamin and Johannes,
>=20
> On Mon, Feb 10, 2025 at 05:09:25PM +0100, Benjamin Berg wrote:
> > From: Johannes Berg <johannes.berg@intel.com>
> >=20
> > Mark read-only data actually read-only (simple mprotect), and
> > to be able to test it also implement _nofault accesses. This
> > works by setting up a new "segv_continue" pointer in current,
> > and then when we hit a segfault we change the signal return
> > context so that we continue at that address. The code using
> > this sets it up so that it jumps to a label and then aborts
> > the access that way, returning -EFAULT.
> >=20
> > It's possible to optimize the ___backtrack_faulted() thing by
> > using asm goto (compiler version dependent) and/or gcc's (not
> > sure if clang has it) &&label extension, but at least in one
> > attempt I made the && caused the compiler to not load -EFAULT
> > into the register in case of jumping to the &&label from the
> > fault handler. So leave it like this for now.
> >=20
> > Co-developed-by: Benjamin Berg <benjamin.berg@intel.com>
> > Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> > Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
> > ---
> > =C2=A0arch/um/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0arch/um/include/asm/processor-generic.h=C2=A0 |=C2=A0 2 ++
> > =C2=A0arch/um/include/asm/uaccess.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 ++++++++++++-----
> > =C2=A0arch/um/include/shared/arch.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A0arch/um/include/shared/as-layout.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
> > =C2=A0arch/um/include/shared/irq_user.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 3 ++-
> > =C2=A0arch/um/include/shared/kern_util.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 12 ++++++----
> > =C2=A0arch/um/kernel/irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 3 ++-
> > =C2=A0arch/um/kernel/mem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 10 +++++++++
> > =C2=A0arch/um/kernel/trap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
28 +++++++++++++++++++-----
> > =C2=A0arch/um/os-Linux/signal.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> > =C2=A0arch/um/os-Linux/skas/process.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++----
> > =C2=A0arch/x86/um/os-Linux/mcontext.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++++++
> > =C2=A0arch/x86/um/shared/sysdep/faultinfo_32.h | 12 ++++++++++
> > =C2=A0arch/x86/um/shared/sysdep/faultinfo_64.h | 12 ++++++++++
> > =C2=A015 files changed, 108 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/arch/um/Kconfig b/arch/um/Kconfig
> > index 18051b1cfce0..79509c7f39de 100644
> > --- a/arch/um/Kconfig
> > +++ b/arch/um/Kconfig
> > @@ -12,6 +12,7 @@ config UML
> > =C2=A0	select ARCH_HAS_KCOV
> > =C2=A0	select ARCH_HAS_STRNCPY_FROM_USER
> > =C2=A0	select ARCH_HAS_STRNLEN_USER
> > +	select ARCH_HAS_STRICT_KERNEL_RWX
> > =C2=A0	select HAVE_ARCH_AUDITSYSCALL
> > =C2=A0	select HAVE_ARCH_KASAN if X86_64
> > =C2=A0	select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
> > diff --git a/arch/um/include/asm/processor-generic.h b/arch/um/include/=
asm/processor-generic.h
> > index 5d6356eafffe..8a789c17acd8 100644
> > --- a/arch/um/include/asm/processor-generic.h
> > +++ b/arch/um/include/asm/processor-generic.h
> > @@ -31,6 +31,8 @@ struct thread_struct {
> > =C2=A0		} thread;
> > =C2=A0	} request;
> > =C2=A0
> > +	void *segv_continue;
> > +
> > =C2=A0	/* Contains variable sized FP registers */
> > =C2=A0	struct pt_regs regs;
> > =C2=A0};
> > diff --git a/arch/um/include/asm/uaccess.h b/arch/um/include/asm/uacces=
s.h
> > index 1d4b6bbc1b65..3a08f9029a3f 100644
> > --- a/arch/um/include/asm/uaccess.h
> > +++ b/arch/um/include/asm/uaccess.h
> > @@ -9,6 +9,7 @@
> > =C2=A0
> > =C2=A0#include <asm/elf.h>
> > =C2=A0#include <linux/unaligned.h>
> > +#include <sysdep/faultinfo.h>
> > =C2=A0
> > =C2=A0#define __under_task_size(addr, size) \
> > =C2=A0	(((unsigned long) (addr) < TASK_SIZE) && \
> > @@ -44,19 +45,28 @@ static inline int __access_ok(const void __user *pt=
r, unsigned long size)
> > =C2=A0		 __access_ok_vsyscall(addr, size));
> > =C2=A0}
> > =C2=A0
> > -/* no pagefaults for kernel addresses in um */
> > =C2=A0#define __get_kernel_nofault(dst, src, type, err_label)			\
> > =C2=A0do {									\
> > -	*((type *)dst) =3D get_unaligned((type *)(src));			\
> > -	if (0) /* make sure the label looks used to the compiler */	\
> > +	int __faulted;							\
> > +									\
> > +	___backtrack_faulted(__faulted);				\
> > +	if (__faulted) {						\
> > +		*((type *)dst) =3D (type) 0;				\
> > =C2=A0		goto err_label;						\
> > +	}								\
> > +	*((type *)dst) =3D get_unaligned((type *)(src));			\
> > +	current->thread.segv_continue =3D NULL;				\
> > =C2=A0} while (0)
> > =C2=A0
> > =C2=A0#define __put_kernel_nofault(dst, src, type, err_label)			\
> > =C2=A0do {									\
> > -	put_unaligned(*((type *)src), (type *)(dst));			\
> > -	if (0) /* make sure the label looks used to the compiler */	\
> > +	int __faulted;							\
> > +									\
> > +	___backtrack_faulted(__faulted);				\
> > +	if (__faulted)							\
> > =C2=A0		goto err_label;						\
> > +	put_unaligned(*((type *)src), (type *)(dst));			\
> > +	current->thread.segv_continue =3D NULL;				\
> > =C2=A0} while (0)
> > =C2=A0
> > =C2=A0#endif
> ...
> > diff --git a/arch/x86/um/shared/sysdep/faultinfo_64.h b/arch/x86/um/sha=
red/sysdep/faultinfo_64.h
> > index ee88f88974ea..26fb4835d3e9 100644
> > --- a/arch/x86/um/shared/sysdep/faultinfo_64.h
> > +++ b/arch/x86/um/shared/sysdep/faultinfo_64.h
> > @@ -29,4 +29,16 @@ struct faultinfo {
> > =C2=A0
> > =C2=A0#define PTRACE_FULL_FAULTINFO 1
> > =C2=A0
> > +#define ___backtrack_faulted(_faulted)					\
> > +	asm volatile (							\
> > +		"mov $0, %0\n"						\
> > +		"movq $__get_kernel_nofault_faulted_%=3D,%1\n"		\
> > +		"jmp _end_%=3D\n"						\
> > +		"__get_kernel_nofault_faulted_%=3D:\n"			\
> > +		"mov $1, %0;"						\
> > +		"_end_%=3D:"						\
> > +		: "=3Dr" (_faulted),					\
> > +		=C2=A0 "=3Dm" (current->thread.segv_continue) ::		\
> > +	)
> > +
> > =C2=A0#endif
>=20
> I bisected a crash that our CI sees with this change as
> commit d1d7f01f7cd3 ("um: mark rodata read-only and implement _nofault
> accesses"). Unfortunately, I only see this with clang, I do not see it
> with GCC 14.2.0 but I am not sure where I would start trying to figure
> out what is going on here.
>=20
> =C2=A0 $ make -skj"$(nproc)" ARCH=3Dum LLVM=3D1 mrproper defconfig vmlinu=
x
>=20
> =C2=A0 # Get rootfs via
> =C2=A0 #=C2=A0=C2=A0 curl -LSs https://github.com/ClangBuiltLinux/boot-ut=
ils/releases/download/20241120-044434/x86_64-rootfs.ext4.zst=C2=A0| zstd -d=
 >rootfs.ext4
> =C2=A0 # if necessary
> =C2=A0 $ ./vmlinux ubd0=3D$PWD/rootfs.ext4
> =C2=A0 Core dump limits :
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soft - NONE
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hard - NONE
> =C2=A0 Checking that ptrace can change system call numbers...OK
> =C2=A0 Checking syscall emulation for ptrace...OK
> =C2=A0 Checking environment variables for a tempdir...none found
> =C2=A0 Checking if /dev/shm is on tmpfs...OK
> =C2=A0 Checking PROT_EXEC mmap in /dev/shm...OK
> =C2=A0 Linux version 6.14.0-rc5-00002-gd1d7f01f7cd3 (nathan@n3-xlarge-x86=
) (ClangBuiltLinux clang version 20.1.2 (https://github.com/llvm/llvm-proje=
ct.git=C2=A058df0ef89dd64126512e4ee27b4ac3fd8ddf6247), ClangBuiltLinux LLD =
20.1.2 (https://github.com/llvm/llvm-project.git=C2=A058df0ef89dd64126512e4=
ee27b4ac3fd8ddf6247)) #1 Wed Apr=C2=A0 2 15:07:50 MST 2025
> =C2=A0 ...
> =C2=A0 EXT4-fs (ubda): orphan cleanup on readonly fs
> =C2=A0 EXT4-fs (ubda): mounted filesystem 267f8e03-3e3c-4aec-979b-f4d9b96=
4b716 ro with ordered data mode. Quota mode: none.
> =C2=A0 VFS: Mounted root (ext4 filesystem) readonly on device 98:0.
> =C2=A0 devtmpfs: mounted
> =C2=A0 Run /sbin/init as init process
>=20
> =C2=A0 Modules linked in:
> =C2=A0 Pid: 24, comm: mount Not tainted 6.14.0-rc5-00002-gd1d7f01f7cd3
> =C2=A0 RIP: 0033:_end_0+0x38/0x45
> =C2=A0 RSP: 00000000648bfca0=C2=A0 EFLAGS: 00010206
> =C2=A0 RAX: 0000000000000000 RBX: 00000000609c7ff8 RCX: 00000000606350b8
> =C2=A0 RDX: 00000000648bfc5e RSI: 0000000000001000 RDI: 0000000060c0c000
> =C2=A0 RBP: 00000000648bfcc0 R08: 0000000000000000 R09: 0000000060c0c780
> =C2=A0 R10: 0000000000000000 R11: 0000000000000206 R12: 00000000648bfd60
> =C2=A0 R13: 0000000060c0c900 R14: 0000000060c0c9f8 R15: 0000000000000007
> =C2=A0 Kernel panic - not syncing: Kernel mode fault at addr 0x790, ip 0x=
600c268a
> =C2=A0 CPU: 0 UID: 0 PID: 24 Comm: mount Not tainted 6.14.0-rc5-00002-gd1=
d7f01f7cd3 #1
> =C2=A0 Stack:
> =C2=A0=C2=A0 600c25e9 00000007 609c7ff8 608c4780
> =C2=A0=C2=A0 648bfcf0 601533ca 601533ab 648bfd60
> =C2=A0=C2=A0 648bfdb0 608c4780 648bfd10 60152ebe
> =C2=A0 Call Trace:
> =C2=A0=C2=A0 [<600c25e9>] ? copy_from_kernel_nofault+0x0/0x64
> =C2=A0=C2=A0 [<601533ca>] prepend_copy+0x1f/0x51
> =C2=A0=C2=A0 [<601533ab>] ? prepend_copy+0x0/0x51
> =C2=A0=C2=A0 [<60152ebe>] prepend+0x60/0x67
> =C2=A0=C2=A0 [<60153379>] prepend_name+0x1f/0x51
> =C2=A0=C2=A0 [<6015335a>] ? prepend_name+0x0/0x51
> =C2=A0=C2=A0 [<60152bad>] prepend_path+0xb9/0x1d8
> =C2=A0=C2=A0 [<6003cb83>] ? um_set_signals+0x0/0x3b
> =C2=A0=C2=A0 [<60152e17>] d_path+0xce/0x115
> =C2=A0=C2=A0 [<601867f5>] proc_pid_readlink+0xa1/0x17d
> =C2=A0=C2=A0 [<6012b182>] vfs_readlink+0xec/0xee
> =C2=A0=C2=A0 [<60138920>] ? touch_atime+0x0/0x162
> =C2=A0=C2=A0 [<60120341>] do_readlinkat+0xbe/0x13a
> =C2=A0=C2=A0 [<6011f91b>] sys_readlinkat+0x10/0x14
> =C2=A0=C2=A0 [<6002caad>] handle_syscall+0x7b/0xaa
> =C2=A0=C2=A0 [<6002ca32>] ? handle_syscall+0x0/0xaa
> =C2=A0=C2=A0 [<6003f687>] userspace+0x289/0x4a5
> =C2=A0=C2=A0 [<6002a8e3>] fork_handler+0x56/0x5d
>=20
> Cheers,
> Nathan
>=20

