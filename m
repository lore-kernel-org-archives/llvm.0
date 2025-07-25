Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABD5283C92
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 08:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753432724; cv=none; b=naRKGkXNPfbwgtIZuK6Sbuk/8DXYTFrVgIiirensGcGSkHhNzcAm+tkmdwMYAJa8Z/so6YpBhTRhgT8jnzil9jWocj3ykbxja5OujSHyVQ2KpntXkXvj8RhZhk2syD4vxaYf69Tjn1ZgVcHPGzW5bxo4FOQR7/a/e3L6QtOp8kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753432724; c=relaxed/simple;
	bh=p/sPergCSqvqBREakhNKoleZIUie9w55wmYdj8MbWVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtAFR6Q5kmqQVi4e00yb+6YnSeqz9XaMrg7wp/R5FSNscq9ZIrAaB5VVrE0winSg/t9n2tkPRuPDIMAfawvhM0QPUrvpi+3/6ZUduDnV0NipYhnPf4M3p++/ZSZGZm0h09MoHsbV6ofDvd3c7H54r8KB/BSXD5OS8yUGjEyeEfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W0mUX9jT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W0mUX9jT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753432721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l839FtmJfD9QeEUNEIgs65whKDPvocBigZOfnNQ86T4=;
	b=W0mUX9jTDqQNfcUjKu6DrjeH5cpdE0a5iP4qz4kg3WuiWVxgxX/EwvQwG+VR1wUJvv0C91
	H5gMgS2lJ1fRPp/m9ATAiLZbmn/zkg6Gh1D4TXqwsrHfTyElq5GdC1Z0Xg4Bbxvhdalunl
	bsFtdtnYOnsfsuvGqd9xvv9Ytw9aZ/c=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-kevQoHvGMwK1Vb9qV9L14g-1; Fri, 25 Jul 2025 04:38:38 -0400
X-MC-Unique: kevQoHvGMwK1Vb9qV9L14g-1
X-Mimecast-MFC-AGG-ID: kevQoHvGMwK1Vb9qV9L14g_1753432717
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so3055167a91.2
        for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 01:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753432717; x=1754037517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l839FtmJfD9QeEUNEIgs65whKDPvocBigZOfnNQ86T4=;
        b=f7OwkmAPbKuEuG+BGtlEI1t0YOjV7KBD6StX9Tc5qOXV9gcuYuIqUcFgLitVZ9vrl/
         SwSy39dc0NUW1ILX4S7WAEYvov9yviJu5dK9yMPqIp1EijPXYMICv3jEOWlHN9UI3w7I
         n4ubOmy3JFqGoBOB4wA8hUtl702cE6ivwi0ZDfR8BTXFckjFUejmTN6nrSBScF2WH8YJ
         8qO+yoQUqnfstyP31HcTo9O9/ThodZ2LMlnXBlvWuw/5RuKDGf3SK7YSrPWJywzQHPhU
         lGINymuc4fZNX3hdMTi6RDRMn1TZxAlR2k5fn66j3IbdiBqF37T4e5SRFB3TIZEtgnyM
         7MLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk9f4LqQyiwEUrwcdVjap+p+EPdZT1snQH72cAKyLOfFsciVjdBIODmVTZ2tzW+xK/l4+n@lists.linux.dev
X-Gm-Message-State: AOJu0YyKpNuZpiZEr9EXgQY2+mTUS45nAc7mCg7yy9tkJyfvBNUJGkCu
	wJJVt+h+NEI5HeAza6ZJXtIW/C8FRfvtcTooaUnscF3tz+MKDwVF/TRpJ2TbdzorHjWz9u2qf49
	R681T7GVFDeU6G8748sNPXAUK5vq55v/MQjkNxlRqNYMVQH6GDnepYgHRVr3VuMoSwKfiPR+9SL
	IZvbKP+4evLdeMJgSpvXyX5je//cB2dw==
