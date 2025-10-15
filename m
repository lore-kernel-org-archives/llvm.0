Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF342305044
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556585; cv=none; b=IHxRf+QuiwHThCgNezqMsD8SDeq3bYiEkOdmuxsuVy/GbFe3MkBHLQ3vUdabkvE1mYHPzExLTHS4BulgUAN234ECGPpgIBKirBvB6qMqOBlDWIQCoNWozYYlEtT5H62SrUbbOEmTpTiUUO7Wy8UpcuEmTw305CtwUGhDt+vMQBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556585; c=relaxed/simple;
	bh=PIriNEl1QINcRygfPV3g4fvxTFN2kEqSnPbk62zLE6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InwHAGIhNG55Ucf9uNEd8ciPLwtKHjqDDaR1nXghTMwktsGJ0AXOm6SBnMWBqzQwvzofgepADLrl6jc4dkaoxbTpnWQPsRHmubBlr4r0Pl9jwXNGbluSnwmjfD2jOHti784YU3X8Qb9TMFZ4DxHDbkqkmQJ09kYE5NR2QABhpJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Er4qLg8z; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Er4qLg8z"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b463f986f80so528506966b.2
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556582; x=1761161382; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ksEMbgKeIvUZBJjpo4N52YV+1hwQuAsDSMHWnzo/ss=;
        b=Er4qLg8zuERqvOFYCnsFcS9TYIURFnDGn0QLjI8FVJ5AYINgnzkCDU8oaTKKhqHX6W
         6C1ows3iN89ZSCjIG1YLZ8uF/QN5N1RgboeIF9Xf0lw4uUZTrbVx1nutDdMXuQl1o1Gr
         CLq6ZEjHuGvFJ8O1aiJBL8cDq1LbHrLq2ShmQU2tus+iMLwKhOapHUVJKVp9CLX9ssj0
         1UE2+2WId/ZyqFaeqdz+gRsxh63yHNBuwJreTUcwi/9y520xRt04QiFVutZZfFxLF51e
         MThPuI/KNQ4vwBjn4L+4rRr3GTDhRDTBahvVLf9OdoE6Q8b6ApSUfaMNl7/CzKMfXliq
         m1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556582; x=1761161382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ksEMbgKeIvUZBJjpo4N52YV+1hwQuAsDSMHWnzo/ss=;
        b=EHcqvpB0QDeSo8K3YJeX0d0RIHDbCex6yJnY69i714XAEZaRz3d3TK8am1jv/atpXM
         j4xGde35f6ZbclFxTdGS/5jkN16ZfC7SOOpE8iKW6KL/sRWiwEmqd7fhEQL/D2C7MZI0
         mfnMzyogSOXjDnYFaQUcObjfRKpvIjR0oV4RoGf2HSrSgO/JEGwh35VjGcAYd4hbbyiv
         JcerJaPms1mvhhnUiyzV4nz41YkF9wu5NzelXiE9UiDAF2H721kRiEPn4W/qJYd/bKCP
         2+4oSzBEkpJSEfTx19e82KmYxwRyqHDj6o9wfOVDGlVu85UO4lojYH+HE+GXjWOL9M3B
         cNkg==
X-Forwarded-Encrypted: i=1; AJvYcCUQPo0fAksdV+BJhcX7uY+PFEju9zdtFkcGFzaM2W7nbUzo4CAnbmumvqBlWzmYH96cHFPG@lists.linux.dev
X-Gm-Message-State: AOJu0YzI0yB/FEqSufOEOWK62h4sIQpQJC/b4LF0kro7DbA+o4QaHJW0
	9iwxi8+g6vs/xUfNGz2buqFW4LZK2pQXuM5mG3LbhUZGmjkjiM4f8dryrmvWEmU2mKIvikgQml8
	64JqciKlatW7aiS4kup3wAMTLiTT7U3Y=
X-Gm-Gg: ASbGncsq0poaBt21TE3He1wcnvIHei8EZDPjwm8Zf9Gq6E8G3w7pmM0ZHJS4DkVazMx
	+gc0SFspNN9R2+r8uEwy8gkmS3Oqy8Wi3GRbDD0YGHzL5XXII2JZ99qFYenRk8hTW6TToN/ZRWM
	4JkRRv5U+Rw6gZeqVMT13l5syHFqPr7QpaWTW1GAPV9Np1ySHY1owGcA3RrgiELPzpDadIfkTl/
	x9JZmxYrXb5joisvK9uwT6N1M58lZoRp24KLduFbBVWzC+eNEUCiDblgnvFN9Y4mX9dXtfyOF6A
	9osFouCM6kCmO1pPrO/NQ+zDLf2WNLiYxfPT+ywuCiUqjF7xfq7DdARtTkTY16blD8gfQYJcE89
	ljbQhw/cRC/LYVptkfJ9ZIGr4SfLYdTMEGMVu3HSRd958KfFAmz2p
X-Google-Smtp-Source: AGHT+IGtfw5s80CNJkem4TNXL/X5g30lTuJ5LAlCBEIiiOXle0xqvtrIM2mLDYUfLHDwkWL5hMYZfB33sxDVPZ7wk+M=
X-Received: by 2002:a17:907:5c8:b0:b40:b6a9:f70f with SMTP id
 a640c23a62f3a-b50a9c5b352mr3117730966b.4.1760556581571; Wed, 15 Oct 2025
 12:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com> <20251015-cstr-core-v17-6-dc5e7aec870d@gmail.com>
In-Reply-To: <20251015-cstr-core-v17-6-dc5e7aec870d@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:29:05 -0400
X-Gm-Features: AS18NWAV3lBjrdoX5xVPTxh-gkxtXMZeTFZJaDEZjzjbFJTQq56Dz3hw5BWoKLo
Message-ID: <CAJ-ks9myBRqJJEErMU3Zt5-nx-AJ=D=gMNf07e3jFFj=SH_QGg@mail.gmail.com>
Subject: Re: [PATCH v17 06/11] rust: alloc: use `kernel::fmt`
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 3:25=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Reduce coupling to implementation details of the formatting machinery by
> avoiding direct use for `core`'s formatting traits and macros.
>
> This backslid in commit 9def0d0a2a1c ("rust: alloc: add
> Vec::push_within_capacity").
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/alloc/kvec/errors.rs | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/er=
rors.rs
> index 21a920a4b09b..e7de5049ee47 100644
> --- a/rust/kernel/alloc/kvec/errors.rs
> +++ b/rust/kernel/alloc/kvec/errors.rs
> @@ -2,14 +2,14 @@
>
>  //! Errors for the [`Vec`] type.
>
> -use kernel::fmt::{self, Debug, Formatter};
> +use kernel::fmt;
>  use kernel::prelude::*;

Oops, this one is not necessary. Just a style change here.
