Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2CE245023;
	Thu,  2 Oct 2025 22:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759444075; cv=none; b=iM3hfmEqSnfovlImfs0z5mK+Nfj3ZT8Lq+rIjbs6CGTQoZAG2ctFXKeCaZsM009daqu4t8bywkozf6OPqm02drXy5A3v07wNF+8FDd9tAlpDVpI/WWV/wgWOCVUKoRU1q45plL/LXvruMX05ax8D5qy471scq8tP6410SnAUmZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759444075; c=relaxed/simple;
	bh=FAQx29UJAqdlcYne9qiTsc80FK6EHP3tnr0RF1bSC2c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=q1An3GP1lji6TvsYsrFBYvwYl6am9Kcshz62Q1Y6B5rGU2Nl4KPaSBIvwn0l1CG0VEXiOrhDVBH18z4UmQdHAr7CFF/KxgiDqVdr5mWmwjSbCA21a0dMMbrRLAtLwMCHTUcK6wcoDg/RHa8Cd8ThQD+UenxLZC7sOY1k5Q6DANc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JJCpfBAo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JJCpfBAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23C9C4CEF4;
	Thu,  2 Oct 2025 22:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1759444074;
	bh=FAQx29UJAqdlcYne9qiTsc80FK6EHP3tnr0RF1bSC2c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JJCpfBAoihBUJ9RPqt+9zxTJPXbYrb/r8zj8A/F2DkAJ9NpG2w7ROqjVPDbZxabzG
	 uCM3fkpFeVhmNra06S7KH4Y4Jr9XFdIjos6NAHGJHrP4jBx5ZQGmMyzxP+4onV1sJ+
	 BhpIKf382kot/jenn0jumv5/okezR09L8daGIUmA=
Date: Thu, 2 Oct 2025 15:27:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
Message-Id: <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
In-Reply-To: <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
References: <202510030449.VfSaAjvd-lkp@intel.com>
	<20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
	<CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 2 Oct 2025 23:42:59 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Thu, Oct 2, 2025 at 11:19 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > No idea.  Let me cc rust-for-linux.
> >
> > It's a one-line patch:
> >
> > --- a/include/linux/mm.h~mm-ksm-fix-flag-dropping-behavior-in-ksm_madvise
> > +++ a/include/linux/mm.h
> > @@ -296,7 +296,7 @@ extern unsigned int kobjsize(const void
> >  #define VM_MIXEDMAP    0x10000000      /* Can contain "struct page" and pure PFN pages */
> >  #define VM_HUGEPAGE    0x20000000      /* MADV_HUGEPAGE marked this vma */
> >  #define VM_NOHUGEPAGE  0x40000000      /* MADV_NOHUGEPAGE marked this vma */
> > -#define VM_MERGEABLE   0x80000000      /* KSM may merge identical pages */
> > +#define VM_MERGEABLE   BIT(31)         /* KSM may merge identical pages */
> >
> >  #ifdef CONFIG_ARCH_USES_HIGH_VMA_FLAGS
> >  #define VM_HIGH_ARCH_BIT_0     32      /* bit only usable on 64-bit architectures */
> 
> Yeah, non-trivial macros confuse `bindgen`.
> 
> For the moment, you can do e.g. [1].
> 
> Other times, we have changed `#define`s into `enum`s -- that also works.
> 
> ...
>
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -106,3 +106,5 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT = XA_PRESENT;
> 
>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC = XA_FLAGS_ALLOC;
>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 = XA_FLAGS_ALLOC1;
> +
> +const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE = VM_MERGEABLE;

Sorry, this is rather annoying.  Rust is breaking the build for a very
simple patch.  Many developers aren't rust-enabled and probably aren't
even able to test a fix - my attempt to get a rust build setup working
didn't end happily.

Jakub's patch fixes a kernel crash and needs to be merged into mainline
and -stable reasonably soon.  But that is now blocked until someone who
knows how to fix this error and how to test it gets down and does those
things.

Jakub's patch is present in current linux-next.  Can someone please
send us a fix?
