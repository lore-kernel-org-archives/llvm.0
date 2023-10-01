Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAE82F39
	for <llvm@lists.linux.dev>; Sun,  1 Oct 2023 21:05:50 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso1698488b3a.0
        for <llvm@lists.linux.dev>; Sun, 01 Oct 2023 14:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696194350; x=1696799150; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oPET9w0ktAjq+TgFKzzsSU899+RQr2NesK2FVmHe4kw=;
        b=VXh/adeMIXJ9D+5xQxpMPNp+ANRvQIapIvYC2W3RpN6Zko5u7AtE8SAZTmzXNOpTqu
         IoyKoai0yQNUBWs4H5bEniJdltWeIk3oScBMGTGfQow+SL9DfeLbzGX6LtjaKqKGjE2+
         1e+JlPY1KMtcfGVm0R/h7dtuSGRAKNIwEpOrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696194350; x=1696799150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPET9w0ktAjq+TgFKzzsSU899+RQr2NesK2FVmHe4kw=;
        b=OLvgSYvIh3wm1vOQk2ogfN84ZIMnC0nnAVwzL+VVQaajjzY79NcOIjPneBEIn+EP/z
         Er5aUEbasF2YXj5Olzfq/CCm2BFlqeXKw38jm0n8fw4SsHwcHjv9qgG8w3j0s3rTEPdL
         vGza7HBZhcUQABgINeRSvpFUtsgOgLMEVZ0jeVPhHS0qgTpqWETjip53hUZ06z0pXNG8
         mNgygcnyZ7hlTuqzY/E4L3jNd1sGDDI6ewLwcbAkL783/dC/K3aI3SnkmsR8H7WlkNVn
         SBmmM5dSOpZxGclg/O/ALlyP1R7HT1QS0jxTHWW2HbaZXFR9GLkvKFkUr59Bp2EfBM//
         HPmw==
X-Gm-Message-State: AOJu0Yx6qcrnY1yGDdh+3DTiDxoaKK7eulZam6YKXAHBK3pfWccFTlnz
	pyY89Pin9L2HGu+uEEOx+t19XA==
X-Google-Smtp-Source: AGHT+IH3XCX1bFhdggGosLrTWDSZbda+DgRtjDOd4Jr02++pIlTQr7eU8vyMgOL14EARFIWEhjY/yg==
X-Received: by 2002:a05:6a00:1886:b0:68f:cc67:e709 with SMTP id x6-20020a056a00188600b0068fcc67e709mr18341051pfh.16.1696194350427;
        Sun, 01 Oct 2023 14:05:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm9552553pgc.80.2023.10.01.14.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 14:05:49 -0700 (PDT)
Date: Sun, 1 Oct 2023 14:05:46 -0700
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
Message-ID: <202310011405.7599BA9@keescook>
References: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>
 <202309301342.5B5BED40A1@keescook>
 <alpine.DEB.2.22.394.2310010945130.3166@hadrien>
 <90E2BBA5-8A2D-42DE-B36A-CD37BABBB433@kernel.org>
 <alpine.DEB.2.22.394.2310012112560.3166@hadrien>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2310012112560.3166@hadrien>

On Sun, Oct 01, 2023 at 09:14:02PM +0200, Julia Lawall wrote:
> Kees,
> 
> You can try the following.

Cool! Yeah, this finds the example:

drivers/comedi/drivers/rti800.c:74: struct comedi_lrange: field at offset 0 is the counter for the flex array
drivers/comedi/drivers/rti800.c:83: struct comedi_lrange: field at offset 0 is the counter for the flex array
drivers/comedi/drivers/rti800.c:92: struct comedi_lrange: field at offset 0 is the counter for the flex array

I'll run it on the whole codebase...

-- 
Kees Cook
