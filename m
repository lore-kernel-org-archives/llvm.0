Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F40440C
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 20:19:26 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id p14so5914567pfq.5
        for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 13:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M8IVK8k7k9gOGjXG9NHmvjgor4/KedW5P7/8L1lQGUs=;
        b=l7NuPTgKJF77glfTg5wUM0i6Q1IBcSYKNmIAmbVOrS58xzVMla3V3aoAS25ZQIUKQi
         dbJi/3AGnfBgfwfQsywObFaIUWAEy3rJ41PT8pwaNNaS4VLPsBVEdBrEi+z4af3TsPRS
         zR+hhvenq+Tzp4+/xhyTQDKDrx/rgaqXIoRHftUS6gljtbwBt3XwZulKmH4NCRZa4gc7
         8jsphkevXa52aYaPftluIg3M62is4x/ZdDMdi3WCNvxSnJcAIFBeAJsmERI0DKCykVQs
         3VIoXi58mU1wngSQkYfJiSMJMDjF67PPnEcfgW3X9Z7wWBv69C6cI6ipKt1pxq3JMo2+
         oSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8IVK8k7k9gOGjXG9NHmvjgor4/KedW5P7/8L1lQGUs=;
        b=u4R9mkd3tP/Zi7c8lULYv59vSY9Brx8zo2GfanvK93CC0GTJ66Z4GKQZiv0msCVXQ3
         w8VNzQGzVxAJ6usVO6tS5azNOlaBq3djjxKaPwCPh19gHWn0lO7XT3R+yjjXjbO49Pv1
         cEheFQwaaybFjbNBzsH0EE+BrPDGEIyqKJgDwcM+kiD8pzHW2nOW6z+rvxv80vnfhedg
         W2tHf9vBXfD+QMRIazEI5vB+v34X5cCKmU6weZCPNHKFz6yBb7KKrzBYoeyXn2El1d8M
         FZBpbnP7XVqwvoudSI7Se5r1M8i9BpfoFeoO/naE53sp7Ka+QZRk8Y4mAbauGmsklArs
         UbCQ==
X-Gm-Message-State: ACrzQf2p4MM3kRqqlU1OPUFAIXrF9Qu93IQnxG/v5RfHM2qq6F8VBZeE
	tkmnM5tx5KBP+3e9vVwjQAKLIucKhEYmaAFN4Q/Pjw==
X-Google-Smtp-Source: AMsMyM7RQNAQa92JkPff2Imw1hV4Xm/n13lNelqA2N++jhAukEo0EG4H91O/ZREacbcJ1MI4faUBQ8OOZaYb5XFCoFs=
X-Received: by 2002:a63:80c7:0:b0:46b:2ccb:ff93 with SMTP id
 j190-20020a6380c7000000b0046b2ccbff93mr3283676pgd.403.1665778765642; Fri, 14
 Oct 2022 13:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221012180118.331005-1-masahiroy@kernel.org> <Y0mIUW7Ozx9tseeG@dev-arch.thelio-3990X>
In-Reply-To: <Y0mIUW7Ozx9tseeG@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 14 Oct 2022 13:19:13 -0700
Message-ID: <CAKwvOdmm9FsH2G76bZ2Qr5Bbnbdb55JwONP5WG7oa_iMZUycXQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] kbuild: move -Werror from KBUILD_CFLAGS to KBUILD_CPPFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 14, 2022 at 9:03 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Oct 13, 2022 at 03:01:17AM +0900, Masahiro Yamada wrote:
> > CONFIG_WERROR turns warnings into errors, which  happens only for *.c
> > files because -Werror is added to KBUILD_CFLAGS.
> >
> > Adding it to KBUILD_CPPFLAGS makes more sense because preprocessors
> > understand the -Werror option.
> >
> For what it's worth, this is going to break 32-bit ARM builds with clang
> plus the integrated assembler due to
> https://github.com/ClangBuiltLinux/linux/issues/1315:
>
> clang-16: error: argument unused during compilation: '-march=armv7-a' [-Werror,-Wunused-command-line-argument]

Ah, sorry, I should have finished off that series back then. I've
rebased the series and sent a v4.
https://lore.kernel.org/llvm/20221014201354.3190007-1-ndesaulniers@google.com/

You mentioned to me on IRC
https://lore.kernel.org/linux-next/CAK7LNARg8OpqLR_71PJV3ZoLuDV8+mz9mphg=CzEeEEMY0G3rw@mail.gmail.com/
maybe will be a conflict.

>
> Ultimately, I want -Wunused-command-line-argument to be an error anyways
> (https://github.com/ClangBuiltLinux/linux/issues/1587) but it would be
> nice to get these cleaned up before this goes in.
>
> Cheers,
> Nathan



-- 
Thanks,
~Nick Desaulniers
