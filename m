Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0951799B
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ouz/fPMp"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-69af8a42066so2557231b3a.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696870574; x=1697475374; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BI1wdHvupQf0LaYbc5/G8p3qu/45NR/6x8pz02yh3PE=;
        b=Ouz/fPMpDAPtZuUOnEW525CHtZv0NfSCJco5yDdZZisbElLdnLimAIPfJXlLOx1hZ6
         dgMlKjwU589qT9uCw3bnuI9UljSQZIRim/kZwM3rCX6ha0b2b1DzN3GVG5i1vfPm9vNm
         gamyegcV8eO+3COGbJGE+nNGsszD4tDJxkMy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696870574; x=1697475374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI1wdHvupQf0LaYbc5/G8p3qu/45NR/6x8pz02yh3PE=;
        b=RWI3jh/WWoqfOkZMl+Om8IHWMMtIsFFGizb+YnMKDWZxXiaYVvW9ALaYbFbAEKPZha
         VPPKERCfin1fr4DIufcaDP5DmhZOd+FlIaFA2cxMRlw9WXPfNjXpDxKfVT+yc7JqzRLS
         IXFfssHBH8CGNTbcWalhFHE77Z8dmRi6EbjQ6Sc1t7dmHUaG1vWm793aQE5GfAzkcCkt
         YyoDkqiuq6Z7vXxb/52UKJhI7uu53LOyWbEgDfTZQ3hsmNueIGJNGOxV0kWSnn6RpgRa
         EO6H1dLCi+LV3HKjnCDrPAxb9D5nE3tbIsBNXN/8FmBbPHoZAnH4tShew5RKbtsREGWU
         2FvQ==
X-Gm-Message-State: AOJu0Yysm65QzF4hVcDt5IkojXIbiUYXD8Rh36y/xFkB4tj2Z3vdMqA0
	kIwbtvalNjJozBSIY3sM4WGthQ==
X-Google-Smtp-Source: AGHT+IExmUks9+I/YiKBGr4BtICx6xzlqORwNadZpHtAORGWPchSbI37a3pFI+AKwfNa/ZHilpgCWw==
X-Received: by 2002:a05:6a00:124a:b0:690:ce30:47e5 with SMTP id u10-20020a056a00124a00b00690ce3047e5mr14761348pfi.6.1696870574128;
        Mon, 09 Oct 2023 09:56:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l3-20020a62be03000000b00688c733fe92sm6540299pff.215.2023.10.09.09.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:56:13 -0700 (PDT)
Date: Mon, 9 Oct 2023 09:56:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "kvalo@kernel.org" <kvalo@kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"trix@redhat.com" <trix@redhat.com>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"ndesaulniers@google.com" <ndesaulniers@google.com>,
	"gustavoars@kernel.org" <gustavoars@kernel.org>
Subject: Re: [PATCH] wifi: rtw89: coex: Annotate struct
 rtw89_btc_btf_set_slot_table with __counted_by
Message-ID: <202310090953.B7CE5CF4B@keescook>
References: <20231006201715.work.239-kees@kernel.org>
 <4716f3c7bf3d34ea25229edd5250f5f0cff639d8.camel@realtek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4716f3c7bf3d34ea25229edd5250f5f0cff639d8.camel@realtek.com>

On Sat, Oct 07, 2023 at 01:20:43AM +0000, Ping-Ke Shih wrote:
> On Fri, 2023-10-06 at 13:17 -0700, Kees Cook wrote:
> > 
> > Prepare for the coming implementation by GCC and Clang of the __counted_by
> > attribute. Flexible array members annotated with __counted_by can have
> > their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> > array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > functions).
> > 
> > As found with Coccinelle[1], add __counted_by for struct
> > rtw89_btc_btf_set_slot_table.
> > 
> > Cc: Ping-Ke Shih <pkshih@realtek.com>
> > Cc: Kalle Valo <kvalo@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: linux-wireless@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/net/wireless/realtek/rtw89/coex.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/wireless/realtek/rtw89/coex.c b/drivers/net/wireless/realtek/rtw89/coex.c
> > index 4ba8b3df70ae..d66a1152c3f5 100644
> > --- a/drivers/net/wireless/realtek/rtw89/coex.c
> > +++ b/drivers/net/wireless/realtek/rtw89/coex.c
> > @@ -237,7 +237,7 @@ struct rtw89_btc_btf_set_report {
> >  struct rtw89_btc_btf_set_slot_table {
> >         u8 fver;
> >         u8 tbl_num;
> > -       u8 buf[];
> > +       u8 buf[] __counted_by(tbl_num);
> 
> This struct isn't defined properly. It should be 
> 
> struct rtw89_btc_btf_set_slot_table {
> 	u8 fver;
> 	u8 tbl_num;
> 	struct rtw89_btc_fbtc_slot tbl[] __counted_by(tbl_num);
> } __packed;
> 
> And, we should modify rtw89_btc_fw_set_slots() as well. 
> 
> Another struct 'rtw89_btc_btf_set_mon_reg' has similar problem.
> 
> So, NACK this patch. I will prepare one or two patches for them next week. 

Ah-ha; thank you!

> By the way, I have question about __counted_by(). Can I apply it to little/big-
> endian 'num'? Like
> 
> struct foo {
> 	...
> 	__le32 num;
> 	__le32 data[] __counted_by(num);
> }

Unfortunately not yet. I hope to see it extended in the future to allow
for arbitrary expressions. For this first step, it only handles native
sizes.

-- 
Kees Cook