X-Gm-Gg: ASbGncuB1i2cATAmRq5tkKG3aGr4MNTEi9Xvx80XPXmF3C8650l9kr9HexdITcBUzZJ
	XD9Kv6GxOX+UuNqytm7XxVcRVM4H4FDYGdg6lkkbQyZFwRwuLcF+IrKGW57iIPCesq6RdiCmeBX
	AYGvVt+kmecUKLOfUA/pke
X-Received: by 2002:a17:90b:35cb:b0:312:639:a064 with SMTP id 98e67ed59e1d1-31e77afec2fmr1638832a91.28.1753432717343;
        Fri, 25 Jul 2025 01:38:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8BbwGTpiFIgHKfWf4ykhdVvu66EB0IkDK+M3uuBHxAip1Ohv9ZFi2p5wZH0IQqVXbSMfAhFdTeSqW8PM8WX0=
X-Received: by 2002:a17:90b:35cb:b0:312:639:a064 with SMTP id
 98e67ed59e1d1-31e77afec2fmr1638806a91.28.1753432716948; Fri, 25 Jul 2025
 01:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuBnDVaiZ6Mqhr=4Y2quAsqeZoGfJ158xJ1-Q5HHw=cBw@mail.gmail.com>
In-Reply-To: <CA+G9fYuBnDVaiZ6Mqhr=4Y2quAsqeZoGfJ158xJ1-Q5HHw=cBw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 25 Jul 2025 16:38:25 +0800
X-Gm-Features: Ac12FXwqAD8VmCJzAPOUYLLys8jDigRvmsJk7uLS2PNwF-x1PPSwDp1GEdHtbVA
Message-ID: <CACGkMEtWyJKqQr2yRyhU5=5qg+EH06FXsHRabk3da5iwfCA4FQ@mail.gmail.com>
Subject: Re: next-20250725 i386 x86_64 virtio_ring.c error variable 'id' is
 uninitialized when used here [-Werror,-Wuninitialized]
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, virtualization@lists.linux.dev, 
	clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TmhAST1QQurqhdkcJYYkLdYMrOF_t-oEGI575hXvH34_1753432717
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 3:43=E2=80=AFPM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Regressions noticed while building x86_64 and i386 builds with clang-nigh=
tly
> and clang-20 toolchains on the Linux next-20250725 tag.
>
> First seen on the Linux next-20250725
> Good: next-20250724
> Bad:  next-20250725
>
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
>
> ## Build regressions
> * i386, build
>   - clang-20-defconfig
>   - clang-nightly-defconfig
>
> * x86_64, build
>   - clang-20-allyesconfig
>   - clang-20-lkftconfig
>   - clang-20-lkftconfig-compat
>   - clang-20-lkftconfig-kcsan
>   - clang-20-lkftconfig-no-kselftest-frag
>   - clang-20-x86_64_defconfig
>   - clang-nightly-lkftconfig
>   - clang-nightly-lkftconfig-hardening
>   - clang-nightly-lkftconfig-kselftest
>   - clang-nightly-lkftconfig-lto-full
>   - clang-nightly-lkftconfig-lto-thing
>   - clang-nightly-x86_64_defconfig
>   - gcc-13-allyesconfig
>   - korg-clang-20-lkftconfig-hardening
>   - korg-clang-20-lkftconfig-lto-full
>   - korg-clang-20-lkftconfig-lto-thing
>   - rustclang-nightly-lkftconfig-kselftest
>
> Build regression: next-20250725 i386 x86_64 virtio_ring.c error
> variable 'id' is uninitialized when used here
> [-Werror,-Wuninitialized]
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build log
> drivers/virtio/virtio_ring.c:2113:40: error: variable 'id' is
> uninitialized when used here [-Werror,-Wuninitialized]
>  2113 |                 BAD_RING(vq, "id %u out of range\n", id);
>       |                                                      ^~
> drivers/virtio/virtio_ring.c:2077:19: note: initialize the variable
> 'id' to silence this warning
>  2077 |         u16 last_used, id, last_used_idx;
>       |                          ^
>       |                           =3D 0
> 1 error generated.
>

A fix has been posted here:

https://lore.kernel.org/virtualization/20250725083635.73355-1-jasowang@redh=
at.com/T/#u

Thanks

