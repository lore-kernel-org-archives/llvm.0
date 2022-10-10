Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7CF33CC
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 17:16:28 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id gf8so10320878pjb.5
        for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BN2BBjIG9zgvtnK5eGnUzK+S+KfwlGKwZqzD4HQLmGc=;
        b=p1wbnrSwuiCSeyPsFZGhXObnTivR9L9GH3dLg4z9E/vjpJ5yXMZebAY+zGjLHaS9y6
         XHi2ym+SgYMOI6HATyeFV8QJCVFTjKc/IzqC/A5944EbO1MSxyo3vKznl0UyYcVVq023
         adLtnIsDkQDwOQ/bOj3lShJ04Gn0j1QjedHVYFUV6ZRbXYsLEfQAYViKlq9oaJh+OZNn
         p0h6+iVQmXVBfVMon4bfrpn7Z2Xex+4KGOgB1AQLBscBBSXfmSPHpg6fdUElBZrANzFt
         Lq15ArkvE0lKagCmkY80cZHnff+kLf5k+nDOL3OqWf74pwAoQjLG7gdaIHNrESsbvWpm
         wvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BN2BBjIG9zgvtnK5eGnUzK+S+KfwlGKwZqzD4HQLmGc=;
        b=8HyqaK07rommKGAW5ixVjlLxhP9buFKEQWMA9UhTrLOu27iTFzentiPKSlQSQ+RFkP
         jxlMM4EEwNgU6slC66avouZpcScQ9JoIGGWcb8hJjcBTAU6rmPOFoiZhmkj6iN7Kqift
         rmS2dAYiNMRq02RKfFWBN4eQZJmJiUZ5iwiWBu0ydXpvWPfEIbjH9r8d39XMFZwmGFtT
         ycUn1X+IEXtbEmYw6mDIJ+BSNzc3RkVWdq2yl4j4UYuGZ6W4iQgatmKceDUsXycrmsNW
         ym7zUEtOAzMJER4uLAzgu6WEbwwv6BvfPzNzf6H9oGf+kOTeLIyTUN57t6BzhT+1Zylw
         kPqw==
X-Gm-Message-State: ACrzQf1FgjQVoUVkyE8y0YPTpn2RL4VCJx9Ma2eM5gKwBVaQhw10wx6m
	M2jkQ2do6Lsnc/2C4SuDpl4rWxsDw/0B7HIC20FTaQ==
X-Google-Smtp-Source: AMsMyM4qNu5PTYW/Lcc64zQyr2T94Q8oi+4FnkYY7RhGzfcgHDctbmqYluZw4xZwZ1kGBk7Mf6wXqO2hQBrukPfed7o=
X-Received: by 2002:a17:90b:33c3:b0:20a:ebc3:6514 with SMTP id
 lk3-20020a17090b33c300b0020aebc36514mr31204821pjb.147.1665422187452; Mon, 10
 Oct 2022 10:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5a10dda2a06b92f040ec7a18876db4c8107b4989.1665026261.git.quic_gurus@quicinc.com>
In-Reply-To: <5a10dda2a06b92f040ec7a18876db4c8107b4989.1665026261.git.quic_gurus@quicinc.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Oct 2022 10:16:16 -0700
Message-ID: <CAKwvOdmFsdn_QLCM6R88YYqAh43G3nT4tjJQ0_=sucQoX+EjjQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/clang-tools: Create array of checks to exclude
To: Guru Das Srinagesh <quic_gurus@quicinc.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Elliot Berman <quic_eberman@quicinc.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 5, 2022 at 8:24 PM Guru Das Srinagesh
<quic_gurus@quicinc.com> wrote:
>
> Create array of clang-analyzer checks to exclude for ease of adding
> more. This is per the suggestion in an earlier discussion [1].
>
> [1] https://lore.kernel.org/lkml/CAKwvOdnbMs-pLRfo4O-MHOF=9=kAvDuktkeeeX7bkmnLi8LWnw@mail.gmail.com/
>
> Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> ---
>  scripts/clang-tools/run-clang-tools.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> index bb78c9b..a72c4c7 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -50,7 +50,12 @@ def run_analysis(entry):
>          checks += "linuxkernel-*"
>      else:
>          checks += "clang-analyzer-*"
> -        checks += ",-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling"
> +
> +        # List of checks to be excluded
> +        exclude = []
> +        exclude.append("-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling")
> +
> +        checks += ''.join(["," + e for e in exclude])

Thanks for the patch.  I think it's more canonical Python to do:

checks += ",".join(exclude)

However, let's just make `checks` a list to start with? Then join it
at the very end?

Even for clang-tidy, we would have a comma separated list:
`"-check=-*,linuxkernel-*"`

>      p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],

^ so then this could be:

p = subprocess.run(["clang-tidy", "-p", args.path, ",".join(checks), ...

>                         stdout=subprocess.PIPE,
>                         stderr=subprocess.STDOUT,
> --
> 2.7.4
>


-- 
Thanks,
~Nick Desaulniers
