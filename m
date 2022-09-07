Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313A89A7
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 17:45:20 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id a67so10993429ybb.3
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 10:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=4UnzWTocG2iPpAqMvQabkV9NRhaTMUyHYWRKvOA4oZs=;
        b=gHOGoE/DwxYALJI33vb4pBn5j3ORXk2cd05bL54ID/21l2b2vQ0106kj6v+/9GglxM
         pcmHJzYHGHwO9x8Nw6os/zYLAAmKzINCzgmvlNFCI0MI6lcgHhRQLcmS3BnuPnBFdra4
         Y65udLpippAuS+K591wU4s+ejdivlYbrrnDG7oonBP8Gcmc1AROEiHaCaCSKPq1LhSSG
         3MKrl/CAu9SquxByAjXIo3qHbCJcJ53YMacpOrey2nTDb9AslfdrjcHvmrsIG7QPBoeK
         O4eTzn8/6J15sgvrGQ+/uTDNYUEwvz68zREbrWAVB7x1+Iroy8k8Mv7bAzta9Q/z/O3t
         EeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4UnzWTocG2iPpAqMvQabkV9NRhaTMUyHYWRKvOA4oZs=;
        b=3A9ZQuI5q/HZmRX6BE7se7hyfsgCtbsobORb9P/P0YMyY/LaYvY6rojHWk8alem2xk
         0jfniq7J/Umawtkje6/r0YiM0yk/dLmPqY3p5a7LZAdehGmh50VjVEwPFofDlVTqC4Dk
         9C3U8JQCbjbnJxVerMBcNC2FYanXAWu40aubGzanev/KJ1UBnyamJkJYbndcptBCDacK
         EHSb4fOpXDRWv5iyjgIfvS7dgfRcQ1JZUqMBhJn0eW7hkQ77lvkOgWPpLDK5Jgf7IuLj
         XFwbuQUTCgxW4mclxWu4dfYiJY6gsHljVdIzrOaW8nOw4sNsaKPBI3sBtS2FpCjlLsXv
         aHQA==
X-Gm-Message-State: ACgBeo3PYFTuW3LpbAvgMUGw3FUeReMfEDOHQP3hPXEdXsgiAEfffgN7
	h9bU8P/wpjeGEPZ5E9EvTKtgIwLa96uGs7uyEABcaA==
X-Google-Smtp-Source: AA6agR5EJfDo1S55dZcD3KuTpTr76XKXhF6Z9iRiTzeOauk5dATRDVC8XJn5mqvOcVvcK0gXefud+OOUpE0zokVNZwk=
X-Received: by 2002:a25:1e86:0:b0:68d:549a:e4c2 with SMTP id
 e128-20020a251e86000000b0068d549ae4c2mr3717220ybe.93.1662572719703; Wed, 07
 Sep 2022 10:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220907173903.2268161-1-elver@google.com> <20220907173903.2268161-2-elver@google.com>
 <YxjXwBXpejAP6zoy@boqun-archlinux> <CANpmjNN2cch+HDVUYLD27sF9E39RaFrCf++KN=ZZ7j0DH8VaDw@mail.gmail.com>
In-Reply-To: <CANpmjNN2cch+HDVUYLD27sF9E39RaFrCf++KN=ZZ7j0DH8VaDw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 7 Sep 2022 19:44:43 +0200
Message-ID: <CANpmjNO6zbVpM2rr7frvE6S9c0PLHi34O5d+9_v5k7fOxNQMHg@mail.gmail.com>
Subject: Re: [PATCH 2/2] objtool, kcsan: Add volatile read/write
 instrumentation to whitelist
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Sept 2022 at 19:43, Marco Elver <elver@google.com> wrote:
>
> On Wed, 7 Sept 2022 at 19:42, Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Wed, Sep 07, 2022 at 07:39:03PM +0200, Marco Elver wrote:
> > > Adds KCSAN's volatile barrier instrumentation to objtool's uaccess
> >
> > Confused. Are things like "__tsan_volatile_read4" considered as
> > "barrier" for KCSAN?
>
> No, it's what's emitted for READ_ONCE() and WRITE_ONCE().

And you rightly pointed out there's a mistake in the commit message I
just saw. :-)

If there's no v2, Paul, kindly perform a s/barrier//.

Thanks,
-- Marco
