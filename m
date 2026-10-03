Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7017B493D4F
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 19:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057025; cv=none; b=YIegsuhpIXkbqifq7W4TmDjZ8brS2FLmQUfZg5rTY4Vzuc72fOUjjhiEZ8spMnfb2TaMEv2XEcxWuI++9sEj67DC7ADdoecCxzuOz5z6OWtqEI7fnuYafmMnC/z4lzHRRj4XXp1BNRIFzi5dZxooDXEFwmmG72Gf6vE8whxVLD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057025; c=relaxed/simple;
	bh=/4d9OigCORtvJ5aTr4LsAeb4hgeXIO/CJ8vO4HGEp18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RcArm1010uhLi+CPKGhL0a4hSdRPU3jHITA+OUUr//uxNLW5mh4Rm8ouFO20wTvyGCwpZz28bKF2o6BrKUaBBdFKt4D8ekp+p5AT5eR0k9NLcQUrMc25i8NM6Qm6UxXWVR+ed8Xjb++x1H9Q0GIBjFXANOpJ9mr1p7lZDoCoOfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwfloLNq; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwfloLNq"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3d90ac37so413308e87.3
        for <llvm@lists.linux.dev>; Sat, 03 Oct 2026 12:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791057021; x=1791661821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJ/7i28s7Zko07cbEXOC8Ix74/xugwD/hhTUjA8RBs8=;
        b=ZwfloLNqloOuOJ7Jt3WY9Tbt4362KYbKeIZpVB1CBT9CQt9SGB/7zyJioWcaPLp51M
         zyfl7akDdNt9GFc01927ekUieBNt+WlQXRwyCRFHGm4+S0j56JI1Y4Bi60TK6xSJUFN1
         G+EKttlj067NGB1zOenVHwTtuKjLTc9W3vYLxLP6ixQQqdp2bHdpGrhMyOGIO1SdZgq0
         qqhOA7eHPj8CZIF4nV4cYX+WUvM185nF1VSMRYgBSL8T45nFzqJMTtMtbaLtibgmS5t2
         AXwv/IWIWSLKSZl6Se4Z/fzJH+7BWZAb1uDddeLFxZIDENHHsMgrVdUXRhrvYFmoI1ko
         u3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791057021; x=1791661821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJ/7i28s7Zko07cbEXOC8Ix74/xugwD/hhTUjA8RBs8=;
        b=RqhV4GuyFvr92GGFbsqfcvrNqfWtA2h7ILBPDV0JLJYmeSTxL60lQjMexkM07gWwHt
         0K/bCA8ROLEy2J+oXysFLA2BEjXCbDMIp/DbLGw4xboy+D7LKTGJWRP+UZXA6CURaDyd
         Jj0HxOfWip58fweI3BO2SDNLuUvCPXW3sZt/JqFV/VLipFDqyt7RCaFKXaE5GuUarFPI
         bYITarWoYgrivD4wgJ0hQd1BLgQlNjm69LnJNkLDFOFJjdIUv0dz0EIzXtb83LaJ025m
         ng+5FcyWSpiS/hHbb5qqS5Jyr/v6jy5jtzzk1iyuGodNvAJyfYpcVqDehi6SE0wconId
         N+7w==
X-Forwarded-Encrypted: i=1; AKwUvBwNX991R7vL0qCQqYiFJ5ZAyEgnPs8CyJVXikXriKVuD5iHGbf4/KvCnbTRsjmmSO2HWKw3@lists.linux.dev
X-Gm-Message-State: AFq9FYJGy5sRaZSOA+hXYSn6cbjHxw8siABK343+Pfbolaal7KwRjDUU
	C8vQU4sA9SfTi6EURgMKjdyKKTCPuaoPUCuy4CSwZD1/qCNEfENaqq3N
X-Gm-Gg: AYBFou05xbg+nhuDh/krY7LnGum+RiyPtTy8K/qQYsNpR/c2IRaEP4vZi01gJpV3PKV
	9IuF2mix36aqS3fbYAa4EmwBrkda2wiQY8PUuX6Lpe2jsIPNk4PNbFxFilrgtOWNh9HeHT9Zl6q
	cjh0BuxAUQzUJMQQFv3FL38DpRve+RYnI79B/iTMz+Y5cvLn0BbEwjt8ODuA7X9Ooi5Jdxmnakm
	j0+TC2IB1Cg/cg5Xuw0OSNU/IJTkdkngwpndnndvBqgN/pInQZDDu97uKQjscE8i8PGEJwVBslY
	W5Lzi+4meGLgiMhLQqFQtcIOMYCwarI0qpLmRlQzyOPZ03NP2W666sijdHv/Cegz42vHSWFygSd
	m0Ph2eSxqtfYXxmMBJJEiLesLcQxlmVONE0YEjhd5zI1Cu+3HjQwhmPvMlXLmM6oHVzO/Ji5LjU
	LOBzvu0sTc0fkZzUxp9eUdxXnLIEIld6gXEEhFPAXwmXvGZIU3tPM6AnFij+z/2qNvzKuGECen1
	V11tlkgUQOxcjAgsyzVBB4DoXMFDwwFAAJgcQHMlIpfA/aXZ4iYvN+u54riOmmwTUhFHg==
X-Received: by 2002:ac2:4839:0:b0:5ba:3d7f:6ef9 with SMTP id 2adb3069b0e04-5bb9bc468damr1943914e87.48.1791057020991;
        Sat, 03 Oct 2026 12:50:20 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7abdbfsm1762608e87.65.2026.10.03.12.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:50:19 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v12 1/5] iio: pressure: dps310: use devm_mutex_init()
Date: Sat,  3 Oct 2026 22:50:07 +0300
Message-ID: <20261003195012.92948-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003195012.92948-1-zoone.rupert@gmail.com>
References: <20261003195012.92948-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Destroy the mutex on unbind so CONFIG_DEBUG_MUTEXES can check it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 85df58ac1809..5c8af216ece4 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -19,6 +19,7 @@
 #include <linux/limits.h>
 #include <linux/math64.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/unaligned.h>
 
@@ -996,7 +997,10 @@ static int dps310_probe(struct i2c_client *client)
 
 	data = iio_priv(iio);
 	data->client = client;
-	mutex_init(&data->lock);
+
+	rc = devm_mutex_init(dev, &data->lock);
+	if (rc)
+		return rc;
 
 	iio->name = DPS310_DEV_NAME;
 	iio->channels = dps310_channels;
-- 
2.43.0

