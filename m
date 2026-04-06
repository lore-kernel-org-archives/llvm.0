Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91D6313E29
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 09:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466500; cv=none; b=cXwALnZniTraGfjrEcnwrTkT4D4HIjtqzerEefX53XKrH80ifAh85v48BXZ5VdFBE/S+aqsgz5OpeZhkM1k2G9RIAP1WlK1kvzmzxVYg7/uxKkzXCadx+uvJkUVpbNrZ0GIQepr2DxOJaWduhEG2/lWvuxEYcR6tXOP6a9avcYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466500; c=relaxed/simple;
	bh=3YZIVULe2x3GuZ5FghsA/nQqzGCzL7FbP1sL15aYCEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mai4sSyNtG1skLW3hw7eRiT4SkvuSP/XT9qGnaho95OhxtZEEeS9UU+eF53EgetTGWP6DVA4pStbLAhDYatsAGTIsd9vppxj9coYNbSEAJTW/GQq+JeBVG32hPg+FiNF1icIuvi5SSn5OBz0reZm0qf1ZEED3mSRquFdrnO7qZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lp0Zr/o1; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lp0Zr/o1"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82ce09b4197so1507225b3a.2
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 02:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775466498; x=1776071298; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2DC9+ivYheyMqrfOIx67QW7cPRjoGiCh9Shramalnog=;
        b=Lp0Zr/o1JFk8x8iR831iLzwDcEIu6cxIxm8JyDyIxcLDJBM+x+HrZJDv2kc8Ajvb6i
         D8HC68ysiA4IVOXGHxfK+zzf+tikRRgZfIGEF3wPaklRHgSujWVy/fb7DRPtnniTr5KR
         lE9WA3Ie6XVVlhAFGBHL6WBViXvUsgLFkSb1Ry10i4G9Y4mSWPENfuFnFvn10YtrDq/1
         htTOJKigy7QxoGbBf5fcpuf8toNv4XmSulTolHvBxda3vKIQ+4T/eC/T4pwNvM3cGuux
         ot1NdLiDpa+PoE7TMZ8YBXDDM6I92JveuOgBsUg+Np/FwcAV+fUD0PBl8CmZWaLBTHMz
         8lNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466498; x=1776071298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2DC9+ivYheyMqrfOIx67QW7cPRjoGiCh9Shramalnog=;
        b=i3S6F3kjlNlx8qyDbow60yiWd5O4wq8I8SxDafim4zjcb0HypLhwkApOxd8YJIxALv
         JQ2Sr5kfYGTi7CtX08oIFEpKD2vh6UusWJ05/kOE8yjUZXgfZYfsNu1hwVBv5v+6yn/F
         6BeqcvnF0pBYupjeN7iaHIh7KxMexaU8M+XbO4bpmk3fDAn9aURDfbAWhA/1AQnFHt+G
         T3RHB7AaQ61s8Hg+06uXjQL4es/4+qBNCbPtchf1vCML+cRFQSyp3qUXeeWAnuZsbjCr
         wKDhtE0WAWPX41ipKHR+DxxdKhTMCPbP4a7ZC6ZZVF2X6Q2VWwZFeEQTx2RLToQGkPjw
         1vyA==
X-Forwarded-Encrypted: i=1; AJvYcCXNp5KCEbhLD0HNBVSYCmYKz6yZeykbq7EEMDNsSobAEdXOHD17obCrUlQkExqvscksejHq@lists.linux.dev
X-Gm-Message-State: AOJu0YwDfteTt9d2PJp9/y2YWznS6TG4+tX4YFPfCxOxA7W9z6JdIo9u
	ttNQm0igmH6y/ZKKlQmsR7TNAySvevMUG66JLoBijjmqgZbdHiC/hzYw
X-Gm-Gg: AeBDievUai7fbf+2taAuJYywYNFy9+hjqIoEvEPgK/p7s2A6M79afxn/Oz6bRI6Jvkx
	K/2ebJ5k2Uisbfnzc71Szh6Z3iQjjHwb7ioc7THaVGEzbE2MOLo1uvxEUeSGt38u2CqFDtKp5B+
	N22KTodUtvf6xRsfJNx99sJ6rzpmNarWyUYUjjAO0Rcc8GZPVGwzD55eW8rTN6/HuTzDVK78ilD
	UMn9MxM5jAufUx6yhpdTuJ/EwWcFpTCYj1kb39XvgjHG5Z4bs0DMPVxkOVnfz8s54meS9JohR75
	lsM/m1+AzPG2hz2G15RuZOAatNiyKheXvVgXyo8c+IvgGyS/74BuQpp74i4F/i4bTgHjBI1CcwQ
	7QC3InXygkTmNvynRgCvFBMp6VkyZuqVDda2A6UQN4wawlDZJvKgjr3VypAThmD3VOitwO1qXOd
	hAlMLoRwuErzJNRl2GYrcUnFDdC4Izen7myYtWG5ur6QKsDepTvHH9jjDJdMQj7TbV+10=
