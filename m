Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA03658
	for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 01:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFOQcLot"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6ce2b6cb933so2689469a34.0
        for <llvm@lists.linux.dev>; Sun, 29 Oct 2023 18:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698630754; x=1699235554; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ+pIWIK5pOKr5v7Th3ehIjIup5GsTCljwwiL98MF64=;
        b=GFOQcLot3Cq6L5gstJKd0J7h/uDqxnAt94usKSIWICLiBXUevT5zu2mUAkLhvrLiXH
         WZUnmTWBjx8mwFxfZPRaq1O1O5dLBG4QGp23LcfxBEL6SJRwFVntg2kVJ4K96WfKYdEB
         l9lau+NHw3M1cJHi81eiEDXHI29CSsF0mazVYDq5NnHShwm8uGoy8/K6iUXcfu+/jRD0
         5qTS/Ki1CBm6ZDxfrdGmyF21rBkmKsHf8N0DLWps7PbnuJPyHui6Ol0Y9X5EhbpLkGCN
         ahqobcEtSH7nn7zFv2w8WuDj0sxmNMeGmxF7ppZmTbtzgp+0P44AfBEwkQSofMwcLtC6
         kwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698630754; x=1699235554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJ+pIWIK5pOKr5v7Th3ehIjIup5GsTCljwwiL98MF64=;
        b=smgcp2NbZ647+tQxgP9vP7AnHU135mn29WbkUu+5gZ2JND2x9Hq07xrDaInXtEf6Iv
         jZ624NBevobxm/yu4NgQVGfqnftUXTqNhsPNGUOIzLbFCECRc/en1Fva3eT9/BKMm3mp
         yvd9fBn85JlDl2O6ztGWbfYglX3TWf8JWkYJ+9nWCVSe4+Yj5EKqEPxUuYMH6YAL6hU3
         gsIrHgd4p3U7jPAujEXUUDZyDMGuTiyn1/RdfUDbRgYF/lOp6KNXh541oNTcZf5JZaRu
         jYmFRi+mANyf7foUlbW/eRaHP0zmABG+Dp7oYv8sXfPJdkuVudC7te/aBf0jR60O3dI/
         pivg==
X-Gm-Message-State: AOJu0YxSV2YpKhsvr2OnSMKS/3ErD+TQRUpfA1GA7ehPaGBCj2ibEfZo
	rUuJpkr61bBC/p4jW0IZBYS9IamZqz6/hMAo2ok=
X-Google-Smtp-Source: AGHT+IGOxAwPaVwOBP/Wap5IdwrcWWEJS4GXQ0wRZqb24RIPJmCnkv6adRSjpinw61qITu6EW6YpIualSnps/Zd9aYA=
X-Received: by 2002:a05:6830:43a7:b0:6b7:30cc:6419 with SMTP id
 s39-20020a05683043a700b006b730cc6419mr10720384otv.1.1698630754290; Sun, 29
 Oct 2023 18:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231023093153.6748-1-xingxing.luo@unisoc.com> <2023102742-barmaid-doorframe-3731@gregkh>
In-Reply-To: <2023102742-barmaid-doorframe-3731@gregkh>
From: xingxing luo <xingxing0070.luo@gmail.com>
Date: Mon, 30 Oct 2023 09:52:22 +0800
Message-ID: <CANnj+8Q1-5OX1BOM_12zA2v7D38y8rJctXn2_ja71P6UkzEyfw@mail.gmail.com>
Subject: Re: [PATCH] usb: musb: Check requset->buf before use to avoid crash issue
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Xingxing Luo <xingxing.luo@unisoc.com>, b-liu@ti.com, keescook@chromium.org, 
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, Zhiyong.Liu@unisoc.com, 
	Cixi.Geng1@unisoc.com, Orson.Zhai@unisoc.com, zhang.lyra@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 6:54=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Oct 23, 2023 at 05:31:53PM +0800, Xingxing Luo wrote:
