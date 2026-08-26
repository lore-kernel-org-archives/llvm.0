Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6AB282F17
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 16:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761874; cv=none; b=PAc2y55WDz2G1HQB72qydHbKoHkNSuRkNUPBV8a2iia8bkglrcjU3ReYW2vcvtNypB3ln3gTOO5PVn/iH5j7ZFk1uEQHL1xoHmi/X6oz7xfXgcrmuK45pLT7GZ1acaiwSfapUwi+OiiP4pkob16haKnZ9dt+lGiUmplyna4j2lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761874; c=relaxed/simple;
	bh=js22L9kkegNeyF2N6EUzZPmTxGqw6C/kJ930hsuHuFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mbIu5XsY27uhNKM/iCvXezZ8VgSiu65IL0WEl6fNsnM3XklFWiO/UgCqUn5GyOOB5FU4K4DwG5f0wn4IN83WVfL0O+KKxlHAjhx82qEdTL5BVhQIWsYDYucDBEI+Drm/Dp9utM14rni2vnCmoYTUvbqIrD2gxTtxOtlOfRiTA0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=G8jceBUS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="G8jceBUS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so493285e9.0
        for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 09:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761871; x=1788366671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1p4Ix1lIWqwmdxGTuB/bpTq19/XoCgreFlH2DPS6K4=;
        b=G8jceBUS7un3MT2AnP7NQAu+/luJUh6sQlklIFBAyw+T/ez93lJ9sm/43xiAkLkyjJ
         cGL0K5wbRhgxfd2OkVj+YXwvPp8PlGmMeafo3n1CR+Z//4wQrYsEKc0NIWlCZ3zvX2lR
         wTDMSKCH2h1zy6KXnjEVYRaYoIxA78JeRuzBIN7cyzBudSiJ1QtunKReBeH2R0XXUPOE
         vZfZIWeBNvJkUNWI86wDYTROqXOG8uEMWSZsyg8krAP0b9JyxO6gNTTVwL7obweziXaD
         SxI7hIXs1178jw4yjx6iIMCGzFnZSNl9GZyjRZTaHoAOrRnYyXQe018aAsWwjdCNRnWM
         wLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761871; x=1788366671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1p4Ix1lIWqwmdxGTuB/bpTq19/XoCgreFlH2DPS6K4=;
        b=XmCPXVHmJUlnb7KOIeYRSQLw19HfVSIst15u2OHbw09ksOgzUoJFnGXL24NFL4dE3r
         B8Lv3/CYvrHKpDiNm9R3pv7d3wBdZJzOS/wp/ORTQ1wUuVtrOMV6JOoqXnR8SyheNmEI
         fVwT11klA1rM5JzoMXz1Xmv1R3I+yThHmGELmy0pVqfctPlk8vfACw5LRTJQsWbBtDm5
         PpUJnF8o3Rmvz/9eBs81PvFuSXQg9ynXqBsfRRqSVkbsdpOgRjoBynIT4IgkjvIAWFkq
         yL+rr04VvfmDHiH6YIvtVOHSwIpEZuzFF2XRYUOxOubLg/Fv7cN6QT1Z8jNtytBxIz6Z
         Njdg==
X-Forwarded-Encrypted: i=1; AHgh+RpVXF2LA16d2Xr2QsDipfpR+Bo8AL3+LKzsp+GikzZhMpbJk9FpU68Y63Z76I9mXeQJDdH9@lists.linux.dev
X-Gm-Message-State: AFuF++nqDCg2GXXiPclMNMGMHNycmR4j1kbt3D4bI1xeFwM+TR6nvcAp
	MoKW5OMRR+ZHH75Z36MUVzt7UY+isjtv4nEMECRQyqfoH6uok0jOw3r/7MDwp6FnTg==
X-Gm-Gg: AR+sD12WVZrVjYIkwGjDzBk9pdkSC3pfW/KnZ4ubnC7bzV8/jGXYRy5YDpiahQU9rHE
	W/3wyRcL6Ab5SjK/cc+P6JGRbH0WGtVVt7VNfmqP88ACBX2eZk9Z2qZgEBP3pPGiz/0Ph7Wr/lG
	xqyN63dqlToP3EkDPuDE51AmZIZeOWGc9Mn+pd/6Q5mP8dLBEIp4+bkctmVeNztCgQnt8oxW46Q
	t4fQ9p6T5AdWaJxlftE43SXOJA2dlftxmayxNlOKPcSXvj1zHXbWVO/SF0ye4hERj6epXBsUVCN
	pW+RSsMQMMFo701xKnLxkjkV0zpTw2yPl3+iDC7RmbfFLGQ5WR0ErrPLV2oGzB2fOD10HVOAccv
	Qb0z85Nw2cnqVJiAF0FBQ38Dtw6Aq7h8remRpqtbgEmOrnsR3igC7u5p2YaxMWD+84Pag/UaMkO
	qEGrIdX7p3ArnJgBWHp8NrqhuIHoNGvUhgzSUAeBI7E1qXv6Obgw6R+6WWTj7Y2kEjWl3BYOTiR
	QFXbJNBFqiwUFjnPRx8xCgU9a5teFFI7QJA
