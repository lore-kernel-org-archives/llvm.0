Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053E32F12B5
	for <llvm@lists.linux.dev>; Fri, 31 Oct 2025 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761897996; cv=none; b=XF76D7S/foXynGaNY1WMuN1JR4PwInNATW5z1PzA8E9RY7hLwWnl0mHRid2bCs/5b3Lkrwkh4AjUlF8SFyjewwTkhwbQazYB1JP0YkvoHx6Fwj2ywb5YMvLWbzVHTfNszSIDy5xn7+uDFUY/ZyJ45smmgWu32KvTdB9QqHRGPIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761897996; c=relaxed/simple;
	bh=UuG3+VCNBbYpzeZ0dxVY03iZi2WsaJI6aqGWnRdi9IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oGqlMPzGCYDp8ERpp4VYaMd30sKkE1UAymWz0sdBkv3kQuql6h6WVCP/iVo6UkUpaAnUqjVxCjq8IcXK1wldavLX0IozEeHkKEq393ooYoL8UROMWIey1Bz0gQnGfrTVuVvRCc3VRvq0HY/9/9YPAFkuMn8JYtcIMFNIdPVv2/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCuWqJE2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCuWqJE2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-294fb21b068so20751525ad.1
        for <llvm@lists.linux.dev>; Fri, 31 Oct 2025 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761897994; x=1762502794; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IeLVIXwO7uVSd7Eb1bLuSghidWP97pKx/canepqCQWw=;
        b=TCuWqJE2QPjU+uiG2gM26xDcwT35QuzB4hcerxFjLk3E/yaSDpb54jAhwgDvIrCD/I
         TNr0i4Rm+OUg/ZEx9r0tOukLVjH49Q1rGONmPaWhJ50l68Z0lAt+F4D1iqI2TzB4Je0+
         pc1PZJhEgN4tIifShZ7SLm7TdGVg/6yaeshGALLfT5qSCwEEK35QiKe3oY8uFSZAdmcK
         bG41PscgbbsfrgduS4hdsovEC+gIJG42wrvtAxVDMQmIsXbFW8Mi/8gBMv/UXwryBGzE
         7vknIH3a2+l+WCfzg5qzWVOd3xcXGcfiAPub8YcWvgEX/kARltF8fvpwjTDhV735gxCI
         sXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761897994; x=1762502794;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IeLVIXwO7uVSd7Eb1bLuSghidWP97pKx/canepqCQWw=;
        b=cVGkmNbB5PAxaOkiexrsaf23KGDEWYveFRgICgCYOA6AuuyNKy/AQoUgQFEoQ0h1Ny
         I82n7vbXErEhzjEQjSFpaa+/XtUXGsmdcF+LPKhe01s4Hfla5V44+HYpG6yKb3nXByj2
         kOPS3ttRe0HwOw6EOCBLM9XnP/WbOt41O39Vxl/difNFpE3JLqz6X3AI7IAeZMFQiW9n
         VO4Q7hynPaAvIIXRCzUF8PaQp/62BFcmi6zY83CxY43hP2hn9XIhms7ZE/1k6Yf2G8py
         jb5OyAhUFJolmHyY7SVTop4+s97s9vyzm+MHaOlxwQL+5wlsr3D/bCiTwpOBNV8KyKAJ
         GVDw==
X-Forwarded-Encrypted: i=1; AJvYcCUhjvZPD6JGYfN4wKaxQ+BsPiO8RkipmeNkxsC3WmGAdW/gkCU7B7akrvoIocLrCVUlO5vE@lists.linux.dev
X-Gm-Message-State: AOJu0YwrwPhWlhZSbhx+vCHQwLIyfElERz/mLE/X6m36D2++2vX0yMSA
	IWWTA1AFSkAGQCZh2YoiZ+NSVKJgkVbrtaicbqR7aJOJwqlqX59uzArPRptAbiZe
X-Gm-Gg: ASbGnctD7VndCFxs2+0J5ToYNeEo03LLDdjTpEDGedYjt0xHGIdQJn5P1Mo0wm47imd
	YpVA9tdns9IvOoCoeIZCE1+zoYuYzQQRqDq27ly05yXfD+pR5cnUrj2847BHzl1Z+bfHnYtG+hx
	0D2YO91yz7QjogA8qTl3//+RsMrXXXphS1Rbva9yn6W06KR+Zk4/ggyLwhhCdGQgx7AedHwOC5z
	rFeVy3hMUtRCmAp2xe/TFEyGdsdSz1gTgjLyyoFSDmX1/8v9jzpK806DQOI5gAbvROLqLeqZoTh
	q3xLXTtmCR93epHIw1eySpwcX/1GlrNJgL8dxZYEnTCLaDFuKeMbonmHeG4qhJRb0g72eyMkzT/
	/GLZXHSLglrkli1pXCx91t271ndLpIFTXQuqXgNiz9pSR9WezCyOwNHZJ+viHZLUTJZWYmz1WEb
	vNn6ORCkjUOoPwibY9DwY9uEODkoWDTkoq4Z3IMIr7KL+mElstcBbWlUiupdyCgRk=