> > When connecting USB to PC, there is a very low probability of kernel
> > crash. The reason is that in ep0_txstate(), the buf member of struct
> > usb_request used may be a null pointer. Therefore, it needs to
> > determine whether it is null before using it.
> >
> > [ 4888.071462][T597@C0] Call trace:
> > [ 4888.071467][T597@C0]  musb_default_write_fifo+0xa0/0x1ac [musb_hdrc]
> > [ 4888.087190][T597@C0]  musb_write_fifo+0x3c/0x90 [musb_hdrc]
> > [ 4888.099826][T597@C0]  ep0_txstate+0x78/0x218 [musb_hdrc]
> > [ 4888.153918][T597@C0]  musb_g_ep0_irq+0x3c4/0xe10 [musb_hdrc]
> > [ 4888.159663][T597@C0]  musb_interrupt+0xab4/0xf1c [musb_hdrc]
> > [ 4888.165391][T597@C0]  sprd_musb_interrupt+0x1e4/0x484 [musb_sprd]
> > [ 4888.171447][T597@C0]  __handle_irq_event_percpu+0xd8/0x2f8
> > [ 4888.176901][T597@C0]  handle_irq_event+0x70/0xe4
> > [ 4888.181487][T597@C0]  handle_fasteoi_irq+0x15c/0x230
> > [ 4888.186420][T597@C0]  handle_domain_irq+0x88/0xfc
> > [ 4888.191090][T597@C0]  gic_handle_irq+0x60/0x138
> > [ 4888.195591][T597@C0]  call_on_irq_stack+0x40/0x70
> > [ 4888.200263][T597@C0]  do_interrupt_handler+0x50/0xac
> > [ 4888.205196][T597@C0]  el1_interrupt+0x34/0x64
> > [ 4888.209524][T597@C0]  el1h_64_irq_handler+0x1c/0x2c
> > [ 4888.214370][T597@C0]  el1h_64_irq+0x7c/0x80
> > [ 4888.218525][T597@C0]  __check_heap_object+0x1ac/0x1fc
> > [ 4888.223544][T597@C0]  __check_object_size+0x10c/0x20c
> > [ 4888.228563][T597@C0]  simple_copy_to_iter+0x40/0x74
> > [ 4888.233410][T597@C0]  __skb_datagram_iter+0xa0/0x310
> > [ 4888.238343][T597@C0]  skb_copy_datagram_iter+0x44/0x110
> > [ 4888.243535][T597@C0]  netlink_recvmsg+0xdc/0x364
> > [ 4888.248123][T597@C0]  ____sys_recvmsg.llvm.16749613423860851707+0x35=
8/0x6c0
> > [ 4888.255045][T597@C0]  ___sys_recvmsg+0xe0/0x1dc
> > [ 4888.259544][T597@C0]  __arm64_sys_recvmsg+0xc4/0x10c
> > [ 4888.264478][T597@C0]  invoke_syscall+0x6c/0x15c
> > [ 4888.268976][T597@C0]  el0_svc_common.llvm.12373701176611417606+0xd4/=
0x120
> > [ 4888.275726][T597@C0]  do_el0_svc+0x34/0xac
> > [ 4888.279795][T597@C0]  el0_svc+0x28/0x90
> > [ 4888.283603][T597@C0]  el0t_64_sync_handler+0x88/0xec
> > [ 4888.288548][T597@C0]  el0t_64_sync+0x1b4/0x1b8
> > [ 4888.292956][T597@C0] Code: 540002c3 53027ea8 aa1303e9 71000508 (b840=
452a)
> > [ 4888.299789][T597@C0] ---[ end trace 14a301b7253e83cc ]---
> >
> > Signed-off-by: Xingxing Luo <xingxing.luo@unisoc.com>
> > ---
> >  drivers/usb/musb/musb_gadget_ep0.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/usb/musb/musb_gadget_ep0.c b/drivers/usb/musb/musb=
_gadget_ep0.c
> > index 6d7336727388..5d0629866128 100644
> > --- a/drivers/usb/musb/musb_gadget_ep0.c
> > +++ b/drivers/usb/musb/musb_gadget_ep0.c
> > @@ -531,6 +531,11 @@ static void ep0_txstate(struct musb *musb)
> >
> >       request =3D &req->request;
> >
> > +     if (!requset->buf) {
> > +             musb_dbg(musb, "request->buf is NULL");
> > +             return;
> > +     }
> > +
> >       /* load the data */
> >       fifo_src =3D (u8 *) request->buf + request->actual;
> >       fifo_count =3D min((unsigned) MUSB_EP0_FIFOSIZE,
> > --
> > 2.17.1
>
> This patch does not even build, how did you test it?
>

I have verified this patch on our platform, which is unisoc, and it
can fix the kernel crash problem. However, it seems that there is a
spelling error in this patch, I will fix it in the next version.

> And what commit id does this fix?

commit id: 550a7375fe720924241f0eb76e4a5c1a3eb8c32f

>
> thanks,
>
> greg k-h
