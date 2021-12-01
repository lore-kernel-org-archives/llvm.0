Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3529F68
	for <llvm@lists.linux.dev>; Wed,  1 Dec 2021 19:41:19 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id o4so25575181pfp.13
        for <llvm@lists.linux.dev>; Wed, 01 Dec 2021 11:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N/c4XBzpAhfh2fxIk2nQwH9IJv2DHkpMOkPrtJqbaqM=;
        b=dsiSvgd8t9Py/T3ZMYz6xVEjcpefT6ANJp1ZgG2dPTBQcClq6XSD22WnMaNmJ+3HSw
         VL7WlY/6MsaGanSDA/J8kLW2Q6zo9mP3WubF9BCQb4xX/EJBjG7nsFuUDTQ8302491dR
         8izBQ0e07WFR3Dkczk8Fqza/sytMMahJUbi0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N/c4XBzpAhfh2fxIk2nQwH9IJv2DHkpMOkPrtJqbaqM=;
        b=2LlnkPCsbgt9+iLzAjzqhPYB8ffOwqyrNB/l7DFE3jHriUw/T0Obqq4xIiUkAatSHz
         MKzUMTRtSNRrsRSyC4WPMThe7c/cvd2iPLloVk8yja76Ha3I2PVmz/Lwb0Ri3k8rZALy
         DmH+gOF3Nt7BNvjasfRWXfg4DueKjk6Wlv0NfUHYR2kNIvCL0M15XJFzeLrxIkrhr+Wz
         HvkbJDpey92kcMMAQKls8SJLnxQMiQ6jWp4OOSmuy/XHT5vKUvUi3QQelA6JaykumXbA
         V5lIhAhJzf/1XDXCIG4fms+ZwMmSaQSMuT/C8Esq/To0AQFW5zO8GxBk8SdJ73Btp5BR
         vc1g==
X-Gm-Message-State: AOAM532tUGktXeRVMEyeHEbz7iUSXveUNyKUC8Qt9Trx9VOymA68VHcf
	UwMTLSAapppCOqPQo9hRcb5liQ==
X-Google-Smtp-Source: ABdhPJwnrkf5VV8lOR8ofvTy2eEtkrOUbvs6jU3Ueml81H0PE/585+9TxwtaKPip2KS4chmI1tUn0g==
X-Received: by 2002:a05:6a00:2ab:b0:49f:997e:23e2 with SMTP id q11-20020a056a0002ab00b0049f997e23e2mr8130898pfs.22.1638387678756;
        Wed, 01 Dec 2021 11:41:18 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d2sm647466pfj.42.2021.12.01.11.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 11:41:18 -0800 (PST)
Date: Wed, 1 Dec 2021 11:41:17 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Tom Stellard <tstellar@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>, cki-project@redhat.com,
	kernelci@groups.io, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH RFC 0/6] Bump minimum supported version of LLVM to 11.0.0
Message-ID: <202112011140.DA93B3E@keescook>
References: <20211129165803.470795-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129165803.470795-1-nathan@kernel.org>

On Mon, Nov 29, 2021 at 09:57:57AM -0700, Nathan Chancellor wrote:
> This patch series raises the minimum supported version of LLVM to
> 11.0.0.
> 
> Patch #1 outlines the issue, goes over the potential impact of the
> change, and does the actual bump. Subsequent patches clean up the
> various checks that are always true after the bump.
> 
> I have marked this revision as RFC to give various parties the option to
> comment on this bump before it is done, namely KernelCI and Linaro's
> LKFT, who are still testing clang-10. I have added some other folks to
> CC that I know are testing with clang to see if this impacts them in any
> way (as I would like to impact as few people as possible) but as far as
> I am aware, most other CIs and developers are testing closer to tip of
> tree. If that is not true, scream so that we can see what can be done
> about that. If I missed anyone who is actively testing with clang,
> please key them in and I will make sure to include them in future
> revisions (if any are needed).
> 
> It probably makes sense for this series to live in -mm.

Sounds good to me. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
