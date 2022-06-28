Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA913209
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 13:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656422355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qtr8/zsHx2lgXvXWLguSyb54C2tIRyCmz4eBKyNcZb0=;
	b=URjvPVt1SnIfkK4brBiOYkx2tcVVLHPZpAEwIRh9ySkTIs3MS6Xe77bcEZu+tj5XfA/cuj
	Q2BGgt/hsIhJmqnCHRYPpHEHRVhDjeBpVMTkWsHKFhJQKF+aVJTP9UgGfBkKaJZiuzcLhu
	z7KT07R7DRAvzUNCUXUZAlfG3ba9gdk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-QSHq_5bxNMSFmVVPlImmyA-1; Tue, 28 Jun 2022 09:19:14 -0400
X-MC-Unique: QSHq_5bxNMSFmVVPlImmyA-1
Received: by mail-qv1-f70.google.com with SMTP id w18-20020a0ce112000000b0046e7f2c5a06so12264783qvk.0
        for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 06:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qtr8/zsHx2lgXvXWLguSyb54C2tIRyCmz4eBKyNcZb0=;
        b=OZEbg387t/FOOa6m3uZgGeQ7betkVgcP//dP9CMf3JNztEX7HSh1up2Ce7mk26lhmt
         ksSTCf1VjKEG9IxkliKIxgJTxGfOTGVivj3GFywO9Hbziiww4rx5U2eXd3DyAFvY8prw
         kk4D4vIfuyTHuDvHbcKy3R8iNdO795ql7Ob0nyKT/FBVqD5FHujuXj9MVHWQJyBN5rT9
         6l8kSr5fkwPd+rCCGTV0udS7UOX32Ua5a+YrSj7LEgTHjzcanNkicDylPxwTc1+HcPER
         DHKyz3THMRu4+KLrHXQ/8wEmLa31SRq1Q6YziZ6CO4BGguwMALSXdySTqJFaUVmuQ/Gd
         MZGA==
X-Gm-Message-State: AJIora9CpWr9+hDHG1t9ZUqgAh4P5Ig7yfAmu8IeXIaakMRsSozNCnoN
	dUIqMxf1dWTzhE67IdBthUucdwGE9RwNc31Y/KBUCXUsAy+JmVST9TN/CvgMH9y8bbC7j/vY1ei
	yLR7hhEiLhkctsw==
X-Received: by 2002:a05:620a:2629:b0:6ae:f26f:4a6f with SMTP id z41-20020a05620a262900b006aef26f4a6fmr11211898qko.525.1656422354107;
        Tue, 28 Jun 2022 06:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u6u3ElgI5SXkTszodT7+MkuzdhwyGAU7ALTb5+ws6xpB7rbXIdQWZhAuG2FGgMK9tgjL0AfQ==
X-Received: by 2002:a05:620a:2629:b0:6ae:f26f:4a6f with SMTP id z41-20020a05620a262900b006aef26f4a6fmr11211875qko.525.1656422353898;
        Tue, 28 Jun 2022 06:19:13 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id ay42-20020a05620a17aa00b006af3bc9c6bbsm3262520qkb.52.2022.06.28.06.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 06:19:13 -0700 (PDT)
Subject: Re: [PATCH 0/2] Enable clang tools for kernels build using gcc
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220628122741.93641-1-daniel.thompson@linaro.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <0478d832-d902-69ed-7c1c-4f19d942cddf@redhat.com>
Date: Tue, 28 Jun 2022 06:19:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220628122741.93641-1-daniel.thompson@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

The limitations of the compilation db are not limited to the kernel.

Why shouldn't the change be made in the llvm project ?

Tom

On 6/28/22 5:27 AM, Daniel Thompson wrote:
> This patch set makes it possible to use clang based tools, such as
> the clangd completion engine, regardless of our choice of compiler
> for the actual kernel build.
>
> Most of the fine details are included in the patch header for the
> first patch (since we'd like them to appear in the kernel history so
> they can help future archaeologists).
>
> Daniel Thompson (2):
>    clang-tools: Generate clang compatible output even with gcc builds
>    Makefile: Enable clang-tidy and clang-analyzer for gcc builds
>
>   Makefile                                    | 11 ++--
>   scripts/clang-tools/gen_compile_commands.py | 71 ++++++++++++++++++++-
>   2 files changed, 74 insertions(+), 8 deletions(-)
>
>
> base-commit: a111daf0c53ae91e71fd2bfe7497862d14132e3e
> --
> 2.35.1
>

