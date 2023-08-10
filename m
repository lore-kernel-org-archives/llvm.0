Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC4E1EA6E
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 10:48:03 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fe11652b64so1132864e87.0
        for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691664481; x=1692269281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzMSq7HLSHN1HFLKAp83kiHFzC/dRhYUs++4UrDqaOA=;
        b=UGqNEmNN1GRZd/cQPQ8BSIM/P3HO1mpPaFsq5qWJJQp/cf2hqFCbXFb+QeRHXLlMKG
         7zasTTRuG7one9GfxqSB1uSZzw6Wy2owDcgscp2LVQ0ZEYKU/dIgcZ2X7SMvcCIuMvnP
         fT+UGY1nG6W+GX8JH8DDyNGJS0INeWEZe/xIc7W7rVuY1LUon1MxyAMsMXy/QaIJnAs5
         yOJES8JPBZNK0XFRdKrYta4LXxKYP8bpG35w5ltlkGbEGVbpp3kh+yoIZax3cM3SBv4E
         PjezXo8hgAwGpuJ1o+WPULiVfbGjx4KGX4Oer/736Jql6eOYkB/sibEnHmDbRKKrJh36
         Xrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664481; x=1692269281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzMSq7HLSHN1HFLKAp83kiHFzC/dRhYUs++4UrDqaOA=;
        b=J40DB0dcnONqBeCnDsDFO1X5NkRXbIiD1qMZNVArYcoMEZBN7NZcaZyThH7x93+QJG
         z5nzTtW4idsRTMEg9Kuvlhm7FrNGKSDvgxEOGCtNVv9LIuHeZ42rCqbV2kcvLzV4xCCV
         5Wp9MC/G5MRdmH/Bqvmu6wKbVm1wzJFtOA6rn5JFtH6DXW/vTa17WRfpJCHcvTD83304
         IcdICDNZ6IWVfmVGvzFk9i7ZSmj/jaCz4Und/FtniAzlAuQqMDnCUNWAA20Q8RpWrc/c
         PQBPFRYenEaFJLxKSYGn8UMf+3x6ulJvHP23VmTIVPZxT8cQHFR04qX/xoOBaxZlVIzq
         EcqQ==
X-Gm-Message-State: AOJu0YxsbMyTX2KIaIPxlA/l5iY9sYbzTjXTCoi8CXxcviB1uk1zpCto
	Lo/dlAvt6wFR5TyU2rRltrbzIA==
X-Google-Smtp-Source: AGHT+IEP9ckwBL1/0mfPqosWIWOXy9uevpV0Iq3ArH10HdVvSOvTyx5j3EETKE0Mzgr1fyviNz4aeA==
X-Received: by 2002:a19:9159:0:b0:4fe:a2e:890c with SMTP id y25-20020a199159000000b004fe0a2e890cmr1439491lfj.49.1691664481535;
        Thu, 10 Aug 2023 03:48:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id x20-20020aa7cd94000000b0051dfa2e30b2sm653854edv.9.2023.08.10.03.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:48:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] ASoC: rockchip: fix Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 12:47:48 +0200
Message-Id: <20230810104749.164827-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
References: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'version' is an enum, thus cast of pointer on 64-bit compile test with
W=1 causes:

  rockchip_pdm.c:587:18: error: cast to smaller integer type 'enum rk_pdm_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/rockchip/rockchip_pdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 52f9aae60be8..678989b25e57 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -584,7 +584,7 @@ static int rockchip_pdm_probe(struct platform_device *pdev)
 
 	match = of_match_device(rockchip_pdm_match, &pdev->dev);
 	if (match)
-		pdm->version = (enum rk_pdm_version)match->data;
+		pdm->version = (uintptr_t)match->data;
 
 	if (pdm->version == RK_PDM_RK3308) {
 		pdm->reset = devm_reset_control_get(&pdev->dev, "pdm-m");
-- 
2.34.1

