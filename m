Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3D019E97B
	for <llvm@lists.linux.dev>; Wed, 25 Feb 2026 07:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772002840; cv=pass; b=FVU+7ytnmTCmDFPlJd1tjdjU6qgDV3cq6QaQIeRLgd5EWJKWiWSnTHL+JIX9VgN9rKsWS0vJsd59YxOf/fLygZWnOTGLkNXA6Q+bv99WWxl3ROD9J2HdUPPMnG0Dv0lbCcudFQYMKAwWIQnfcByE5t3bvLaFeBAoDaQSuDWlNI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772002840; c=relaxed/simple;
	bh=FYgL8nQLIr0JlDcgdRpLSDK9ILU+LZhcUflqkQqVQuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSEHlw+9/1hPsHOhjhw46H4nRkr5QPTU0r/RFICn+qhy1DGXyUGCoh3TriZjR/jqMMptxrWzhK9zq4eW2KTZpqLb+QWO1tMckIv21Hu/8iHZheLawsb5pC0StFzrMTEQ4N4b4xq0NRiM4Yh8UzLANgYc+bi8V3ZEwT6DnBAg688=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xH/YnqkF; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xH/YnqkF"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12758ce1e8dso2529464c88.0
        for <llvm@lists.linux.dev>; Tue, 24 Feb 2026 23:00:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772002838; cv=none;
        d=google.com; s=arc-20240605;
        b=YU6of70D+yAwzGHyCZa4jUky6CJhuqUp+3BzIWLFt5G2wS5QaHqZPwPuvT3BFXqd8F
         Dox5ypIGmiMJmPRAC7OdtZw2u4N3hE6dXV9hQy0IG9fQ4N4x+1opFd+H0Z6vK3KPRsjK
         Ldt5FqSkmdUSjx2mXefj2k1+BTORw2YiW6hLlywnQa807S1F5pVEuSCJ6E0eZr6++YV0
         dLzunFr26yOXH/37CMxQQBxZREovnt2sxwJutLfd29SRttgfyfPJHktgel0lTYTbs7Zr
         ZK8+LJIIK6dWp5/VQ1qBlwzyVEYnp8a7e5Osm0rgFfYw9kk8cVVUVG41mZ8+nVTEdEAQ
         ZQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JVgMngU0FK9sA3i9HvUWQGL6jJ/iPIt1dzriAO3ZNU0=;
        fh=r872Md3xE5R41EM2Zb/jxT+oB5fUjDrD2N1jYDZW4SI=;
        b=UvWWhNeD2iDd9lDjhxdjmfmWsCQ+ebB42Nz58AwJ5NJSlw0FpyaatMAN0N+myoZI78
         NOonRm76bJK2XHvIFa0+Wk5oT6AjiEA33k/xm+HIpI/8iMaw3kGWh9TutoW+FQdb9Iu1
         JOS2GAkNr5oo+4wgrbIIXdEojr8++VIi9l3R+Eyi6DBc9duDsXput6VZ/nL/oHJsb+ok
         umvYyZlpLBZ1QoOTincv5rmyqeElyiRPeacXAy5A09LfNDkszIubSoyV/7lg2J1TRBCT
         eid1vd4Od7yMSl1Vau4/OoZwsjAPmfnx0+pAuTbC3MVPdwmDN3zJRaycT2498YqOdJUJ
         c1/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772002838; x=1772607638; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JVgMngU0FK9sA3i9HvUWQGL6jJ/iPIt1dzriAO3ZNU0=;
        b=xH/YnqkFn/Pit0SYe1nLMpKtkx2PR7GNW6w/vV9uIvk+/P/6PvQJegv/Xbwofl9Xqh
         PsTe8rerBahQh5pGpXrdVA/VlrFAPgFjtkwClQHlpwY4QpPojpFnK6xKrpsiyaGOWt27
         CV12HstUhurD2tonAB9/lkxDdRxMyGMQs5dEelBF6CnAc0ssfI3jPZNXs75qz7aclR8S
         1p7D2F5UoosUaQyAk0t8rk0ynKFarvpBkqH0x/Z2ARnDXRe0lZ0d2vJSHKpDDkbkC/fg
         h+opFNSuQsbOg5AWZN19C7XiyY9m5eeWpnuaYy2+NtqUijn5/OpA05C5zJLYcZrEhOaM
         xeqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002838; x=1772607638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVgMngU0FK9sA3i9HvUWQGL6jJ/iPIt1dzriAO3ZNU0=;
        b=V06v7HlZ7gb+MU72Pp4qZN89g9lmIvRdg4Rj9L+5ro2KL1GjXvFNQugnacrEbhnFWj
         4A4rtQOizV7S87WdXSQLUAJqJggoysThpGnU+Mgrs1P+5qzyaCyhL7HxYcW9q5BrTACJ
         hw4Aig7rjRDq7NvSCvn+HZ8+0lG3qWMrL2hf5Tz6CWFUEYzjcHtV5AL7csbzkQFKWfvS
         DCZ3aqvPEMIbc7Ut9JDz5Mx9Dq7fNzwzrU/rm1Hv1awo4+cTOxmq+lCSt9vokitUik21
         S6EzFf/ywjdbUTWo8jOI7/ldOP3VshjgSFKEnzCtuFByGzRXagDlB4vNS/hOjPRYkypd
         b0iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4WA375yoik82mNMSeDJeUflp9nvSWbiceJBpEBhqZPwRBLMT0uksHVOqAHdw2ECJ0eZFo@lists.linux.dev
