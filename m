Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDFC4C72
	for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 17:30:56 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id f193so16904803pgc.0
        for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 10:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BFRWd7vrrVi87eI0lxP0gM69HCWszoFdIqs2so5GqDM=;
        b=PLA2JsXSqysIna9tFsBBdRao1dBwSMRZlrn2O4ICeRbBe5gsyCf5q5bEFsXF9vUtDX
         TXaCAoVe7QSjqWw121MB5fezIxVesfDN6kE6K2l9eCB6P2R3rsBFsysJJ6uhkRiwxJKQ
         NO7mHzl2sjp2PXwq4CHkGWD8d8/TFlfObI96g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFRWd7vrrVi87eI0lxP0gM69HCWszoFdIqs2so5GqDM=;
        b=muinZfniaWeTC7q8xmwUvhawtuy0f3C7ltFkXZeNUoALERERIB2TPpAtXr8Imrk16J
         YUQ8VrhQTv4BgQVT94jiQH2+bcCkOzmZga3oCXDwbFKxznkqtZwUop0it770w+zellb7
         URKOxJqxDm97iwjnQmTNx7o3mfWrA6ZVw4GkSlPLmTFzhIq1ljGwx838Iqc714FlMeVI
         JXFvf8BvqLxnHDEJFnWsU9siilb7zZPtnwhsLuykoP27dUgnsWnNG4y9t+XbWXH98jRa
         v0OzPX/VNyoIKIBquV0adex4iXnfZTV2JNpKsAErRvOREteW0c8XRyq/49KaLsxpttl3
         5gMg==
X-Gm-Message-State: ACrzQf1/oFAF/OAUtVZFydZwNPdPOWd4XRvzhgTbDd3roK/LaaZHMCoM
	YZB6aI9BOCD+njyvuiW0ezSZJQ==
X-Google-Smtp-Source: AMsMyM4gAkNhkfp5Wn6ILtVnqTHzHGxHn7Atp68r74eXi9ayCN2sLc++Ufsg28bF8QWE6YPcIHPnIQ==
X-Received: by 2002:a63:4a41:0:b0:452:bab5:156a with SMTP id j1-20020a634a41000000b00452bab5156amr8132651pgl.486.1666200655754;
        Wed, 19 Oct 2022 10:30:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d48300b00178b6ccc8a0sm11073833plg.51.2022.10.19.10.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 10:30:55 -0700 (PDT)
Date: Wed, 19 Oct 2022 10:30:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: Re: -Wmacro-redefined in include/linux/fortify-string.h
Message-ID: <202210191030.EC5C138E@keescook>
References: <Y1AZr01X1wvg5Klu@dev-arch.thelio-3990X>
 <CAG_fn=WYnfNHC3S1S=mCTKTnzL=UuH7Oz4W3HjsTXEQUtjrxtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG_fn=WYnfNHC3S1S=mCTKTnzL=UuH7Oz4W3HjsTXEQUtjrxtw@mail.gmail.com>

On Wed, Oct 19, 2022 at 09:48:27AM -0700, Alexander Potapenko wrote:
> On Wed, Oct 19, 2022 at 8:37 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi all,
> >
> > I am seeing the following set of warnings when building an x86_64
> > configuration that has CONFIG_FORTIFY_SOURCE=y and CONFIG_KMSAN=y:
> 
> I was also looking into this issue recently, because people start
> running into it: https://github.com/google/kmsan/issues/89
> 
> I have a solution that redefines __underlying_memXXX to __msan_memXXX
> under __SANITIZE_MEMORY__ in fortify-string.h and skips `#define
> memXXX __msan_memXXX` in string_64.h, making KMSAN kinda work with
> FORTIFY_SOURCE.

Oh good!

> Dunno if that's necessary though: KMSAN is a debugging tool anyway,
> and supporting it in fortify-string.h sounds excessive.

I'd much prefer letting them still work together.

-- 
Kees Cook
