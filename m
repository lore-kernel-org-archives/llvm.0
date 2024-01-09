Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8A43D975
	for <llvm@lists.linux.dev>; Tue,  9 Jan 2024 19:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ns929DjR"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5f254d1a6daso31134937b3.2
        for <llvm@lists.linux.dev>; Tue, 09 Jan 2024 11:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704829356; x=1705434156; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJNz4LIbNCqWmT96jTcSPLTNmx+8SCupIJghMk4NpfY=;
        b=Ns929DjR78zON2MdW+aFngjBOj8nYljEWBC3Zh75UG1dWz7TdbuNdY2Grz4oBeokfg
         IstXuS8STZHfYuIF5EswkRCQoL+q9DT7O2HfetJfZEorZJKl7ljgUkA3+N9wRYV9di6J
         nexM8laSmLFLU0+URdJOIQdjVO23P+V0dSkzu43/8lJQlQkaoke0RAOkfj5JP2RPRQP9
         Z8iLhBYPpXTblmF2TM7OVm/urKzUh5hkZnzrmny08an/WYuKfvhgIkHQLctaXPsofda5
         y6gKHdifHRQqY4ZLwIXe2zK6Kk8keJGMZvTS+TOKGptxghXaf2dnQu1jvwslGZqnUyU4
         f20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704829356; x=1705434156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJNz4LIbNCqWmT96jTcSPLTNmx+8SCupIJghMk4NpfY=;
        b=NLAIQhMGCAx/KEcdhjvA934wX8+aco92zt2EHvZdCMrred+49rBdsTFySndhJloo30
         RrYjsVVWWqRI9WM8sW0Djb9UEitCmb8vs8rD7TNEo8yMka5hGhmXNHqr0txP9H4gqq5P
         jZWMnQmZ4djNHCYloF/osXprg4iGLlzVjRXXIezBG+jlqPRaC4AloPVxXO5rXITpltI1
         oEPC6MWsUY3j+9bdRK87P/Ubl/aBXpPTy3grUZ+WdpY8yK9EL7j2hmwSekQ8jGOQE3Gm
         3WAIj1a0Z0DPF8UEy2E24ZOjgVNk0uJjPBQn3tOHITgkoQq3cEJXiDUGUsr1DnboJkq0
         xBPA==
X-Gm-Message-State: AOJu0Yxa+e8Vym0Wz7u87593D8BYUaKtXO3MHbzeeNRFglqGqp81hYsX
	vagJiKpCBWLSrZh8QwawPUC+jk2aQrGM8VmFN1M=
X-Google-Smtp-Source: AGHT+IEnjsjlf6q7BBk0JyZkpxLkg/tDZHUnVSv9y5kFt++WeXhKxSWpGd+TwWfnd9LbK5shT3+u3d5PnUGjEldL6LE=
X-Received: by 2002:a0d:ea52:0:b0:5e7:9474:bc7b with SMTP id
 t79-20020a0dea52000000b005e79474bc7bmr11976ywe.11.1704829356117; Tue, 09 Jan
 2024 11:42:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240109133633.1103876-1-senozhatsky@chromium.org> <20240109153249.GA205400@dev-arch.thelio-3990X>
In-Reply-To: <20240109153249.GA205400@dev-arch.thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jan 2024 20:42:24 +0100
Message-ID: <CANiq72kjHCh-inyv1aU=eNca1-+E0_85MGU-8qbZZtzbC_VwOQ@mail.gmail.com>
Subject: Re: [PATCH] Compiler Attributes: counted_by: bump compiler versions
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Kees Cook <keescook@chromium.org>, "Gustavo A . R . Silva" <gustavo@embeddedor.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 4:32=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> It is still possible in theory for this feature to make clang-18, as the
> release/18.x branch is not scheduled to be cut until the fourth Tuesday
> in January, which is two weeks from now. I don't have a good feeling for
> how close that pull request is to being mergeable though, so this is
> fine for now. I assume this won't go to Linus immediately so we would
> have time to change it if necessary.

Yeah, I was wondering about the deadline too. If LLVM's `-rc1` is the
latest time possible to merge it, we can wait the couple weeks (which
are conveniently the merge window) and I apply it afterwards with the
result :)

Cheers,
Miguel
