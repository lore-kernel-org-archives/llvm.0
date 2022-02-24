Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ECD7481
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 22:41:30 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id d84so3099768qke.8
        for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 14:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O55dG59ND2a/g7lYO2wfvmMneplJJEKkRL2CoScDnj0=;
        b=e5/hLsrNFpWReKY1/jTKQpPZ+/TK/HqrGw8wiKLEkYuPv3WKHMaVjfyEty1JrNF6Lh
         rFW1Yc0aGeDcgnI3Xas50xRAsKrDQaGdxB4gxOcAmSR3C97Pd4YB63n7EFBmT0emZI7B
         2gKV0LWIk298WU26tm/4nYsRT//xnxEBobpJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O55dG59ND2a/g7lYO2wfvmMneplJJEKkRL2CoScDnj0=;
        b=PYADoJBIkE0tI5t5xx/1+Tkx3sWrs+6O3My82456DY2VAqq+5PyxhTotowUDvIwdL9
         rHRYPUI8/M8zXdfblKP+vMyIh/fNvO0zPLPCSksnRWaM8Lmlu3ZYLxR0Gu2GMaa6LOid
         2CoPNNV0eHoyResZNO4vKYzoThT86pQlteew4musd4oc+lSZPldNnJ4OBeGBJt/Y2dgM
         wLxCBr9Oa4+5+pBlPGN5wpJi0ob/wd8yw4K2oFf8n6uwfBo9oxNndup2+IgWi1grq47Q
         0Mxtf6ysBYLwwJFTDOpomCmkCAuFKCCmBOh4kNg00YXIuNiPU/Rruf6JQOmimYBcHszj
         QJxQ==
X-Gm-Message-State: AOAM531hNgFDHD9XO1Vz+a5qUHe6bVKrnKrA5zwi709E9ASIqdzR72BI
	pr2akj6757nV2buIpeemnlZzMMZarRUY20VN
X-Google-Smtp-Source: ABdhPJxr2sKow82sDGAquVMrlk1bfPxvnVUbvMF2sGan6VjwohuxsYxIC882+vyadyJoOe3WfUrR8g==
X-Received: by 2002:a05:620a:1103:b0:60d:e5c8:a597 with SMTP id o3-20020a05620a110300b0060de5c8a597mr3099816qkk.513.1645742489360;
        Thu, 24 Feb 2022 14:41:29 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id r14-20020a05622a034e00b002de72634a7asm380646qtw.37.2022.02.24.14.41.28
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 14:41:28 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id j2so2471983ybu.0
        for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 14:41:28 -0800 (PST)
X-Received: by 2002:a25:3188:0:b0:61d:5ab9:c969 with SMTP id
 x130-20020a253188000000b0061d5ab9c969mr4710651ybx.346.1645742488451; Thu, 24
 Feb 2022 14:41:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <61fb8055.1c69fb81.ddcb.6101@mx.google.com> <CAKwvOdn6=fW+vRLfiVBP4LgpySjFw3628KpE6wWvtQAc-z+F8Q@mail.gmail.com>
In-Reply-To: <CAKwvOdn6=fW+vRLfiVBP4LgpySjFw3628KpE6wWvtQAc-z+F8Q@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 24 Feb 2022 14:40:51 -0800
X-Gmail-Original-Message-ID: <CAGXu5jLZYLVy46E_BQZPbXkJqpNxABL0EVbHsR1=_u2zp8YJAQ@mail.gmail.com>
Message-ID: <CAGXu5jLZYLVy46E_BQZPbXkJqpNxABL0EVbHsR1=_u2zp8YJAQ@mail.gmail.com>
Subject: Re: next/master build: 201 builds: 18 failed, 183 passed, 30 errors,
 334 warnings (next-20220203)
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, "kernelci.org bot" <bot@kernelci.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 12:59 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> + Kees, for the -Warray-bounds and -Wattribute-warning warnings (in
> case they weren't already reported elsewhere)

Thanks! I think I've fixed all of these now (though I didn't see this
email until just now because I filter out all the public lists I read
@chromium.org -- this got sent to @google.com and apparently I am bad
at filters). :)

-Kees

-- 
Kees Cook
