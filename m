Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108016;
	b=G/V2+qJoNi0dRlA4aReBLEKbAZpS9gjnoCe/gDRjexsOGA/r4UBVX2FSryUFGiQ5CDlt
	 M9VIVMm5JR7qBXbwrF6jHLYyA00DCvreMmkxCFmtyEtMhqR9PIMXDqpI4V/hId13WxdrB
	 3Js8FoLcUMX+27xbA4acGka8rQHmJrLYQPKYEREOcW3brJeObzJUk6k2JAlJpAN9ujgfh
	 2mPVsZB8NHqsyqLOb8hYI6I/yoxSCJcUnHUfZczNIBRVaoZuqwGd5V4poo5BVrdQnyJSm
	 aQLNl1ivprlR847Daqzrd9bZGawzI5sdOjrzHliudAupSiHqDhZTogCYMEHax9ZXrsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=JwgV9xoUyXWrjKIsV+2wKgTefwKYGfGE578l9JoVIOU=;
	b=0v7aJ1lQONk8yzfxV0UYc8OuRmLYPYceT0xEi/8XBT/vlIXRA+mIq+n448f+Wc7BvXXk
	 WPLuTu4GzlEGTcp2Mo0f8mwBFxWc6yF2jilxD2L8rCuNo8SjButRaEqbDFPrwErhbDCsA
	 I+gmwhmo78h3AFW8C3HhMf5+UIAEaO8XzLvTIUUsDcq6CHKFZAehim0xG6yAKBb2d10zN
	 1IXfp3aUIvAmhaA+pO7P+OaYAxJ7H51vc4rucru1/EmjE2B9mBEv0f5GZj6zMRaTmcfco
	 1NjRH6rzpHWH03tM6b2iKzaexchMlmB4weE0+BSjB7FpKREJke6lfV3/VMunb9PQsRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IGMfIDvz;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C86606A326
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C86606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IGMfIDvz
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e778acdbc6so24840b6e.3
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108015; x=1795712815; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JwgV9xoUyXWrjKIsV+2wKgTefwKYGfGE578l9JoVIOU=;
        b=IGMfIDvzu0N/z06Ur5YQMAC171UFauRx3HN9Ch3g3O8Fi2uTLCcUl3Mn+cwM9Bqt6V
         gNx1UcsnmKEfWk2LpoiLe/YbcR7TqVglMaAtw9gtFNI8hLaeesuAotTARRQdt+tDNZsR
         G1ltipwUUYgdkIqfK04LhIRqryhrxpZfHjeo8jDfqgJ/WhLenqcTQoW2h/1RbnmhIoOk
         A97sYOL+BHUYWQwd0HKMlsGU/SvEAtKpFfkvO2PUqcoA4MRyYPwuxGeZ/iiJIrqLBrKc
         nWP2w3Ffby/Fvs7hD1kVvMwaMDEptLmK88r33mnmPuCr+haPXpNQE76Oe3An7ZOaUtU7
         AvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108015; x=1795712815;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwgV9xoUyXWrjKIsV+2wKgTefwKYGfGE578l9JoVIOU=;
        b=AOJKjVtfeU62muzslpgQuvdh6K6BoqLaDakReie18IwNEyviXq8brS5mGT2HF0/Kn4
         vZ+rBE0fy92eKYkbdWLUmsDSsNJqPwjrYyA8ao0Py8D9+lPw6n+DuolOoJ0N45OIxblz
         PJEnr7zNR/5Xmpr1pysADL/0PCuNqsuFjA/cQMU+EEUzeZ7ZSYy/4NN3NDdlsXiBNS9W
         omosJaFLm90QO5M27E7+2X7+7hNLItQbwz9iR5Pr/GZUKjZzZgsNwHkMhWDohH8472TJ
         J+ylBOVpKUg/2jnKSYlUBt1w8ECy2fQGqBeJ05ohZwfOMFdwc2eBLnMQlyoC2tf60KVK
         VCVg==
