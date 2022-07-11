Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC694692
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 19:30:44 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id t189so7853190oie.8
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 12:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/4kY8TXoAqoEA4wRkNndir03N/Gpk4JRNdwoJeuZ0aE=;
        b=erKqLdkTE/hbtdsleAU8q5N7pj+DaosVy1tigt5vl52bTBkwwSjHrH37av2jXkcjEz
         jD2QKfUFad+0uOBVUkTNwWJiSlfbhOqPOG9nq8Prh/36rXcHhbkoG6dfFzjVsbzZVoVx
         DjdI4GocaLLNO8r01+7MA0P0QysamdOJHqoeEW9KQ0rROpmAQFBawgQv0FwxUccwFnyA
         cq/ejtXldeS+/LEVnYbdpBgeVi690DmSLW6Vc9onZa0qKwtvSDymo3NKOaHiT1tG6EHo
         vlQHdaH+BWgKfdKt/Yy4wx7FqAk0MxlzzAWhREdtgcffx4ELF2OyjDcfU76x0nrt3zEN
         3Qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/4kY8TXoAqoEA4wRkNndir03N/Gpk4JRNdwoJeuZ0aE=;
        b=zjyxKJTU4ja7gnDplqF8fpcevdeXd1qrV5ltfomWpRgKP46E4LcKbkZhiz+7u2yxfK
         ynhMlPiQsnaI3BwRl6l5dXWsZdJP2a+u/9ivvwTr04yKgJ01xfowINBuacKvXrFWfF0z
         wp0SEwaX/B6cTnl9ttY+NE+b+UuJ/1ApfTCeS5W8huuKvfBORxY/PGLk//VRXWM9BNvW
         as7IJwlYX2cRFFi60Dc8UPlNE2keyQB/Q2t3rPz73kDEF0zPqeSyaOFyHpeYK+nj2i5p
         P1MMEr8uzSxKRY37LW1o93YwbLImya5rJeldr3k8RMbGcGGpfdOzb74HKoEB+RW+glvj
         JJ3A==
X-Gm-Message-State: AJIora/+TdzvYgH0iPXbIPeahL1IZZ3aVErykwOHM1KvPOTXmhJMeSDu
	II3ja8PMVdUtUGBAHx0EuwxTpyT7h/sl7RBFlwSRZw==
X-Google-Smtp-Source: AGRyM1uw9gkezwDtbv2nOUJjoz28gma8eHU16PSyg3zg3Ie4G2y4gNe/ZnYMffocunVw+7Acg1TKs3xhQfJ1kQSwq84=
X-Received: by 2002:a05:6808:4cd:b0:339:fdbe:ea4d with SMTP id
 a13-20020a05680804cd00b00339fdbeea4dmr3964295oie.229.1657567842356; Mon, 11
 Jul 2022 12:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1657492202-18435-mlmmj-51d729a7@lists.linux.dev>
 <CAFP8O3+Lw0wKfWY-VA+tuAnVcjyN17E=yk6-VU5WcWG1xdH+UA@mail.gmail.com>
 <CAKwvOd=u=77MQwFeyaBbc2T0JXSESKRDNrFtiaTTuRcm6K1BPg@mail.gmail.com>
 <20220711181933.rcukzsnabiiowy7p@meerkat.local> <CAKwvOdmPjCWo0kjfUEamH+bBbeBK09nDcZzyKSr1ze+sVbUvcA@mail.gmail.com>
 <20220711192719.qryq35epoko2jeii@meerkat.local>
In-Reply-To: <20220711192719.qryq35epoko2jeii@meerkat.local>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Jul 2022 12:30:31 -0700
Message-ID: <CAKwvOdkmy47RKjp8KeTN8L-y4jS-MtzyCCwoiBkAWHTDSixXXw@mail.gmail.com>
Subject: Re: [sysadmin] Fwd: Bouncing messages from llvm@lists.linux.dev
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: postmaster@kernel.org, clang-built-linux <llvm@lists.linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 11, 2022 at 12:27 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Mon, Jul 11, 2022 at 11:30:31AM -0700, Nick Desaulniers wrote:
> > Any chance the error message could say something like:
> >
> > The message at
> > https://lore.kernel.org/llvm/0.0.3.735.1D894A7973BDB9A.0@absceraw.gazzettait.com/
> > could not be delivered to you; it may be spam but you might want to verify.
>
> Unfortunately, mlmmj doesn't give me access to the message-id of the bouncing
> message (see http://mlmmj.org/docs/readme-listtexts/).
>
> I will tweak the wording to offer a bit more explanation, though, something
> like:
>
>     Some messages to you could not be delivered. This usually happens if we
>     have accepted a spam message that is being rejected by your mail host when
>     we try to deliver it, but may also be due to other reasons. Please review
>     the public list archives to check if you are missing any legitimate mail.
>
>     If you're seeing this message it usually means that things are back to
>     normal and no further action is required from you.
>
>     Here is the list of the bounced messages:
>     - %bouncenumbers%
>
> -K

LGTM; thanks Konstantin!

-- 
Thanks,
~Nick Desaulniers
