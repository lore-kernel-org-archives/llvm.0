Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9086C23909C
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206600; cv=none; b=fvIYcjj6ctpF1qme3HzvU5rPgm/sAi+QcfFJ4J5Mfgo7oDHCPZfhz6nKaNRKpsehZ+GjtmceDkYMsrzgSXT0VNdHmmYE9vpVaquDBHALeCrxTtwPL5d/Ep07NNbEnZg9s9dT1NekJQe2JJisJbKCDTeWNQL7vdOF5D5RV3mZR1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206600; c=relaxed/simple;
	bh=tAXyC/Z0ZWitiHzL9nvON4Jigtijh73MzpCu2PhMbDI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NBsHsVbBLlsPEdTwwr/uBwAMgaIAfohYKhWsb7r0Ft79qQNSe4Pm4aewKcWoYMvZMNM0hWKJrTWHBKmeKJwjS1Kx+Xpv/IJPG9MTObxvLhGrpSX0CKH3l2Q1DO5yXHlRpXmC4gY31/owPoZUeg60U5hHUrrJELss2DxCrot2t/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ZehzFm9e; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ZehzFm9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742206595; x=1742465795;
	bh=KQoILsilHEJo5usuiJ2jeJyGOMiJd+yx37iGtpQVeHE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ZehzFm9e+0RYuDRbtyUDTPs4sG5OtU3hyazfGtACn6nkBSbTtMzfEBM9xf53BBC6V
	 68krE7OdugTYXo45/E8WXDximPehcXRbg03aDL9GEQTvjNdygLChDdN9Evj1LZCAAj
	 uK0CTzZDElClQtUaIgd0P+7qwWSQJ6ecEXcce09nuwvrrSNI1K/vZQBzj3ChsXqwSh
	 Wp92sYWyJa6qGeYcJwxDftalNHzgLweijHUnnCsfD8Tk5yDYfbNBOrIwNJxIeawdB7
	 uEHM76VU4ThinIyJcoN7Gi3tMVlLh1zC7bGe271p305RaDWU4SGqVfJagV/2d9VkJQ
	 3ESD41nQZ+wSg==
Date: Mon, 17 Mar 2025 10:16:30 +0000
To: Kunwu Chan <kunwu.chan@linux.dev>, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, Grace Deng <Grace.Deng006@Gmail.com>
Subject: Re: [PATCH] rust: sync: optimize rust symbol generation for CondVar
Message-ID: <D8IGOUUTDAZL.7LMGZFOHU4PU@proton.me>
In-Reply-To: <20250317081351.2503049-1-kunwu.chan@linux.dev>
References: <20250317081351.2503049-1-kunwu.chan@linux.dev>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 4f3e90c92b18f37feebf3e6e5057f09b64505ab5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Mar 17, 2025 at 9:13 AM CET, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
>
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=3Darm64, the following symbols are generated:
>
> $nm vmlinux | grep ' _R'.*CondVar | rustfilt
> ... T <kernel::sync::condvar::CondVar>::notify_all
> ... T <kernel::sync::condvar::CondVar>::notify_one
> ... T <kernel::sync::condvar::CondVar>::notify_sync
> ... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::pa=
nic_cold_explicit
> ... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::pa=
nic_cold_explicit
> ... T <kernel::sync::poll::PollCondVar>::new::{closure#0}::{closure#0}::p=
anic_cold_explicit
> ... T <kernel::sync::poll::PollCondVar as core::ops::drop::Drop>::drop
>
> These notify* symbols are trivial wrappers around the C functions
> __wake_up and __wake_up_sync.
> It doesn't make sense to go through a trivial wrapper for these
> functions, so mark them inline.
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
>  rust/kernel/sync/condvar.rs | 4 ++++
>  1 file changed, 4 insertions(+)

