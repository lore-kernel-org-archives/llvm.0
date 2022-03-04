Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917E7C
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 18:48:37 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id d19so10567269ioc.8
        for <llvm@lists.linux.dev>; Fri, 04 Mar 2022 10:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NZVqR2IXuPYi/CmafDbS5W6yfPjJBN8Q1wn/cKiQemY=;
        b=fR7l0zn8xJNMq3ZimB+MotJrfmWksw5FUbuKX8xZ0KrU81Er3UcSQr8Xz4fO32Vwbg
         Nu2Js1VOxv0PA6FZIG279vnxnytdo6BMI0fUwdBcYrZWEpTR0zhmzVWQU8rQGcquEg/Y
         d22VOQF6SO2u2GzyC6roO8Le49UQBMgxQaxX1xT3xNKRB57pbnU2e1r2R1nik0ynqq2g
         dJWfq0S7irxYaPdbuugyp2Q7aYuhjL4y8y7815ItnrHQiBvG1qteJNAOdfvHNdNz68r6
         4VSxq37S4cm8QehTxMrQiWGYhtaUE0h5th6ntso3uMwaC0yK0kJJ5MsJHxb7gMZR+9b8
         axng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NZVqR2IXuPYi/CmafDbS5W6yfPjJBN8Q1wn/cKiQemY=;
        b=cN6NGkHEsGKmUYFTX8v33GIZAqe4RYGnZU+wp8WhCS8ZQ+X2na2lWsuAx++fX2wfFB
         j6ptt6bQrez9ZOtKrrT77DhAOTCW4lxVQpk8d3StVFS7L60HVwtjyFj6X8zKOooIVc/r
         17jJKWxLngrMVqUDh1grtlnWzL5rZ7Lgutsk+1kMPhcWKiLQPd8b+TLvDcEFQhxtj73A
         ZmE4ng6aHYrctOER9OnXMGEmZ0tXejWKaJQVIjzko8plsVQYO1OSWxyJwXq+uUMaCLbV
         PCIr2kijuuU50zciM3TTXgcpy5N/cLAaC8ts1rPjBtiF/oqHluCyC44XvLwZHki8Mged
         l9QQ==
X-Gm-Message-State: AOAM532DOeGYYKo/Tg4Fob3fPzfRbviCH6E1uupjylim71v/QnWAaA60
	xwdLgj9iqpmDayfigDMn8ocZxTxKf6LJr9Vc+tE=
X-Google-Smtp-Source: ABdhPJy63i/BlI2iCbWovC/qOl03K/3nFIt5/6OUfXFTorzmrGEY769OhKk8AcXgjvay/k1hXPrVLapa0NAo6BScxtY=
X-Received: by 2002:a05:6602:15c6:b0:611:591d:1d9a with SMTP id
 f6-20020a05660215c600b00611591d1d9amr31562359iow.177.1646419716803; Fri, 04
 Mar 2022 10:48:36 -0800 (PST)
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
 <9dc86e74-7741-bb8e-bbad-ae96cebaaebc@redhat.com> <CANiq72nsKijH4zgLoEpiiq4462r1zYmaiDs13SEHDYR3aQziUw@mail.gmail.com>
 <ad3567301af7b1b24cf4ac447fec8d618231ea33.camel@perches.com>
In-Reply-To: <ad3567301af7b1b24cf4ac447fec8d618231ea33.camel@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Mar 2022 19:48:25 +0100
Message-ID: <CANiq72kWJtOTmcXNO+t4NY22v6xM49Z-U2aSB4apNd96PYbD4Q@mail.gmail.com>
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
To: Joe Perches <joe@perches.com>
Cc: Tom Rix <trix@redhat.com>, Finn Thain <fthain@linux-m68k.org>, 
	Konrad Wilhelm Kleine <kkleine@redhat.com>, Bart Van Assche <bvanassche@acm.org>, kashyap.desai@broadcom.com, 
	sumit.saxena@broadcom.com, shivasharan.srikanteshwara@broadcom.com, 
	jejb@linux.ibm.com, martin.petersen@oracle.com, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	megaraidlinux.pdl@broadcom.com, scsi <linux-scsi@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 4, 2022 at 6:37 PM Joe Perches <joe@perches.com> wrote:
>
> I rather doubt clang-format will ever be 'close enough'.
>
> A human's sense of 'taste' for reading code is very different than
> what an automated tool produces.

Maybe, but it is a trade-off. If it is close enough, the benefits of
automatic formatting may overcome the downsides.

> Also, try looking at the changes clang-format does on a file chosen
> at random:
>
> o columnarized definitions -> not columnarized
> o odd line continuation placement using spaces and not tabs before \
> o odd array definition layouts
> o per line definitions with comments poorly laid out
> o individual line definitions rewrapped
> o enum definitions on multiple lines compressed to single lines
> o u8 array definition layouts where the first element has a separate
>   meaning than the subsequent elements are compressed and made
>   difficult to understand

I am not sure what you are trying to show here -- some of these are
precisely the things that the tool could improve or have already
improved, and we may just need to use the new option.

For instance, for the columnarized macros case, it is possible to
align them since clang-format 9. For array of structures, there is
also a new alignment option since clang-format 13. Etc.

For the wrapping and related bits, now that the limit on 80 is a bit
more fuzzy, we could perhaps tweak the penalties to improve the
decision making.

In summary, what we should be trying to do is improve the tool
configuration and tool itself to see if we can get it to be close
enough to the kernel style to make it more widely used.

> I think _some_ clang-format output is ok, but the concept of
> enabling/disabling specific reformatting bits would be quite useful.
>
> And sprinkling "clang-format on/off" lines in the code is not good.

Definitely, but it is fine in some exceptional cases.

> Any control codes that determine when source code layout might be
> immutable or allowed to be modified could be should be tool name
> agnostic.

I don't see why would that be a problem, and I don't understand why we
would use several different formatting tools (the point is to be
consistent, after all); but sure, we could propose an alternative
spelling.

Cheers,
Miguel
