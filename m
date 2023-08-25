Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC84E322B
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 19:57:38 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6bdcbde9676so992213a34.3
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692993458; x=1693598258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mePwIFaicKFWsl6ibRudilBKZz+qKLFtCl5QafnyfWE=;
        b=X9ikIgs6RjTlbJDKiB37yRFNG90brOxIV7BD2AkrdkoWCZx/bWil1UGbmt9SRwZfa8
         TMKptnjuwFVJDkdvfKxWIgjjOtRX9gZ4XY1t7wDe1mpnI038hrX4DiJ6FgRpZHVITc8r
         DOhazlR+aS//Atabz7/FyZXdTsug6kQbWZnmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692993458; x=1693598258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mePwIFaicKFWsl6ibRudilBKZz+qKLFtCl5QafnyfWE=;
        b=BZvHQDnys+eA2/c8QE6xy+t8uF9J/EgLulqbRP7IjRVnduPgYMROhz+TmvVV8Dgsog
         vBiOXhzXLIkM43zVN3U+8zGf3XxQsGyysRefDBchbFNjxZJNhSwQ3hy+b2puXx66XE8U
         wWfcpRXT/YqYI8FQz9UoPyAmb+TKE3Kvodcpg+w8z1DUmSL1YyJ2GnLe/I5VTjNE1fsV
         G57/U5u/Pp9ZYRvy/hrMQmSc+ZcsE+R5dMv219BUrkn8nflekCyuRyKLlAW3+u39YVTl
         GW3gZ7PT0xiFgs8DLAfwxZlZb3/U4H3RiEkBOcFeoYJ3gSSjP7o50uiDz+O6OMSl2UIi
         xwuA==
X-Gm-Message-State: AOJu0Yz1OX1Sh6RMp0gYvAV2BnL9fInYocjs2BIRuOhP0TimTdKwTDzz
	MJpa3BbsMogtILyBZud+3ryeMg==
X-Google-Smtp-Source: AGHT+IF2AmrIyOFdCtOu4lQqcqRfSYEn1ZKqp0rLeQq0ItsLA/CXd+FEC9Mnkl/pTNeWDOnDWHrKuQ==
X-Received: by 2002:a05:6830:12d8:b0:6b9:8357:6150 with SMTP id a24-20020a05683012d800b006b983576150mr6460451otq.35.1692993457958;
        Fri, 25 Aug 2023 12:57:37 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o6-20020a63a806000000b0056368adf5e2sm2047172pgf.87.2023.08.25.12.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 12:57:37 -0700 (PDT)
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
	llvm@lists.linux.dev,
	kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] kallsyms: Fix kallsyms_selftest failure
Date: Fri, 25 Aug 2023 12:57:32 -0700
Message-Id: <169299344984.855265.133054189640822333.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825034659.1037627-1-yonghong.song@linux.dev>
References: <20230825034659.1037627-1-yonghong.song@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 24 Aug 2023 20:46:59 -0700, Yonghong Song wrote:
> Kernel test robot reported a kallsyms_test failure when clang lto is
> enabled (thin or full) and CONFIG_KALLSYMS_SELFTEST is also enabled.
> I can reproduce in my local environment with the following error message
> with thin lto:
>   [    1.877897] kallsyms_selftest: Test for 1750th symbol failed: (tsc_cs_mark_unstable) addr=ffffffff81038090
>   [    1.877901] kallsyms_selftest: abort
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] kallsyms: Fix kallsyms_selftest failure
      https://git.kernel.org/kees/c/33f0467fe069

Take care,

-- 
Kees Cook

