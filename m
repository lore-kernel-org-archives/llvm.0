Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45FC8C16
	for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 16:32:42 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b512309d18so4809485ad.3
        for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 09:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687537962; x=1690129962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/ctcywp7aSY6bqn8fc8UYikW0ADqbI6njwx/CrZFMU=;
        b=QrcLfKebeRTWvt4YKw8UFWfYt25NNrQQfX99Oy6r+vCqro5wELxb3cYBNFN16R3mZE
         wFm8qKDe+LeIdcpuYKHxWJTLSCg/HePLqdZerEDwZRLgp62N7xiQGzLXsd3i5aFoj3Jt
         e+GfvgP5S9iBaVw76byCwgEpHcics5pmXMa7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687537962; x=1690129962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/ctcywp7aSY6bqn8fc8UYikW0ADqbI6njwx/CrZFMU=;
        b=VnvCpd74XSkgB6emrm5AJcV9AkSeFmKdD+A/tf4xXEoy6DzMxb8m+o/zhrQGL8i4Ni
         aasmqBTbiBJqPEvdxtOGP0S0lQyvQElV4CdWVvhTSq5gv8q/GGaDFxfrvrRq/Yq3GwFb
         eR7i0qovmxIYVI/fjAxzN+RKWe4NhLNl+2hxa1mlsVG8pxz1JrEVZnHyRS9ncisOihSd
         5lcpekl8ygSCCLHLqhbOtxh9UzCFRXxGyaFBU0HJmO2F6VXaE2YRM6VdbQhuNRNE/U2B
         9beY+JK5y8PAI0ninr75jVoxSET12SyzMohSahpwFZx32HOuGtn79I1uz1lsI6CHLuej
         WQYw==
X-Gm-Message-State: AC+VfDxhBLmr0S35CmNR0qCC6BmIguCX3LNMIgJjIPDxb5Kl0ICSg6JR
	8M299pJ2uUoQS+XRBssso5o8Mg==
X-Google-Smtp-Source: ACHHUZ7y3G0c/1K1ZxsQD1CmVObEWMkld+khXvdLHXCeF0xmvtbL20p/dlmeD6u4oVOhycyAEXH/Og==
X-Received: by 2002:a17:902:aa0a:b0:1b5:4679:568f with SMTP id be10-20020a170902aa0a00b001b54679568fmr10746105plb.45.1687537962012;
        Fri, 23 Jun 2023 09:32:42 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iw13-20020a170903044d00b001aaf536b1e3sm7442562plb.123.2023.06.23.09.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 09:32:41 -0700 (PDT)
Date: Fri, 23 Jun 2023 09:32:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix CFI failures with GCOV_PROFILE_ALL
Message-ID: <202306230932.539C9DC0@keescook>
References: <20230623001140.1111494-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623001140.1111494-4-samitolvanen@google.com>

On Fri, Jun 23, 2023 at 12:11:41AM +0000, Sami Tolvanen wrote:
> Hi folks,
> 
> The following two patches fix CFI failures with GCOV_PROFILE_ALL,
> where the compiler injects indirectly called functions to object
> files that otherwise contain no executable code, and are not
> processed by objtool or don't have CFI enabled. This results in
> missing or incorrect type hashes during boot and when modules are
> loaded.
> 
> Sami Tolvanen (2):
>   kbuild: Fix CFI failures with GCOV
>   kbuild: Disable GCOV for *.mod.o
> 
>  init/Makefile             | 1 +
>  scripts/Makefile.modfinal | 2 +-
>  scripts/Makefile.vmlinux  | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)

Nice hunting!

Reviewed-by: Kees Cook <keescook@chromium.org>

Should these get Cc: stable tags maybe?

-- 
Kees Cook
