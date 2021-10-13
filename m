Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F14E2C87
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 18:56:35 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id k23so3004556pji.0
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 11:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ye13OmZ3/WQ5cIUtbfVVB0LIxdrNFZJ8JAtfJOn6tSs=;
        b=ggwVdU/nM2n1VDwOUSzbDNh0n6tH68W7Y1MlizZeUdw5vOgv1Knlj+CukpD4B6DXrz
         xHxkyiCsubqCfhQNj5+NbdGOgs2hbfjZCsixQAm4QagFigeRHP/QXKqjs/A+dzDsd+Vl
         EmuIIytJ1MWGb89CZf8jCdbYbefJNpP5QVB4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ye13OmZ3/WQ5cIUtbfVVB0LIxdrNFZJ8JAtfJOn6tSs=;
        b=r9b4+AHtMgLvnDvcEGlNLyscwEACUp6Gg0wdAqEYGcMrgfXyji0GujdVVvj2YEXQKK
         rbIydUupgVFfhU6cKUUGv49g8xtrjnhN/zc2s36TyAkjrpfGclNMzSjcaEfVHEuGZ5FP
         BYZtwkTQcCoMex0oZgvhlSFZarjnhjR4w0NucE3kvXoXN468Y/uIqNE0QeT4MyfRpcFU
         EsCLMK+k7bmQZFTXb4wQqs3+UveAznEWIpeIOt6q/CPEvXnh2An+ptJnyXVBYmcvqjEG
         XCu12Ax4/q1tFCrOvM9luF7P1W1uZq/jK/FK35PsUsyLMUk8O366RySB7A4hM1E94cRP
         0Drg==
X-Gm-Message-State: AOAM532VSF0rkrUgNfTQM7ke8apsGoxCWlPNN4Fo27eG6dn5qMvZBegs
	yaGym6KWKVp/OahGx4txx5lUbg==
X-Google-Smtp-Source: ABdhPJyk4f8iBw/TbgCPI4nSRB9gGx/BtKbfKsMhla90ncq/wBhlkZHwwD0ojZQFgmLLAHQl988/gQ==
X-Received: by 2002:a17:902:6544:b0:13e:dd16:bd5b with SMTP id d4-20020a170902654400b0013edd16bd5bmr856440pln.61.1634151394760;
        Wed, 13 Oct 2021 11:56:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w19sm6949936pjy.9.2021.10.13.11.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:56:34 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:56:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: x86@kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 15/15] x86, build: Allow CONFIG_CFI_CLANG to be
 selected
Message-ID: <202110131156.C52C7F7CC@keescook>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-16-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013181658.1020262-16-samitolvanen@google.com>

On Wed, Oct 13, 2021 at 11:16:58AM -0700, Sami Tolvanen wrote:
> Select ARCH_SUPPORTS_CFI_CLANG to allow CFI to be enabled with
> Clang >= 13.
> 
> Link: https://bugs.llvm.org/show_bug.cgi?id=51588
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
