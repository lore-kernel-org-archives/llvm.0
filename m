Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57236BA22
	for <llvm@lists.linux.dev>; Thu, 23 Nov 2023 05:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sLa0CqEc"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c5b7764016so5640391fa.1
        for <llvm@lists.linux.dev>; Wed, 22 Nov 2023 21:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700718521; x=1701323321; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=90wieb6M2VCCvedLkH0yxZnXyP84LqC+5ZlCgC+WSG0=;
        b=sLa0CqEc8/h8Sqy68QWU/CLVtQQ/o5E8d0XmKH9T+41OB/I38sQDwb8DsEWl18Bqk4
         QcWnrMIIOJqnWVEvvXgp8v/Q19ErpDXs17UWkTrS8OmdsaJ2urjgRIV/po7qC/bzXGHB
         NSHNOkelmy7qkhPtlMQJhRrsZ+EC7jDHA60q6PMiW9i/ItQ5kxLB2CxmKxE2Gqakv/z/
         oWPuUjQdiIHTDFr+VmEzR5E4EHZtC4EHWBIbRFld7mC/bnEUek6D+UC5ZuuYHb52M+63
         L10OZldBvgw/1k7ZXv/1YK45y98z0dlmOiWwUJ/1XvpiSiSaokwU8fT2rRuJMK8drx6s
         /PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700718521; x=1701323321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90wieb6M2VCCvedLkH0yxZnXyP84LqC+5ZlCgC+WSG0=;
        b=MMEm+enviomn31dC4Arpqex67vnb6y1jzlSqV+PTNHZtV28fARXprL1X8h6HEQFGTc
         zgwlYbEc5rarDlf8yJHIMgu7fyuZ8SZ5+hKT/JfsykPrQFptm7BKomrpi/vnXpULHUbk
         9HiJBO7yF4/P1lC2/zFnZn4nUjwy/I8EeBcjR0WjQ8MeKjqt7ct4fvR5D7+TWt5RFIu6
         7vZYZmMx1JsU4tVPII58KenePQCKzop3xH5anAoRFMxpcNahWtOxfK4qtL2+ADoxjNma
         UuKicv4FxVVrD0MAUuvI1GEgQB8e81CMAXmb/WUtMpudpxRpaxYJQ4etOwQ/8bX4oIL1
         Cpkg==
X-Gm-Message-State: AOJu0YxX5lZhLP2/uvFQvYRKQr5Ea3Hr6IU+UBaRJKJaVrW76/2xoIUm
	hUzyKQAhirQDYsxHmxygs3ATuw==
X-Google-Smtp-Source: AGHT+IHybDEjVgqWWR627nXsgR1xndJTpRSJuSd2v2BEMphvSQGkt9g0NQ3OT7NrcfzcnPXWmVl/DA==
X-Received: by 2002:a2e:9797:0:b0:2b6:df71:cff1 with SMTP id y23-20020a2e9797000000b002b6df71cff1mr1515717lji.52.1700718521202;
        Wed, 22 Nov 2023 21:48:41 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id hg15-20020a05600c538f00b0040849ce7116sm1424154wmb.43.2023.11.22.21.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 21:48:40 -0800 (PST)
Date: Thu, 23 Nov 2023 08:48:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: pkshih@realtek.com, kvalo@kernel.org, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com, lizetao1@huawei.com,
	linville@tuxdriver.com, Larry.Finger@lwfinger.net,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH wireless-next 2/2] rtlwifi: rtl8821ae: phy: fix an
 undefined bitwise shift behavior
Message-ID: <caf95d1d-f893-4553-9d0a-91d16f04182d@suswa.mountain>
References: <2ec14802-78b0-4a3f-a730-19e95ec8d359@suswa.mountain>
 <a9032c3a-8221-11fb-ed15-2c57c3933d28@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9032c3a-8221-11fb-ed15-2c57c3933d28@nfschina.com>

On Thu, Nov 23, 2023 at 09:33:06AM +0800, Su Hui wrote:
> On 2023/11/22 21:02, Dan Carpenter wrote:
> > On Wed, Nov 22, 2023 at 05:02:12PM +0800, Su Hui wrote:
> > > Clang staic checker warning:
> > > drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c:184:49:
> > > 	The result of the left shift is undefined due to shifting by '32',
> > > 	which is greater or equal to the width of type 'u32'.
> > > 	[core.UndefinedBinaryOperatorResult]
> > > 
> > > If the value of the right operand is negative or is greater than or
> > > equal to the width of the promoted left operand, the behavior is
> > > undefined.[1][2]
> > > 
> > > For example, when using different gcc's compilation optimizaation options
> > > (-O0 or -O2), the result of '(u32)data << 32' is different. One is 0, the
> > > other is old value of data. Adding an u64 cast to fix this problem.
> > > 
> > > [1]:https://stackoverflow.com/questions/11270492/what-does-the-c-
> > > standard-say-about-bitshifting-more-bits-than-the-width-of-type
> > > [2]:https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf
> > > 
> > > Fixes: 21e4b0726dc6 ("rtlwifi: rtl8821ae: Move driver from staging to regular tree")
> > > Signed-off-by: Su Hui <suhui@nfschina.com>
> > > ---
> > >   drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c | 8 ++++----
> > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
> > > index 6df270e29e66..89713e0587b5 100644
> > > --- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
> > > +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
> > > @@ -106,7 +106,7 @@ u32 rtl8821ae_phy_query_bb_reg(struct ieee80211_hw *hw, u32 regaddr,
> > >   		regaddr, bitmask);
> > >   	originalvalue = rtl_read_dword(rtlpriv, regaddr);
> > >   	bitshift = _rtl8821ae_phy_calculate_bit_shift(bitmask);
> > > -	returnvalue = (originalvalue & bitmask) >> bitshift;
> > > +	returnvalue = (u64)(originalvalue & bitmask) >> bitshift;
> > This is a right shift, not a left shift. << vs >>.
> 
> Hi,
> 
> It's same for right shift and having a really weird result.
> 
> The result of '(u32)data >> 32' is different when using different compiler.
> Clang: "(unsigned int)41 >> 32" = 2077469672
> Gcc: "(unsigned int)41 >> 32" = 0

Ah.  Sorry.  I had forgotten that it was undefined either way...

regards,
dan carpenter

