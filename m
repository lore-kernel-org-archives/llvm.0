Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B2428E8
	for <llvm@lists.linux.dev>; Fri, 26 May 2023 18:56:56 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ae3ed1b08eso10857595ad.0
        for <llvm@lists.linux.dev>; Fri, 26 May 2023 11:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685127415; x=1687719415;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DSj23Ygy/LeYNL160hb36OKyVMmbtWslUUZxoLYre8k=;
        b=WV6iS7vdC0UyPONyu3GoVHaX/teq0aAOLnDLc+HEfVRIqo2rwUOqFmyu8lYG+LEDp+
         miDg5XiFHrFiQhKLHYOcDDEXAK8nC1kgJCnPN+6gR8NM0kgXbiHLvy7dSHZo8znmSUpz
         3vOP/Eka5f9wGc0ieRzLs6SstQEZDpzEEhfJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685127415; x=1687719415;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DSj23Ygy/LeYNL160hb36OKyVMmbtWslUUZxoLYre8k=;
        b=fI0py/aIq2IY6cF0hFgot3LhgAsR9SsiKc1TQ18C4U80CG+KzkF2KFlZBcykL3yaCG
         1Q+iLph0F5Kjq//OT7AP17u/3J4/I8gFS+mHkLQvfFGOE39Ua1wwIesne4yOe55UDb2H
         zzCpj1cmya6a7U2JMA6MrR6TwAADVCTvNRmT/iTRp3kPiwwUpUvt033n58nsHPd7m9yK
         u3H3J4sq02WlNWNppQwKCWKZII+gX21qvcw7DRna0Bbz+YoGkG4mbxGq3xK+hYmUBp2m
         M54+lNgsPh14Az7lGxrckEX7Sl9v7j0pM86RI+DwyuZh80YVEWVCDFvJVZmQ65F4yqIV
         V5TQ==
X-Gm-Message-State: AC+VfDyKyqUrXE7/aVrJzEAx4Des2ssTXQu94TNO+qPe9TOu0nMnndd8
	oJRbedoIQIdbuIcMXc+6Cuiy0g==
X-Google-Smtp-Source: ACHHUZ4pa9oCfs3Tr2WIutfaZtF57hm+Ea83Uk/wzE0Jj+t+Z+a87Gy1lY5t1tm19stAI9Hngey7OQ==
X-Received: by 2002:a17:902:e806:b0:1af:d00c:7f04 with SMTP id u6-20020a170902e80600b001afd00c7f04mr4614891plg.12.1685127415577;
        Fri, 26 May 2023 11:56:55 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x1-20020a170902820100b001ac5896e96esm3565658pln.207.2023.05.26.11.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 11:56:55 -0700 (PDT)
Date: Fri, 26 May 2023 11:56:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, qing.zhao@oracle.com, morbo@google.com,
	llvm@lists.linux.dev, trix@redhat.com, linux-kernel@vger.kernel.org,
	nathan@kernel.org, linux-hardening@vger.kernel.org,
	gustavoars@kernel.org, ndesaulniers@google.com
Subject: Re: [PATCH v2] Compiler Attributes: Add __counted_by macro
Message-ID: <202305261156.67CDEE933D@keescook>
References: <20230517190841.gonna.796-kees@kernel.org>
 <168512138720.187005.8346289423859319616.b4-ty@chromium.org>
 <CANiq72=38mdTnJ3cicgwPB2xWqtbnGsL8Rtr4pwq7xGRr-m=Wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=38mdTnJ3cicgwPB2xWqtbnGsL8Rtr4pwq7xGRr-m=Wg@mail.gmail.com>

On Fri, May 26, 2023 at 07:47:03PM +0200, Miguel Ojeda wrote:
> On Fri, May 26, 2023 at 7:16 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > FYI, applied to for-next/hardening:
> >
> > [1/1] Compiler Attributes: Add __counted_by macro
> >       https://git.kernel.org/kees/c/86a76e91cbab
> 
> Sorry, I was going to apply it soon -- in case you want it:
> 
>     Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

> And thanks Nathan for resubmitting the `Reviewed-by` from v1!

Yes, apologies for missing this in my v2 submission!

-- 
Kees Cook
