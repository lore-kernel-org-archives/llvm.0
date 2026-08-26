Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5893843BDC3
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761744; cv=none; b=YI9RCJLmikOE8oUtWqjjcaSch/oWZHNhGi75pHnCz3rRac1pvGgjvpFrxynxbC7ag8c2JSTPC6iqCeCe3qtwJsxoDHusfLzXMFyx9zEiDT/kn9kM5I9aqdGu9z4Z/hgEyUBHcsNZTo4DhadBl5NQ6Ak1mq6XHwaAGio5qzIoyqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761744; c=relaxed/simple;
	bh=ArTrpRRy1Jj6m7cEYvnr2wlDFxncs2BPtRXDvhuQqkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=reWQpwBhsOWwJg2TKDsHXHoWzoeqw3Tnl8UuioxFAGM3mG+LYDuK+QHZ1PxVXuXJXUPliJx1MPh2p5KGxFr4cY0Zmr+JzYWIoLeXOd+X9KmKeOeSpkVUelr3racSeCdw3ujwqSMVysthEgH+rv0//mupCMrfps07g7iMF+gjMKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=iTEz4cgT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="iTEz4cgT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso664025e9.2
        for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 09:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761740; x=1788366540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmMPed7R6Cs7sHpgzIBI1b+r7mX9EAuKIVs5oZFmXYo=;
        b=iTEz4cgTRWDzYzgskMfImW+bG3WSbJWVNcHZMq95/hmM8BtwotY4uK5x3LGbYRsEgK
         I2qGgJuTz87joyONXAQ0tYcSQ1+Zln7HMorY543Dq+A9DqgUNyJGKbWobq90iDth2lgr
         O4hDanThO6JO0jqC79mQnlResOIfx9YELALRNh/JIyL0zVVq1t+gpDmV/ho1dkEzC/yh
         MXIvbCiDgk16Tkv2euoEujrI4HwNrnfyp72Tha/U4kqHM67T83iS7rt9Aux2/jf8kXdA
         F/rwbGuohzsFDYNGeZM9ceVlyHXdYDl3b1k4B1g0RT1W1tu40t1udWgpagAVvGyEGTmH
         K2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761740; x=1788366540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmMPed7R6Cs7sHpgzIBI1b+r7mX9EAuKIVs5oZFmXYo=;
        b=bUcvn6+1xKysLXaULSHmFHvMP6CizCwL6Gr6eFCljJieDRHaNHSDp+Dlj3w3b1Smfj
         VXvMwUO5u2hZrN++/63Cl/iThbkbrf80vTeko78MAgvFFMn6ns5fvJ8PqJVBeMFghRAC
         yz1IrZwHPFHlNDx6grv6Lirj0hD5HmhWYJRcIWzoLLvxSwh2ftK5PKYzz5tGsnpcDtvw
         xXKK+FV8qvLhyeJg7hW0lLClNF+B2RSuwwgY1Ra6hrUQ4aX6SkPu7EvBPlEme/m4OTsN
         c52yLAAwS6APFOgP7df80tRLQVhsXGNLKgGjfkW3hg6lrsQ0TKplq9bU8tVa048g7vvq
         gt8w==
X-Forwarded-Encrypted: i=1; AHgh+RruVCbOBmi5ZSFlBP6OPkFlL5KYwZHxs2MlJ+UR8W1NBbXXRGtkSd7gDsCuB4olZHLcLrx5@lists.linux.dev
X-Gm-Message-State: AFuF++lxn4cwPxeYn5icm6OtQlcYL94diZZcfh7NXSLAw3h6XIprWP9a
	H2dKWrUDfjlonLnpckzAzxJdn8BqFPP6on4hendfrapltRpodAGv/v7+86CNiI8avg==
