Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34199204002
	for <llvm@lists.linux.dev>; Tue, 12 Nov 2024 01:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731376797; cv=none; b=tAQzX8SK98vuJdZdhGUFEz0dtFpcabNc+ueiNMev/w9qqWAI900F+fBK/aDSNMDHMjEWeIkfZrMY/Fd0rKy1Mas5EPqpmVMvk0vXUvruXe3iSPJ1nP6/NhmyQw483pJAUav3W7tpiXvwLW0ZvUU5DWKZQK0UCSiTp6tkyoggKso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731376797; c=relaxed/simple;
	bh=aXYZ1wmyao3Lcc2X2UFTZZ/JZa17V3RMqI9Bh2tXkH0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=UQ9Cf2d78I2Vy1QXIw4uUYOqX8eKpjzz6qmS09wdHP2Dm2/EGmMZaGVlTSx6BukO+ZqI1SB8duoPO0nXT/OsySgZeaA8aZM+M3iULyo78nGa47mwzwlVQ5rLBoygLM8mQaem6IbR3CKLpzuT239b7ZBucTiFffQjKcRxTY98fKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcuSSdbO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcuSSdbO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4314f38d274so64898275e9.1
        for <llvm@lists.linux.dev>; Mon, 11 Nov 2024 17:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731376793; x=1731981593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8v4PHWLECGvbJAUU4tXSsbcNs9XiIiR6lHIjzJ5k2M=;
        b=RcuSSdbOQHlB2/V8UGEvcxr5EedWu36E6sCTtjmtg5cirIaZaTZEdFj+3Qwist4P31
         FbbqSh61Nb+U43yX9eL9sArx9e2AvMuozVzBUxWkcUsqAA/pk9bvJ5bEFAwc7QBd3RdJ
         +G9phzVkUKq44KFvq+bVjybYRp2juLPH3REIifO6+IKcjdfhEcoblJNvjoLuihR9bv8Y
         mxVc0tk2K2VIPOUQE8lpZlWHL0M2J2GHaJau4ssptZa6sGfjGo/A+obNfHFrbFcGFMsy
         LlvOQAg/myFb4Y9/ckPaSQLuHW2OF690s17hxr9qM7ykz++rGa3bhmwlXce9fbJnstSi
         8RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731376793; x=1731981593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8v4PHWLECGvbJAUU4tXSsbcNs9XiIiR6lHIjzJ5k2M=;
        b=S7NimTtN6ugxDCywGWVPH0lCGFP+qT78zndL6jG0zKWycQ7zxdiZ0brh4UlZIphQwp
         ZSFBSJN45y758/m5it79ApMSAgUBmiZ32aH5+VGXwwsyZ8XbzGj2rmxnR5Hni0YX6ne9
         +OxpsK/zQ2ikLIpGUQc556LFz1XQcTZ4K0LfGTJzuawCcdWt7fPbdiFQhKNplym4XJNK
         eQgdNPjBxNHbdQVcVgOpVblT2Ao2sD7yVyerZHa1E+T5Y0yazlNcFhCeE5yOvMKTwtLv
         Ymwr3DKqvZw59H+Wndai1Kot3BB5c3e/lmkfnO/g4i/4rxdMVlraRVBUFihYkXFwemcf
         pA/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIS/+R7S8BTTipBsnQm86Lu/whPBxQXF753upucjTHSpbKvw+aQgUmZ/6USnoiN35p4iBK@lists.linux.dev
X-Gm-Message-State: AOJu0YytZUp9uju7Nk8OzTX2JywA40ugZtVazhL4yBLvQM0JHaANsiRF
	61h9rZrJR/+nfnnVptOydzvuqF9X0QPQTxaS1ehOWudTbmsqPCej
X-Google-Smtp-Source: AGHT+IH/di55KhvyH/nFAQd0By19c/iW/d+gHvodKaUdHseEE4eBVOofeL+t8Uvg4Omb0BJuQIWJWA==
X-Received: by 2002:a05:600c:1396:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-432b7518e11mr148469195e9.21.1731376793276;
        Mon, 11 Nov 2024 17:59:53 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432cf2b9fb9sm1783295e9.1.2024.11.11.17.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 17:59:52 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	upstream@airoha.com
