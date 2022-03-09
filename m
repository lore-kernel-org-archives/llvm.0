Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B832315BD
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 07:05:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [138.197.159.143])
	by gnuweeb.org (Postfix) with ESMTPSA id 934627E2B4;
	Wed,  9 Mar 2022 06:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1646809146;
	bh=XOsQg5Wg6D7N7E5H1D+daqbJz5RJM1qCGTDWtbNB08c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVo3Iaa0NIhYESCGguWkOvc+o9kTJzFhAyH9Lx5IXJIy+Q7O4zl1oLinQtoawnc9x
	 qV3+ueZu7m3VLLsCTwCv1BwqWSKoXVrD9+9XN8cCCCYi5FRoNepLcKDiQLY8RWwNpS
	 G4XN+QQNy44lglNZdimwgOpIWFpRXBWIqHFE58Sfv7KzQAXfA/rj2HURXK9x1z+lcZ
	 GEETY6W+I1hG9lj2bJ9wzwsCU/6EiKwBqKbaYyKHXXLw0m4KPXDOsXYwGLP0upc2K4
	 xJNCBD5bFDGbOmopb+RjOX63yl+x5/iWAdDcb5Jj7wiCXC9H9PPF/7PC29YIwZF2rv
	 OEWDTyfj1R7QA==
From: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alviro Iskandar Setiawan <alviro.iskandar@gmail.com>,
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Nugraha <richiisei@gmail.com>,
	llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	gwml@vger.gnuweeb.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: atmel: mchp-pdmc: Fix `-Wpointer-bool-conversion` warning
Date: Wed,  9 Mar 2022 06:58:49 +0000
Message-Id: <20220309065849.96165-1-alviro.iskandar@gnuweeb.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <202203091430.MLY27Bif-lkp@intel.com>
References: <202203091430.MLY27Bif-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In function mchp_pdmc_af_put(), Intel's kernel test robot reports the
following warning:

  sound/soc/atmel/mchp-pdmc.c:186:34: warning: address of array \
  'uvalue->value.integer.value' will always evaluate to 'true' \
  [-Wpointer-bool-conversion]

This is because we are using `uvalue->value.integer.value` which its
type is `long value[128];` for conditional expression and that array
will always decay to a non-NULL pointer. Using a non-NULL pointer for
conditional expression will always evaluate to true.

Fix this by changing it to `uvalue->value.integer.value[0]` as that's
what the mchp_pdmc_af_get() function sets.

To: Mark Brown <broonie@kernel.org>
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: Nugraha <richiisei@gmail.com>
Cc: llvm@lists.linux.dev
Cc: kbuild-all@lists.01.org
Cc: gwml@vger.gnuweeb.org
Cc: linux-kernel@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202203091430.MLY27Bif-lkp@intel.com
Fixes: 50291652af5269813baa6024eb0e81b5f0bbb451 ("ASoC: atmel: mchp-pdmc: add PDMC driver")
Signed-off-by: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
---
 sound/soc/atmel/mchp-pdmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index c44636f6207d..7b87f75c284c 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -183,7 +183,7 @@ static int mchp_pdmc_af_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mchp_pdmc *dd = snd_soc_component_get_drvdata(component);
-	bool af = uvalue->value.integer.value ? true : false;
+	bool af = uvalue->value.integer.value[0] ? true : false;
 
 	if (dd->audio_filter_en == af)
 		return 0;

base-commit: 50291652af5269813baa6024eb0e81b5f0bbb451
-- 
2.27.0

