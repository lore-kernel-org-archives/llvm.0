Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A420419534
	for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 18:33:30 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-25efb821778so2297052a91.3
        for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 11:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687372410; x=1689964410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R2S4gS2xsl31ZVbj5QmbK/bF8pdwruLrQ0Of/mUlG7M=;
        b=hIQg4b6dBFhr8M1cB2wCKdDIS2BqrZFkxpeYC9/r/Fm4/PFRkhINjLnndweKacJ7IP
         V8cig2c3cCv7oAvLssc4iBdvgeuMqkMdvBVCb2TTShovFY5Gf4Mfmm1haAIxoTVhcXAh
         OT5ZmbC2Hz2Fbpo93tqT6X9u8qiANoR9cGeOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687372410; x=1689964410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2S4gS2xsl31ZVbj5QmbK/bF8pdwruLrQ0Of/mUlG7M=;
        b=FhhnvvVmAcQkpreUusOwQNERpFO51N9dyIRNXVKp/lvc3pJ7TRkTYL3yHEBbWkWmvG
         Xn1w14jxFS515tC202/E+Cn8isw0kflMXf7ye9GDjpMHSG5jDV/Sw7CVsT5AtUDl70D7
         XYe0MfTqNIlblzPnXdU/XVN05cKJ70hbqwHLHvksFzE/s9/a3qKrmXHOim40Nc4pa9Ja
         PNxI30qyEAoHBzb0P40RLI/9HdlZir3cAG0/34u7cGcov2Kk1i4f+KK3ls+CpDXWkThL
         OUjvdORHSd8JUUOxO7j9FEhFKN00UjQNQUY+1RqM5WJl2Sy0du7Vqbp6OrOPMES4rYxO
         yb1w==
X-Gm-Message-State: AC+VfDwWWSKEUs/NFPcz8iE1YKMjIo5jaJH0/DrUS9wlrbSMZnjFbfSj
	ezIdTwq36KxZ9e2HO40qSLU3uQ==
X-Google-Smtp-Source: ACHHUZ55HAlLqELh2ztTLy1Zy882zddDnIs2ffNwpxg18Goh1qFJ8fhZuoht6oim3Oz/H9kVw+iajg==
X-Received: by 2002:a17:90a:69a2:b0:25b:f9ce:d8df with SMTP id s31-20020a17090a69a200b0025bf9ced8dfmr13250289pjj.8.1687372409966;
        Wed, 21 Jun 2023 11:33:29 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090ad35200b0025e0bea16eesm3466415pjx.42.2023.06.21.11.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 11:33:29 -0700 (PDT)
Date: Wed, 21 Jun 2023 11:33:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	Krishna Gudipati <kgudipat@brocade.com>,
	James Bottomley <JBottomley@parallels.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] scsi: bfa: fix function pointer type mismatch for
 hcb_qe->cbfn
Message-ID: <202306211133.DD89F45965@keescook>
References: <20230616092233.3229414-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616092233.3229414-1-arnd@kernel.org>

On Fri, Jun 16, 2023 at 11:22:09AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Some callback functions used here take a boolean argument, others
> take a status argument. This breaks KCFI type checking, so clang
> now warns about the function pointer cast:
> 
> drivers/scsi/bfa/bfad_bsg.c:2138:29: error: cast from 'void (*)(void *, enum bfa_status)' to 'bfa_cb_cbfn_t' (aka 'void (*)(void *, enum bfa_boolean)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
> 
> Assuming the code is actually correct here and the callers always match
> the argument types of the callee, rework this to replace the explicit
> cast with a union of the two pointer types. This does not change the
> behavior of the code, so if something is actually broken here, a larger
> rework may be necessary.
> 
> Fixes: 37ea0558b87ab ("[SCSI] bfa: Added support to collect and reset fcport stats")
> Fixes: 3ec4f2c8bff25 ("[SCSI] bfa: Added support to configure QOS and collect stats.")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
