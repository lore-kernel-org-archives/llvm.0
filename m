Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416B41ADC7C
	for <llvm@lists.linux.dev>; Tue, 14 Jan 2025 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858519; cv=none; b=XtHqEhYMl8miEni0RupTTeSnyXs+SDVuUw+Q9UH4cFs6ZuyDC1RNBztza632EC0+PfX3Tr8SJyHS2ZpjGysoy0xmyhohmtZ1hSxjRdaUlERr2kcFJ7N/4u5SddQnlHkxekaCSxX9d/Bqu8D9Dpr9iSsmRIAIkwduWh7uznRJnks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858519; c=relaxed/simple;
	bh=PwVHIqhZkU7VSiKTgzgFML3bKwvEqDKfozFrlDyLep0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AXvYGoKySsqM3TrFZs0YF+LKAyhzSXBva5laCON8rwoBnWEQNM2be2L6MdcSETHKDe8n0VPW2+R3oIP765g9jAXjcsUppfo+wVYec6IDuoANO9qoFKFoYCXvN97Pb7fRlHA/IfTL0w+y4vTY3rlY06TisQ2O6fdqndKWX/SHw0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV/IquTG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV/IquTG"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2892003f8f.3
        for <llvm@lists.linux.dev>; Tue, 14 Jan 2025 04:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858515; x=1737463315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bxKHNbldLr2KPjRhb+DsTvrYykc7jhuWUFNqFwWd4MI=;
        b=nV/IquTGYK6k0z1hkeBbVAEZ7oIb9Foib2yFP1JboyQHW5M9q1N3oQev1E8Man/E9V
         jFXJUr3KKBH2d5KMAa7rBjqu9qduR3zIwQUkc8hX+wwRGNHjgsXfic+HgzWK5h+3Jxgn
         Kc8Vt26Bwa8M18WIrwBZ1gpy7WNmki7piXim9rYUvxKofCy03KJYEqKcCmo5409R8m2a
         NCYNtNbtuJT+wsWIPfwBlLGHmhmpl+zy1CJFveWSnuu52Ri4UilOw6qM+c/DBm/ueaLQ
         7QIHT2ipNVJnqf2iQ7m1xZJYdnMt3mI2MEDk8V5VpVRjj42wiGFOWgUK35P5nCsPlfhL
         qnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858515; x=1737463315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxKHNbldLr2KPjRhb+DsTvrYykc7jhuWUFNqFwWd4MI=;
        b=nbIYrDr8IG91W7r2BbshbPQDUlPDn6Wc+m62Sugdw1bU2aALQH+ugzFB4D7W9S7DEd
         rEGLtgFjmrRsTbAdFwWx3jk1IuYgF+C1IDDIFDhNDS8kPcfvSmgHnLWcIsTyUwqR4Ksl
         NOQH9opNNeQKD1amGKr/fjy6SHUA7xhIQEuAjXMLgTYpbKm7ssIRSI0MZnb/xRj5CD4Y
         OrOh87RxoyMLox4arMExGpLS5H/jYgLiBYjhIc89Zb1o8ASpfe/UEQ//evA1cmsPoi1v
         Wf1I2/kQWzpwWSmcSsfu5Q4kHyWYAMBoV+P8mGMUBZQ9Q5lQjhorQ0cfWLSDPX2vpNjg
         fpkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8rw0NK7W9AuoshrRNvqWiyDZeLCqYnM1rP6jbbwwSzeAYSZJ35VcQFz3NiI4cAMfc1CPw@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq8XAK7ml900yGgK2H9Doam2zx1vlomtlbYSLSW7YLfAghTc0p
	2HuvDl9K4tv5qJV7O0IctmaYF+/wOlSvYMbfTF/bOnsYUUBpEoDv
X-Gm-Gg: ASbGncsUYpHmdhlxOhgALGu/DHEfi09zSneV2K09V94x8lrz4qxOXGja9dxma5T6rOK
	6hBe9rnFsuqfwtDhv+OaP/OFfJRp3MCnAiZ7wm34ddxVtJXQMw2nbtOPSQFSuy0mDioH9SmJ/Xg
	yPHX8ncJ6MfqoEafIKr8Gm2fRLyfNOIs8qscgLtKfW1DDV7mD4TCQRX5cM/9k6+Lbl1BXl7e+y+
	V/o+ss85KfXaDvy76Os4LHE0dnwDU7YHa1xH66H8F4xjr9uvo/r+MnMFYEuEmrKbneBpJAMUCb0
	VNDIop+Kf8zWnitKyXlTirB3Yg==
X-Google-Smtp-Source: AGHT+IFqsYA3x5QlY9vO8Znk97lUtOQbkl8bJPQAZxX2XqUU5HAXMx0jymkTJDCc6PnFJiYiF+/hPQ==
X-Received: by 2002:a5d:6d0d:0:b0:385:f1df:2502 with SMTP id ffacd0b85a97d-38a87308abemr19025172f8f.36.1736858515343;
        Tue, 14 Jan 2025 04:41:55 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38c6a2sm14798771f8f.54.2025.01.14.04.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:41:54 -0800 (PST)
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
Subject: [PATCH v11 0/3] crypto: Add EIP-93 crypto engine support
Date: Tue, 14 Jan 2025 13:36:33 +0100
Message-ID: <20250114123935.18346-1-ansuelsmth@gmail.com>
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

Changes v11:
- Drop any mtk variable reference and use eip93 instead
- Mute smatch warning for context unbalance by using scoped_guard instead
  of guard cleanup API
Changes v10:
- Use CRYPTO_ALG_ASYNC for eip93_hmac_setkey
Changes v9:
- Rework hash code to alloc DMA only when needed
- Rework hash code to only alloc needed blocks and use
  local struct in req for everything else
- Rework hash code to use GFP_ATOMIC
- Simplify hash update function
- Generalize hmac key set function
Changes v8:
- Rework export and update to not sleep on exporting state
  (consume pending packet in update and return -EINPROGRESS)
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

 .../crypto/inside-secure,safexcel-eip93.yaml  |  67 ++
 MAINTAINERS                                   |   7 +
 drivers/crypto/Kconfig                        |   1 +
 drivers/crypto/Makefile                       |   1 +
 drivers/crypto/inside-secure/eip93/Kconfig    |  20 +
 drivers/crypto/inside-secure/eip93/Makefile   |   5 +
 .../crypto/inside-secure/eip93/eip93-aead.c   | 711 ++++++++++++++
 .../crypto/inside-secure/eip93/eip93-aead.h   |  38 +
 .../crypto/inside-secure/eip93/eip93-aes.h    |  16 +
 .../crypto/inside-secure/eip93/eip93-cipher.c | 413 +++++++++
 .../crypto/inside-secure/eip93/eip93-cipher.h |  60 ++
 .../crypto/inside-secure/eip93/eip93-common.c | 809 ++++++++++++++++
 .../crypto/inside-secure/eip93/eip93-common.h |  24 +
 .../crypto/inside-secure/eip93/eip93-des.h    |  16 +
 .../crypto/inside-secure/eip93/eip93-hash.c   | 866 ++++++++++++++++++
 .../crypto/inside-secure/eip93/eip93-hash.h   |  82 ++
 .../crypto/inside-secure/eip93/eip93-main.c   | 501 ++++++++++
 .../crypto/inside-secure/eip93/eip93-main.h   | 151 +++
 .../crypto/inside-secure/eip93/eip93-regs.h   | 335 +++++++
 include/linux/spinlock.h                      |  13 +
 20 files changed, 4136 insertions(+)
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

