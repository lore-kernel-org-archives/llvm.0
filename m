Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D77A
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 12:32:00 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id r7so9363922iot.3
        for <llvm@lists.linux.dev>; Fri, 04 Mar 2022 04:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LD6gTN1e1zlXj/t0lCkcVAaZ8PXN0Am12ReQ8fAXUPs=;
        b=e6PlMr+Ng2RXFkOsDTEEIhu/IDbXp+tbne53o6Az1rCcgVUCSmdAi5esbgyj5fhip0
         OXaYzRHIvIYTVjmHTnfWM7nV0W8zBeFEt65eLj4HHQfbYLB6FkFGXxF1mmU/wIa9JKwx
         vlqALBCvvLDGTcFP0GKIJWlAIqOSUUuJbCE57aiVO1cqEtXg6Lq9qXyVPpEC8yg8dDkk
         uK7iIZckpbA/Sf0xniKEBDK3d4UVaDthvT6On4lTEV/Q+vlIGmp5kmqBYiGrB0On/mDN
         36H+CTOHGEheF9h3F78UPrIVSks/dNl4rBMufzgNrbxLkc0zSKqLV5vif1SLMmJZIrcA
         RhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LD6gTN1e1zlXj/t0lCkcVAaZ8PXN0Am12ReQ8fAXUPs=;
        b=fMcoD6C0JuncmbtrnGDxFzvudejodIbpI4GNtFM17DuKHvpx7/rQf9vzncSQxobVqx
         /C7arR2UQr6dFlKa88l9NdfgX8nE/K1/eYO8Yt4UrWGWYM/Qu87vzJyHOWu0nEmUSCqn
         6rfSYwqIvOVBTMNICfkkKuHdY/KPZ24EXWzcl4LrbqyRl0fwPlTkRfQ0Wwk+QKe6wutS
         6FhH8vCt2qPvdYdDAY09MxicSBXCZhxeAMPNSYEpwlfHlSxfqus56XOJ1b102iQjM0Nr
         VY9QQSA3BeKrvP1UDssXhRaINNSje/zSBQ36OkOHeOycaiO+nW/cKPJDBnJJ3oNaB7pc
         OW4w==
X-Gm-Message-State: AOAM530Crmqu2mkyGdx9rDOvoQ2jJqlFnODISUQXPV/WIzkrVn2GuNwc
	ZYFrIk1mZhOaU6ctHxkckyPZII+FA+GwlBmClFM=
X-Google-Smtp-Source: ABdhPJzgoS8M3g05AsBUieLPYXmV+8l+IaUmXwXDcgNemeZDL75Od1vp3aFBe6iRKW58gyU5bLS4LMxRJNvrbH9wl30=
X-Received: by 2002:a05:6638:168b:b0:314:7a8d:19d4 with SMTP id
 f11-20020a056638168b00b003147a8d19d4mr33662849jat.199.1646397119277; Fri, 04
 Mar 2022 04:31:59 -0800 (PST)
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
 <95f5be1d-f5f3-478-5ccb-76556a41de78@linux-m68k.org> <CANiq72kOJh_rGg6cT+S833HYqwHnZJzZss8v+kQDcgz_cZUfBQ@mail.gmail.com>
 <7368bc3ea6dece01004c3e0c194abb0d26d4932b.camel@perches.com>
In-Reply-To: <7368bc3ea6dece01004c3e0c194abb0d26d4932b.camel@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Mar 2022 13:31:48 +0100
Message-ID: <CANiq72noan-b84yU370wVaRRu-GX=A5X0Ocfv4uJDk2nyeR0aw@mail.gmail.com>
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
To: Joe Perches <joe@perches.com>
Cc: Finn Thain <fthain@linux-m68k.org>, Konrad Wilhelm Kleine <kkleine@redhat.com>, Tom Rix <trix@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, kashyap.desai@broadcom.com, sumit.saxena@broadcom.com, 
	shivasharan.srikanteshwara@broadcom.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, megaraidlinux.pdl@broadcom.com, 
	scsi <linux-scsi@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 4, 2022 at 5:03 AM Joe Perches <joe@perches.com> wrote:
>
> It's up to individual maintainers to each decide on what might be
> considered unnecessary churn for the subsystems they control.
>
> One argument is that churn leads to difficulty in backporting
> fixes to older 'stable' versions.
>
> I think the churn argument is overstated.

I was only pointing out that, for the global `.clang-format` file, the
style in `coding-style.rst` should be followed. Then subsystem
maintainers may override it if really needed.

I definitely agree that we should aim to have a consistent style.
However, by allowing a few exceptions, some major subsystems may start
using `clang-format` sooner.

Cheers,
Miguel
