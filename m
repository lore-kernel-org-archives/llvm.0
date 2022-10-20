Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6EE7E
	for <llvm@lists.linux.dev>; Thu, 20 Oct 2022 08:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666256337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z4JdVTNocmv+5C7FFGGGdfOf1ttmjLbFkFJntY9Bfk4=;
	b=UMjprOgTFCEFd0JZii2I8t8EHl3UciTaBHk9eJ3JXK3h2YRA3F5VvKmR4PPZ4d2PekQ9zS
	I+uaM6O6Ogi86nV1idWONPSx3z98jZT6sa8CLo8z9wrOlC6BpbXHdvAC2l80IokWW7Ut0l
	r6Fs6NQieUJqn9EBHoF9WVDzH3aqG9c=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-2sA8_3P5N6qY1g8D5TRL-g-1; Thu, 20 Oct 2022 04:58:56 -0400
X-MC-Unique: 2sA8_3P5N6qY1g8D5TRL-g-1
Received: by mail-qt1-f197.google.com with SMTP id bz12-20020a05622a1e8c00b0039ae6e887ffso14401901qtb.8
        for <llvm@lists.linux.dev>; Thu, 20 Oct 2022 01:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z4JdVTNocmv+5C7FFGGGdfOf1ttmjLbFkFJntY9Bfk4=;
        b=WShxwxuvx3fBthQA6JDYXoEMTCHLL6wUosPLRnLLei7hpxpyqTb4Wwymp5Le2I6f08
         K9K9u/2OR9X0i7FJPOiultJ5ADCs65WRK9dOUnTHwILYT0J1aheqi6wCNrkMWzPchMct
         ZnkTlQNiLpESSVGQ+IYwHs4UJJoVzuUbkQtnAvkNLUTG0WedanMeP5t1RK9UAgPJRDLG
         v9bwKzN0nlsTVjJ9i4m5G2YyOuuffEj/ZWTdiQjXXE0q/+0cdkfgFOeU+mIMBdnA6i8o
         4PSL1vS1XI/mN+exS/ox+rtEyeNZbgYVqVLTLDTmhqopYP6x++hVWHQvH720w7bqzPeK
         FBQg==
X-Gm-Message-State: ACrzQf3h8tVN45FOyCT1YsaSwUVs3ELBzYui/T+v63oaAyr8Sye7ehOk
	EZQg7uGfV0YBqTFwk6UvoqGBfplquHogD0FPxQOG/7NDIlLm6PUw5jtOSqLQ2Ng0N/YvtNYMpMv
	xMSsbUcA0tLALwQ==
X-Received: by 2002:a0c:cb88:0:b0:4b8:d79e:b2c1 with SMTP id p8-20020a0ccb88000000b004b8d79eb2c1mr694649qvk.85.1666256336284;
        Thu, 20 Oct 2022 01:58:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4bXCasRwb46Qr+S4wxdTnTzsOhS4+ji7UC6MR7ZQFF8dYmBWGwTTEIKInkUbNKjOcrOIHvKQ==
X-Received: by 2002:a0c:cb88:0:b0:4b8:d79e:b2c1 with SMTP id p8-20020a0ccb88000000b004b8d79eb2c1mr694632qvk.85.1666256336012;
        Thu, 20 Oct 2022 01:58:56 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-103-235.dyn.eolo.it. [146.241.103.235])
        by smtp.gmail.com with ESMTPSA id z15-20020a05622a124f00b0039a08c0a594sm5671319qtx.82.2022.10.20.01.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 01:58:55 -0700 (PDT)
Message-ID: <bd11473cd4e2a92c4ce2a32d370800522862ad4b.camel@redhat.com>
Subject: Re: [PATCH][next] net: dev: Convert sa_data to flexible array in
 struct sockaddr
From: Paolo Abeni <pabeni@redhat.com>
To: Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jens Axboe <axboe@kernel.dk>, Pavel Begunkov
 <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>,  Dylan Yudaken
 <dylany@fb.com>, Yajun Deng <yajun.deng@linux.dev>, Petr Machata
 <petrm@nvidia.com>, Hangbin Liu <liuhangbin@gmail.com>, Leon Romanovsky
 <leon@kernel.org>, syzbot <syzkaller@googlegroups.com>, Willem de Bruijn
 <willemb@google.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
 netdev@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, "D.
 Wythe" <alibuda@linux.alibaba.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Menglong Dong
 <imagedong@tencent.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, Congyu Liu
 <liu3101@purdue.edu>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Ziyang Xuan <william.xuanziyang@huawei.com>,  linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev,  linux-hardening@vger.kernel.org
Date: Thu, 20 Oct 2022 10:58:50 +0200
In-Reply-To: <20221018095503.never.671-kees@kernel.org>
References: <20221018095503.never.671-kees@kernel.org>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 2022-10-18 at 02:56 -0700, Kees Cook wrote:
> One of the worst offenders of "fake flexible arrays" is struct sockaddr,
> as it is the classic example of why GCC and Clang have been traditionally
> forced to treat all trailing arrays as fake flexible arrays: in the
> distant misty past, sa_data became too small, and code started just
> treating it as a flexible array, even though it was fixed-size. The
> special case by the compiler is specifically that sizeof(sa->sa_data)
> and FORTIFY_SOURCE (which uses __builtin_object_size(sa->sa_data, 1))
> do not agree (14 and -1 respectively), which makes FORTIFY_SOURCE treat
> it as a flexible array.
> 
> However, the coming -fstrict-flex-arrays compiler flag will remove
> these special cases so that FORTIFY_SOURCE can gain coverage over all
> the trailing arrays in the kernel that are _not_ supposed to be treated
> as a flexible array. To deal with this change, convert sa_data to a true
> flexible array. To keep the structure size the same, move sa_data into
> a union with a newly introduced sa_data_min with the original size. The
> result is that FORTIFY_SOURCE can continue to have no idea how large
> sa_data may actually be, but anything using sizeof(sa->sa_data) must
> switch to sizeof(sa->sa_data_min).
> 
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Pavel Begunkov <asml.silence@gmail.com>
> Cc: David Ahern <dsahern@kernel.org>
> Cc: Dylan Yudaken <dylany@fb.com>
> Cc: Yajun Deng <yajun.deng@linux.dev>
> Cc: Petr Machata <petrm@nvidia.com>
> Cc: Hangbin Liu <liuhangbin@gmail.com>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: syzbot <syzkaller@googlegroups.com>
> Cc: Willem de Bruijn <willemb@google.com>
> Cc: Pablo Neira Ayuso <pablo@netfilter.org>
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/socket.h |  5 ++++-
>  net/core/dev.c         |  2 +-
>  net/core/dev_ioctl.c   |  2 +-
>  net/packet/af_packet.c | 10 +++++-----
>  4 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/socket.h b/include/linux/socket.h
> index de3701a2a212..13c3a237b9c9 100644
> --- a/include/linux/socket.h
> +++ b/include/linux/socket.h
> @@ -33,7 +33,10 @@ typedef __kernel_sa_family_t	sa_family_t;
>  
>  struct sockaddr {
>  	sa_family_t	sa_family;	/* address family, AF_xxx	*/
> -	char		sa_data[14];	/* 14 bytes of protocol address	*/
> +	union {
> +		char sa_data_min[14];		/* Minimum 14 bytes of protocol address	*/
> +		DECLARE_FLEX_ARRAY(char, sa_data);

Any special reason to avoid preserving the old name for the array and
e.g. using sa_data_flex for the new field, so we don't have to touch
the sockaddr users?

Thanks!

Paolo

