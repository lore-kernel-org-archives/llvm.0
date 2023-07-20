Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DFA1FB0
	for <llvm@lists.linux.dev>; Thu, 20 Jul 2023 06:25:17 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51e590a8ab5so496787a12.2
        for <llvm@lists.linux.dev>; Wed, 19 Jul 2023 23:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689834316; x=1690439116;
        h=cc:to:subject:message-id:date:from:sender:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JNL4l5GRlHwxV4ntRBz/satLVd2URGo3WiWHTSW6eE4=;
        b=QSIEs6AVNYFv9z7/VkvFN6axf4NcXNTrxvEwfbAuZA0WcfDW38zoK9JiXytigKHeC5
         DYrGbL81QYKlCI3xxV2RkC77wi61QADL6LviFW9H11F/dPugFW7xEmVX+QjEXU1feoVD
         r/iGgnqx5NWyBUmW3RjUTvFEQdxnxtgYgIylX3zuVgOSCcn3FbbI6ZrikCDtfGGw0SzM
         GlA76rMc2dAxDSVfmtfttYx25yhlC3DcZSusFga55N33uy9Dghfn6kFirVqYwJHUS1G5
         rHe56vsX6IiWWtJR/I0a6iP9g4YPMWImyJ81ITLfzqgoHcJ60W4jLbJbry35YY68TR/O
         6BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689834316; x=1690439116;
        h=cc:to:subject:message-id:date:from:sender:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNL4l5GRlHwxV4ntRBz/satLVd2URGo3WiWHTSW6eE4=;
        b=DfzrfHw1tBELNvf9gNjUtahKiXtkhmCtdarpwhqH5x1+Z4yeNDgH0tQN6Jb9rRql/+
         5xVZR3ACQNooBuQfoBLGxJqjqcNg8WXf0WC3dZR9ELuy1CO9ffPIkl6toTdY4x/MlPCO
         73fEQMrGc2Hn+12hsVCYS5m04yNzydamjYJtDB6lZOWbhU/JZTcGQsEOyy1syut3No7q
         U5KP9zjrv9xmBpyAN7w2Vlx6gBwkgWom9roRHOLCy5IVo8rZD/1p9DdhtKUN/5hHBX//
         nPqRlcmQ68AU+BKHCG2ILzcTzhhGm3wfBi3bot0IqqynjscCr650b6Qut9ziCCNgv/wF
         t40g==
X-Gm-Message-State: ABy/qLZqmwCVEk1UbR3dU07yTjjrfp0uv0jDEzSN1n9FpSqlcbfngLeL
	3Z2We3xCp0iw9X1j9EZm45JwCEpqUIpvCBQkWYc=
X-Google-Smtp-Source: APBJJlEAekAGm8b9heA5DHCrx/MiGSEyvtwHTkQ52PeIUjOZOspIHL6dE4HhuM/FqIfVA4Wld5gYo5iknBjb+B6hYbg=
X-Received: by 2002:aa7:c38a:0:b0:51e:36b8:34fa with SMTP id
 k10-20020aa7c38a000000b0051e36b834famr3973631edq.4.1689834315425; Wed, 19 Jul
 2023 23:25:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <tencent_8D245D1A87D17619EA8475E8F005A151000A@qq.com>
 <65f4c60a-9534-56dc-099f-ee7a96e0ccaf@redhat.com> <20230712235813.GE6354@monkey>
 <CAKdjhyD4RVHFVLrcfcuEnvwrjjxAk_GL=kjcm1iw3WTrmmFb9Q@mail.gmail.com>
 <6c3191e1-23fd-4f9e-9b5e-321c51599897@moroto.mountain> <20230719232248.GC3240@monkey>
In-Reply-To: <20230719232248.GC3240@monkey>
Sender: cl1ntlov3@gmail.com
X-Google-Sender-Delegation: cl1ntlov3@gmail.com
From: linke li <lilinke99@gmail.com>
Date: Thu, 20 Jul 2023 14:25:03 +0800
X-Google-Sender-Auth: vNNFw5NqUWJumSZdCdnOBZIRxbk
Message-ID: <CAKdjhyA68LEs07UQA9my66ue4V=o_2EEHxsWC_ZKxdnc+uZqKA@mail.gmail.com>
Subject: Re: [PATCH] hugetlbfs: Fix integer overflow check in hugetlbfs_file_mmap()
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Linke Li <lilinke99@foxmail.com>, 
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, trix@redhat.com, ndesaulniers@google.com, 
	nathan@kernel.org, muchun.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

> > What about using the check_add_overflow() macro?
>
> I like the macro.  It seems to have plenty of users.
>
> Linke Li, what do you think?  If you like, please send another path
> using the macro as suggested by Dan.

Thanks for Dan's advice. I have tested this macro in gcc-9 and clang-14, it
can work well in both compilers and regardless of whether "-fno-strict-overflow"
 is added or not.

I will send a new patch.

Best Regards
