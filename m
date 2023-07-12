Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DEE384
	for <llvm@lists.linux.dev>; Wed, 12 Jul 2023 22:40:13 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b9e8e5b12dso729195ad.3
        for <llvm@lists.linux.dev>; Wed, 12 Jul 2023 15:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689201613; x=1691793613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StU3ryhds8B2RWXFKXH9yIswMvNPfFna85+5lQs052k=;
        b=gE/+jswxH5BnMnax9dDPAe7oiW9dZTRVjcv+DvrQThwucqrunr4HUs3M+K3NFaH4nL
         rduk/121iDvivFmP+8mZt/ZpODi/MFXvnKqqwFi6R/hCHU2Gn8gRCqjkouWkkrERTqh1
         zBQ+gATxt+TfjGH9JJlEyTPChy/NNDog//S0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689201613; x=1691793613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StU3ryhds8B2RWXFKXH9yIswMvNPfFna85+5lQs052k=;
        b=hpNG7b23V4yDbz319fRQoljFREGb0BF1f+8L0MzOPUC9CYNim3iTYDjPoB5BK4GmGe
         8+Bexc+h8aKLzhmfmjZxmWjz3Psrhfjqo2eKiogmimG6K++zxz27jZbERoHZ/DpnMZiW
         8YsFFgdF1I4EWglM2KKlevoOX2+epVT40OH6k6d6fGsI5SGAyRihMOO24sElVMuUalxS
         zcLhBANUgwJC+CL5d7nlS36I3Qyp3PsmB+k4rYxo0t4qOJ7kbRmXtRSDfW/dz2pHEO3I
         2BrJ63/PSvx9OqAQTOdX5eoWDZaA5xASutx4lQXcu+8cBgHtLkV+tDQ2vV7xF+Rs63ec
         Wk4A==
X-Gm-Message-State: ABy/qLYzfzyDXhuN16QOYp16hC4nrbiA3Cd0wPdC2hqwiUVjr5ne4Nu6
	VjYHgEriGOoDI7GhMi4HlMXnWw==
X-Google-Smtp-Source: APBJJlHvjSUHXvfV+I5cnsN0bJUDp8cw5wHgM392XQMX0c73J6Fx/lxlHNienjgRxm49fkQ/lME7+g==
X-Received: by 2002:a17:902:bd03:b0:1ae:10b3:61e9 with SMTP id p3-20020a170902bd0300b001ae10b361e9mr17732285pls.65.1689201613269;
        Wed, 12 Jul 2023 15:40:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bj8-20020a170902850800b001993a1fce7bsm4415779plb.196.2023.07.12.15.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:40:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Petr Mladek <pmladek@suse.com>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Yonghong Song <yhs@fb.com>
Cc: Kees Cook <keescook@chromium.org>,
	Fangrui Song <maskray@google.com>,
	kernel-team@fb.com,
	Leizhen <thunder.leizhen@huawei.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] kallsyms: strip LTO-only suffixes from promoted global functions
Date: Wed, 12 Jul 2023 15:40:09 -0700
Message-Id: <168920160691.3781136.7715367614867053724.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628181926.4102448-1-yhs@fb.com>
References: <20230628181926.4102448-1-yhs@fb.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 28 Jun 2023 11:19:26 -0700, Yonghong Song wrote:
> Commit 6eb4bd92c1ce ("kallsyms: strip LTO suffixes from static functions")
> stripped all function/variable suffixes started with '.' regardless
> of whether those suffixes are generated at LTO mode or not. In fact,
> as far as I know, in LTO mode, when a static function/variable is
> promoted to the global scope, '.llvm.<...>' suffix is added.
> 
> The existing mechanism breaks live patch for a LTO kernel even if
> no <symbol>.llvm.<...> symbols are involved. For example, for the following
> kernel symbols:
>   $ grep bpf_verifier_vlog /proc/kallsyms
>   ffffffff81549f60 t bpf_verifier_vlog
>   ffffffff8268b430 d bpf_verifier_vlog._entry
>   ffffffff8282a958 d bpf_verifier_vlog._entry_ptr
>   ffffffff82e12a1f d bpf_verifier_vlog.__already_done
> 'bpf_verifier_vlog' is a static function. '_entry', '_entry_ptr' and
> '__already_done' are static variables used inside 'bpf_verifier_vlog',
> so llvm promotes them to file-level static with prefix 'bpf_verifier_vlog.'.
> Note that the func-level to file-level static function promotion also
> happens without LTO.
> 
> [...]

Applied, thanks!

[1/1] kallsyms: strip LTO-only suffixes from promoted global functions
      https://git.kernel.org/kees/c/8cc32a9bbf29

Best regards,
-- 
Kees Cook

