Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108264;
	b=ZOuKYGxLZRp75vOXBJT4c1b8FlAejO24nFlaNVoLRq40urGgaOICzztkn7Ra5M9w0p0A
	 BgPAuvaheKmEv4WmETf3lfNyNiXQ91tKTMI6WkiX+OoaIRFQ3vMy0vzc0CM1IjiGpKZT7
	 Z1F4hFGC7byNvwlWWpjTGBPL2mBeU7kfEI/IAXj8FEmNC/LAEIwX1fWnMbXMygVdAwDNc
	 G3LOxWfQ7kcP8xTRUgg16e9JomKVsRyhs1G2ydQT0zZI6EAI9r1De7XUJlykzFwfAxo05
	 GtAD5f4XExlEXEjGdBP7QZe3O3d/tk2ivwKoQlU5j5S7msmQCgf5eOpJEQJeg4xb1zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KDSgHG/fYnr0cS/UnUZIRPmooKQVdCYrsswn6mr/ZkQ=;
	b=hgApxtmGq5btGZEgsZ49rO68hjtnfrTrFTPfk869fwqAe+rtSzMlXZrThtazpCAjF2rm
	 7UgbDvq9qbqWN9aawxraiEBryaURoa4QAFz8QloJvTRu7tz0D4F0OuNdzSjyi4nK4UCf4
	 VqBqxI85RvAsHgpOj1BJf5a4zOGX+TZyTnei+Hih9jJOWss1UGXE6JB7SAyfNslZnfmDX
	 VmtubKr7IFbVjZkRrfoTMMd9hsCmEc+nh8qqg4PFQlvStZ+1Hbwf9fNdCuNLNb3zoDh0h
	 +OgsAg5ljx64Q3pH0A1kmULFLD6S220+Os5HbFEA5fuF4+bvg0ainMQvC3/ZsckuQfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fplNXWRk;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8080C60A2634
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8080C60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fplNXWRk
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b45597c7so4734591c88.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108264; x=1795713064; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KDSgHG/fYnr0cS/UnUZIRPmooKQVdCYrsswn6mr/ZkQ=;
        b=fplNXWRk0ZoNRAmpGYIU0oonIN1q/jucP8T2lpVgOp3YrVrOoFzZnLOLkGpUYsXa6M
         VmHHwwUdGBjppRzl9s5lBvkAEH7Ki0iUPVlUkizkhth52m8TmPaqJhWpCPL8n+8nklPZ
         J0+wozclSjZ5TA6XyUcq3T9t+lZxLYgVAGKkQVAPky0Kw0RlRCUx49L/53UfHSS/U+gr
         vfk1Fj7gHccXg0U4McgtZ8qNYFtYLDvrtQdmD0SEAdGzcc+ulCznzIM6zJjfj2C9PQtz
         V7EaDEOq8kFJdY4ZNIdgzQ1PBjY1DP6UGmyPpFjGoddMBEJkCSHuDIEO6MKCZtLVWstP
         YgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108264; x=1795713064;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDSgHG/fYnr0cS/UnUZIRPmooKQVdCYrsswn6mr/ZkQ=;
        b=zUfMsBgVaoIwFAemK1PZDkG0Am4KKHc7E5442IN8a+sNhFhYt61toYd1FEVa8nrEGt
         j9E9Db5QjogaXGLjlKcuwYvFPYbewhwUJjMx5Hu4A5x5ToJBj+Xx9Rz5wK+vxVgRFJe8
         hCD1p+4uy2P9ICxt6uWNHjUOKMbRQVNUd651p+CHExv7KD3oDFeEaz6hiU9tY5RvjXXX
         VYpM8CzJq7sS7fL8TCogI8jIaZObaLz0AVV+86/CZAfbz3Y/CMCNlL9q1qbBuzHnqssT
         hyn2Adf2AAZKMaSsh6I47UhOMrKrrSRpOdKL9MOZVtsxRl+MRT6hwaLjmtz/S6gMWU8b
         t2JQ==
X-Forwarded-Encrypted: i=1; AL+hErFCUcCf4rgIH21KNuAt4DlFZ2DYJskRzKJR5bYXvfaS+7pfeAmxvAE+nw6QZWvHc1l6Bc5s@lists.linux.dev
X-Gm-Message-State: APuU4Z/eza8i3zcKuAZhnNvG2ymulWI2eeMpyo2GORcphyrgY9TF66oo
	IHoZyZ9Wdx5tqhTK+HzdS+OkI5AGRq7XuGOmaRszbdI9lVg7D1JiRyjPBBzZame95nd6Dz7DcVr
	J5m/fLteEmw==
X-Received: from dlag26.prod.google.com ([2002:a05:701b:251a:b0:1b2:450f:bfdf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea56:20b0:149:1feb:6d9d
 with SMTP id a92af1059eb24-1b55689e6femr295208c88.19.1795108263241; Thu, 19
 Nov 2026 09:11:03 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:59 -0800
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
Message-ID: <20261119171059.1537658-1-irogers@google.com>
Subject: [PATCH] ASoC: codecs: aw88395: Validate 4-byte alignment and init ret
 in reg update
From: Ian Rogers <irogers@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In aw_dev_update_reg_container(), each register entry consists of two
16-bit values (4 bytes). Because 'data_len = len >> 1' shifts off bit
0 before checking 'data_len & 0x1', byte lengths with (len & 0x3) == 1
bypass validation: len == 1 yields data_len == 0, executing zero loop
iterations and returning an uninitialized ret, while larger odd
lengths silently ignore the trailing byte.

Reject any length with (len & 0x3) != 0 and initialize ret to 0.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building
sound/soc/codecs/aw88395/aw88395_device.o with LLVM=1 W=1 (-Werror)
and -Wconditional-uninitialized, and with a standalone C reproducer;
not runtime-tested on AW88395 hardware.

Fixes: 06d2fe9cb423 ("ASoC: codecs: Aw88395 function for ALSA Audio Driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/codecs/aw88395/aw88395_device.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_device.c b/sound/soc/codecs/aw88395/aw88395_device.c
index 3ae418c8b34e..2dd0b3b7de0d 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.c
+++ b/sound/soc/codecs/aw88395/aw88395_device.c
@@ -1004,16 +1004,16 @@ static int aw_dev_update_reg_container(struct aw_device *aw_dev,
 	u16 read_vol;
 	u16 reg_val;
 	u8 reg_addr;
-	int i, ret;
-
-	reg_data = (int16_t *)data;
-	data_len = len >> 1;
+	int i, ret = 0;
 
-	if (data_len & 0x1) {
-		dev_err(aw_dev->dev, "data len:%d unsupported",	data_len);
+	if (len & 0x3) {
+		dev_err(aw_dev->dev, "data len:%u unsupported\n", len);
 		return -EINVAL;
 	}
 
+	reg_data = (int16_t *)data;
+	data_len = len >> 1;
+
 	for (i = 0; i < data_len; i += 2) {
 		reg_addr = reg_data[i];
 		reg_val = reg_data[i + 1];
-- 
2.56.1.708.g77570a6a1d-goog

