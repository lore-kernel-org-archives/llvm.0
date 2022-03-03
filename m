Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD98E4297
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 23:17:37 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id j5so5281961ila.2
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 15:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IunjLamQyiN4ktCSVGqQoYbINqbAWtg7y28TD4hVajw=;
        b=WdEq8Z/fW+RL+Ej4Z4MFuld6ZS/v8HLUbxQGRncbLZD49oQmlx/ygy9YpL76W4YMdG
         dPTLPRcfVspo2oDtOcXWrBJGSLhVKZX4Tgv+EaQaDXxg8aILtMholWijNBkhpdkyukq9
         /nmmMX4v5JORNe4LrGEY/f6RR4w0MsbZuj2V6VmtsZHrn8npzp4URUBhvys6mnUKUBn3
         gQ5nCmY+DKZQm1yACzBkMPDp25V6e7YdkHZe/ebB9G0ktfy1tjmDfMkP9mslH4f36AOG
         SmMICNRXWvf2YisP9UZx/ntekFAJBNN0LjJqH5dNr3jwP4+i4rqCC+vU28v9Ds5TS7Ad
         /VfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IunjLamQyiN4ktCSVGqQoYbINqbAWtg7y28TD4hVajw=;
        b=Wetbh/tNN2dr+DPjwQAA2gNFKwrzuK4jtJEaM9yjF9Qi8sc9meuGwBlzKD86/GHmsD
         WIV60c3cjMykjJdv0bEuxNzTpOY8TQpAuiCd6qrUUHwzMkfm1dly8HsrKOLuygZtKSWq
         74l5pdHk1qzUtRxkJfgwk3ixCIhD91RHEK0Q8jYRvovjhgQ4K4Mas2U0EhH2Q9Vjiu7W
         a6ajOVzIW4Waga4eOVrFOKitXHG9HTgz07fJS1a4ktEP57ZuE2Bx+EVLr1JAejecxQms
         tuODoKkrOdoLYcwDfC0yFBSPorrAMdaJ312wSC/VeOIgtApHRU98YCHvozdyXVgMiSN5
         WYLg==
X-Gm-Message-State: AOAM530Pw/dTWptn34CV3K9Mcl/y1mtIWjShqcJGtW9HlqYy5Ene4kkY
	XRv6ig1JTcQS1blPwn+QBIZyl76+gg8rnu076zE=
X-Google-Smtp-Source: ABdhPJxi8VypfVGr9Khjx8L28LU1hG/qzef02DaLMAkHfbs2sOCVurtw7fWFOlTYy2xjj36m0p2movbsKHKZ2XFic4Q=
X-Received: by 2002:a92:c908:0:b0:2c1:a287:8868 with SMTP id
 t8-20020a92c908000000b002c1a2878868mr32170001ilp.321.1646349456482; Thu, 03
 Mar 2022 15:17:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220127151945.1244439-1-trix@redhat.com> <d26d4bd8-b5e1-f4d5-b563-9bc4dd384ff8@acm.org>
 <0adde369-3fd7-3608-594c-d199cce3c936@redhat.com> <e3ae392a16491b9ddeb1f0b2b74fdf05628b1996.camel@perches.com>
 <46441b86-1d19-5eb4-0013-db1c63a9b0a5@redhat.com> <8dd05afd-0bb9-c91b-6393-aff69f1363e1@redhat.com>
 <233660d0-1dee-7d80-1581-2e6845bf7689@linux-m68k.org> <CABRYuGk+1AGpvfkR7=LTCm+bN4kt55fwQnQXCjidSXWxuMWsiQ@mail.gmail.com>
 <95f5be1d-f5f3-478-5ccb-76556a41de78@linux-m68k.org>
In-Reply-To: <95f5be1d-f5f3-478-5ccb-76556a41de78@linux-m68k.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Mar 2022 00:17:25 +0100
Message-ID: <CANiq72kOJh_rGg6cT+S833HYqwHnZJzZss8v+kQDcgz_cZUfBQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
To: Finn Thain <fthain@linux-m68k.org>
Cc: Konrad Wilhelm Kleine <kkleine@redhat.com>, Tom Rix <trix@redhat.com>, Joe Perches <joe@perches.com>, 
	Bart Van Assche <bvanassche@acm.org>, kashyap.desai@broadcom.com, sumit.saxena@broadcom.com, 
	shivasharan.srikanteshwara@broadcom.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, megaraidlinux.pdl@broadcom.com, 
	scsi <linux-scsi@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 3, 2022 at 11:44 PM Finn Thain <fthain@linux-m68k.org> wrote:
>
> Others might argue that they should always be changed from,
>
> /*
>  * this style
>  * of multiline comment
>  */
>
> to
>
> /* this style
>  * of multiline comment
>  */

In general, for things that the coding style guide talks about, we
should follow them, even if some subsystems do not (they can always
override in their folder if they really, really want it). So, here for
instance, the first one should be used.

Cheers,
Miguel
