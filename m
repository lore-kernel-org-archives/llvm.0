Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E026C40963D
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 20:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779999190; cv=none; b=hN1EVmV8wq+pHI8bgR1DiNZsKzuCh5KxfaibR3jZuNKBoR37Kjha+kiB6gsz0AKDg+5hlYS9pHCuXcTK70MPLZokAsx420ArYYWyVxT4eniF/xw76NhbztOKoObJyYpMOkDUtSDZh7asr+u7LPYCFpTKpucm9cvOONjA1bG3wJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779999190; c=relaxed/simple;
	bh=MW+T++PF99/Vjl4jrlZc3WclQejwtQesBgvBPrpVZV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MeAWRT6WuADGeojnFqmDc4Si39QM4YKHHkJUL/FBfNupQLd0a4pQokEJTgwvgYyKjZ9kUGEp3K1ZZHuvs0VmnHnfqxdilN5cy9UNsu6Ihvrg7NOfC0eWwcPnMrebGwnMxCNBykunq2FpeamAxOfKVQarHcRylxB3QVxfnK+/vLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kB8FAn+5; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kB8FAn+5"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c856db4fcacso496204a12.1
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 13:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779999188; x=1780603988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j9qJ8rpcsYRHuSOceWQ8qSKZ87Tyx2plk/734O2C4JM=;
        b=kB8FAn+5YBvVJlfyfT+NM3bjhZA0Dt8iO8LwVRtkL2vySUHIF2X8MQJxFjd2FAVrnP
         AsAV6tXR7tD6Kt01IZIsmZZZ/iHsQz3bhmXlEx8E9nVp4ZmIRCwpuoHZjRhccIZSV4ua
         37lOahUFOrlC1ndYLaaRHeD4qZR/G03AXexD0AELywp8b/iOKUQ2sgbU0rdfrYudMzk2
         3FCyCKzaHnLcItt+PeDxX7Y5xOv6i4wJLbaO/rvgXQLUVBFRizhkbJgqwFc0Sg+bZz9k
         l17qj+183Bg2/v1Cui0zw5zy5cA1PhOIayD7W/Tp0WolxfxyLCQ1coBcN3QKBaNnfVmf
         A2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779999188; x=1780603988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9qJ8rpcsYRHuSOceWQ8qSKZ87Tyx2plk/734O2C4JM=;
        b=He6tU4WjRtCyryE4VLCfpGMSKGXTykI2OeE4yVZ41wa72YibuGhUsQbBkrc3M8PT/L
         j5IQDOn63kFs/EzMy8Gtw8qfxs1ujpDU2f/M0RgFr8WGhbt7nZVXc2wvjrAm17lFGJt0
         V1hdJwvTs2lgwiPWeTfeJgMbsBT6nH56s0hEHffijOc+kkFriPzjfuONHEgXp6akOIES
         GOk0o1poPagA1qJHjE1k2Nnu82jSa0vzD2XFkLYVqitfP+CaGY1LBRWsXw8Vyw2IBLA5
         169+xt4qgNMhIgSiEXptgxU+aFqnMM/A7twXIp9/qYGktd59YZoqiFyBSYoJI5FmQSS4
         +PdA==
X-Forwarded-Encrypted: i=1; AFNElJ+1zrdhoYCguaYgRjw18YFNDPWmhlEf6qk45u38bJDkP8YV/fxyNmB9tlF69jIVXnTXZbX5@lists.linux.dev
X-Gm-Message-State: AOJu0YxrsofhfE4pOmHHr6RsFUyisnsvYoN4FUxs3YzllwXd3XQGQJZR
	NNibsOD82nKLsUEta4mMAhdTBWrPRu6Jn2nim7KaDBUwnYbcxzOGP3Ee
X-Gm-Gg: Acq92OFrq5/a6Hhz7fEZtD5KLrMEoW7nL0Iqgtx0DJjmVKNbt3EHlDdv71NmiSNHIMT
	6OGkor4Am3JZK+TYSqHNxTxb07Ca6adS9qDTMPY8OjCeXSHO3t9Iq0iRv/5DyLZU2LGPQvmR0Nl
	S254zOaV1nqHe66adS26Bi/o346cIkCywcdXw0hnswQnFyswKjDEtts2xuohmyVEMETXmE0PICE
	ZZNwLDVddq0/ElI2JNoceoGCHJQmN+vN1ZDfOQQa0IPkb86wnF6uoor5/xomcWjfUL3a+6uJkpk
	SEy422Dx+U4LDAbd/0YEkXgbq10mNn+AYj/Y3yXUsjOoHF2HsHTGopoyIHfRJFP8bGsiFAIX94G
	MTHCEbNEzG8y3ReYU1K4YjfENGyQqi0E+chlrgd1KwvJ3JgyOYHn2WVkOmAMx5S3nloMYDW8uZZ
	62XNGCr9AzY33EM8Qweti/n+hNrJoIDJtEXXeRMabRXngfBwPGR3A0rnqmo5Ar3XNXd9FfUCEoT
	5WZgM1dyntNpUp6ygGIEzB5uGjt3FN1ERj1Bni4fCLi1Q==
X-Received: by 2002:a05:6a00:6c99:b0:82d:603f:f3a with SMTP id d2e1a72fcca58-8420cb5b92bmr434239b3a.24.1779999188201;
        Thu, 28 May 2026 13:13:08 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6e80c2asm6628425b3a.6.2026.05.28.13.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 13:13:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] serial: 8250_pci: fix -Winitializer-overrides for Brainboxes UC-260/271/701/756 entries
Date: Thu, 28 May 2026 13:12:50 -0700
Message-ID: <20260528201250.135691-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCI_VDEVICE() expands to set .class=0 and .class_mask=0, but the Brainboxes
 UC-260/271/701/756 entries immediately override those fields. This causes
 a build error with clang -Werror,-Winitializer-overrides.

Fix by expanding PCI_VDEVICE() manually, omitting the trailing
 .class/.class_mask zeroes so each field is set exactly once.

Found with W=1

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/8250/8250_pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_pci.c b/drivers/tty/serial/8250/8250_pci.c
index 3e5bc9e8d269..0513f4b3c093 100644
--- a/drivers/tty/serial/8250/8250_pci.c
+++ b/drivers/tty/serial/8250/8250_pci.c
@@ -5394,12 +5394,14 @@ static const struct pci_device_id serial_pci_tbl[] = {
 	 * Brainboxes UC-260/271/701/756
 	 */
 	{
-		PCI_VDEVICE(INTASHIELD, 0x0D21),
+		.vendor = PCI_VENDOR_ID_INTASHIELD, .device = 0x0D21,
+		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID,
 		.class = PCI_CLASS_COMMUNICATION_MULTISERIAL << 8,
 		.class_mask = 0xffff00,
 		.driver_data = pbn_b2_4_115200,
 	}, {
-		PCI_VDEVICE(INTASHIELD, 0x0E34),
+		.vendor = PCI_VENDOR_ID_INTASHIELD, .device = 0x0E34,
+		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID,
 		.class = PCI_CLASS_COMMUNICATION_MULTISERIAL << 8,
 		.class_mask = 0xffff00,
 		.driver_data = pbn_b2_4_115200,
-- 
2.54.0

