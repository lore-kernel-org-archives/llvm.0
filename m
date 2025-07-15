Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85A513C8FF
	for <llvm@lists.linux.dev>; Tue, 15 Jul 2025 21:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752613562; cv=none; b=jb2gVC8qzK26zj1Kp92tLUGt/we022tb3YiFlLFHCPwykwtYd6twtNNmGEQSTrwtCZJjLNAtY3DfoWo5qtiKLPx4IDKOmNuSlotgkpAoQZv7Nn17wkXtwjrtNPyetEOGiyE2hnXmUAwgHxL3upretO68dXkZ1IcpnU6d4cmq1M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752613562; c=relaxed/simple;
	bh=FYGfjfOp0uffIaOqOxp3So3TBknLCN3hEFHcZKI2YSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JX0l055ltuT1T9VV45LU3U4bzeHxTSB5hJra8Y3XSkYIoBRDFvIvDQJ1o7ATCA/wsickfrrUULZ1x5ByVfPa1oWP5ZJecSMP3zPsGa4QJ2Gd7EeAcsSBkQbrEjnTxh58uPt86xdUAiriH4LLC4TH80x4SL9IjeSzvEtFP8Ea8lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j34uR1xk; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j34uR1xk"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so4632168f8f.0
        for <llvm@lists.linux.dev>; Tue, 15 Jul 2025 14:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752613559; x=1753218359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xrNWGpEv1BAuId4AbOTg2+zWZrUKdhz6s19aGKtODkM=;
        b=j34uR1xkiXT9Lzdn9n1mIg2kMr7WWaqBwNX8EX6w8NlsH5ZmHuuVNmr8qhxdx/eG0X
         4ymImJMJa3pW+BIKIYFP4Qpy+MGIwyuxXZaKBwrgPbcAZzrHHuhpIIVCHeViH5ZaJ6jm
         iX4Y2l/Wp+WJI5WfVxraNqKu6A4rIGnKQOnycZqLNFioVu7xSKLpQ+2y+mIByHg0O+TX
         5nvnEJ2nv7gqs2LWLeUXYnztMcmJKMnL6RUNngZS3bNo2dkh/6Ou+JCKkhrnYINQyAem
         n5fk/wSvi53SahJ7nJa8wZJHV31QU/SxOQ2ef+HYPglvK6j1zyDaVYNWDAO8vCrO1Iv1
         4YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752613559; x=1753218359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrNWGpEv1BAuId4AbOTg2+zWZrUKdhz6s19aGKtODkM=;
        b=YfManFmE6vFhlojXPlFRMHNj4dilboLgWeFv0Q++wCWJ/s1ROLAGsiTrB00fK8xCQ8
         uSfgtW+tJ+OTs1RNlms9dAOPMYvLsnWL4CcZlXiIXFNttrSuno1vWnB678MYcxNXOqLA
         BJlBT8c5RBTG/x2hF1myTLz+KVoU2vzmTC7kWwH6H8kvJ/6FpKKaD2BpgQxfqXn5rtqr
         IAVMYteUeIZulZ84L9V62Ey5CWxgIewcBm6B0+FerG3pGkKuZ4pQ9miR9bY7vKaW/J/c
         FLhsrqeOBBTiLeSko3L1wz86j8LRGNnavKaJBqRwB1+JNDXdPC2EWrlXiyuhErw+S0nR
         8cSg==
X-Forwarded-Encrypted: i=1; AJvYcCWIiY2l1aE0hQJV41v7TsN/CvwYCUgC0yfVzGqDKp5jC78C6hH0j7myMcS60G7GR78uEgsf@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo6kjHQjOf3eFJF2IcLIXciYjJMJvlSZyPyMNkF9qp3ywexc3d
	PEMYt8xIizm4aCyxq+TOFpgqseIeX/+GS8PGzBL2Ejtp+Wfzb4CksWNS
