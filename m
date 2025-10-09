Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06077176ADE;
	Thu,  9 Oct 2025 18:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760033157; cv=none; b=cNpgbDEkz+WbJGe2xhaHna3qLCsFW4hZ7zDd2l5y+UVZwVdbdOhLChJRsBjaf6S2K2MfYUADpL/D1aTyntn/GOWqPNOGD1RqMZG0mrmVk/bvw4f0rCP7aO2PWPtIpLHZEsHmwMm5HbuZgVeuEmbTr+DhATu0T9kkx41lAMG1jV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760033157; c=relaxed/simple;
	bh=QuirnynC+1f2uW7Dgl7a1mMc8o3TzlFgXQrnzGYbNuY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ktXy8gQ48IGxLIUtXes+Qte4BDe29tMu3hXv8RP8bWX2wk+CnJgc9StUkLlfZqQn/8Cnt2g/oxuhNbcj5FQvt32EloK3a9DiwmXMGPEdh9+uiahJtBiB1500J8Zhase46GvmhFs2JG61CZ4mFNA4Fh3vSCI/uBNV7eYgDgAr0rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YCiDS6rJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YCiDS6rJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F692C4CEE7;
	Thu,  9 Oct 2025 18:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1760033156;
	bh=QuirnynC+1f2uW7Dgl7a1mMc8o3TzlFgXQrnzGYbNuY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YCiDS6rJ1+jNzcTltE2XVqKDWS7RW0zCUgB8tsJ4mo37oVga1P8qPTiSPFVuSfJMB
	 T2HpT9gsTMgZEWFH4cPpZWYN6pXof6rfpmtvkwL8z/0FxkGKNk215uMZ845y0zmMRm
	 hy3ATZChK8Dei4F0pGeffu5E3VNcEwHFF9Y8G9yU=
Date: Thu, 9 Oct 2025 11:05:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value
 `VM_READ` in crate `bindings`
Message-Id: <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
In-Reply-To: <202510100127.yuqhg8uo-lkp@intel.com>
References: <202510100127.yuqhg8uo-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Oct 2025 01:42:21 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Jakub,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   70478cb9da6fc4e7b987219173ba1681d5f7dd3d
> commit: da4dbad77af8cc850a570fd05455369cc12b0be4 [36/102] mm: redefine VM_* flag constants with BIT()
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251010/202510100127.yuqhg8uo-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100127.yuqhg8uo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510100127.yuqhg8uo-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/sched/rq-offsets.c:5:
>    kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
>    3743 |         struct cpumask *cpumask;
>    |                         ^
>    1 warning generated.
> >> error[E0425]: cannot find value `VM_READ` in crate `bindings`
>    --> rust/kernel/mm/virt.rs:399:44
>    |
>    399 |     pub const READ: vm_flags_t = bindings::VM_READ as vm_flags_t;
>    |                                            ^^^^^^^ not found in `bindings`
> --
> >> error[E0425]: cannot find value `VM_WRITE` in crate `bindings`
>    --> rust/kernel/mm/virt.rs:402:45
>    |
>    402 |     pub const WRITE: vm_flags_t = bindings::VM_WRITE as vm_flags_t;
>    |                                             ^^^^^^^^ not found in `bindings`

Argh.

Alice, Miguel, please remind what to do about this?

I'll disable Jakub's patch for now.

Thanks.


From: Jakub Acs <acsjakub@amazon.de>
Subject: mm: redefine VM_* flag constants with BIT()
Date: Thu, 2 Oct 2025 07:52:02 +0000

Make VM_* flag constant definitions consistent - unify all to use BIT()
macro.

We have previously changed VM_MERGEABLE in a separate bugfix.  This is a
follow-up to make all the VM_* flag constant definitions consistent, as
suggested by David in [1].

Link: https://lkml.kernel.org/r/20251002075202.11306-1-acsjakub@amazon.de
Link: https://lore.kernel.org/all/85f852f9-8577-4230-adc7-c52e7f479454@redhat.com/ [1]
Signed-off-by: Jakub Acs <acsjakub@amazon.de>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: SeongJae Park <sj@kernel.org>
Cc: Xu Xin <xu.xin16@zte.com.cn>
Cc: Chengming Zhou <chengming.zhou@linux.dev>
Cc: Peter Xu <peterx@redhat.com>
Cc: Axel Rasmussen <axelrasmussen@google.com>
Cc: Chengming Zhou <chengming.zhou@linux.dev>
Cc: Peter Xu <peterx@redhat.com>
Cc: xu xin <xu.xin16@zte.com.cn>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/linux/mm.h |   64 +++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

