Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DDD405AC7
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775046304; cv=none; b=BHzHONux8ddA9juD/Z3WBnKakAOQ2quPDVkb2nBT4x6lIEU32hclwhgPhXPa4bBl45Iplz/a6cj1cHOEEAhLLgccupeeaQKktDCIf0uw7um8RE2PFbQiFguQJqvXPbh3CfIWE/Jk1uWcdy0qWGZhbfteEsjCFbVxhwBk+yhAYa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775046304; c=relaxed/simple;
	bh=yZLwdPudHgAh/FG2OADadb/MS8JqcR/BjsVN9oFtlNA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qNOLvE/6SBF9azmmjsoVnZfbk4e3QJdJMbAUNztgD2dLBPpWa7267XvMYvTDfZ8sW/kXVK76cIJQQ04gu1oJDrbmlWVUv6adFZgn+HCpDZZyhueMW967wK2HM8UtSUfcs7iVM2FqNAHZMe+nSL+pzynFDkNs2JhgJa3KHLa8T4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X1dQRg1c; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X1dQRg1c"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b940da8ec09so583750066b.1
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775046298; x=1775651098; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ycc6WMg7OLshR/yyfU2jpKKLPa+z0xOJ3hTWvecsxRM=;
        b=X1dQRg1cT9SN/Dmcun721/rZ4Ni5PD0cBY8HxVt5EaGXxLhZnvT1JznUrRIOGsaM+A
         N2NLc89YRdhNnNIo+H6huiT2vFFLvXAP+hKackDCrDQz/uynzqWkJi6BIoqHGE/zd7Z4
         v8on+ij0RmSDWqRGI3Zec9eOBlxX7dZ8PAGun5WCDC59vDDhMH/UkICkUJSfJCpP72ik
         L2sfsmHRg2FgWCFao01MQ8O7HxfOW32aRDJ/q4iOR+ym0r2Y9Rhr71IQUKEhD3QCyU1X
         YDU8iPwo846XAFBUoBB3P2CpA2XK8EXQr5Yx3vU6qVOZ1WBequoPiv34XLJA3vi16GpG
         0mFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775046298; x=1775651098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ycc6WMg7OLshR/yyfU2jpKKLPa+z0xOJ3hTWvecsxRM=;
        b=hCars+aGb7L0Oy0MQh/a51MVXyapBIYMrQQL6rjQmwtQ3wZb6SDj0HZEyQK9vvRHYs
         bZpc5/GtbgNCDtKfcxMMOotatKX6LBL2jy6amUQvGmkXF+2VyfCh+cSRl5ZalRd8bVw/
         WH9O5RnaeHlM4XxGQ5hy/kIxeX9xt+2GeiWxn9DMeghVnsL0a2VXRjZ1Ik3cttz+iQOn
         qafMhhogmqjAwPIAqM4VvM9Vx3aORr1kE+oM5BxTF5fSJHFVI7c70KGDT/QrH+U08hzs
         XR7yL4Y7NWukFuwOTUorUvMJb5hItlBtNcZ5hI18sTPHBmT1CdjLYGzKxzL+YQtTHYH3
         QDpA==
X-Forwarded-Encrypted: i=1; AJvYcCXOELJ0oGpeJwxPuEBuCbl75EaiCmW08eHD8c1/NhDs8YvgshA4+6ymmYZz1rV6rbbOB3j7@lists.linux.dev
X-Gm-Message-State: AOJu0YwgSVrMCpm5/81O9cLksny3cGFPEkRJSg7h/W69oukrKdVpSU1T
	S2jBd7Kf07F2D1HYc17onD5RmBVCGf9eTViCM7HsKoyCOQxcU6feW5sB+wc1hQH6oZ+dHYzVmKz
	BkeK2dyhwUrW5B2wnEA==
X-Received: from ejcbp3.prod.google.com ([2002:a17:907:26c3:b0:b9b:54ac:688a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c448:b0:b99:5f69:9ee2 with SMTP id a640c23a62f3a-b9c13cf93e8mr221111666b.52.1775046297024;
 Wed, 01 Apr 2026 05:24:57 -0700 (PDT)
Date: Wed, 1 Apr 2026 12:24:55 +0000
In-Reply-To: <20260401114540.30108-2-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
Message-ID: <ac0Ol1PaRTWNK6O9@google.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 01, 2026 at 01:45:08PM +0200, Miguel Ojeda wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
> 
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).

Debian really *should* pick up 1.85.1. It contains bugfixes serious
enough that the Rust team decided it was reasonble to release a point
release.

> Debian Trixie's release happened on 2025-08-09 [4], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
> 
> Thus bump the minimum to the new version.
> 
> Then, in later commits, clean up most of the workarounds and other bits
> that this upgrade of the minimum allows us.
> 
> pin-init was left as-is since the patches come from upstream. And the
> vendored crates are unmodified, since we do not want to change those.
> 
> Note that the minimum LLVM major version for Rust 1.85.0 is LLVM 18 (the
> Rust upstream binaries use LLVM 19.1.7), thus e.g. `RUSTC_LLVM_VERSION`
> tests can also be updated, but there are no suitable ones to simplify.
> 
> Ubuntu 25.10 also has a recent enough Rust toolchain [5], and they also
> provide versioned packages with a Rust 1.85.1 toolchain even back to
> Ubuntu 22.04 LTS [6].
> 
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.html#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://www.debian.org/releases/trixie/ [4]
> Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=rustc [5]
> Link: https://launchpad.net/ubuntu/+source/rustc-1.85 [6]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>

