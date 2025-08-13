Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F428689A
	for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100020; cv=none; b=jmmQMb6zOJkpcHZiNiGhWDS35DV6rRZNvpKJakAYIEGz2A+i25itP5o16IYLWj5kMP+KGQl74p9dvZmVQB2kebqfP4ygv8X+YdNUrsIx1r8BUKGb1okPtATSGmuRZcu4T9opqtqyt7IdMVd2KzCRACZA+OjBcTHY1qPXzoO2Ao8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100020; c=relaxed/simple;
	bh=8C3JEnBgzuNeaQW3gWYprsuy1sUTrnX9KF6z68NKKbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JH3pJVt0zatn1vS9a3tIUfozM/zQbKngJy0B2Zmf5dyfLR1rrqvobISY1f4zPga/SkbtlL4MkMwKDzt4mvhYYUA48kKLM09gpFlr//rddF9JXCdhuVkmv9Tz5Rm5CIowJuCMikjQSVvk7zPX5W46HPawFldKEBVuD01j36ziY7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhQ0o2wv; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhQ0o2wv"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55b9c2482e9so7747055e87.1
        for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 08:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755100017; x=1755704817; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8C3JEnBgzuNeaQW3gWYprsuy1sUTrnX9KF6z68NKKbc=;
        b=ZhQ0o2wvhPcuQ9/Q81wFVaYGXR7041cMyRGqU5ly8i2ns8MeEqu2YI6od/4eoTLQt7
         qXfmpkqpooDH7Dj25X5Vkkf3ZqnvbnAVdkfrhUhwCx7lWidoWnE3kMcMB0e/3ycOettr
         Jw92UyvzO7d1Z5MvXZT4EQadvQeaAAKXD86Yl0+76jUAI1k5swYPRKDnaKlX01KRiqAO
         E0DruPzI+Sxedj41ASYztuesg5Nbfo3cdD4wvVAZ2bEmJKLrft2sxt8yhwk1zlqWvEIH
         WJzR7zIibTMCCssGewAmbNjjWfkq0cy5CT/MaICbPzmx/d7xonS8ZewMYK+zwOfnHVf7
         FUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755100017; x=1755704817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C3JEnBgzuNeaQW3gWYprsuy1sUTrnX9KF6z68NKKbc=;
        b=YD4W+bO+/bXY6JAVWsxIDlnH1G4xRv81b/3W9eWZe8W0cPXNrHG3mMAUa6DwRACbJ8
         DCJIa3xJzlp+gOGgyT8jj/pQuB8SfvMyyCU6TrGzsEWmYaDurxZ5Zb6xImonR0UJ47Sz
         DEOwmhIFmVTUE2DCeQCG3GIgYs2LsE7n46hPfoQ+lLICN+AaqV/qOkKNmkEywQqAaHY8
         Uz7aiuoHXCNjjyqgDkYBXI8ZInYboRXkESgNps7i5yaGZL+XdrcB+SjdK5MuBJfispnh
         HXiNo++xJ7RacynqnJOiFdRHLTatFYU4HhzcgSJExAqtqONINwLOdG287rEKNtF9zDpO
         rzig==
X-Forwarded-Encrypted: i=1; AJvYcCX+cGa3SAS1PZ0DHJTe7oTXsRnZmFHjFSD7SK/0teqUlgp43NksYTqeuWoAWjtEkMrwZrkx@lists.linux.dev
X-Gm-Message-State: AOJu0YzmQu/UDIyGwrC2thBLv0NpDpvOFyen2m0gewJhYw9swVLwjGS4
	Q+o2+s4WQqgSMAPrgISUpqEhb1z3e4zaoJOcV9z8jYHOoLZFG7Gg7nkgjwg266ZK6ysON6ssM3A
	NX0xTxY2noMdy9yNKDajHWmdnL0iSKmY=
X-Gm-Gg: ASbGncvkurSbS2rxSTAkmY4y0NYoBZqvdOfDTiIpIG673hoiIAnldbzuY3SnPD3J7dI
	GDR61F5q+TCJgVv4xYiOlcMQ+LGyt9YpyP6TLFVR9cFMlayP3B5u2rIpkbHs9/dGGHT6AT8HoPW
	iv3tvc0QsiOsw9WG9dfKJZuMSI4v+hP9JnWB6tzrV2Cp3XuHZbehIrz56Fbpx96iJccN8RzdtoI
	xN5v2rwp4DIyQIraHD2qMGoszliFALR4pq+E7CZ2wQ4oqb/BStK
X-Google-Smtp-Source: AGHT+IFlXjCtm/3mLkCKgCQ6oaovDejKJiYTqfx+4Vkk5VXVTLRBcQTPsK+L/8GMgwvkv1tCQDO8KsHElbAZgcSuwQg=
X-Received: by 2002:a05:6512:3ca6:b0:55b:96e4:11b5 with SMTP id
 2adb3069b0e04-55ce01418d4mr972466e87.1.1755100016614; Wed, 13 Aug 2025
 08:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710-cstr-core-v14-0-ca7e0ca82c82@gmail.com>
 <20250710-cstr-core-v14-3-ca7e0ca82c82@gmail.com> <DC0A9UKTPH05.2O2V0B2KHMIW8@kernel.org>
 <CAJ-ks9n4V-PEDhkTv6SXj_Oh6LB4LdsNi8Nnv_6JbT7dhvnh2w@mail.gmail.com> <DC1DLSRDL44Z.W74NH6OV15J6@kernel.org>
In-Reply-To: <DC1DLSRDL44Z.W74NH6OV15J6@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:46:20 -0400
X-Gm-Features: Ac12FXzrZuqOWLNuD2WsxnQxv5byqHT3WGfhqIfZM1e5IVNorXHuhluYNiSBDPo
Message-ID: <CAJ-ks9=ttX3tYzVq9Kb3Qfx+D+i5_Q7Q-rCHAEpH+fCFgF8AxQ@mail.gmail.com>
Subject: Re: [PATCH v14 3/3] rust: replace `CStr` with `core::ffi::CStr`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Christian Brauner <brauner@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 10:40=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Wed Aug 13, 2025 at 4:06 PM CEST, Tamir Duberstein wrote:
> > On Tue, Aug 12, 2025 at 3:50=E2=80=AFAM Benno Lossin <lossin@kernel.org=
> wrote:
> >> On Thu Jul 10, 2025 at 4:53 PM CEST, Tamir Duberstein wrote:
> >> > +/// Extensions to [`CStr`].
> >> > +pub trait CStrExt {
> >>
> >> Should we make this trait sealed?
> >
> > We can -- but is it harmful for someone to implement? I think probably =
not.
>
> I don't think anything aside from `CStr` should implement it, so I'd say
> we make it sealed. There are also safe functions that return raw
> pointers & an implementation could just return a bogus pointer...

Done in v15.
