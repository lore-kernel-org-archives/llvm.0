Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6B01E261F
	for <llvm@lists.linux.dev>; Fri,  7 Feb 2025 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738933991; cv=none; b=aJSo0TrXkIMvIIcpgKtTHLrFy7Up4G3rXyVzZF6Ouv3C2ROwVeZgVjUFPI5SC5X2SGf+2fZYJaUYLePLKwlV1u6FcOgGwzXO1HJy7RgsuMVeeUeRpWAEwA9nqTulykzZW2IoPqw7hNtQHAULR1U5Dby3EUcJLi4Iafn1zFlnwOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738933991; c=relaxed/simple;
	bh=aZ19R1SS1Qu6WngnQMEvJagwa5mZ8kHBwxwl1TDJjrc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ac+C7zfAjwa1Un5yOmeZEWsHTj4GWfX0XEe8QeXRitZoPjLBX91ABRECnWn6mSLnQNfhpmh95jxOj5jY4W0A6601ZbxW/03kdUVvp2bnhaP2p0tK2kx5s+eST3eMVi+GyynPyKAZ8oWXQ/rcx32+Eto/zDgvgIwnBAClXN/x5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEVNs+Jj; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEVNs+Jj"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dcab4b0e1so524164f8f.0
        for <llvm@lists.linux.dev>; Fri, 07 Feb 2025 05:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738933987; x=1739538787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27KkUDNJw1RLFiIkfRRK6X+WdEXXvAVT3A6L55vHOpg=;
        b=UEVNs+JjxqmVVfNNnE3MQ7FnT2wjvzo8rMpVxK+IXnrbyLoJZ8wupkp+fGFAb62dNS
         5gO2E49h9qWaJKNdu9yyuqVEG7GVnTHBQ16UAHGgAhAOLtgaKhH6QftB1b09UzqQUUzv
         yuhCOw513ai8wU/pL/F993e+SJoFSTVf//I5YmFKsvEv9NhsRCP/yKgSSAE2Qv8VwsEQ
         +6jrKUqlvJgSGC1zW1AdfBnyh6RiAIDM7DOI+l2lPQeyHqn7Baz+7rfkngLzANY+aVsh
         qV0hI6ysUvXp1LXUH2UOjYSrvMFYvGSYV72CRWMxypKpcoJmXYbx7oZPVIn2IKP/AXue
         vhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738933987; x=1739538787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27KkUDNJw1RLFiIkfRRK6X+WdEXXvAVT3A6L55vHOpg=;
        b=swbBpFiTBXvJrIWFGS15+1ZXEyCA9E1LUMasOJUAY2z3M8yLssHaET7pvNq7ya6AhD
         lMIBxvDIlfAsf6rD5hrnneQsRzBUiqzmYzLyVqVFDIG7SX9bMiJnfCGG7ZZnFvLFP1qj
         F7qKUPgI0JRcp1bo7jsP5fvYixp7L7YRuYxkfkBATay/sU2JnS9edlVW54mvjjyQYk9W
         1VjNbiMI95gqzGyYZ/E+xN68iCKX0fBMFampyR3EH8CE3EPxEftIQE5dEp2iUcMIKw/e
         34Wg6hCQbR1oal0/fruY1S7NKCc1yxXSzGRCvAm6akvNLpI27qlSehGg+lKZ3qBdbErU
         9I6w==
X-Forwarded-Encrypted: i=1; AJvYcCXgFkcjCQC0gyIkjIYKda5dBtVKCIpTBDnt/gAlVWESWcPApauF+2VOFDONB6XgEJ/LUG3P@lists.linux.dev
X-Gm-Message-State: AOJu0YwU+5ftaj4Ifnp5eh5Ila5YUUB6TR+J5ZaDSiIsp8xoXRmFR+8I
	XTau2lkv5BnAevRjfEtP0QiBsy2Fs16nnV2xGMbCOwcukmI5V8I5
