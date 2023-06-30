Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC299171C1
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 18:27:08 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-53fa455cd94so1202513a12.2
        for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 11:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149628; x=1690741628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5t/XCescOSH3WrNyDablW8O75mx4NM5DVxxt7h12xmA=;
        b=LXTFdVugLTfGdcztpl1w2i9zg6mOiIcldrFYXDwHLgZCmp/TrhXKsJ02A6K+EML7zA
         cQfqy8eoBYrQGKV8bk7qFhFFyMS3PlCs0enpW1ivslO0K0HawB/c7SqpufuZd3aIm6Fb
         71Yk+FVuiiqRdEousZgGpKXlzwT/s9JQh6A1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149628; x=1690741628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t/XCescOSH3WrNyDablW8O75mx4NM5DVxxt7h12xmA=;
        b=fm/h1DxcoA6S9KZ0OxNMz6Bh7RuJKObCkK7TgxBF+ySutQZ9gLn6AIxi1Gnox62AyK
         hnmYSXSAkaYOoIL1LIgZIJvDl7pnQlsH/kN0jdu/Q3K0cBatBVQZa6Q1rdd9FgG0IF26
         4kj0IxPQ1ux2NEZvnKGrVQuNSe95sdFwSIt7kO8cJHus7aPuRKkm3n3i46rnfQ7g9jX/
         G7Kz9WOlKe5iji0qMCJ2GPtvQUE2EyIKFL0xoB/S/6+WZuImVYRj3VKX8DkywpysQnox
         zrsCxpt+Ge09FiHbFUGPGGZcJMh5pg/o+ZUCUJ9zaA+ucQ7C/r3Yo3w4mIQ9oflH6qil
         7uSw==
X-Gm-Message-State: AC+VfDydvyoETd7R/XJ6yv82DqVQOKiQ5yWOpQWT4OqL2MuaNm17Hv1p
	ub7pZuggxiMMPgnteWkdZTJKK5gg765C/lrhUfo=
X-Google-Smtp-Source: ACHHUZ7ErgW8c42xZjlrONwyIDX0fbYZnPFTbXDgs2IWbzVwX2JCviMz9xGbIQ4Z/aYlsMj05YSgdQ==
X-Received: by 2002:a05:6a20:6aa2:b0:10a:ef63:4c33 with SMTP id bi34-20020a056a206aa200b0010aef634c33mr2672145pzb.47.1688149628100;
        Fri, 30 Jun 2023 11:27:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jm15-20020a17090304cf00b001b016313b1dsm11094410plb.86.2023.06.30.11.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:27:07 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:27:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] riscv/purgatory: Disable CFI
Message-ID: <202306301127.9730BE4@keescook>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-13-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-13-samitolvanen@google.com>

On Thu, Jun 29, 2023 at 11:42:50PM +0000, Sami Tolvanen wrote:
> Filter out CC_FLAGS_CFI when CONFIG_CFI_CLANG.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
