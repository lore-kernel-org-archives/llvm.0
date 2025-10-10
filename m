Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511161F63CD
	for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760082477; cv=none; b=oewJX3UJ6il2Gg2ql0fq1resPhlzDf9MEiEp4RmieVuUqZm9dB8rwz/d+pqXT5U6kZ3ktJAb4/XEdBv8VZ1vWg9jujqE8A0wioRH/gpOgVMXccHdIb0kKj4l1ly9Ml38vzAiGgj2w11+qrYL3xum03/Q0w75teyDRgMIqPuP1U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760082477; c=relaxed/simple;
	bh=lTdqN4W06cqsRZCpguUFBBlurf0JEQrgsDoESRmTflU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3XGxS9MB+YghRDbfDf4LcPu+kOpukodHl7Fldp7YBlvYfTSn4hwBTooVZ19+HMtUbSxhYMT5Dk3Xqe4tCX9sIcoOm+Hb4Xm0TYbccgzq8ryPR3qgpZHWyxptewjXnm2Mn2aDu5BQ0JLugSM+PbYv2jcWn3BMB1jTIYAaP6n1bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2YMBHOl; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2YMBHOl"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-269640c2d4bso2695235ad.2
        for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 00:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760082475; x=1760687275; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7tgKV3i4gBxvB8UJSlpuDPvU/XCbTanFqWCRDwu8uk=;
        b=O2YMBHOlzVMRoDWnqho+ZRHDw1udEn2UlaI2tqSg/wVKjX4i8Avf1rZIWbUexZVICY
         ovKsDpz8oxvpibDwPU3i/kK+EepPeBsTzRxEA98ya2ESpJB7HKDQtr/0a6Hhb3c8U/vW
         eEoRNmf5wKVqBjy2FhLfFx5BkExhmqmJk89ZRyJkTmpI0C0yvhCRKuBJcDbjvSJN2uKn
         dRtP7YxEesOfb8O8j6DMF3qY3lmk41Sdvm6ZX/1D1cQizpvsSWIT7ibM5NDtDnCBoDBT
         yDRNMFtdknG+3natu2LxlRzM0FTyDT0H9lrT3L6vSCgLroEt0HGH9iDJONn3UIGWEWlz
         ucwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760082475; x=1760687275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7tgKV3i4gBxvB8UJSlpuDPvU/XCbTanFqWCRDwu8uk=;
        b=kR/meWMzEufeHl9//BqwkLaRlrowoScQxJAtWQrLn/Kmo9SxiYvMXxs7CnpUPl4MdE
         n7mAVi7Na7hSq1RSsIMtQk4imhBT3GoaEVPHdaHP+S0h98mmYwHHNI7/IMXbTeBntR0r
         aOQUR2OWPyvXedK4Pn2l8e9QkEKTFBXOBrUoB85nCihICBG9OtQCXFI/5b+orgAQmq2O
         Oj9SfNiEtlQvtdLCbpuTvhECthM0Me9tpQMsSAwfXFfKs7XfaHvZG19XUX3Wy+7R1EW4
         LfOKXmIgYgn2e0BIsMD6CC3F0mLiktmLHyZt3GiKeVuT+ShaHbYGGtdkhGI5rIks0J+d
         smzA==
X-Forwarded-Encrypted: i=1; AJvYcCWcwDCy24fJDGGsPkpTmbpyChdsOTO7MC6pYDFLhE+UUGPalcZhVCUSFi+kUlRGM92xY2S8@lists.linux.dev
X-Gm-Message-State: AOJu0YylCFqrSwbA0KJ/wRVXo8Y/Q9cFtdqo6ybpMGGmg97swGjirHvd
	7Tdi+zcbwux+owC1xEKFJdEbT/L0aU979OT64rJ/ifteAbgIh78/u3/BWcAC783aZLFv/RwLwpp
	fI0jrBVsnyoxxK58g6sm3MXgtZ/a7qdI=
X-Gm-Gg: ASbGncvj0NijJDGYvmiahaLhvFOxD9IBqPVyiEVWRaGD9N+70KLcVsoZoC/uEPIWBbg
	HEfOPhDw4XL7T98dlXOBUXD0SX5wVWjgK//+SGIeIumkBuGEpB2MC0vZ0iXx85Lc+7ZWg1yUG2u
	7eYtBWVgzWmMxSoie43wa31kpf86P3CX7hHvfsPsllWloTQX2ukkfqnh/fzh7Uojx92jWClIVIW
	W0eeSPOTzhcH91mtQQG1hw9ShHvA8BEt1CWzZYT+zGSb1H0nSJdl/qW/8cJdVh1IN/FC6TdzmOi
	FybsJcJ+dk+BHOHr+tcEH/PrfFil32kCqCGW6kvcjtFb
X-Google-Smtp-Source: AGHT+IF+PAy5+0R9xjwAdCX870LznTDZ75a10wuLP3ZbEbiT5C6LExmHWXb24zDjqzKozZ/dOKHCNkmycyxUZF7jcyI=
X-Received: by 2002:a17:902:d2ca:b0:288:8c30:f08c with SMTP id
 d9443c01a7336-2902723c5f1mr82403495ad.2.1760082475519; Fri, 10 Oct 2025
 00:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510100127.yuqhg8uo-lkp@intel.com> <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
 <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
 <20251010060618.GA80465@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com> <CANiq72kndiqwEm-OZLd6JumAaBy7KrzYf_rDjwhtw5Uh4vdTCg@mail.gmail.com>
In-Reply-To: <CANiq72kndiqwEm-OZLd6JumAaBy7KrzYf_rDjwhtw5Uh4vdTCg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Oct 2025 09:47:43 +0200
X-Gm-Features: AS18NWCk8eQuqVKsTgaADHERDP4d4Ljx9EM9bs-HZednvRDMU1KzwVAaxbIbeeQ
Message-ID: <CANiq72=bMmDdVMgTAtThciUNQND4cqW42+Udzk6s_X7XZZZpVw@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value `VM_READ`
 in crate `bindings`
To: Jakub Acs <acsjakub@amazon.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 8:59=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> The best would be to use C23-like `enum : unsigned long { ... }`, but
> sadly we don't have a recent enough GCC as a minimum in the kernel
> (GCC 13).

The `mode` attribute also influences the `enum` constants -- doing
something like:

    enum { ... } __mode(pointer);

will make `VM_MERGEABLE` either `long` or `unsigned long` depending on
the compiler and version.

So with:

    #ifdef __clang__
        #define __unsigned_long_enum : unsigned long
    #else
        #define __unsigned_long_enum __mode(pointer)
    #endif

And then using it like:

    enum __unsigned_long_enum { ... };

I can get quite close: old GCC will use `int` for smaller constants
and `unsigned long` for the bigger ones, and everything else (new GCC
and all Clangs) will use `unsigned long` for everything.

Perhaps this may be useful on its own for C in some cases.

Cheers,
Miguel