X-Gm-Gg: ASbGncvvgiz2TtOWfy+ZSEhJeYPlW6fbLcvsCjv/27j5jV6TnzselRKu+3oSmhSqXC0
	3Mq6gE20OGTMpcvNsSdh1MokS4toJsbQSk2jBEQCPfXG9x51LH5+eMHMYw6D0ZF1v8HAYZ0Atnu
	k2DjZDrLFn8bBrf465iDDPOJn+mSEboY7OcIpmXLPZ93y8XdIk5c0FKv4g7JPa0TFruRadWkI4x
	ENyx4wW/htSUUMcvqlzOVqrtQG/CbFXnzNv3sQWbBFKOJB6d7hHQKI7DAWiRm/BWPH8D7Xrk7kX
	eqtXiWQvvc2TnYwCVAVQid3+xc1/ZhOa3ZQqHJSXYhN0EEG/7X+dtQ==
X-Google-Smtp-Source: AGHT+IHA8MZY98vQni86hWr8I/ooUhp299QFYV2Fy/D2NI8xPW8MtlegAc+P6NjTDdvd1Frmah7O1w==
X-Received: by 2002:a05:6000:18ac:b0:38c:5cd0:ecd5 with SMTP id ffacd0b85a97d-38dc9343fc9mr2203254f8f.38.1738933986355;
        Fri, 07 Feb 2025 05:13:06 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm1615751f8f.14.2025.02.07.05.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 05:13:05 -0800 (PST)
Date: Fri, 7 Feb 2025 13:13:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: Kees Cook <kees@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Kent Overstreet <kent.overstreet@linux.dev>, Andy Shevchenko
 <andy@kernel.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Philipp Reisner <philipp.reisner@linbit.com>, Miguel Ojeda
 <ojeda@kernel.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] compiler.h: Introduce __must_be_char_array()
Message-ID: <20250207131305.0fe9622d@pumpkin>
In-Reply-To: <87mseyrv6j.fsf@prevas.dk>
References: <20250206175216.work.225-kees@kernel.org>
	<20250206181133.3450635-2-kees@kernel.org>
	<87mseyrv6j.fsf@prevas.dk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 07 Feb 2025 09:55:00 +0100
Rasmus Villemoes <ravi@prevas.dk> wrote:

> On Thu, Feb 06 2025, Kees Cook <kees@kernel.org> wrote:
> 
> > In preparation for adding stricter type checking to the str/mem*()
> > helpers, provide a way to check that a variable is a character array
> > via __must_be_char_array().
> >
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> >  include/linux/compiler.h | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> > index 7af999a131cb..a577fe0b1f8a 100644
> > --- a/include/linux/compiler.h
> > +++ b/include/linux/compiler.h
> > @@ -221,7 +221,13 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
> >  #endif /* __CHECKER__ */
> >  
> >  /* &a[0] degrades to a pointer: a different type from an array */
> > -#define __must_be_array(a)	__BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
> > +#define __is_array(a)		(!__same_type((a), &(a)[0]))
> > +#define __must_be_array(a)	__BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
> > +							"must be array")
> > +
> > +#define __is_char_array(a)	(__is_array(a) && sizeof((a)[0]) == 1)
> > +#define __must_be_char_array(a)	__BUILD_BUG_ON_ZERO_MSG(!__is_char_array(a), \
> > +							"must be byte array")
> >  
> 
> It's probably unlikely to ever encounter an array of _Bool or array of
> structs-with-a-single-char-member in the wild, but it does seem a bit
> odd to base the test on sizeof(). Why not add a
> 
>   __is_character_type(t) (__same_type(t, char) ||
>                           __same_type(t, signed char) ||
>                           __same_type(t, unsigned char) )
> 
> helper and write the test using __is_character_type((a)[0])?
> 
> Or if you really mean that it must be an array of char, not any of the
> three "character types", simply replace the sizeof() by
> __same_type(a[0], char)

I'm not sure it matters enough to slow down the compilation by that much
cpp bloat.

	David