X-Forwarded-Encrypted: i=1; AL+hErH/jAAF1oEc8XwHLOkLsfQEkEEaoj4JABVwokdj6tMxRT5oKWX/ASg+YGbhTI3zfkPHmnP+@lists.linux.dev
X-Gm-Message-State: APuU4Z8SnVPW1OrUyWtWxmYMAfujb+GL8a8/JRklzwd3PkLJ+PznZKJI
	eXFClvshx+ttX3EpJzKZNecAzF7bxjszLgEHMQRR1Dbv12r3kMlnLxX5/tEAbl7/7Ey/+OHa64Z
	W3R1atTKNcQ==
X-Received: from oackg12.prod.google.com ([2002:a05:6871:bc0c:b0:4a8:57aa:3e44])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1394:b0:510:7dc8:5ff7
 with SMTP id 5614622812f47-57a0a40536cmr542360b6e.19.1795108014416; Thu, 19
 Nov 2026 09:06:54 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:49 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170650.1521609-1-irogers@google.com>
Subject: [PATCH] usb: typec: hd3ss3220: Propagate regmap_read() errors from
 attached-state check
From: Ian Rogers <irogers@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

hd3ss3220_get_attached_state() has return type 'enum usb_role' (an
unsigned enum) yet returns negative regmap_read() error codes directly.
Neither hd3ss3220_set_role() nor output_poll_execute() checks for errors;
on a transient I2C failure (such as -EIO, cast to 0xfffffffb),
hd3ss3220_set_role() passes the bogus value to usb_role_switch_set_role()
and disables VBUS power. On role-switch providers without a .get callback
(where sw->role caches the value passed to usb_role_switch_set_role()),
reading /sys/class/usb_role/*/role subsequently indexes usb_roles[role]
out-of-bounds.

Return an int status from hd3ss3220_get_attached_state(), pass the
resolved enum usb_role via an output pointer, and leave the current role
and VBUS state unchanged on I2C read errors.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wimplicit-int-enum-cast; not tested on TI HD3SS3220 hardware.

Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/usb/typec/hd3ss3220.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 60d6de9ba339..212c3624961c 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -163,10 +163,10 @@ static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int prefer_rol
 				  src_pref);
 }
 
-static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
+static int hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220,
+					enum usb_role *attached_state)
 {
 	unsigned int reg_val;
-	enum usb_role attached_state;
 	int ret;
 
 	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
@@ -176,17 +176,17 @@ static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
 
 	switch (reg_val & HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK) {
 	case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
-		attached_state = USB_ROLE_HOST;
+		*attached_state = USB_ROLE_HOST;
 		break;
 	case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
-		attached_state = USB_ROLE_DEVICE;
+		*attached_state = USB_ROLE_DEVICE;
 		break;
 	default:
-		attached_state = USB_ROLE_NONE;
+		*attached_state = USB_ROLE_NONE;
 		break;
 	}
 
-	return attached_state;
+	return 0;
 }
 
 static int hd3ss3220_try_role(struct typec_port *port, int role)
@@ -231,7 +231,10 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
 
 static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 {
-	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
+	enum usb_role role_state;
+
+	if (hd3ss3220_get_attached_state(hd3ss3220, &role_state) < 0)
+		return;
 
 	usb_role_switch_set_role(hd3ss3220->role_sw, role_state);
 
@@ -258,9 +261,10 @@ static void output_poll_execute(struct work_struct *work)
 	struct hd3ss3220 *hd3ss3220 = container_of(delayed_work,
 						   struct hd3ss3220,
 						   output_poll_work);
-	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
+	enum usb_role role_state;
 
-	if (hd3ss3220->role_state != role_state)
+	if (hd3ss3220_get_attached_state(hd3ss3220, &role_state) == 0 &&
+	    hd3ss3220->role_state != role_state)
 		hd3ss3220_set_role(hd3ss3220);
 
 	schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
-- 
2.56.1.708.g77570a6a1d-goog

