Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1A9161321
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742226373; cv=none; b=OYqyvd86dGZMHlYMd3oNxf60lyhor6wAeK7DsyGllnPWc3mJLL4CeVjP7HKWh0GNT0c5YwggDntnlaviPHkGFJt0OXDB4GWJpawgOz/lKT0VmSsn1VXmRHeQ/4uywpSm184gaJWZ7kX7XNAZ5SooNqx+VIF7PScJ5IHsuf2GOI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742226373; c=relaxed/simple;
	bh=N0XXHSoerCz+fkW0gAlHMYillsKvgy/L8Pvju8fyza0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gwTFoi1r2zTRu2USZ60LD6RIQLJYXSq8ryE9INLePoY+ygBeXbJ7CZeM3UA54/aVWf97Q6Qc8iSNpHPNmnZ734FdRPpDoLQ/NVzPUraZ/Kjf/UaQWadFbqGItW2W0VsfRPmhBsgnb9Z0wZq/tbfzqDrnBYBlsCCg6GfmDe7FQ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOW9n6iA; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOW9n6iA"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff66327419so679096a91.1
        for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 08:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742226371; x=1742831171; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0XXHSoerCz+fkW0gAlHMYillsKvgy/L8Pvju8fyza0=;
        b=TOW9n6iApLywvAWqBgHvhiumJfI5nK41Mq6klh+N6yM5sCitduI3T3diBPnD20P6jX
         44o445+2sHYPc5YuIGLeJ9JEiy0FPEP+y9DqrZWhJWEVd9ws4T695w39x3XoMGc7m9Jt
         MCF/ckM8/LqVk/nyezohk5RCGkJmgNq3LSwVXbPgbl4CN+xNA9+jzwAztbAa4b8rfSJQ
         jq+afTPKdUREpyGvjdfQUY4POpPyNUak090lPNZdjZUItZz+EPemo+cRDbvzb+qA7zSv
         Vda+XPYtQGMGU8miUqt+JhUBOuPLrvYsk14KPIMoHI5bDvO3J9Zjlay5Ayn6sUe33tlt
         en3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226371; x=1742831171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0XXHSoerCz+fkW0gAlHMYillsKvgy/L8Pvju8fyza0=;
        b=k/Rx5lbgje9bpKFUU8ltXb7dOttBnYQ9n8s0v+Jfo+kHARSfXRx2q482IFehQnpbMq
         WQuPUePzFvJt1HJt6bJs4rdGc17v0ict2hB4zzW1NdMFjL7wYIHquTC6YOzMnfyzmc6m
         c4wVhickBlEuYdsxBhYL+jGpg7ztHFUIvrMW4Xhbvhykeh8nyTvk1TODQlRQDeFuxa5D
         d36nwO5+rH2Co+Jm0KPaG/MZKH8mdnWEEr54kpgkid7jKZpFCF8ZTJ45yivjWMtEOZBA
         TVVmb2Xoib+rBP1vT7F71fQWRevxd6GcTlyrw3kEBJHD8ErdXkX+yUX5cU5rtgaCeJE5
         ZasQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnnN6VraR3l4sF7riAOryxGjBRWW6oqsnKxb60xw63Aq7ECipX9MQ/enB/DciV04SAyORQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwYGb0118RTjXIPJYnofHzCd4nq3iwykQZKR7dTBLYGjC0W0i0U
	8lfZNsbmITJ+pCy6VNmgeKbC2i12VE7DEN9lsRg4RhE06So5JUDqz6zCh5tBEY14lqXfUTDS6u+
	5hs0Y63ncVqxhpC7L3hNLiO0sgA4=
X-Gm-Gg: ASbGnctIUzST3SG/B65d/9OSZK7ATPTUUYBxta5LC9fnjN8vUXdkUW/0CceZFPrra3X
	rTDv2KgAljRFJ4U9UGW1dXriEWfAnr99JzTEO8XmLUeljWXpXuVeW4HYDjndOhs05mjXlf8YdMG
	yIRtErCUyXQhwTgXsEQS8jCrZTQmmwCo+/T2lw
X-Google-Smtp-Source: AGHT+IGsWrTravBcGZquqTChLJG6sZsrdkGgwDZjO6DsTAiQ2OaxrCp+Yf91E1I1j0SrEDrf6Qq5rvoM9jANoIT8Hk0=
X-Received: by 2002:a17:90b:38ce:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-30151d68999mr5992647a91.3.1742226370592; Mon, 17 Mar 2025
 08:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <D8HVNR3Q3UL8.1007IZIZTQ0XB@proton.me> <20250316185439.913013-1-contact@antoniohickey.com>
 <D8IMV6MH4EVX.3BWHLLY5UGLC0@proton.me>
In-Reply-To: <D8IMV6MH4EVX.3BWHLLY5UGLC0@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Mar 2025 16:45:56 +0100
X-Gm-Features: AQ5f1Jp_2ofObKoGGIUEWuo2lRMEHek0QXhzl1jwrCncDSj8dSCFentnj4Z5HAo
Message-ID: <CANiq72kgNJGqe+3yNHj96UPcA8i7ozbQGf5FWBQcOytZqZ6ZMw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: uaccess: mark UserSliceWriter method inline
To: Benno Lossin <benno.lossin@proton.me>
Cc: Antonio Hickey <contact@antoniohickey.com>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 4:07=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> I don't 100% know what to do here, maybe Miguel can help. Personally,
> I'd think that another v1 is confusing, but I have seen people in the
> past add patches to their already existing series (while incrementing
> the version number). I think it's a good idea to merge the patches into
> a single one that handles the entire file though.

I would say that what is most important is to mention what was done,
i.e. linking to the previous thread(s) and saying it was merged or not
so that it is clear what is being done.

If this is just `UserSliceWriter` and `UserSliceReader`, then yeah, a
single patch seems good enough. It is not a fix, which could require
different `Fixes:` tags or things like that.

Thanks!

Cheers,
Miguel
