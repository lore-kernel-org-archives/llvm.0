Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6447D3D67
	for <llvm@lists.linux.dev>; Fri, 28 Apr 2023 16:19:03 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-95678d891d6so1861331166b.1
        for <llvm@lists.linux.dev>; Fri, 28 Apr 2023 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682698741; x=1685290741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVN1XAdeRtzZczE1pl99FKVVPYo2NA5UfAXorfmQJT0=;
        b=DUK3Ns56NvijkZIlrqtg0j1jgDjSVi+ciJCnpPpInJBFxqJPPx+3ryTUhgKgUU3Ym9
         pWj9G/sVJ+JR8Es+5fK8ogTSU6h+LGFLMCPBdprbX0/DmPEPXi0urOs4KSDGQI3mdR1/
         8X7K6FeYXccuC8m53uar34aAztMEyrYas7prE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682698741; x=1685290741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVN1XAdeRtzZczE1pl99FKVVPYo2NA5UfAXorfmQJT0=;
        b=iAtngDqjLgUGlFZkpFLkteq3lf9VU5SOHKY2oWijU6YZ7DrIbw6BwQrwsQEAYxQxWX
         ROIMlV7jaoE1IB5HhWokBRtPCenXcjQJyg0F8LP7pU0GCe0bVP5GGPL5QhPaat+iuHS+
         rI4ygUcgF4g1XWBGxTu0XjBhXwxjV+yi8YK66QQ9Sl7INi+CNUbb2lpNRHLWXocksvXg
         xxCVBVHvMwTjo7FYLdkwgjpaD5CszU086SxGnnGlTHc+axSfzCaeSt/I1KwIqyDNHNW1
         ybmT9dajMeOYH5b0JOr4uLOCL4OIeTghGZC6J2JMArB1iBuwWiWh2qUiW90OC0p8kXPn
         +hiA==
X-Gm-Message-State: AC+VfDxTUyuFsC37+knL15AcyeYpxm9Tjc//qXeONj+XGvoOq5zlNmS2
	KBEBP14deZkAd1w/g3jAh38YNVUOZZc53MwxH1qYuA==
X-Google-Smtp-Source: ACHHUZ4ugbaOSpCWUwaPvPhxfvVcnlY1G6eGDrIanA8Nsyl4JzADcjLKO5xRepdlQzK1ifQ898IJBw==
X-Received: by 2002:a17:907:3c81:b0:95f:7edb:def2 with SMTP id gl1-20020a1709073c8100b0095f7edbdef2mr5940646ejc.69.1682698741096;
        Fri, 28 Apr 2023 09:19:01 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id e17-20020aa7d7d1000000b00508480633bdsm9374430eds.74.2023.04.28.09.19.00
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 09:19:00 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-505035e3368so17621537a12.0
        for <llvm@lists.linux.dev>; Fri, 28 Apr 2023 09:19:00 -0700 (PDT)
X-Received: by 2002:aa7:ca51:0:b0:509:f221:cedc with SMTP id
 j17-20020aa7ca51000000b00509f221cedcmr5009557edt.35.1682698740150; Fri, 28
 Apr 2023 09:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6d35bd15e3ec81bcde81b776a369d47ee1f373d2.camel@mailbox.org>
 <202304250319.8IOPqkLH-lkp@intel.com> <f40dfa8b8ef8a85b14645fc797875fd5dcdfc42c.camel@mailbox.org>
In-Reply-To: <f40dfa8b8ef8a85b14645fc797875fd5dcdfc42c.camel@mailbox.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Apr 2023 09:18:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiPxPOg5-G+CaHiyNt_QBqoWx0bt7UGCKSdHyd42fQkpQ@mail.gmail.com>
Message-ID: <CAHk-=wiPxPOg5-G+CaHiyNt_QBqoWx0bt7UGCKSdHyd42fQkpQ@mail.gmail.com>
Subject: Re: Library: [RFC PATCH] btree_blue - a btree with linear travesal
 function and more
To: liuwf <liuwf@mailbox.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@purestorage.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 6:27=E2=80=AFAM liuwf <liuwf@mailbox.org> wrote:
>
> btree_blue also needs to mature (debug, stable), and some APIs are needed=
 to
> give.

You would also need to include what the use-case would be, and
benchmarks for a real load.

Honestly, pure insert/remove numbers are kind of pointless. Most users
that care deeply about performance also happen to care about locking
overhead etc even more, and so high-performance users often need it to
br RCU-safe too.

Finally, we'd want more of a background for you before adding anything
like this anyway. I can't find this email address anywhere in the
kernel source history.

          Linus
