Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2835233721
	for <llvm@lists.linux.dev>; Sat, 14 Mar 2026 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773487341; cv=none; b=nEEoL7m7eAKlzwLHrouBJ6l2H17kQVy50Ec/YnGS4nNsylLq+UMBYqHOqwsQ/gB9zBSqo6IMfwMV0qixbpBjubkMjNmtWs8pwojvvnzufHQh9jU5X1W/DL7c8bB2U7d2IbVgcUDxF6WqS5fEaBx1MlEN73VFFGbElPOTkzbVdbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773487341; c=relaxed/simple;
	bh=BDwSY6PmY+B4N3iSEla5L8ypZc2hwAaBOubZVOaCrxA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aDljpTD9mWFEpRLaA36f1aw6xcywOZmC+h0/Zb030Kuqvpj9g1D9QoLS0d7LlvqKTb50YB3WCucqi+tV1tgP8Nh4dw/XIe2KfGergl8Zj8TceAZagMCh/NctIvUvKwNz1zA9to+0GTzLDqA3XqX8OEFhW7jNimZ2IQlkKEXtVmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GrOvOT+J; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GrOvOT+J"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-439cbc5fb4fso2613117f8f.0
        for <llvm@lists.linux.dev>; Sat, 14 Mar 2026 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773487339; x=1774092139; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AIiENy5+TBc+Tmxykx8gjxVXJVl5L84CJZwFGK8GrzA=;
        b=GrOvOT+J60iizsRWysoN6ngI0jiFuv5FKeR1CqayE7roKwpUjUxDIzlkRTBNmUxX1C
         XryfwCgsAqD0oVyJtcrgOQUqPqZdZ07CAABgnqmKCyWuZV1RIWrqv34cp3cmeRGp1v0n
         TIuD1IIQOnYZ++PWoGAoNNnvubqoIEqzcCl5xVOsYaIBBwRNf1r2O3RMuHkjl8e7kSMN
         2Y5QG/gIecI0+/ltZy/L/JlUjXFv9NTBgMxfTC4AOpyfOqKIcfH3MZ5naNH/noTtkgyZ
         HUJh9dTdurZYhU7QcXiIOstbUaqs4tFjsM64rMxcnFsK7MnFexYMyrTAM8dbsIYa3/iz
         MW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773487339; x=1774092139;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AIiENy5+TBc+Tmxykx8gjxVXJVl5L84CJZwFGK8GrzA=;
        b=bLa7r/dpkcaJTVrjsec21uMFIdJd8JDDA83ewiuSvlPeJ52xIeh+1A3XoVKvyyK6CU
         jdjepq/m+4iOIw8qneQEmdlL/f9GkQ/q/gJqsoU+4WA1TnDXUbdX7RRdAiMXU5J16bXt
         ztLj3VpQCIS+f4E7v0ONizn77MwoCz4tCo61KCDO4GwONipslAi5sv1fhVIaLAjUTlMH
         ilzFcEigOL2EdwtXOa5kcte+t2+K6ZLWBjBHQHGAUXeuSFsbRa70f7b0EpmoBTMBnit/
         NKYTFr+YnOeiSRTlt7n9czIx+ahn1fAV+c1qkU4HGqGcdze5vhl/NLue0z7C4vLfgLaT
         EzRw==
X-Forwarded-Encrypted: i=1; AJvYcCVuhc1RN9b2wf74AUYwy1b26GJ5CYevbWNFSuUf26PhoXlDOT6Q9R1JXpeasVOnbC7c5ro+@lists.linux.dev
X-Gm-Message-State: AOJu0YxYVzBqnTDYnsKksk5EACBWNNcMe/oaqz2hdMku1KFFTKdu/6tu
	SoZ3gg29qvPKw0lh9nz1LcErzMjKAEWe/KagRDOU8OBORv1VFE97/9dMInd2XE1Poidw3O4+aW3
	u+q8q1h6tFI5x5zc6iQ==
X-Received: from wrwo17.prod.google.com ([2002:a5d:6851:0:b0:439:cce8:91c8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1787:b0:439:c6d9:7fc with SMTP id ffacd0b85a97d-43a04d95261mr12535461f8f.25.1773487338756;
 Sat, 14 Mar 2026 04:22:18 -0700 (PDT)
Date: Sat, 14 Mar 2026 11:22:17 +0000
In-Reply-To: <20260314004012.GD534169@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-3-beb8547a03c9@google.com> <aasPsbMEsX6iGUl8@google.com>
 <20260314004012.GD534169@ax162>
Message-ID: <abVE6VWCzZfyMEsu@google.com>
Subject: Re: [PATCH v2 3/3] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

On Fri, Mar 13, 2026 at 05:40:12PM -0700, Nathan Chancellor wrote:
> On Fri, Mar 06, 2026 at 05:32:33PM +0000, Alice Ryhl wrote:
> > On Tue, Feb 03, 2026 at 11:34:10AM +0000, Alice Ryhl wrote:
> > >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
> > >  	$(call if_changed_dep,bindgen)
> > >  
> > > +quiet_cmd_rust_helper = HELPER  $@
> > > +      cmd_rust_helper = \
> > > +	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) \
> > > +		-c -g0 $< $(if $(filter %_module.bc,$@),-DMODULE) -emit-llvm -o $@
> > > +
> > > +$(obj)/helpers/helpers.bc $(obj)/helpers/helpers_module.bc: $(src)/helpers/helpers.c FORCE
> > > +	+$(call if_changed_dep,rust_helper)
> > 
> > I think this needs:
> > 
> > $(obj)/helpers/helpers.bc: private part-of-builtin := y
> > $(obj)/helpers/helpers_module.bc: private part-of-module := y
> > 
> > at least it seems to make a difference for AutoFDO.
> 
> Would
> 
>   $(obj)/helpers/helpers.bc $(obj)/helpers/helpers_module.bc: private is-kernel-object := y
> 
> work as well? Presumably, this is because c_flags only has the AutoFDO
> flags when is-kernel-object is set, which is only true when
> helpers/helpers.o is a part of obj-y.

I assume so, but isn't it more correct to set part-of-builtin and
part-of-module? I don't see any make rules making use of those directly
(instead of is-kernel-object) right now, but if someone adds such uses,
then this could become wrong, right?

Alice
