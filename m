Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E255D19D8B2
	for <llvm@lists.linux.dev>; Sun, 16 Mar 2025 18:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742151294; cv=none; b=PqFCbi1LtFXu1NDhRQsSE6XvkoIHXvitQoH70BYhpJ29y2P6jBfdNjiGHepEk3dJd/URebUYm1BYeAowdDI9kzJb2JfUF4D+YgsviWxkzyUSgMEaD0L/NpOvjE6zB9cHDJQ5LbEdx4godiaowQOP4+/CcySXbbKOZWJ4ReOlVaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742151294; c=relaxed/simple;
	bh=zRRGLszJcI9Ww+80z26LGiQuD4y3P7H/6FdpcWOHEnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9YWmAuaEb/+WPzK5sUNap4cP6L2d5pEF9zmfta8vHORk5q9vaEX/W3p1GdH78IL5uUPLTAnLmwKoJ1zU/0oPVXnlLiasY967660CJG5XS0y1CkO5LwQJYWdjBgMvZ5Q4C5p6tG2Oa4mKKgwpS6SO4Rrbq4wSxW0i7B9A/SgbAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=GK5EJuYa; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="GK5EJuYa"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6febbd3b75cso31489427b3.0
        for <llvm@lists.linux.dev>; Sun, 16 Mar 2025 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742151291; x=1742756091; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvdWb8P4BT1PgWG2fQCxo90ztiExxOPg6h8PgNmmvms=;
        b=GK5EJuYaOaigQmRuomTOOkzyUZxYEZmSvd9GGDNsEB1qVuNlRL5XLci4zPvZOj8GUF
         OC+mTXuFLKQDFnMnssjwHpuTJf1QaQNzTARWbqbj7mUrKWOSzTre8Mq6xl5FQg9wxGf8
         6290r8PwUsmjnx2jnAkT2PNT2KohGRRPb+cEZMH3ZIdf5FWmIENniTarjZ0HMsbPmAV6
         0ZVfvu8uLphQFU6ATZxORc9x99HdMjfBo47j/7pFiaHRDbSxjU2P9a1vBU7IpEPj5abu
         RtAUfE64In99/aVqOZPdh33KCKwkkf2Xjf0qcIwsQxM+uuBjuOjhqwa1ah0qoZC/17/Q
         cO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151291; x=1742756091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvdWb8P4BT1PgWG2fQCxo90ztiExxOPg6h8PgNmmvms=;
        b=EiVgfr0vsXR/Y5L6PTriKXfuDLi13CSS8iRoHwobyiJ1OBb3sWuh7qJm7VBL7IcmZj
         PPQrscpWS0lEyPKgKG9Hs3hOxNLGUBtKZrSBRGR91vgAaUvG2RRh1x2yVAiNN8Am3KNC
         vzNjjOD6OD4CL3JI2BZ6QMftN1lHkWL/+6UGyoeJ7pDjREnHsMwPhlVkcj4mWcZUsXwD
         B61z7b6KC4zHbAJR5yPaVjETSu0Pq4HMN1Q0Ta4llf8nydjMGt/K01W3yabM1swqyYk7
         nqYq8j9Z3Z5eFZbRGEa4WtGYpWn163UI2uXziVW1BG8w7wgWhI/ovj3lqVvjiLGMTULH
         TePA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5UiOGjA0UnkkSuF5VM4n5xUTNsxfYGHTjx0em1ecYtY3fE7T/64laigxwGvOjDS2buBj@lists.linux.dev
X-Gm-Message-State: AOJu0YwNQM6P07ld7t/4aF86I3wS4B80fexXrCL7yx8wn65pjWlZc1by
	7tlOYI7zFGRt49CwIV47pzGoL8bLNBHVIbDMWstVY4Y95PRQNZ4jGIJCQOHrTN4=
X-Gm-Gg: ASbGnctEzXT5jWZ8n4aYjKQW+fuXMqpsDK4zlOZCP4QmrkuC1SuWaf+7k/jZHNm/WT4
	40oBzm7FtCFYDtN5cZXUqgpd++ewSMFSNqVF2bC9+nxlX6eFcZdoQKg6d9KsNVdw8jQ1WlmsPiE
	QXW2i5Fu7b0fMDnSyqKEZ3woPsrWCfVKWXPZJ4B/xDFsJ6/c+fAUB9OoZTcEAmQ/SAFawN+4m/5
	J3nQYvpMmzcL512LGAjjQKSnSjXqLX5xqYfTKcZFEFxGZQavBd0k5iuvkjrfgHo+ixSmhpYAoW0
	ih78RUIWasR6azlQiPsO48wIPT0EDQ7yF078pAGbgMOpMob5DSF7DYXjmXV9Gc1pguP0+hbbCxb
	66CqlB+AYK910F1PH4LirQm9os8nJBVCG50xCwIQH
X-Google-Smtp-Source: AGHT+IEf61ITWXTQ0xB0/jw/y4GF9A+lDmm2UolrQcX9mgJQdmkAnFnfFmrsyIE1fbiYnjOGpVmumg==
X-Received: by 2002:a05:690c:4c0a:b0:6fb:91a9:94d9 with SMTP id 00721157ae682-6ff45e3cc5dmr134299007b3.2.1742151290797;
        Sun, 16 Mar 2025 11:54:50 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32d0036esm18493657b3.124.2025.03.16.11.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:54:50 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: benno.lossin@proton.me
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	contact@antoniohickey.com,
	dakr@kernel.org,
	gary@garyguo.net,
	justinstitt@google.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v2] rust: uaccess: mark UserSliceWriter method inline
Date: Sun, 16 Mar 2025 14:54:39 -0400
Message-ID: <20250316185439.913013-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <D8HVNR3Q3UL8.1007IZIZTQ0XB@proton.me>
References: <D8HVNR3Q3UL8.1007IZIZTQ0XB@proton.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Mar 16, 2025 at 05:47:40PM +0000, Benno Lossin wrote:
> On Thu Mar 13, 2025 at 3:57 AM CET, Antonio Hickey wrote:
> > When you build the kernel using the llvm-19.1.4-rust-1.83.0-x86_64
> > toolchain provided by kernel.org with ARCH=x86_64, the following symbol
> > is generated:
> >
> > $nm vmlinux | grep ' _R' | rustfilt | rg UserSliceWriter
> > ffffffff817c3390 T <kernel::uaccess::UserSliceWriter>::write_slice
> >
> > However, this Rust symbol is a trivial wrapper around the function
> > copy_to_user. It doesn't make sense to go through a trivial wrapper
> > for this function, so mark it inline.
> >
> > After applying this patch, the above command will produce no output.
> >
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1145
> > Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> 
> What about the other methods (like `write` and `read`?) in this file?

Hey Benno,

The other methods in this file were handled with the patch
linked below. This was one of my first patches, so I was
unaware of patch sets and did 2 seperate patches.

Link to other patch: https://lore.kernel.org/all/010001958798b97c-4da7647e-d0bc-4f81-9132-ad24353139cb-000000@email.amazonses.com/

Do you think it would be best to send these as new patch which
includes both of these patches? also if so would it be ok to
start that new patch set at v1 ?

Sorry for the confusion I'm new to kernel dev and patches,
but starting to get the hang of it now.

Thanks,
Antonio

> 
> ---
> Cheers,
> Benno
>
