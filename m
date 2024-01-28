Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DE7139D
	for <llvm@lists.linux.dev>; Sun, 28 Jan 2024 02:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706407944; cv=none; b=RGN8fEEzDy2qDaHg4qjT0eqCDhIDxzJ4LaE5xXE3P5/lxk+9FGH7iFVtw4WvE4EIHK/Sv+MdsVC9tXdPZGiLdlBXg/UZD+1rcg252KBYGF5HfdTyCrexCzzXIZdnBOadhU20hzinCHbQF0OO1ZMADu7luOHrk1K6bVaObf/Luy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706407944; c=relaxed/simple;
	bh=vYXWXYwsJVuOt1QS9UcPPIEtBivA4uOaogtA5hEmjCI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j/SlTfLf/UhOx84D/tp15j1RNI5hLQozU0fuagXf95efapzsoZOKGzdQV+J+38HDRMfyxWKL8+DzCVvLTh3Mz5qbvEq3ss3exzxZkvr5MouUIVQ6zfCAgDtCzTFW7t10f17q1bsbHVfl47Y1/FPaOwq2RhISxQH4AAYsbNxqBx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PnHiAMJb; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PnHiAMJb"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-42a99f34cc8so2795131cf.2
        for <llvm@lists.linux.dev>; Sat, 27 Jan 2024 18:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706407941; x=1707012741; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Os4wPtYXMOk5j6YcX2wbCDq2BXooZiO0dAGB9kYAD7I=;
        b=PnHiAMJbOs4A4451LyTzqDh9QKVRz0j3BNPwlZiAkoxA/vZtR5McfdMHegU40Yd+9Y
         KgT6aIqU0iWziWvwgjolrKRbZP4Tn+nC3QdjW4vo0QcOUNRIwELxgnvcp8/aG7d/ZGPj
         FZbrmw2U+VM5JkRe3g4aKKtJU5dVJNe0D3h1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706407941; x=1707012741;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Os4wPtYXMOk5j6YcX2wbCDq2BXooZiO0dAGB9kYAD7I=;
        b=wOBYUFUXznkjt4eh8MOvtnZU6OOUebHhmoG5FOexC+puvt8rSSZORJLZae0vkfxxt4
         HOx4odzbvGKT5cDcwIA5+nfZGYfB964TbaN+xLJbIGFtOkuWHzaheXeOZW+yfcs1gQP7
         MkRPPTegsetBGSVYvQOtjJlMU/Y95Beu7EVNrqvIJmBllmkIrNcqlEZynqDEx5B7ZmY+
         lhURqkjWbPKfhEM1w0ZzJX2Ki/Dks2Fetve1Lvi/7e4JX5sjbDmY5vjeZLrr85IlRKJq
         sQyBMdTgKcisXDGRnJTdeq0LPi5g/c4tHk2kQ7N7XuTnReiDsJJqDLBlLhuDJmgek9/A
         WTDg==
X-Gm-Message-State: AOJu0YyyJ1XIGbZmq5jNOA2lPk9WchvZO02AyvITCo/QwqF5mnylIgUt
	I9ogbT/xB/w1iLPJmBQThTGwU67B5oh5UH/W/yswsn7C9AYUkI5H6wdmE3vvgQ==
X-Google-Smtp-Source: AGHT+IH6NXk/WvjaiaDj9r8/fahbRrGy45ANWovc96JmRb+SX77746RDy8yuddFdapSADOOCEgbhNQ==
X-Received: by 2002:ac8:5e0c:0:b0:42a:2ec3:e8d2 with SMTP id h12-20020ac85e0c000000b0042a2ec3e8d2mr3154130qtx.50.1706407941471;
        Sat, 27 Jan 2024 18:12:21 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id ka23-20020a05622a441700b0042a98bf0117sm568061qtb.78.2024.01.27.18.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 18:12:21 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: Fix warnings building with LLVM=1
Date: Sun, 28 Jan 2024 02:12:19 +0000
Message-Id: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAO4tWUC/x2MSwqAMAwFryJZG2iD+LuKuNAaa0CqtKBC8e4Gl
 8ObNxkSR+EEfZEh8iVJjqBgywLcNgXPKIsykKHKWGpxlQfdrgveUwwSfMLaWerIVHXjZtDjGVm
 tPzqM7/sBzrWH3GQAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

LLVM does check -Wcast-function-type-sctrict, which is triggered in a
couple of places in the media subsystem.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: pci: sta2x11: Fix Wcast-function-type-strict warnings
      media: usb: pvrusb2: Fix Wcast-function-type-strict warnings
      media: mediatek: vcodedc: Fix Wcast-function-type-strict warnings

 drivers/media/pci/sta2x11/sta2x11_vip.c                           | 5 +++--
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c | 6 ++++--
 drivers/media/usb/pvrusb2/pvrusb2-context.c                       | 5 +++--
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c                           | 7 ++++---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c                          | 7 ++++---
 5 files changed, 18 insertions(+), 12 deletions(-)
---
base-commit: 615d300648869c774bd1fe54b4627bb0c20faed4
change-id: 20240128-fix-clang-warnings-6c12920467cb

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

