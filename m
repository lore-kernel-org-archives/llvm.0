Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369905CAC
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 20:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D47C433C9
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 20:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692995987;
	bh=XJFKgDIg8He98yCrYb1AV3cLbEHPt+Vb3mnSreYOibY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I5yBgf/sqyYepdC03Wv79Vv019xhi2jIbrTKfXiOKOCvUGh/MUHQezTcAWHLLE6yj
	 qaWzqbENa7qSH2DcQBZCkVuyvOTtir0maNQvskq/J5Xdxf2R+lcNvVV1msXIVTBNPr
	 0HriScfgM6vNYwdLO0q32JJWE4KuSOsHL6Zb6bnh0PmNZMc5xHQVZzIctPk/8ypqGN
	 ajbi6rG0MfZp3Znry87gcePK3XkhZ46b3izF/U56P1Jc3f8DTrhvXPWqlpxj5o7haL
	 ON02Sv5DA0UrLlOShjvPQ+k65cd4fpyac7lwZGwpFy2Rj7nity3SNV5DBFq2QDyrZM
	 3u9EpFtrpW5Lw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5007f3d3235so2019934e87.2
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 13:39:47 -0700 (PDT)
X-Gm-Message-State: AOJu0YyOH737M3oAhnQjsAHer+vQTDQv9PfCfGlZ2ZK3TDdoYaf7h57u
	WT04y3BLbZnhmagqR1giLtqarzie0c5f7qA1SQA=
X-Google-Smtp-Source: AGHT+IGAH82i+2aRelwSVgwLMyDN2t8G6fNGkLSuAWf/AJR0IfoZFaBtK4gUazRk30qSGYXei53cUiuPlK58JNsAKXU=
X-Received: by 2002:a05:6512:32cf:b0:4fb:821e:2241 with SMTP id
 f15-20020a05651232cf00b004fb821e2241mr15138323lfg.23.1692995985616; Fri, 25
 Aug 2023 13:39:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230825202036.441212-1-yonghong.song@linux.dev>
In-Reply-To: <20230825202036.441212-1-yonghong.song@linux.dev>
From: Song Liu <song@kernel.org>
Date: Fri, 25 Aug 2023 13:39:33 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5SYmD1Rx=9VCG9E8m8CQCcy4x67qo=mX3Y+Ho3tQcHBg@mail.gmail.com>
Message-ID: <CAPhsuW5SYmD1Rx=9VCG9E8m8CQCcy4x67qo=mX3Y+Ho3tQcHBg@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: Change func signature for cleanup_symbol_name()
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Fangrui Song <maskray@google.com>, kernel-team@fb.com, 
	Leizhen <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 1:21=E2=80=AFPM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
> All users of cleanup_symbol_name() do not use the return value.
> So let us change the return value of cleanup_symbol_name() to
> 'void' to reflect its usage pattern.
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Yonghong Song <yonghong.song@linux.dev>

Reviewed-by: Song Liu <song@kernel.org>
