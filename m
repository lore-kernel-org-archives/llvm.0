Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843731E480
	for <llvm@lists.linux.dev>; Sun,  5 Jan 2025 14:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736087551; cv=none; b=nRcdSZON/RHcdzSVnZj4MIESk9IaAUHgX13Ow2zmPWeRxn28bpBbudA61sxW6vUDDKal1ZvOFjNMLlOsQVYq/Q6e0LiDcE9AhwSIA5V5qpCR86+m2lqO9Qy6Ld6LYgdaP1DNq2U5VyNHXj87kjLqQk6h+gdtX9Qp4GA5BZLr4Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736087551; c=relaxed/simple;
	bh=G14yom8Cu9mhma+1v4Us+/fG3RLzBMAvWG7oROWgTOA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YqvvKucDF3rWLM6lqBngPIGMI2TkOUEDNQu2HxoNbwTmcNXPdyVGOS1EiTaKqP5DyUtk/1zvQZQnL0tewPty1mCWzwf+y17mytKH6IXxwGHNxKdm4KWo8hq0+OV8WMxWctBhq5YjOfJ/9Krc1z+Zg9YNQfuYgFAsj3iNpjFRuZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBrYXgt4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBrYXgt4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4362f61757fso135021605e9.2
        for <llvm@lists.linux.dev>; Sun, 05 Jan 2025 06:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736087548; x=1736692348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j7jtYVBmEwQu6L/gEGfLX0T0kQx+pmOUf5+fN+jViX8=;
        b=hBrYXgt45JQtkYsXJ6ZDJA4kFGsC48IHLFARMfsaG7pn3lJSi+5dII8OA12OnNrsUh
         M7EQpJbAPIK9eXm1bdOFRMgCQ7yu9HBTbMWvSGqWnQuPrUXb2YwNXl5IXOmWDHPOdsHE
         EyFtkLCSrZMg3gcZfRqyVRax97ogAglIj+vq/6+9Fx/ibZZmxi3+e3xpMFehRQ68sSsE
         0Yrz6J/r18NjeR1DgMnCNx88m24Fsp8u9jl2WBZnHsa/a/kiHRF17Q0RNA8hHTHJz8+l
         EHhJ4efULdTa8FRnNxpIZosSlsTKfv6foYyPYzsuTPhTaxMUSeT8Xlc7SsqLI/kxC/My
         3+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736087548; x=1736692348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7jtYVBmEwQu6L/gEGfLX0T0kQx+pmOUf5+fN+jViX8=;
        b=DFo45QEhenMe66UR9hO3rR+fpt09XOJhFoygASZ+11fzctS4OjPsiEsveJtJrjepJp
         SEr+ZXxkOGSn+5yyKQ8mfW+uC7wbitlZwqjhBu/rUXFcXsr661a4SwCRFgZ0rFvhFiDZ
         sd9+Nhe8MIazBBdO257lY9Hk1R568v3yEkOxjweznSTZsDxZf02xgY0FORyLDyTqVF22
         1DZc6zd0COcVuO8zN0fuWtaX+7lfzc5fWMz/LG4DRPlmt4d3sbAl4J8HsLMTy/PH5nrQ
         wycy3LVBiM3ejSN+G3d0kocBiFp8DtowIVmxQEOhkUtOZCsY0MjqybNGU76xb0lAwOqB
         u0CA==
X-Forwarded-Encrypted: i=1; AJvYcCWdGgfgjn4WFRoGrSyyyD0dcgLv0/STQD77cs92Gnc7m0SdxxPk6OpCS1gFu5gFevYq4tbl@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu5vspTS9xyGd6Y/gfhiAX3NZ+g6GeDvouMwepL9bVFTqB5YJt
	xOyTforXDT983fExlZUdouXokk7TVr/euzbd/zXJyQLRqS+Zcwmf
X-Gm-Gg: ASbGnctIslQ/XlL5H9eo2ZHS1o9XKyyIKftMEFaNGT5G/yJi+OINtH6IMnMY+lRXea/
	q8JTeruvGGmOtRj7fNjnp9zqJfES5kPW07+upu5lNTpPESUfd4SvOvj6BtrAf/idhbaeJy79IrW
	3w1v+VAG+5kO8fsHXh59rlWDG7/RVaTzysN3cPaMhWtgUR/6DJ1v4dHO1QXjXUts1z9rqLMRWa7
	v4dHQX354UbzDx+2kxe1CqXUMW4UzkEjVbSRSJsmRxC6vz7KM81aeDMtaE+0msdS0zDzYeYaQ6V
	QWn19bEsRfxzL6FUSlXFFWD3RUcH5Pa9BF6TMeclZA==
X-Google-Smtp-Source: AGHT+IF8tNz3GfY4u49mcFgAfGEi1eo1lKnxC2s/G4hUdUgJxBgrs22W3axBAOaS3XtaRFDnkbaEjQ==
X-Received: by 2002:a5d:64cf:0:b0:385:e374:be1 with SMTP id ffacd0b85a97d-38a221f63abmr46951411f8f.13.1736087547734;
        Sun, 05 Jan 2025 06:32:27 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm568189695e9.12.2025.01.05.06.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 06:32:26 -0800 (PST)
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
Subject: [PATCH v10 0/3] crypto: Add EIP-93 crypto engine support
Date: Sun,  5 Jan 2025 15:30:45 +0100
Message-ID: <20250105143106.20989-1-ansuelsmth@gmail.com>
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
 .../crypto/inside-secure/eip93/eip93-common.c | 816 +++++++++++++++++
 .../crypto/inside-secure/eip93/eip93-common.h |  24 +
 .../crypto/inside-secure/eip93/eip93-des.h    |  16 +
 .../crypto/inside-secure/eip93/eip93-hash.c   | 866 ++++++++++++++++++
 .../crypto/inside-secure/eip93/eip93-hash.h   |  82 ++
 .../crypto/inside-secure/eip93/eip93-main.c   | 502 ++++++++++
 .../crypto/inside-secure/eip93/eip93-main.h   | 152 +++
 .../crypto/inside-secure/eip93/eip93-regs.h   | 335 +++++++
 include/linux/spinlock.h                      |  13 +
 20 files changed, 4145 insertions(+)
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

