Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB076171C1
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 18:27:15 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-666fb8b1bc8so1797531b3a.1
        for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149635; x=1690741635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BCaYu7xdiD6BYe4W0cxKoMr/LaGK6LhgIOaIA+QBb3Q=;
        b=nWBu4aSpwIzbfoKGCfhgKgbCs6gDjEv/fnSx1CZ7ic42Qqt1/WL8TD+UVwGZETfDwV
         QQjyRZ4dCdNb2q1kRyMCOxZDVEIeJBBXl3s1lSTBfxu9RMPdQBTcm2qwPHx2yOX+FF3f
         SrPrpOqomzg/3qgcVlXGzRn6taGxmQw1uUQZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149635; x=1690741635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCaYu7xdiD6BYe4W0cxKoMr/LaGK6LhgIOaIA+QBb3Q=;
        b=Q4p2PNxmuLUs2Amv7nUySuOhARXEj+xpUivVH8IuYNkXDhsqdaibhfDegCWosZhPf+
         00ppX5AXvQYMBPeSTidGLPcClDUpH+WIIocAFqxTnWFx7YLG/O5pCqqHS0l97jPUlC+9
         0FuqorIbU/g59kPJ8oSm5PfOYXpYdH9cx/EGkT/PabW9JCBqIbrs5yC01ChodAUY87TL
         zNArJXY3r7aQmhMx0o1g4GHS8bJLC6KYgW2oYsO3kCZd9gsOO73PMmvFxWRVtnqxiz07
         hN1jlBdY77rGWOsbMyWSCC+EhQNDjrHKTbrQ+w0UXqXWKLJVE+oEU57tEtAA+2NqUtC+
         HUog==
X-Gm-Message-State: AC+VfDxzw9RlvMmOtsUqpzl7ZXwPidv7tV4kij1ZgKZb7MHy97Gqin0G
	GWjv9CErGSRy9/lQmXIR+3DdpQ==
X-Google-Smtp-Source: ACHHUZ4xu3/wYm9bZWhQyjBCDCie8wDoJAWUFLnjI06jhYBKyFPIxuphb53h3EEDqEvg7aT4BsmD0Q==
X-Received: by 2002:a05:6a20:96c6:b0:11d:4c79:90ee with SMTP id hq6-20020a056a2096c600b0011d4c7990eemr3081600pzc.25.1688149635037;
        Fri, 30 Jun 2023 11:27:15 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u23-20020a62ed17000000b0064d74808738sm10138390pfh.214.2023.06.30.11.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:27:14 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:27:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] riscv: Allow CONFIG_CFI_CLANG to be selected
Message-ID: <202306301127.4EEB06A4@keescook>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-14-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-14-samitolvanen@google.com>

On Thu, Jun 29, 2023 at 11:42:51PM +0000, Sami Tolvanen wrote:
> Select ARCH_SUPPORTS_CFI_CLANG to allow CFI_CLANG to be selected
> on riscv.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
