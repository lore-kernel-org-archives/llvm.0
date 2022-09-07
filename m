Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A0B89A7
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 17:42:43 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id b9so11055428qka.2
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date;
        bh=YX6bb2S/xfOxRCtWHv2IUtfoGGrWjC9MoUuuhHCU2UQ=;
        b=gRbEXFRfNECsc8FKs3nA/ZchEcUtcsoH7LhN922f2zULvSqPl6vmEVTRry21ilVbyK
         XFQHunGVol17ODjbfBs338M6M7ENcu6Mdq0PE6/hD+cQy28d8+lWP0Tuhzkgm/LHHc46
         KRHpS8TdCwvoyMaFQxp2VEi5XwRSgsAd+IJpi8Q/SFsPuIZCd7R1Pz6X5grzHFCRIkwP
         /NMj3XCi6at6+DJ6i0dFdO+AYbjVK+jv28Ue7ECpQPCbWiv5H29gUU3vkHM3uAtrJY+W
         dYd9C0DjdJ9ZTDdD1OtMuiIftZDcZYIZX8UjQLjbt31I2/FrMYhHuBR3WlRvD9X6QifX
         ceig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YX6bb2S/xfOxRCtWHv2IUtfoGGrWjC9MoUuuhHCU2UQ=;
        b=4mTbU997BvkYWu7wc+BJIcYQXRBuyO148kMBxClLQtSOYOjtgViycYtYokGs2rY7eG
         at4pzadhLqyIArCREMx9RdqrJMGfmJhvBI5lSTCG/zU1I9ktYocTyC1xYoouhsMHJfPq
         dIxUi/9oZrSaraq/uZQF32cSMbLgjtXUP6eHf66BdMg9xRWsPMGjpVxpDPUdnqNAkGO+
         7lQSL5XdxwH/Gb2Ry5aiCe08/TGtVfJe06wUASdkiPKXVBsQzHYCeVFb2ApxvapUpFKt
         1nijeCDqYc4cbOdw4AbIzKOdmpHf9vlzbzsxPPpFWEdq+83e//DpJ0eRMpO3XHeTSylq
         /mRw==
X-Gm-Message-State: ACgBeo30p3ZvHk1aslYGeBglOvhSV+K+kmvgOU+/tbGNqA2bypMqXDiV
	2USS7x3LDWKLzT5ztBiL5RI=
X-Google-Smtp-Source: AA6agR6/byyHe4ilv8d8ocIJJRVcxI/5GTUa8ThDwehsAcsbjXCimnDSFPvwaj2b+0cLMUx7wO3haA==
X-Received: by 2002:a37:888:0:b0:6bc:68cf:cdf5 with SMTP id 130-20020a370888000000b006bc68cfcdf5mr3634651qki.639.1662572562418;
        Wed, 07 Sep 2022 10:42:42 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id 137-20020a37078f000000b006be68f9bdddsm14132067qkh.133.2022.09.07.10.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 10:42:41 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailauth.nyi.internal (Postfix) with ESMTP id 6A19827C0054;
	Wed,  7 Sep 2022 13:42:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 07 Sep 2022 13:42:41 -0400
X-ME-Sender: <xms:ENgYY3dM8qN4McFIlKxgrGKHGwEQ-XUKEMA0Ns6mWJmOCvqVd9W3JQ>
    <xme:ENgYY9OUh3bNzVLLOhGSeZYOFHK_4eqw7XxONjyjewVdSI3twWjjKzqNrcGBTnWYO
    40KDk4yBi31keYsuw>
X-ME-Received: <xmr:ENgYYwhIVGuyph65CiDFUcIOJIUHzvg9YIUQmkK3tnmZpJe2wc6SyhdgRyE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:ENgYY49H3QeRpKRT65ZH5w7_29d5-kxwUndoU3Bzr5jtdFGsrFLe7A>
    <xmx:ENgYYzu2mV1jT2aotsWVho2XKn2X2y0zxKVmu3nVsrsi2pJXJgNfYw>
    <xmx:ENgYY3E1dp3ptyxFD6CkJ-4YowLQCwXnkwo6_sXbybOsS_T6s5nH2Q>
    <xmx:EdgYYxJqn-PNxH2D45lojcoiEhJnwZHVNhTqQb3JBoQ3LTkg-82Fgg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 13:42:40 -0400 (EDT)
Date: Wed, 7 Sep 2022 10:41:20 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Marco Elver <elver@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] objtool, kcsan: Add volatile read/write
 instrumentation to whitelist
Message-ID: <YxjXwBXpejAP6zoy@boqun-archlinux>
References: <20220907173903.2268161-1-elver@google.com>
 <20220907173903.2268161-2-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907173903.2268161-2-elver@google.com>

On Wed, Sep 07, 2022 at 07:39:03PM +0200, Marco Elver wrote:
> Adds KCSAN's volatile barrier instrumentation to objtool's uaccess

Confused. Are things like "__tsan_volatile_read4" considered as
"barrier" for KCSAN?

Regards,
Boqun

> whitelist.
> 
> Recent kernel change have shown that this was missing from the uaccess
> whitelist (since the first upstreamed version of KCSAN):
> 
>   mm/gup.o: warning: objtool: fault_in_readable+0x101: call to __tsan_volatile_write1() with UACCESS enabled
> 
> Fixes: 75d75b7a4d54 ("kcsan: Support distinguishing volatile accesses")
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  tools/objtool/check.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index e55fdf952a3a..67afdce3421f 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -999,6 +999,16 @@ static const char *uaccess_safe_builtin[] = {
>  	"__tsan_read_write4",
>  	"__tsan_read_write8",
>  	"__tsan_read_write16",
> +	"__tsan_volatile_read1",
> +	"__tsan_volatile_read2",
> +	"__tsan_volatile_read4",
> +	"__tsan_volatile_read8",
> +	"__tsan_volatile_read16",
> +	"__tsan_volatile_write1",
> +	"__tsan_volatile_write2",
> +	"__tsan_volatile_write4",
> +	"__tsan_volatile_write8",
> +	"__tsan_volatile_write16",
>  	"__tsan_atomic8_load",
>  	"__tsan_atomic16_load",
>  	"__tsan_atomic32_load",
> -- 
> 2.37.2.789.g6183377224-goog
> 