Subject: [PATCH v7 0/3] crypto: Add EIP-93 crypto engine support
Date: Tue, 12 Nov 2024 02:58:57 +0100
Message-ID: <20241112015920.22564-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series add support for the Inside Secure EIP-93.
This is a predecessor of the current supported EIP197. It doesn't
require a firmware but instead it's embedded in the SoC.

First patch extend guard for spinlock_bh.

The other actually implement Documentation and Driver.

The Driver pass all the normal selft test for the supported
algo and also pass the EXTRA test with fuzz_iterations set to 10000.

Changes v7:
- Fix copypaste error in __eip93_hash_init
- Rework import/export to actually export the partial hash
  (we actually unmap DMA on export)
- Rename no_finalize variable to better partial_hash
- Rename 3rd commit title and drop Mediatek from title.
- Add Cover Letter
- Add Reviewed-by to DT commit
(cumulative changes from old series that had changelog in each patch)
Changes v6:
- Add SoC specific compatible
- Add now supported entry for compatible with no user
Changes v5:
- Add Ack tag to guard patch
- Comment out compatible with no current user
- Fix smatch warning (reported by Dan Carpenter)
Changes v4:
- Out of RFC
- Add missing bitfield.h
- Drop useless header
Changes v3:
- Mute warning from Clang about C23
- Fix not inizialized err
- Drop unused variable
- Add SoC compatible with generic one
Changes v2:
- Rename all variables from mtk to eip93
- Move to inside-secure directory
- Check DMA map errors
- Use guard API for spinlock
- Minor improvements to code
- Add guard patch
- Change to better compatible
- Add description for EIP93 models

Christian Marangi (3):
  spinlock: extend guard with spinlock_bh variants
  dt-bindings: crypto: Add Inside Secure SafeXcel EIP-93 crypto engine
  crypto: Add Inside Secure SafeXcel EIP-93 crypto engine support

 .../crypto/inside-secure,safexcel-eip93.yaml  |   67 ++
 MAINTAINERS                                   |    7 +
 drivers/crypto/Kconfig                        |    1 +
 drivers/crypto/Makefile                       |    1 +
 drivers/crypto/inside-secure/eip93/Kconfig    |   20 +
 drivers/crypto/inside-secure/eip93/Makefile   |    5 +
 .../crypto/inside-secure/eip93/eip93-aead.c   |  710 ++++++++++++
 .../crypto/inside-secure/eip93/eip93-aead.h   |   38 +
 .../crypto/inside-secure/eip93/eip93-aes.h    |   16 +
 .../crypto/inside-secure/eip93/eip93-cipher.c |  413 +++++++
 .../crypto/inside-secure/eip93/eip93-cipher.h |   60 +
 .../crypto/inside-secure/eip93/eip93-common.c |  823 ++++++++++++++
 .../crypto/inside-secure/eip93/eip93-common.h |   23 +
 .../crypto/inside-secure/eip93/eip93-des.h    |   16 +
 .../crypto/inside-secure/eip93/eip93-hash.c   | 1012 +++++++++++++++++
 .../crypto/inside-secure/eip93/eip93-hash.h   |   78 ++
 .../crypto/inside-secure/eip93/eip93-main.c   |  502 ++++++++
 .../crypto/inside-secure/eip93/eip93-main.h   |  152 +++
 .../crypto/inside-secure/eip93/eip93-regs.h   |  335 ++++++
 include/linux/spinlock.h                      |   13 +
 20 files changed, 4292 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
 create mode 100644 drivers/crypto/inside-secure/eip93/Kconfig
 create mode 100644 drivers/crypto/inside-secure/eip93/Makefile
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-aead.c
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-aead.h
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-aes.h
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-cipher.c
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-cipher.h
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-common.c
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-common.h
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-des.h
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-hash.c
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-hash.h
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-main.c
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-main.h
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-regs.h

-- 
2.45.2

