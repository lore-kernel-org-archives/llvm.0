Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4174489A7
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 17:47:59 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id c9so22717691ybf.5
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 10:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PJdZjFOGYcZr+6GORZ6uuk20no/Y1w8QVrjJZltjb1s=;
        b=sUTHKS44teHta3xPkJGc78XNjeRxZGDbLr/V4K3Ge7EQ6pEKU9jhfY3d2wYjAzjv2q
         CIT+smVVd7OH86kPq1XdMLiMDCo79dxvJ+hck5vEPmN7TIbZrqeMAAKJHz8iq2U/7cnW
         1nLse8ViCygV3VjUcuIokg28LJRmU/srFcIJVAbwvLLndtAoxbwtq5f25MILEthOBy28
         vc0JQjapyHnJZ91IqLe4QqbtjVtLyd+g4gVP7xskoySnP6nQ7D2LrDy05BZGdJsjpu1l
         9VMwGCbNEyDyXV/wAYFBNO3i4wF8H1ZdX9mZUIlt1/cPnJMEEyk4QuwuJtqGF6Mt31fj
         5Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PJdZjFOGYcZr+6GORZ6uuk20no/Y1w8QVrjJZltjb1s=;
        b=zLV0NVDcbA3m7NqBVzicvnwiXECMZAGCF3GDuy3Cy6Cv/1lCYQajaIcbz38iSzdG8D
         qKqhyoHQDycrakwtih4LQni35QUMFrDk3zrjSU3uS/v9aG7TvjS4abEdELgOX+EdlP7k
         jNOSoEUFB7w6jbuBS0VrWZQryq3x6Ov+rTCahx0TzpDi8cP1FxcgNILIhxnXsuW2BlHU
         uuegtinruJ5qnlkBJ7ZfvWCCHZ+YhcogJdVTyDc0hTUyMBk19yw+10+azUNM8BIgm8nD
         l2YLH728at3bc06zZkCQfk9laR0024za1xiwT33JwJ+3lmGqYMqxQk9b/GDpmbHryJlt
         A3tg==
X-Gm-Message-State: ACgBeo0xDEnB532KKWNbKYTWS0MmsrnsdKQDaiVfZcZ5h8VMi7USLZym
	3rOQHe6aEaY4iY+PCInSsbhNMLIg8KghPXY93gwZCA==
X-Google-Smtp-Source: AA6agR5LSKC2erPcncwbGy8sWDcg/5azUit2GOKf4rSZd4wZKv7jqVKNxbKBmKGTWWcwlAOoaHKw3TbIacOSwgw0COA=
X-Received: by 2002:a25:d487:0:b0:6a9:3faf:ca99 with SMTP id
 m129-20020a25d487000000b006a93fafca99mr3769610ybf.16.1662572878122; Wed, 07
 Sep 2022 10:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220907173903.2268161-1-elver@google.com> <20220907173903.2268161-2-elver@google.com>
 <YxjXwBXpejAP6zoy@boqun-archlinux> <CANpmjNN2cch+HDVUYLD27sF9E39RaFrCf++KN=ZZ7j0DH8VaDw@mail.gmail.com>
 <YxjYY6SJhp1PtZos@boqun-archlinux>
In-Reply-To: <YxjYY6SJhp1PtZos@boqun-archlinux>
From: Marco Elver <elver@google.com>
Date: Wed, 7 Sep 2022 19:47:22 +0200
Message-ID: <CANpmjNPpSvWH7eV38NoPSdB0Qxov2cOsvYnSCCLy_vz4GQq3fA@mail.gmail.com>
Subject: Re: [PATCH 2/2] objtool, kcsan: Add volatile read/write
 instrumentation to whitelist
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Sept 2022 at 19:45, Boqun Feng <boqun.feng@gmail.com> wrote:
>
> On Wed, Sep 07, 2022 at 07:43:32PM +0200, Marco Elver wrote:
> > On Wed, 7 Sept 2022 at 19:42, Boqun Feng <boqun.feng@gmail.com> wrote:
> > >
> > > On Wed, Sep 07, 2022 at 07:39:03PM +0200, Marco Elver wrote:
> > > > Adds KCSAN's volatile barrier instrumentation to objtool's uaccess
> > >
> > > Confused. Are things like "__tsan_volatile_read4" considered as
> > > "barrier" for KCSAN?
> >
> > No, it's what's emitted for READ_ONCE() and WRITE_ONCE().
> >
>
> Thanks for clarification, then I guess better to remove the word
> "barrier" in the commit log?

Yes, that'd be best. (I think it was a copy/paste error.)

Thanks,
-- Marco
