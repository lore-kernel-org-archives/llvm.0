Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107863;
	b=eGwL33fsvEcPz+SRSqwMb1GQtZEswNQrhmThiZLloUPzWIcooUkaM2hyxhuO9F9LeHUj
	 bio3sp4EayCDdvj563QA/MhCBk7uJaGzBifjT0d/kbqRdCPZjW+vDP5UJTxA/qEVYk3hH
	 hYa/+gpe3OV1OMfhUNsVq612r2eYJ8hcUO0Cc3WdPpmAas0sk/9BYo6EojyUE9Q6sD+ic
	 Gmd8l4hXTUuCCT2dyhJb1Dp5y33JqOYVwLgTfjvDnwgT9ElNESY9LUlLrCcSz+Br/KgG9
	 8WJhuEoMXq4lhqkGNFDbIRVTJ3VHIDhNgVBjka5k6d4BCJmBzzJ3nvNV22fuf84CXZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tbGvL9tZ+BYgVAO5FMDS+XSwp11ngMpDyW2424LSejU=;
	b=WYa/EbBC8poGsRmLBU6nlmbSWKR6IcF4A4xZKf5rDhrSh/t+ToUHTx0bjPl6JRnQ5OSl
	 PWJ6eWRQD3aksfHrzO4j8hhPyBCHWRmi8N1sHlBGK1WExq+rou1xTeJ8m/A+cPLKSfy6q
	 EHDeRJWClOnNJCBYhzTdqeED7dsC4UCYqdqYnkzpdevEduXgN6dFynUg4IRE7Zly4kCCM
	 Kaf02qHkceK+EPhiuXCaS0gjsfQvuO5HYxvWP6zpJrzsJmUOJuJayoqD8TmoeCElfl+2W
	 hcHu8KBuCQc37tjKSC6DJd5JZqv1xjc9gFzN+S/Uzd/yqj7YNoro46lefGJHC5aZg6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ma91w9va;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B360A262C
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 167B360A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ma91w9va
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so6012449eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107862; x=1795712662; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tbGvL9tZ+BYgVAO5FMDS+XSwp11ngMpDyW2424LSejU=;
        b=Ma91w9vajCI5pctGdzSoXolWWnka/q3lqKg8813dnWqUIP+UIbjIeZiCz0fniNMOJO
         zTaH4kcKEckzgI8uYTCuaZzztTnxAWMMqf+dtWWK7qKo9raiDIG3wcF6uCxmMKsmD7Xx
         feqVRxnlGvPoYYadxrXF/NRBvADsa9rwErDjTLXOoRveqGax+61hhzxu3VjhkKeiF5b9
         sp/tQec1Xfn8TlPDP5k7G5qhrV6Gi64ifk4DT1r2EYpYk/Ff0yCXzww7Ungg4JCUT+/9
         B4jtxLFD+aoOCPEY4AM4j6sXLL9IiWaZ6tLJJeSdPq/DK1qMGADH/roMyomIPsorTMLG
         Ye9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107862; x=1795712662;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbGvL9tZ+BYgVAO5FMDS+XSwp11ngMpDyW2424LSejU=;
        b=hOQUVj6zNtmpLNVTr+JXJclhmMZQm30pBROnzyW7jY+FvJOhVs6M7YhLse/oHa7LX/
         FGF4bk3cBCu2USGqFzG2MUZ0lAvaPn477DudShJOGEMra/CW11LVwaBeiuXn6jHtCmQ3
         IS7dzDaZVtkA+cVMckdHOLifSghQFi61B9ExaXZ+KLEBvPNB3CI92Q79uWkNJcRDR46b
         zDrE7xxE9S+6zBe3mP9NdCc20GycaFHYkEENryPwrldqyGYSk6V2//psW9EwzEaGxLXG
         dm/R1vxIrnOj1Tiv+0yxATBzy7eWVEzW3R5yUkP0Gc5h3mUozK7wAEnTO6+zBr3xclIh
         HATA==
X-Forwarded-Encrypted: i=1; AL+hErFq5TEztKe+nodaorucDvEChtA/Ct/3kQSNkQJ39X4LI2pMfpf1n7BdczClRogPaVU0/pbJ@lists.linux.dev
X-Gm-Message-State: APuU4Z+NIE3scA9LIqtufS6SIXZJPCS3337D3Lekv9TSgJ1sZcu0ez2K
	t2fNDIcAFy9lw1BEfLcuLEk8a8R+YI1Sq2a6iXn6NGG0YCTBbUo6+D1cSY6VOAXriEdvkWI0Kni
	mZnPl26/Nuw==
X-Received: from dlev7.prod.google.com ([2002:a05:701b:4647:b0:1b5:330f:621d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4584:b0:1ac:9da7:e86e
 with SMTP id a92af1059eb24-1b556908c17mr230062c88.30.1795107861814; Thu, 19
 Nov 2026 09:04:21 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:18 -0800
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
Message-ID: <20261119170418.1511770-1-irogers@google.com>
Subject: [PATCH] HID: lenovo-go: Fix reset_tx_dongle sysfs attribute to be write-only
From: Ian Rogers <irogers@google.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

reset_tx_dongle is defined with LEGO_DEVICE_ATTR_RO(), whereas all other
FEATURE_RESET_GAMEPAD attributes in hid-lenovo-go.c (reset_mcu,
reset_left, and reset_right) use LEGO_DEVICE_ATTR_WO().

Because feature_status_show() has no case for FEATURE_RESET_GAMEPAD
(which is only handled in feature_status_store()), exposing tx_dongle's
reset attribute as read-only makes reading it always fail with -EINVAL
while preventing userspace from writing to it to reset the TX dongle.

Change reset_tx_dongle to LEGO_DEVICE_ATTR_WO().

Found by enabling Clang's -Wswitch-enum on an x86_64 allyesconfig build,
with AI coding assistant help to audit the warning and prepare the fix.
Build-tested with Clang; not runtime-tested on Lenovo Legion Go hardware.

Fixes: 82cd9bc866e1 ("HID: hid-lenovo-go: Add Feature Status Attributes")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/hid/hid-lenovo-go.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index 318b1152ff8b..8a2aa2b4825d 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -1848,7 +1848,7 @@ static struct go_cfg_attr version_gen_tx_dongle = { HARDWARE_GENERATION };
 LEGO_DEVICE_ATTR_RO(version_gen_tx_dongle, "hardware_generation", TX_DONGLE, version);
 
 static struct go_cfg_attr reset_tx_dongle = { FEATURE_RESET_GAMEPAD };
-LEGO_DEVICE_ATTR_RO(reset_tx_dongle, "reset", TX_DONGLE, feature_status);
+LEGO_DEVICE_ATTR_WO(reset_tx_dongle, "reset", TX_DONGLE, feature_status);
 
 static struct attribute *tx_dongle_attrs[] = {
 	&dev_attr_reset_tx_dongle.attr,
-- 
2.56.1.708.g77570a6a1d-goog