--- a/include/linux/mm.h~mm-redefine-vm_-flag-constants-with-bit
+++ a/include/linux/mm.h
@@ -273,56 +273,56 @@ extern unsigned int kobjsize(const void
  * vm_flags in vm_area_struct, see mm_types.h.
  * When changing, update also include/trace/events/mmflags.h
  */
-#define VM_NONE		0x00000000
+#define VM_NONE		0
 
-#define VM_READ		0x00000001	/* currently active flags */
-#define VM_WRITE	0x00000002
-#define VM_EXEC		0x00000004
-#define VM_SHARED	0x00000008
+#define VM_READ		BIT(0)		/* currently active flags */
+#define VM_WRITE	BIT(1)
+#define VM_EXEC		BIT(2)
+#define VM_SHARED	BIT(3)
 
 /* mprotect() hardcodes VM_MAYREAD >> 4 == VM_READ, and so for r/w/x bits. */
-#define VM_MAYREAD	0x00000010	/* limits for mprotect() etc */
-#define VM_MAYWRITE	0x00000020
-#define VM_MAYEXEC	0x00000040
-#define VM_MAYSHARE	0x00000080
+#define VM_MAYREAD	BIT(4)		/* limits for mprotect() etc */
+#define VM_MAYWRITE	BIT(5)
+#define VM_MAYEXEC	BIT(6)
+#define VM_MAYSHARE	BIT(7)
 
-#define VM_GROWSDOWN	0x00000100	/* general info on the segment */
+#define VM_GROWSDOWN	BIT(8)		/* general info on the segment */
 #ifdef CONFIG_MMU
-#define VM_UFFD_MISSING	0x00000200	/* missing pages tracking */
+#define VM_UFFD_MISSING	BIT(9)		/* missing pages tracking */
 #else /* CONFIG_MMU */
-#define VM_MAYOVERLAY	0x00000200	/* nommu: R/O MAP_PRIVATE mapping that might overlay a file mapping */
+#define VM_MAYOVERLAY	BIT(9)		/* nommu: R/O MAP_PRIVATE mapping that might overlay a file mapping */
 #define VM_UFFD_MISSING	0
 #endif /* CONFIG_MMU */
-#define VM_PFNMAP	0x00000400	/* Page-ranges managed without "struct page", just pure PFN */
-#define VM_UFFD_WP	0x00001000	/* wrprotect pages tracking */
+#define VM_PFNMAP	BIT(10)		/* Page-ranges managed without "struct page", just pure PFN */
+#define VM_UFFD_WP	BIT(12)		/* wrprotect pages tracking */
 
-#define VM_LOCKED	0x00002000
-#define VM_IO           0x00004000	/* Memory mapped I/O or similar */
+#define VM_LOCKED	BIT(13)
+#define VM_IO           BIT(14)		/* Memory mapped I/O or similar */
 
 					/* Used by sys_madvise() */
-#define VM_SEQ_READ	0x00008000	/* App will access data sequentially */
-#define VM_RAND_READ	0x00010000	/* App will not benefit from clustered reads */
+#define VM_SEQ_READ	BIT(15)		/* App will access data sequentially */
+#define VM_RAND_READ	BIT(16)		/* App will not benefit from clustered reads */
 
-#define VM_DONTCOPY	0x00020000      /* Do not copy this vma on fork */
-#define VM_DONTEXPAND	0x00040000	/* Cannot expand with mremap() */
-#define VM_LOCKONFAULT	0x00080000	/* Lock the pages covered when they are faulted in */
-#define VM_ACCOUNT	0x00100000	/* Is a VM accounted object */
-#define VM_NORESERVE	0x00200000	/* should the VM suppress accounting */
-#define VM_HUGETLB	0x00400000	/* Huge TLB Page VM */
-#define VM_SYNC		0x00800000	/* Synchronous page faults */
-#define VM_ARCH_1	0x01000000	/* Architecture-specific flag */
-#define VM_WIPEONFORK	0x02000000	/* Wipe VMA contents in child. */
-#define VM_DONTDUMP	0x04000000	/* Do not include in the core dump */
+#define VM_DONTCOPY	BIT(17)		/* Do not copy this vma on fork */
+#define VM_DONTEXPAND	BIT(18)		/* Cannot expand with mremap() */
+#define VM_LOCKONFAULT	BIT(19)		/* Lock the pages covered when they are faulted in */
+#define VM_ACCOUNT	BIT(20)		/* Is a VM accounted object */
+#define VM_NORESERVE	BIT(21)		/* should the VM suppress accounting */
+#define VM_HUGETLB	BIT(22)		/* Huge TLB Page VM */
+#define VM_SYNC		BIT(23)		/* Synchronous page faults */
+#define VM_ARCH_1	BIT(24)		/* Architecture-specific flag */
+#define VM_WIPEONFORK	BIT(25)		/* Wipe VMA contents in child. */
+#define VM_DONTDUMP	BIT(26)		/* Do not include in the core dump */
 
 #ifdef CONFIG_MEM_SOFT_DIRTY
-# define VM_SOFTDIRTY	0x08000000	/* Not soft dirty clean area */
+# define VM_SOFTDIRTY	BIT(27)		/* Not soft dirty clean area */
 #else
 # define VM_SOFTDIRTY	0
 #endif
 
-#define VM_MIXEDMAP	0x10000000	/* Can contain "struct page" and pure PFN pages */
-#define VM_HUGEPAGE	0x20000000	/* MADV_HUGEPAGE marked this vma */
-#define VM_NOHUGEPAGE	0x40000000	/* MADV_NOHUGEPAGE marked this vma */
+#define VM_MIXEDMAP	BIT(28)		/* Can contain "struct page" and pure PFN pages */
+#define VM_HUGEPAGE	BIT(29)		/* MADV_HUGEPAGE marked this vma */
+#define VM_NOHUGEPAGE	BIT(30)		/* MADV_NOHUGEPAGE marked this vma */
 #define VM_MERGEABLE	BIT(31)		/* KSM may merge identical pages */
 
 #ifdef CONFIG_ARCH_USES_HIGH_VMA_FLAGS
_

