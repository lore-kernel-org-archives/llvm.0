Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C75817E015
	for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 13:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734182927; cv=none; b=aVwLNID2/PXIKbAfzsmJUzcV0NsACSWH3r6rJ50wjbDnjf7pSNZHdR9VWHL6CQJnTxBBcbdxGiqPFwSfIJQ9PnYjzYT4nAj2dH+kQy9tSOcy0Wdj9dczHzV7McexzYqcPREeHMTBv1Nvc/7hCe3/b39MrMQlpPHlchZJy+0YWfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734182927; c=relaxed/simple;
	bh=Wy+U/RXFyyNeT0tzJjPMpTteXWlnAz+YsoOZBCw4Rcc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=VbATrH56kkB//a6T2TIjP3ouH4QBIef/LfOFdmKs/ojzEsUbhyhopzhxZyQkjkgu+JEq0CH9RiVyLjFUL/WzrdPKe5/oRv3BQ9ValO9Eg3Dl9Y38q7vEFctOeaz7v5IgXKJMQKi1RkC+ICKHB0YCG17eNyShCYR8CwZQlC/7PLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYDvhD4K; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYDvhD4K"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43628e97467so20738965e9.3
        for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 05:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734182924; x=1734787724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HO8HOTr8B5ah55ywq4xCweT5ljEIJFW9Gqnw5M3266I=;
        b=UYDvhD4KVdWWFnED+GOLX0b7wJLvdurQADIrw7dqjABCfUwl5SzC3gZID2F/PwaMUX
         DTyVfmydkVq6UAeD/UgUwiOZhlmP74uCRanu8MJAmqi4p7CASldv7tlohFvWUrmHVVrx
         KVq1Fev2nOjufFevAW/kKBo9S8YosMXZ8C3831gToi/KQ3CIB4GNqZ/PO2crmytvjwbr
         GxHuJAYLYwxRzfadcqB30/R0mJtSSerwuYsp6Q/HaZeAJRL79mHt/b2Qa33EUjlwna6i
         P2ZwwdO0n2gz6pjT/M3zK2YlSE4NQj2GgoMtgjBJk+nMlYA1aHCHhu/WrEaKjXKP3Oxd
         VYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734182924; x=1734787724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HO8HOTr8B5ah55ywq4xCweT5ljEIJFW9Gqnw5M3266I=;
        b=fzwIjzCPm0l3T9Lt/a6eAvhN7TwZNA2og6Me5wFp2Rq1Tr2AtMtJYb5j+n5iu+RK4H
         ZSc7Cp22OrC0gfabpA9DjFjcIdt7POKvmBVYbZcwzSRKS/mO0iBftbID5JBch/7QVLyd
         GbW64hDsENLDn0+00WqYUpvHFuIhc9wO5cp2YpfYVuBVZdfxrh43aP+Y0ArxK/OAPhj3
         uZEh/GsPm7hNoTdAOYc/QGqtI5/1tlyNr4Twntv6A6adpxkanjvmV8L3FP4p/Yxy0T13
         GGxOAuiW4mOOkGsllEKDgRo47WKQquA0F/J2HxQevQTkRAJdmJwL5uBC2v97q30G16ee
         xTLA==
X-Forwarded-Encrypted: i=1; AJvYcCWtFnyKkf1Xg1udmMfeuEqZZziSYO5w4xtjMIhGU+J3PXJdxkuhcy1vN7OgsQODS4skEGB3@lists.linux.dev
X-Gm-Message-State: AOJu0Yzhjiiq9Qy15c1HnB6uCok24/vYGmZcIgaDoe8HyV0cteKN9reF
	Unp522JVscKmPFhd1DCc40ZfBLzc2/eabrL1iWZz1HethnXfw62Z
X-Gm-Gg: ASbGncsr4xvMpNVrpqxd3bJxbljYVuNXYt/0FE3UnPMa/PuI7YJDy5x8KlJWftIWf+7
	nJQ0xlwuLDMC1bnUrwFcleL+BLeUaYNCflH3IhbczlyMRqowijAN3JH+KXyVz4ZngrFbfpw8IMO
	LCFrUa8ektCqp7TePAaH2ouemHvXb0Nxs2aPbkrYfMWBKAJkovBd06X4tK/TXTIq4Istvgufo0i
	HRpV59oGpaFS7chLCngnuYiubiJX3FXYfcTTIO4UTxhyfL+dZGbt3KNhLrz6ZjuU57LfbJKgqpD
	2hA0EdfKjuhYt2U/AZ+Fe2Fgog==
X-Google-Smtp-Source: AGHT+IFJVjWIIB5s39gUx1SvdqqGCesjab1llC/QPC5s1Cw1w7UwSrqeg1+KD36txuQBShLxIST56w==
X-Received: by 2002:a05:6000:4b0c:b0:385:fd07:8616 with SMTP id ffacd0b85a97d-3886c7252f4mr5918505f8f.0.1734182923380;
        Sat, 14 Dec 2024 05:28:43 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c80162a6sm2559850f8f.33.2024.12.14.05.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 05:28:43 -0800 (PST)
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
Subject: [PATCH v9 0/3] crypto: Add EIP-93 crypto engine support
Date: Sat, 14 Dec 2024 14:27:51 +0100
Message-ID: <20241214132808.19449-1-ansuelsmth@gmail.com>
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

