Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4042E631
	for <llvm@lists.linux.dev>; Mon, 13 May 2024 18:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715625263; cv=none; b=GfWxQZU4UMto4RJUN1lO+FRUlUvN2aQ30buAUqp48pIzJ3nOSY0TbvMBAmqpez/DSV3o4Pi3xmqY7K8+HiVPVA51mO+JqV5/Dn+8qDBGsDbk+FS0Kvkqh7xJPprdm26kJA711TRC0uhWVVWdy9ZtC6corYT/5sVeec1KOT2IiEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715625263; c=relaxed/simple;
	bh=LMpgS9YUb5fP274F97/qNj06fpYzBLVeI1R6c6nW9QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvGD9wkjUKcgHnP/vcftfw236pskHaUeGZBAHWHlLuPad4mo2rYYugHEKZYjegASQukGKj0wd3euNRJqVaeLKWOcuIU/RUF6M784N2PtNIyL5Bk/6NYJRj3mDFYcqrNmHyvtmXJGakRxbGCYhqWThRpQW8QH0RaPIAO2nouSLuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kOW1WTVO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kOW1WTVO"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1eeabda8590so33560795ad.0
        for <llvm@lists.linux.dev>; Mon, 13 May 2024 11:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715625261; x=1716230061; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h++n7Qlyg3sgT4EiaSRCnOzzYyK0B8BDWAHRP3/F3N0=;
        b=kOW1WTVOkENTxojP9xiZGmh6frcpxbaCVrU1i75tOGylMmTcMuaxYhQZA2HhlMDSXt
         xV6rUgTPt2+J8Us7yL/uRVAaAeNaCiYuHk/BtJvAhS922U+ewafSTHRAAmZtBimMRjQ1
         i1CGSZMxe3NBsGZSMk8N9v6oaD9Wi2D7YeWgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715625261; x=1716230061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h++n7Qlyg3sgT4EiaSRCnOzzYyK0B8BDWAHRP3/F3N0=;
        b=ICDHUe2VKxYNTF0CVYJpnBBp0eEmpUgucyo6R10vAGyxZl0ZLXnZHmjIsi27c2WUkf
         qTsVlRA46AQg56+WtFeVe6KLNMoZSCRT42ZK9zjb3sEO5jYVcqfE39fDbERjWmCAPoP6
         yDhE0+bGQxSCCbb4egcaaDYTvb/CUp8RX0C1P14ZQObKGw8ubf4ZkkYbtLqRon5/Q/8r
         p6MyZDVZvbB6l830osF3G7oILFXUjXxpg0JEVCze6lHiUa8ahPlTeW9hUGGxpEF/RopL
         rsvti1SDgBeQoQn3jDWx74ohKHlDv7mhlkbFUaXSkO7Sua733/9AD0J1wfPeTNBWIm7f
         Pv3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAOJgGPMdSZV/qbwoF9YT9qNDEUMcFn0l4MvHO4MuM8gaFq0DztS/l9TLOoaVjwq9k7Zc6Xl+GTv+RO0CpYfJactJaEw==
X-Gm-Message-State: AOJu0Yy+YT4HG74eLuZsUCAGN0RYIc3pkBtNwc2v2clo6iPG7SmQp1k3
	DN/DEHUmy6YjUutWNPwj0yCy4MCI2tZZH0tNU7ZVjdqw0UimBRKipEwAbE1yVA==
X-Google-Smtp-Source: AGHT+IHCc1iDoDY8y7cN3McKpzD8GoP+zaGEka3xojOMmbdy8UwKg3X31LKvQDdXyzyN7fH2gRjLEA==
X-Received: by 2002:a17:902:dac6:b0:1e0:b62a:c0a2 with SMTP id d9443c01a7336-1ef441613edmr122093915ad.51.1715625261157;
        Mon, 13 May 2024 11:34:21 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13908bsm82642315ad.265.2024.05.13.11.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 11:34:20 -0700 (PDT)
Date: Mon, 13 May 2024 11:34:20 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Martin Uecker <uecker@tugraz.at>, Justin Stitt <justinstitt@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
Message-ID: <202405131047.A3861EC13@keescook>
References: <202404291502.612E0A10@keescook>
 <CAHk-=wi5YPwWA8f5RAf_Hi8iL0NhGJeL6MN6UFWwRMY8L6UDvQ@mail.gmail.com>
 <202405081144.D5FCC44A@keescook>
 <CAHk-=wjeiGb1UxCy6Q8aif50C=wWDX9Pgp+WbZYrO72+B1f_QA@mail.gmail.com>
 <202405081354.B0A8194B3C@keescook>
 <CAHk-=wgoE5EkH+sQwi4KhRhCZizUxwZAnC=+9RbZcw7g6016LQ@mail.gmail.com>
 <59f731ab619673afec4956fce6832a1cd5324fb8.camel@tugraz.at>
 <CAHk-=wjERv03yFU7-RUuqX1y89DYHcpdsuu++ako2nR41-EjYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjERv03yFU7-RUuqX1y89DYHcpdsuu++ako2nR41-EjYg@mail.gmail.com>

On Sun, May 12, 2024 at 09:09:08AM -0700, Linus Torvalds wrote:
>         unsigned char *p;
>         u32 val;
> 
>         p[0] = val;
>         p[1] = val >> 8;
>         p[2] = val >> 16;
>         p[3] = val >> 24;
> 
> kind of code is both traditional and correct, but obviously drops bits
> very much intentionally on each of those assignments.

The good news here is that the integer implicit truncation sanitizers
are already split between "signed" and "unsigned". So the 2 cases of
exploitable flaws mentioned earlier:

	u8 num_elems;
	...
	num_elems++;		/* int promotion stored back to u8 */

and

	int size;
	u16 read_size;
	...
	read_size = size;	/* large int stored to u16 */

are both confusions across signed/unsigned types, which the signed
sanitizer would catch. The signed sanitizer would entirely ignore
the quoted example at the top: everything is unsigned and no int
promotion is happening.

So, I think we can start with just the "signed integer implicit
truncation" sanitizer. The compiler will still need to deal with the
issues I outlined in [1], where I think we need some consideration
specifically on how to handle things like this (that have a
smaller-than-int size and trip the sanitizer due to int promotion):

u8 checksum(const u8 *buf)
{
	u8 sum = 0;

	for (int i = 0; i < 4; i++)
		sum += buf[i];		/* int promotion */
	return sum;
}

We want "sum" to wrap. We could avoid the "implicit" truncation by
explicitly truncating with something eye-bleedingly horrible like:

		sum = (u8)(sum + buf[i]);

Adding a wrapper for the calculation could work but repeats "sum", and
needs to be explicitly typed, making it just as unfriendly:

		sum = truncate(u8, sum + buf[i]);

Part of the work I'd done in preparation for all this was making the
verbosely named wrapping_assign_add() helper which handles all the
types by examining the arguments and avoids repeating the destination
argument. So this would become:

		wrapping_assign_add(sum, buf[i]);

Still not as clean as "+=", but at least more readable than the
alternatives and leaves no question about wrapping intent.

-Kees

[1] https://lore.kernel.org/lkml/202405081949.0565810E46@keescook/

-- 
Kees Cook
