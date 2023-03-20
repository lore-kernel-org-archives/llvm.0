Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAF47C
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 17:22:22 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id m2so11133059wrh.6
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 10:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679332940;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxjjxaJTXTboGVrfO6rMCJaEH+UFkfq+cnWcxaf6bDM=;
        b=e7NNTBrcXYI6ZeGCPVcm1gqNsy0fhqmhF1hY5CpuPfiD09pAc8mDyuSPHZ2abjnEQs
         5MeUNkf9+Qpn/gJ0TIQFqf1B8wOb7ZAewpBP6p+pX/q3NXaUD16HbZZC6fkbtWE4igUE
         HWYwcgk257n6oww6LsojLHml+jZ/D96pSwk1dP8Uuj9PqRCNSJNie0HouKYdgrWY57o5
         jZsA6U7EfydUc7Q6aytVYpqsZh/KZNqpOnrHIaSJlajFx+HXsoQLIx9/GdPjDA5F6HEj
         stbisFtVA6wAsC+WofyDQyT68vLvYIkMy8kzd+rhsPvwKhzPQY7SiMlZf2Q1sXeDo345
         evxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679332940;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lxjjxaJTXTboGVrfO6rMCJaEH+UFkfq+cnWcxaf6bDM=;
        b=Td7qXcW9pSSeowS8pTzzyAreZEJXBEzr46iO8U8OPwSKlavBOsFS7sc8TwqrVguLsR
         iQseYg3xwF3I8QDZ0zQBtx5VRTAtGsG9KwMZeTmE5QdEKNoQgVIsNGCC3IT0aTRPVDbr
         6M+pbVUmAWOwzyxGunQKgoPr4lZ7o1AqXf4uUiXrp9vF9uINgEevuytm4tzWiqfZ5Qza
         sRP7ZBUpbfh0HD/7g3mn//ijm/OjLXOZd6geq+nuzwm4NikXQ0kQvfKstbEXSJ0TbxGf
         toJlJXzTo6OAicJdDKYzFT+cTzuHWO5Yerl7wbI0BmuF6XMJspmNDdQpXyyS6rk9ed9e
         EKXA==
X-Gm-Message-State: AO0yUKURdJrY2ygRyo0kj5BCTsPeHNATIwWEzsumg+bwrO4S9+gc+PLm
	zSR7eZPirvIaQ+CPpWVKZMI=
X-Google-Smtp-Source: AK7set/ymi8bJFB2BEvtQ2c1G0ARXELEvqljjbsIS1JkE7eUXiLHhggKQZscZsry8GAlEe38EPXVMw==
X-Received: by 2002:a05:6000:1081:b0:2d4:53d7:ea7f with SMTP id y1-20020a056000108100b002d453d7ea7fmr121431wrw.3.1679332940533;
        Mon, 20 Mar 2023 10:22:20 -0700 (PDT)
Received: from localhost (93-55-83-125.ip262.fastwebnet.it. [93.55.83.125])
        by smtp.gmail.com with ESMTPSA id p17-20020adfcc91000000b002c71dd1109fsm9426966wrj.47.2023.03.20.10.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 10:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Mar 2023 18:22:18 +0100
Message-Id: <CRBDUDH0574S.1JGPTCYLLSBMC@vincent-arch>
Cc: <linux-um@lists.infradead.org>, <x86@kernel.org>,
 <llvm@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arch:um: Only disable SSE on clang to work around old
 GCC bugs
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "David Gow" <davidgow@google.com>, "Richard Weinberger"
 <richard@nod.at>, "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Nathan Chancellor" <nathan@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Roberto Sassu" <roberto.sassu@huaweicloud.com>,
 "SeongJae Park" <sj@kernel.org>
References: <20230318041555.4192172-1-davidgow@google.com>
In-Reply-To: <20230318041555.4192172-1-davidgow@google.com>

> As part of the Rust support for UML, we disable SSE (and similar flags)
> to match the normal x86 builds. This both makes sense (we ideally want a
> similar configuration to x86), and works around a crash bug with SSE
> generation under Rust with LLVM.
>
> However, this breaks compiling stdlib.h under gcc < 11, as the x86_64
> ABI requires floating-point return values be stored in an SSE register.
> gcc 11 fixes this by only doing register allocation when a function is
> actually used, and since we never use atof(), it shouldn't be a problem:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99652
>
> Nevertheless, only disable SSE on clang setups, as that's a simple way
> of working around everyone's bugs.
>
> Fixes: 884981867947 ("rust: arch/um: Disable FP/SIMD instruction to match=
 x86")
> Reported-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> Link: https://lore.kernel.org/linux-um/6df2ecef9011d85654a82acd607fdcbc93=
ad593c.camel@huaweicloud.com/
> Tested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> Tested-by: SeongJae Park <sj@kernel.org>
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>  arch/x86/Makefile.um | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/x86/Makefile.um b/arch/x86/Makefile.um
> index b70559b821df..2106a2bd152b 100644
> --- a/arch/x86/Makefile.um
> +++ b/arch/x86/Makefile.um
> @@ -3,9 +3,14 @@ core-y +=3D arch/x86/crypto/
> =20
>  #
>  # Disable SSE and other FP/SIMD instructions to match normal x86
> +# This is required to work around issues in older LLVM versions, but bre=
aks
> +# GCC versions < 11. See:
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99652
>  #
> +ifeq ($(CONFIG_CC_IS_CLANG),y)
>  KBUILD_CFLAGS +=3D -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
>  KBUILD_RUSTFLAGS +=3D -Ctarget-feature=3D-sse,-sse2,-sse3,-ssse3,-sse4.1=
,-sse4.2,-avx,-avx2
> +endif
> =20
>  ifeq ($(CONFIG_X86_32),y)
>  START :=3D 0x8048000
> --=20
> 2.40.0.rc1.284.g88254d51c5-goog


Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
