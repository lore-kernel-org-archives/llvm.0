Received: from linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB3344C4E9
	for <llvm@lists.linux.dev>; Tue,  4 Aug 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838328; cv=none; b=D9VrIMSmZdu1Il/SFTB89Dtv4xEPGvEFCzKT3URxPmPJSBoHUFkqE/kOCx/nJd9DPTi3TDSOrUWOAbQMUuNBqhZVe5Epevzy8yRIFaUA9GnkDd/p+90z6WUfTLnvilPTC8xGWqZz5R2kVyr+B3kezhuerAWV9WScCizXWSiuYp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838328; c=relaxed/simple;
	bh=E6vlVZcAvaRJu2HM3NBQiziSGME76eVY7ZVPFBuh4Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgKDRtBPhdbmkMP4rlJgJaac380laYxwvEsgYRk3qF1HQue93Ng4ViuxuqnOBK4nJBJBOWA9ugrinWozWG65Q3vMOIcO+OYEp08Ub24k7bfeqwdiwqBo/Hu02rQoNIoCHBssk9WRn/YyxHIxSvqopeY0qdEpKEHpVu7jOkAS0uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 2B6E970A02F6; Tue, 04 Aug 2026 12:11:57 +0200 (CEST)
Date: Tue, 4 Aug 2026 12:11:57 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org,
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com, gregkh@linuxfoundation.org,
	prafulrai522@gmail.com, nsc@kernel.org, japo@linux.ibm.com,
	lina+kernel@asahilina.net, j@jannau.net, airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: Re: [PATCH V17 0/7] Rust Support for powerpc
Message-ID: <anG67Q6Y59kDqh-c@desktop>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
 <178574013457.29744.6211258618175255546.b4-ty@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178574013457.29744.6211258618175255546.b4-ty@linux.ibm.com>
Jabber-ID: linkmauve@linkmauve.fr

Hi,

On Mon, Aug 03, 2026 at 12:27:13PM +0530, Madhavan Srinivasan wrote:
> On Wed, 08 Jul 2026 13:54:47 +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > Enable experimental rust support for ppc64le and ppc32be. The patch for
> > ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
> > merged over it. ppc32 needs some toolchain fixes mentioned in the patch
> > `rust: Add PowerPC support` and the discussion for that is done here[1].
> > 
> > This has been tested on
> > - powernv9 hardware
> > - pseries P11 hardware
> > - pseries(9, 10) qemu
> > - powernv(9, 10) qemu
> > - rustdoc on x86 and powerpc64le
> > - rusttest on x86 and powerpc64le
> > 
> > [...]
> 
> Applied to powerpc/next.
> 
> [1/7] rust: Fix "multiple candidates for rmeta dependency core" error
>       https://git.kernel.org/powerpc/c/00cdfd072c709c608606461d7d44d4613119bfa9
> [2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
>       https://git.kernel.org/powerpc/c/be809b60cbb61aab96179f44ac3670242ae72996
> [3/7] powerpc/jump_label: adjust inline asm to be consistent
>       https://git.kernel.org/powerpc/c/13244c0a40139fe66c4c5c5655f4d732a6002957
> [4/7] rust/powerpc: Set min rustc version for powerpc
>       https://git.kernel.org/powerpc/c/e299147cdc8e19c6421a6b7863dc82a35b09d967
> [5/7] rust: Make __udivdi3() and __umoddi3() panic
>       https://git.kernel.org/powerpc/c/c93c194e4ee71a734986fd99a8b1ec9fbb7a9b8b
> [6/7] rust: Add PowerPC support
>       https://git.kernel.org/powerpc/c/73b741adb264967093ef4eb59905618a7e0d0de0
> [7/7] powerpc: Enable Rust for ppc64le
>       https://git.kernel.org/powerpc/c/bc87cbdb952e9223616b839d64bdb4723aa2ed1d
> 
> cheers
> 

I just tested those again in linux-next, with the Wii support series on
top, but now the kernel fails to build due to ARCH_WARN_ASM and
ARCH_WARN_REACHABLE not being defined on PowerPC:
```
error: no rules expected `ARCH_WARN_ASM`
   --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
    |
  1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
    |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
    |
   ::: ../rust/kernel/lib.rs:279:1
    |
279 | macro_rules! concat_literals {
    | ---------------------------- when calling this macro
    |
    = note: while trying to match sequence start

error: no rules expected `ARCH_WARN_REACHABLE`
   --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reachable_asm.rs:1:28
    |
  1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
    |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
    |
   ::: ../rust/kernel/lib.rs:279:1
    |
279 | macro_rules! concat_literals {
    | ---------------------------- when calling this macro
    |
    = note: while trying to match sequence start

error: aborting due to 2 previous errors
```

This is in addition to the bindings::kvfree_call_rcu() call, but that
one is already being handled in a different thread.

-- 
Link Mauve
