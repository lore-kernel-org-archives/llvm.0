Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727E19442
	for <llvm@lists.linux.dev>; Sun,  1 Oct 2023 21:22:23 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-57b6c7d0cabso8181960eaf.1
        for <llvm@lists.linux.dev>; Sun, 01 Oct 2023 14:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696195343; x=1696800143; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PHJrlgm7LFwgtNAlZtL3Zhw4zS1ia4QUcX3TsUNW/zY=;
        b=SW9zlgDHnS22Q0BGxsG9zkOviW2jXNivED3NqtZD/78qtxvqeAZA0wLy3J8feSur9U
         mvWCcyFTW90ByGQ9Wvpu3b1b2URBa8xKChXECQXxwWbrr7Jst2gF3Wqnp4aoIXMZhL77
         hJIa5RQ7UJt6ofTq4uvUyrYwXbFrjj32DU7rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696195343; x=1696800143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHJrlgm7LFwgtNAlZtL3Zhw4zS1ia4QUcX3TsUNW/zY=;
        b=D41NhkytRu18upT4eWMfW1PFqmgxlE/6QKYJ4OZsKxJya2Y8G8tpo5rl9iTAAkSrPI
         rVb7iaBF1QyrxnMNo2xQaFZAmZCEsgVBZCm11XpGk7L1wfITbA5QOcgSdwF/ujpJUqIH
         XqV5NsQLp4+PtgHcoFZbI+DiEJt9MNH1BJ6bous5WvB+b/XUfVEvk0pBsQMQXLOh35yb
         Je9CcsZXW5WhPGS+Vgo2king2TpzEiZdJEVipSyHKIWYQup8ysYKOIeMZcjTBSucrNBO
         lSgLlFnn8Uj7Yc2jtXNthsf5mFgeuUzIm0lCHwSgNyvZEGpg3kp1dZupLEMdCYGfBcEG
         5iiA==
X-Gm-Message-State: AOJu0YzlLyDlg13rbCem2eQX76oP17v9pwn5gOaH9opaqdXsn8UEjh89
	wZ1axFP7/7UvxClw/eZFLBWUrA==
X-Google-Smtp-Source: AGHT+IFJ8g4Z37QS8SaU2llcFOkETm2VqxZtmL7Bq8TmJ06CIdCQ3MlUKaTsGOWE7trNihoFqgoeXw==
X-Received: by 2002:a05:6358:91c:b0:139:cb15:ecd3 with SMTP id r28-20020a056358091c00b00139cb15ecd3mr12488851rwi.8.1696195342750;
        Sun, 01 Oct 2023 14:22:22 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y5-20020a62b505000000b0068ffb8da107sm18363405pfe.212.2023.10.01.14.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 14:22:22 -0700 (PDT)
Date: Sun, 1 Oct 2023 14:22:17 -0700
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
Message-ID: <202310011421.C4F19D45@keescook>
References: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>
 <202309301342.5B5BED40A1@keescook>
 <alpine.DEB.2.22.394.2310010945130.3166@hadrien>
 <90E2BBA5-8A2D-42DE-B36A-CD37BABBB433@kernel.org>
 <alpine.DEB.2.22.394.2310012112560.3166@hadrien>
 <202310011405.7599BA9@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310011405.7599BA9@keescook>

On Sun, Oct 01, 2023 at 02:05:46PM -0700, Kees Cook wrote:
> On Sun, Oct 01, 2023 at 09:14:02PM +0200, Julia Lawall wrote:
> > Kees,
> > 
> > You can try the following.
> 
> Cool! Yeah, this finds the example:
> 
> drivers/comedi/drivers/rti800.c:74: struct comedi_lrange: field at offset 0 is the counter for the flex array
> drivers/comedi/drivers/rti800.c:83: struct comedi_lrange: field at offset 0 is the counter for the flex array
> drivers/comedi/drivers/rti800.c:92: struct comedi_lrange: field at offset 0 is the counter for the flex array
> 
> I'll run it on the whole codebase...

It found only the struct comedi_lrange instances, but that's good to
know. :)

-- 
Kees Cook
