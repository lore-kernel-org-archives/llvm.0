Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538D014F73
	for <llvm@lists.linux.dev>; Sun,  1 Oct 2023 22:21:31 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-690f7d73a3aso14375862b3a.0
        for <llvm@lists.linux.dev>; Sun, 01 Oct 2023 15:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696198890; x=1696803690; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0pqyiI3+7drkqtZIOt/nPWQvKqd+z/yppiMX4edx8e0=;
        b=RXyRLxJZkv4ZgYWrQL6SArc+/woG326+EdLS5YAB2X3/rszr7dHY4Dx2KtGRBida+j
         8TL6qR3adk4vB4fS+/jCfBCK++rEOgKqMEpVgQqnZZ630P5r4+gswIJZu7PlcctPM7IC
         bDj4n/zJATIL60Iju7eHsZNX8yR9B4s2jKWM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696198890; x=1696803690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pqyiI3+7drkqtZIOt/nPWQvKqd+z/yppiMX4edx8e0=;
        b=vWE98J+olSTuqWpTMUef0GqklGN3oLl5oUwEatPYbqchVQqUjOouC3BPW8Td3I54Ol
         VDN7Ouoe6QNq+Sk7cn5Lp+DWg0GagC/K3FvC19NMIxUWXpkrqj7hiwqaVre/1Qf+fiGx
         QSuXqxmcNhr/Brcr+gCzfO9uFMwVNg41lQW80glpzJ7CosGH2ixpSEC6h4Cgxe1Rii20
         BSwb1Snzym6FpnAKSeo6AnMHZRt5HRKOj808c7qH09ToOfioELKd1nVVXkgl1rPCAqqD
         S+ZHf2fbEKXPokzWO3pesIjvye5+JxPvZ3s7dz7umhZ9taa2DYyfl5igZmj4FZZ5x7jL
         jJFw==
X-Gm-Message-State: AOJu0YxHBSvorTKq+69SljV0VXIqFGiZAYVMv1x7cyu0xKOCAQf5QD8F
	73YW0Q161lL+xiX3Y5AndIsrLw==
X-Google-Smtp-Source: AGHT+IEygYiXe/d0uPbrlFytK8CFzeVNQ2yBgFbzEaFRC83+K+JWqX4wlfI8uaxMMEcnvrQFQnEagw==
X-Received: by 2002:a05:6a00:852:b0:691:da6:47a with SMTP id q18-20020a056a00085200b006910da6047amr12630310pfk.31.1696198890639;
        Sun, 01 Oct 2023 15:21:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q26-20020a62ae1a000000b0068ffd4eb66dsm18313851pff.35.2023.10.01.15.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 15:21:29 -0700 (PDT)
Date: Sun, 1 Oct 2023 15:21:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Kees Cook <kees@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] comedi: Annotate struct comedi_lrange with __counted_by
Message-ID: <202310011515.D4C9184@keescook>
References: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>
 <202309301342.5B5BED40A1@keescook>
 <alpine.DEB.2.22.394.2310010945130.3166@hadrien>
 <90E2BBA5-8A2D-42DE-B36A-CD37BABBB433@kernel.org>
 <alpine.DEB.2.22.394.2310012112560.3166@hadrien>
 <202310011405.7599BA9@keescook>
 <202310011421.C4F19D45@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310011421.C4F19D45@keescook>

On Sun, Oct 01, 2023 at 02:22:17PM -0700, Kees Cook wrote:
> On Sun, Oct 01, 2023 at 02:05:46PM -0700, Kees Cook wrote:
> > On Sun, Oct 01, 2023 at 09:14:02PM +0200, Julia Lawall wrote:
> > > Kees,
> > > 
> > > You can try the following.
> > 
> > Cool! Yeah, this finds the example:
> > 
> > drivers/comedi/drivers/rti800.c:74: struct comedi_lrange: field at offset 0 is the counter for the flex array
> > drivers/comedi/drivers/rti800.c:83: struct comedi_lrange: field at offset 0 is the counter for the flex array
> > drivers/comedi/drivers/rti800.c:92: struct comedi_lrange: field at offset 0 is the counter for the flex array
> > 
> > I'll run it on the whole codebase...
> 
> It found only the struct comedi_lrange instances, but that's good to
> know. :)

On a related note, why doesn't this work?

@allocated@
identifier STRUCT, ARRAY;
expression COUNT;
struct STRUCT *PTR;
identifier ALLOC;
type ELEMENT_TYPE;
@@

        PTR = ALLOC(..., sizeof(\(*PTR\|struct STRUCT\)) +
                         COUNT * sizeof(\(*PTR->ARRAY\|PTR->ARRAY[0]\|ELEMENT_TYPE\)), ...);


minus: parse error: 
  File "alloc.cocci", line 15, column 34, charpos = 485
  around = 'struct',
  whole content =       PTR = ALLOC(..., sizeof(\(*PTR\|struct STRUCT\)) +

if I drop "struct", then it complains about ELEMENT_TYPE...

-Kees

-- 
Kees Cook
