Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC323FC4
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 19:10:44 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id g1so535151lfj.12
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 12:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YnOOs7cOY2aRKSHGTS9b6X5LZVhhuvMpnEJwtROL6Vg=;
        b=CmSn/OlpRAybXvo2UeErWrXzNG9m2iILp0YBMxECF85BY3IxHhiu4pzslIp+7b+0Be
         Bm0WWmlfJ3SG175Dw9XqJEm940Iu18WhmTkuSpTzzvLmiWoNnEFhA14ZFY2bg/B76lYT
         uCYW9+o/eDGt9dIpbA5ZdRCGMeDcfh3cYHSC2dUOO3JKIDP+7ZyFOx1lqsAnpjg64F0p
         Zprz17+VF3OyS6UZXd9xZrfXpJrPNC5BmvjrDLDdvtrJJDiwLv7nBtXHCRQuwgbOe2f7
         sC6Yw5XE0Fubwb4lWCCn00wg5b/97LengfgAP7dwKvftDU1W4FliR/y9/sb2q+ucM2En
         RWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YnOOs7cOY2aRKSHGTS9b6X5LZVhhuvMpnEJwtROL6Vg=;
        b=SeIInOw493zgHTH74Dn0mOrdcimOfcIebBAEzvlFwE1ggzeRe7iyJGxKG06hE0N06Z
         DDwpaeRvgi3+w+2Tm2gniMZ3i1l9zVQANN34Bw0A9lLstZQ2kkQgDkB/Q5dYYXx947Dj
         kMKHCMagHKgONDXzD6/QpV67BVAODq1M0DjiVFMH59GutvKNQ3Mp597RFB78r8RJ+aKr
         jZlhKPVyFy5HVnbU1SZOt5tv0w6E9B7BX01AplxCGcs3LEyre4KbDyZFkb9QKnxY3SC5
         8p8CUZTlBRl+Wrt++8lDnHHqT7KvXs82Il4ksGJ0KjDTGGti0HDtwtLuGfkFrN6Z9A8J
         R49Q==
X-Gm-Message-State: AOAM530bw2XJwo67yNnrzbQD0AlUHZV9P7FqMy4/82oQtLepzWJxkKc+
	6vaBxpspPQEivN6JIRDqY+8EJ4NENFbrcifHbxlqtQ==
X-Google-Smtp-Source: ABdhPJw/+zEgpPOLgQMTdXmaDecwRkVFlAfV9dDhd+GqZB/UdQZhqL81/BhGLj2Cq9GXf8kWBJm7Pqb3KORMxQSljvw=
X-Received: by 2002:a05:6512:3b9e:: with SMTP id g30mr13975294lfv.651.1631646642092;
 Tue, 14 Sep 2021 12:10:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913203201.1844253-1-ndesaulniers@google.com>
 <195b2f47-b92e-a00b-a2bc-d91bfdbd9d12@rasmusvillemoes.dk> <202109141031.AEFD06F03F@keescook>
 <CAHk-=wjac_3K+NQNO6tjQZU1KLgba==BOvHmHE2sgNSVj3j85g@mail.gmail.com>
 <CAHk-=whiQBofgis_rkniz8GBP9wZtSZdcDEffgSLO62BUGV3gg@mail.gmail.com>
 <CAKwvOdkOHxtsRGjZ2Y8x84sBaqWy8t-U3F9UbMiR7h=3_+mtqA@mail.gmail.com>
 <CAHk-=wjUR7FwE5LsZNaoQxrKu2TS7T-=1j8XqZK2miQuEmqf3Q@mail.gmail.com> <CAHk-=wgPupayk3GpwSMtkV5_onFzmmK2g3WmBV1EbSCj+D0eqw@mail.gmail.com>
In-Reply-To: <CAHk-=wgPupayk3GpwSMtkV5_onFzmmK2g3WmBV1EbSCj+D0eqw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Sep 2021 12:10:30 -0700
Message-ID: <CAKwvOdkab9O5q=DNn643+7HRgTDdD1i201Qi_cSuXYbJbXf1qw@mail.gmail.com>
Subject: Re: [PATCH 5.10] overflow.h: use new generic division helpers to
 avoid / operator
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Josef Bacik <josef@toxicpanda.com>, 
	Jens Axboe <axboe@kernel.dk>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev, 
	stable <stable@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 11:56 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 14, 2021 at 11:48 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > There was never anything "loff_t" about bitmask at any point.
>
> Not 'bitmask'. It's 'blksize'. Hopefully that was obvious in context.

Isn't the parameter `blksize` of `nbd_set_size` declared as `loff_t`?
-- 
Thanks,
~Nick Desaulniers
