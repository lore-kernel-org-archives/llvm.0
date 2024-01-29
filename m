Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33C27604C
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 20:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706559987; cv=none; b=ZaMlSM4HuYveIicnn2q3KJwTVoqFBGD8Jk2+ZLvKr3T2McGhJSHBjAEEwIF/ByLMhvzrNK2LzXe678QR5+zEnvN1vvyby4DA7t1t3JaNONPEx7GZgxIfC0C/PoMUJ6fpFjE6ZGv8w9L4JycRA3gF0B8m/DJ0MMvmAjmnTK3Wa68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706559987; c=relaxed/simple;
	bh=SMrAnU030wuDhlboOt55byceqkItemYdSY9Vo59Y2yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOcsliQ4DDBwt6JxxOCWhWWjj7STclUUNKzC2cWIBUWQkdyo/TAGKDAlUcSFlWfuHwgyXalibwK+iQWKa4hCRp8tg7/uFTocLRzSEES9PCkKBStsNHT6ad3ejQtk5nnp/idFjFejx8X8ngdZoIMzXZGLFQCWDUHdkjy135lcSU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bt2SSqg6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bt2SSqg6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6de2f8d6fb9so810829b3a.1
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 12:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706559985; x=1707164785; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6E+CSDDSvT91f9Viy+M6uu4Auu69C79V+Tns03Gp4VA=;
        b=bt2SSqg6L1rP0FhRjsMMUl8bfzxRBGyTEuLG8gyNtJzt7ByugOrlDapoyMH6tiL8Wo
         Ld3KPBwmVtfIqqTpchKcZvNxIa7Ev4TZnoXYrMglI76+REb7Y2uDY07Ewf2AoLSL6yrA
         3QSZzm/4JBlzVhRlWw2XzgSWTIdyqBRFJOsHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706559985; x=1707164785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6E+CSDDSvT91f9Viy+M6uu4Auu69C79V+Tns03Gp4VA=;
        b=F6b9pnj37YGnBrq1U5aBRPHTQjJSRjKPCj7gM4dj2vfc4q+3sBqtgfdegbFrZj5Qrm
         QRtiLde04NnBi4hUKRsIcwhUArKRnrI0bY+16B/qECAeXW3yB7HYPmB+Qtnc22HfM+zE
         iTYmfeJQohlHz35ApvhuwtkEuQCu3hWS6ex0snrvu2Vcz+YYhWezL6lpcgDXLvlGrf9D
         rShZwSaRDnDa2PLekds9nVzI9UvTy24qo903atXKN8N1ffQWbHpk9JGf96gEXzi//w9S
         CEPw0+o/YPClhwcneave9tF9imKsJjzfoWg7vuQLEZlIDWvy31je9Of+bnSIUaDA+wh3
         HDmg==
X-Gm-Message-State: AOJu0Yw5tRmitZbAKjSwOoxFZ/V1kEUgMRzW1cRjpACRDZEi09PvE02x
	mhOGX/uAN/QY1ODrv81y7r6jpY0qKPxm5xEOU2MDjUimZOr7r246eu/TV1Xe/fuU4PrtQtyF5+g
	=
X-Google-Smtp-Source: AGHT+IEljCTSge/PCk3xrZvAhS+vec3Iv/hm4f2dPqTNvAEMD81HKYx4c8Hh7l8Y79fYPZE4uKvCYQ==
X-Received: by 2002:a05:6a00:d74:b0:6dd:8a25:e167 with SMTP id n52-20020a056a000d7400b006dd8a25e167mr4255359pfv.34.1706559985074;
        Mon, 29 Jan 2024 12:26:25 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a15-20020aa78e8f000000b006ddc3794de7sm6239422pfr.134.2024.01.29.12.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:26:24 -0800 (PST)
Date: Mon, 29 Jan 2024 12:26:23 -0800
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-hardening@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 4/5] overflow: Introduce add_wrap(), sub_wrap(), and
 mul_wrap()
Message-ID: <202401291224.53CA9C17E0@keescook>
References: <20240129182845.work.694-kees@kernel.org>
 <20240129183411.3791340-4-keescook@chromium.org>
 <8dead2fb-d522-492b-89f2-1358198c1cdf@prevas.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dead2fb-d522-492b-89f2-1358198c1cdf@prevas.dk>

On Mon, Jan 29, 2024 at 09:08:43PM +0100, Rasmus Villemoes wrote:
> On 29/01/2024 19.34, Kees Cook wrote:
> > Provide helpers that will perform wrapping addition, subtraction, or
> > multiplication without tripping the arithmetic wrap-around sanitizers. The
> > first argument is the type under which the wrap-around should happen
> > with. In other words, these two calls will get very different results:
> > 
> > 	add_wrap(int, 50, 50) == 2500
> > 	add_wrap(u8,  50, 50) ==  196
> 
> s/add/mul/g I suppose.

Oops, yes.

> > Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  include/linux/overflow.h | 54 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> > 
> > diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> > index 3c46c648d2e8..4f945e9e7881 100644
> > --- a/include/linux/overflow.h
> > +++ b/include/linux/overflow.h
> > @@ -120,6 +120,24 @@ static inline bool __must_check __must_check_overflow(bool overflow)
> >  		check_add_overflow(var, offset, &__result);	\
> >  	}))
> >  
> > +/**
> > + * add_wrap() - Intentionally perform a wrapping addition
> > + * @type: type to check overflow against
> 
> Well, nothing is "checked", so why not just say "type of result"?

Yeah, that's better. I was trying to describe that @type will affect the
value of the result.

> > +/**
> > + * sub_wrap() - Intentionally perform a wrapping subtraction
> > + * @type: type to check underflow against
> 
> The terminology becomes muddy, is (INT_MAX) - (-1) an underflow or
> overflow? Anyway, see above.

Right, I should explicitly say "wrap-around".

> 
> >  
> > +/**
> > + * mul_wrap() - Intentionally perform a wrapping multiplication
> > + * @type: type to check underflow against
> 
> And here there's definitely a copy-pasto.

Ek, yes.

> The code itself looks fine.

Thanks!

-- 
Kees Cook
