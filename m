Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CF7173
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 16:11:24 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id c6so23779206ybk.3
        for <llvm@lists.linux.dev>; Sat, 08 Jan 2022 08:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4Ba5ev7Mc37f12MPn8Bo9MNz+S3JxhJYNwMKImyhXUw=;
        b=a3jThstJlLYnbvHAmNW2d1tQIBo9SyWnd1eGYpawM1iitViaoFDW/6UOlL/+yk7i6R
         b6mgiZWN4E1IoOjiut2oiri7nP0dbt2P87rui2Omqzn/5HB4mrUiHvd355Gr84aM9h/C
         CkfWuwF2926F1cFVlrl0isEnMHrBJo2UiwNDSIiS7Gu0ZClMTESLNm5C38VCW3YBMUxC
         mV6etbLRs6IkhGxNlAfsLLLgI+pDNhIMAwVNnX+Qkwea3HX9lsuFeRzR6g0A6mMQPa0D
         EV/W+2temp4lpd4nq8ScECrvQQm4al1aNUU2EBMjfF8gaK4xddKPYpcX0RxrwzSEb9Zn
         MCTg==
X-Gm-Message-State: AOAM530b7RYo9UFmMCbaWMrVhMkk9HsKE5o2Yl2ch5LIIvgvNRbxHD8O
	EklG9Q+nFPIncPuXWJImoRV0zbWGYR8WGFbPoYM=
X-Google-Smtp-Source: ABdhPJwTT7jGLzi6Jaj1sdjbAD+HtmppUtGTcOIYx+ZJx6FdVXaBSRn3vcKzO1bYL/hFb9m1SolpNiXQX+pqMlhQwaQ=
X-Received: by 2002:a25:abe3:: with SMTP id v90mr32406661ybi.25.1641658283543;
 Sat, 08 Jan 2022 08:11:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220108143319.3986923-1-trix@redhat.com>
In-Reply-To: <20220108143319.3986923-1-trix@redhat.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Sun, 9 Jan 2022 01:11:12 +0900
Message-ID: <CAMZ6RqL4iznd+Hz_J02hheFF1xGRHo9nUzTNXGD=ey=GPA1WmA@mail.gmail.com>
Subject: Re: [PATCH] can: janz-ican3: initialize dlc variable
To: trix@redhat.com
Cc: wg@grandegger.com, mkl@pengutronix.de, davem@davemloft.net, 
	kuba@kernel.org, nathan@kernel.org, ndesaulniers@google.com, 
	Stefan.Maetje@esd.eu, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat. 8 Jan 2022 =C3=A0 23:33, <trix@redhat.com> wrote:
> From: Tom Rix <trix@redhat.com>
>
> Clang static analysis reports this problem
> janz-ican3.c:1311:2: warning: Undefined or garbage value returned to call=
er
>         return dlc;
>         ^~~~~~~~~~
>
> dlc is only set with this conditional
>         if (!(cf->can_id & CAN_RTR_FLAG))
>                 dlc =3D cf->len;
>
> But is always returned.  So initialize dlc to 0.

Yes. The actual intent is to return a length of 0 for RTR frames.

> Fixes: cc4b08c31b5c ("can: do not increase tx_bytes statistics for RTR fr=
ames")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/net/can/janz-ican3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/can/janz-ican3.c b/drivers/net/can/janz-ican3.c
> index 5b677af5f2a41..808c105cf8f7e 100644
> --- a/drivers/net/can/janz-ican3.c
> +++ b/drivers/net/can/janz-ican3.c
> @@ -1285,7 +1285,7 @@ static unsigned int ican3_get_echo_skb(struct ican3=
_dev *mod)
>  {
>         struct sk_buff *skb =3D skb_dequeue(&mod->echoq);
>         struct can_frame *cf;
> -       u8 dlc;
> +       u8 dlc =3D 0;
>
>         /* this should never trigger unless there is a driver bug */
>         if (!skb) {
> --
> 2.26.3

I missed that when writing the patch.

I thought that I did my due diligence by running a "make W=3D1"
with GCC but I did not catch the error. I should have been more
precocious and run a "make W=3D2".

Thank you.

Acked-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
