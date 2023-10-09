Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC83235894
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gkHn8q9x"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-692ada71d79so3535287b3a.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 09:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696867640; x=1697472440; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+3JOkz9MNIB/AjXQf1d+fgFmd+7/qyXYPjw/Dl3hcQ=;
        b=gkHn8q9xCvLfJE22+SXA1btMOiDPkQaGR1XOKkj0Qr8TxY9c4/yd0d1YNeh2cRcrL3
         LxZJ3dkqtFt1YqDnj1UBb2cqCjrad7VIn+eGHLV8AtuJo3zYvSmy4x9d0nAgr7Rabo8Q
         0XIMrpqyINVvlydPTHhuYIwOJnnuSHhQlhEZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696867640; x=1697472440;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+3JOkz9MNIB/AjXQf1d+fgFmd+7/qyXYPjw/Dl3hcQ=;
        b=kCfdTORikM7AdOB1aPc6dmkhylxV9ET4Lz5TMhqT+EmbEMg3l4dOIHXX1iE+ujOVwt
         S5R2VLbvpdEZeFGFH5H27JZeyjb43snZ3+Hp+XlNaYoFC7ZQKfRiZSTU2fimxwmRZQ4W
         l/gIdFmjbVQ+8XQ2odfJOGTQkwZJDi4e0bCXMTkJAlGNv8Eaqk8zhFwvvy8kqg75Y7xU
         Na/MoowbuyUx6g+zcTDlnP78EEpzB8oDnUQvbDVX5dPPcpR5kW+q6yO60BEE2RxXyOVL
         VoMHqqG3VvCKi3/Ld+pF2PGjOpviFdC4E757tyB8fwbETUArIXXksAUczrK/jQ/Z1vc4
         1n7Q==
X-Gm-Message-State: AOJu0Yy+JAnbBMYDuZ+GnOfWdx9m9/XOMM5X8zhaetcch4otGPNTIpDM
	s+IMivAHyjfh44AyG30wwxajqw==
X-Google-Smtp-Source: AGHT+IHxVEnRf0aA6FaBJyvYV0PmwQxq1Mlqp/9m+bsbe4WdfYasO6y6M2RZ8ABlDSvD8B9tNe2i5A==
X-Received: by 2002:a05:6a20:244f:b0:159:dccb:8bb4 with SMTP id t15-20020a056a20244f00b00159dccb8bb4mr16029001pzc.23.1696867640247;
        Mon, 09 Oct 2023 09:07:20 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m26-20020a056a00165a00b0068fb4f5f38fsm6589398pfc.30.2023.10.09.09.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:07:19 -0700 (PDT)
Date: Mon, 9 Oct 2023 09:07:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>,
	Kalle Valo <kvalo@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org, linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] wifi: p54: Annotate struct p54_cal_database with
 __counted_by
Message-ID: <202310090906.9310CF4434@keescook>
References: <20231006201719.work.356-kees@kernel.org>
 <CAKf6xptEEHJAsrwh_oebK1_AMb+_tvLtiY8sP-Qk=Z9jXhVf7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xptEEHJAsrwh_oebK1_AMb+_tvLtiY8sP-Qk=Z9jXhVf7Q@mail.gmail.com>

On Mon, Oct 09, 2023 at 10:55:32AM -0400, Jason Andryuk wrote:
> Hi,
> 
> I randomly peeked at this patch.  Unfortunately, I am not familiar
> with the actual p54 code.
> 
> On Fri, Oct 6, 2023 at 4:17 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Prepare for the coming implementation by GCC and Clang of the __counted_by
> > attribute. Flexible array members annotated with __counted_by can have
> > their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> > array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > functions).
> >
> > As found with Coccinelle[1], add __counted_by for struct p54_cal_database.
> >
> > Cc: Christian Lamparter <chunkeey@googlemail.com>
> > Cc: Kalle Valo <kvalo@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: linux-wireless@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/net/wireless/intersil/p54/p54.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/intersil/p54/p54.h b/drivers/net/wireless/intersil/p54/p54.h
> > index 3356ea708d81..770e348d1f6c 100644
> > --- a/drivers/net/wireless/intersil/p54/p54.h
> > +++ b/drivers/net/wireless/intersil/p54/p54.h
> > @@ -126,7 +126,7 @@ struct p54_cal_database {
> >         size_t entry_size;
> >         size_t offset;
> >         size_t len;
> > -       u8 data[];
> > +       u8 data[] __counted_by(entries);
> 
> This looks incorrect - I think you want __counted_by(len)?  The
> presence of entry_size made me suspicious.
> 
> >  };
> 
> This is the function that creates struct p54_cal_database:
> 
> static struct p54_cal_database *p54_convert_db(struct pda_custom_wrapper *src,
>                                                size_t total_len)
> {
>         struct p54_cal_database *dst;
>         size_t payload_len, entries, entry_size, offset;
> 
>         payload_len = le16_to_cpu(src->len);
>         entries = le16_to_cpu(src->entries);
>         entry_size = le16_to_cpu(src->entry_size);
>         offset = le16_to_cpu(src->offset);
>         if (((entries * entry_size + offset) != payload_len) ||
>              (payload_len + sizeof(*src) != total_len))
>                 return NULL;
> 
>         dst = kmalloc(sizeof(*dst) + payload_len, GFP_KERNEL);
>         if (!dst)
>                 return NULL;
> 
>         dst->entries = entries;
>         dst->entry_size = entry_size;
>         dst->offset = offset;
>         dst->len = payload_len;
> 
>         memcpy(dst->data, src->data, payload_len);
>         return dst;
> }
> 
> You can see that kmalloc is performed with `sizeof(*dst) +
> payload_len`, and payload_len is assigned to ->len.

Agreed!

> I don't read Coccinelle, but, if this patch was auto-generated, I
> wonder if the script has an error.

Yeah, I'm not sure which part went wrong. I will investigate. Thanks for
catching this!

-- 
Kees Cook
