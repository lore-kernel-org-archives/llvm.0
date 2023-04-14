Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB2581E
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 09:44:40 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id y17so15833312vsd.9
        for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 02:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681465479; x=1684057479;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A9qtR8MfLyUro92cvio9eras0UzllKy7Sr+yZKv+eGI=;
        b=nhby+tqpg7YJ3N4OPK8KreZkbQg6ksdB/JTX68tRFhDyAoY8mLfE8+n4fUhA1he3SH
         syCBC1bzBBLpYlc3A6zC35W3pKoXnhoZAkQFOHA/EBh8KWjR/hpHC7ViDP61qU78nVsA
         X1p10pbqhmbWwu2QEn9P5BQVleAflNQwm7V1IzntisfmnxN/M7cEMZCwJVQ9TMocTEHo
         V9MmnYyG91LKOtQl49ZnItrsYJRFZY45kRDhK9g6hVxsu0PsjFTlEPrINxJbMYMkp/gO
         2r+Cldw2TYaPuiQZ++ihVAXcfiReaeZ1SA6hYyME9IASPr7mnD1wwXGdLfp1kA9c/Llt
         V31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681465479; x=1684057479;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A9qtR8MfLyUro92cvio9eras0UzllKy7Sr+yZKv+eGI=;
        b=BCdu4NiC18UNcDSrx5oZnZSjtH2MgRp7UCONjSmPRgVindBpa3KAjB6+G+QFlqllrk
         i6RBAOevwVHSjDFyjxFS2I+ypwB+xCmAzzLM9hajlDX1WRCkcGAz+gC2Onxo1/CEis0W
         FJVdoQtGWqD7I1StWfxnhkvx9bdmbt1LTQZnlv/98srNYy0MMqOL9Cm3NdLY9zaM6nOH
         /mkXYt61JChp8eTIzb9BW5HcD9mIm5MOcRIsjXvHm0YJlW5WpwK5oEainZy7bbOTRsa/
         bnvIDqMQXQvuWWXSLQMAlxag+r6FxBSIyH5MSV4uUBwCNlFr8ZkRrJFF3dC4wIfB50hs
         2kgA==
X-Gm-Message-State: AAQBX9fSrStq6723NQImYqzBrJjIH2l7KMLZUWvw3o1S81JVEy3kFpWT
	qSajT/E/IEPz2IFUPIqOMvER12FjHrEfL87EFLVOvw==
X-Google-Smtp-Source: AKy350bKBwBmi6cLGqm9/lBs1aIURMXTFZrrJBXiy+LtGEE/iALnQZQfMf/HVW2YEzuMSo6l8V/a9yUF8SDrFi8kr64=
X-Received: by 2002:a67:cb8d:0:b0:42e:3b77:b77 with SMTP id
 h13-20020a67cb8d000000b0042e3b770b77mr1289462vsl.1.1681465478942; Fri, 14 Apr
 2023 02:44:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 14 Apr 2023 15:14:27 +0530
Message-ID: <CA+G9fYu4o0-ZKSthi7kdCjz_kFazZS-rn17Z2NPz3=1Oayr9cw@mail.gmail.com>
Subject: next: allmodconfig: phy-mtk-hdmi-mt8195.c:298:6: error: variable
 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	llvm@lists.linux.dev, linux-phy@lists.infradead.org, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>, Kishon <kishon@ti.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Netdev <netdev@vger.kernel.org>, 
	chunfeng.yun@mediatek.com
Content-Type: text/plain; charset="UTF-8"

Following build warnings / errors noticed while building allmodconfig for arm64
with clang-16 on Linux next-20230414.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
'ret' is uninitialized when used here [-Werror,-Wuninitialized]
        if (ret)
            ^~~
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize
the variable 'ret' to silence this warning
        int i, ret;
                  ^
                   = 0
1 error generated.


--
Linaro LKFT
https://lkft.linaro.org
