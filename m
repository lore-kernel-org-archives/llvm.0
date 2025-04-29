Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA735215049
	for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918154; cv=none; b=b7KtobxIKgxrk7TV0hzR3WNVnf6yXyb8wp5Lggr9NOgnJRepTv6gb1zYDireg6mEEqD3oau0SC0RzSKHlldMrUoRpntkjnaFG5jt/JXy6/zaIM6xDbXLZIx06OxvhRXUUB8vp3sa6/tEiWmhG07Td5UPBJcruXuuAT+waV0Yqao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918154; c=relaxed/simple;
	bh=IufPZmchjEwPuPrWyMnpSLMW0VLIHQhDwrkScDKrdEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UWNB2vkFfUE7KLkB7L4AL/Xotan4QChU8dYn49hn/fRUHeBSd1qkMBjMFw6Gx/T411IKdh9DLlPA6VxiMlq6rM3PL6Rhe7zx4eeo4kj2Ye78xJVjk3n000v4Q+ZbkPWF26IpIYOgzPAh+gemwrsI3aMD8FVyIbCFgx66bl3wirs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WuOx14or; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WuOx14or"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac56756f6so5790575f8f.2
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745918151; x=1746522951; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IufPZmchjEwPuPrWyMnpSLMW0VLIHQhDwrkScDKrdEA=;
        b=WuOx14orXsClCrGCI5eGhAv7OmfaHMHKzN7r0t35o2wlSQIeKT4maO5RalYi5NsFjn
         EN7YCpfA4o0joWE175N3J/8zGj63zqaNMQUTgsVV2mJ42VHW7JOqcc3gyfl3kL+/DOgq
         oBElS9tsOHYDwfJoYwGjSMWJXkd99+7r81vKRe4O3hCxYuNKdlw6ECSa2fdFcP05Jp+P
         Or0pX1TuJZ9P10RMPTP+n+GYPQNmQKBW4PT0hMuZlAvq4PCayx5H/zC1WbNoEDzYE/kw
         RtYUTGli1yr92JurnZeRdpuFzQo2rE6TumF1oDdmwXPOm3b7MXn0r2uEiaDRjXtzaj+y
         cOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918151; x=1746522951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IufPZmchjEwPuPrWyMnpSLMW0VLIHQhDwrkScDKrdEA=;
        b=IE65GdlEEhCWEn4li/xIHE19ysPzwxnrE+sjYKLEIBgEt+NcSuPrwnmXAwEeVG/Hh1
         UP0PhuhUWjafta6pdwsSb+c8pUc34YyJagKrDVLtPNrWcJu4CwV3Hx91Ffx5dxIR2OTn
         P/o4AQQv/rgEJbI6AMTi9w+fW/3g3jpyoSZ39sTQOB4DQ+XkJlaA3gnV/3krhH+oCwV2
         Jecqhkql/OR/BP6s8U/1N1bQiAtmJlm1n9vYWTfh9mPVMMx9ESDxu7lxCNRhYUsHRR0Y
         dm/OWeDHJkNT80gWlIcAJbSNC+Bfq//C5Qn0GMGJGWKOMV7duAOJ0KqcaP0frtKw08xz
         OwuA==
X-Forwarded-Encrypted: i=1; AJvYcCUjY2rZ490tLfzbCBbwoHEU+uoVIPmc+ZVwlLk/Y/NKbUQ7uLSc0GQKvIGynuA+PpZhkZqZ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywre5pdo5nLiEJuiwNTOPD+syDG6rdPjIjKRpcNQrRbw47302dX
	1vniv+rP/tv9ATz5JhrV1C/cuKI5yAVd/ZbIwrS8U3J64cdTwPpQTT9L67Jr28Eai3tVHiM7xum
	YqycZybhzU27+6yXxWopNiJFwjIMOmXnvuUn5
X-Gm-Gg: ASbGnctXabW/cZImoHk5s9scs3FSSeCCiyXFhUpR8Lqk2oVGqoS5RW8PIu/VFMxsL4+
	z89YMyRyauhPEJrbTdZYnLQlVIBPFizLDoTF2IKUu9sOMLpzDo7EdxJOn0MVTSA4PthDAhwBfN/
	b0BkUd92VhYPDe0TWx1CEAY3sb2krgtWhqq4BTcSnjcyOm10v62lA=
X-Google-Smtp-Source: AGHT+IEncBtE85ntUD+6ecxTM2Stq9GOdP+/zLQpd95Lc8WASb6cmzfeblmdD3wxaEBUDJNBrqJPisFkCiFY9yZAsjo=
X-Received: by 2002:a05:6000:401e:b0:39d:8d54:5eac with SMTP id
 ffacd0b85a97d-3a07aa5fc6dmr8605336f8f.11.1745918150814; Tue, 29 Apr 2025
 02:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321080124.484647-1-kunwu.chan@linux.dev>
In-Reply-To: <20250321080124.484647-1-kunwu.chan@linux.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Apr 2025 11:15:37 +0200
X-Gm-Features: ATxdqUF1uPAfSKmGHM5pjmjxa5bh82WME0R0VffTaZqHCcY9807HE84scLngDZQ
Message-ID: <CAH5fLgiqFWs+Mw+8AYOOx83A6vQGYaaPJ1RbCZFEKALabLxDiw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: page:: optimize rust symbol generation for Page
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 9:02=E2=80=AFAM Kunwu Chan <kunwu.chan@linux.dev> w=
rote:
>
> From: Kunwu Chan <kunwu.chan@hotmail.com>
>
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=3Darm64, the following symbols are generated:
>
> $nm vmlinux | grep ' _R'.*Page | rustfilt
> ffff8000805b6f98 T <kernel::page::Page>::alloc_page
> ffff8000805b715c T <kernel::page::Page>::fill_zero_raw
> ffff8000805b720c T <kernel::page::Page>::copy_from_user_slice_raw
> ffff8000805b6fb4 T <kernel::page::Page>::read_raw
> ffff8000805b7088 T <kernel::page::Page>::write_raw
> ffff8000805b72fc T <kernel::page::Page as core::ops::drop::Drop>::drop
>
> These Rust symbols(alloc_page and drop) are trivial wrappers around the C
> functions alloc_pages and __free_pages. It doesn't make sense to go
> through a trivial wrapper for these functions, so mark them inline.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
