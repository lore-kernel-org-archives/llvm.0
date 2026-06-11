Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032BB238D52
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781195450; cv=pass; b=Gr0A/ZpzS4rItWF/N/4c8d13KUFn1XQafCelO8xrkQzgA8yV7d0Pa/OOIPuosmtXCQqZ6N0vDc8IeifR9eEy8c6nc/E1xEZkn6tKVVMZCoRIvUd+mwItZ4UlUoVkxE8OstcUZEJh1GMJ4EQdayxv6IsEZ4IKwew1RY2lS8O00Pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781195450; c=relaxed/simple;
	bh=2nbyxf80S/ptMFRJyba8LgNgyq0oU2BmImEh657hN2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyPEkYnzYHNuWcZ8AJlqK+SS/Ad/2q02Szfhpfqq80X43Baotk82K+4Re9+kbZclgoJKneTy/fEIfN58iTN2SuHMZPtIDr6GoMlPlYxY8ooPfs+rq69wvJeXq8q/fehzXBOAEFFK505cL4/6wcej7FNIYraJU2MUz4n0TUSBclQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ko5nPcIk; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ko5nPcIk"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68c32f3c6d6so21331a12.3
        for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 09:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781195446; cv=none;
        d=google.com; s=arc-20240605;
        b=PD8PuGXK+knXc+Z4acFSfUHuCFwQ4j2ras3CQNj1LwJ37a/DAkMSRcQ+2+7x+fcSG7
         xG07T2GQ7BcVh1+YgfHNwK0TXf9MYQQgHZHJcb8xx+aNdxJkM1r90pMvYD9DtaLypuY1
         HTIAF+mlYWf9f0ZHSj4jPrl/6oycaJ1SqpAyQb9X6E9YulNJ9negVy00anB9BLQsbsuO
         40VvOe6CVQ9WUMXUqM84pEHGi/0rmGDcUMuf4DvjmL2lFv6ijMrU+c9oO9DioQzMAtSX
         yVxx44jyaoYWqMwNoD8pjAFfkG1Uxl3lY3faQkV8SvqKSxX1RzVO/49MOFTBZ8z3Or8V
         BlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iheKOWFdtwPumeqiSxQOmmhC5dJ1TWCtS8vJVMwePJg=;
        fh=ruT/KVOboZme75up5PDz7j0wuqGB9FbU/XdXBSPvvbA=;
        b=Eblyycnpd2NdAcfbpgcm+GpDsoFzhu2HzP7j73qAH9FSN8veHMb5CEK7DQ84/F9rSy
         7Vtq645GR8MXQMksOocptsyi3j8tkczIJWxnhmYpKcursNKxx6lnGI6ZRsDZdhZanSYR
         FZubDmsvtgyh3e2Z1s0BYzjuEsh5fV6gWK9zBNRAFufmGgRGsxohU6lALaTBZpqCacPU
         P8yNwob9qatCrDpttW2x3IA/DIGw5rgod2JGj/bxEH/q4aZJ1udAcAHWXHjPD+ZWrkYl
         jfK8N4XhENhyOWeHTQZbIH8H3zDV67Me/fnI+eK3AspGHmS4WAcRGo7Jw+5HA2nUtYR7
         UKWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781195446; x=1781800246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iheKOWFdtwPumeqiSxQOmmhC5dJ1TWCtS8vJVMwePJg=;
        b=ko5nPcIkKvc+jrLf7ol2MG0SQh5R97XywlE5CE+rbsq/rzK5azJ7YqVd2tn328F+Bs
         CuTBpqQnOoQ9PFwBWW1eCI5SQJLyc2ds6obKC+VgGrekxv6sg1UmP+dKIg/yKzgrgkZT
         d4FaUSbsMwEiV2aPdXnahSLrrPEX5o31QthfMhVMn0bYuc0DzZCUwAM1bjXt9aCQbU1U
         HeJKjICtfWnjTVDZPCz0ELLwHgoJljU2sRQ+tIVVSzHwCDr4LOn0C3FiHju5FDOYhcUK
         Yrh02pZwZYc4MFkadqTXjIhB3IqlRPxbdfL1Ekl71P/Wjwg/FaLFwfTkHw6WkBoYbdX5
         mkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781195446; x=1781800246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iheKOWFdtwPumeqiSxQOmmhC5dJ1TWCtS8vJVMwePJg=;
        b=mhP3oO3zrAkg2M5pcE2ozf/NZ737gd/qICn5XiF1eUFSVs8+AA1miwgK/OY6s83iQE
         uZwIYRGT7Zcx9zNFuaYPHS9Zm4dYCF18ldMS1S6phBGPGaK70uNAtcobsXtZMbdlyJEH
         ku1qvyktJhzl4w5WmaWeFJ+rin+2pZmcJ/En+FRUwJTMWC0u1yRbgbCbfMAnCJxNiWel
         CGOg9FeUeaDtOwqgq391fr7Awx5ABmnB+GqfAFFGPlsmyfFAn8o0SVtL0BMjjq1c+Kjx
         MD3SUp7sO0aJzxzuJVCPcsE8WRzp0mNTF40kfEWSseFENoXD1S2tR9Yg22DNyjxB6pUM
         EPTA==
