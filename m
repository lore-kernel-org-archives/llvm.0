Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5791BB58
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 23:45:42 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6887ccba675so303230b3a.3
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 16:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692315942; x=1692920742;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5uC2JcHE9JS0c402i8ZIWy7dsF1n8BGwS1laDcefLsA=;
        b=O+1WPWEnTzQpTY+DGfPtB1ZW78qPJcUhAtsz1fyoeSxwO0YBhezQhhZV4OrVMgoXna
         /8U+/142TfXbfoDOXk7pdGwHMVRtbmkLk5NibSM3+ta3pI4Ip42jHoyuhhc331Pe8Sfa
         KtkJ2TLRvCcTwfLTi3fSl7+HhNc9onncFRl6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692315942; x=1692920742;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uC2JcHE9JS0c402i8ZIWy7dsF1n8BGwS1laDcefLsA=;
        b=djbFCb5A8syUq5lLZkLJhE+GYWKkscs7reJwbEA4tVsI4BYijp2HxO22Fg4P3CPlvF
         au0ETnvd5tR+qys9RAXuEXyrOHyE074C4Dapz+W4XtCP1Rv61XMXUmsiPSW4AJRZ+3kZ
         3v6CXACiwHnoXGmzeuRz8CrApMsF1cwg/yldqdeVaCL1YZJJbE5ciEN7UNGzhqElFio3
         pL/Cy1mkKi0n9z1tLbPYN+VSfpEzByBqjDuuP+dz9lRptHhCpT1iJYrzxjJZ2XkylI13
         HPMPuoem79GFPIXNv2dSo67AoCJJPezJYcbFS0BQKvlS2Yf82SFW4xw75WWUDUIvaco0
         kUqQ==
X-Gm-Message-State: AOJu0YyC3N0zrneU7J+7fmRECz6rNepE+4cQ2OSYIO6qB/V7bc3YlCn0
	eYAdJkVegoxs/KCHx/cDjnKDUA==
X-Google-Smtp-Source: AGHT+IHe89dMi3ZUn4C0h1cSLBafpmTmzM1zOOlc+5Q1brzsHi0/qSgClzIWnusxY0Snmv6vLwisjA==
X-Received: by 2002:a05:6a20:4a28:b0:13d:ea25:9656 with SMTP id fr40-20020a056a204a2800b0013dea259656mr944606pzb.60.1692315941870;
        Thu, 17 Aug 2023 16:45:41 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a20-20020aa78654000000b00689f8dc26c2sm299020pfo.133.2023.08.17.16.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 16:45:41 -0700 (PDT)
Date: Thu, 17 Aug 2023 16:45:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Compiler Attributes: counted_by: Adjust name and
 identifier expansion
Message-ID: <202308171644.156176C@keescook>
References: <20230817200558.never.077-kees@kernel.org>
 <CANiq72=-DL0NV0zJrrzLmK77e6FALSupH4N-i-vfg8WrZdPDcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=-DL0NV0zJrrzLmK77e6FALSupH4N-i-vfg8WrZdPDcQ@mail.gmail.com>

On Fri, Aug 18, 2023 at 12:06:15AM +0200, Miguel Ojeda wrote:
> On Thu, Aug 17, 2023 at 10:06 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > GCC and Clang's current RFCs name this attribute "counted_by", and have
> > moved away from using a string for the member name. Update the kernel's
> > macros to match. Additionally provide a UAPI no-op macro for UAPI structs
> > that will gain annotations.
> >
> > Cc: Miguel Ojeda <ojeda@kernel.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Fixes: dd06e72e68bc ("Compiler Attributes: Add __counted_by macro")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Looks good to me, thanks. Perhaps we should split the UAPI bit into a
> second patch.

I'd like to keep the UAPI part -- that was an oversight when I first
added it.

> I can take it into my tree; otherwise if you need this elsewhere:
> 
>     Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks! It'd be slightly easier for me if it was is my tree, so I'll
grab your Ack. :) Let me know if you'd prefer it otherwise.

-Kees

-- 
Kees Cook
