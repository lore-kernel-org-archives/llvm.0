Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B322156C
	for <llvm@lists.linux.dev>; Tue, 11 Mar 2025 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741679030; cv=none; b=ZxyMQwPudPy39kVtqVlkj8FVZmAIBApOCLvwt63J3n6Da+7gDlRThaE3QsmahJcRbovYbAMGH1DPmoX27Aa73LFiwKcu+kn7EFBwUKgA5pvtITdbvCFkCq4R2ruPzaDxTiTqTncI1Ae7NAvUyhUzOUXllfq/F8HlR7DaiBEQhv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741679030; c=relaxed/simple;
	bh=rEB1phDGuMJuuHMPeNJgudH6DWwTHq/O/9wLKkeg5Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iwqq0Qmeh9K+CkWVbsbqPM+p0WOu4gsLfLoGwv/juIvBhaL0h2ngb3wgm8fbG/sQVUUhoX5Z6/shkEyBELlssFJgn3ZmzSi5FvA1j3GazT1uhORWG+kFROJHass3mpW+wQimCw+3ckRWCYBX/JNA+OU6sv6iD3Yct5ZlHBUqFfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2kDR/Pvt; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2kDR/Pvt"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2441287f8f.3
        for <llvm@lists.linux.dev>; Tue, 11 Mar 2025 00:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741679027; x=1742283827; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEB1phDGuMJuuHMPeNJgudH6DWwTHq/O/9wLKkeg5Fc=;
        b=2kDR/PvtHUBRtpu+o9NDgtxPgyt9kZOtFuOUIqLOiYiDDS+4vQWkeOyxKx6B/UdvlO
         ywUcMeEC+HsVXEQ0Ba7bds7hefMg1k5k63+I92/rVcgqfmVmAJ+KgFExOesOoWDAMO9m
         y7424XXJ8TVdaNOsfF2+WIIR3ozKj23aRBqy9EU9G3tmpnNC7Q7zWF9lZNFTPO2aCmdV
         Ho2iD7dcM7TnJW1e8L1eeUuuwqr5miMGE1sMkafVjVNj3+wQRZJNnHmf7zbUNfJ+UUzh
         8eXJlu5ok2rr1hLkAmgMTvJ3q0PAqtWhMQBKcUOXOE9mquloWOt3+wAZSoUmZSS5OpFv
         /Ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741679027; x=1742283827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEB1phDGuMJuuHMPeNJgudH6DWwTHq/O/9wLKkeg5Fc=;
        b=ldN9KL6KV4g5Ff05ejef1wpTR1z+IkwaQNnlXDVmpx9LgxezBbWAozLI90M08T95Ul
         ipiVKjH+G30NVt0s6IUda/59huBZRQqkmNmOi1qVZUOnG+VvWneVIM6SzrMomrn7Ns85
         lTH0/miW5zA4aKFdROsFBiKZxGEr7rDsLoS+kuouFAArwYOYJtk6WJ1Mhdjg+K3yWEpY
         WREFtnCOLe92u8u9xXMSCripsdj5i7PX2lY3nsqw1XRjSOFVvPg4MEfZg1xQwfJiePXs
         RmIXQo3M7ufp8KctbIW971hnpLHh7EVEwEgisZ+ahjKuQ+gwOZxveQvybRqpkANAekJr
         9N7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWG9a2jwUVXBz+enCFSxlLrqBoA/uwmU6LFBoPc+1FCLxVEBbbUgS96FNZA69aIAldOG5Fd@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9B96Fb3vzOmGZfmKzAPqpU3e3faoLhh8x7nE//sEzLITupdje
	1xDkPTS2+hmEw/HdQkuTgqYU4z6Aic33NnoJge906fMSlxFlDuo/q8ez57Ykxj+Im0dgkUpxxCw
	fZIX2KLotmgftrMpEZDd4xMijaFYkohwlGS7n
X-Gm-Gg: ASbGncuLdk6ikG1L+TdwS77nYXc/OhNkJuke8Z0fZ4L0wJy8/nJC4TwhRVjbdegkm3t
	A25YrDsvZPrfunS+BYATL+CEzeqzSw5NTq6mtHELyZa0GNA78TlmWiWTerhwieAPEQpv8OGlHgc
	42ENr2yVSaasDlej4q/N1RK0L5ojU=
X-Google-Smtp-Source: AGHT+IElGicg9Noy3KNYc3X1Hx3ljvy9PPIG+fte0j2wopqhPKBVVw/+1a1GI96/SevkXuNGDp7MGGQrGtMUp4y0Itg=
X-Received: by 2002:a05:6000:1844:b0:391:29c0:83f5 with SMTP id
 ffacd0b85a97d-39132da9406mr14060098f8f.44.1741679027502; Tue, 11 Mar 2025
 00:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0100019582fc6956-3b420cce-f122-4a26-8fea-94000b22bc90-000000@email.amazonses.com>
In-Reply-To: <0100019582fc6956-3b420cce-f122-4a26-8fea-94000b22bc90-000000@email.amazonses.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 11 Mar 2025 08:43:35 +0100
X-Gm-Features: AQ5f1JrorvKt0joSAmNhbI8X1OvgY1sTRzY-RUvYu31UhNpzzuvWgmT9z1NH5g4
Message-ID: <CAH5fLgi+HrV8raKqdzHyJ3HweFwbkY+D6OkWxhOrYg8q2TgRaQ@mail.gmail.com>
Subject: Re: [PATCH] rust: uaccess: mark UserSliceReader methods inline
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 3:15=E2=80=AFAM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> When you build the kernel using the llvm-19.1.4-rust-1.83.0-x86_64
> toolchain provided by kernel.org with ARCH=3Dx86_64, the following symbol=
s
> are generated:
>
> $nm vmlinux | grep ' _R'.*UserSliceReader | rustfilt
> ffffffff817c3320 T <kernel::uaccess::UserSliceReader>::read_slice
> ffffffff817c32b0 T <kernel::uaccess::UserSliceReader>::read_raw
>
> However, these Rust symbols are trivial wrappers around the functions
> copy_from_user, _copy_from_user respectively. It doesn't
> make sense to go through a trivial wrapper for these functions, so mark
> them inline.
>
> After applying this patch, the above command will produce no output.
>
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>

I believe you're missing a Link: and Suggested-by: tag.

Otherwise looks good to me.

Alice
