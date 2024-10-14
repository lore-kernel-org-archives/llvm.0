Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996401D5AA5
	for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943223; cv=none; b=Yc1JAA27NJMuvQyEdGyBacvHptTDgmJzYCYofaXLidEsdHrr5MMGKkNqpFqrzkSig2aEW1LQP5dOmEWwGLwsenuRDhRxljTmUkU5mKVaufay4WjL+/GCS8UKIi+RHiRGOWYLWvQvxf6zLdM3OsIE2Fz2mqTq32KMQgCmXKjdqGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943223; c=relaxed/simple;
	bh=Gp5RgJdJshEAveCGQk1gByWsCpQn0wLzkzXvNjNyBzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fxf8Zt4KR5NDS66G4eYpGb6eZUYiVZnJhWaiTFDh6b8CShOkA77/R67KL7x8hpxZ+I9n4PRYaRPNjN1kscb4rkGR/WoZxXXtPGR4GVyyRmo1hXdfbgq7IaKXzlcAlxKgQR1XPyqw386/2+tokE3NwiD6/i7/HrRECzY+zDjFY7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+1aAs+g; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+1aAs+g"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20cf3f68ff2so1089645ad.2
        for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 15:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728943221; x=1729548021; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCCpXSt/sHK5vWvEI9GsvUyDJn3ZWOJE7EthE3NdZAI=;
        b=m+1aAs+gb2IWPVN9FTz0jzXsbKDU+vhXgVMIX7AGGt4NswVJsPIYFQZKd9HHn5mAff
         U9vzgpHb0QatcaWUP7Il+k1jahgPElneElsA7SP+QkZqAuNbPoUHyv6HRS7tMtIUYlob
         YjNIjqQ1IPFdXoM/fN8aVQ1qS0I0VHpa0gRLBN4S+1lAGnkfrikk+lKE1lxwpPJPWvES
         8lssz1ibq6PzaaMonlJiD2ua19oAySkm/XlKvY1HXjZ4xjkCpIikhY1P3BDglZNZuZek
         2P6f51Mjz8ZGa2lPSo5TIHY5exfpqictR8MCFRwXn+cOsZ7sMP8+3qBdh0GLLyBqXhNF
         SlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728943221; x=1729548021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCCpXSt/sHK5vWvEI9GsvUyDJn3ZWOJE7EthE3NdZAI=;
        b=VJjU6V9wERn6eo7S+zIQlYDYymcAea7cgmJRRh2vf0Sx+M+1QLUTg0tTLmmA8Eq6ZL
         OVHF9POrszWq4X1BxPFAPXzHSUl7pEaFNpnnnn3eHEBm2hzHoofxOz69er8HHLGSiTWm
         S6BDenC2yuzTpaJZLAY9NefPMX7AWq96IE1Jtnxk8BbL/ssog//TzeDszAszK8WtfNn8
         2Am969nxVQdGtSr2KdnPk/P7OqHvB4sKK0hMq+tuwMYJQdbU45GtegX/arGA5ynf0o4t
         nfhcMe/tKqJt6Ms48obfP16qWgKUlPtOz9R8kwofvq3u6OpeMniSi+PAwbHoo1toADfz
         V8Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUWbxAvnbI458z6U8KxsELgYhWLAb/mKxOiYBmKYXIPA6MlYacL0VfFv7BqMdvuEp1zk/3n@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5+0jf5+IdM3jVYsvhD5a5SKTHA0g2a7aKg5+/xygsTNZ1a9h6
	ssaiEQBTfumQ4eSt7ZTMuyalMD8yl77mw0DeWzGSXojv1lk3lPvHxba7a03EYY/pyeoLkbvFCcx
	8nJ/FnSxqE6aBzzf57YFD7rNn2qQ=
X-Google-Smtp-Source: AGHT+IHFx6+ZhFBdRRebxHz58VyNJUgrzyNWacOKg9tx+5UniFYMb5gntDXNyLvhYj9SJf4+6Jg/QRtlQqS+CSd9J2Y=
X-Received: by 2002:a17:90a:8c03:b0:2e0:9d55:3784 with SMTP id
 98e67ed59e1d1-2e2f0808125mr6970921a91.0.1728943220902; Mon, 14 Oct 2024
 15:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
 <20241011114040.3900487-1-gary@garyguo.net>
In-Reply-To: <20241011114040.3900487-1-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Oct 2024 00:00:09 +0200
Message-ID: <CANiq72ng9hGcncSr62bqXPq+u4UhQgwh_BvKkv==zkyseXJpiQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Gary Guo <gary@garyguo.net>
Cc: masahiroy@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Tejun Heo <tj@kernel.org>, 
	Yoann Congal <yoann.congal@smile.fr>, Randy Dunlap <rdunlap@infradead.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Jens Axboe <axboe@kernel.dk>, Jann Horn <jannh@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, kees@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 1:41=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Each version of Rust supports a range of LLVM versions. There are cases w=
here
> we want to gate a config on the LLVM version instead of the Rust version.
> Normalized cfi integer tags are one example [1].
>
> The invocation of rustc-version is being moved from init/Kconfig to
> scripts/Kconfig.include for consistency with cc-version.
>
> Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-032898=
5cdf33@google.com/ [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks everyone!

    [ Added missing `-llvm` to the Usage documentation. - Miguel ]

Cheers,
Miguel
