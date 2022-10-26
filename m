Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04538495
	for <llvm@lists.linux.dev>; Wed, 26 Oct 2022 17:50:57 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 192so8955959pfx.5
        for <llvm@lists.linux.dev>; Wed, 26 Oct 2022 10:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T2h24MH4MSet5fkWfX3uTwFzD+dW0H4QpEU+raKyOqA=;
        b=ivQLeLZ7BsAExAyxGKVCHq+ccRyYQoBFMoIYAhYmWOheKCynITfHW9wcE8cvx+bO+i
         RvtQSLcZWGZh11U0y8Qy00JtpimkdWsDkS0vht2EbaGibQZa2l4Sln0asdhIuo8SW9mV
         Jm1iuymvdc2KMSPY841iuEU6eyMeimXob4i77baN0WHc01RQl+YWuQh9CBZPYc5wYeld
         IsPzJQg1aOzj2kv9GnFc0Vg6VjeRv+EBwfE7eioqhDCl1Iw2Q/YtN38pHCVZAzk8kXne
         t6fS70VEdGXLJajYsWtPLlLN5VgOP8hu4Wuy809RVGWWCtoEb8kVK3IcYbDtMabO7dV+
         Fr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2h24MH4MSet5fkWfX3uTwFzD+dW0H4QpEU+raKyOqA=;
        b=pQHiOWYrn/xDFv6Q5WOjbJHAUjEXmX/htXmpNRjZuFOpXDqwRfHzT9tBZrNg46K6bS
         eHNKXUjGJw7q6P1Fn/oUNS448XWdNfJTd85k48K7PyY4e+d0WPjqryPlph/uh4faPWJr
         X3FBFN6xhFnSNxYClQbwNiN9hBl0PAUo6Qd5K8vm5q6qNt3voXB654kM7i5yJF32Er61
         WZ2HiW2Xyp6n3llSxp418TreM0L4AT5iGm4+k4KDqOJ9oiqyb9rpMFcu4jKvl0ckol1c
         yTWSitC5PfBxUpJnJfU2Ky4X0TH5WPm8Lup+gavsAW/ii6zScT7SDAXR1shaxlxOlR+S
         P3AA==
X-Gm-Message-State: ACrzQf0LBcKpCSlFn1yx6Rwot/lc+uJNw/g0E+SpqFjJBkbKnUWyUsJE
	GbKqPbLcpsX5dYt7utryWeXUkP/5aAcmuABwmerJsQ==
X-Google-Smtp-Source: AMsMyM46VDtfzl95K+DwkdIa1+TlZcE/UPAk9Yg5rP8k+RWwHCoiFIRmvTiAHL4HsfKsaUjxj/wh7ktvYCdsXWbq5U0=
X-Received: by 2002:a63:2cd2:0:b0:41c:5901:67d8 with SMTP id
 s201-20020a632cd2000000b0041c590167d8mr38428132pgs.365.1666806657224; Wed, 26
 Oct 2022 10:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdneUW4e9==CABAk68uePCGNt7Sq6P-84tR41HRB23zFTA@mail.gmail.com>
 <Y1gUoS73T4nycQwr@dev-arch.thelio-3990X>
In-Reply-To: <Y1gUoS73T4nycQwr@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 26 Oct 2022 10:50:45 -0700
Message-ID: <CAKwvOdkR6Xb4LeJM6K4g-Vdyg9=osfjwphvJzmGxkQa33zqcVQ@mail.gmail.com>
Subject: Re: backports of 32ef9e5054ec ("Makefile.debug: re-enable debug info
 for .S files")
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "# 3.4.x" <stable@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Alexey Alexandrov <aalexand@google.com>, 
	Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 25, 2022 at 9:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Oct 24, 2022 at 02:06:52PM -0700, Nick Desaulniers wrote:
> > Dear stable kernel maintainers,
> > Our production kernel team and ChromeOS kernel teams are reporting
> > that they are unable to symbolize addresses of symbols defined in
> > assembly sources due to a regression I caused with
> >     commit a66049e2cf0e ("Kbuild: make DWARF version a choice")
>
> I think you mean commit b8a9092330da ("Kbuild: do not emit debug info
> for assembly with LLVM_IAS=1"), which is what you blamed in
> 32ef9e5054ec? a66049e2cf0e does not appear to have any affect on this
> problem?

Ah right, grabbed the wrong sha from the commit messages.

Not an issue in the patches, just the initial email I sent. Should
still be good for stable maintainers to pick up.

>
> > I fixed this upstream with
> >     commit 32ef9e5054ec ("Makefile.debug: re-enable debug info for .S files")
> > but I think this is infeasible to backport through to 4.19.y.
> >
> > Do the attached branch-specific variants look acceptable?
>
> I think the stable specific versions should be okay. We should be able
> to deal with any fallout that happens if there is any.
>
> Acked-by: Nathan Chancellor <nathan@kernel.org>

Thanks for triple checking!
-- 
Thanks,
~Nick Desaulniers
