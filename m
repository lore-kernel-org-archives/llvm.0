Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4619DF64;
	Mon, 18 Nov 2024 20:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731961025; cv=none; b=fLxvu2hWPEcKbEMdErrPQoMM5cCWpvQIP4mchY/DzlX+R0/sZEir/fkhyH5HRevbrbCJY22h62LKh03PAGAFj4XdBQt77LOTZxM/dZCK6HLgw4Xsq1tJ5fHwaf/eO6moZzPWXdR0j9Ao99n/V/Or3DFlym+jX/+Coe77YlfgV2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731961025; c=relaxed/simple;
	bh=dnw1xFwWHA3hTIC33XSzzj6TApG4qpFfXtEvzyt0Hww=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dGSyZOGHdzzf3IGJ/b/v9AFkZh2KL2aN4encyTDZUMJ5zMLAklat+ya3hnp/sBQYtm33B/cMpQr73eJiVhyaRDuN7tCuEvV/itySXWmQSv9ZJ98ftOc37Hv1dFz+hZj/4gPrgtKSKAYd1pSXh+1rrrKdFv5Tfi710XNceoF05P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1559C4CECC;
	Mon, 18 Nov 2024 20:17:03 +0000 (UTC)
Date: Mon, 18 Nov 2024 15:17:35 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: lkp@intel.com, boqun.feng@gmail.com, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, ojeda@kernel.org
Subject: Re: [PATCH] jump_label: rust: pass a mut ptr to `static_key_count`
Message-ID: <20241118151735.3a47d4ac@gandalf.local.home>
In-Reply-To: <20241118094555.2583708-1-aliceryhl@google.com>
References: <202411181440.qEdcuyh6-lkp@intel.com>
	<20241118094555.2583708-1-aliceryhl@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 Nov 2024 09:45:55 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> When building the rust_print sample with CONFIG_JUMP_LABEL=n, the Rust
> static key support falls back to using static_key_count. This function
> accepts a mutable pointer to the `struct static_key`, but the Rust
> abstractions are incorrectly passing a const pointer.
> 
> This means that builds using CONFIG_JUMP_LABEL=n and SAMPLE_RUST_PRINT=y
> fail with the following error message:
> 
> 	error[E0308]: mismatched types
> 	  --> <root>/samples/rust/rust_print_main.rs:87:5  
> 	   |
> 	87 | /     kernel::declare_trace! {
> 	88 | |         /// # Safety
> 	89 | |         ///
> 	90 | |         /// Always safe to call.
> 	91 | |         unsafe fn rust_sample_loaded(magic: c_int);
> 	92 | |     }
> 	   | |     ^
> 	   | |     |
> 	   | |_____types differ in mutability
> 	   |       arguments to this function are incorrect
> 	   |
> 	   = note: expected raw pointer `*mut kernel::bindings::static_key`
> 	              found raw pointer `*const kernel::bindings::static_key`
> 	note: function defined here
> 	  --> <root>/rust/bindings/bindings_helpers_generated.rs:33:12  
> 	   |
> 	33 |     pub fn static_key_count(key: *mut static_key) -> c_int;
> 	   |            ^^^^^^^^^^^^^^^^
> 
> To fix this, insert a pointer cast so that the pointer is mutable.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411181440.qEdcuyh6-lkp@intel.com/
> Fixes: 169484ab6677 ("rust: add arch_static_branch")

I take it, this needs to go through my tree. Please resend and Cc
linux-trace-kernel@vger.kernel.org, otherwise it will not go through my
workflow.

-- Steve


> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/jump_label.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
> index 2f2df03a3275..b5aff632ecc7 100644
> --- a/rust/kernel/jump_label.rs
> +++ b/rust/kernel/jump_label.rs
> @@ -26,7 +26,7 @@ macro_rules! static_branch_unlikely {
>  
>          #[cfg(not(CONFIG_JUMP_LABEL))]
>          {
> -            $crate::bindings::static_key_count(_key) > 0
> +            $crate::bindings::static_key_count(_key.cast_mut()) > 0
>          }
>  
>          #[cfg(CONFIG_JUMP_LABEL)]
> 
> base-commit: 22193c586b43ee88d66954395885742a6e4a49a9

