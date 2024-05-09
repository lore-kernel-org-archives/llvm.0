Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C09A7E576
	for <llvm@lists.linux.dev>; Thu,  9 May 2024 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715282162; cv=none; b=bx8tYMVlAeq4oXMrLA1avNxIUQ4Za+yewt2bjJpU27tHrpJTgqhdJuekOGorZmEjF/MSt5X1PCzGv+mSh4oilnlkdzuWRIjwbaBhbDcPT55rReHMDCrOnUFhZ4zj8Yrfc44u2TZF8X63N/S9zJ5ki1ydkCCVpGQ/h9gjKZ2+zbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715282162; c=relaxed/simple;
	bh=f5hTjmwtrBNmeRfEZwqwz3MoeEtUyLOcEt2AbxYcVbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfrCXtiESEpVHeBgpz4pWxkrcvPJmF0SUqYMqdSRGCGIXgky/SE0OmKMioNqj+3quVvFSMSnz+VzRXdNLfuK7FtiHTzai5PxwBIpIHTwwmE5lJC3e0j8CiIXAV7CcSeVKOf8GzmR0xxlnnvexd2jvVKQHuZ+EjcX6ELevXMYOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=grDP6A+2; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="grDP6A+2"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59a934ad50so299772766b.1
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 12:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715282158; x=1715886958; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C9PPjpFCo1HBrR3dhTun969JD1naScZ8g1ToZzUTce0=;
        b=grDP6A+24TzmFcKCRsxfkAOYcNPazyJCCVfh/PIHKi6sVEQwqKKRMqOdI5k+XCATD0
         WkyGU74rhBFyeuaVn77FhkX27pducUiQj2VFUX3t3x78U6ImzrshCGeAS40dVGRf3Mc/
         LGF+p+tLk5CdM4/2rseqzj7nPZjL+DES294Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715282158; x=1715886958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9PPjpFCo1HBrR3dhTun969JD1naScZ8g1ToZzUTce0=;
        b=tzUcMVA72NXIwaW1lmelf6SJ0JdVVBsnQZXvM1Ub/9jDuXN45+hmFz/tk2weFEP4eW
         /FURQFZB2QJqAu/9Hh9JhZVMi+JZdjB1mmg98RWdqBcV5UZV7StpxunEANKx80bk8sBc
         SsGnTbC8mMUPBakBah1hhlq5byhabTPe+obh+Re5XfhE+fMZGeoFY/ZbkTqMclFTqtJ/
         6ujTYXw4in1fCGczs/7GFsNeDJeLVbHbYZvvSErQxCYaUZkTJZZRHTKV+8CaQgR0ss73
         dgnr+mVjGCn9l4eoQUV7Dh0TDiFBbLe823+0YVxPSrt+Gss6K+IJxFwknuMldUs4yMEo
         0G0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUryxRuUcINAjfqY4uewlZfQTiYEG+sjG1big3UkYsmhv05izCXZmzFN4jDWISvwdy7Zpku/Ayu5UEdvZ1o6igj/c+RvQ==
X-Gm-Message-State: AOJu0YwCWMNcqpUMDW5Uw/vgoywhCytElIptFQRmS8w73ZGH9JV0aw4+
	f0VyaA5STmm2P6IYt8Q6jSAtpddHNwLnxQmgp18ZaNknRmt/Dhmu40rY1eA5HJCdqVBdNeo553K
	A6+YMMg==
X-Google-Smtp-Source: AGHT+IG4FsQ+A+oGmlh/rwxr500QcPR+P1dg/xH9J1z93elz77zL1/Pcl62308JGNe6zFm0vG4nfaw==
X-Received: by 2002:a50:d5dc:0:b0:56e:743:d4d9 with SMTP id 4fb4d7f45d1cf-5734d6dffa5mr336974a12.42.1715282158297;
        Thu, 09 May 2024 12:15:58 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733bea653bsm1003441a12.1.2024.05.09.12.15.57
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 12:15:57 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59a64db066so316875166b.3
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 12:15:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGdBw+VM5XcmrPfHCYfqEoaPQy1i2368ScaBYIit/fkTPBp9A+2LfEzIp2bpr643DHwtu+1AHJGHG2O4CLg16AQz1qyg==
X-Received: by 2002:a17:906:f88c:b0:a59:c52b:9938 with SMTP id
 a640c23a62f3a-a5a2d6653bamr36083966b.55.1715282157122; Thu, 09 May 2024
 12:15:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405081144.D5FCC44A@keescook> <CAHk-=wjeiGb1UxCy6Q8aif50C=wWDX9Pgp+WbZYrO72+B1f_QA@mail.gmail.com>
 <202405081354.B0A8194B3C@keescook> <CAHk-=wgoE5EkH+sQwi4KhRhCZizUxwZAnC=+9RbZcw7g6016LQ@mail.gmail.com>
 <202405081949.0565810E46@keescook> <20240509140854.GF3620298@mit.edu>
 <CAHk-=wgKyP2ffZPa6aKYtytzzFibiNVN5MS=D2cn7_UGCECKdw@mail.gmail.com>
 <20240509175417.GR2118490@ZenIV> <CAHk-=wgXm15gZHvt8waSFhXS9yZTfvMV95xyvNtPc6FSEA_rvA@mail.gmail.com>
 <CAHk-=wgBprh=8Us-MtwH9sVNELZK2hdOkFn3EoauwecYgtXOCQ@mail.gmail.com> <20240509184806.GS2118490@ZenIV>
In-Reply-To: <20240509184806.GS2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 May 2024 12:15:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjHA8Di-cpT0pKcScwcWNVYRFvmhBwMrug=Mj5WUwa2rw@mail.gmail.com>
Message-ID: <CAHk-=wjHA8Di-cpT0pKcScwcWNVYRFvmhBwMrug=Mj5WUwa2rw@mail.gmail.com>
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Kees Cook <keescook@chromium.org>, 
	Justin Stitt <justinstitt@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 May 2024 at 11:48, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> FWIW, the thing that somewhat worries me about having a helper along
> the lines of combine_to_u64(low, high) is that
>         foo->splat = combine_to_u64(something, something_else);
> would be inviting hard-to-catch brainos -
>         foo->splat = combine_to_u64(something_else, something);

Yeah, we'd have to be very clear about naming and ordering. So it
would probably have to be something like

        result = combine_to_u64_hi_lo(high, low);

to be easy to use.

The good news is that if you *do* get it wrong despite clear naming,
the resulting value will be so obviously wrong that it's generally a
"Duh!" thing if you do any testing what-so-ever.

Of course, I say that as somebody who always points out that I haven't
tested my own patches at all, and they are "something like this,
perhaps?".

But having "hi_lo" kind of naming would hopefully make it really
obvious even when just looking at the source code.

              Linus
