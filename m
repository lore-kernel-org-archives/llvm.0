Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C07974BED
	for <llvm@lists.linux.dev>; Thu,  9 May 2024 18:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715278115; cv=none; b=KAiEAhdJBGHZRhOnOm0U6jMwyXOoeoRVbJdc3IaN+uX4aNeMcADZ4Z01eaMTVL05KXWm3+0J6bWO7HOXIUpGCnQWqUzi4xYCimF+LGFKL6iBC4mF2pCpMi8uuV9H642cCQUYXrskaBorTKsJFv7UKFY/o7aBNf9YL9BE2PrRhAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715278115; c=relaxed/simple;
	bh=B/fLZgJ1kMx5q/e/aqEvOH6JUgyuZ+Q/2hXPHkpLqEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsQYiIM4ahhLLpOrV1N/+HpK8zjd6IGZIN/Jyi7C9GkW9UOIPZsqIYXKjo5VcUCX2f+Wk3qxoHmQVOBhv2SpEqOHDshWjARjH7WrjXzDkZhG08ZMR2BjUTWPmoj4LLH1l6aK9qlD28eAdcFl6vqhMkeBHtESRv2HNP8vn1c2KO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Kfrg4Wxi; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Kfrg4Wxi"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a5a13921661so262868966b.2
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 11:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715278110; x=1715882910; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2M1QRjYBDT1Zd0NqfbgFR5skSig9YZV6L8U7l1RklbU=;
        b=Kfrg4WxifiLLLEwOBXNfkEpPUAZtOmIUmq4bmntONm+lhSY0+8lxdVgnDjlx92eQ6l
         Dp8t0Qqro026cmhuPkHKU30RAvzr42k5o/5jNv2MTYb8DwNUnvMp7kZ1zj4ix5PWeGnJ
         /Q9/ZZoZypsvorSVrWYTXg1Sgbgq6wno+5Wbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715278110; x=1715882910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2M1QRjYBDT1Zd0NqfbgFR5skSig9YZV6L8U7l1RklbU=;
        b=BvMhqJNOmN3HCQ2RRS76imv9hXxJKe/PoVkSzyfax9kOEg5DtIw9L+G0DYXNHFppSB
         1FtaiUbFqdSyrNIh5IwP6aP5YgOkW+D9r8XD+MawE4wwfpc/ntj4tvfh7XK79Rtvw676
         i9AKiUoYlQtAt2lSJ6wHUp9JHor8b/OunO6FtBplF/zUUYDso8r7bWq+sdtEVDX25aSq
         vryC37B8Es3UKAZDURnG4LlCzpzLjt/QTZLDn5t2PfN4jypR4KKOK5AR3hyMQYj1lycv
         J2kCr1crlK06qrhbGeyf/OP2awiBnub2Ssk7sg7Ur+CmRTQfZXVbNDQ1xbbv1i5s8bOD
         YHhw==
X-Forwarded-Encrypted: i=1; AJvYcCXBTOWyJvkh81giipAiI5lXab7QJlPDJsG5R02PqZpkPo7hU/UVIoV+1xcyf5uY38qvLFp8SZS1h3uuWSx3baJry2fzLg==
X-Gm-Message-State: AOJu0YwPALW7u1h0vK6F+HyiP4iDKT7gnEf/4vc85lAJ6+sGWwcEqB4b
	QpWrTrmcSp28HboyF9jIHPNxbBPtPXd/kJkPFb47hoLl3g9j2LTcER2z9JE/0a3S1HLffkOk28Z
	hrfg=
X-Google-Smtp-Source: AGHT+IF/ed1tZR85++vojgHDj2eRzdemn44Uc0hleYDPz9FfG4iiUikn6nd8r9tPwf2UOxwTF893+Q==
X-Received: by 2002:a17:906:b1d3:b0:a59:9ad4:6f42 with SMTP id a640c23a62f3a-a5a2d66a2e1mr24732166b.58.1715278110512;
        Thu, 09 May 2024 11:08:30 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d5a4sm97746066b.2.2024.05.09.11.08.29
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 11:08:29 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5a157a1cd1so285189766b.0
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 11:08:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbGFaWDnjCjYJKr+Nf4mqV8evl1Ef2W5vAmFSTXRNBv39cvFBxyUgoJIHGU3cF2ZbWxicPv8FTdsBUxfhMrMcFc74XYg==
X-Received: by 2002:a17:907:1118:b0:a59:c5c2:a320 with SMTP id
 a640c23a62f3a-a5a2d581b19mr26210766b.23.1715278109328; Thu, 09 May 2024
 11:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404291502.612E0A10@keescook> <CAHk-=wi5YPwWA8f5RAf_Hi8iL0NhGJeL6MN6UFWwRMY8L6UDvQ@mail.gmail.com>
 <202405081144.D5FCC44A@keescook> <CAHk-=wjeiGb1UxCy6Q8aif50C=wWDX9Pgp+WbZYrO72+B1f_QA@mail.gmail.com>
 <202405081354.B0A8194B3C@keescook> <CAHk-=wgoE5EkH+sQwi4KhRhCZizUxwZAnC=+9RbZcw7g6016LQ@mail.gmail.com>
 <202405081949.0565810E46@keescook> <20240509140854.GF3620298@mit.edu>
 <CAHk-=wgKyP2ffZPa6aKYtytzzFibiNVN5MS=D2cn7_UGCECKdw@mail.gmail.com> <20240509175417.GR2118490@ZenIV>
In-Reply-To: <20240509175417.GR2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 May 2024 11:08:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgXm15gZHvt8waSFhXS9yZTfvMV95xyvNtPc6FSEA_rvA@mail.gmail.com>
Message-ID: <CAHk-=wgXm15gZHvt8waSFhXS9yZTfvMV95xyvNtPc6FSEA_rvA@mail.gmail.com>
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Kees Cook <keescook@chromium.org>, 
	Justin Stitt <justinstitt@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 May 2024 at 10:54, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Thu, May 09, 2024 at 08:38:28AM -0700, Linus Torvalds wrote:
>
> > Going the other way is similar:
> >
> >         all_bits = low_bits + ((u64) high_bits << 16) << 16);
> >
> > and again, the compiler will recognize this idiom and do the right
> > thing (and if 'all_bits' is only 32-bit, the compiler will optimize
> > the high bit noise away).
>
> Umm...  That would make sense if it was
>         all_bits = low_bits + ((T) high_bits << 16) << 16);
> with possibly 32bit T.  But the way you wrote that (with u64) it's
> pointless - u64 _can_ be shifted by 32 just fine.

Casting to 'T' is probably a clearer option but doesn't work very well
in a helper functions that may not know what the final type is.

 Any half-way decent compiler will end up optimizing away the shifts
and adds for the high bits because they see the assignment to
'all_bits'. There's no point in generating high bits that just get
thrown away.

                Linus
