Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151101EBA19
	for <llvm@lists.linux.dev>; Mon, 13 Oct 2025 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760348754; cv=none; b=bGUDEomIyzBHFyoeg73mkQYvuc3xJGReEixsF/Am+3prCljRPqF1VM/x089VIKjaMNb2biD1XWGnJBFm6r5ahRLjk+HGdQo41QTr3+OGABRutfLZYO8XVkbaWzcwbRAVS+fs3d61IU+XHan3zsnEH+bQqlE954GjNr6sFMLQFAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760348754; c=relaxed/simple;
	bh=f5S5EzRGvuz/r4X9fJ+a+VGxsMoAlj8KpasOUBJh7Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnwioi+YlNf76YACnJtsFRkMbExZoUSJYYUTDaqzuTH7kRredwytXP+Qzaa7MPP3bHek0rJg7EFI0WhklVg2XNR/JGW8Gu2p95/VbSBciert3TThxrviXcMNLaJs4aUPg01rIi3MbvZZDrOnQagHrNsTs/m4AngCX82dBXJKzY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qUGXd4tN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qUGXd4tN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so41053655e9.2
        for <llvm@lists.linux.dev>; Mon, 13 Oct 2025 02:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760348751; x=1760953551; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVu1hEkIf44NHHLfFJPgY+f91pjliiXRGzufnhZn7d8=;
        b=qUGXd4tNJ6zPQKudDlf7Kl+KbKyU8aHv6y4OrfxqXrUc9ZBP8FCBqX7IUfXwJDuWbM
         jjmPdPNXa3a5RPgu8sRosz5ZGaaJE9lghe335HEIb9zhZmFerbFK462XjlcdKa0Vx08I
         +18GI2Srk5ksIKpUzGxgKjAKKCA5zUG0QA8CpvWFfIQG3B2SFXZogOv7SNaG7jp8KaYT
         SUNY/17CeEa7WbeAKc5em0eUwMXL0nMR2p9bxf5kQSzOhBEd0gtzrMNmUyTCh8jQ/oRo
         rOfuXf3XYt7FdrZEwhRf7eCHcP22Za4TmmKCD0jQLP22Lbqm9BIvBItXOKWfk4GXPE8e
         /jyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760348751; x=1760953551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVu1hEkIf44NHHLfFJPgY+f91pjliiXRGzufnhZn7d8=;
        b=BDS6shNxHMlZsnhGO6pirirplnbeVR7U7Mnk5tsq//p1DzExGwJxpC0hOs974RFLOl
         2jmHPgWlunWc1h2kEcn0tspkIEezDmmE5GHLBHrlfIDqGLufortooEh0Ljy9N5kKj+8O
         NfmO5BTFVhsZRqmqTRm3xDPUZjqsPOuPIcAHYFrLkiK4YPGrKU9a0RJhoUixCKrr4n0z
         twXGG906GttTUhHs2EfDzMyzHVXY2BLS251BOaWhOUqhFntHFWOiuU7N0a9R9BnAUd1/
         3swdI8vO1hCMKRv7xZlqjZWB8ty3Yxz9nfMX/ZVZxkQz04Af6G5mMZHqJIGOlul0/2nY
         lF1g==
X-Forwarded-Encrypted: i=1; AJvYcCV3ue3cS7SoR7G52z2f++dA8bR2eHkAmpXhfPCwu9vtzayFPb5xFzOIXRvHLMIwzsRmOhvg@lists.linux.dev
X-Gm-Message-State: AOJu0YxjyD9FJD2XLHklIXDsCKPrOI9+iyB1ArOxFbd+R+aOwk9tQA+k
	lPlhIrilFIKto8OX8EhlL6ilbxPDUfKER1K4+UIyKyHH+H1Az00C5oJzQUSPy3uYF0CpMUhen0y
	9PsCzFGdfsjwWYJFJTabNRkAMzr21MG7cnsFA7O3d
X-Gm-Gg: ASbGncuhQbrIrc8FbHiU25nvZO+gba/tJ1X8ubb5SinlQktGCzdtIOjMrXO6OT5je5b
	0G5AX0o1+jzbWAsOjA5YAya64J7Gu2QMkLmHbXaFFBTxdnkNjaGsBKfAecyBYolZsLAMrwIgJpk
	OcJ3dDTYDGIdutjW0QaWGln1HadkxRW/lzlQdHXbsgmox5p/e5S0LN9UNGpSTN/uMxQagIFb7lo
	SZgDZNB+A+6GyFJnXToAcrqou0qEcqDlgmqesrYkQ/bJFb3OnEts/hFpTKKkuVh+PPzNCb8
X-Google-Smtp-Source: AGHT+IFqaBixRi77uwFxD0KO5fWa70Oa0mflVhXrjLFcAwKyNCUyus7ehKoAqeSTAbzAk4ZDHyQpfzilqQdd3qFUiUs=
X-Received: by 2002:a05:600c:502c:b0:46e:3d41:5fe6 with SMTP id
 5b1f17b1804b1-46fa9a9ebb8mr133351055e9.9.1760348751245; Mon, 13 Oct 2025
 02:45:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251003074939.465517-1-benx.guo@gmail.com> <20251013043812.13186-1-benx.guo@gmail.com>
In-Reply-To: <20251013043812.13186-1-benx.guo@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Oct 2025 11:45:39 +0200
X-Gm-Features: AS18NWC7zd8zRon9s3XEh0rKZRaVm37ojpo0BrRNHaKslRzb8eH_XUzUW9LbRAU
Message-ID: <CAH5fLgi4C454xG67vN-T5rRV1X4-rAGEj_ftnHqTOoN61wtcKw@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add translation of rust/testing.rst
To: Ben Guo <benx.guo@gmail.com>
Cc: si.yanteng@linux.dev, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	alexs@kernel.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	corbet@lwn.net, dakr@kernel.org, dzm91@hust.edu.cn, gary@garyguo.net, 
	hust-os-kernel-patches@googlegroups.com, justinstitt@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	lossin@kernel.org, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 6:38=E2=80=AFAM Ben Guo <benx.guo@gmail.com> wrote:
>
> Hi Yanteng,
>
> I=E2=80=99d like to confirm the expected use of the In-Reply-To header fo=
r versioned patches.
>
> In my case:
>   [PATCH]    ->  Message-ID: <20250929163531.376092-1-benx.guo@gmail.com>
>   [PATCH v2] ->  Message-ID: <20251003074939.465517-1-benx.guo@gmail.com>
>   [PATCH v2] -> In-Reply-To: <20250929163531.376092-1-benx.guo@gmail.com>
>
> That means the v2 patch points back to the v1 message ID.
>
> Could you please confirm whether I should start a new thread for [PATCH v=
2], or if there=E2=80=99s something wrong with how I used the In-Reply-To h=
eader?
> Thanks for helping clarify this.

When posting a new version, you should start a new thread.

Alice
