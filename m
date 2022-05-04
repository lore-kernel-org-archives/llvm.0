Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181463237
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 19:43:39 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id e5so1959510pgc.5
        for <llvm@lists.linux.dev>; Wed, 04 May 2022 12:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RQ5+Z93YtWEK5xXREhrhRleXnskqFAblQsxgrgprxiY=;
        b=PWTj7QFNwdFF2OE0C4xFUgoIvDGn2+dYizGm/ZxeTyJ+Iz/tyIN+jbKS/JUP74dMIB
         W7u3atVP0GNPWpIF5TIzABeYYT/Et9n+I/Ppab3jaBr0jw2QDopw+U1E91lEzpAOCQFs
         xQr1OFa2NKNeyWLt6H4cI0w0eWAyTF94chl/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RQ5+Z93YtWEK5xXREhrhRleXnskqFAblQsxgrgprxiY=;
        b=LF3Kb+VSP3u+zLZ/Cg9Ic+EHhIK/EGNaY9JlhdMQCGwN6xNh65bDjA7vPL+2vFlcTk
         HlJNiUzr81WNdnl7NgLmxSKbpfYNIXFnYmzXZDOvdcZQQsDZxpbzKpH/1s4s14Q6ybNu
         kogeE6NLZf/Vhss1pIJqCUrYCtPDPYeZ0z4p1vyaFjeGA/e1TWkHDgFmfBqfHYYKABPc
         Fcb8FCfA8uBnPLMC5tefwIO+PSOLsW7oNnOS/dePQnM5bfOSONYsa8qztuPYPowWIUB8
         TtNv3qtih3zoNh9sx1LYk36IDjb5y9S1osJoRCMeuvHec5twp82L526Eini8T2RXGfQ4
         SOnw==
X-Gm-Message-State: AOAM532oFTbeoAtA+BkvHX7ExJygFpnfKbBz6fEFf+QgP5FiNAQXouI0
	MAGCrVpzCd1qbo98u+BgI/3zPA==
X-Google-Smtp-Source: ABdhPJxpGz3s4m+LKjicArp6DlDBRGF27gXeN2gLCVWGRMHmfRxOIpCp0rTzhf6HWYs/gZ1wrGnYMQ==
X-Received: by 2002:a65:4848:0:b0:39c:c393:688c with SMTP id i8-20020a654848000000b0039cc393688cmr18715460pgs.376.1651693419340;
        Wed, 04 May 2022 12:43:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h15-20020a170902f70f00b0015e8d4eb1d0sm8730938plo.26.2022.05.04.12.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 12:43:38 -0700 (PDT)
Date: Wed, 4 May 2022 12:43:37 -0700
From: Kees Cook <keescook@chromium.org>
To: David Gow <davidgow@google.com>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
	KUnit Development <kunit-dev@googlegroups.com>,
	Alexei Starovoitov <ast@kernel.org>, alsa-devel@alsa-project.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Gabbasov <andrew_gabbasov@mentor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Gross <agross@kernel.org>, Andy Lavr <andy.lavr@gmail.com>,
	Arend van Spriel <aspriel@gmail.com>,
	Baowen Zheng <baowen.zheng@corigine.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bradley Grove <linuxdrivers@attotech.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	Christian Brauner <brauner@kernel.org>,
	Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Chris Zankel <chris@zankel.net>,
	Cong Wang <cong.wang@bytedance.com>, Daniel Axtens <dja@axtens.net>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	devicetree@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eli Cohen <elic@nvidia.com>, Eric Dumazet <edumazet@google.com>,
	Eric Paris <eparis@parisplace.org>,
	Eugeniu Rosca <erosca@de.adit-jv.com>,
	Felipe Balbi <balbi@kernel.org>,
	Francis Laniel <laniel_francis@privacyrequired.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Hulk Robot <hulkci@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	James Morris <jmorris@namei.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jens Axboe <axboe@kernel.dk>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Keeping <john@metanate.com>, Juergen Gross <jgross@suse.com>,
	Kalle Valo <kvalo@kernel.org>, Keith Packard <keithp@keithp.com>,
	keyrings@vger.kernel.org, Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee.jones@linaro.org>, Leon Romanovsky <leon@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-integrity@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-security-module <linux-security-module@vger.kernel.org>,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-xtensa@linux-xtensa.org, llvm@lists.linux.dev,
	Loic Poulain <loic.poulain@linaro.org>,
	Louis Peens <louis.peens@corigine.com>,
	Luca Coelho <luciano.coelho@intel.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Mark Brown <broonie@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>,
	Muchun Song <songmuchun@bytedance.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Networking <netdev@vger.kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Paolo Abeni <pabeni@redhat.com>, Paul Moore <paul@paul-moore.com>,
	Rich Felker <dalias@aerifal.cx>, Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>, selinux@vger.kernel.org,
	"Serge E. Hallyn" <serge@hallyn.com>,
	SHA-cyfmac-dev-list@infineon.com,
	Simon Horman <simon.horman@corigine.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Tadeusz Struk <tadeusz.struk@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, Tom Rix <trix@redhat.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	wcn36xx@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH 03/32] flex_array: Add Kunit tests
Message-ID: <202205041220.4BAF15F6B4@keescook>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-4-keescook@chromium.org>
 <CABVgOSn62JTxaX9BW8w8jRxOpf_vgxpW-s=amwo8PCotiZTjig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABVgOSn62JTxaX9BW8w8jRxOpf_vgxpW-s=amwo8PCotiZTjig@mail.gmail.com>

On Wed, May 04, 2022 at 11:00:38AM +0800, David Gow wrote:
> On Wed, May 4, 2022 at 9:47 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > Add tests for the new flexible array structure helpers. These can be run
> > with:
> >
> >   make ARCH=um mrproper
> >   ./tools/testing/kunit/kunit.py config
> 
> Nit: it shouldn't be necessary to run kunit.py config separately:
> kunit.py run will configure the kernel if necessary.

