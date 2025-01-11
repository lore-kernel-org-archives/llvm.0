Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7477D1B218A
	for <llvm@lists.linux.dev>; Sat, 11 Jan 2025 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736614730; cv=none; b=rwNtLQEBKVJV72fzQ8LY2yCd3kL1PNNkwSJ6adaBAbZg2HrG2d3KvrZxXqUDwo2gsdOB8Ac5xqqMzUxTiEgmNXgY6+PTllgsFzHXtRoTNoSzZhYKVckV7N4d2rcn4bidkxeD9JHBuildJ1EmaoRk2r/HHQGivMSZseVuuVWP6VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736614730; c=relaxed/simple;
	bh=OUIi9F+TJRnFLryZrlChgH+XL0A567aTOShmQyBVaHg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqaYXn/7lJ0HvFu96jfjTLXwU2MLZmdw48dGai06Pbip8pdHFtqRAlPsYsyKoAh49X/2MmtWaSB+7OcK2Ww3tOnCBIQC9qmDG8lDAjFbWb8QuEZ/NMyAsgCKd8EOFyykTVA8vy7LPu5yAFDCsuIH2NIJGy7IqWDsnrcS6USkFBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULRtCJIX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULRtCJIX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so2427373f8f.1
        for <llvm@lists.linux.dev>; Sat, 11 Jan 2025 08:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736614727; x=1737219527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUSRPHdzB/cOUjwwb3A27PIiwV4I4L9h3LIMwjYQ70g=;
        b=ULRtCJIXy1c6dRNDh84uGxDvaVaY7CONQHzcKTb4uxpUYO1Ix37Laq8gm4A0vMHC+O
         Oel4nsLc046gv8/AAbbakFAh4OhyKviiS8Xs62I3IyJUhglxdy8TlHFFZrnVb1jByj5h
         hFrKbCRXz14hJ/lbvimP5OEH2jJhRm3Loa84v/O+wKQ0cEKSbHdVJ0uUxA67ohXI2TR4
         V0gqABUZAA+5EVsLhm1exxo9tRSGp4OTrbzl9VYYHa9tcXJ5YLNvqliqIe3ibMXc8WY6
         3FHKeQ3IcAn8nOA4nNWLppSTrmctD/Ex3PVMr31eR46vYr1RVKHHFfn9GH+F+sszQIiy
         1PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736614727; x=1737219527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUSRPHdzB/cOUjwwb3A27PIiwV4I4L9h3LIMwjYQ70g=;
        b=DtYxjKK8A1QqFzNFwgaKfDeEt0/lT9i9MmfNnl8Ff+bQJyWXlLpXC/dCTI8PLS/H1x
         FLem5K1SIyhY9Dj8baQGYBHL71IXoGdjAr+dxmTDRasIfWtnClIzZjXJuibTqhfTtIoc
         mwEXM7DAK/+2zHKVb2HnEUUU0YKKeHQb6OhZtQaVpNVhJIhk2dfz0Rc46xOaJQATW2zx
         t/4pxkSqwyhNEL/CfPn2gnzdOAA+A+DWN79umAfkxJlFcZHaJlMHQMGpPMvIdIHoqmWp
         5lPjkpamY+2xsz5AepJ0nxjcUtn+pmfo37q/dZbM4wakAVQ9AtLH8DUXcWiZcNOdBqDB
         6/6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUreIZP9qU8BM3s4lzv3WVCbAg61bpaUvqCWk9mlnXUYqkEv7P5FHU5VxmVi7ahrNKYwBqW@lists.linux.dev
X-Gm-Message-State: AOJu0YzhhwNvn4oV6/9WkZFMBObGqaRiSefU9wPLtjQXabeeI2o9tBwQ
	WMraZPeySkDfpOhUBa8A6sTdkH8vDtRTToUvWaF3Nna0x5Fuj7Dp
X-Gm-Gg: ASbGnct+VGPJ5XcsEdd+2E1gdmgjRZTcJIB8on+kLm0SFuQTISdVB9ZtUUasq/kE+2S
	KxH7JdBbi93ZzrB1xLqMlFRxiXpjp8sTRappFUvAEdEt0bqBn8rUJFByjE0DzmIm0Z68Oz2fT8r
	2RPOZQMT88kJjZUHdwOL9P2jOr/H2Tv8IG4xNXXO8mxoebEJ0TBMQ1F2tedizeGtk2fFqVfsfUb
	Xavq8OYbsPnHjQYWetbliPkCbd3EbMbE9lfXrrBrtqUINJBazZ0Ua/cVz4tep35Qiv+MyTuIYBZ
	qq6nXDiXmh02u+amPio=
X-Google-Smtp-Source: AGHT+IHusHBn+G+Yu1cLeUYiEjTyAna7nOzbU+UumgpxXH7MRk6x3b4oahs1HW8+IObUWmb0XU4/qw==
X-Received: by 2002:a05:6000:1884:b0:385:ea2b:12cc with SMTP id ffacd0b85a97d-38a8730442fmr13918014f8f.13.1736614726620;
        Sat, 11 Jan 2025 08:58:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b82ebsm7462898f8f.82.2025.01.11.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 08:58:46 -0800 (PST)
Date: Sat, 11 Jan 2025 16:58:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, David Laight
 <david.laight@aculab.com>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] fortify: turn strlen() into an inline function using
 __builtin_constant_p()
Message-ID: <20250111165844.6d95600f@pumpkin>
In-Reply-To: <CAMZ6RqJbinVpsGf6ADUtQTYPRRQN=D8Ne_n6pHtDUPXxED5ZvQ@mail.gmail.com>
References: <20250108-strlen_use_builtin_constant_p-v1-1-611b52e80a9f@wanadoo.fr>
	<202501081331.E4B6DF747@keescook>
	<CAMZ6RqJS5FwuBUdvVdXoZj6wZOJz8Nao4FzSzCK1VtbNF41sMw@mail.gmail.com>
	<CAMZ6RqJbinVpsGf6ADUtQTYPRRQN=D8Ne_n6pHtDUPXxED5ZvQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Jan 2025 23:40:41 +0900
Vincent Mailhol <mailhol.vincent@wanadoo.fr> wrote:

> On Thu. 9 Jan 2025 at 16:52, Vincent Mailhol <mailhol.vincent@wanadoo.fr> wrote:
...
> Actually, I did more investigation and it is working for some strange
> reasons. Whenever the argument of a function named strlen() is a
> compile time constant, the compiler (both GCC and clang) will replace
> it with the string length on the argument, even if strlen() is
> programmed to return something else:
> 
>   https://godbolt.org/z/nK4b3fnM7
> 
> So it is only working because the compiler uses its builtin strlen()
> instead of the function we provided.

It depends on whether -ffreestanding is set.
If not set gcc/clang assume a lot of the basic libc functions have their expected
behaviour.

	David
