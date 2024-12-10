Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE8822B590
	for <llvm@lists.linux.dev>; Tue, 10 Dec 2024 20:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733863765; cv=none; b=cOlC+TrmOEVqLR4Oi+4B//0kpPbQOrr01Xx0vTU6av2WP8djS9ih9sg7moIlq0N4NFo4wbNTRGfhPjBKPMIb8guAorgVg3Uqa6xyGJA/C6QaafzB0XI33T4eTyu9M4SBgOFhV7g+1Q2Wf5jqOmIL8s/zaIgoJ3dmz4gkuHMmGGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733863765; c=relaxed/simple;
	bh=OLTPVYyc/7nlCM5FPxXemPRns+bgGCcQnKZHAGRTsMA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=T2p/zf2ooJCIgK4MVYS1TAPEVl1iWJHvoeH0OWf70BQRoDvmG0EnSj4wlfBvKWc7Zy/9+U4/ImZEPGKykP8RxknljAUyLzAREKLnIa5RMJBwX/HGzSG6cyAt4k8L4v/0K4knu7GxqfWuAEtfepucqBY3TZTdw1t1Zjpzw3zC4kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9+KML9K; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9+KML9K"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43540bdb448so7741135e9.2
        for <llvm@lists.linux.dev>; Tue, 10 Dec 2024 12:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733863761; x=1734468561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jg5mU2JMtNTWEE8J9PA490rUld5BDirou6U7dgBSKuk=;
        b=Y9+KML9KTm5Okk954h9zigpDbdgg/YadLTjrhjMMOAGqULrpq+1U1rLff+AKD9JEnV
         KF9qHEJVTShXEARjrl/8F0wUAvbi7HsOmTNFm+MdRoQFfXheVGKfN53L91iQak79t06D
         adquTdCRUnziG40r/QSIDpAumoE7TJ2W7RmyQFML7uqfSQEfigAjrBY67QJBYmSk9buV
         pC1WGH/v2j9n1L5IjwPg16F0W9k5jGoLLdvuPYi9Zi2BvD7DqmLxIm5TmBX8Anism+E5
         +nFWhGGoFUqg6pRPnNWAVTe4oXfgPaA/xsZ0iGieUw5wwAn/uNPwn6UaExZ2g2wbL8t4
         7tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733863761; x=1734468561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jg5mU2JMtNTWEE8J9PA490rUld5BDirou6U7dgBSKuk=;
        b=DIFEl3JDJsoVUiFAT1JHmmQnDB3KvmmlxpOdnXR0gIJxcZPsvubCK/GmVTKCq7efUk
         FtMHqmOJF6Ux6i/vuKOZRwq6PPgmbT43eza8LqSKA3LqPnNtFY9fm/0eo1VVxLau1bVi
         OhkYJmpNME2Hs5v8A/KTrYOxuDgIHWdOfaUojyg2wEr+yjY9jcqNgTtoXuaXnr7f+tTQ
         vOA0Bw9ITSJBPglzbgiCBxKkfmqsfIRjuixpUZIQ3JmYUHedVg81eDunhMK/qA0DJn4L
         srojTfRDOpwjCburvzazhvNEioqTu2Sa6GaaZTvirboGBQDWLXg/7b5mL6W4Zn3ZKFx8
         7GCw==
X-Forwarded-Encrypted: i=1; AJvYcCWNqLg/ftlG0alvpAqfiPqRNpb/fGMpu4YyGcwsCnSStRGWqyjdUhKG96iwi+AEL+QbOriP@lists.linux.dev
X-Gm-Message-State: AOJu0YxlwhRYAdhXeAZJbD7BquiRZOQWlOj+robcE9vyoOa+vGUBqUXU
	+2ySuCLD6OcMXeG6GOKzqyonN7XvUxsHCd6JYCp7opu/4jj15sUb
X-Gm-Gg: ASbGncucUuDVNBKX+bfZoKnP8rmebOOjzKIhCI8WNCocmtM26c2+cJxeGkuWqlzNI6E
	0YD1iRb6vSS7ot1L2km3hfloaWK2AMeG+J7zPP8gjj+ieRDcQ1RlBobhcOW9e3Xt1bKW5u+Rwb9
	CzulJ2D0jbI2C7x2N+/qVY42tpoizSjmwOU7KO7Flbka932azDcSG9AM1UQIOgptCOyFOKx6Iv1
	Xb0GOt0B1pgp6xxGkv8+nYFj9riBD6o98f08uFjPA8vvzm4aYjeW/Ldg6WIpvh5je8yYxvFdMK8
	f+mYpcN2Bc88g99Xs0AAl1c=
X-Google-Smtp-Source: AGHT+IFdGKcgUx09Wfb/ixJSF3YMDPcdaSeYAbxmPfqXTo/jaPabL7YpzhSY2394DQYnDqVsbDBPcg==
X-Received: by 2002:a05:6000:1f82:b0:385:f56c:d90a with SMTP id ffacd0b85a97d-3864ced1f55mr354339f8f.55.1733863760924;
        Tue, 10 Dec 2024 12:49:20 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-386334d0486sm11808307f8f.50.2024.12.10.12.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:49:19 -0800 (PST)
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
Subject: [PATCH v8 0/3] crypto: Add EIP-93 crypto engine support
Date: Tue, 10 Dec 2024 21:48:30 +0100
Message-ID: <20241210204853.18765-1-ansuelsmth@gmail.com>
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
 .../crypto/inside-secure/eip93/eip93-aead.c   | 710 +++++++++++++
 .../crypto/inside-secure/eip93/eip93-aead.h   |  38 +
 .../crypto/inside-secure/eip93/eip93-aes.h    |  16 +
 .../crypto/inside-secure/eip93/eip93-cipher.c | 413 ++++++++
 .../crypto/inside-secure/eip93/eip93-cipher.h |  60 ++
 .../crypto/inside-secure/eip93/eip93-common.c | 822 +++++++++++++++
 .../crypto/inside-secure/eip93/eip93-common.h |  23 +
 .../crypto/inside-secure/eip93/eip93-des.h    |  16 +
 .../crypto/inside-secure/eip93/eip93-hash.c   | 987 ++++++++++++++++++
 .../crypto/inside-secure/eip93/eip93-hash.h   |  77 ++
 .../crypto/inside-secure/eip93/eip93-main.c   | 502 +++++++++
 .../crypto/inside-secure/eip93/eip93-main.h   | 152 +++
 .../crypto/inside-secure/eip93/eip93-regs.h   | 335 ++++++
 include/linux/spinlock.h                      |  13 +
 20 files changed, 4265 insertions(+)
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

