Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287E338734D
	for <llvm@lists.linux.dev>; Wed,  3 Jun 2026 23:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780529231; cv=none; b=Z6VWfL9yKNO4UkrbXot2poynBq4JwAp+wjSgT6HTgoS7wZsCYPKgvJy+fiPtPbUyUu9TeUmgLDflklYxCnfsS2z+UoV2hvDBDlT1d26/xQIaZ85/wDTtpi2sRtdmAj7m/DYq3ERCpUX4a+5FaLbmU7PRQjKYqJ1kdM/XgXgr0V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780529231; c=relaxed/simple;
	bh=41RLXGxxCkF6evkmiuQBXUvrmZEV/tP+nyRrVDCrsLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K5XkL6AsewLhWczsEuFmsDEGl+1TpkvcxwSl/N4150wS/guwGXQGTjQdY6py8ZX/zB36fG6ImI++kRGktz+DDnu/Bpd5gxsEOdrrQdgab7cdw4MLkdkf+WyGurer4/k2dRzsYuZb+Ne9+1pKPGgqP1iTUelvyIBFIZEvdzIMu5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d81rjm9S; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d81rjm9S"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bea7176c72so627615ad.0
        for <llvm@lists.linux.dev>; Wed, 03 Jun 2026 16:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780529229; x=1781134029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZ7Whjf9rGOihI7ocMNjiwJGEh3geoh5OMV09wppzAY=;
        b=d81rjm9SXb1MCz6TVWHtGveI4vssE9BzXbKzPWOBAfXhXCHQtZeIsxvxwaxEpgOhz6
         8aFLsHX8yofD071v9Io3mocxpUNSgfVTm5WdGikXolclV3E/uY/qsYyM3eGkXC5yU5+/
         Si2vSEqGNaq3kllMVvBTFHStGxSknZ85ixS2GUkodZ3Lx5M7cvtIMQ7zFH5soabYyPUH
         rmzsT2MbtB6fc7mYdH/HJVByp/C5KH3rPyfpSGK481ANOAxiGReJFWMFsIJSZydramGC
         KKrZlNe5hiI3kgmi9ZVdIPUlQ0x3AjdyuLkavTEVhhLUiToKUtcgOfx6PzO5wJQHHi96
         Tf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780529229; x=1781134029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZ7Whjf9rGOihI7ocMNjiwJGEh3geoh5OMV09wppzAY=;
        b=Fo9hwhES0Nc8oH5nriZpYwQHq8ZkRp5RwOgFLdg1K5bUfV3WHjw6scBQoeOYka0Fqz
         BkK0V9gOVfm/cKIynPgjPa5D0TbZu3n6/FbJ5lmoXCDPYB8hkDaKDOolluq6dHxMwE16
         XdNMYTVYRg0tjz/m+guF6eCIrKyTV85AW38u7RTnX1Pbl1bfWaoIxe35EfBwYZLbaih3
         omvYpn6JUYVKwkEw28a3lZfa+wMV4pPD3Us6IfLMol+gUspBNORWVWwYsCYY5SrsOTyW
         iMWqHMG9k4Wo2OQNrWAA7oJMFFYrHmUZcI1/v3Kzl529JQmBY6BqE/wMB2sqdPXcWXl9
         yYDA==
X-Forwarded-Encrypted: i=1; AFNElJ/hl74rdLyzGeMmczFlpkgFW+VZsQ5PE0pVX1hRM542ELpkh7GxE0e3SYf16HnwJHAzWNtl@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+Qeu2a+IXoSFSosX+CFEHg3DAYxpNQC5A5Wv/1BDMHzHdKWBw
	oQpArncQV1uo+BN8GL1bD/vTW79jTW3CNWURjbRHPKkr3kbnLVacCQD3pb6ZGbfJ
X-Gm-Gg: Acq92OEF0IJGo4ktNyGamLqPdt1InMOY31IIIX/5lUAjSIyfWSjbejKQUQxN/9WYCuu
	94uN54Wm2rSlIkrdLWchxVzk2k31fSFC3o71JPR/fCMGZo5WPw+JiRTJSsPUnC1O975W0UyThAf
	pKyRxblp0M8RnlfYUbH5leOF/XcnQ//qzkCtdFSkBsGh6rCmbMDVuLg23/3+Nlw1UBAeyQdW71O
	wcwe/IVEbcoiGixW0Z27yYGV7WF6RhoLrVKfW8IkCxrbaq279vCzWm+XPDPjn8V5kuoBi1OYZiH
	JYSXNuya7Ldm1c3mricK/ONAISJqWwq1sKD+bmMVXoZdEJh4B4vB6TOD7hC0/pi7zwJElj+kS4w
	BIlUikG+G4zyJOX7sFglvzX8oPx61iaxvTSTBsuiWwNchT8fa5JQVhqnx7nbgk3xEltmv/ZdmyF
	oRdh9oahocZPNekb/HGL6s66dvR2Im1pVXH0jnH4njPE5QrYYdeQrh/rnieLe11m4qwV/ot8vMC
	24mpYsS/nlus4QjwKKkYRZZrOaoSkJMOpSVMQpnvjZfxw==
X-Received: by 2002:a17:902:f60b:b0:2bd:9803:9308 with SMTP id d9443c01a7336-2c1644b827amr62195945ad.36.1780529229363;
        Wed, 03 Jun 2026 16:27:09 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649bde7sm37462955ad.72.2026.06.03.16.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:27:08 -0700 (PDT)
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
Date: Wed,  3 Jun 2026 16:26:51 -0700
Message-ID: <20260603232651.8580-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCI_VDEVICE() expands to set .class=0 and .class_mask=0, but the Brainboxes UC-260/271/701/756 entries immediately override those fields. This causes a build error with clang -Werror,-Winitializer-overrides.

Fix by expanding PCI_VDEVICE() manually, omitting the trailing .class/.class_mask zeroes so each field is set exactly once.

Assisted-by: opencode:big-pickle
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

