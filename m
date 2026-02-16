Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABBE17A2F6
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771263809; cv=none; b=qPZ2omV7dNN8wQkZRWDnoKqpJ519biTOknJHyY13trezdrFsA2mN1rOXhcZ2EE7RJJ7I4Dfekj//fNAI1fld4bdGZjT3B9qxGap+nzcR7DJ6+14lYOZhrlUQIUTRl2ieovOas8Py84Kc4uvJneomxYv2xDsTGtl2ubguwHXf0So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771263809; c=relaxed/simple;
	bh=NcORagMeFC/rvjQXS5vNE9v/gA3EGB9ocV8eIzFRpv0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJDJyXEPTsYUEFVuUKVCSey6hpG9EJhUwYDboVhfiVTPJ9ZgDIIMK/Z7iWKUVbuciA68SdK0dCFB6wnIpHLKyYAt7NfFvbiZ0bqY22W0mghIZck3m5cQjbewWhStk5MuA7l8zneT973Sh40EVJMz3cIN3vVVPUSSSyUFvwfweqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWc/A+e1; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWc/A+e1"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48068127f00so36710705e9.3
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 09:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771263807; x=1771868607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/JQs8pM36d3KULNNrqatslwjR5gUtUOBzbMqn0DXdY=;
        b=eWc/A+e1aPyj3gkGyCbNzunCktVB5+eRi2IuAZ1mb+7Z5cTmh5kh9W6RqkBZgmydhL
         KYSWT7ojF8RGL2t9pv/KW+5t0BaUmkSlgPyDo0aO33eJYIzI5xQTcIQy+IgXPCZWQQtV
         kmy3u12Pban/u3Av6e71HkXZ2VpESOlmCz91mwtPZjsKLEgdQQbZckzI9VakwKTAvFiQ
         a5SXZwWsiP//npWF17UmV2ZzLPKkDyDLmMfwwSf8CRaZiajW3tc2eNfM2iCjDjNbCSw2
         h4jdZ/PEWN4bWGRg89LJmuBGgEYcBSPbPrbv4AWJIWmEQbK9lRnYvfobIr2BK1fb5rGA
         R8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771263807; x=1771868607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y/JQs8pM36d3KULNNrqatslwjR5gUtUOBzbMqn0DXdY=;
        b=ZCBcEC3T8eoQyBN2Ylsv85wA3WxLEh1pui34vnOuamOgSA1a/GVizMijpzUK05PLHR
         Q7bHxV/Rd3oZFwMfpU1uqex3NbXXlUMeVR1swPOYCxOymGFUeg4/HsgevoUWt3I236Qs
         GL1jJQlh9VuvUSj2rOQjRaOHSIQt+bLo9ELQSEmyRlx0fJRwWJ08ojPbp3fwM8Q3/edL
         geqx5Go/9KTZRayZDkVP8vEELYmTr/qVCFCR5zra82tH8FfxgdOmg3gj7qK4PpIXiLOj
         SjtqRemMPT8ZWVklnQSGITws7pcqQqv/29py4ZoDEmrhaU+oovmL7Mcgq1Z4CiCWfHQe
         SYtA==
X-Forwarded-Encrypted: i=1; AJvYcCWnDTDLih7zIn/UGtrgn8SEpkXoslt8wm50SmIZTn5u+g8EgldbK5xS1iLkTHSBlQkkZrFn@lists.linux.dev
X-Gm-Message-State: AOJu0YzNIOfdk53aujy8Enq+KQoF/I4kD1OjyZdNmfYKANRPgN2AMiVG
	PhTyqGkvJRkh19W2Btteadqsr5YOM/HZfWN0GQW96zs28j4NDR4abFAx
X-Gm-Gg: AZuq6aLksp+gSuEUFzVh9xgLMB/GVVKYSMYjccz7DYQnXf+W79IURsd0zixwd/dogt0
	C0UxfYc/CJileo7cOUQNwEZx9uytuzHNiXnZ6jyiJ41+j9iQYNdWpVJpqxFCVfhFDbfgYvM+7vL
	GFossVGLb08Wkn9Uas+B/xnKf9gfd6JHLQu0w9I+iq01s/7VPy1iE+MkMV0RXXfC6kFfopLUeHm
	wmZeOnzFIhe4j8KC5Cq1mzGSr5ivGIBFMtRyc7Tmfk7YuKBOuFgLm8WGaehb6Kf5d8b7pD6lHdP
	IeoV/l/XP7gUsoHIk/py330wZAM4GKl6ORLMsLI3rdzed3g1PlZhsLFbV9ExesPO4k19Yy2RlZZ
	dtrZMjKtewRO6yqbALhrIBoyyjY8PcanTBhGoOwq67EOEncCRkxBTO0Y4c4pzXKZrj0vR/mh0fK
	QWIf4ugss85/8tsYPN4Ljz/zgy9DGy1jm3NDxf9QfObqZ2Rv/NmOBPxxtJV7tFyPxf
X-Received: by 2002:a05:600c:3d96:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-48373a66552mr194454965e9.25.1771263806667;
        Mon, 16 Feb 2026 09:43:26 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4afsm829023295e9.11.2026.02.16.09.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 09:43:26 -0800 (PST)
Date: Mon, 16 Feb 2026 17:43:24 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Waiman
 Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, Arnd
 Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Boqun Feng
 <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260216174324.75d47e37@pumpkin>
In-Reply-To: <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-4-elver@google.com>
	<aYDFOIskB20CbztD@willie-the-truck>
	<20260202192923.0707e463@pumpkin>
	<aYHgNSF5a3F7UGU_@willie-the-truck>
	<CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
	<20260204131400.GI2995752@noisy.programming.kicks-ass.net>
	<aYNUmEfDzq7lTFFr@willie-the-truck>
	<CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
	<20260206182650.6c21b0ff@pumpkin>
	<CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
	<20260215221656.68b2fc1d@pumpkin>
	<CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
	<CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
	<20260216110915.4f0d5490@pumpkin>
	<CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Feb 2026 07:32:53 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 16 Feb 2026 at 03:09, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > volatile structure members are almost free  
> 
> No, gcc does absolutely horrible things with volatiles. It disables a
> lot of very basic stuff.
> 
> Try doing something as simple as a "var++" on a volatile, and cry.

On x86 I just see a load, inc, store - not that surprising really.
(clang did do 'inc memory'.)

It's not as though 'inc memory' is atomic (without a lock prefix).

Also var++ will be 3 u-ops the same as the read, inc, write so the
underlying execution is much the same (ok you might save on the
address generation and the compiler doesn't have to find a register name,
but I don't remember anything modern being limited by instruction retirement).
You might save a bit of I-cache.

I've an idea that gcc converts var++ to 'var = var + 1' early on
and then might manage to convert it back later.
A good way of running out of registers,

> 
> We need to have explicit 'READ_ONCE()' etc atomic accesses, just to
> make it very very clear that the compiler will generate shit code.
> 
> We do *not* hide them and make them implicit by marking data
> structures volatile. I very much want those explicit
> READ_ONCE/WRITE_ONCE cases.

I guess you count as the boss :-)

	David

> 
>            Linus