X-Received: by 2002:a05:600c:3151:b0:499:a5cb:b7c0 with SMTP id 5b1f17b1804b1-49b0deb14d0mr4628125e9.3.1787761870622;
        Wed, 26 Aug 2026 09:31:10 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc9b83aesm31202705e9.12.2026.08.26.09.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:31:09 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-usb@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/5] rust: usb: host-side abstractions for a bulk-endpoint driver
Date: Wed, 26 Aug 2026 17:30:36 +0100
Message-ID: <20260826163101.4168-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Host-side USB abstractions for a driver whose device is a bulk-endpoint pipe
rather than a class device

  Revocable typed interface I/O, so an interface cannot be used after the core
    has taken it back
  Reusable URBs and persistent bulk queues, which is what keeps a video stream
    in flight without allocating per transfer
  The device descriptor fields a driver needs to identify hardware before it
    decides to drive it, and a queue-readiness check
  A device id constructor matching on vendor together with interface class,
    subclass and protocol, for a composite device whose function is not
    identified by the product id alone
  Letting a driver keep its interface usable while unbinding, so teardown can
    still talk to the device it is releasing

Changes since v2:

  v2 10/11, "keep usb::Device private and gate ...", is dropped entirely.
    Oliver Neukum was right that it was conceptually wrong: USB does device
    level operations, and hiding that behind an interface is a layering
    violation. Device stays public
  as_bound() is gone from both the binding and the driver. Danilo Krummrich's
    point stands: needing an unsafe as_bound() means the design or the
    infrastructure is wrong, not that the escape hatch is needed
  reset_configuration() is gone, and set_interface() now exists in two
    correctly scoped forms, one on Interface<Bound> taking an altsetting and
    one on Device taking interface plus altsetting
  What replaces the concealment is lifecycle gating: an adapter-owned,
    revocable I/O window that is valid across probe, suspend, reset, resume and
    disconnect and invalid outside them. That is the interval in which I/O is
    legal, which is narrower than "the interface is bound"
  There is no private URB implementation. Colin Braun's URB RFC is carried
    unchanged as the foundation and this builds on it
  A topology walk and a device-removal notifier were written after v2 and are
    not here. They existed for a second consumer that is not part of this
    posting, so nothing in what is sent would call them

Alan Stern's lifecycle point is what makes device access from an interface
sound, and is worth restating because the whole shape depends on it: an
unconfigured device has no interfaces, so an interface that exists implies a
configured device

v2: https://lore.kernel.org/r/20260703030020.2694-1-mike@fireburn.co.uk

The rest of the posting, which is one series per subsystem:

  rust-core, 9 patches, rust-for-linux and linux-kernel
  https://lore.kernel.org/r/20260826162851.2497-1-mike@fireburn.co.uk
  rust-crypto, 2 patches, linux-crypto and rust-for-linux
  https://lore.kernel.org/r/20260826163004.3365-1-mike@fireburn.co.uk
  rust-usb, 5 patches, this one
  rust-drm, 23 patches, to dri-devel and rust-for-linux, not sent yet
  rust-firmware, 1 patch, to linux-kernel and rust-for-linux, not sent yet
  drm-vino, 13 patches, to dri-devel, not sent yet

Vino is the user for all of them. The abstractions themselves are generic and
carry no knowledge of DisplayLink

The whole thing is one branch, base and prerequisites included, which is the
quickest way to read it:

  git clone -b vino-v3 https://github.com/FireBurn/linux
  cd linux
  make LLVM=1 rustavailable
  make LLVM=1 -j$(nproc)
  make LLVM=1 -j$(nproc) modules

CONFIG_RUST=y and CONFIG_DRM_VINO=m are the two to set; DRM_VINO selects the
rest of what it needs

It is the exact tree these patches were generated from, at 4c9ba407018e, the
drm-rust-next tip of 2026-08-06. drm-next has moved on since, and this follows
drm-rust-next deliberately: the KMS layer underneath this work lives only there,
and that tree picks up drm-next on its own schedule

Two commits on the branch are not in any of the series above, because they
enable no part of Vino: a scheduler call site that stops compiling under the
locking-guard series, and the Kms associated type Tyr needs once the KMS
registration trait requires one

It applies to the base above plus this, and nothing else:

  Colin Braun, rust: usb: add usb request block abstractions
  https://lore.kernel.org/r/20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com

The reference branch also carries Boqun Feng's counted interrupt disabling
series, which SpinLockIrq needs. One patch of it is already in tip locking/core
as e901c1510e24

These patches were written with the assistance of Claude (Anthropic), used
through Claude Code as an interactive coding assistant, across the design, the
implementation and the tests. Every patch it contributed to carries an
Assisted-by trailer. The Signed-off-by is mine: I have reviewed and tested what
is here and I stand behind it

Mike Lothian (5):
  rust: usb: add revocable typed interface I/O
  rust: usb: add reusable URBs and persistent bulk queues
  rust: usb: expose device descriptor fields and queue readiness
  rust: usb: add a vendor-and-interface-info device id constructor
  rust: usb: let a driver keep its interface usable while unbinding

 3 files changed, 1553 insertions(+), 26 deletions(-)

base-commit: 4c9ba407018e8deb06dbc643112bac8f40404f95
prerequisite-message-id: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
