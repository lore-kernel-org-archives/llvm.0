Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EA418FC80;
	Thu,  2 Oct 2025 21:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759439966; cv=none; b=SdGvBbgsBfUJOI3TJcLmHMDbrfQeDAUMGPSHOm9IrWZluzZj5KBWGiMWlrqBu6wEvkiOiMEifES1b4EwxTqQbm17/KP+Uqv3My4bGU+BzoEOjM8twcGPRHN+KIhiD/+j3N+ORxntMKi9Lg0xK4npoo2QITM6kTaeP086h9aZGRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759439966; c=relaxed/simple;
	bh=sROaSKwcO+5g1n7Ya+Dliv6C7a5EP/gyBulHIGWNSvI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tXyZvDcIgLT8A5Qmmh+bRCdpIueWqUF231zjgPzF+v964AsQQVHGDFlgsbF6h6QRob7xVx8ow79P1dNkTbXyilfIlCjzmp1DaOgv8wSH4FR7NRzGxVUJM0r1G0bKWBlKNdk/e5XZGdQfqNXNzJ2jnxE3N40XR4V4OyircOYhMpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SvZCz6sh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SvZCz6sh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD54C4CEF4;
	Thu,  2 Oct 2025 21:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1759439965;
	bh=sROaSKwcO+5g1n7Ya+Dliv6C7a5EP/gyBulHIGWNSvI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SvZCz6shkwOtL+0TWDSpPW7H2mn8cdM8MjmpPjCZRJJnuy/uhDl5u/s7FhDxjTUbV
	 /n5o4mUZzkSZOQe2mP4Xam9ugOMbJNw2R725r4IEV4kZ+vz+NgJbl5URTg1fGvtTMQ
	 pVCabNOsuRlt7NqITWp8AdZJaveFb7VnyK4lO5tA=
Date: Thu, 2 Oct 2025 14:19:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
Message-Id: <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
In-Reply-To: <202510030449.VfSaAjvd-lkp@intel.com>
References: <202510030449.VfSaAjvd-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 3 Oct 2025 04:52:48 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7396732143a22b42bb97710173d598aaf50daa89
> commit: 8355c2312fdfe590a296b8abf9414ab7ecb49d1d [13069/13300] mm/ksm: fix flag-dropping behavior in ksm_madvise
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251003/202510030449.VfSaAjvd-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510030449.VfSaAjvd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510030449.VfSaAjvd-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error[E0425]: cannot find value `VM_MERGEABLE` in crate `bindings`
>    --> rust/kernel/mm/virt.rs:471:49
>    |
>    471  |     pub const MERGEABLE: vm_flags_t = bindings::VM_MERGEABLE as vm_flags_t;
>    |                                                 ^^^^^^^^^^^^ help: a constant with a similar name exists: `MMF_VM_MERGEABLE`
>    |
>    ::: rust/bindings/bindings_generated.rs:7936:1
>    |
>    7936 | pub const MMF_VM_MERGEABLE: u32 = 16;
>    | ------------------------------- similarly named constant `MMF_VM_MERGEABLE` defined here

No idea.  Let me cc rust-for-linux.

It's a one-line patch:

--- a/include/linux/mm.h~mm-ksm-fix-flag-dropping-behavior-in-ksm_madvise
+++ a/include/linux/mm.h
@@ -296,7 +296,7 @@ extern unsigned int kobjsize(const void
 #define VM_MIXEDMAP	0x10000000	/* Can contain "struct page" and pure PFN pages */
 #define VM_HUGEPAGE	0x20000000	/* MADV_HUGEPAGE marked this vma */
 #define VM_NOHUGEPAGE	0x40000000	/* MADV_NOHUGEPAGE marked this vma */
-#define VM_MERGEABLE	0x80000000	/* KSM may merge identical pages */
+#define VM_MERGEABLE	BIT(31)		/* KSM may merge identical pages */
 
 #ifdef CONFIG_ARCH_USES_HIGH_VMA_FLAGS
 #define VM_HIGH_ARCH_BIT_0	32	/* bit only usable on 64-bit architectures */
_

