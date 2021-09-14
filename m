Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9281B3FC5
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 17:32:20 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id lb1-20020a17090b4a4100b001993f863df2so107828pjb.5
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 10:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lGQPOZkcxJYyUXUleLi9Zwk719LVyNjgeAiv8SMK7EE=;
        b=MCnQbCloxmeH7Hw7Xng3chEP0PXsPdGJFyPolDTBZOFtYBLVl3Y19PN507MI2tw2q4
         fGB9Ma01HNQn24yoOZPO87ldIbLaa1Rahjv0ppulJbCAHGk4dDRVkRkhNNDAJwi6bax+
         VvbG7uXCYofa8AXh/uXKje4EvdUWuqAyA8rOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lGQPOZkcxJYyUXUleLi9Zwk719LVyNjgeAiv8SMK7EE=;
        b=OfcLvqss4I8/elK14qEU3wrVzHm1lbtg6jw0asprKS/8oh27XlGgxIC75x+MNWxXcf
         +Ud3+QiO0e/L0is66gwGDo9IDOgGZ+OxvGmULkz2fsxb0HrAb+0xWB5/dxgUepQyU7zI
         X76mRdbwykG9p6bJYTXfNeDcTrDA852V9DWd6Vd9zB8uEqt0l1lisXN+BoP+duFtvcY9
         rqkxSZRn7LzxqE4gMMmpetshNtzQmMQSD9AN8b7/gtk7d8F2eeXhIRRl9gFIJNP/JFYo
         JpXO/xGOql4Ux+m5GivkWJ4539F2XX/9paNiWQTN6zHmPddJzVQzh9pdYn1hz2d8vItd
         Jbsw==
X-Gm-Message-State: AOAM533G1VcrsgY1WhlSg4ruAWa0OPBWAW57FblPW/B4PsC4rBx3ZiLZ
	0SpmDBJrP15KtycRSCzMXdK9nA==
X-Google-Smtp-Source: ABdhPJy+CJJXqJenCMdB2jSxidWRwjfrmOvpTyDwbr7lf4YslWGbm1jb8PmddKQejVO8HL20rilq1w==
X-Received: by 2002:a17:902:760b:b0:13b:122:5ff0 with SMTP id k11-20020a170902760b00b0013b01225ff0mr15825064pll.22.1631640740042;
        Tue, 14 Sep 2021 10:32:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x22sm10994631pfm.102.2021.09.14.10.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 10:32:19 -0700 (PDT)
Date: Tue, 14 Sep 2021 10:32:18 -0700
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev,
	stable@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 5.10] overflow.h: use new generic division helpers to
 avoid / operator
Message-ID: <202109141031.AEFD06F03F@keescook>
References: <20210913203201.1844253-1-ndesaulniers@google.com>
 <195b2f47-b92e-a00b-a2bc-d91bfdbd9d12@rasmusvillemoes.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <195b2f47-b92e-a00b-a2bc-d91bfdbd9d12@rasmusvillemoes.dk>

On Mon, Sep 13, 2021 at 11:05:02PM +0200, Rasmus Villemoes wrote:
> So, I'd sleep a little better if we got the 64 bit tests commented back
> in in test_overflow.c, and [assuming that the above would actually make
> that file build with gcc 4.9] that patch also backported to 5.10, so we
> had some confidence that the whole house of cards is actually solid.

Yeah, I'm all for that too.

-- 
Kees Cook