X-Gm-Gg: ASbGnct6vU3HL+8zJgezq93Gw9htOc2Jf/ExK0tc09Eceo3jmZpPEhrA9Iapjka5cX2
	H3YpL0v2idX3RutHiK6zRab4/p37EWwpt4RD4nyknX/S5YlVbOccR0HY0PvnvtpdXOIAeyh47Ax
	JZnQ6rss0ll90ILu1eBik5e+4e5PH/CwbVR5IAkLxeStjqSq7qbS66bjS4ZgV2xJwR4prxPwZOe
	S90hmiVxjop955lpWpRRd3gUHj4KDhDDE0xH231kmSlz5IwzggNElgpxZun9TCGEEh89SfxmDXb
	n2x2/GfJ3zWvRHpN4jFYyfBhmT5AuhNJ98xOy1M60463mV3R4QYyS+GBb2OJefUJW+ScFQNuR/5
	WB9QlIqTyzxt5o1Y/u8Q=
X-Google-Smtp-Source: AGHT+IGccMr+l6TuXlKeBOZcix9T3KSSEJKc+0G7hoGr2gWaAJ1sQCGF1RAGBN3M/xcDwUCYyKwhrA==
X-Received: by 2002:adf:b64b:0:b0:3a5:3062:793a with SMTP id ffacd0b85a97d-3b60dd72f31mr406572f8f.33.1752613558746;
        Tue, 15 Jul 2025 14:05:58 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:2::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e269a0sm15808133f8f.86.2025.07.15.14.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 14:05:58 -0700 (PDT)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	shuah@kernel.org,
	horms@kernel.org,
	cratiu@nvidia.com,
	noren@nvidia.com,
	cjubran@nvidia.com,
	mbloch@nvidia.com,
	mohsin.bashr@gmail.com,
	jdamato@fastly.com,
	gal@nvidia.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next V5 0/5] net: netdevsim: hook in XDP handling
Date: Tue, 15 Jul 2025 14:05:48 -0700
Message-ID: <20250715210553.1568963-1-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series add tests to validate XDP native support for PASS,
DROP, ABORT, and TX actions, as well as headroom and tailroom adjustment.
For adjustment tests, validate support for both the extension and
shrinking cases across various packet sizes and offset values.

The pass criteria for head/tail adjustment tests require that at-least
one adjustment value works for at-least one packet size. This ensure
that the variability in maximum supported head/tail adjustment offset
across different drivers is being incorporated.

The results reported in this series are based on fbnic. However, the
series is tested against multiple other drivers including netdevism.

Note: The XDP support for fbnic will be added later.
---
Change-log:
V5:
  - Fix warning caused by rcu_dereference() in p1
  - Fix checkpatch warnings with P3, P4, and P5
V4: https://lore.kernel.org/netdev/20250714210352.1115230-1-mohsin.bashr@gmail.com
V3: https://lore.kernel.org/netdev/20250712002648.2385849-1-mohsin.bashr@gmail.com
V2: https://lore.kernel.org/netdev/20250710184351.63797-1-mohsin.bashr@gmail.com
V1: https://lore.kernel.org/netdev/20250709173707.3177206-1-mohsin.bashr@gmail.com

Jakub Kicinski (1):
  net: netdevsim: hook in XDP handling

Mohsin Bashir (4):
  selftests: drv-net: Test XDP_PASS/DROP support
  selftests: drv-net: Test XDP_TX support
  selftests: drv-net: Test tail-adjustment support
  selftests: drv-net: Test head-adjustment support

 drivers/net/netdevsim/netdev.c                |  19 +-
 tools/testing/selftests/drivers/net/Makefile  |   1 +
 tools/testing/selftests/drivers/net/xdp.py    | 656 ++++++++++++++++++
 .../selftests/net/lib/xdp_native.bpf.c        | 540 ++++++++++++++
 4 files changed, 1215 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/drivers/net/xdp.py
 create mode 100644 tools/testing/selftests/net/lib/xdp_native.bpf.c

-- 
2.47.1

