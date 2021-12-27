Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B7A168
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 18:15:13 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id by39so26947010ljb.2
        for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 10:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QePlw89EO/5sfYAaVucIDMIjwFM9+kJMi4TaNo3JnOA=;
        b=mJan/ZUi7CoFG1RPg70ekRe5waKZUSmgRBMCrqjwvLl+yb2C4V0ic+4DZzxsdadXeM
         YcTZJ6XZQOB+V47DB9uIN/EsBKvYtDZFm65kVRaxP1X/I2RDhsXMD75wGDQicxEP+elY
         uZTT3xjZ6zESZE5ZrFORsymdskp6WkQw/vMl3pl6eeDkXa5SIudm1Rzx6KZ5giB07gi5
         Rm6xskXchAgDoBECm/fzNWwPHT1rbd+XZsU9wUBap/ij4XunY80DlDozEwxCzcznwvEV
         YGs3ldtDiXsyNfNzA03tH6eyLBJElQO/6W2atBlJtG1ynl1SjEVC2wUx1xwsX5K6+H1/
         ukPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QePlw89EO/5sfYAaVucIDMIjwFM9+kJMi4TaNo3JnOA=;
        b=QulxUEaeSfo4VTwCNxHsQFWxsv5zTycyDgD1M/vW59XAZGAXAme/0b6Ottmor5f5ku
         Ph0CPxr9BWpOJ1t6Q2p1VY/A5rH6vfYIAFe9epsp4Agajc7lM+xDvYDD3XMzE0TEmo/a
         34nqsMagv9vxwYwM3oxFQzaSXDiH5JnbpiyBGUOVW2zMHhLBOQO/zfqdI2/V0t7Qn+Ye
         x32nM9lNwGmLAZo/SrM0Do5QSZjS0zoL3VkFbiOXLm/vf8/a+yQt0sfdnQFbxqihJy+z
         mf3WADKF64G+F8QDM5vr2/MvUMjDn+gy2Idjy0FWjcEGxLajZgk/rfHac2Q+ftmUnU0t
         Vcag==
X-Gm-Message-State: AOAM530mx727DDkPJjlSM5Ese1xNWeq6u49zGAsBAbF9j1o0rrYHw5md
	TtaUvMucPZQ4qDUqgpj5IAyzmiQL5fHguoIN+4k=
X-Google-Smtp-Source: ABdhPJxf7Q2Fn/Wu2+EWuxExt+I1gW20WfQutkkcPaU44A8BWZiNzKAY5elXHPtIrFVSg8zmFWhl4rBIYHxrPI/xIYQ=
X-Received: by 2002:a2e:8553:: with SMTP id u19mr11548095ljj.6.1640628911977;
 Mon, 27 Dec 2021 10:15:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211227080649.32275-3-qianggui.song@amlogic.com> <202112280001.MfQS59Vr-lkp@intel.com>
In-Reply-To: <202112280001.MfQS59Vr-lkp@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Dec 2021 19:15:00 +0100
Message-ID: <CAFBinCB96pGwxBhUxmwihvW+xWF4ex1C-XYO8u6zm6RsmHKaKg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: meson: add pinctrl driver support for
 Meson-S4 Soc
To: Qianggui Song <qianggui.song@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hello Qianggui,

On Mon, Dec 27, 2021 at 5:16 PM kernel test robot <lkp@intel.com> wrote:
[...]
> >> drivers/pinctrl/meson/pinctrl-meson-s4.c:9:10: fatal error: 'dt-bindings/gpio/meson-s4-gpio.h' file not found
In v1 of this series you also included a patch "dt-bindings: gpio: Add
a header file for Amlogic Meson S4".
Rob gave his Acked-by tag which means that you need to keep the patch
in the series but add his Acked-by above your Signed-off-by line.
Patches should only be dropped from a series if they are not relevant
anymore or if they were already applied to a tree by the maintainer.
In this case Rob just gave his Acked-by but the patch was not applied
by any maintainer yet.

Please send a v3 which adds the header file patch back and includes
Rob's Acked-by in there.


Thank you
Martin