X-Google-Smtp-Source: AGHT+IGhFLRMuVYsJyg0Hk0qGxv9T+7d4+7cAQ0FGbKkkh0amDTMd2Acnw8xiF99bDeg05kFkWf4ow==
X-Received: by 2002:a17:902:b70f:b0:294:e8a0:382b with SMTP id d9443c01a7336-2951a4f767dmr25011125ad.54.1761897993644;
        Fri, 31 Oct 2025 01:06:33 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c9fbsm14113245ad.82.2025.10.31.01.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 01:06:33 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 31 Oct 2025 16:06:30 +0800
Subject: [PATCH] drm/tiny: pixpaper: Prevent inlining of send helpers to
 reduce stack usage
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-fix_202510270858-v1-1-6b111d475ce2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAVuBGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA2ND3bTMingIx8jcwMLUQtco1cTMxDjJwMDUxFQJqK2gKBWoBmxkdGx
 tLQBOGmBZYgAAAA==
X-Change-ID: 20251031-fix_202510270858-2e4643b00545
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, 
 LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761897992; l=2818;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=UuG3+VCNBbYpzeZ0dxVY03iZi2WsaJI6aqGWnRdi9IE=;
 b=mK5+SYBvGWn62MR/m+GdIu/nNPFIfMwQ2E2Ch9x0cFaUiEx+6Qf7V8YKLzV6lC9dvp44QfwL4
 MS+Nsbaq2KSA97KntzVW89WCREuwcThUpa6N6adNPMod4GcASuBpKkk
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Clang reports that pixpaper_panel_hw_init() exceeds the 8 KB stack
frame limit:

    drivers/gpu/drm/tiny/pixpaper.c:579:12: warning:
      stack frame size (20024) exceeds limit (8192)
      in 'pixpaper_panel_hw_init'

This warning occurs because the compiler aggressively inlines
pixpaper_send_cmd() and pixpaper_send_data() into
pixpaper_panel_hw_init(), which inflates the estimated stack usage.

Mark these two helper functions as 'noinline' to prevent inlining.
This significantly reduces the reported stack usage without changing
runtime behavior.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510270858.1GzE6iQg-lkp@intel.com/
Fixes: c9e70639f591 ("drm: tiny: Add support for Mayqueen Pixpaper e-ink panel")
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
When building with Clang and frame size warnings enabled
(-Wframe-larger-than=8192), the compiler reports that
pixpaper_panel_hw_init() consumes over 20 KB of stack space:

    drivers/gpu/drm/tiny/pixpaper.c:579:12: warning:
      stack frame size (20024) exceeds limit (8192)
      in 'pixpaper_panel_hw_init'

This happens because Clang aggressively inlines
pixpaper_send_cmd() and pixpaper_send_data() into
pixpaper_panel_hw_init(), causing the calculated stack usage
to balloon far beyond the warning threshold.

The fix is straightforward: mark these two helper functions as
'noinline' to prevent inlining. This reduces the reported stack
usage to within normal limits without changing runtime behavior.
---
 drivers/gpu/drm/tiny/pixpaper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/pixpaper.c b/drivers/gpu/drm/tiny/pixpaper.c
index 32598fb2fee7fcdea3ea0696c2bf54404fcffa2e..70e3239adfd0f86f92551991872486380489fb9b 100644
--- a/drivers/gpu/drm/tiny/pixpaper.c
+++ b/drivers/gpu/drm/tiny/pixpaper.c
@@ -536,7 +536,7 @@ static void pixpaper_spi_sync(struct spi_device *spi, struct spi_message *msg,
 		err->errno_code = ret;
 }
 
-static void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
+static noinline void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
 			      struct pixpaper_error_ctx *err)
 {
 	if (err->errno_code)
@@ -556,7 +556,7 @@ static void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
 	pixpaper_spi_sync(panel->spi, &msg, err);
 }
 
-static void pixpaper_send_data(struct pixpaper_panel *panel, u8 data,
+static noinline void pixpaper_send_data(struct pixpaper_panel *panel, u8 data,
 			       struct pixpaper_error_ctx *err)
 {
 	if (err->errno_code)

---
base-commit: d127176862a93c4b3216bda533d2bee170af5e71
change-id: 20251031-fix_202510270858-2e4643b00545

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

