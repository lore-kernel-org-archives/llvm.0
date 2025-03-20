Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F2D213245
	for <llvm@lists.linux.dev>; Thu, 20 Mar 2025 08:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742460153; cv=none; b=aAM+41tPYIr1DHkDOqJWj56n8cjz1X0pMMsu3rpqiBR8MEGsyLJDTYGJ+WI8dIWoBIFpv1QT9mMWWkB+77VwKjL5k/Zo5wjRCycCV2aJjE/xTCzqiJ0PqfbbDWFG0ENibgLDXluKuPSKqQLdGZjawMcXuj3kC1KCBCzpeNWxp2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742460153; c=relaxed/simple;
	bh=ETHNPzysFdBVxyexfBEmHBJj29mukUKke0l1rtbYB9E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TJiE/BJ4xsId+ofBVChn/ZNC62Fcw6sZidzc79Oi8l4cEVrXzRywGGPYma32dXKZrX/zbPeQrXoMiWew3PheJ1OdW1zfBrB7z3u3UEFN47mnBkHh1UrlAfGnzb2zm1XryEseYJRZ2+ofJGsOTZp788KzxS3bPrxZFB3AVkvlwn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=REWO8g4n; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="REWO8g4n"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43935e09897so3139055e9.1
        for <llvm@lists.linux.dev>; Thu, 20 Mar 2025 01:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742460150; x=1743064950; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0q/pCfHYYPtBzoXiRpe1vIV+5BdA4Fjd+4hDTSR/RtY=;
        b=REWO8g4nBJOb1cGDisAxoiDJkGaVULXVrRylRpFFv3RVGeB0Nnj+hnHeIxzv4FDTFH
         xmPAG3F0o1wO0bqfUFJfI3SKsOmecrd7Liff9RG19n2Fk3lci0ROa1XvXe1dtfIu/+DZ
         etOJy+zeB2OU/63mIf4YLtagnmStiWxJ4EPeRqD+F9lJqg2mB/k5TvaXNNmkZ1yO5XMK
         sP2ZyvM+xJ7cdj4CvLogmxxO7DgXeiVpP0xtCtXTK09UVq+8eyIEF1+rXVaPKVF1diAt
         BTdXqStW91sohkSTnlhqZ+CXiK8Lu6HZ3PSCfKXgR3ab/vuoFVfNXSmPNCZ2CPMCFgYm
         iW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460150; x=1743064950;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0q/pCfHYYPtBzoXiRpe1vIV+5BdA4Fjd+4hDTSR/RtY=;
        b=SWpvTGaUW3nyE6XVpaXpfcmTKoPoZfrehty5XwTCm4VTmLrL8OCMhtqN0UWVupOnGk
         1Ce1IwL532a7+G7tfhKDb4eBN3bUhgxON56Bw+P7DqzOhl+OHnTlpzOawsd8mtSBP7Ku
         4IBWBd4GOOF43n/HBGJOWmke74GAQdAr5x4DfWJ1nUfaDv12wwlHyt4ZvqHI/Busj3J4
         +yOUswzqBFWBmh2DfASKSCjFlHlIycHCxlHJc4+RC9DLpfug+VH8KdMyfrEpcsBTBf4I
         0OzgVE25qFYK8J6aB/NpXs9suG9L0KhH8ASfJ8FzaT7j7D5xjHvbElSOQ4j2DhAcQEaP
         g83A==
X-Forwarded-Encrypted: i=1; AJvYcCVA45rYXlc5PFSe54TR9O0ygyvGQcF9mBaAgPE+N06LSjNk10c2n3lHuqPNEwJWbYgVwaU+@lists.linux.dev
X-Gm-Message-State: AOJu0YxYfzvefVRNQI/0uW5k2+Li8GOmHDg5FJzqQPHTL8XSrBbySf3h
	Sia5e4nmfGuXF6sFd5wKDRQhbewWK8GLuRbn/W9Izs3Dg+j3uS4qEV1ro4A+hmVztQpyayQ0eRZ
	Lt+UHHvNea4rHSw==
X-Google-Smtp-Source: AGHT+IG0ZxbKLoTEaoTwO913p2LfPABAlZp2ArpAG4/VyJdVxYakp4RPsHWiV0l8Ao9KV2sMc4Ra47lUkav23Ig=
X-Received: from wmbbd5.prod.google.com ([2002:a05:600c:1f05:b0:43c:f6c0:3375])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d18:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-43d495bd8f2mr14990235e9.27.1742460149944;
 Thu, 20 Mar 2025 01:42:29 -0700 (PDT)
Date: Thu, 20 Mar 2025 08:42:28 +0000
In-Reply-To: <20250317025205.2366518-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250317025205.2366518-1-kunwu.chan@linux.dev>
Message-ID: <Z9vU9G9A0mneuqT0@google.com>
Subject: Re: [PATCH v2] rust: sync: optimize Rust symbol generation for PollCondVar
From: Alice Ryhl <aliceryhl@google.com>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 17, 2025 at 10:52:05AM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
> 
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=arm64, the following symbols are generated:
> 
> $nm vmlinux | grep ' _R'.*PollCondVar  | rustfilt
> ... T <kernel::sync::poll::PollCondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::poll::PollCondVar as kernel::init::PinnedDrop>::drop
> ... T <kernel::sync::poll::PollCondVar as core::ops::drop::Drop>::drop
> 
> This Rust symbol
> (<kernel::sync::poll::PollCondVar as kernel::init::PinnedDrop>::drop)
> is trivial wrappers around the C functions __wake_up_pollfree
> and synchronize_rcu. It doesn't make sense to go through a trivial
> wrapper for its functions,so mark it inline.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
