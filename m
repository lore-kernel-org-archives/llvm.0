Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D22FAF
	for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 16:50:57 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d11so6762772pll.8
        for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Bl87DRbRfnOrhkUE5L4BbxEL4c2GAjYQ7M0EHLwAVuA=;
        b=k/Pf0oq2RVLH59XKlNnE8OZcXuU2wB6wDhvFwqWSj3y9rA+jlLYk4QbMK/tPTWbvO1
         0d5A4HA9wdnUH5Ev0SEIYfZkGYq/BljVAO8dkLzDDNsKZGUVLO3lviV0bNiMy0LJMLd1
         veNpu+I4hph+ffxou0iC4hyD0ERsBh+zhJNw4FGd+pX+k+X0d/xV3ivVgZpCfjX1r032
         +uHPc8WH/6FSve1xuIUM08I6J5yNtwJh6aHAFjaBVmR04nmf2/HUmWgA17QOJlnNA4Qe
         dQTic43Y6j4XcePNeZcE+8JeOm4B3Gi80vSVMdQ5nOYDXbmejsOOUh8lrrwvwI1apwnG
         QB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Bl87DRbRfnOrhkUE5L4BbxEL4c2GAjYQ7M0EHLwAVuA=;
        b=wFGqWwV+LdYqQtJxyCNs26ocpjBzQGpHh/EMqO+h67AThblVHlbXmc+JDIbDtClFg0
         CsfiAbhwXLKr7+aZEq3FN4juXaZleXLHZEOdEcL7eb+25N6UOQuZQSrDKlmOF2CMMNm2
         Fng4UFaSXQnpd8HH8BkIWcNgaf4tkncQD7mIAZZ1f0tnNQ9laKZNNNzr6o/W3NRckcpv
         QVlphcFf9+FdG88/cFlrXnZ5WhI6cR5TWU6ukutnKs3JZYm0NHnIgtAtDxTr9v5UnxM0
         zQDko2BkNjKu1IiEo5ggi9pnkv5PtmoYZF9MRnZLhUHabpIVD2zekin2YR8qSVpnFXpu
         +ubA==
X-Gm-Message-State: ACrzQf26hJ7oHAKG/hCTCo//otztPOUPbzTQY/0Xa+GQ3VwJTc6lUnyM
	LCHEawfRkwmZuonpO72HwZL0DBx3/Ucioe7H3m3w1A==
X-Google-Smtp-Source: AMsMyM6UtWDkGZCZhsx0tR8KOdU6VH24mPotdsbYjkmgnCJx3SgsEdxYwV7yH+J2PwjnOeIoSN/qmkoCqhJi30Jpci0=
X-Received: by 2002:a17:902:a411:b0:178:9e4c:2ef8 with SMTP id
 p17-20020a170902a41100b001789e4c2ef8mr22896380plq.95.1664211056559; Mon, 26
 Sep 2022 09:50:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YzFo/+uF1jJ7gMIN@debian> <YzHHz0S8/Nq1QivU@dev-arch.thelio-3990X>
In-Reply-To: <YzHHz0S8/Nq1QivU@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 26 Sep 2022 09:50:44 -0700
Message-ID: <CAKwvOd=rLna-=3eR=6WMTnVHaBiBR4+Gc99oHOHUEvY34e0hhg@mail.gmail.com>
Subject: Re: mainline build failure for x86_64 and arm64 with clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>, torvalds@linux-foundation.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 26, 2022 at 8:40 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Thanks for testing and the report! I noticed this over the weekend, it
> comes from a new warning in clang:
>
> https://github.com/llvm/llvm-project/commit/e07ead85a368173a56e96a21d6841aa497ad80f8
>
> It was brought up on GitHub as well:
>
> https://github.com/ClangBuiltLinux/linux/issues/1720
>
> I have reported this to the clang developers upstream to see if there is
> any way that the diagnostic could be improved:
>
> https://reviews.llvm.org/D134461#3815298
>
> Otherwise, we will just have to disable it, which I will send a patch
> for later if the warning is not going to be adjusted in any way.
>
> If you wanted to continue testing with upstream LLVM, you can either
> just revert that commit or explicitly disable -Wvoid-ptr-dereference in
> the main Makefile like so, which is ultimately what I will send if I
> need to.
>
> Cheers,
> Nathan

Thanks for the reports.  It sounds like the Clang developers will pare
back the warning for unevaluated contexts (sizeof, typeof).  If it
takes longer than a few days for that to land, let's send your below
patch to help keep CI systems green.

Consider putting the below into
scripts/Makefile.extrawarn

>
> diff --git a/Makefile b/Makefile
> index 647a42a1f800..0bf60134f13c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -967,6 +967,9 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
>  # Another good warning that we'll want to enable eventually
>  KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
>
> +# New warning from clang that is quite noisy due to '__is_constexpr'
> +KBUILD_CFLAGS += $(call cc-disable-warning, void-ptr-dereference)
> +
>  # Enabled with W=2, disabled by default as noisy
>  ifdef CONFIG_CC_IS_GCC
>  KBUILD_CFLAGS += -Wno-maybe-uninitialized



-- 
Thanks,
~Nick Desaulniers
