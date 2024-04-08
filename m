Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E051448C3;
	Mon,  8 Apr 2024 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712598040; cv=none; b=gnJZyuIzVBXrKaTqUp10UHgs4Gt7lDdv+eW052AoRHfy6Tuxbnpqc3TsFZr7rJ25QGjqHrGRRGSGdrMQNZWGwy/uzTPofn3ppkjQb17JG4dZxxHLIDiBHtBksAmADZMMvvyz6+aFZwAS/+HOJaFe7DgR5/fy8VqrGsMu2Nc29Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712598040; c=relaxed/simple;
	bh=zRPDmo8wzpH7MlQn4X4AWPBc1kRD+usMYJ2d45VIlrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhBUSjEVTPLmuAK6ocd/tX2Ng8ZTBgZdVrXZiokXjebgxzeXK8gFwFKyhjAI6H/Ckmt5pFBYQLEAp8rHWWQAJ2auryQkoyQFWF9T2L7iiLB2D3RPA+eNROFCWWC6Hyyuv8hCxzWfFCmPEwoQFVpx2AXDbQCoNtVocs77MxS4xjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOaK6WnO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOaK6WnO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4DCC433C7;
	Mon,  8 Apr 2024 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712598040;
	bh=zRPDmo8wzpH7MlQn4X4AWPBc1kRD+usMYJ2d45VIlrc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=SOaK6WnObDMcMHd8T8S9Z0NgzHv3kuI7vwL8ETNJXEIQpVKAmy4kN+yHE4zqLd5jz
	 +DrV6ICL0i2Xl8xcYT6WbD5gwnsyrUcuRGfQvKnRRb6HvWAPU1/JY7/nZidoszEakY
	 9GOnZSPsYAvBCNbYKdM6vdFcsKlPD60YRemfCGSEk4RraWCT5vTBybckptOTvqqrvB
	 ipgAbzt4J8Wua+pUbGc1XgUgMYtvCw9Ow12VK8HWGyYNwZ+qGN8bcASBl8pMUiGZUs
	 XllRM3Z2nSnJY2Z7wtT7tPJD83EXeMwbVMPTLkW4Fd3tfWczNXm3zo/Q99Ja/FLyX3
	 KgK2AJbL5+grw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B81C1CE126C; Mon,  8 Apr 2024 10:40:39 -0700 (PDT)
Date: Mon, 8 Apr 2024 10:40:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Liu, Yujie" <yujie.liu@intel.com>
Cc: lkp <lkp@intel.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [linux-next:master 2524/3504] kernel/locking/rtmutex.c:218:9:
 error: incompatible pointer to integer conversion passing 'typeof
 (*(((__ai_ptr))))' (aka 'struct task_struct *') to parameter of type
 'uintptr_t' (aka 'unsigned long')
Message-ID: <9683809f-ff98-4c9f-bd67-97d99dc89e8f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202404040526.GVzaL2io-lkp@intel.com>
 <302e5ce2-5a65-4e07-8ca8-cced83e9af5b@paulmck-laptop>
 <98704087ab6012031f3e117460cc1b24457a554f.camel@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98704087ab6012031f3e117460cc1b24457a554f.camel@intel.com>

On Sun, Apr 07, 2024 at 04:41:02AM +0000, Liu, Yujie wrote:
> Hi Paul,
> 
> On Thu, 2024-04-04 at 10:44 -0700, Paul E. McKenney wrote:
> > On Thu, Apr 04, 2024 at 05:13:20AM +0800, kernel test robot wrote:
> > > tree:  
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > >  master
> > > head:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
> > > commit: df35ee400e06b23ecd44fdb66451a5343932f834 [2524/3504] riscv:
> > > Emulate one-byte and two-byte cmpxchg
> > > config: riscv-nommu_virt_defconfig
> > > (https://download.01.org/0day-ci/archive/20240404/202404040526.GVza
> > > L2io-lkp@intel.com/config)
> > > compiler: clang version 19.0.0git
> > > (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a59
> > > 55e355a3b27)
> > > reproduce (this is a W=1 build):
> > > (https://download.01.org/0day-ci/archive/20240404/202404040526.GVza
> > > L2io-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a
> > > new version of
> > > the same patch/commit), kindly add following tags
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes:
> > > > https://lore.kernel.org/oe-kbuild-all/202404040526.GVzaL2io-lkp@intel.com/
> > 
> > I believe that this is fixed by the following updated commit in -rcu:
> > 
> > 27011e7159ef ("riscv: Emulate one-byte cmpxchg")
> > 
> > But please let me know if I am missing something.
> 
> Sorry for the delay of reply due to we were on public holidays in the
> last few days.
> 
> The error still exists on the updated commit.
> 
> Commit 27011e7159ef added the uintptr_t cast for __old and __new only
> in the first occurrence of __ret assignment, but missed that in the
> remaining __ret assignments. Seems it needs another fixup as below:
> 
> -------------------------------------------------------------------
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index abcd5543b861b..a9803825567cf 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -219,7 +219,7 @@
>         register unsigned int __rc;                                     \
>         switch (size) {                                                 \
>         case 1:                                                         \
> -               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                                  \
>         case 4:                                                         \
>                 __asm__ __volatile__ (                                  \
> @@ -268,7 +268,7 @@
>         register unsigned int __rc;                                     \
>         switch (size) {                                                 \
>         case 1:                                                         \
> -               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                                  \
>         case 4:                                                         \
>                 __asm__ __volatile__ (                                  \
> @@ -317,7 +317,7 @@
>         register unsigned int __rc;                                     \
>         switch (size) {                                                 \
>         case 1:                                                         \
> -               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                                  \
>         case 4:                                                         \
>                 __asm__ __volatile__ (                                  \
> 

Applied with attribution, thank you!

Quite the variety of casts required by the various architectures.  ;-)

Please see below for the updated patch.

							Thanx, Paul

------------------------------------------------------------------------

commit 4d5c72a34948625caf85c00b1db85372f4edbcae
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Wed Mar 27 17:13:02 2024 -0700

    riscv: Emulate one-byte cmpxchg
    
    Use the new cmpxchg_emu_u8() to emulate one-byte cmpxchg() on riscv.
    
    [ paulmck: Apply kernel test robot feedback, additional casts from Liu, Yujie. ]
    [ paulmck: Drop two-byte support per Arnd Bergmann feedback. ]
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
    Tested-by: Yujie Liu <yujie.liu@intel.com>
    Cc: Andi Shyti <andi.shyti@linux.intel.com>
    Cc: Andrzej Hajda <andrzej.hajda@intel.com>
    Cc: Arnd Bergmann <arnd@arndb.de>
    Cc: <linux-riscv@lists.infradead.org>
    Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56b..3bab9c5c0f465 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -44,6 +44,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_DATA
 	select ARCH_KEEP_MEMBLOCK if ACPI
+	select ARCH_NEED_CMPXCHG_1_EMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2fee65cc84432..a9803825567cf 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -9,6 +9,7 @@
 #include <linux/bug.h>
 
 #include <asm/fence.h>
+#include <linux/cmpxchg-emu.h>
 
 #define __xchg_relaxed(ptr, new, size)					\
 ({									\
@@ -170,6 +171,9 @@
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
@@ -214,6 +218,9 @@
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
@@ -260,6 +267,9 @@
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			RISCV_RELEASE_BARRIER				\
@@ -306,6 +316,9 @@
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
