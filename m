Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882B94AA1C2
	for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148022; cv=none; b=l25OoDwlONJVeqsJylTUWXdsWB3qDQ7eDdlalnYRs+3YJIt43+t79aWqnfMcmqwkynQCJYCyK6TpEvwlPcuHWL2uCgE71l8V0PsREuDWbm+Qx0ySY326elBMiv12nNjD97SKXSPZosDH9/Aek9Mz/2JTH2dBXczJcCyNnZarIzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148022; c=relaxed/simple;
	bh=76bsxwDnANEo0kLB2mrhhQlwm4C2VGFZMyLQwWFFfs0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihDoIeLXKT7tZzbccHQiRaEJWkIT21Tauf8mChPFSjLLSxutKK6s2FoCcqKtDboIf6zbLD8Cx+IrSdK9I5t0XkiUYZTtq7IMgHqnjyUfE2PGwNdDcRdDYWu6Qfw16TWpo4GAie4VDThqZos3ECWioz+WEQoFNFhlTRw3NQSGVk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkB5mUJG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkB5mUJG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so959815e9.1
        for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789148015; x=1789752815; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oHkfE3imp4BQyC9rRB22q5PBnbDLbNtc6L6K0uF99Ik=;
        b=SkB5mUJGzmrVEE0x2n00Llybi1gIxbmFLaL/LB7KhIuMuZwfXup0/aNOe2xdi02r2Z
         J3Ty9K+Ns7z181twTO8Hok2MU5CVDqiRRZA+48mPbPFgPlBQ+lr/V62pY6mGOTOg9xfM
         XxcMdd+lRHepMxBZXWVQiylL3ovQ6LTTls1eXO5150RcOwijX34b/FK790IxrQR7YiYI
         p3JrZY2EnUXTgCrZGfyOlDAMXHXVBaDH0NONO5ZWvL8HipbRM29N/jCVv/f1QE7+8SKS
         sRqyR3V+GFwa5iRhjP47PfqUKPRcQ2bBkkZlPVirRKqtlrMEnHkbXDdf55CX2GMY1g3R
         fdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148015; x=1789752815;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHkfE3imp4BQyC9rRB22q5PBnbDLbNtc6L6K0uF99Ik=;
        b=AVVMa0jNL8+6+M7IyA4h6jzTz46mLrSrMq5r4WCM2jYbduq2v67a4B46nifziCK/99
         r0IVQSoJz5TWwdv3Lw04HWT7tqwyQ1qJNk6jrmbkPH5QOSew5Xnh/pHDr0IWaPjZgEds
         MLP7bUKEnE5bJs8/aV6zdvEtNqTZ8tpV26QzmEPMldsXRb0RssB/RMMhCyDrJUA+Oqlb
         oY06wNF29Om9Rjats0KxKksWPqP5Zh4GC4VYxN2A0O+K788lIiWt+6F2LOu+e6mFqbX7
         C+y485t57fDcVz1rkbHHD+aAq+i6y3c6gCI+CVeiCFOB6m6wH5ue4QAvAP2NDEhY4dOU
         HoQw==
X-Forwarded-Encrypted: i=1; AKwUvBzSPBPfgchfmiyr+SB4EnNR2Ywp1sOf7jvhby5m3exEO1Sdv2y05kyccMEVVJ/TzI4oA24Y@lists.linux.dev
X-Gm-Message-State: AFuF++m7Olw6J2GUofrITTlYgodJpGoVqH5idCNYhSfxFO+fQRaV2l/h
	iJk6RY2vB6m10/3ueQcQTFJdsHMotJr2rps+b0mTlFGXp468dSGHB5Px
X-Gm-Gg: AYBFou3EPdmYdOdLAUpA6WoCpZ6fkMbTfUkgLk1tZbCMcIaIMo74i11lmaTZrEAe1ka
	qFB7AvlI90UEpZON952uil3S6/6/P9gMfipREIBOee+a5Y+bC2QNMAoELCl35Ak6rPJhJCea1LQ
	mel4DGj5e0czgPxTGhgDqILMRkOGJMY6qvtCYtUqkQJTDXF3sDMZ2gKipG0i3VYu4LPSHT8m68B
	/KP3BbDNR3lcVrVQmLgSUBMbW0EA9md+eNZvr5kf6CUOTSOHi+k/uDy92OvLW4GMmv+0mJQRuj6
	WCiLWeRWJX+Ab+2VuKUrhVDg6pwNyowvBqJN4NRuDgrEU/usQvdgpasK5vXKTokMBVKz49dcAX/
	fuFniFPSeeuRWVEHaRGVEoLYHXYIqMt4Kdcz+0zy0mT2zOECpYQrsUbcHPyaKaR8lktZ13eJttf
	TpuVxEQK3JTThnJ98Zeyth9rAi1FS+PA5dCK0W/XVKmPaWJMfBoNlZvQb21i+hhtJFY5IzPNcz1
	eYUT5byynylebW8St41sraBAZ3qy/CtpKwn
X-Received: by 2002:a05:600c:4e0c:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49e6198734emr158528945e9.6.1789148015226;
        Fri, 11 Sep 2026 10:33:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm80821885e9.2.2026.09.11.10.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:33:34 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:33:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Schier <n.schier@fritz.com>
Cc: Nathan Chancellor <nathan@kernel.org>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <20260911183333.1df0f2e2@pumpkin>
In-Reply-To: <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
	<178901395292.3971858.13236774094648272066.b4-review@b4>
	<20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 17:42:35 +0200
Nicolas Schier <n.schier@fritz.com> wrote:

...
> Yes, skimming through the patch, I thought about that, too.  Moving more 
> cc option checks to Kconfig will make building out-of-tree kmods with a 
> different compiler more dangerous.  Maybe we will have to make the 
> warning in Makefile's prepare (external kmods) target a bit louder.

One problem is that distributions have a nasty habit of shipping kernels
that are compiled with a different compiler version to they actually
ship as a compiler.
In some cases the versions are clearly the same - but the version
strings differ.

David
