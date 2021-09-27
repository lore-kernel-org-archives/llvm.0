Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527F43FCC
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 16:21:56 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id g14so16371231pfm.1
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zE0WK5KeeYoSEMUqx2JoFV8T7/T0HCpAa3xAp2o0SGE=;
        b=Ovom/58nDytk/sPQ4xnYffxyhIaOb1dbAY5kNn0OlX7f/06z78wegirQ1Oy2+R1P1w
         Xj9FAzi4KvGTTxb5QyC2qxYmG6V1WaLa+lEvZj+6cMzJSbtvR+WOD/opdnsqcXTR6K8U
         +JHFoVFk3ZjltKlbBVfm64cDMnj9JRXIJggss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zE0WK5KeeYoSEMUqx2JoFV8T7/T0HCpAa3xAp2o0SGE=;
        b=8IwDxwPvsmCMYxL07wrFSOfGup9Ap/WEEJfKU3PvU1H8S3Xn5An90fNmeEAAIpCixk
         EgY/RSINgxlA+pSIKqSFStfLAjwrV7uf5mgdeHVbtweDa4y0x5+SlD0bASyRaNirfelX
         t0V1dYGOsj+0BHOYoIinVed1HaKjlWbW0kKFrnxr9QNWVluCBcunccNAb34e1A/YKv6D
         r/oji1oFwZThtng66nBvmarsBBnV4GIPQsBX8ipv8kTnm7f0JVjVt6TJj5rKCQidQjQS
         r97GvZh1f4PMDDcJNdz1REdm45X4rxAFJyinAQkbBHKotycMEHKUOariceINCZMr/2r7
         Ya1g==
X-Gm-Message-State: AOAM530nzYkM5ZgtarMVIhfKDWmMIUyfc6UqldoTF5IwXxwIAT7z9kir
	RSndCdsel9vUEtRRseQDmF6pEA==
X-Google-Smtp-Source: ABdhPJw7E9n4w5w/LlRosUapgP1QwTF6PBj/DsSkOkj67gRHp+kn+vwPHZEHDh5oITAyBUsfezVI4g==
X-Received: by 2002:a62:641:0:b0:44b:74bb:294c with SMTP id 62-20020a620641000000b0044b74bb294cmr557046pfg.12.1632759715779;
        Mon, 27 Sep 2021 09:21:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w5sm18341171pgp.79.2021.09.27.09.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 09:21:55 -0700 (PDT)
Date: Mon, 27 Sep 2021 09:21:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sergey Shtylyov <s.shtylyov@omprussia.ru>,
	Sami Tolvanen <samitolvanen@google.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] module: fix clang CFI with MODULE_UNLOAD=n
Message-ID: <202109270921.F0A304C@keescook>
References: <20210927121541.939745-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927121541.939745-1-arnd@kernel.org>

On Mon, Sep 27, 2021 at 02:15:10PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_MODULE_UNLOAD is disabled, the module->exit member
> is not defined, causing a build failure:
> 
> kernel/module.c:4493:8: error: no member named 'exit' in 'struct module'
>                 mod->exit = *exit;
> 
> add an #ifdef block around this.
> 
> Fixes: cf68fffb66d6 ("add support for Clang CFI")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Nice catch; thanks! (Not a lot of config build that way it seems...)

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
