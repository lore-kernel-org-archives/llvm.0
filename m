Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB1F21B9C5
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742199194; cv=none; b=hvY9c1F8Ew3Y6RxMpPm76qzLFb96ypP5tMZVvwyZHBx5MXS+l6vRP1N3Efvyk/SM51mL6+IG2qypWDEqp1Dt8ghkE9Ls1DyNgHGbacU33nsBA4qmljNkFj0IEO2TUB8sKzUwddqJVZmKwfqWw/qXdahp8tOqTHdlWYKdsJ7OnN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742199194; c=relaxed/simple;
	bh=Fjl481HJMJi5cqaKfICLtln5DZ73Bg73coVms1LmTro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceLdOsF3EHEWyLXVPJtqMvzIaj5sX3SuHtt5egLi3m0/vtWpKjHfbPdTGTJ2B0qkt5ylyxlrfDcUSQsKDevR6D440zYGhsHfffTCNTXU/So4AIq3+YSB+Xex2bh/xOLK/p+3J1mGswvIhNdAJU3GdjSONzUWf62Dl9pBrOfBSCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hRFc+QyH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hRFc+QyH"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912c09be7dso2651591f8f.1
        for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742199191; x=1742803991; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fjl481HJMJi5cqaKfICLtln5DZ73Bg73coVms1LmTro=;
        b=hRFc+QyHznLRwosYetiyE360HARimehsIWcxg98pqDrLzW9aaIl2gDtvnk3sXP7coS
         nwTDdb5b9Jc54iuwa7qjwvw7CTYnDO5gKhey1ViwISxwYa5Zmbmm+Ts+PerRBI9ZCTlr
         sFLqErg6gUDmQPtuvjfpGZa57FanY0Oix6rL3pWN336WzteZqaj6IuXNp0HoFiI3gK8n
         u1lctsgCU6qvLI2rdPBJi6CrCL+yKXf3MOWQP9W7tJ4g7EtF4iCG0CXgMMOTlcICbRjc
         P+XEFhtDlfHbsy6Y+bnYPtw6HxWLNmrK7Hm3onuZtpoEueM/P2V2PD6Qh+gjeuitBqdR
         bnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742199191; x=1742803991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fjl481HJMJi5cqaKfICLtln5DZ73Bg73coVms1LmTro=;
        b=Z2bmeFgx2ODDOz3LMFYDtXCwPnOz6pKnS5qENPNFdq8UJ8UiZGwsXTtfMmwu+ByxVE
         wlEaP+a0i8247r9HifZSq3pP3ckbhAi3rdVTQUZgDdRFWk2kIQYoRYdpIohGO+3JBf68
         OC38FsxgSTVKomPqYsjZJhDrBqSqUkRqY3yLHiWVM/RnelYLEWKuJRo8JwUH2hKNCw6s
         yc00mIE1jYafQ9mAcsaMWShUFQFyDnU2jmmdNxNqnuezHcylsxCdcOP7UvU2sxB1Wttb
         pSHrRlbQ0F81Tkyxo4Bf+9bw4nndNNi4obIwCfDKm0Y/3VZ5HxOLbmogNBEIExTztOdO
         lZDA==
X-Forwarded-Encrypted: i=1; AJvYcCXw68wDNp1mOdJosBbwAEbEo8ln8rwvUGFiGsgSKRcJYn/UcJbakO3kHlELsAkiM/ml4bQS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5uuKMkPtRALwp/KkJCXl5UyGk4KQFL3n0OH4+eByW0e/SQTUq
	PnJHMqc5T2srDlcmtvHwqGk4EDyRTHmMSYWIDTgJbJLeDNN6G5OczcrCBMRExBJKRhap2F/mTBe
	YtMy3tDhTA9/uyNMWSzx+/zBo9iXlX7qFu/lF
X-Gm-Gg: ASbGncuqieZQzN72olhtfvvNmUJOwQdrdOEGaysk2ITvS9EVFCNNkf3zl7uWc69ubzs
	zK8LQNtp+80NT31asDbIedSMzHG9WvfLXTJESMPsYW/MvK7PQd/fkAI5N8kFoOH3n8KgK62yOKk
	qO3Z8KuDaQK2AJxRv7VSz+2co1l9EBqbGd9yPcjfPjLtZufVl/PqxI71kz
X-Google-Smtp-Source: AGHT+IHcLqG5WHE0LOJYXKmJh7WPwmg2PfwcibN1in7y/66c7Db4/DiFnCA71g1wAecSs71bQBHGcgcFUkpKlphRHMU=
X-Received: by 2002:a05:6000:381:b0:397:8f09:600 with SMTP id
 ffacd0b85a97d-3978f185592mr10169130f8f.13.1742199190815; Mon, 17 Mar 2025
 01:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250317030418.2371265-1-kunwu.chan@linux.dev>
In-Reply-To: <20250317030418.2371265-1-kunwu.chan@linux.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 17 Mar 2025 09:12:58 +0100
X-Gm-Features: AQ5f1Jov4Za46UZWu9q06eR2JvM-UobNRlaF7fBfeVOrdeJd7W9eiP7leVAj_5A
Message-ID: <CAH5fLgjOvytFDnz0Ms_3R3bA7GymCNrF-T=Du=UQi5GaqfZYJQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: optimize rust symbol generation for SeqFile
To: Kunwu Chan <kunwu.chan@linux.dev>, Christian Brauner <brauner@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Christian Brauner who picked up the original SeqFile patch.

On Mon, Mar 17, 2025 at 4:05=E2=80=AFAM Kunwu Chan <kunwu.chan@linux.dev> w=
rote:
>
> From: Kunwu Chan <kunwu.chan@hotmail.com>
>
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=3Darm64, the following symbols are generated:
>
> $nm vmlinux | grep ' _R'.*SeqFile | rustfilt
> ffff8000805b78ac T <kernel::seq_file::SeqFile>::call_printf
>
> This Rust symbol is trivial wrappers around the C functions seq_printf.
> It doesn't make sense to go through a trivial wrapper for its functions,
> so mark it inline.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
