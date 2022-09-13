Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AF766E8
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 19:17:41 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id s9so6953172qkg.4
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 12:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=fVY7ApQzP95gFZZdtCOfQPsHwMuo++2zXYhTDqENKgs=;
        b=Y0pQdYnbry+4NLX6WgUFA2t4vEMzzbmAsbRDbjCI2RspM3k/jIT2OCIstjJVq4Fl3g
         +6S6fKSs66zOgLnAOjHrM5lOuw9G+dW1rK+6V0DXm9YkJi33INHWcPpOzwIRxK0WNFX+
         C3tvMUnu8JzTjwtL/Nq2h/tqztf14O+y+hX1OK6T7Hj3Nr3Z3Lr6BDTmVidKgiUWIG0a
         HltpnD6x+EjmV1/QgjdiErG92N5VMhQcAWjyBLaesfhNrGIwFv5Gi6fwdzGXlt5IgY9l
         OcW3H3EUr1g/3Xg/fi5nkhYrPxF0+DEQQcWJXd3V9vDKJGt5TfXR4YzklFoURrD8vrID
         K5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=fVY7ApQzP95gFZZdtCOfQPsHwMuo++2zXYhTDqENKgs=;
        b=onGBkbCUmSTFM2rFOo/wJfJH60rtsuOa+0uX1B2bnyYwK+GhLftJr724lHwJmXjq6A
         vkSKm8DDeDzmnm9IRc/UShBCoxOyPtuASSnLHQuAf6rSBB+jWdFZvVYwmDVx5Ge32XVq
         owvKbbShQm/QlHS/YL8VqKHEoCcA1yBT61QYoeQnw2LPfIKKV91Mw9ve2tfksPToM0gH
         nIFLx5qb3oiFYLQCVDuCDA/uGqqb3ltIMV0NE1nQqqWvT52OxDsAxfhme0+XdDce6dxI
         My9jnc5BcLDLjbt0Cc7l3jylCsQ6UrAmRqzDQFh612618TRnMi32SgXk1c9BumAQUvYg
         Bo0Q==
X-Gm-Message-State: ACgBeo2ad+UMNMaiTQDlabVPOVo+hVIEf9rR+mQ+BU6r5mq2HZh0xabL
	IqOd2pxbqooMT5KxoZwyuPS2xTwRccuFBaPx0A1D0g==
X-Google-Smtp-Source: AA6agR6o9rYiyZzCDvEEcvClGbbt/MDrEFBHLm07/8qrZ/cfPEyMzW9YQsS5YlpQdScFmGT9lyi5GP3Ox+liXEvI1Fo=
X-Received: by 2002:a05:620a:29c9:b0:6ce:7681:19e9 with SMTP id
 s9-20020a05620a29c900b006ce768119e9mr2436233qkp.297.1663096660934; Tue, 13
 Sep 2022 12:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220912214548.929144-1-nhuck@google.com> <3b60a44b-2868-ba93-bb0c-d937a209f03e@gmail.com>
In-Reply-To: <3b60a44b-2868-ba93-bb0c-d937a209f03e@gmail.com>
From: Nathan Huckleberry <nhuck@google.com>
Date: Tue, 13 Sep 2022 12:17:29 -0700
Message-ID: <CAJkfWY5O56kWhBa1XP4auMLEVJpn9OEi__p6oVQXSYw0ac2_7Q@mail.gmail.com>
Subject: Re: [PATCH] Staging: rtl8192e: Fix return type of rtllib_xmit
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Felix Schlepper <f3sch.git@outlook.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Looks like this has already been fixed in commit
513d9a61156d79dd0979c4ad400c8587f52cbb9d

On Tue, Sep 13, 2022 at 11:48 AM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 9/12/22 23:45, Nathan Huckleberry wrote:
> > The ndo_start_xmit field in net_device_ops is expected to be of type
> > netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> >
> > The mismatched return type breaks forward edge kCFI since the underlying
> > function definition does not match the function hook definition.
> >
> > The return type of rtllib_xmit should be changed from int to
> > netdev_tx_t.
> >
> > Reported-by: Dan Carpenter<error27@gmail.com>
> > Link:https://github.com/ClangBuiltLinux/linux/issues/1703
> > Cc:llvm@lists.linux.dev
> > Signed-off-by: Nathan Huckleberry<nhuck@google.com>
> > ---
> >   drivers/staging/rtl8192e/rtllib_tx.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
> > index 42f81b23a144..1b665afd309e 100644
> > --- a/drivers/staging/rtl8192e/rtllib_tx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_tx.c
>
> Hi,
>
> I cannot apply your patch.
>
> Applying: Staging: rtl8192e: Fix return type of rtllib_xmit
> error: patch failed: drivers/staging/rtl8192e/rtllib_tx.c:962
> error: drivers/staging/rtl8192e/rtllib_tx.c: patch does not apply
> Patch failed at 0001 Staging: rtl8192e: Fix return type of rtllib_xmit
>
> git remote show origin
> * remote origin
>    Fetch URL:
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> ...
> my branch: staging-testing
>
> Bye Philipp