X-Forwarded-Encrypted: i=1; AFNElJ+iWAliKtH2ewgYMOPqx85dtOnNt3dlW+O16OgNWG2RdPVbYzrJ9bHCN1cxsW3eZ6iHxtFs@lists.linux.dev
X-Gm-Message-State: AOJu0YxYcWJV0AsMwALfOIvvZMEAq6raKsaajtl1lZb6wvyudrlJ134t
	S6ZKb6KU7OfsOWyCd2B3TGJdSn/rRSqI0YcQMKb7wnUZgKyXSui2Id0Eu6ynjHYyry+g22ta6lR
	XrtAR5reMUJVDkaVKzAX8VwDe9b12wEA=
X-Gm-Gg: Acq92OHBzn/T5ze0BXEIxUH53bTrvgIWATDr3OIUhzBTaGQzwQLFJfKPyXj1aOeph6d
	ntyrrK6hr4d46+xVqXzyGG8kRTgsP7onye1FPWlE18Kb1pKPa9U7+UA+lJ3vx4THTev/pA4hTXO
	ETGthZJxAB7BECfyS66k7554XHGdIX8xK2uhPgSwMpyhEnT/+Oqu0fFhUEuHOCYvqwjI+Kn6MOX
	qYFCuQnqbUQVyWYhKMEZ5QDMgLZyCOu5dwdPVdVNw3mdhM1MItjGg9vL4xE+Hoe30Txbfvuqegm
	Sx493EfjrtcH7n41C0PK7NJribqDKroIaD5orNkZYRhskWR9EdN7nkZq8ZiGozG2xK+pkCKM41P
	0nv3pDP4D8u78jLWD2g1F5Dz2RGVUjh90yqxPkye4e2hq2tUq/pmLnqjKSJtolGgfGqE=
X-Received: by 2002:a05:6402:1948:b0:687:819:545a with SMTP id
 4fb4d7f45d1cf-6930e438b2emr1819681a12.25.1781195446025; Thu, 11 Jun 2026
 09:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611035245.13439-1-rosenp@gmail.com> <20260611035245.13439-3-rosenp@gmail.com>
 <airSHmdtCg5yWn0X@lizhi-Precision-Tower-5810>
