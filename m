Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9C8613A
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 17:33:58 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-688779ffcfdso1007202b3a.1
        for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 10:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692380038; x=1692984838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z8VxOYqY0vk5zLSdtNkelkzBoODifEK09GEUE59Uh/E=;
        b=kMub35CoX+FGqGlEXa/v7SPizCC+sQH0jMFem1D1JeANqS37tH6/y0XZCXnC/aH+U5
         kJBVdMWwYkMTpF1pLdKjiX4dO1zZg9PmnllgKhcQ8/j6A+6lsAOGm7snFIH2dL+oBYJF
         zdkydtJWoioVltE5GW9w6lD0ChboN8PRmcDbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692380038; x=1692984838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8VxOYqY0vk5zLSdtNkelkzBoODifEK09GEUE59Uh/E=;
        b=MWGJvpw+XiVg2nLyMeejJ/4hkMgM3VDuSvbEZjmOW0hPZGBWDEYX2EQEUKYbi6Eu1M
         CW1ysDSNqtXkEP+VIyM8x2BWXOQzklDMEtUsywWvocCuZ4p/3XdevZZIwIrBefDiT/Nu
         lLKHqHy6fcPLj2a181igEzK6KLs2IjjDnRSBzbjJfq0zSc6PLeKV8i7FVolX1IBAVAH+
         HqowJIfFbuVEWLei11dW1Q0yzBPDFR2gdDRyo1XGkWL7Xm9xVyuoMnI3lfGZ+77Phkow
         /IYlPxc1RAAusOtDroxYOLiwvau+ZRd/mLFTC9Iswz1IHHL8JWPBasVeTVOomzQje+8o
         6yNQ==
X-Gm-Message-State: AOJu0YwJ691pXjY5u8d3G/XVtrDcY/hfwc2dHz0gtPwy7gkGhtylHBWA
	Lzcridm7DRZWjttMfpA5q8zLxw==
X-Google-Smtp-Source: AGHT+IEIW5Yl9r6Sj3v9imMpgLBJxv4XcEqIkrMkv167YzQxcg7Et1cOrpJxjwCXnMm+AR6HQRKkrA==
X-Received: by 2002:a05:6a00:1249:b0:689:f693:917f with SMTP id u9-20020a056a00124900b00689f693917fmr3136404pfi.28.1692380037809;
        Fri, 18 Aug 2023 10:33:57 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ff18-20020a056a002f5200b0068703879d3esm1794159pfb.113.2023.08.18.10.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 10:33:57 -0700 (PDT)
Date: Fri, 18 Aug 2023 10:33:56 -0700
From: Kees Cook <keescook@chromium.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, "GONG, Ruiqi" <gongruiqi1@huawei.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] selinux: Annotate struct sidtab_str_cache with
 __counted_by
Message-ID: <202308181033.03592D6E2D@keescook>
References: <20230817202210.never.014-kees@kernel.org>
 <CAHC9VhR-vxsaR7deTQ+zzVP9W2uSupz4ucf8p+tt0e730qbZ1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhR-vxsaR7deTQ+zzVP9W2uSupz4ucf8p+tt0e730qbZ1g@mail.gmail.com>

On Fri, Aug 18, 2023 at 12:25:12PM -0400, Paul Moore wrote:
> On Thu, Aug 17, 2023 at 4:22 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Prepare for the coming implementation by GCC and Clang of the __counted_by
> > attribute. Flexible array members annotated with __counted_by can have
> > their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > functions).
> >
> > As found with Coccinelle[1], add __counted_by for struct sidtab_str_cache.
> >
> > [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> >
> > Cc: Paul Moore <paul@paul-moore.com>
> > Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
> > Cc: Eric Paris <eparis@parisplace.org>
> > Cc: Ondrej Mosnacek <omosnace@redhat.com>
> > Cc: selinux@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  security/selinux/ss/sidtab.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This also looks good to me, but similarly to the audit patch, since we
> are at -rc6 I'm going to wait to merge this until after the merge
> window.  I'll send a follow up email once it's merged.

Thanks! Yeah, there's no rush. :)

-- 
Kees Cook
