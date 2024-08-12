Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC317A58D
	for <llvm@lists.linux.dev>; Mon, 12 Aug 2024 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723465057; cv=none; b=HS1CDVhtBGFKCX7PUvpq77P08lDsusoKFP0VfEaYs9RRqEFKzYG+8VKqG1bTBP6Eg6gsuKN8Rf7zRCLJo3nbJ18ru+rrgjmrJ2kEd3pmP1t+SVEwtAAlYigzS0cHEE+QSpLmN3ihHYt9B3MYoER5jxTaLbGPE2iO2VhZNrVmks8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723465057; c=relaxed/simple;
	bh=pTiLvX6dgRw/lbpMcbvul78nttHoBA2ug0btunkVO8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l9MjUyEee/G0KeESUS9RpGw76JTllYUH0gC8fGAyEaDYG5AcnVxFw+CjRa2UgHaV+yyCcuQAdQKh3pLzInSI0oXI/3cX8cvXm111ZJqImf2ZORMuAJd/NLBm5LCpwwnLwcUuSn+gcyLkRu05QR7178S/aCEdz25hqXC51oJvEUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiX4QeQl; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiX4QeQl"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7aac70e30dso477601666b.1
        for <llvm@lists.linux.dev>; Mon, 12 Aug 2024 05:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723465054; x=1724069854; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2MT7CpoVbgtNAFPvwIvM+rcDNcVzre2hq92xi/BU9g=;
        b=TiX4QeQl8+a2qCk4+0iW+UD0JO4p8l/S6VXWLnc7ah5YA1jlORqX/SYH1bI0YtmQ2L
         HcK4OMl4sROAQhcWv2dV5USltu47dVS5Wk3Cj5xqR1gqyeUVqSsQH/W+oXiS0WqbDHt6
         1R4f/cwQvuZx8dlQWKDgCGNtEOkPAEL2+YoNDOthJ3AnTlDq3IOWG0tRlo/mYExGG1ny
         n+lYcaDH01YcJVW8OHPwNZ+08pxm4gEM3/Hsdd0qQh52+1vELJjgY1P1k78kbsEvDDjc
         li92Q0q0qs3pCS1omTdFgg5zL5uMd6oGfA4cw5pRWlJviQO+wDW4Hi7SITVWVWqOaI+Z
         MnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723465054; x=1724069854;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2MT7CpoVbgtNAFPvwIvM+rcDNcVzre2hq92xi/BU9g=;
        b=gMTW470g8Vmaq2OXN7loDKwgdcY76Qn1PyWD+x9dEN42Q5Rs7yQVNSbwxa8EXDeOe3
         0z8j0i1n6EQhBrOs3PDt9UQjrMPHwYHYXu6YLfBH6EeSmFyNnWa462OXUkTQdO/nK9WZ
         12MddsLihxV3Q5vMgir69+7lyIUwOYvBpw9uJf3+AWGcvZ3F6STiidD9bnQFtWPlHQ1h
         RdE3/Dcfa5oXo+kl3Z9MZlIQIF42SSlV1kcufGq0Homvr+ovebRzF11WZl7ZvC4x8v4M
         swkhRJsxrtz5H35K6VwK+dqf/5f3o9ZqasYOWneHfaQzFUXyTFkPItkYn9075yyCWyBe
         sOfQ==
X-Gm-Message-State: AOJu0YxX6Z+mk21sBEvStFQnZgg7YbmD4Rp/GwIPFUyblvEiGDNgX1GI
	X1sfXlaB9yKFC3wUKgIm8RYI1OwNwt+BaVpEVleehUP6UtHc78pn
X-Google-Smtp-Source: AGHT+IHuioC1eMHhDjPqzvdRQcGw1i3us/v/rw8S6D6YDwM5A3GZum2Wq897dettoU7QQJkhYpvLHQ==
X-Received: by 2002:a17:907:6092:b0:a7a:c083:8571 with SMTP id a640c23a62f3a-a80ed2cfebbmr5491866b.52.1723465052896;
        Mon, 12 Aug 2024 05:17:32 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb0e1981sm225737366b.72.2024.08.12.05.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 05:17:32 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 12 Aug 2024 14:17:21 +0200
Subject: [PATCH] Documentation/llvm: turn make command for ccache into code
 block
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-ccache-literal-code-block-v1-1-4f09de978667@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFD9uWYC/x3MQQqDMBBG4avIrB1IQpDoVaSLOP6tQ4MpiZSCe
 HdDl9/ivZMqiqLS1J1U8NWqeW+wfUeyxf0F1rWZnHHeBOtYJMoGTnqgxMSSV/CSsrw5+MEN1mO
 0GKn1n4Kn/v7v+XFdN68FKyJrAAAA
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723465051; l=1223;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=pTiLvX6dgRw/lbpMcbvul78nttHoBA2ug0btunkVO8c=;
 b=SDOJxpOKGH39hPR8hykQodZxeGYZ7NMFfdKU5mLg3BkVQmrFVkc43IOOtxTJqPHJhco8fE7iL
 8TIjOkDlvTCCJASXzC44OzeodS2DWLWJZlPEF1QRTm1Zg7BPa9waOfK
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The command provided to use ccache with clang is not a literal code
block. Once built, the documentation displays the '' symbols as a "
character, which is wrong, and the command can not be applied as
provided.

Turn the command into a literal code block.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 Documentation/kbuild/llvm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index bb5c44f8bd1c..6dc66b4f31a7 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -126,7 +126,7 @@ Ccache
 
 ``ccache`` can be used with ``clang`` to improve subsequent builds, (though
 KBUILD_BUILD_TIMESTAMP_ should be set to a deterministic value between builds
-in order to avoid 100% cache misses, see Reproducible_builds_ for more info):
+in order to avoid 100% cache misses, see Reproducible_builds_ for more info)::
 
 	KBUILD_BUILD_TIMESTAMP='' make LLVM=1 CC="ccache clang"
 

---
base-commit: 9e6869691724b12e1f43655eeedc35fade38120c
change-id: 20240812-ccache-literal-code-block-8462614e91e9

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

