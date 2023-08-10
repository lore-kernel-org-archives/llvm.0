Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0BE1D2FE
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 10:47:54 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-52328e96869so969309a12.1
        for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 03:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691664473; x=1692269273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cL5UPVfVDvTPeQFgxKATIKznitcWyNXilLQp5uC80cI=;
        b=G6pHUHnoTRweCuka8lUSPfAXJhMF537/JJNKPyOuyVHJBy5UR0uOeLt8TW7dwXa4JD
         BEBO2xt/mITqpaAYcQ65ixrn/FU1/rF5Uo2CChXWuk6wBuA0iR1sT0O4SYChe32G/E9x
         2nV5gCCrVFq/EamTv7i9wU21Fs+zGTJWa/uPofqynaQLcuik19lqLog8NruRcQLUmRvp
         ZhPLwqEOmjw0yPYz8dSNNq957zC/gjOaH2cIpxW8F0j0tkGBbbzdykd2D6tbKd9B4k3W
         BXrzxJRZ78QSdp1HmG0pQX8ee0aNP460OnyCEwER3ENS5EBe7eOPBxLEYZ/CRizp28b8
         F6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664473; x=1692269273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cL5UPVfVDvTPeQFgxKATIKznitcWyNXilLQp5uC80cI=;
        b=Ptm9JPzjXCg4wXDyJMzm7wJG6hcgIx9H3t7jjvX9qe6hmz9wmZavhF9bYbr8Pdxf3s
         EF8Kmqs9HQfayHEnwbLqDFPS6GHybyHIFCsXZGVVT/L8RFcPK/KZ50UPWSP9+83wHM6i
         5GDfarf1oESzLpOiduN9+etQsrJoI3QwSWBk7r9A7WQ3QLN5mwfS2/8/U5CGY/OQPq/Y
         aoDu0jiYcxITvUnfGLpabPSRCU34DIkODdpCHIqFfhGTFK75L4EHvm1b5RTNYBUPRSkB
         Ffk30UNp+w1klcg9OKEge20hPixBbcl3wL/t04kxd8+6T4RAeY2d+VvA9eth324GDXan
         KI0g==
X-Gm-Message-State: AOJu0YweeeaME0HHJ4IgnjiMHk/LVl8dfdMW8fpZ2ZA/bQcV9RH+c/tm
	/+ChMgDrsowl5P+QCptioq0fpg==
X-Google-Smtp-Source: AGHT+IGXS1aQfmfAEnnnicUw9UC/MVRyaVegshXzkv6MrwG7ZgOG9nfvxHajlaARube88C1uKtE0IA==
X-Received: by 2002:a05:6402:28a:b0:523:406a:5f6 with SMTP id l10-20020a056402028a00b00523406a05f6mr1588660edv.12.1691664472836;
        Thu, 10 Aug 2023 03:47:52 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id x20-20020aa7cd94000000b0051dfa2e30b2sm653854edv.9.2023.08.10.03.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:47:52 -0700 (PDT)
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
Subject: [PATCH 1/4] ASoC: aw88261: Fix unitialized ret of aw88261_reg_update()
Date: Thu, 10 Aug 2023 12:47:43 +0200
Message-Id: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a branch in if() clause where aw88261_reg_update() could return
uninitialized value.  Pounted out by W=1 clang build:

  sound/soc/codecs/aw88261.c:651:7: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
                if (aw_dev->prof_cur != aw_dev->prof_index) {
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  sound/soc/codecs/aw88261.c:660:9: note: uninitialized use occurs here
        return ret;
               ^~~
  sound/soc/codecs/aw88261.c:651:3: note: remove the 'if' if its condition is always true
                if (aw_dev->prof_cur != aw_dev->prof_index) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/aw88261.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 82923b454dd4..fddba2f2de41 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -636,7 +636,7 @@ static int aw88261_dev_stop(struct aw_device *aw_dev)
 static int aw88261_reg_update(struct aw88261 *aw88261, bool force)
 {
 	struct aw_device *aw_dev = aw88261->aw_pa;
-	int ret;
+	int ret = 0;
 
 	if (force) {
 		ret = regmap_write(aw_dev->regmap,
-- 
2.34.1