X-Gm-Message-State: AOJu0YxlhEwauukxpXm0STDOtuMeE/OVDUfgzTswXgQht2Ch1Dsc6OwX
	iHEpooKiU5lQnWzkMSoEh2iL58FwUjEy3MiDoC/2tx0O2QdiUL2mXIG2t5Ht1lrWh5HSJKJKCln
	0oqujfolW/Hk+kzmRcMWkipV3cX4Qnz3wXhUj0lK+
X-Gm-Gg: ATEYQzxUwIGBn6et74tjHYf9qE3dagdvkGK0YG+8T6w1etWVImmUb3YgmcPT7m1rvh0
	8hfDoAp77ixgtTqWZjSNb2EOFbbVKcosqg6fZUGIKcITAtbiv6Jbd64v1kmteyFkg8p6unZPqYK
	dJkynl+dLPU0V+l9BjMqGfs49guey9BafkE44e3VUaES4SC8twD8d+ol3kyxz1ZhYgXdS79ZK35
	xjHHv/rJCOuH0dec2Eb+RvjBBve2S6ODNj3SQv35s/OrXCLQH2Yx28f/8uEA06Bdzm+ehtBJ1yd
	voHtIJlHOveWqgayP2kaoI+fznGmSaiQeyOurQ==
X-Received: by 2002:a05:7022:4a3:b0:11b:ca88:c503 with SMTP id
 a92af1059eb24-1276acda3e1mr7121122c88.3.1772002837219; Tue, 24 Feb 2026
 23:00:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260224-bump-clang-ver-context-analysis-v1-1-16cc7a90a040@kernel.org>
In-Reply-To: <20260224-bump-clang-ver-context-analysis-v1-1-16cc7a90a040@kernel.org>
From: Marco Elver <elver@google.com>
Date: Wed, 25 Feb 2026 08:00:00 +0100
X-Gm-Features: AaiRm506Rxogzp4clR7Qgn3HHRmvIaupO6xQq7I1TB1dbjYDHkbI7JwI7Av3w84
Message-ID: <CANpmjNPLYUMMAvbKU2_D+OdW3Jd_-NPMc3MNfV78SQ3bC5EX1g@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Require a release version of LLVM 22
 for context analysis
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Bart Van Assche <bvanassche@acm.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Feb 2026 at 00:16, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Using a prerelease version as a minimum supported version for
> CONFIG_WARN_CONTEXT_ANALYSIS was reasonable to do while LLVM 22 was the
> development version so that people could immediately build from main and
> start testing and validating this in their own code. However, it can be
> problematic when using prerelease versions of LLVM 22, such as Android
> clang 22.0.1 (the current android mainline compiler) or when bisecting
> LLVM between llvmorg-22-init and llvmorg-23-init, to build the kernel,
> as all compiler fixes for the context analysis may not be present,
> potentially resulting in warnings that can easily turn into errors.
>
> Now that LLVM 22 is released as 22.1.0, upgrade the check to require at
> least this version to ensure that a user's toolchain actually has all
> the changes needed for a smooth experience with context analysis.
>
> Fixes: 3269701cb256 ("compiler-context-analysis: Add infrastructure for Context Analysis with Clang")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Marco Elver <elver@google.com>

> ---
> Peter, could you take this for a 7.0-rc?
> ---
>  lib/Kconfig.debug | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 4e2dfbbd3d78..8e2b858078e6 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -630,7 +630,7 @@ config DEBUG_FORCE_WEAK_PER_CPU
>
>  config WARN_CONTEXT_ANALYSIS
>         bool "Compiler context-analysis warnings"
> -       depends on CC_IS_CLANG && CLANG_VERSION >= 220000
> +       depends on CC_IS_CLANG && CLANG_VERSION >= 220100
>         # Branch profiling re-defines "if", which messes with the compiler's
>         # ability to analyze __cond_acquires(..), resulting in false positives.
>         depends on !TRACE_BRANCH_PROFILING
> @@ -641,7 +641,7 @@ config WARN_CONTEXT_ANALYSIS
>           and releasing user-definable "context locks".
>
>           Clang's name of the feature is "Thread Safety Analysis". Requires
> -         Clang 22 or later.
> +         Clang 22.1.0 or later.
>
>           Produces warnings by default. Select CONFIG_WERROR if you wish to
>           turn these warnings into errors.
>
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260224-bump-clang-ver-context-analysis-b4f5e27d208e
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
