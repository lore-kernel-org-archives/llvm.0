Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FA429CA
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 20:37:54 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id z4so8510591lft.3
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 12:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+VrxapYZdFw5zNLlkG7gwQPQd4MEqlLeWHHaNG101EE=;
        b=iCzeaUDYVxkrKStctnh8zTlYnJAAnFTeTA+LUgTna1b2xHj7nYwsZzrWUq+lpOMu83
         hFYTUH1t2BGH0R0K84qzSGj7WZfSb0zOJ2HX2O59nvLkeAlgQkjs9bUMrtHGXFVhvmdc
         qbDBPiIfo/AIUQsTRKQ2xTIEHF3zDJM1D3Yzqtk4pigP8J+2t0QRhWVAfLHGALrVdDfB
         4I78e9t1ZCyXsLUOqKmlUn0qY2tsP1rPnrag0+pKS/h0LkzxSWvPQ4BYmVAPzXL3YLyk
         +epwFz/vCNK8khzRX+jNkDsGrbrZDaLCjSyTMAQUzHPPvzoQLjMbxNsKu2AjBSyTbvm8
         Qkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+VrxapYZdFw5zNLlkG7gwQPQd4MEqlLeWHHaNG101EE=;
        b=RyJ8eIEQcrUjVPKk9hc8XrjH0Wupc31T9hbUqyeGdecOY5mPKQ4ZCzaqj+8kYqbJ2c
         dHoe8BhAS+vviu/0y5eSUzMgbDia/94fpccr5NKWx+BKO9Dm0mq1khzuJZdYAHcrNzhR
         Q6OszEi8TL6Qom0iPXDsMjvI/+mXko6U58o+2FQk14eTR7wrr9J/MlAoTEwJyspnRXNV
         PTy7QV2DkvsIRBnUwgiMJ9gZZp3XlPz1W6zoZ2nabBalVZGuvwfXD+R4DikKPO8nowcA
         PSHIkV9ZLDVgQuImtv0ZyG/2ntU7zmfRYQM18PhLvdTxabqJUCSojMR9FzlZ4Bz9tI/v
         168g==
X-Gm-Message-State: AOAM5323YHfoEa9y9cbW2hd7tXw2oKLFTwUnd6mNtfb67R+YIFON7GyS
	pJjLn0SBza80Utb6hReIv7shsGIHgJlCdfPYjzlM8jo6Xho=
X-Google-Smtp-Source: ABdhPJyEO7toB9Xk7e12MVsMQizH8I6uc0Z/+GxXMZU3C+7qqlJE+19v8i3RwheJW1fHMv6ZQfY04Q/j+HvgjnlzS2w=
X-Received: by 2002:a05:6512:3c96:: with SMTP id h22mr28020130lfv.489.1643920672718;
 Thu, 03 Feb 2022 12:37:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220203173307.1033257-1-keescook@chromium.org> <20220203173307.1033257-5-keescook@chromium.org>
In-Reply-To: <20220203173307.1033257-5-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Feb 2022 12:37:41 -0800
Message-ID: <CAKwvOdk0UMAaw2j9OmjXN0Jc6FBOhfMP3JmSqMps2_MQFQLq-g@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] fortify: Add Clang support
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	George Burgess IV <gbiv@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 9:33 AM Kees Cook <keescook@chromium.org> wrote:
>
> Enable FORTIFY_SOURCE support for Clang:
>
> Use the new __pass_object_size and __overloadable attributes so
> that Clang will have appropriate visibility into argument sizes such
> that __builtin_object_size(p, 1) will behave correctly. Additional
> details here:
>     https://github.com/llvm/llvm-project/issues/53516
>     https://github.com/ClangBuiltLinux/linux/issues/1401
>
> When available, use the new __diagnose_as attribute to make sure no
> compile-time diagnostic warnings are lost due to the effectively renamed
> string functions.

Consider adding something along the lines of the following to the
above paragraph:
Without diagnose_as, compile time error messages won't be as precise
as they could be, but at least users of older toolchains will have
fortified routines. That is more valuable, but certainly a tradeoff.

>
> Redefine strlen() as a macro that tests for being a constant expression
> so that strlen() can still be used in static initializers, which was
> lost when adding __pass_object_size and __overloadable.

I'd like to see `const` changes explicit in 4/4; I suspect that's
_why_ __overloadable is even needed? If so, then a comment here about
that wouldn't hurt.

Having const be more explicit in the signature will make it more
obvious why the definition cannot modify the parameter.


-- 
Thanks,
~Nick Desaulniers
