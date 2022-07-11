Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497634692
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 19:27:22 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id p22so4644339qkj.4
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 12:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hl5KJFaLUUzHGJ5D3nZv1gxdCVXvGUYkoWrO1hnJVH0=;
        b=iGYINp1gTq9mDbhjcjlcpSx1oWmVzoBXih/jzYw6gSBBw8MTEVCX+siNL/qwXSCgWM
         Zbgg4dQYKIdsqHFqtfftpHUvm3C5SV0niO7CJbCAQGcfjQx1zpkAC/2nS244cIrQkrj+
         6lYOfAz+SFax+UOJc8otlAoNnpR4mNDah3MqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hl5KJFaLUUzHGJ5D3nZv1gxdCVXvGUYkoWrO1hnJVH0=;
        b=BaANsugoDL/LM/Nj7FDL8lWqiWjOjapFVMYht5Xa1CFD/Pq1Xc6Oqeg3eg9sbFwgNr
         VjQKBACcoFCsKXh4h/taW2pm4Rl1KZbbPXKKokzWdZUZHnxwGkfwXVW2M3SGEspSGm0o
         Wt+veAapGcl/H6s0wtJQsO6FN2yPMB1aJeSI0VF4NCfA/wDvTBty0AusbXKYYK1hvCo4
         kj/1xtdDDUBJc0EbYzlutMwfn1Co682/KvI4PM6rSS6+kOD95cTYTjC1TbWa3j0JBidF
         apMfgrUPWczb0Qe4AfDZu/FriElHsXbR4/fyPJISTnIXnh24hbqV/fheI6AH0HNQiXWZ
         S1aA==
X-Gm-Message-State: AJIora9YzunF4cgAhdrzEOgzwOzaHM+UXuGKFIB7mbTh3HQuBsrRFrKY
	z3S/E1X4qvQnFKRhZEzNKYStgw==
X-Google-Smtp-Source: AGRyM1turJL2T3lSJtICxIoL6EW71CcBRW/0yPZEJVSrypnm0kwwQf5lgM296G7dYvps80rtTgXhZw==
X-Received: by 2002:a05:620a:4549:b0:6b1:d6ab:1b11 with SMTP id u9-20020a05620a454900b006b1d6ab1b11mr12472277qkp.777.1657567641147;
        Mon, 11 Jul 2022 12:27:21 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id m14-20020a05622a118e00b0031ea8dc3a49sm5969774qtk.78.2022.07.11.12.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 12:27:20 -0700 (PDT)
Date: Mon, 11 Jul 2022 15:27:19 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: postmaster@kernel.org, clang-built-linux <llvm@lists.linux.dev>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [sysadmin] Fwd: Bouncing messages from llvm@lists.linux.dev
Message-ID: <20220711192719.qryq35epoko2jeii@meerkat.local>
References: <1657492202-18435-mlmmj-51d729a7@lists.linux.dev>
 <CAFP8O3+Lw0wKfWY-VA+tuAnVcjyN17E=yk6-VU5WcWG1xdH+UA@mail.gmail.com>
 <CAKwvOd=u=77MQwFeyaBbc2T0JXSESKRDNrFtiaTTuRcm6K1BPg@mail.gmail.com>
 <20220711181933.rcukzsnabiiowy7p@meerkat.local>
 <CAKwvOdmPjCWo0kjfUEamH+bBbeBK09nDcZzyKSr1ze+sVbUvcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdmPjCWo0kjfUEamH+bBbeBK09nDcZzyKSr1ze+sVbUvcA@mail.gmail.com>

On Mon, Jul 11, 2022 at 11:30:31AM -0700, Nick Desaulniers wrote:
> Any chance the error message could say something like:
> 
> The message at
> https://lore.kernel.org/llvm/0.0.3.735.1D894A7973BDB9A.0@absceraw.gazzettait.com/
> could not be delivered to you; it may be spam but you might want to verify.

Unfortunately, mlmmj doesn't give me access to the message-id of the bouncing
message (see http://mlmmj.org/docs/readme-listtexts/).

I will tweak the wording to offer a bit more explanation, though, something
like:

    Some messages to you could not be delivered. This usually happens if we
    have accepted a spam message that is being rejected by your mail host when
    we try to deliver it, but may also be due to other reasons. Please review
    the public list archives to check if you are missing any legitimate mail.

    If you're seeing this message it usually means that things are back to
    normal and no further action is required from you.

    Here is the list of the bounced messages:
    - %bouncenumbers%

-K
