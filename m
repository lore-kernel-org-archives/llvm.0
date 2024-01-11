Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849BB38F
	for <llvm@lists.linux.dev>; Thu, 11 Jan 2024 00:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XMkHkY1W"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cdfbd4e8caso3535742a12.0
        for <llvm@lists.linux.dev>; Wed, 10 Jan 2024 16:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704934018; x=1705538818; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t87NqtyBPvlDEi+zC7NRG9tmb6vZw5mh2mfvHigIApg=;
        b=XMkHkY1W9S4s7OcLQ7JAdXFkWyOoJXM4Be/Mwsde7vzaF7CBh13KOVh/AoXTqN2KMz
         cB3b+S+p0CbHeZm1MevW8fbMNfo1jqnK3R00WisV0bYVxJGCrHFwXjwHqKWIodEls9s8
         YW2hqPOhZT0J5HW5ft3M1EEUKQQPdIqQ6xt+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704934018; x=1705538818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t87NqtyBPvlDEi+zC7NRG9tmb6vZw5mh2mfvHigIApg=;
        b=Z8W/keM4ZmdB0ZoXjvRh2OdrtXwewayzhwU7jGX34LasSoQQttXI44qHWDWFoUNO+a
         TbyXgKO3CswjM2rMrScoat6kO0EZ2tz7u855USrZTC3qaku0hQDCfKScHbMrYhmau3c0
         fm4aDqzZqqtxClWwVqSewhZAQCVHcbn8H5Ge0xipLFd+41ReT102az7Klf+4QiNw3PBM
         NOYtCwt7fbw3wwJ05C3fKI0Bbme1hu8TR6qLtKhfwyC7neGCdjnYUGnLoCzzpvLR2F1q
         wm0pJt5Ze3GKBaWv3hUU14b6HlJfNC3IdcGbhu1ZOu6hRD6O6jqOxBqq7oMZkQ+a+TLi
         QcwQ==
X-Gm-Message-State: AOJu0YzpXefKi/x0jADqNhWghyvE8vsBiqmb6pSh4pTu9zcg18e+ryML
	b5oG0xYk07b+/yuTk2v/G1/Ub/hDqGuI
X-Google-Smtp-Source: AGHT+IElx42r49I/rD/jaQ/XX+0UmK9popst9yB9ZIH+PZO50+ExBJt8eCpRJe1aLP/aJwLheiOXYg==
X-Received: by 2002:a05:6a21:2792:b0:199:a1d4:76dd with SMTP id rn18-20020a056a21279200b00199a1d476ddmr229060pzb.93.1704934017955;
        Wed, 10 Jan 2024 16:46:57 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h18-20020a056a00171200b006d9ac481eccsm4150239pfc.220.2024.01.10.16.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 16:46:56 -0800 (PST)
Date: Wed, 10 Jan 2024 16:46:55 -0800
From: Kees Cook <keescook@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	"Gustavo A . R . Silva" <gustavo@embeddedor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCHv2 2/2] Compiler Attributes: counted_by: fixup clang URL
Message-ID: <202401101646.61CD91B@keescook>
References: <e1c27b64ae7abe2ebe647be11b71cf1bca84f677.1704855495.git.senozhatsky@chromium.org>
 <b7babeb9c5b14af9189f0d6225673e6e9a8f4ad3.1704855496.git.senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7babeb9c5b14af9189f0d6225673e6e9a8f4ad3.1704855496.git.senozhatsky@chromium.org>

On Wed, Jan 10, 2024 at 11:58:18AM +0900, Sergey Senozhatsky wrote:
> The URL in question 404 now, fix it up (and switch to github).
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
