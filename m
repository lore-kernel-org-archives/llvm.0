Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737DB1C2F
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 07:36:34 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso12645417a12.1
        for <llvm@lists.linux.dev>; Mon, 02 Oct 2023 00:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696232193; x=1696836993; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8TgiYq+wn9fPs2sstUM34/3tbN8lpchGjTxpN3osFc=;
        b=lL8NhLM+FBdUjGNYmI/dKLSI/lSHmDPbH38CRuJfqN56MxA3Cgdpz2EOk6RaRXYxdq
         w1VUl0f8FJhWBB1nYgwlzQWN39/cJh7ktjPHmUUc+WiIRffZhVwMUe1K+ZUTEiCZIShI
         apeQqRoyU+PIxNkEmIxxMrkNA9Kq5Zx50vRqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696232193; x=1696836993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8TgiYq+wn9fPs2sstUM34/3tbN8lpchGjTxpN3osFc=;
        b=wXmo2pN8IfiJn3Mo85jN0uSq7VHZZPho2c9oVOT7ilL0MmB5jhGRfOcTyJxES4ln/1
         7ZK2Hlnr63sAvBjGgw9VGl/znE3N9nYW/hbYvT+SVvsRGIQq7+eFpqx9R8sDbr3zj2K6
         Wed4OfvnALs7FntFlQJOUrlvkJXz+owT3EiROglV+VH2SSj8Tb9wTfHUs09nGdu6rGxU
         68cZdVBExl7hDiQ391dqZ2icxaKUohOFpFfgub/d1VL4SGcd6aLEcEaAGMa9cPPXV5gJ
         GW9HZ9LMc+GRKDBQdw+4gT0yffWHCEmk9CxCUUIsrcB+mxcScjRs+I3PzUtULoQA53kN
         g2+w==
X-Gm-Message-State: AOJu0YzuLCeo/CZK20dJVfkXtM9uzUEQBbY2cUrrvKKSRAInNKcZqwaE
	XgSaVAgPE9K6hM4CZth7S+kDRQ==
X-Google-Smtp-Source: AGHT+IE/4RrZBVTAWpHkJyOr41YZ89aixqnrkCQ1kdzSx+Qmep1XqZBJfajMYApMeMqYNsEHfwK1sQ==
X-Received: by 2002:a17:90b:3644:b0:277:1bd8:abe8 with SMTP id nh4-20020a17090b364400b002771bd8abe8mr9560405pjb.18.1696232193693;
        Mon, 02 Oct 2023 00:36:33 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a194600b00278eb908f78sm6274500pjh.19.2023.10.02.00.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:36:33 -0700 (PDT)
Date: Mon, 2 Oct 2023 00:36:28 -0700
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
Message-ID: <202310020036.864B735D60@keescook>
References: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>
 <202309301342.5B5BED40A1@keescook>
 <alpine.DEB.2.22.394.2310010945130.3166@hadrien>
 <90E2BBA5-8A2D-42DE-B36A-CD37BABBB433@kernel.org>
 <alpine.DEB.2.22.394.2310012112560.3166@hadrien>
 <202310011405.7599BA9@keescook>
 <202310011421.C4F19D45@keescook>
 <202310011515.D4C9184@keescook>
 <alpine.DEB.2.22.394.2310020737570.3166@hadrien>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2310020737570.3166@hadrien>

On Mon, Oct 02, 2023 at 07:38:42AM +0200, Julia Lawall wrote:
> The sizeof with an expression argument is treated differently than the
> sizeof with a type argument.  So you need to write:
> 
> @allocated@
> identifier STRUCT, ARRAY;
> expression COUNT;
> struct STRUCT *PTR;
> identifier ALLOC;
> type ELEMENT_TYPE;
> @@
> 
>         PTR = ALLOC(..., \(sizeof(*PTR)\|sizeof(struct STRUCT)\) +
>                          COUNT * \(sizeof(*PTR->ARRAY)\|sizeof(PTR->ARRAY[0])\|sizeof(ELEMENT_TYPE)\), ...);

Ah! Thank you thank you! Yes, this works great now. :)

-- 
Kees Cook
