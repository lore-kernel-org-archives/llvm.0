Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3791FF1B4;
	Tue,  7 Apr 2026 21:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775599144; cv=none; b=QYtuzOWEPkD6NTK6F9vJ8KqWU1lgCwudRkeyfP6hKyFmO6ypEIQeXgJ8wob1dYE/Oo9K7UcTxAfbcFJLW5k8BwZhKmwQFQCtz0z44kCvK/E4oPpebGa/pazkXRFabpuPTr/KTA8pv6mJxJINGg7j9nTcPkMpoU88iOajL8LtD7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775599144; c=relaxed/simple;
	bh=WGjbgIP/MkAMP64vHdLKSjPCmOqDJIGHFmMl4BHOc7I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GWBwCnz8FAz6o5k+RyMVFaH9Zgv4fZigqb4aomofns/MXKrI0na0ylww2oBlF8lrkxKMjcw4PP9n8PauJmPjjxYeVaPM6573gsmcCDxCjJ4EYnOrqdOjh4ttVivLfXa1s2xcee3qbwlgGXyOCM+g/4r8f3djZAagkyEMWDdNR+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=g2P9XDLl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="g2P9XDLl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC60C116C6;
	Tue,  7 Apr 2026 21:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775599143;
	bh=WGjbgIP/MkAMP64vHdLKSjPCmOqDJIGHFmMl4BHOc7I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g2P9XDLlR6fNt+r+veog97du8CFM2oid3SHVXSPSzTpzh2iUsN7eF68ktocaew9Wt
	 rJZdnIftvDAmeh+2+t2EQqQgPel4rl0YmcRfyNNOxKA+UcJLxmsijp9K39EN8obNLI
	 r9vOeBE/FCpiOGtFtxJBZJUOXy1f/6bPiKi4qTn0=
Date: Tue, 7 Apr 2026 14:59:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>, Linux
 Memory Management List <linux-mm@kvack.org>, Alice Ryhl
 <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [akpm-mm:mm-unstable 113/133] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
Message-Id: <20260407145902.057044dc19e7313b21418ff4@linux-foundation.org>
In-Reply-To: <202604071509.y5vLetYd-lkp@intel.com>
References: <202604071509.y5vLetYd-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 07 Apr 2026 15:58:09 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   3fa44141e0bbd5062f2ef0c5cdddd98275d3223e
> commit: 694fc0bd3ca5420f4e1105d2dec02327cfc5d64b [113/133] userfaultfd: introduce vm_uffd_ops
> config: x86_64-randconfig-074-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071509.y5vLetYd-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071509.y5vLetYd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604071509.y5vLetYd-lkp@intel.com/

Various forms of "userfaultfd: introduce vm_uffd_ops" have been in
mm.git since March 6.  Thanks (much), but is it possible to get more
timely notifications?

> All errors (new ones prefixed by >>):
> 
> >> error[E0277]: `*const kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
>    --> drivers/android/binder/page_range.rs:146:23
>    |
>    146   | static BINDER_VM_OPS: bindings::vm_operations_struct = pin_init::zeroed();
>    |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `*const kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
>    |
>    = help: within `kernel::bindings::vm_operations_struct`, the trait `Sync` is not implemented for `*const kernel::bindings::vm_uffd_ops`
>    note: required because it appears within the type `kernel::bindings::vm_operations_struct`
>    --> rust/bindings/bindings_generated.rs:74703:12
>    |
>    74703 | pub struct vm_operations_struct {
>    |            ^^^^^^^^^^^^^^^^^^^^
>    = note: shared static variables must have a type that implements `Sync`

We've seen this one before.  Sorry, I'm (still) not set up for
build-testing rusty things and I suspect I'm not the only one.

Alice, Miguel: please can you help us here?

Thanks.
