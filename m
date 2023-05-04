Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15107E7
	for <llvm@lists.linux.dev>; Thu,  4 May 2023 18:19:38 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5144a9c11c7so705910a12.2
        for <llvm@lists.linux.dev>; Thu, 04 May 2023 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683224378; x=1685816378;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kCiTzOmyWHWq8qYHC8k2z/0RZLeYJjOcNKGNfJf663E=;
        b=GZ4UTzeA5rPV9XwB0E1CnGOx5YglTClFyMz9hTyJvxzHxOUfzql1rg3P19Zj9CpvwX
         9slRCElaX7svCTzj0N44LiXURLmmYmIZHvu2PYxX1mOKPmzzW9Ugiacs1CtyHY0zrrZL
         +M+quAB/x/miiUwqRQ5et/eMgXWjkqZTgPqeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683224378; x=1685816378;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCiTzOmyWHWq8qYHC8k2z/0RZLeYJjOcNKGNfJf663E=;
        b=XAaOd95TMbYtYFqLTVxTHVSif1+3iajgvbXdjrIIlzqMH9rHeG3yjZz6HuzN7VL1hI
         jQ2If1qEi/B3CBqmBlL8dCzX5SmXuHKWb/KeccCRjEnJGGrfHuP4CfJz25dppp5mlox7
         1jwXTg7EtmgJI8q3jRUb1a0How6OoQ0quDWBI6QyP9J0b3iQWgML18diLZB9zzS8fyxe
         vS5gZOEPRItFNi+IsqH9B3PYdqPo7XtDzCRX0qLRXg1zR/diY/7EicUsvjwVx8E9vL1L
         NWjRmD7ugRo4zR0IyDlvC1owwzwH1ZxREEUPTiS905lW6jA5SNzLUihEYZkgcLuAWrS/
         plRg==
X-Gm-Message-State: AC+VfDxHG6xZ2NbGu9RY6QiMLjqtPAt3OOD3waVBvsyptq69OxCqS62b
	WF/2i5eRUfuorf6LPLnihwC1Rg==
X-Google-Smtp-Source: ACHHUZ4IHamXVdmQ6HeS+sI01dLo9Gpa93g9AR/NYoqliF6h0f68F02DqZTKm2CJ9gX7zwc2h8nbkA==
X-Received: by 2002:a17:903:32c9:b0:1a6:8ed5:428a with SMTP id i9-20020a17090332c900b001a68ed5428amr5715553plr.22.1683224378276;
        Thu, 04 May 2023 11:19:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bx15-20020a17090af48f00b00246f9725ffcsm11448930pjb.33.2023.05.04.11.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 11:19:37 -0700 (PDT)
Message-ID: <6453f739.170a0220.62695.7785@mx.google.com>
X-Google-Original-Message-ID: <202305041118.@keescook>
Date: Thu, 4 May 2023 11:19:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Qing Zhao <qing.zhao@oracle.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Compiler Attributes: Add __counted_by macro
References: <20230504181636.never.222-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504181636.never.222-kees@kernel.org>

On Thu, May 04, 2023 at 11:16:40AM -0700, Kees Cook wrote:
> In an effort to annotate all flexible array members with their run-time
> size information, the "element_count" attribute is being introduced by
> Clang[1] and GCC[2] in future releases. This annotation will provide
> the CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE features the ability
> to perform run-time bounds checking on otherwise unknown-size flexible
> arrays.
> 
> Even though the attribute is under development, we can start the
> annotation process in the kernel. This requires defining a macro for

And FWIW, I've done a first-pass at this annotation with Coccinelle. There
are plenty more to do:

https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=devel/counted_by&id=adc5b3cb48a049563dc673f348eab7b6beba8a9b

155 files changed, 158 insertions, 158 deletions

-- 
Kees Cook
