Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1C4283FFA
	for <llvm@lists.linux.dev>; Fri,  8 Aug 2025 14:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754664594; cv=none; b=VvqvsSdQQusnoBj5l8QaP5moZE9O0Fpt15YhcJOoWfP5LoWx8eyWNdSfAtSMkcqVhB58/Yl8msia0n4tlNyQ7E75dNsrt5Pqfx+/29Uv/1ZBouKvgN9OUqaRsYY1/T98G/kBV7Nx638KdTJC6UswcoY4JLmsSPhmAswazxwxJ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754664594; c=relaxed/simple;
	bh=vzTXPFiaCfHK9nSqz15wssha4YOhs9UOcmrHp2JSAW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZK5jjJs4sjbWNhiy+gty8NjQ29vq0KiqE24dD1WqYmpAa/i86SiGDD8IPu8G2OTF2r+nSt+38i1m75oCe5yA13knz1bCPnnjfJ9hcM4B+K7RoCmup6nud2tpgeFqfCUn6XtjcGdntEFwKehtVtuwZ7yA5eTWR45sUk/0+kaqwo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=STKNxnj8; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="STKNxnj8"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BD3443986;
	Fri,  8 Aug 2025 14:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754664591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYn1Rc8HkKQf4J/p8AgwWmzwMMTkHWwwAtY/ky/WmUs=;
	b=STKNxnj8O3ZJTnpI/tmsjJQ2RmUajd8YJoLSUKm4L8GwzTGWQo60YtjGyws2ORzOF6n8Gh
	ikTG2wm+8rud/5F5oTilBUXrlbDwo7xHE8ZW/osFQhkBGQr0PkgIlOXvvsws8xpthGYlQH
	Z0zQrYKiRV6cpzNgBX7wYG0Jo20YqnowoniVi2o2GVVla79SXF0rXLL6DIQyslRsvhOqCG
	AVtf3ZOyk+O2YgB5nGEdyUrhLdKCw2TvnAQqiTQ0b0IqM+RXgP0oVEjfXf4XMG/1k/8/ib
	yPG1g8kBCESxSStJWIeOTmo3tDQE77M74OoPxsgRk8GtNb34A4CyfOpirIYHmQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 08 Aug 2025 16:49:16 +0200
Subject: [PATCH v2 9/9] drm/omap: use drm_for_each_bridge_in_chain_from()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-9-edb6ee81edf1@bootlin.com>
References: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-0-edb6ee81edf1@bootlin.com>
In-Reply-To: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-0-edb6ee81edf1@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdegtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepjeekrddvuddvrddvjedrudduheenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepihhnvghtpeejkedrvdduvddrvdejrdduudehpdhhvghloheplgdujedvrdduiedrtddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghin
 hgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Use drm_for_each_bridge_in_chain_from _scoped() instead of an open-coded
loop based on drm_bridge_get_next_bridge() to ensure the bridge being
looped on is refcounted and simplify the driver code.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/omapdrm/omap_encoder.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 4dd05bc732daebcedbfcbbc9ba7dffee7415bdfc..195715b162e38ea0cd0870f3dd79342a8cbf218b 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -77,7 +77,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	struct omap_dss_device *output = omap_encoder->output;
 	struct drm_device *dev = encoder->dev;
 	struct drm_connector *connector;
-	struct drm_bridge *bridge;
 	struct videomode vm = { 0 };
 	u32 bus_flags;
 
@@ -97,8 +96,7 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	 *
 	 * A better solution is to use DRM's bus-flags through the whole driver.
 	 */
-	for (bridge = output->bridge; bridge;
-	     bridge = drm_bridge_get_next_bridge(bridge)) {
+	drm_for_each_bridge_in_chain_from(output->bridge, bridge) {
 		if (!bridge->timings)
 			continue;
 

-- 
2.50.1

