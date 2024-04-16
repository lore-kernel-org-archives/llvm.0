Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC151C10
	for <llvm@lists.linux.dev>; Tue, 16 Apr 2024 00:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713228390; cv=none; b=nL4ajnaoPksr+TRu1r4+R+ZuMRR1BSSiog7R8mMNaUXWXtOTgFbo1NsnbVmyITydWIlT8NckshNWtPJ+b1Thwy/LHJ5ahI4heRNgmhLtHe/w1C17nTdObwRur6zoXwh7opOwMtrp03//Wrc5nwL+FO9SuV4vJg4ZOPMPKuCFx9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713228390; c=relaxed/simple;
	bh=015eEwhLzWafHkc0BsCRogWYfs3SqoEKVTXAAy/Fhf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdNGnz3UmRxvRuENG+s+z0IyOF/D62rxjB4waLI82LF70e+RJW5PBzOH0FuaXlnrycGUVT6/XiMsxGd1BWNZrZi2IH74eUNXjx/fubki0RufCfA0w4aq6wNd/coAGjFfDEk+VmyOJLmLczeHyj0nlNCgEgGBF/fMX4Vmm81EAn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EqrA2q42; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EqrA2q42"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e51398cc4eso36781685ad.2
        for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 17:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713228388; x=1713833188; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SarbV9gzd7Ext5uREk+cO+VjFEa4L7Rs/CELnpCJsv8=;
        b=EqrA2q42hASulL2nno3yc0Dax0iqhov9zGbjSYmEpN8Zwq4jBvtz2wB8QLZo3W/7fk
         W+zJTQ3833vaMwZZCd1wduILN86uMJkJeLRe4VowWXd9bd2ejygCDlHVrWZuGUGc3fxB
         cOpO7UH5pzUt8oQS99eh8M7BywwKpOBEYoDaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713228388; x=1713833188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SarbV9gzd7Ext5uREk+cO+VjFEa4L7Rs/CELnpCJsv8=;
        b=CRe7YF1CzywYYjVAYCFpCD2OcYNVcHNmfMkRxIEANA7ZvecFf680c5FIlUlOcSDg7W
         TmFTgD3Dglh8bxLv7qVzwIJeX6AGDd2hXt+MaviL4JKoU4ni5pQXG+88GNJB6ke/n9OX
         FHKPr5gpAj5isdaJNc48avcPMOyYb5HPnZ70pqIQNOhGF0pjf3BjWvAT16C8IjM6eIE3
         WLh68T0bZOTJ+wkKuuHu3DVO1lKwNfrc+n8ta1kM+ILsvpxsfmlKkbKodU8uq1Z0S0vf
         G4sUmikDKTeZMKk3Gjw1Zrt5tYSryP4UYvl+PGUyXhbBOH5twDg5jF42BWyUCIGDVLYr
         YnXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxZEnlf/eHRA2meklcrG9Z0vbsXKvhorY+gALE9G+NqJkRFhZ2iITBtj/0tNymimL9KJXA20pqGB4X1CbIXn7WZsawSw==
X-Gm-Message-State: AOJu0YyCWAxBuEh+jKO71EyaUswWCW6MEWHHUmEBA0qrqdSuveUUjhc0
	SgvBW/6XsCKKf4dniZiV1lrH9aJjpTlPxQ9JgbQBZInV8LeDU8XZwR8rWP+ddQ==
X-Google-Smtp-Source: AGHT+IHX1mELGRta6OeQsH8t8lp3e5H1mp/8L3cNAf/ZlRUnfUwX1Jl3r6/rRS9SAEK7dC+5kIawkw==
X-Received: by 2002:a17:902:82c4:b0:1e4:b4f5:5cfa with SMTP id u4-20020a17090282c400b001e4b4f55cfamr11411241plz.27.1713228388653;
        Mon, 15 Apr 2024 17:46:28 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001e3d2314f4bsm8688355plb.132.2024.04.15.17.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 17:46:28 -0700 (PDT)
Date: Mon, 15 Apr 2024 17:46:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marco Elver <elver@google.com>, Justin Stitt <justinstitt@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] ubsan: Add awareness of signed integer overflow traps
Message-ID: <202404151738.AC6F6C210@keescook>
References: <20240415182832.work.932-kees@kernel.org>
 <20240415183454.GB1011455@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415183454.GB1011455@dev-arch.thelio-3990X>

On Mon, Apr 15, 2024 at 11:34:54AM -0700, Nathan Chancellor wrote:
> On Mon, Apr 15, 2024 at 11:28:35AM -0700, Kees Cook wrote:
> > On arm64, UBSAN traps can be decoded from the trap instruction. Add the
> > add, sub, and mul overflow trap codes now that CONFIG_UBSAN_SIGNED_WRAP
> > exists. Seen under clang 19:
> > 
> >   Internal error: UBSAN: unrecognized failure code: 00000000f2005515 [#1] PREEMPT SMP
> > 
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Closes: https://lore.kernel.org/lkml/20240411-fix-ubsan-in-hardening-config-v1-0-e0177c80ffaa@kernel.org
> > Fixes: 557f8c582a9b ("ubsan: Reintroduce signed overflow sanitizer")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> As I mentioned, CONFIG_UBSAN_SIGNED_INTEGER_WRAP needs to be
> CONFIG_UBSAN_SIGNED_WRAP. I applied this change with that fix up and the

Whoops; thanks!

> warning now becomes:
> 
>   Internal error: UBSAN: integer subtraction overflow: 00000000f2005515 [#1] PREEMPT SMP

Perfecto. :)

> So:
> 
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

-- 
Kees Cook
