Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183A1236455
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 10:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207040; cv=none; b=iN5dNBVV1J8Vpg1zziZCz79/aHSDZOQvtuuEIHKzirWmi8m7LEdUujXnTsZqwEokABeXkliFVxZvXX4T7mCVJ/VjRorOCbhnZ4JYbNCjdXB0lXh/jtleIfJZ+IrJ/pidHLqJYnvcgHFiejHAk4sYusl15LkYIqMqiod1gAi1SbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207040; c=relaxed/simple;
	bh=pIVLFkm47pCR6w+Z+PEWMNYYYxg8mOrqdzANo897rXA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NH2qz/I9ybVAXjtS9hLdNam/nEPvejzUFP9+HeDsMiM4HkPAmkaZkRzN1LgG0jX4MAVc/0o+WwG21nVWzrIsUThiNE4clTgaj1pM9RX7yMAVPa6140bX50vZrVNhRKnnEU3tIPaUnGQsJw5bhzmvAQmyJg0b3pP0dRyQDyYtKdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=iz8umakO; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="iz8umakO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742207035; x=1742466235;
	bh=MbL20IMMOiuE0tyDlYbi7mItlyDlTT2h74sF3mfYft8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=iz8umakObCbHhFhZpKdvjsDl1AcG939QUDlZW+V/42pPgGLjxoQhljGICBVw+ifqU
	 jCqDOeIYM5tqaOM8F+0WygiytvppMT0huCPuKWws+LUWxyvEquhl+OrFd4AgnrLUlX
	 mcd7vmadSKpf+wGaydrpqL9OOilpvuAP6gGjZ2yHDoiYRuuCqpq7b3yKgcIz43W+QP
	 CcFfIYeMJlM58DdsrsEtlhm2bnnPHyrOLkDifY0uXNl0ZHFq8R2cUY6qq/XAkj57IG
	 kJKbuwCSBv36Al28arGbYFOC7N94+XZ7yZgoDOm0FMXA+mrmyiQSVTNqRgt+HWNwYk
	 DOcymEIlHKPTA==
Date: Mon, 17 Mar 2025 10:23:49 +0000
To: Kunwu Chan <kunwu.chan@linux.dev>, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, Grace Deng <Grace.Deng006@Gmail.com>
Subject: Re: [PATCH v2] rust: sync: optimize Rust symbol generation for PollCondVar
Message-ID: <D8IGUG4SGRP4.1JJBWPJ46AJBG@proton.me>
In-Reply-To: <20250317025205.2366518-1-kunwu.chan@linux.dev>
References: <20250317025205.2366518-1-kunwu.chan@linux.dev>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: d737427aa33b14d06bf3f49d07aea7ba2e097d12
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Mar 17, 2025 at 3:52 AM CET, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
>
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=3Darm64, the following symbols are generated:
>
> $nm vmlinux | grep ' _R'.*PollCondVar  | rustfilt
> ... T <kernel::sync::poll::PollCondVar>::new::{closure#0}::{closure#0}::p=
anic_cold_explicit
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

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
> Changes in v2:
>  - Add link and Suggested-by
>  - Reword commit msg
> ---
>  rust/kernel/sync/poll.rs | 1 +
>  1 file changed, 1 insertion(+)

