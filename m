Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AA18F45
	for <llvm@lists.linux.dev>; Wed, 10 May 2023 12:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A45C4339B;
	Wed, 10 May 2023 12:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683722344;
	bh=f0fP/tgxFKsPgjnscQ94ka4Hd7mBxCyklUQ2gUyL6IQ=;
	h=From:Date:Subject:To:Cc:From;
	b=tNFNAF35JsCGohGM63hPwU4+ItmPRKpaN3yBaORCq9j4E24GrMrxqbYUPuZR8g/oW
	 d9L69xe7/7tQ1zPv9bda95KQhpHe5fvko8N8uB8D2BPO4IFiy6ULAQHdnRnwRQ/Kap
	 dGS1vHBbPGLkcFbWBXXqafhpAxtZO44S58Qq0IjYPV6x/88Jgbe0OMA/JaAlaJwyKw
	 89IwW/R6bWp9TS/t43/AGu/JHrRx0lV+Z4x2yOUphC7cp+B7bl6sK/xj4B8A53pCk0
	 Wu0bQWHYPX/bYKOqm6l6AOy9Lbb9zb476+hYwHXNcceJp0O5pFBhdV7G9nto20aGHk
	 23wbO0TkA4gkw==
From: Simon Horman <horms@kernel.org>
Date: Wed, 10 May 2023 14:39:00 +0200
Subject: [PATCH] mmc: meson-mx-sdhc: Avoid cast to incompatible function
 type
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230510-mmc-sdhci-msm-function-cast-v1-1-5ae634b24fbd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGOQW2QC/x2N0QrCMAxFf2Xk2UDbMXD+ivjQpakNrFWaTYSxf
 zf4eA7ccw9Q7sIKt+GAzh9ReTUDfxmASmxPRknGEFwY3eQd1kqoqZBg1Yp5b7TZBCnqhpnCPM1
 XH9OYwQpLVMalx0bFGm1fV5Pvzlm+/8v74zx/8Nf47YIAAAA=
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, llvm@lists.linux.dev, 
 Simon Horman <horms@kernel.org>
X-Mailer: b4 0.12.2

Rather than casting mmc_free_host to an incompatible function type,
provide a trivial wrapper with the correct signature for the use-case.

Reported by clang-16 with W=1:

 .../meson-mx-sdhc-mmc.c:791:38: error: cast from 'void (*)(struct mmc_host *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
         ret = devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_host,
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ./include/linux/device.h:265:38: note: expanded from macro 'devm_add_action_or_reset'
         __devm_add_action_or_reset(release, action, data, #action)
                                            ^~~~~~

The same approach is taken in litex_mmc.c with the function
litex_mmc_free_host_wrapper(). There may be scope for consolidation.

No functional change intended.
Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/mmc/host/meson-mx-sdhc-mmc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
index da85c2f2acb8..97168cdfa8e9 100644
--- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
@@ -776,6 +776,11 @@ static void meson_mx_sdhc_init_hw(struct mmc_host *mmc)
 	regmap_write(host->regmap, MESON_SDHC_ISTA, MESON_SDHC_ISTA_ALL_IRQS);
 }
 
+static void meason_mx_mmc_free_host(void *data)
+{
+       mmc_free_host(data);
+}
+
 static int meson_mx_sdhc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -788,8 +793,7 @@ static int meson_mx_sdhc_probe(struct platform_device *pdev)
 	if (!mmc)
 		return -ENOMEM;
 
-	ret = devm_add_action_or_reset(dev, (void(*)(void *))mmc_free_host,
-				       mmc);
+	ret = devm_add_action_or_reset(dev, meason_mx_mmc_free_host, mmc);
 	if (ret) {
 		dev_err(dev, "Failed to register mmc_free_host action\n");
 		return ret;

