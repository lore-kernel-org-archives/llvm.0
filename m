Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13C217724
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 18:25:24 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-55b1238a024so1639254a12.0
        for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149524; x=1690741524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=THzb2mxWSB498SbTKEigAG3BbQmUyfPai6SPDufuYVQ=;
        b=fwgdBLRw/OL24yIe9DR1DbDq0ls1En8ub+t31vUJPas+cneMdfjhphEdaVvHMtIfQp
         Z4KwZyofbAGkDREK40sNwJ1hl3USv7l72P7sea5BRSS6KXuXklxGzctZ2/AuuVvjhYkT
         3LinGnv99CoMpoHT6PSreXbOM+aSwZ75RfenE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149524; x=1690741524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THzb2mxWSB498SbTKEigAG3BbQmUyfPai6SPDufuYVQ=;
        b=K6ux+3cFYzVwLAHs07t+rLa68cIBNR23cf4e60oW2aC/QgM1cC4cmLsyR6jUENknY7
         eLKZXwl4ZPgCd2nBmmtf/E+aT+3JdBQRVt0Psm8pHekdhdHhAnyZWqWCq7I9RiP+ayYU
         SEaiAJ3c03smk3xt1E/Jr4rozAkIjgc1iR2cSEOWE041npyxA1jC3oiBeQSo8jkWtjCE
         o6fiazM8mknkshreV+khDRijvTaVLCCDhEofJQDs+CrE+dUY2fiYxitaN70zdfniKGM4
         hD6BVRuwBOo3XJKRgd04JTb16ypVR5Iiq7Igf9abc0rBWdc64SF89TnswSeYQIEiXxU2
         HdCA==
X-Gm-Message-State: AC+VfDzC/Ldv952MD2sWWqClQpZ3wUQAuXTZI6X+DnuPngxVf9O+pVP6
	oQKIJdVtIfPNpkQvC3+CiZ9/Qg==
X-Google-Smtp-Source: ACHHUZ4BxNqg0tDxcmJLzFG13UXanJEtBxUPHSlYkDyRPNnGGdkF2s45tYBqApFjvkyqxE9iTc+X8A==
X-Received: by 2002:a05:6a21:998f:b0:111:1bd6:2723 with SMTP id ve15-20020a056a21998f00b001111bd62723mr4289059pzb.3.1688149524129;
        Fri, 30 Jun 2023 11:25:24 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709028c8700b001b03842ab78sm11096926plo.89.2023.06.30.11.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:25:23 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:25:22 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] riscv: Add ftrace_stub_graph
Message-ID: <202306301125.5E2EE84@keescook>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-11-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-11-samitolvanen@google.com>

On Thu, Jun 29, 2023 at 11:42:48PM +0000, Sami Tolvanen wrote:
> Commit 883bbbffa5a4 ("ftrace,kcfi: Separate ftrace_stub() and
> ftrace_stub_graph()") added a separate ftrace_stub_graph function for
> CFI_CLANG. Add the stub to fix FUNCTION_GRAPH_TRACER compatibility
> with CFI.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