Ah yes, I think you mentioned this before. I'll adjust the commit log.

> 
> >   ./tools/testing/kunit/kunit.py run flex_array
> >
> > Cc: David Gow <davidgow@google.com>
> > Cc: kunit-dev@googlegroups.com
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> 
> This looks pretty good to me: it certainly worked on the different
> setups I tried (um, x86_64, x86_64+KASAN).
> 
> A few minor nitpicks inline, mostly around minor config-y things, or
> things which weren't totally clear on my first read-through.
> 
> Hopefully one day, with the various stubbing features or something
> similar, we'll be able to check against allocation failures in
> flex_dup(), too, but otherwise nothing seems too obviously missing.
> 
> Reviewed-by: David Gow <davidgow@google.com>

Great; thanks for the review and testing!

> 
> -- David
> 
> >  lib/Kconfig.debug      |  12 +-
> >  lib/Makefile           |   1 +
> >  lib/flex_array_kunit.c | 523 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 531 insertions(+), 5 deletions(-)
> >  create mode 100644 lib/flex_array_kunit.c
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 9077bb38bc93..8bae6b169c50 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2551,11 +2551,6 @@ config OVERFLOW_KUNIT_TEST
> >           Builds unit tests for the check_*_overflow(), size_*(), allocation, and
> >           related functions.
> >
> > -         For more information on KUnit and unit tests in general please refer
> > -         to the KUnit documentation in Documentation/dev-tools/kunit/.
> > -
> > -         If unsure, say N.
> > -
> 
> Nit: while I'm not against removing some of this boilerplate, is it
> better suited for a separate commit?

Make sense, yes. I'll drop this for now.

> 
> >  config STACKINIT_KUNIT_TEST
> >         tristate "Test level of stack variable initialization" if !KUNIT_ALL_TESTS
> >         depends on KUNIT
> > @@ -2567,6 +2562,13 @@ config STACKINIT_KUNIT_TEST
> >           CONFIG_GCC_PLUGIN_STRUCTLEAK, CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF,
> >           or CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL.
> >
> > +config FLEX_ARRAY_KUNIT_TEST
> > +       tristate "Test flex_*() family of helper functions at runtime" if !KUNIT_ALL_TESTS
> > +       depends on KUNIT
> > +       default KUNIT_ALL_TESTS
> > +       help
> > +         Builds unit tests for flexible array copy helper functions.
> > +
> 
> Nit: checkpatch warns that the description here may be insufficient:
> WARNING: please write a help paragraph that fully describes the config symbol

Yeah, I don't know anything to put here that isn't just more
boilerplate, so I'm choosing to ignore this for now. :)

> > [...]
> > +struct normal {
> > +       size_t  datalen;
> > +       u32     data[];
> > +};
> > +
> > +struct decl_normal {
> > +       DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(size_t, datalen);
> > +       DECLARE_FLEX_ARRAY_ELEMENTS(u32, data);
> > +};
> > +
> > +struct aligned {
> > +       unsigned short  datalen;
> > +       char            data[] __aligned(__alignof__(u64));
> > +};
> > +
> > +struct decl_aligned {
> > +       DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(unsigned short, datalen);
> > +       DECLARE_FLEX_ARRAY_ELEMENTS(char, data) __aligned(__alignof__(u64));
> > +};
> > +
> > +static void struct_test(struct kunit *test)
> > +{
> > +       COMPARE_STRUCTS(struct normal, struct decl_normal);
> > +       COMPARE_STRUCTS(struct aligned, struct decl_aligned);
> > +}
> 
> If I understand it, the purpose of this is to ensure that structs both
> with and without the flexible array declaration have the same memory
> layout?
> 
> If so, any chance of a comment briefly stating that's the purpose (or
> renaming this test struct_layout_test())?

Yeah, good idea; I'll improve the naming.

> 
> Also, would it make sense to do the same with the struct with internal
> padding below?

Heh, yes, good point! :)

> [...]
> > +#define CHECK_COPY(ptr)                do {                                            \
> > +       typeof(*(ptr)) *_cc_dst = (ptr);                                        \
> > +       KUNIT_EXPECT_EQ(test, _cc_dst->induce_padding, 0);                      \
> > +       memcpy(&padding, &_cc_dst->induce_padding + sizeof(_cc_dst->induce_padding), \
> > +              sizeof(padding));                                                \
> > +       /* Padding should be zero too. */                                       \
> > +       KUNIT_EXPECT_EQ(test, padding, 0);                                      \
> > +       KUNIT_EXPECT_EQ(test, src->count, _cc_dst->count);                      \
> > +       KUNIT_EXPECT_EQ(test, _cc_dst->count, TEST_TARGET);                     \
> > +       for (i = 0; i < _cc_dst->count - 1; i++) {                              \
> > +               /* 'A' is 0x41, and here repeated in a u32. */                  \
> 
> Would it be simpler to just note that the magic value is 0x41, rather
> than have it be the character 'A'?

Yeah, now fixed.

> [...]
> > +       CHECK_COPY(&encap->fas);
> > +       /* Check that items external to "fas" are zero. */
> > +       KUNIT_EXPECT_EQ(test, encap->flags, 0);
> > +       KUNIT_EXPECT_EQ(test, encap->junk, 0);
> > +       kfree(encap);
> > +#undef MAGIC_WORD
> 
> MAGIC_WORD isn't defined (or used) for flux_dup_test? Is it worth
> using it (or something similar) for the 'A' / 0x14141414 and the
> CHECK_COPY() macro?

Oops, yes. Fixed.

Thanks again!

-Kees

-- 
Kees Cook
