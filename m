Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744FE193B2
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 22:02:51 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68a3082c771so1012736b3a.0
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 15:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693000970; x=1693605770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8sxkfkNcDH+wFlFnMtVGrz62yixCGCGYoyhNiXjDks=;
        b=h73a6BdP5hC/NqXKwgNtxZ0ubyM33hSEmLZj/0M/2wvcGKL/pUFy6QQohX2ri1WGhW
         pg6b1sANdFoyI37/JwBk/OZPWXaVGgD6L/Vb90HSJWIlpoMjG13DypVq0/G2X/SGM353
         lRc9ByR0MOyTDsFYfYDK1l7/nzB9YHZcRw9Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693000970; x=1693605770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8sxkfkNcDH+wFlFnMtVGrz62yixCGCGYoyhNiXjDks=;
        b=QgtYa7zeu+gJJDqzWRKDOh4dQBbpKwdLbzOASKErB9yxPGUuAJA1bJeteUHAbPq/37
         e3Dwoo64JVQQKpQIfDX5oWd+lmMFR5oapjlNzRhQvvKeW1cgWpyR3+YhGov+9t0bn1M8
         8duvbr5Zi2fsLh0HoL1suoNHx3XMhXlLvHZsRBVdcZRkIogg+oRJsrBPWe+wXAl28LgD
         rrbynk9rQajsySEyPI8U2mZACUR+1VCvAUw7bnVGIA+gd19I9WN745nCR9XA1psUvWiU
         ICSnHDsvj2tc+D1pz0sHJ/2wDo6S56o/59/d/6M6LDKTsdxl6dnLqOa9Nwd+zCizA2sG
         Ow9g==
X-Gm-Message-State: AOJu0Yz6qw7BOgMJw9jF43QFwxWIErSC8B3Pj1zt/2SYb9TmuUzUXzil
	hT7AZRks2tHukxGz+XsCaIBUfg==
X-Google-Smtp-Source: AGHT+IFMVu8jqfZIV7WjrQfMJho3P8PW/9yNoHnzP85DTUpWN/wAksLtv+0nRiTvNaZ1CvCaYUqnFw==
X-Received: by 2002:a05:6a00:14cf:b0:68a:5e3c:79e0 with SMTP id w15-20020a056a0014cf00b0068a5e3c79e0mr26838586pfu.4.1693000970558;
        Fri, 25 Aug 2023 15:02:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u4-20020aa78484000000b00660d80087a8sm2027494pfn.187.2023.08.25.15.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:02:49 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Petr Mladek <pmladek@suse.com>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Yonghong Song <yonghong.song@linux.dev>
Cc: Kees Cook <keescook@chromium.org>,
	Fangrui Song <maskray@google.com>,
	kernel-team@fb.com,
	Leizhen <thunder.leizhen@huawei.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] kallsyms: Change func signature for cleanup_symbol_name()
Date: Fri, 25 Aug 2023 15:02:41 -0700
Message-Id: <169300095959.944583.10380141849424753586.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825202036.441212-1-yonghong.song@linux.dev>
References: <20230825202036.441212-1-yonghong.song@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 25 Aug 2023 13:20:36 -0700, Yonghong Song wrote:
> All users of cleanup_symbol_name() do not use the return value.
> So let us change the return value of cleanup_symbol_name() to
> 'void' to reflect its usage pattern.
> 
> 

Applied to for-next/hardening, thanks!

[1/1] kallsyms: Change func signature for cleanup_symbol_name()
      https://git.kernel.org/kees/c/76903a964874

Take care,

-- 
Kees Cook

