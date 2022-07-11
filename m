Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA5A4692
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 19:20:31 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so9292631pjl.5
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 12:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NrYdGTk0yKCuMljUwPZ7/uXlafiom1+RNi/pXfEgS+Y=;
        b=avtznRRY4iS1AmoNE+xFYckNON9ycVHYL5nrww0X0/cL24DXv29e4e7u9Ra3AulsGp
         t8nShsS3H0X29qd3p2cDNwKAQ+T1Lc6bZfy2P+sNHEhC773m5LtNMKtdbh7p4XerMl3+
         WxVrB5yDkfmcO8w7XD9Vna5BS8Y7HSlmDtonN0dcDUgaB+8GsyYbXvPaLe8B8Y15QS5F
         4fpAqxlzmXrZeei0rEj/LduqDgjqPXhsTN5zJeQzqMQGXLs0hKXTbbD81UbEHtdDz6zO
         Yvkseu6BtC9cklXVX5PtKZ568HnkGJJ32D9CrRb+kVJVC4mqqqh2dvIHjoJjg9Mvao4Y
         Lvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NrYdGTk0yKCuMljUwPZ7/uXlafiom1+RNi/pXfEgS+Y=;
        b=wZQttkznD7e9FSVPUlU+pQZVZdSXVoUwwyRVneMoW82yBMuGfJkgIKibP6NOjAitB5
         p/g9zGMR5yHfOx6Kqe5TQtPQFE1s1PS8XxLUk8URDSu/ItOUxalWxZfoKFqMvhZzJpso
         p470iVG5d5E8mcSkbsAQcYbv3cyj9o1c86PAmG2Tg1MFUXUeVJi5oDMaGVKTpufhxb9O
         gsZLnFuW5ify3fweERJyb4ptpqQN4qluAPnrvIgoaNfjFFxvjN4DAjxA90U6kaJVuNhl
         DHjwuzWbhYCZEvIE9ygKUWt+BYI72at+ELeIz2jPtUjhwvfjFRFAOfkCtlGHuGq4bd0G
         ijMQ==
X-Gm-Message-State: AJIora+dJ95QOUqnI0vb+1L+T/PCIgK+hFezWtctZhi/B9k3fdmpl6L7
	lEy3TBkr46wk61PgKgZtgfpHSQ==
X-Google-Smtp-Source: AGRyM1t/be+eF6H+YW5M2kcvwqqjrTB3VqZ6D3Mx34zzp6TePEh7gNQILyffnVjxOuTtoikVhDnlfQ==
X-Received: by 2002:a17:902:8f87:b0:16c:2c88:39ec with SMTP id z7-20020a1709028f8700b0016c2c8839ecmr17150281plo.52.1657567231016;
        Mon, 11 Jul 2022 12:20:31 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:a8b3:6eff:f380:e88b])
        by smtp.gmail.com with ESMTPSA id o33-20020a17090a0a2400b001ece32cbec9sm7270672pjo.24.2022.07.11.12.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 12:20:29 -0700 (PDT)
Date: Mon, 11 Jul 2022 12:20:22 -0700
From: Sami Tolvanen <samitolvanen@google.com>
To: Haibo Li <haibo.li@mediatek.com>
Cc: xiaoming.yu@mediatek.com, Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Aaron Tomlin <atomlin@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 0/2] cfi: free old cfi shadow asynchronously
Message-ID: <Ysx39t+I56lDGe4i@google.com>
References: <20220704014046.34596-1-haibo.li@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704014046.34596-1-haibo.li@mediatek.com>

On Mon, Jul 04, 2022 at 09:40:44AM +0800, Haibo Li wrote:
> This patchset changes synchronize_rcu to call_rcu in update_shadow.
> 
> Patch 1 enables the CFI sanitization for cfi.c and 
> bypass __cfi_slowpath_diag.
> It is the prerequisite for using call_rcu in cfi.c.
> 
> Patch 2 changes synchronize_rcu to call_rcu and
> free old cfi shadow in rcu cb
> 
> Changes in v2:
>  - Remove _run_cfi_check,add __nocfi to __cfi_slowpath_diag directly
>  - Rename _cfi_shadow_free_rcu to free_shadow
> 
> Haibo Li (2):
>   cfi: enable sanitize for cfi.c
>   cfi: free old cfi shadow asynchronously
> 
>  kernel/Makefile |  3 ---
>  kernel/cfi.c    | 14 +++++++++++---
>  2 files changed, 11 insertions(+), 6 deletions(-)

Thanks for sending v2! For the series:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
