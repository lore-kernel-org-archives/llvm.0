Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B42C80
	for <llvm@lists.linux.dev>; Thu, 25 Nov 2021 08:26:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06EB361165
	for <llvm@lists.linux.dev>; Thu, 25 Nov 2021 08:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637828762;
	bh=u4vZvOVOvJSCMC746/RK7I5lvy59gOAI6OaKWr4pPEo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YxUdPKHuWPnWu5BUFtJ8tRPLFtYj7VzYVbl2eAKK6rpVUKBVJUYRrzant07c47iXy
	 1Th0ENuToBGAdIzyyGOeLp2GFjzirj+J7nhnjZVQeY3Ovlfx+w62ZAuP7+oRmhNc8z
	 c21O420BuxGBEKzWlQM0lo/UA0CIaRZXCp/L5+HC4PO8OtHQlym4kSKATHhQ7ZdO9u
	 BkDOIx7fwjyxXRGj9E/cHkBl+IAWxzr2RMFvJ1cl3yxKEZT/Yyoz/WY6hacZXwDuqx
	 tPpt0JLsiCnN3YWjwo0tlRVzeEZEEdxgsnOXzTcTEjaeKwcUTti9i/GQeb6mBy3L0i
	 oU5G/bkya001w==
Received: by mail-wm1-f46.google.com with SMTP id m25-20020a7bcb99000000b0033aa12cdd33so464816wmi.1
        for <llvm@lists.linux.dev>; Thu, 25 Nov 2021 00:26:01 -0800 (PST)
X-Gm-Message-State: AOAM5302ZH8uT/IPgse22ZkTcS2Gor/SeVzqr2jigRbc+LCXSr9h9da4
	6Q8jYxznJ/xYIPb6pAslp3ARqM9HKgR4Qt0UGuo=
X-Google-Smtp-Source: ABdhPJy6foEBtvTrMw2IiNDwnqT6LrlvOZ5dh+nV+5ANTzOv/KSjYNBzI3JdqYrvuqNPFDqYXIA6Rrm24+G/p6n3bl0=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr4817606wmi.173.1637828760332;
 Thu, 25 Nov 2021 00:26:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211115085403.360194-8-arnd@kernel.org> <202111251538.x6sJNCka-lkp@intel.com>
In-Reply-To: <202111251538.x6sJNCka-lkp@intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 25 Nov 2021 09:25:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17=OEtgkfRpzK8+-N37XqecSHP=WMZsu16Ef-WMp-1HQ@mail.gmail.com>
Message-ID: <CAK8P3a17=OEtgkfRpzK8+-N37XqecSHP=WMZsu16Ef-WMp-1HQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] dmaengine: qcom-adm: stop abusing slave_id config
To: kernel test robot <lkp@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-spi <linux-spi@vger.kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 25, 2021 at 8:57 AM kernel test robot <lkp@intel.com> wrote:
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/dma/qcom/qcom_adm.c:712:18: warning: no previous prototype for function 'adm_dma_xlate' [-Wmissing-prototypes]
>    struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
>                     ^
>    drivers/dma/qcom/qcom_adm.c:712:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
>    ^
>    static
>    1 warning generated.

I noticed this mistake slipped into v2 as well, the function needs to
be marked 'static'.

Vinod, let me know how you want me to address this. Should I just fold
the fix (see below)
and the final Acks into the patch and send an updated pull request, or
do a complete v3
submission?

      Arnd

8<---
diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
index bb338b303af6..65697bee4db0 100644
--- a/drivers/dma/qcom/qcom_adm.c
+++ b/drivers/dma/qcom/qcom_adm.c
@@ -709,8 +709,8 @@ static void adm_channel_init(struct adm_device
*adev, struct adm_chan *achan,
  *
  * Returns pointer to appropriate dma channel on success or NULL on error.
  */
-struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
-                              struct of_dma *ofdma)
+static struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
+                                     struct of_dma *ofdma)
 {
        struct dma_device *dev = ofdma->of_dma_data;
        struct dma_chan *chan, *candidate = NULL;
