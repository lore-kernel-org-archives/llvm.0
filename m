Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26C433B96C
	for <llvm@lists.linux.dev>; Fri,  6 Mar 2026 17:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818356; cv=none; b=TB2tvsjlNwA4+K6hIHqLyL7S/+zyX+IR6eLcpuhn9xd71kVakeaXH73h7Ws0HWgARsV/z8P3ID8Tr9Y3zer7mpl4+TXD4QvKqrDG9a0AaKZCOif86swZ3QGTcbfezgdY5oNa2BR0VO1lKvvDQiMlbWdRnY4hIrEWiamBI9u5FyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818356; c=relaxed/simple;
	bh=bIxrx4KoLTRQn4XRd5Efn4xp/evATyJ+zwU3/uVKTz4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=czY4+ve6oe6NEbSczcNd9kyLyF0u+iJSwX6NMm2g6mK58l62pH1vUL3YlqB+i7MyQwkx22el+qeLP4QkqsBTpHAcosHKAUS4wflrdFx5VclEtwXsTftdDfPELdl2+A+DhG2sQtTdE0xw2Y3ia1L6ViDM5SI6i7b2yjq+HzlqaIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d/e8wfO0; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d/e8wfO0"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4832c4621c2so106573815e9.3
        for <llvm@lists.linux.dev>; Fri, 06 Mar 2026 09:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772818354; x=1773423154; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/vcQthuk1eWzIx9SkfXAplSVF+zzfp3bHB4lRD3w+Jw=;
        b=d/e8wfO0qiVMis3wU+4VI09wV6B3bum9pxQ8Z0sbYw2hZ6DxB10Ag+EP5SsAEMgkHc
         4Pocl/v7g0ebZXml3dMo6Y98+2ZNUXwdTVOJ3x9a4TN4idCdHyEtGqP4WLBMi0xrkSbE
         Xn1LfOPPl3OtN+gr5a77+XTWqplNZMQS/Y6fa9fgpcEBbRf3bpbknDlNT83ZHGRGUuYm
         WS8Vm1f/x6LBCPZzkZcDrytdU2lp3Vq6teh+9mfY+FtwMQg16W4SIMZ088WCO8l00Yls
         cKXFz4stfYXTWspf/JYgeJ7UGD/8mm6kbLUw1YPC20hGr2Y+NEfGYIlup3r+eAAI6dBA
         IU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772818354; x=1773423154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vcQthuk1eWzIx9SkfXAplSVF+zzfp3bHB4lRD3w+Jw=;
        b=Xr462ruaPqBRvMcwAUXCK0odIsRePsnmv6Vz2Vt0wJJfttvbzlqXItkRH/hWP2kA/w
         zdWCJrbeKAUIy5dmF+UxBAEXyEt7tsZejLhjw22L+NFQqCN+BQDguTaZtf8mxFx83chR
         77mRiRoD8HDrNLO3Fbn4xTAQpLTsYI0TDJljKAUXc04F/aCOgr/sjvKreUFX9qLYa32c
         2UTlukPmABwA8vEfN5nVcB+sBeg1kQcm+0AbsxVtt8/jPgrVNhqJMZWJjLhsglpHVoLQ
         ILOZjf69dNvrj8KdgnHjDaCfSWW5ycUadUy2acOe+Dh9ea/NhHxMNA+qoTWKG0d3R0vP
         o7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7/d9B/7M4lrMADUVpFEpzxHK0BWRr0LITOYRZfPf/McdFnAdmL58n2YIBsXG8moPxGOkv@lists.linux.dev
X-Gm-Message-State: AOJu0YzT1t5OeDIzGKCeYae09rmgYcpTyGM/55P9xZrKTkKNbvt9xKqs
	zcrKFuAMu6+UsFMtymitjFrEabhkf5PvjLFmTvUgwrXaIXzUvGRz+V8Ku8sF5f9kI49xHmRPYw6
	uozH9m3r3ivXSYvPT0w==
X-Received: from wmc2.prod.google.com ([2002:a05:600c:6002:b0:483:43e2:3e67])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4710:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-48526978dc0mr46728455e9.31.1772818354024;
 Fri, 06 Mar 2026 09:32:34 -0800 (PST)
Date: Fri, 6 Mar 2026 17:32:33 +0000
In-Reply-To: <20260203-inline-helpers-v2-3-beb8547a03c9@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com> <20260203-inline-helpers-v2-3-beb8547a03c9@google.com>
Message-ID: <aasPsbMEsX6iGUl8@google.com>
Subject: Re: [PATCH v2 3/3] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 03, 2026 at 11:34:10AM +0000, Alice Ryhl wrote:
>  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
>  	$(call if_changed_dep,bindgen)
>  
> +quiet_cmd_rust_helper = HELPER  $@
> +      cmd_rust_helper = \
> +	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) \
> +		-c -g0 $< $(if $(filter %_module.bc,$@),-DMODULE) -emit-llvm -o $@
> +
> +$(obj)/helpers/helpers.bc $(obj)/helpers/helpers_module.bc: $(src)/helpers/helpers.c FORCE
> +	+$(call if_changed_dep,rust_helper)

I think this needs:

$(obj)/helpers/helpers.bc: private part-of-builtin := y
$(obj)/helpers/helpers_module.bc: private part-of-module := y

at least it seems to make a difference for AutoFDO.

Alice
