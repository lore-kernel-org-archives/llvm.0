Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194684;
	b=jD0yKrV7F9wxVEgN/EEMOb9T0MWD3FU9uGUjfwjw9XtvbfHJ2mLT9oQJpLRwTlKEeq5G
	 ZLlu0f0OrQJXwZ4v0LdTfEcbK4HvC5tJToDzrZnuVecXJKmfbJPaZdg1SyxPIf2W5LkM9
	 MYglpFqD8c531+M5XJf+3l/bSlnXxZHZshYIRXWn2tmdZEMxrDUmiQE8auf2utuZ4y4A4
	 yzb+v/CjDeBncz+HHKn5eoQzfeR3fosjhfWe/QqY73XWj8et+iTBCYCAp3Q/II3El+Bb1
	 cmT5YIKyrMeWnyF/LqTgOXIbBefUTnbboIKNR9AbiaskHMp/0sYXF4x1foOgn2MAa3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194684;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=jFjDMeCOUfqx4tB4jN7qVpzUMoCyGqzAHhigGnXoPxQ=;
	b=i7qXMuQmiHAn2e9F4d46GOTEhPNSrR53PBs2jHDA6Vzsu0KpnMMmxpiwNgu46vHIrnVh
	 J2rPtSe/kKH9QBJg7ss80kjjf8J43MaUibkBS8/ByUqij01C3ldW8cxIVuCeaK0IUZGeo
	 0iIXUjcJounrdgjMwdyf26lBxMzUhQ13Jgw8R2ssRsIHUfFvx/LREkwd5krVmqolgypdz
	 KCu9R2McTllJDfEMrPHYFyu07tOmkHxHldp/eqapAFpiG+Hib8yqrmAEFJ19byyQ1+RvG
	 n4qGJ0cehK7HzwHHT6STW4Ig74qvRs1Lur5ZzRBIUmdIb12rAaFr35YicrbuqzS1w7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=SuJDtysg;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA13606A33B
	for <llvm@lists.linux.dev>; Mon,  9 Nov 2026 03:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BA13606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=SuJDtysg
X-UUID: 165f026cdbed11f18dc8c9802ae25ab1-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jFjDMeCOUfqx4tB4jN7qVpzUMoCyGqzAHhigGnXoPxQ=;
	b=SuJDtysgK3t4uXc5L/Co7akhTjokQkP0yZ9y7qumuX1JFentI4BoQnK1LH17CMGI7q0awAM38gBPlz4uBCW+QUCwJWD2q+KTW2/zMiYqAgghCoDPdX7/wie4zItAsy2d/9S2xSN0ai9OjS5IP0WntH6x52YMDRPubGgSpCPQZKk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ef3cd6c4-314e-4ba2-879a-0f6e6e03732e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:fb28f2ce-02bc-447e-ab88-2baec399874a,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 165f026cdbed11f18dc8c9802ae25ab1-20261109
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1272339578; Mon, 09 Nov 2026 11:24:35 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Nov 2026 11:24:34 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Nov 2026 11:24:33 +0800
From: Cyril Chao <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<llvm@lists.linux.dev>, Cyril Chao <cyril.chao@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Cyril Chao
	<Cyril.Chao@mediatek.com>
Subject: [PATCH v1 1/1] ASoC: mediatek: mt8189: Use AVOUT for DP and HDMI jacks
Date: Mon, 9 Nov 2026 11:24:09 +0800
Message-ID: <20261109032424.625004-2-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
References: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The HDMI codec reports DP and HDMI connection status as SND_JACK_AVOUT,
which combines SND_JACK_LINEOUT and SND_JACK_VIDEOOUT. The machine driver
creates these jacks with SND_JACK_LINEOUT, omitting the video-output
capability and its SW_VIDEOOUT_INSERT events when
CONFIG_SND_JACK_INPUT_DEV is enabled.

Use SND_JACK_AVOUT for both jack creation and pin masks to match the
codec's audio/video output reporting.

Fixes: d218ea171430 ("ASoC: mediatek: mt8189: add machine driver with nau8825")
Signed-off-by: Cyril Chao <Cyril.Chao@mediatek.com>
---
 sound/soc/mediatek/mt8189/mt8189-nau8825.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-nau8825.c b/sound/soc/mediatek/mt8189/mt8189-nau8825.c
index 5d652d0cf01e..b551477cef51 100644
--- a/sound/soc/mediatek/mt8189/mt8189-nau8825.c
+++ b/sound/soc/mediatek/mt8189/mt8189-nau8825.c
@@ -74,14 +74,14 @@ enum mt8189_jacks {
 static struct snd_soc_jack_pin mt8189_dp_jack_pins[] = {
 	{
 		.pin = "DP",
-		.mask = SND_JACK_LINEOUT,
+		.mask = SND_JACK_AVOUT,
 	},
 };
 
 static struct snd_soc_jack_pin mt8189_hdmi_jack_pins[] = {
 	{
 		.pin = "HDMI",
-		.mask = SND_JACK_LINEOUT,
+		.mask = SND_JACK_AVOUT,
 	},
 };
 
@@ -369,7 +369,7 @@ static int mt8189_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
-	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_LINEOUT,
+	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_AVOUT,
 					 jack, mt8189_dp_jack_pins,
 					 ARRAY_SIZE(mt8189_dp_jack_pins));
 	if (ret) {
@@ -394,7 +394,7 @@ static int mt8189_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
-	ret = snd_soc_card_jack_new_pins(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+	ret = snd_soc_card_jack_new_pins(rtd->card, "HDMI Jack", SND_JACK_AVOUT,
 					 jack, mt8189_hdmi_jack_pins,
 					 ARRAY_SIZE(mt8189_hdmi_jack_pins));
 	if (ret) {

base-commit: c937f492dd40a8398d955cf0f4f9e11d7268bcb5
-- 
2.45.2