X-Gm-Gg: AR+sD13OAAmL7cZjeViWtJb0NYKjDkicgJRbUZN4ZUCupz8Gd++1Kc5KfxR/xZy+Tzd
	r9iDIBOGAwDpm4Myll4b5lICKnvbNVTHGlq+nPubrgluRINR5lVwVUUs+Dv9Bl/5C3Gvw0Ofz0Y
	jxTb8RGHaSFknfsmZs1sukgLY4RqAGnieLBr/4IaE/3ebPAS9y1UP5Quj+vRRtCcUEwivEitANy
	IWcdbtzrWbsIn/ntkrZ1Ba2oyJt3D9CnSEsO+JK6j7bkUmisac8g15Sx5DCi1TZvxWsTSAGqi6K
	w7VY/u8Rdtnign0vZ8ogouaKt+IGvclONUthJT4AiLP8h70tiYj6cMq2JO2d9qChhWUT04I6Ta5
	K5ZLbhHALg9ibDHDN5R2eGx/I3SOJvo0NIIBYI07rwoMbrwhOZFc0pbFRgLtARsZUzmCD7LCBhl
	saKzDggCJ+AmamZDwxiFyyqXHZhtswWte64PZw197cDwXhbk21t5qmA1hLkuh0fDRn9aSF6fqrQ
	piOItAzVrJwiEcd44exF0KVTDweyRZAgAmOPA==
X-Received: by 2002:a05:600c:3e83:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-499dc823a01mr79538685e9.14.1787761740102;
        Wed, 26 Aug 2026 09:29:00 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:28:58 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
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
	llvm@lists.linux.dev
Subject: [PATCH 0/9] rust: core abstractions for a USB display driver
Date: Wed, 26 Aug 2026 17:28:34 +0100
Message-ID: <20260826162851.2497-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Core Rust abstractions a USB display driver needs. They are separated from the
driver because none of them are display specific: each one covers a kernel
facility that has C callers today and no Rust binding

  sync: single-shot and timed completions
  hrtimer: restart an ArcHrTimerHandle, and read the interrupt state inside a
    hard callback
  random, xxhash, time: safe wrappers over get_random_bytes(), xxh64() and
    ktime_get_real_seconds()
  workqueue: make OwnedQueue thread safe
  io: offset copy helpers that check the bounds they are given
  error: expose EPROTO

None of these nine has been posted before, so this goes out unversioned even
though the drivers it feeds are on their third round. A runtime platform-device
creator and a root-device attribute group went out inside the rust: drm v2
series, where they did not belong, and they are not here either, because the
consumer that needed them is not part of this posting

It is small on purpose. Every patch has a caller in the driver at the end of the
chain, and nothing is here on the argument that it might be useful to somebody
later

The rest of the posting, which is one series per subsystem:

  rust-core, 9 patches, this one
  rust-crypto, 2 patches, to linux-crypto and rust-for-linux, not sent yet
  rust-usb, 5 patches, to linux-usb and rust-for-linux, not sent yet
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

  Alice Ryhl, Creation of workqueues in Rust, plus Onur Ozkan's cancel_sync
  https://lore.kernel.org/r/20260312-create-workqueue-v4-0-ea39c351c38f@google.com

The reference branch also carries Boqun Feng's counted interrupt disabling
series, which SpinLockIrq needs. One patch of it is already in tip locking/core
as e901c1510e24

Danilo Krummrich's OwnedQueue, ScopedQueue and ScopedWork series supersedes part
of the workqueue work carried here, and is the better answer: Vino calls
Work::cancel_sync() in seven places to make teardown wait for its own work
items, and ScopedWork cancels on drop, which is that idiom done properly

  https://lore.kernel.org/r/20260807165252.3849875-1-dakr@kernel.org

It was still moving when this was cut, so this uses what is available today.
When it lands the swap goes in as one commit moving the prerequisites and the
call sites together, since either half alone leaves the tree not building

These patches were written with the assistance of Claude (Anthropic), used
through Claude Code as an interactive coding assistant, across the design, the
implementation and the tests. Every patch it contributed to carries an
Assisted-by trailer. The Signed-off-by is mine: I have reviewed and tested what
is here and I stand behind it

Mike Lothian (9):
  rust: sync: completion: add single-shot and timed operations
  rust: hrtimer: add ArcHrTimerHandle::restart
  rust: random: add a safe get_random_bytes wrapper
  rust: xxhash: add a safe xxh64 wrapper
  rust: workqueue: make OwnedQueue thread-safe
  rust: io: add checked offset copy helpers
  rust: hrtimer: expose interrupt state in hard callbacks
  rust: error: expose EPROTO
  rust: time: add ktime_get_real_seconds

 11 files changed, 243 insertions(+), 2 deletions(-)

base-commit: 4c9ba407018e8deb06dbc643112bac8f40404f95
prerequisite-message-id: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
