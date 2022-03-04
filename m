Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07AF7A
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 14:02:38 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id k7so6577482ilo.8
        for <llvm@lists.linux.dev>; Fri, 04 Mar 2022 06:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZzBK5WA3QVrcuQnQd4ntSERHlUAQ+GXLljw8Z7OoM1w=;
        b=gql0/NZ9ElEaLpJcoudiGif5RN5qPMlJiaKX7m517j2VwmaKvsNpJNz6gM45g/JcS9
         rsA5xoUm06axa8boCk+7Xp850UdRUPuMKH5xG6Lkut3tfvpxqOLjyEUEhItI9Cx/ADrs
         Wa6gHbviGEDvLPDtQ5jcEv+3U4ZB0hLc9bgvVIv6h5jbsZCec8FFoNLo5KjnbOvdvqIc
         meJk1l1uqgbFn3BjJoiTQhsNYBAAhUH7VyPFDg1S1U7FsKsO+Di1Wgc9Ka21lL0oStys
         Hi3CztQlo27qYQ4BSVxZhEp8tOJwTETLgG2xBJGMOnjtUmXbWCHca00E0YAZ7GnulxTp
         aI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZzBK5WA3QVrcuQnQd4ntSERHlUAQ+GXLljw8Z7OoM1w=;
        b=tV1WrHivXRSZZwxa0DL04Im60VkFDi3LjzhxwtCe38OS9bLIIaDSLOGB+uXo+LS/Iz
         3Y9+1luRzNVtBwsHDIW7e6GZH9/RvIti56jrPhxOJdSAQuxZyczNgVqtP//OtXH5dcIQ
         p3nbLubPO/kn57LQuBKmYt9mnNnAo+RqojEpMbKdMf1CjARYMDEd9efOLNOFNrUC6R/w
         YomZiAEwTtFLl3a+NwBmDtmvimot+dNZlEdbgd2fEpS9ONuBFAfstcgvQg1jv+K3BM5Y
         gIeZ3VFTiau30dsoNTwScDVz8vDUY5IVSLMoJwE77EMC58wfKFWh2qecPbbH0nFkomBb
         Ukcw==
X-Gm-Message-State: AOAM532pLrAHgzYlreYa/5fjr8teWiH8fqvQiSzli3tkMFFaxiV6biI2
	9T3L43ycBT29S2rRC1+v9d3MX4LVDvIklpoyY/Y=
X-Google-Smtp-Source: ABdhPJwN3WEErb2vH6B5dP6UVI1dEFWdcimvNqhP0CYrCi0JEKnjM0RGkRw2NrXmb/cu+Z/9c+O/3Qw3B9+ytktZl+E=
X-Received: by 2002:a05:6e02:198b:b0:2c2:c454:ea7 with SMTP id
 g11-20020a056e02198b00b002c2c4540ea7mr27132602ilf.151.1646402557663; Fri, 04
 Mar 2022 06:02:37 -0800 (PST)
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
 <7368bc3ea6dece01004c3e0c194abb0d26d4932b.camel@perches.com> <9dc86e74-7741-bb8e-bbad-ae96cebaaebc@redhat.com>
In-Reply-To: <9dc86e74-7741-bb8e-bbad-ae96cebaaebc@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Mar 2022 15:02:26 +0100
Message-ID: <CANiq72nsKijH4zgLoEpiiq4462r1zYmaiDs13SEHDYR3aQziUw@mail.gmail.com>
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
To: Tom Rix <trix@redhat.com>
Cc: Joe Perches <joe@perches.com>, Finn Thain <fthain@linux-m68k.org>, 
	Konrad Wilhelm Kleine <kkleine@redhat.com>, Bart Van Assche <bvanassche@acm.org>, kashyap.desai@broadcom.com, 
	sumit.saxena@broadcom.com, shivasharan.srikanteshwara@broadcom.com, 
	jejb@linux.ibm.com, martin.petersen@oracle.com, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	megaraidlinux.pdl@broadcom.com, scsi <linux-scsi@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 4, 2022 at 2:46 PM Tom Rix <trix@redhat.com> wrote:
>
> The churn level will be very high.

Nobody is planning to reformat the entire kernel, at least not until
the tool is close enough to the kernel style, which will take a while.

> Until clang-format has an opt-in mechanism, I do not think clang-format
> should be used.
>
> .clang-format should be moved to staging/ to reflect its not being ready
> status.

What is not ready about it?

It is a fairly useful tool that some people is already using, either
for full file formatting or for sections within their editor.

Cheers,
Miguel