X-Received: by 2002:a05:6a00:4649:b0:82c:ddbb:7db3 with SMTP id d2e1a72fcca58-82d0da8bc37mr11678758b3a.25.1775466498220;
        Mon, 06 Apr 2026 02:08:18 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9cf065asm12787649b3a.8.2026.04.06.02.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 02:08:17 -0700 (PDT)
Date: Mon, 6 Apr 2026 14:38:06 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH V9 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <adNuUxsGl_Tm4Nd7@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260404121610.1956528-1-mkchauras@gmail.com>
 <20260404121610.1956528-2-mkchauras@gmail.com>
 <CANiq72k1KN68wG_dh0GcTyfiXUyrVUErJ5D8AOaV6z6=sX4BAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k1KN68wG_dh0GcTyfiXUyrVUErJ5D8AOaV6z6=sX4BAg@mail.gmail.com>

On Sat, Apr 04, 2026 at 11:04:08PM +0200, Miguel Ojeda wrote:
> On Sat, Apr 4, 2026 at 2:16 PM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > When building Rust code with LLVM=1 with -j1, rustc was encountering
> > an error:
> > "multiple candidates for `rmeta` dependency `core` found", with two
> > candidates:
> > 1. The host's standard library from the rustup toolchain
> > 2. The kernel's custom libcore.rmeta in the rust/ directory
> 
> Please clarify in what conditions this happens, e.g. when building
> natively in an architecture like powerpc for which the target (...)
> 
> Otherwise, it sounds like this is something that would be happening to
> essentially everyone just by building with `-j1`, which is not the
> case.
> 
> Also, since you may need to reword a bit, please take the chance to
> use the present tense to describe the current state, and then the
> imperative for what is changed. (The past is usually used for
> something that already changed in the past, not for something that
> still happens before the patch is applied -- I hope that makes sense).
> 
Yeah this makes sense. Will reword the whole thing and send out a new
revision.

> > - Update rustdoc-pin_init to use explicit --extern paths for proc macros
> >   as pin-init also needs alloc crate from -L$(objtree)/rust. So the proc
> >   macros needs an absolute path
> 
> As Gary mentioned, this list may be too exhaustive, i.e. one needs to
> see it in the diff anyway. Usually what we do is try to summarize, and
> most importantly, explain the "why".
> 
> Also, it doesn't seem like the list covers every change anyway if that
> was the intention, e.g. the removal of `--out-dir`.
>
Ohk, will rewrite this part also.

> > -rustdoc-quote: private rustc_target_flags = $(quote-flags)
> > +rustdoc-quote: private rustc_target_flags = $(quote-flags) \
> > +    --extern proc_macro2
> 
> Hmm... why is this needed? The variable already carries the flag, no?
> 
Oh yeah. Will fix this.
> > -               --out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
> 
> This looks like an important removal that is not explained/mentioned elsewhere.
> 
Ohk, will explain this in commit message.

> Also, is there a reason why we cannot keep the `-L` here instead of
> adding it in every proc macro library?
> 
Will move the `-L` here instead of each lib.
> > +    --extern pin_init_internal=$(abspath $(objtree)/$(obj)/$(libpin_init_internal_name)) \
> > +    --extern macros=$(abspath $(objtree)/$(obj)/$(libmacros_name)) \
> > +    $(call cfgs-to-flags,$(pin_init-cfgs)) \
> 
> Hmm... This special handling isn't great, and the fact that it means
> hardcoding/duplicating `pin_init-flags`.
> 
> Should we move the proc macros too?
> 
Let me find a cleaner way to do this. Will do something about this in
next revision.

> > -               --crate-type proc-macro -L$(objtree)/$(obj) \
> > +               --crate-type proc-macro \
> > +               -L$(objtree)/$(obj)/host \
> 
> Spurious newline added?
> 
Will remove this.

> > -               @$(objtree)/include/generated/rustc_cfg $<
> > +               @$(objtree)/include/generated/rustc_cfg \
> > +               $(rustc_target_flags) \
> > +               $<
> 
> Why is the variable moved here?
> 
Will fix this too.

> Thanks!
> 
> Cheers,
> Miguel

Thanks for the detailed review.

Regards,
Mukesh
