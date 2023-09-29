Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1987E6588D
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:21:16 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-690bfd4f3ebso11543836b3a.3
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015276; x=1696620076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dtIBcP4y5aTwl3+nqmFPHxKsnqtE7UwX9ZEYMXGnyg=;
        b=GOz56Nk6G2mhYpTKkPnNvaJZ5twusVFRmZAsFShEL0qznw0rm1Ojl8oGEKbDHq1Pff
         GaWsKYSoqNvTJF2drLt/SwNx3wb15Khqu1wtyLOE5xZKMJ17LxBqecaAPAal1HQ5sFzM
         5aIAoOmWkVBhUUdQWrhmCDrT0M9ivD0YRsLUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015276; x=1696620076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dtIBcP4y5aTwl3+nqmFPHxKsnqtE7UwX9ZEYMXGnyg=;
        b=uMlRS+uhfvivcklaeVvY5wmCYccU/HE6lGlyB96l0erpEjXr6pGk+TvqV+vO5K/LD8
         pEH59XVJll20kZyBVduhj+m21gCRMUftu8Pcn7e8Hoz4LkVaQuIAN1ELwIo5A4xv5o16
         25Y29CMd1R7+SFLlJUSDeeGSjGQO7Iw6LtQnqvd6/kjV+0XpQ1vju63+jWPardmEg4IE
         GBUxYiKbN0p+blZaYDp+mYyEcJprbzMUtinEerKid6nJUxZddqE2NI/hGmKqF52drwDr
         JlojL6u6LolDBxd8xGa1eaa6PNjrW7hoJTRauIi+nq6ydR20kTwQLc+qrj8kp2DvQ8ej
         tPWQ==
X-Gm-Message-State: AOJu0YzOUN4Ml2jYktJhT+S85je0gpNO55J/KWl2gM+Fdbn3lrRj7Dwm
	gnjkDCpk9PiuQ1/AMwS5woyn5pc7bKwmPDK4Zwo=
X-Google-Smtp-Source: AGHT+IGUGV/4POMYK1/va54VqFpcD4baV6lyhqjawMMWWCnzsphh24Cw/Lf7ot61TO/bBKwMRN8+vg==
X-Received: by 2002:a05:6a20:3247:b0:154:c959:f157 with SMTP id hm7-20020a056a20324700b00154c959f157mr4646963pzc.30.1696015276309;
        Fri, 29 Sep 2023 12:21:16 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a16-20020aa78650000000b006862b2a6b0dsm15959308pfo.15.2023.09.29.12.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:21:13 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alasdair Kergon <agk@redhat.com>,
	Kees Cook <keescook@chromium.org>
Cc: Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] dm crypt: Annotate struct crypt_config with __counted_by
Date: Fri, 29 Sep 2023 12:21:06 -0700
Message-Id: <169601526974.3013632.10898812764774808611.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915200344.never.272-kees@kernel.org>
References: <20230915200344.never.272-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:03:45 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct crypt_config.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] dm crypt: Annotate struct crypt_config with __counted_by
      https://git.kernel.org/kees/c/6797f1750c3c

Take care,

-- 
Kees Cook

