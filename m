Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3252F52;
	Mon, 17 Jul 2023 22:06:26 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b8b4749013so39623735ad.2;
        Mon, 17 Jul 2023 15:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689631585; x=1692223585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A0aSkMLbqhEFS8h89Y97m3Wg87iVlmg9IMH1ozE7q+w=;
        b=PAt4mCjlwI68plM4shnc5qOIASfztjz6zfEE36PQkBKuIZW2uX2iywbAqZLHTH1azK
         dj7rfPvMEser3qUfNycp5Eyat04eS0VZ5BTKi3zRzdE1wSk0+40PxJbFmUxzW7dWMN52
         mdyjm9JseYGh+wsrM+hGHlg5YBHhuzaU+EckGR3LmaFmbG3mpKjfMOZ0NU7K3bm1BF6W
         E1T+uNWJJ4wFlr82lhkg3bl1UCjTg0k4aQzdn9yInHhPmujbKL/MaTik+CxeI0I9EP0k
         7XTGNLKp12c9JeGpUUKA4LyL6YyUdexNvokFQzT3D5WEb87P4ETrmJs6I/0W/+0am2It
         7GSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689631585; x=1692223585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0aSkMLbqhEFS8h89Y97m3Wg87iVlmg9IMH1ozE7q+w=;
        b=QWvA0KP9695pD/cKdjFIExGFs/PLM8TI6DLKLgJsx9Hee74CuRfSPz4txGRiNwBPGp
         ks57A1qZjP8dc//IVyowPJ1UPviYvObiqrY3CkNY77wJCbhiCkveLD5uSPuknT+Vlz/x
         RjufJ6CCZvG/sxX4X/y1liW6ryA86dhPXyUAAA74xXn8YT3NuYDV8w58tfD4AU4LCzh4
         lIE37+22XTrrfMxFwmOh1w/cC9OTs71KvImKAGd+ZA88SQw2YJokJA2bVN27aAD1dKN0
         jvzYMUZ4arTPcguQ0HmFFl8CeJvH8VTr0n5eG+Mp64n8DlrLLTiLmxVRjWG5/4Cs3f6V
         aEQg==
X-Gm-Message-State: ABy/qLbz9RUKqWkaSToAluOtiDzJR1DS7xOylOdwgSk5MYRv27gJBvbh
	newQhE/WAGhnZgUZBt6vU1Q=
X-Google-Smtp-Source: APBJJlFjyMH8cvaHEb3t6vprfhkqU1UNjIvb6QQUX1oy3Jg/sp5qpqI2R8Ho8Lqhq9Mo3qEvH4vaRQ==
X-Received: by 2002:a17:902:e550:b0:1b8:7e53:704 with SMTP id n16-20020a170902e55000b001b87e530704mr15565931plf.27.1689631585524;
        Mon, 17 Jul 2023 15:06:25 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c21500b001b7feed285csm360027pll.36.2023.07.17.15.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 15:06:25 -0700 (PDT)
Date: Mon, 17 Jul 2023 15:06:23 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alexander Lobakin <alexandr.lobakin@intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Tom Rix <trix@redhat.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] lib/bitmap: waive const_eval test as it breaks the build
Message-ID: <ZLW7X04wQ1b9jdHZ@yury-ThinkPad>
References: <20230717195813.29059-1-yury.norov@gmail.com>
 <20230717203105.GA2212488@dev-arch.thelio-3990X>
 <CAKwvOdmUb=JgigcHxOR2trAx+fSxsKu9nNbpAhN1hC8_RBNXeQ@mail.gmail.com>
 <ZLWzLHsGmRxpylxN@yury-ThinkPad>
 <20230717215328.GA18505@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717215328.GA18505@dev-arch.thelio-3990X>

> > > Yury, Nathan,
> > > Thanks for the patches and discussion.  Yes, I think a combo of:
> > > 
> > > 1. Nathan's lib/Makefile change plus
> > > 2. Yury's removal of the current preprocessor guards in lib/test_bitmap.c
> > > 
> > > make most sense.
> > 
> > OK, then I'll send a v2 shortly. Nathan, don't you mind if I add your
> > co-developed-by for this?
> 
> Sure, no worries!
> 
> Co-developed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Done. Just removed external link from Makefile. We've got it in commit
message anyways, so better to not pollute sources.
