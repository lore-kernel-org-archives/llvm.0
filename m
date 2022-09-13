Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6616718
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 22:24:00 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id o70-20020a17090a0a4c00b00202f898fa86so3226188pjo.2
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 15:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Mn9WBo5vNNbs0NZJBbiO/Yi28wMF/lgC71dq4ukkoxE=;
        b=Dubdtf184nm84qSfvmgvXOaoKydU193nKrYzRylLXH5pTxCx/EiPSQhBryggNtpSPw
         7dhYt/5APvLYyi7HiY1eUJh4GW+Y1P6SbKRN4mFj8umVUMA/XAnIIxvgofSNBuk4Lc9z
         ejY8Jr+V8zRwa7zRzy5+ZzAMhRmrSW6mGEz0dMIY4SQhGrCvpPVmMHxv1HNChGiOb4b3
         F4rHo62tImNd98RCVCSodsXZrLh9NJqrKy1BF6m86EFHBG/LCQsil0p8qZZMPdviHgNQ
         rXCaImFIuECYoPeovbaFPCBiRi60XvRfm7I/HlUFGTSYcq4KIGNqr5+gq5OL92KZ0zYx
         xxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Mn9WBo5vNNbs0NZJBbiO/Yi28wMF/lgC71dq4ukkoxE=;
        b=y6FTkzJzL1Gk8RQkujCFAf9o27P01RE4JDI/hlSZvM5MNAY/FoY5+H0AtdTP/sWxOu
         +0Tf7BovBV18ukEIa85AGVfJMdkgwVmSkajkgoutAZQDZ2D7Ijn0IJ2uZQfiVxEBvFF2
         0qEXNhJMXJTLb6UmwG97hb0avgZEYjSjONYkr63exe/VBi6G15ur8tMb8cw8/Wv2s54p
         Fj1+8bMryp6tEALGENnT84apRAGVJ0OqaD5QAeuyz+ygzul7XjX73eXXvWEdSG/9KyrD
         KsX/Naaj9toVNrlAKsU+2IVGBNGXlyLgHWBTn2Gm1h95OtZ5LqlnKhuw0mVBrAgVk5Hr
         kbTA==
X-Gm-Message-State: ACgBeo19GKfvvAT2uLaPGOZBbzwpAXMWeJDDYO4AiA4eEQw0G8vW2eIH
	6dRisvqLPX4S4G80k05vcgllRfzvGAOsI1WRUd8=
X-Google-Smtp-Source: AA6agR6axQZpOW/L0c5XHtQuHfj2iBCzW+WtzyTHa/pa3vc6ipX86M2QMYAVLusKm7rTN+WViK7NZUzyaIPmTyNN9Rc=
X-Received: by 2002:a17:902:f782:b0:173:1206:cee0 with SMTP id
 q2-20020a170902f78200b001731206cee0mr33234283pln.130.1663107839649; Tue, 13
 Sep 2022 15:23:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220913205544.155106-1-nhuck@google.com>
In-Reply-To: <20220913205544.155106-1-nhuck@google.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 13 Sep 2022 19:23:46 -0300
Message-ID: <CAOMZO5CYaxdgn=Wh2CKsbJegb9hu40qEPOAEYy6x2qxpvPZseQ@mail.gmail.com>
Subject: Re: [PATCH] drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Tue, Sep 13, 2022 at 5:55 PM Nathan Huckleberry <nhuck@google.com> wrote:
>
> The mode_valid field in drm_connector_helper_funcs is expected to be of
> type:
> enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
>                                      struct drm_display_mode *mode);
>
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
>
> The return type of imx_tve_connector_mode_valid should be changed from
> int to enum drm_mode_status.
>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
