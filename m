Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4C145F5B
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 19:11:30 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c4084803f1so26985ad.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 12:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695409890; x=1696014690; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVDXja1jsplK6jUys/BTiLtA/EDT5Ln12hkq4wDDv8c=;
        b=yUHoysyeFUeSAMrRqtuEPCiZpnxprwR6SEV9hyLsk857LVVlFlWw4pVqXG6Sgyx4mf
         stIIBEHfv0G2KGc2PcRwuVl2+mJkY5HtFJKZ/oJ/FiCpbLosSP0CL3b07mB2HRm5meHC
         80640qEcaiFQizaBXN4McLUa7RD5OYADgUoAJxUP5/R6qglaZBHf1hK/fXoTPd0VP1z+
         7T9YG5SuAoPL2hJ8C1sJN26rcaCd/IEyvEWfbVDMXj8HCmehSSkNJUdElC/IurUWObJe
         5KKCxIeZjEPSROBfmj7goeW6jenaB41Mbfxdrmy9cYc5xGA1Hayib5B5FHgboDhWmg1a
         45tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695409890; x=1696014690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVDXja1jsplK6jUys/BTiLtA/EDT5Ln12hkq4wDDv8c=;
        b=tzbsdOEpciE37XYH8Dpz+lZ1J0l78m0GeHTs9nxRaZXEZWy9UgcPGxKdL2B3EWmsRy
         DF6L1fXuGDzYjdLggu/mVeioz1mGeeSLWdfTm+x2t/Sv6oSxCDZJoXHkwPNoE3mmVtHd
         KW0I/gw7o/Th7AOuYBjqcLj5S0s8v6wHi3gvNAh1iFcs72cHV1Cl5NVtYjE+QYmpzflt
         xJYVr4zcdeWWkasLSOYBl28vG6Nl+SgKHghdpk6/b7mvjAFXIurmqd4Hn9k4JtNLmwhr
         An5FxsLc1+WEksC57turTRdN37T9032Yur9UANKPKZ1yni+YpyKavcqycZu81DCFQyoM
         tt8w==
X-Gm-Message-State: AOJu0Yzs+XBA4A7/ncSCfimnxeeMwjEFAomX88dSVIhEeygDg8DztFDN
	+jpMqqWz2eRX89Jgy72CsxI5/MguAWcwAY60EZPXmg==
X-Google-Smtp-Source: AGHT+IF9iaH8QBslvwQ35is4Zdr9k2lMH60K6y1NH/ejSP8CV0JqaMrHHy2+XgRGGHFp5u4qThTi3b7f1K1xQ2ZPvak=
X-Received: by 2002:a17:902:cec4:b0:1c1:efe5:cce5 with SMTP id
 d4-20020a170902cec400b001c1efe5cce5mr33521plg.3.1695409890053; Fri, 22 Sep
 2023 12:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922175327.work.985-kees@kernel.org>
In-Reply-To: <20230922175327.work.985-kees@kernel.org>
From: Shakeel Butt <shakeelb@google.com>
Date: Fri, 22 Sep 2023 12:11:18 -0700
Message-ID: <CALvZod7gc7bzp3HVv6v23rRfZe0ZrLT=qow_W7nF0CnsXFxuwQ@mail.gmail.com>
Subject: Re: [PATCH] mm/memcg: Annotate struct mem_cgroup_threshold_ary with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Yosry Ahmed <yosryahmed@google.com>, Yu Zhao <yuzhao@google.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Yafang Shao <laoar.shao@gmail.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 10:53=E2=80=AFAM Kees Cook <keescook@chromium.org> =
wrote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct mem_cgroup_thres=
hold_ary.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Shakeel Butt <shakeelb@google.com>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Shakeel Butt <shakeelb@google.com>
