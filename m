Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F92B10953
	for <llvm@lists.linux.dev>; Wed,  6 Sep 2023 18:06:03 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-68e29792976so106721b3a.2
        for <llvm@lists.linux.dev>; Wed, 06 Sep 2023 11:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694023563; x=1694628363; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O40bo/gxfF03whhMFXEqEedi7R6NFirN94zwY0Dca7U=;
        b=mhSqXweigSouippr7ceGnG4R3WqWvfAM4ECXGSnnsCQ7/pWNZhwryYrObVrkFNBHad
         JxlQgtNYETmDt3jwgtJjLx78eBgccHl0fFlDbHxon6xRAqdM0jmmZYt15QpBtCkfAbij
         pFjMo94SFD8lh0jEsJBCFZk5Dz4HJuLpQIOrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694023563; x=1694628363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O40bo/gxfF03whhMFXEqEedi7R6NFirN94zwY0Dca7U=;
        b=g8rdFDN44OHSm//gIZsmpx/v8rAjq10fdmb4VH1r23CBoFYj53sCrOtu8OKnFsX/JC
         gf1lumzZ5BUyn5tJ3WnF3ks7aAUrCBZrxm/hHuxBDkPWRAgELEKkqEJDJvkLuT35vYtu
         btgi0OcnaF36rZVmzvULdbPGPmhk6wXxAn8qS2sInSesO+C6a+oEpeBPwp/ErFU1hFsG
         iH/uIDJ6mGrFIMwPc4s7W4kPkMsUVH+oUTDayJQtetIXABNCcxrIbhAucDfAbC7ufcTk
         8KDqnAEmfdGRkMuxxBoTBTUIcUcfvscgGm0EkXwKwofvCjA4KvjUQ+SdPVPrzGyCvPxz
         2DGg==
X-Gm-Message-State: AOJu0YwAEtQSX0mi5HUn6NGFKpS7n5hkQHTuXA/WbypRCgBY7W+58m8O
	w3PB7akN71RNUUodYCKqrW+/Mw==
X-Google-Smtp-Source: AGHT+IFVidGBv05UhqX2YIvVWb0IhPX+FPDQhL5+tVhZ0nsxBP5ZEoBlEwgCMn0DOZzFYA3QvqJ9WQ==
X-Received: by 2002:a05:6a00:80c:b0:68a:55ff:3a02 with SMTP id m12-20020a056a00080c00b0068a55ff3a02mr17550041pfk.18.1694023563375;
        Wed, 06 Sep 2023 11:06:03 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b0068c6889e146sm11398521pfb.98.2023.09.06.11.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 11:06:02 -0700 (PDT)
Date: Wed, 6 Sep 2023 11:06:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Song Liu <song@kernel.org>, Fangrui Song <maskray@google.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, x86@kernel.org,
	clang-built-linux <llvm@lists.linux.dev>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] x86/vmlinux: Fix linker fill bytes for ld.lld
Message-ID: <202309061102.DB794AD295@keescook>
References: <20230906175215.2236033-1-song@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906175215.2236033-1-song@kernel.org>

On Wed, Sep 06, 2023 at 10:52:15AM -0700, Song Liu wrote:
> With ":text =0xcccc", ld.lld fills unused text area with 0xcccc0000.
> Example objdump -D output:
> 
> ffffffff82b04203:       00 00                   add    %al,(%rax)
> ffffffff82b04205:       cc                      int3
> ffffffff82b04206:       cc                      int3
> ffffffff82b04207:       00 00                   add    %al,(%rax)
> ffffffff82b04209:       cc                      int3
> ffffffff82b0420a:       cc                      int3
> 
> Replace it with ":text =0xcccccccc", so we get the following instead:
> 
> ffffffff82b04203:       cc                      int3
> ffffffff82b04204:       cc                      int3
> ffffffff82b04205:       cc                      int3
> ffffffff82b04206:       cc                      int3
> ffffffff82b04207:       cc                      int3
> ffffffff82b04208:       cc                      int3
> 
> gcc/ld doesn't seem to have the same issue. The generated code stays the
> same for gcc/ld.
> 
> Cc: Kees Cook <keescook@chromium.org>
> Cc: x86@kernel.org
> Signed-off-by: Song Liu <song@kernel.org>

Ah! Thanks for the catch... I wonder if ld.lld should be fixed too? My
understanding was that ":text =...." was defined as being explicitly
u16?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
