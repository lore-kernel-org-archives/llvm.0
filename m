Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194682;
	b=ERbNyB9gp1xP/ZXIRyF6fxnj7EON6HBL/2sqt604ooNQcbj//AtXZJw0URUrgvSTcML2
	 XyvuwWdh06+UP87uA09sCUCddThouyuhCnvgJhR3ZgJgbLILO60P16RPieD5nAkUtNuZt
	 QNQ8gMc289hTVUrljM0dQcVq6I2l6TyG0wdh+BO2MJVf6OejDGEnHiI0e90guTJzDmfFR
	 WvW3U4qQb9ojgjDJ04irk5Fv38vMXikcVNM8HdBQsyX1mMugJA6vfijNIiHrwsTMbp6ZE
	 Xu9Ks7UUvXndAkhx6nJuBznZksf3aTCcdkAlxXEKg8fYddtYeb9wcY910XNb820pJZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194682;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=JfvogYuBx2ioQGw2JVVRY053U98MXFmHHk44uXXHgBQ=;
	b=c7wYmjplj9hxOizlsOxpPqVxuKjuJx+ARYxupzW3wl516E+Hc1qqFW6o/moZ4HmrElGd
	 b61gS/WbEboRhSoquvjROKIhvJi++3cjv4P1kqVhmuVQ627q+WIu1UmvvQmau1Nw9t+jC
	 PoxYxp6cb+ZKeQElcCQwqY7c4YG4cb5Vf+hHId3sjJ095ZAGFqBJCjO1eG9EabS98/qjB
	 Npk7dudfprFrCD0CQM+CKUE6jK8SJk7WQWqLKZuyc6Y7HOrscPJowuOwHhNpcTRkLp30R
	 gTGYHG/AQup0sgJ+PV/wyY14LXrPlG9sN3tXtY4G9NKPMNu8q17w+g13jSR3tUVoB5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=hDlLcj38;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9D606A321
	for <llvm@lists.linux.dev>; Mon,  9 Nov 2026 03:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C9D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=hDlLcj38
X-UUID: 140511e6dbed11f18dc8c9802ae25ab1-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JfvogYuBx2ioQGw2JVVRY053U98MXFmHHk44uXXHgBQ=;
	b=hDlLcj38NzHbt5/xM8IukqbS2voRoWnNDYFB7oosNNO2/Kr/8Ol14R7z7FX2flngh4Y7R5jsyr/B0i+F5BJwMVPhvs1X5FKHXNlTP575tuE3uCcYXm3PG7MwTnIeq+OfCCSvwHJ0iEG2Ra2BQj7KIyk9jL4k4xyxDwxUEO93+qY=;
X-CID-CACHE: Type:Local,Time:202611091124+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ad2ffb43-50eb-472e-863f-b980ea9f7104,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:a27788b5-7f9d-4542-82ba-5821e5e353ee,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 140511e6dbed11f18dc8c9802ae25ab1-20261109
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2110271103; Mon, 09 Nov 2026 11:24:31 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Nov 2026 11:24:30 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Nov 2026 11:24:29 +0800
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
Subject: [PATCH v1 0/1] ASoC: mediatek: mt8189: Use AVOUT for DP and HDMI jacks
Date: Mon, 9 Nov 2026 11:24:08 +0800
Message-ID: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.43.0
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

This single-patch series declares the MT8189 DP and HDMI jacks as AV
outputs, matching the status reported by the HDMI codec and exposing
the video-output input switch when jack input devices are enabled.

It is based on ASoC for-next at:
  c937f492dd40a8398d955cf0f4f9e11d7268bcb5
No additional patch dependencies are required.

Validation:
- checkpatch.pl: 0 errors, 0 warnings.
- Exported patch applied with git am to the recorded base; the resulting
  tree, commit message and author metadata match the approved commit.
- Retained November 7 build evidence: arm64 defconfig with
  CONFIG_SND_SOC_MT8189_NAU8825=m and CONFIG_SND_JACK_INPUT_DEV=y;
  mt8189-nau8825.o built with Clang 22. The corrected commit has the
  identical complete source tree; no rebuild was needed.

Cyril Chao (1):
  ASoC: mediatek: mt8189: Use AVOUT for DP and HDMI jacks

 sound/soc/mediatek/mt8189/mt8189-nau8825.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: c937f492dd40a8398d955cf0f4f9e11d7268bcb5
-- 
2.45.2

