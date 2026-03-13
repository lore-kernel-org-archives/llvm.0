Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B324F24676D;
	Fri, 13 Mar 2026 21:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773437803; cv=none; b=Ck9FFKqhiE9/cJMBv8r66dJdlfFweV8R6vtIsA5Baw980A4Xoyr5ZT8dmVDsXIhQgk9z2jWP3KIey1qz/2wEGAr7W6ULKJv23Wxn06rqDJlS5G9Xca2FO2qxnlY0VhluTbEjb9DAHaIsDo1Wxbm8NpNBCoD+V6+EFHiWjUCEDB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773437803; c=relaxed/simple;
	bh=hU6Fe6XYGxziElGzs5uGk03JaLC6mdF7RLU66cbBXSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0qGch2BsMyD8jkWxxUFbf/fcbzRj1me5ujvYMkU2gwoZ15aNgt+p4yjjyfbPewGM0OKicCzGH5dnGW0QvMeM6896ebKyjSunM7jg0lp++gH7FmCma0XzlWElxiAlURgf9X07LGTtE/yOnxYMtwBuXCfesXDn/iHcqUkW2wDV/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRo1BJRo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRo1BJRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE9CC19421;
	Fri, 13 Mar 2026 21:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773437803;
	bh=hU6Fe6XYGxziElGzs5uGk03JaLC6mdF7RLU66cbBXSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRo1BJRoMYnJ8ZEhxjLCUF62+obEtmZFuayPRQThcdx4lHWmZYYix/fPOKngPqS6T
	 r5WRZOMSCluK4oWbgts2a6ni7A4AdRH6ngAnEAAQMJfwlER1V2lqPOngfTYKo5nP1Y
	 h098q59sqHQPYatJw9aKAQpaL4v4XGl4F644QuLAGDk962aGCL6w9oFn94C4VW+3oF
	 XSlrbDuqjJfTCHhEIB615Id5lgdGCOGO2ohevFhfgdWwA6Uc6svL9GvyOHLjTFXF3y
	 OuyCTaxq7+87HaSz/0sHOx6rCUInPffG0NUHc2TAfDUiMOIQ6ZM6F69onbJArRL6Ll
	 dIkCwzUe6rYwQ==
Date: Fri, 13 Mar 2026 14:36:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Mike Rapoport <rppt@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
Message-ID: <20260313213638.GA147391@ax162>
References: <202603121235.tpnRxFKO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603121235.tpnRxFKO-lkp@intel.com>

+ relevant parties

On Thu, Mar 12, 2026 at 12:21:07PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
> commit: 9ef1985c003ea271369c900a93f8b834119fd150 [5585/5731] Merge branch 'mm-unstable' of https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> config: x86_64-randconfig-002-20260312 (https://download.01.org/0day-ci/archive/20260312/202603121235.tpnRxFKO-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121235.tpnRxFKO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603121235.tpnRxFKO-lkp@intel.com/
> 
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
>    --> rust/bindings/bindings_generated.rs:72795:12
>    |
>    72795 | pub struct vm_operations_struct {
>    |            ^^^^^^^^^^^^^^^^^^^^
>    = note: shared static variables must have a type that implements `Sync`

I see this in next-20260313 still.

  $ cat kernel/configs/repro.config
  CONFIG_RUST=y
  CONFIG_ANDROID_BINDER_IPC_RUST=y
  CONFIG_USERFAULTFD=y

  $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper defconfig repro.config drivers/android/binder/rust_binder_main.o
  error[E0277]: `*const kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
       --> drivers/android/binder/page_range.rs:146:23
        |
    146 | static BINDER_VM_OPS: bindings::vm_operations_struct = pin_init::zeroed();
        |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `*const kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
        |
        = help: within `kernel::bindings::vm_operations_struct`, the trait `Sync` is not implemented for `*const kernel::bindings::vm_uffd_ops`
  note: required because it appears within the type `kernel::bindings::vm_operations_struct`
       --> rust/bindings/bindings_generated.rs:71347:12
        |
  71347 | pub struct vm_operations_struct {
        |            ^^^^^^^^^^^^^^^^^^^^
        = note: shared static variables must have a type that implements `Sync`

  error: aborting due to 1 previous error

  For more information about this error, try `rustc --explain E0277`.
  ...

It looks like this is a conflict between Alice's "rust_binder: check ownership
before using vma" [1] (currently in char-misc-linus [2]) and Mike's
"userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unstable [4]),
hence why it was bisected to the -next merge commit.

[1]: https://lore.kernel.org/20260218-binder-vma-check-v2-1-60f9d695a990@google.com/
[2]: https://git.kernel.org/gregkh/char-misc/c/8ef2c15aeae07647f530d30f6daaf79eb801bcd1
[3]: https://lore.kernel.org/20260306171815.3160826-8-rppt@kernel.org/
[4]: https://git.kernel.org/akpm/mm/c/52b7ee1715b88c61fe0696db31ac90181999ec2e

Cheers,
Nathan
