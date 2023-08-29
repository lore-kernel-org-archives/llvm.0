Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC64D18013
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 18:48:47 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c0db66af1bso25320175ad.2
        for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 11:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693334927; x=1693939727;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WlpFwu22BuXcdAslyPLnhdHAaPNdS1lUhQ/bzoXJHU0=;
        b=KjzHMEZS1fi+BT9hdiRi+W2XW02HxQYoYIckKHIXt6urLwJwvMF1uKUCljUVryZ3Iu
         cf8z584cgA8JVHL+So+nlfKCTisXkUFWAXt842plGp40TLCpDNlBtnqfeg6ZNxNNCCkW
         grXX0rANGAXeDphxdobpmuEsJZhMU093xuD3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693334927; x=1693939727;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlpFwu22BuXcdAslyPLnhdHAaPNdS1lUhQ/bzoXJHU0=;
        b=CEKhuimp1+I+YQ3hk6XzgLKBPklHTlnbbDE//Raz8IrrGBlTIlSu4DO3bMExrQDbKl
         1l38/y9OZFyI9McL5fq1469Lz5AyVdtvMvuaT1j1crClQ4L1k6rZuU63bTGkpJ6QbyGW
         7Bvoe1QYnmnazKp09r5IylePIHYwaxq0YqPrm16QRIyjTo324NpCqP2TtcKkDJjJB0qC
         Gmr2AEYwfZzlBr9sLQa5UV0kQ6s0Oo+kVjh29wj1O0e0GAOTXkCf0eMEJ5Zcer512LWo
         ero7b0uJ2z8YA38JOUrWetFaz4+9JHraCvGz0TOBwON4Gy9/n6NRO0WJxmonaWWEMWhE
         BQBQ==
X-Gm-Message-State: AOJu0Yx3PK0/rJHlXAgXB2lsgGkAAYYruiVKoznZCjBa23z/d6o+uW4g
	ggoJm03yXoPIj1Is/5f+Muv2oA==
X-Google-Smtp-Source: AGHT+IG6Sdl5CBNfsQf6qLGj2msuoi5Z+xNqTfNTxcW4FtLo4dCGfrPkxFnX0y+F/LV9qNNxHbnxKw==
X-Received: by 2002:a17:903:1212:b0:1bd:b8c0:b58f with SMTP id l18-20020a170903121200b001bdb8c0b58fmr29470329plh.50.1693334927083;
        Tue, 29 Aug 2023 11:48:47 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902748600b001b2069072ccsm9708751pll.18.2023.08.29.11.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 11:48:46 -0700 (PDT)
Date: Tue, 29 Aug 2023 11:48:45 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Hannes Reinecke <hare@kernel.org>
Subject: Re: [PATCH 0/2] scsi: fix 2 cases of -Wfortify-source
Message-ID: <202308291147.2CB91AB9@keescook>
References: <20230828-scsi_fortify-v1-0-8dde624a3b2c@google.com>
 <CAKwvOdmaeupeLgJWjMD4iJ1pi9NFTN-MTp3uC0jDVp2T2+Ctxw@mail.gmail.com>
 <CAKwvOdmpSmWGUA-SHJ9PofayfxFc--MJuxgQ0cU8bnDB6c=wag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmpSmWGUA-SHJ9PofayfxFc--MJuxgQ0cU8bnDB6c=wag@mail.gmail.com>

On Tue, Aug 29, 2023 at 09:33:55AM -0700, Nick Desaulniers wrote:
> On Mon, Aug 28, 2023 at 4:41 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Mon, Aug 28, 2023 at 3:25 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > clang-18 has improved its support for detecting operations that will
> > > truncate values at runtime via -wfortify-source resulting in two new
> >
> > ^ -Wfortify-source
> >
> > > warnings (or errors with CONFIG_WERROR=y):
> > >
> > >   drivers/scsi/myrb.c:1906:10: warning: 'snprintf' will always be
> > >   truncated; specified size is 32, but format string expands to at least
> > >   34 [-Wfortify-source]
> > >
> > >   drivers/scsi/myrs.c:1089:10: warning: 'snprintf' will always be
> > >   truncated; specified size is 32, but format string expands to at least
> > >   34 [-Wfortify-source]

These should just use sysfs_emit() instead. Then all the bounds checking
against the PAGE_SIZE buffer gets done correctly, etc.

-- 
Kees Cook
