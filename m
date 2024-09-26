Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BB8188CAE;
	Thu, 26 Sep 2024 21:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727387845; cv=none; b=dCS7mkVSKxLzDW1ke0+iJ1kbWIRRZSUUJnRwN0TQJrHSuBpcFvEvtFCcclAD0aOG92tLUTjOUSN3w48V+cXjPvyvLxpJSmZw7CmmT5AOYxsTA8eREioWCdcvOaVlTZ8ltjJeEQGTwkMP2sj9fpbGRfsCDEKuaLjoGhe38AvWKfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727387845; c=relaxed/simple;
	bh=eEN/xSFzcED2rz79aaTmMseX/MDz8XwqNLr76/6nOiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orB+14K31Gx5vRaMlcCuDoUjI2XrhU6+qlB96JAFtADZL+Cw97laBXb9DN9tyMAg03+9L08jgWX8xibbefgWlTnE0V1Nf3A9TtNahsNJCTiBxBjI7sMJ+X8swshmroJQ2JRj7Ze5VNOD1VtKSDfs3QZDpihE/SOB2MMtG5f6kxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7wVV9pt; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7wVV9pt"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e0a47fda44so171839a91.1;
        Thu, 26 Sep 2024 14:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727387843; x=1727992643; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEN/xSFzcED2rz79aaTmMseX/MDz8XwqNLr76/6nOiM=;
        b=D7wVV9ptJSyY3Rh20Mrg6a6vaoDHvp1SVx1m/2ajz8lhmQ2W+4TmeRKywvPUloEZk6
         nziPgdBjXqFXGQ4Op+jM3KxrpiyFABKdO9gItCAtOTUMTPQ3NJHBLbHV/j2oPejoUc46
         +/0TR/Bt6cBqcPpbWhEEV55b+eZZOPh2fX1Y2k2S28FFdnUfToGA7Dgvdj/eIw3KY+A3
         evRPDrAW5ru83NfszE9kBh2u6uKh3JIG+mASNFjj31Pmap7dxx/MnhAUuJiBFI0lLj1H
         RK42IeCWjyF/nFK/Be7NlRq67WfvIyiqAuEFyVI9WNkRgFqi7DhiZk52YB2J5If69015
         OjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727387843; x=1727992643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEN/xSFzcED2rz79aaTmMseX/MDz8XwqNLr76/6nOiM=;
        b=jsGnzOmebCHv6T5MbAN5hcsnthFQnsDkqKfUsDzQL/g4cHuACCWzuAomp0KYQsVbkd
         mqVz7KAnNbD2j1wM7ZeceLIo/33lkhzBSMORApvSIoJ2ARUmtA7+x+QpHovzW3gzmL6L
         amyR1Qb1JOdAR6ENibfsdGKQxnsBPvJoIWSrAmjpE3s2aFGivwfEvYCKDCnu6INS8aL4
         umq0mJILaIdzOVK57IVZfRK1b6ypIDO9xNQac2BGC0qGVuYfAF9l0nuMvHsp+tHtp1Xy
         8sB+/ReF5RVMjXwGThEfhSfZJvxe5nbmlqH9z6hd4FK398tj3ej7UxVe5jucSL9jQsC0
         l33A==
X-Forwarded-Encrypted: i=1; AJvYcCVG9CVJ2Rcq9cWRyoHw5L/ql4snZH8rf8i8xCYXMFXTggjWqK2nzh5baS3I3AUPCn4ZQX1F@lists.linux.dev, AJvYcCXz2rVSehawZk2EHEUbWa7sDL319kOTJjcjIt6s2envvDIogVUvdUFNpExArmlnRTiOb7a/m+/zgtZrD0z2pA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnx2I32RHyRxWb4EDBpUs/Z+IJkez8g7iX/t3qABmKelwPtgLw
	YRYx1K0ieE9fhclEtJ0m/odbAzr78jmd3dhSnoOqCk4OjepfMy9b6iN42hxKqOWe8pNs9+VMSPG
	yKgcTYyi9nyUR0IJnmUCVVVAknnI=
X-Google-Smtp-Source: AGHT+IHpO/1BWz17vURNySF2gUTZTjYnPxNW7MaMKBqIsMmLma82UqLz0MNk8I1C0jgMwINzCj+JsQLX5zpaS0kqHpU=
X-Received: by 2002:a17:90a:ba97:b0:2e0:7adb:6380 with SMTP id
 98e67ed59e1d1-2e0b8ee512bmr536169a91.9.1727387843256; Thu, 26 Sep 2024
 14:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925205244.873020-2-benno.lossin@proton.me>
 <202409270303.kUIAmOmY-lkp@intel.com> <42d17306-1ac6-4fc7-ab1b-69ef045039ac@proton.me>
In-Reply-To: <42d17306-1ac6-4fc7-ab1b-69ef045039ac@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 23:57:11 +0200
Message-ID: <CANiq72kh7UdXjVNyxmsmSy58=W7=9Pqqys2zqHxfnLNKJXJHEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: add untrusted data abstraction
To: Benno Lossin <benno.lossin@proton.me>
Cc: kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Greg KH <greg@kroah.com>, Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 11:40=E2=80=AFPM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> I can reproduce this error locally in a Rust project, but am unable to
> do so on play.rust-lang.org. That seems very strange to me, anyone else
> on 1.83 or 1.82 can confirm? AFAIK, it was stabilized in 1.82, see [1].

Can you try in Compiler Explorer? That allows you to select more versions e=
tc.

Cheers,
Miguel
