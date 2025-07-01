Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE792797BE
	for <llvm@lists.linux.dev>; Tue,  1 Jul 2025 16:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388438; cv=none; b=r6WvTAYkazSdGMmgbsLPAN7j/5bAmvyADKgZzg0fHRN0HUsIS94b3K4xatmxwGIJNuO+Vh6JwYVCqmJBUDdYzHmta1S97RydgPQq2UBAoPu3LCJlirDUzBOTjwlUVuD4T9y96lT5+San7je33ywOGf8VZA0AzW35a9ZIQAEJz+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388438; c=relaxed/simple;
	bh=ymyz98G6WAIWhgot7OyS3l+nPaHFTvJsU8EnPPnV3hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmYlgSW7XfGHmNWqBy6Tl0YPHjO6d4MlhSz9MDHSRtTmq2tZZ6YMhiqHIxYNIlOt80Tv6T02gBxmNxwgSDGhlFePvajGANFpaxPmJpLDbgfVAk3EcJPRIrxkEGYcpB/JhfwHTIwxm8+eYwG96hkhYsMcwZFM0FecioILuuMZBxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuO8ssnt; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuO8ssnt"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b7123edb9so36217631fa.2
        for <llvm@lists.linux.dev>; Tue, 01 Jul 2025 09:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751388434; x=1751993234; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymyz98G6WAIWhgot7OyS3l+nPaHFTvJsU8EnPPnV3hw=;
        b=JuO8ssnta8vkNFxfMif6VRcpg0ZuttjQ9UBoVlK0QsEEHgh2jvvgCwlWUvxEl/XXwg
         QD6vUUH7jC1vFL+FR/KDyGxa3WkjBhNRCnD793TJAQdCQ2RUvpuef6p1tERIFyf3Z9Fu
         A9ux7xSKV3g7dQzeh20fQ0zxqzRbkoTXERyKSWbHRwnmZZkXb23faropBjJ4ffwJDyUv
         WYXrI1cangTkXU0BkEKcDtVu7asyqaecvLpkdGFYk6AJujql5okJ2AqX1CP3p9/jmat5
         Zk0M5qhSM7ePANaKETf2j188yKLJaPVDoko60h6UGTu0cFrE+wE85o+Cey3pPu9ZIJbk
         ipVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751388434; x=1751993234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymyz98G6WAIWhgot7OyS3l+nPaHFTvJsU8EnPPnV3hw=;
        b=ZPdiwawLd/mAi10klpK6yWVMyrYvy6C+FUk+Tc0Tgh6G9YhbZI/6E5iAnhhBpbhVJk
         wmlNhvDTGQzya4J5BU8VmDET9r0fL172Y9MFCEL83djMjOxl3ZaHe16fw0pJULOppSmG
         GOZwjOEbo0UtyL/5yl3k/GAgJJrTc5ESUxtep9FEaQyUg3LBCwUabTqiyJeKN12JsC2P
         Xa68w+xFWqGRRkp1S+NPKdOvyjw6gXSws2QTeWtt4zYpZO8NrUqTUIlVYFJIKJAb9/bc
         t0CfVHS/JFOZLIKbN0E/Xo0LAD5g+OTrhLf9N9sjYBq2AIPzQdGRlSTlr+UFIASsqQyP
         PPRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW3n4WAn5pV9Evospi8mudu67XvUHviV5OybVrMlnkT+0lR/CWDJgg+lejHImiG2Q5c7T3@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz3cqJds9Mtv5pi1hy2k14BzM58KRg3lrEvlwYlZavBhCmYJIu
	7BX71IthM8VcGTY8yVXt9KlByvJycXuoqSIz/qHQGuRuc7U7bG1lqIf/G6SC7ShrbGBE/3tznRg
	kMlOaMuYCbhFDDJzDb+7NjVWAKYpDo+A=
X-Gm-Gg: ASbGncv8u+Xql7WhI+xSBy4BYFYViMBWuZ4Cr9bzldMn9uzlOtxEgoNORe5HYZJiFyf
	ums+C6RaVIpqtS7BOWwkBIrbDIO2vxfXV/u7nQHYpnpikIG6u0H7kDZofsp1RBQQ6U/YQ2e0dNn
	6jALJ4evL8JSBJUEcc3DGvYgirdm0QQ4vSLUdIoBnmgA6ZcGTM/JuLUYlN5nQSvq8B2whck3X8C
	G3z1A==
X-Google-Smtp-Source: AGHT+IFASHXyh6nKAuBWNflJbwzC1dxAvHKvYXKVWM4leUPhMKpN6FRK5U0/hoCDkOtFemkDVZIaXGSG2DOrBLCq8Rk=
X-Received: by 2002:a2e:7c08:0:b0:32c:a907:491f with SMTP id
 38308e7fff4ca-32cdc464463mr36198291fa.15.1751388434129; Tue, 01 Jul 2025
 09:47:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com> <aGO7-SQUUgg6kSVU@google.com>
In-Reply-To: <aGO7-SQUUgg6kSVU@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 1 Jul 2025 12:46:37 -0400
X-Gm-Features: Ac12FXw8AGP83JXgR8yzKwPiapZfBBkrNyDazktnve1kCOVkl79eviuMomA9o84
Message-ID: <CAJ-ks9kbsTRrRN4yP7GmphozPyZHgbaAGJmLXR42NVgJ1ie_SQ@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] rust: replace kernel::str::CStr w/ core::ffi::CStr
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
	linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
	linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 6:44=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Thu, Jun 19, 2025 at 11:06:24AM -0400, Tamir Duberstein wrote:
> > This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> > have omitted Co-authored tags, as the end result is quite different.
> >
> > Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vad=
orovsky@protonmail.com/t/#u [0]
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Overall LGTM. Only question is whether we should re-export
> core::ffi::CStr from kernel::ffi. Reason being that right now we are
> telling people to never use core::ffi as the integer types are wrong,
> and I think it would be nice if we can continue to tell people "never
> use core::ffi".

I agree that'd be nice. There are existing references to items in
`core::ffi` scattered around (e.g. in rust/kernel/drm/file.rs); it
would be good to clean all those up together with CStr provided we
have some ability to lint against new occurrences.

I'll leave this as-is for now since this series has already churned
quite a lot, and the cleanup can be a reasonable first task for
someone.

>
> Either way, for the whole series:
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks! I'll send the rebase on rc3 momentarily.
Tamir
