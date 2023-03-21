Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524801FB8
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 07:04:09 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id c29so403845lfv.3
        for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 00:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679382247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tbyVoCIUkuwnDzcG32W4OdMDrXEIavgnsGn9li74v8=;
        b=yChraET9/arxywpaBm0uIpGnJjZC7VyiDllMVup03dJnlPiufNi9e3Nzj2lf+ZHniA
         sfwe1q/uW22fPn+PDlUaZSzwboQs/dLxeD6coJsXjg1Vc6agsTpqORr3LtFwF6JzIPwS
         bqM9PvVbLgTH5uQBOty43tuqXiJXsgs4tN907D7qyHAw+cT2oOYwX7soOdk+dRUe1u5H
         5rA5sBjs4q/+BUOf9PhruG/zel79U8rHZVf54CyRIyAXuyRBJoDYrXZAHiEZ7OZBa87E
         Odw6OVcnAPoed2CfhtSRhJgjoCweO0W2ieWzkyFD8CzN+/R9DNN9s9h4WXnPc4u+Ydme
         JK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679382247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tbyVoCIUkuwnDzcG32W4OdMDrXEIavgnsGn9li74v8=;
        b=h8rnJsWXWuIkZTxxlpdulZaH6kee/MXJB145F/eQQhhywp7lM6ZEoaC31U+ttY0NSp
         HVG1LOqSovyjE2Kvk0g2pb7QqLngjIO2njOFn6VjrVtgO7RtY3lhtS84224APe1gaUws
         9AlB3OslzNMyjKMhcqHa044Ibop0rl2bKjz7ighK9QTYlGXqY0R7IyGgCQ2zC+aS5CCz
         fJN80bXbLgbsekruFyYICZ/GfcwMXXOSUYnVMiK59TeGFwBgbO/MgCKpDHTv+gkN/m6Z
         tO+rUmJT21/Jige/AYKVxauwDCTo0Q4yLozqzPstCgvjezQrf5Z1VFbHJIABBPlEQybi
         QUuw==
X-Gm-Message-State: AO0yUKVPYOzNVQRXNfkM9068UKZtZomUrmY/imzA/vZuI9WrJeGady53
	XawbDapEPTz547CtUaBhIAC5PSqPhx6RnBedxK74sA==
X-Google-Smtp-Source: AK7set9T3I8GA2uJOUQygr+w4BX+oII8CcfEQqUcpktFtsWlC8MeRy03+La5618HVmKpwn5tRsvyiGGX13XsEv0bYdA=
X-Received: by 2002:ac2:41c6:0:b0:4d5:ca43:704a with SMTP id
 d6-20020ac241c6000000b004d5ca43704amr476391lfi.13.1679382247216; Tue, 21 Mar
 2023 00:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230319133732.1702841-1-trix@redhat.com>
In-Reply-To: <20230319133732.1702841-1-trix@redhat.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 21 Mar 2023 15:05:07 +0800
Message-ID: <CABymUCMha=XE_=LDNXiJDzhNCpGU4bckuNkoCAmb_bWO8bPu0w@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tipd: remove unused tps6598x_write16,32 functions
To: Tom Rix <trix@redhat.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	nathan@kernel.org, ndesaulniers@google.com, sven@svenpeter.dev, 
	agx@sigxcpu.org, Jonathan.Cameron@huawei.com, u.kleine-koenig@pengutronix.de, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tom Rix <trix@redhat.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=8819=E6=97=A5=E5=91=
=A8=E6=97=A5 21:37=E5=86=99=E9=81=93=EF=BC=9A
>
> clang with W=3D1 reports
> drivers/usb/typec/tipd/core.c:180:19: error: unused function
>   'tps6598x_write16' [-Werror,-Wunused-function]
> static inline int tps6598x_write16(struct tps6598x *tps, u8 reg, u16 val)
>                   ^
> drivers/usb/typec/tipd/core.c:185:19: error: unused function
>   'tps6598x_write32' [-Werror,-Wunused-function]
> static inline int tps6598x_write32(struct tps6598x *tps, u8 reg, u32 val)
>                   ^
> These static functions are not used, so remove them.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/usb/typec/tipd/core.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
Reviewed-by: Jun Nie <jun.nie@linaro.org>
