Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C33D7B
	for <llvm@lists.linux.dev>; Fri,  2 Dec 2022 04:46:50 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id l127so3228371pfl.2
        for <llvm@lists.linux.dev>; Thu, 01 Dec 2022 20:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ToAtkmB3UW/Z4QJiw4Bpk2zHiZGqtOKBNj//sKNA6ok=;
        b=XU/BGI/X6BKC5tjX50ll8ytZwymHQDMQoO03htc8KgB6bNGoVlvWdy0Yva+aEYFRGS
         1TtOwkr7rsikZMvvSWFPel0mTobZhkeMNNmn/Kp0/NemQPJ8sAO1znbTfkZETg2jCIlv
         x/eiVULjiqpKrpOqTT60kdGbOiTXqnb1+RtAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ToAtkmB3UW/Z4QJiw4Bpk2zHiZGqtOKBNj//sKNA6ok=;
        b=w2IPmCWsgoxmAzEJp6LG+ohgdILvaH/99rA0y2MLiQRiYzAC1rjITrcqljH0FpKPTi
         nNIP7NDv+r/9Tga6JIbnXV4QKyMyaYQmrztcZ/AI88g4T++2XJQHuMRICxOOLXFEognN
         dKVg+htqDD3+O6VA2+faZaMNlOB7wBTVrGOYAXPnc2rzomYMELWqYslOQMlF1+Ng23X+
         kEbfBzo+ZKj0DraLXiq4jKnnsMtdHbvC8cLqZ7XwW5EBgbPeoO7xbNDQbVK1pI6b8A75
         e/YkmA8esO/iDLd9TQkzO6Pc69kxk5IklzXyRzFdQeXt+l4N20fnev9dg3qK+6PiD2e4
         eN0A==
X-Gm-Message-State: ANoB5pm0kK6c8Gr4KPa6JRG8iYcqMSbaJSwTp4+G4LRywrqfO6DS6HDw
	qAC+cJnAE+891mReNG6cKNCX2w==
X-Google-Smtp-Source: AA0mqf4U0bjGUApaDsyQLPrBCs0HpmHPmifKlyra3wRhE/eJwL1VLH75z53Ep2l9GtPyqeIEScUkUQ==
X-Received: by 2002:a63:2001:0:b0:477:b0d0:bbee with SMTP id g1-20020a632001000000b00477b0d0bbeemr42114357pgg.51.1669956409938;
        Thu, 01 Dec 2022 20:46:49 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k27-20020aa7973b000000b0057610894c71sm2460656pfg.209.2022.12.01.20.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 20:46:48 -0800 (PST)
Date: Thu, 1 Dec 2022 20:46:47 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Daniel Palmer <daniel@thingy.jp>, kernel test robot <lkp@intel.com>,
	Romain Perier <romain.perier@gmail.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] rtc: msc313: Fix function prototype mismatch in
 msc313_rtc_probe()
Message-ID: <202212012043.C4ED0824@keescook>
References: <20221118233101.never.215-kees@kernel.org>
 <ef3c1a62-029e-ffae-8a37-fde35a8235d5@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef3c1a62-029e-ffae-8a37-fde35a8235d5@wanadoo.fr>

On Sat, Nov 19, 2022 at 09:05:28AM +0100, Christophe JAILLET wrote:
> Le 19/11/2022 à 00:31, Kees Cook a écrit :
> > With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> > indirect call targets are validated against the expected function
> > pointer prototype to make sure the call target is valid to help mitigate
> > ROP attacks. If they are not identical, there is a failure at run time,
> > which manifests as either a kernel panic or thread getting killed.
> > 
> > msc313_rtc_probe() was passing clk_disable_unprepare() directly, which
> > did not have matching prototypes for devm_add_action_or_reset()'s callback
> > argument. Add a wrapper and remove the cast.
> > 
> > This was found as a result of Clang's new -Wcast-function-type-strict
> > flag, which is more sensitive than the simpler -Wcast-function-type,
> > which only checks for type width mismatches.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: https://lore.kernel.org/lkml/202211041527.HD8TLSE1-lkp@intel.com
> > Cc: Daniel Palmer <daniel@thingy.jp>
> > Cc: Romain Perier <romain.perier@gmail.com>
> > Cc: Alessandro Zummo <a.zummo@towertech.it>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-rtc@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >   drivers/rtc/rtc-msc313.c | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/rtc/rtc-msc313.c b/drivers/rtc/rtc-msc313.c
> > index f3fde013c4b8..36e3e77f303e 100644
> > --- a/drivers/rtc/rtc-msc313.c
> > +++ b/drivers/rtc/rtc-msc313.c
> > @@ -177,6 +177,13 @@ static irqreturn_t msc313_rtc_interrupt(s32 irq, void *dev_id)
> >   	return IRQ_HANDLED;
> >   }
> > +static void msc313_clk_disable_unprepare(void *data)
> > +{
> > +	struct clk *clk = data;
> > +
> > +	clk_disable_unprepare(clk);
> > +}
> > +
> >   static int msc313_rtc_probe(struct platform_device *pdev)
> >   {
> >   	struct device *dev = &pdev->dev;
> > @@ -224,7 +231,7 @@ static int msc313_rtc_probe(struct platform_device *pdev)
> >   		return ret;
> >   	}
> > -	ret = devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare, clk);
> > +	ret = devm_add_action_or_reset(dev, msc313_clk_disable_unprepare, clk);
> >   	if (ret)
> >   		return ret;
> 
> Hi,
> 
> another way to fix it, is to use devm_clk_get_enabled().
> 
> It removes some LoC instead of introducing some new ones and saves a few
> bytes of memory.

Hrm, I'm not familiar with the clk stuff here -- how do I use it? Should
it just be like this? (The NULL argument is ok?)

diff --git a/drivers/rtc/rtc-msc313.c b/drivers/rtc/rtc-msc313.c
index f3fde013c4b8..8d7737e0e2e0 100644
--- a/drivers/rtc/rtc-msc313.c
+++ b/drivers/rtc/rtc-msc313.c
@@ -212,22 +212,12 @@ static int msc313_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	clk = devm_clk_get(dev, NULL);
+	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(dev, "No input reference clock\n");
 		return PTR_ERR(clk);
 	}
 
-	ret = clk_prepare_enable(clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable the reference clock, %d\n", ret);
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare, clk);
-	if (ret)
-		return ret;
-
 	rate = clk_get_rate(clk);
 	writew(rate & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_L);
 	writew((rate >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_H);

-- 
Kees Cook
