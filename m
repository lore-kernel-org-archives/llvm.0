Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96928F7C
	for <llvm@lists.linux.dev>; Sat, 22 Oct 2022 01:52:41 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id c24so3879498plo.3
        for <llvm@lists.linux.dev>; Fri, 21 Oct 2022 18:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=afdPZP8v0TX/Zy/NVaOu1EQ1KzFRj9XO5sdt02N1QIw=;
        b=byBUNwzD8BfQT9gPd+UCau35i3Ec29XlEf03viviGcFtuMa8DoaRnaCDMKhdTiatp8
         5dQWKnm+fZbZN4Vmkd4XLd73XU6Vzb6AR5kS9QxTBuDw+YrG5xKFVjsWgwTFndV+RIZC
         Uf0XNfm4mPIBksl8MOtKh14ETZpxxZjKMiFoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afdPZP8v0TX/Zy/NVaOu1EQ1KzFRj9XO5sdt02N1QIw=;
        b=2l//f8DvuyNXDw5egikJ4ZbLcUPCzNLsj7pym84g8Ta7Zgn+KrsPOtTyYFf3nlZOIF
         ijgLJhIck/WHExmIzAewtXbOgDN14UjzTE2ZZzCsPFonbAfsiLJelLuoxqVpMZtjbGcE
         rXaphJWXjaouvAvLHAtYjUv51HxTRT9ACCF/k5HO7zMjYdHbj1+6b+i+e13j8N2Z8L5h
         DDdYx+DM/Na7ZW+MZ1l76mAAVhd2MqOGxAxedAnE4R3Cq35aU6zSO6JC9MtwgoRapndf
         gTfT5f0bmIpQYna+x3bx/JMNPjvOsTGsyuUE8MYu41kp3XeApd86wrzeCckvVxlTofYK
         G/9Q==
X-Gm-Message-State: ACrzQf1sc4HK+4iqQs1pGPLGkkd2O+eG5ApshNynl4MdQQIWIjYJXtJe
	BTvc32KBQQszqykgrQoimEw77w==
X-Google-Smtp-Source: AMsMyM7l25D5mnCDMTSTKy8YeC1DWpS7hmUeK83OHYzC79a0fjn9W2pNlDjM9O49hOYPIB1DCr7NCw==
X-Received: by 2002:a17:902:d2ce:b0:185:3f05:acf4 with SMTP id n14-20020a170902d2ce00b001853f05acf4mr22427322plc.35.1666403561336;
        Fri, 21 Oct 2022 18:52:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id pf9-20020a17090b1d8900b00212cf2fe8c3sm3180998pjb.1.2022.10.21.18.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 18:52:40 -0700 (PDT)
Date: Fri, 21 Oct 2022 18:52:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	David Ahern <dsahern@kernel.org>, Dylan Yudaken <dylany@fb.com>,
	Yajun Deng <yajun.deng@linux.dev>, Petr Machata <petrm@nvidia.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	syzbot <syzkaller@googlegroups.com>,
	Willem de Bruijn <willemb@google.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, "D. Wythe" <alibuda@linux.alibaba.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Menglong Dong <imagedong@tencent.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Congyu Liu <liu3101@purdue.edu>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ziyang Xuan <william.xuanziyang@huawei.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] net: dev: Convert sa_data to flexible array in
 struct sockaddr
Message-ID: <202210211841.031AB46@keescook>
References: <20221018095503.never.671-kees@kernel.org>
 <bd11473cd4e2a92c4ce2a32d370800522862ad4b.camel@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd11473cd4e2a92c4ce2a32d370800522862ad4b.camel@redhat.com>

On Thu, Oct 20, 2022 at 10:58:50AM +0200, Paolo Abeni wrote:
> On Tue, 2022-10-18 at 02:56 -0700, Kees Cook wrote:
> > [...]
> >  struct sockaddr {
> >  	sa_family_t	sa_family;	/* address family, AF_xxx	*/
> > -	char		sa_data[14];	/* 14 bytes of protocol address	*/
> > +	union {
> > +		char sa_data_min[14];		/* Minimum 14 bytes of protocol address	*/
> > +		DECLARE_FLEX_ARRAY(char, sa_data);
> 
> Any special reason to avoid preserving the old name for the array and
> e.g. using sa_data_flex for the new field, so we don't have to touch
> the sockaddr users?

Yes -- the reason is exactly to not touch the sockaddr users (who
generally treat sa_data as a fake flexible array). By switching it to a
flex-array the behavior will stay the same (especially under the coming
-fstrict-flex-arrays option), except that it breaks sizeof(). But the
broken sizeof() allows us to immediately find all the places where the
code explicitly depends on sa_data being 14 bytes. And for those cases,
we switch to sizeof(sa_data_min).

If we went the reverse route (and added -fstrict-flex-arrays) we might
end up adding a bunch of false positives all at once, because the places
that treated it as a flex-array would suddenly all begin behaving as a
14-byte array.

-- 
Kees Cook