In-Reply-To: <airSHmdtCg5yWn0X@lizhi-Precision-Tower-5810>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 11 Jun 2026 09:30:34 -0700
X-Gm-Features: AVVi8CeqeKhQJh1oE_uJdumUn9r0WFmAfFwWPafkU5F8prKElzOIcB4MnkuaMOg
Message-ID: <CAKxU2N9bMeuOKBDOXB=bFFkiNTZh-ZQFE6CSC5FZ_p6ygo9zZw@mail.gmail.com>
Subject: Re: [PATCHv4 02/15] dmaengine: fsldma: drop desc_lock before invoking
 client callback
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Zhang Wei <zw@zh-kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:FREESCALE DMA DRIVER" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 8:20=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Wed, Jun 10, 2026 at 08:52:32PM -0700, Rosen Penev wrote:
> > fsldma_run_tx_complete_actions() calls dmaengine_desc_get_callback_invo=
ke()
> > while still holding chan->desc_lock.  If the client submits a new
> > transaction from their completion callback, fsl_dma_tx_submit()
> > tries to acquire the same non-recursive spinlock, causing a
> > self-deadlock.
> >
> > Fix by extracting the callback info under the lock, removing the
> > descriptor from ld_running, dropping the lock, then invoking the
> > callback and running dependencies outside the lock.
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/fsldma.c | 108 ++++++++++++++++++++++---------------------
> >  1 file changed, 55 insertions(+), 53 deletions(-)
> >
> > diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> > index 0e2f84862261..455d21d738de 100644
> > --- a/drivers/dma/fsldma.c
> > +++ b/drivers/dma/fsldma.c
> > @@ -496,16 +496,19 @@ static void fsldma_clean_completed_descriptor(str=
uct fsldma_chan *chan)
> >  }
> >
> >  /**
> > - * fsldma_run_tx_complete_actions - cleanup a single link descriptor
> > + * fsldma_run_tx_complete_actions - unmap and extract callback from a =
descriptor
> >   * @chan: Freescale DMA channel
> > - * @desc: descriptor to cleanup and free
> > + * @desc: descriptor to process
> >   * @cookie: Freescale DMA transaction identifier
> > + * @cb: returned callback information
> >   *
> > - * This function is used on a descriptor which has been executed by th=
e DMA
> > - * controller. It will run any callbacks, submit any dependencies.
> > + * Unmap the descriptor if it has been submitted and extract its callb=
ack
> > + * into @cb.  The caller must invoke the callback and run dependencies
> > + * after releasing chan->desc_lock.
> >   */
> >  static dma_cookie_t fsldma_run_tx_complete_actions(struct fsldma_chan =
*chan,
> > -             struct fsl_desc_sw *desc, dma_cookie_t cookie)
> > +             struct fsl_desc_sw *desc, dma_cookie_t cookie,
> > +             struct dmaengine_desc_callback *cb)
> >  {
> >       struct dma_async_tx_descriptor *txd =3D &desc->async_tx;
> >       dma_cookie_t ret =3D cookie;
> > @@ -514,49 +517,14 @@ static dma_cookie_t fsldma_run_tx_complete_action=
s(struct fsldma_chan *chan,
> >
> >       if (txd->cookie > 0) {
> >               ret =3D txd->cookie;
> > -
> >               dma_descriptor_unmap(txd);
> > -             /* Run the link descriptor callback function */
> > -             dmaengine_desc_get_callback_invoke(txd, NULL);
> >       }
> >
> > -     /* Run any dependencies */
> > -     dma_run_dependencies(txd);
> > +     dmaengine_desc_get_callback(txd, cb);
> >
> >       return ret;
> >  }
> >
> > -/**
> > - * fsldma_clean_running_descriptor - move the completed descriptor fro=
m
> > - * ld_running to ld_completed
> > - * @chan: Freescale DMA channel
> > - * @desc: the descriptor which is completed
> > - *
> > - * Free the descriptor directly if acked by async_tx api, or move it t=
o
> > - * queue ld_completed.
> > - */
> > -static void fsldma_clean_running_descriptor(struct fsldma_chan *chan,
> > -             struct fsl_desc_sw *desc)
> > -{
> > -     /* Remove from the list of transactions */
> > -     list_del(&desc->node);
> > -
> > -     /*
> > -      * the client is allowed to attach dependent operations
> > -      * until 'ack' is set
> > -      */
> > -     if (!async_tx_test_ack(&desc->async_tx)) {
> > -             /*
> > -              * Move this descriptor to the list of descriptors which =
is
> > -              * completed, but still awaiting the 'ack' bit to be set.
> > -              */
> > -             list_add_tail(&desc->node, &chan->ld_completed);
> > -             return;
> > -     }
> > -
> > -     dma_pool_free(chan->desc_pool, desc, desc->async_tx.phys);
> > -}
> > -
> >  /**
> >   * fsl_chan_xfer_ld_queue - transfer any pending transactions
> >   * @chan : Freescale DMA channel
> > @@ -635,22 +603,23 @@ static void fsl_chan_xfer_ld_queue(struct fsldma_=
chan *chan)
> >   */
> >  static void fsldma_cleanup_descriptors(struct fsldma_chan *chan)
> >  {
> > -     struct fsl_desc_sw *desc, *_desc;
> > +     struct fsl_desc_sw *desc;
> >       dma_cookie_t cookie =3D 0;
> >       dma_addr_t curr_phys =3D get_cdar(chan);
> >       int seen_current =3D 0;
> >
> >       fsldma_clean_completed_descriptor(chan);
> >
> > -     /* Run the callback for each descriptor, in order */
> > -     list_for_each_entry_safe(desc, _desc, &chan->ld_running, node) {
> > -             /*
> > -              * do not advance past the current descriptor loaded into=
 the
> > -              * hardware channel, subsequent descriptors are either in
> > -              * process or have not been submitted
> > -              */
> > -             if (seen_current)
> > -                     break;
> > +     /*
> > +      * Take descriptors one at a time from the front of the running
> > +      * queue.  We re-read the list each iteration so that we don't
> > +      * chase a stale next pointer across the lock-drop below.
> > +      */
> > +     while (!seen_current && !list_empty(&chan->ld_running)) {
> > +             struct dmaengine_desc_callback cb;
> > +
> > +             desc =3D list_first_entry(&chan->ld_running,
> > +                                     struct fsl_desc_sw, node);
> >
> >               /*
> >                * stop the search if we reach the current descriptor and=
 the
> > @@ -662,9 +631,42 @@ static void fsldma_cleanup_descriptors(struct fsld=
ma_chan *chan)
> >                               break;
> >               }
> >
> > -             cookie =3D fsldma_run_tx_complete_actions(chan, desc, coo=
kie);
> > +             cookie =3D fsldma_run_tx_complete_actions(chan, desc, coo=
kie, &cb);
> >
> > -             fsldma_clean_running_descriptor(chan, desc);
> > +             /*
> > +              * Remove from the running list before dropping the lock =
so
> > +              * that terminate_all cannot free this descriptor while w=
e
> > +              * call into the client below.
> > +              */
> > +             list_del(&desc->node);
> > +
> > +             /*
> > +              * Prevent dma_run_dependencies() from calling
> > +              * fsl_chan_xfer_ld_queue() while we are not holding the
> > +              * lock.  That would splice pending descriptors into
> > +              * ld_running before they have been completed by hardware=
.
> > +              * fsl_chan_xfer_ld_queue at the end of this function wil=
l
> > +              * re-evaluate the situation.
> > +              */
> > +             chan->idle =3D false;
> > +
> > +             /*
> > +              * Drop the lock before invoking the client callback, sin=
ce
> > +              * the DMAengine API explicitly allows clients to submit =
new
> > +              * transactions from their completion callback.  Otherwis=
e
> > +              * we self-deadlock on chan->desc_lock.
> > +              */
> > +             spin_unlock(&chan->desc_lock);
> > +             dmaengine_desc_callback_invoke(&cb, NULL);
> > +             dma_run_dependencies(&desc->async_tx);
> > +             spin_lock(&chan->desc_lock);
>
> Not sure if you have hardware to test it. This change is quite big. Gener=
ally,
> keep desc_lock and move these complete queue,  defer to tasklet or workqu=
eue
> run callback in in complete queue by hold complete queue's lock.
I do not. And because it is quite big, I will drop it.
>
> > +
> > +             chan->idle =3D true;
> > +
> > +             if (!async_tx_test_ack(&desc->async_tx))
> > +                     list_add_tail(&desc->node, &chan->ld_completed);
> > +             else
> > +                     dma_pool_free(chan->desc_pool, desc, desc->async_=
tx.phys);
>
> desc already removed from list, needn't hold desc_lock, you can move it
> just before spin_lock()
>
> You should use difference lock for ld_completed.
>
> Frank
>
> >       }
> >
> >       /*
> > --
> > 2.54.0
> >
