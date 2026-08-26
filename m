Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45F6471D00
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762255; cv=none; b=IlR8DOS9oImpw46VohxW2uTKep+g+TrqVxMxcyyvJt4rJDmzglkIQu8V9vYsKHDEsBbCgJwM7OPDutSKpXI+in9IHuosKDbuK4/Ex+5TbWLWG6Y/vgAWqQB3DR9dZTdA4cpKHrP0VTKNNPVbJgeojZJ/YiVzG9v7My1lZX0zamA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762255; c=relaxed/simple;
	bh=8B2TFfI057wykZuicacH8tAGgEjX68YKbGd6fEx7mxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fW5282Uk7RStdIWYpDG+CNfarqK1vwLKsnpNyOSRceW+daPqKQsm0e+It0K6xRiuZ3cPvLZvoS9S3j3/JBU5yfDCzRwsVq9H++nrGuG3UwJb/95ImHr8xNOM5Ru2sV2Ny4dAiKwsExueloZanA2o+oD46DtPua4uH6GRfKZ6X2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=zMPZ4iMs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="zMPZ4iMs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso10788255e9.3
        for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 09:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762245; x=1788367045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9qJ3fgTR4cimq6G1HyqzaxsMwSXV5Ik1jB7vizkJsw=;
        b=zMPZ4iMsBHEgl0F+Calvt26QkDDSnltOUnKDCArSjGoNYUaS8hcEeyzQKMluqi2HlB
         nZGABiXJON30UR0PcT9asaeXlH9gNzKrtAjALBHmxcF/Sp9KTruq2kdxNmlkIgqvnKCb
         /cEXrufhPw+F4B/+dVnhqJDRt0NhJs0vUkT+KzPM7I/CchKjXNExr53rig/hOPlFofzY
         SEG9Vd/hzPwaTYbJCvBRaytubvSw2ViEGRGkVJ69pXt3TlQaPpQG4iXJlyKY1SMVBKsO
         y0DqwpIG+HAcNmjj4oVNM673iui+oJTW9X6Jf33jpIKqATQbdTHPkj+Ak6W7yk71rZV5
         onrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762245; x=1788367045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9qJ3fgTR4cimq6G1HyqzaxsMwSXV5Ik1jB7vizkJsw=;
        b=hdgR438QUj6HJdoXLcKDm9EByyil9RaRt5ERCeHH/Z10GotF5+4OJaqZeqvtrJWbsO
         g7g1jY0Sg5hHnEEvTDWo20IiV47wVcI2PZnAgvGy+1bZ8kC4Al8EEfi3yuLoyRighrKE
         R2G8R4Kc6tIEx3AxceC66juP6TsFt+HHOhY5aycXg0xi7Ic+oj93vy0bBHunQQral2og
         QcpHG8tYEud1uTVEuXzAaL+bvU3l7GK/kxxvrz8koFm1orxTefh5CY6AkJ6ppcTuMCz0
         AYVOPo0tdMlNSfjbgV6kHcSmNmSA/GW99BF/3gjGPPrWOPlCQaxcUsoDB4RZPBtu1gHM
         zLGA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4KuRizs3EfsPj0ehWVbT4VFZQmQ3AnX7X3BFxDNIQFXSdsBvcSxjhbddMtvYeLiRXUylH@lists.linux.dev
X-Gm-Message-State: AFuF++llxhaAaklRK2q83zqRAftgkkPgQp4mQR22AnMYKmOxtWhtwXT8
	Lj6gaqrkUsJtRmh1xa9jmFC/FD5nGpmiTeN9ci5hXtf1rj7ZLRTT8CmOL4dr2wCfAA==
X-Gm-Gg: AR+sD10FpZYIRw2+eRs5BWSacFzKB3fID+wByYjVpBFpY8sOVCLUpJiVPSJw57JjV+P
	B+ZVcegn/VgWpFlZKWSrDfcAzbPr0DwZ6EYqHWS7MsdSL9mEUJPLS/Pq1etcbjc34Rq3GLdrRd2
	Kwppc6kQ+kOVzuCEwFHIcXi9LT8onutBavDoQrZklj8RXc05cjFFICRCn/e+drigZzOC8olo1fP
	BmkwIO1ALcdfckz7Hhq2h1e/TzC52ZH7AH91WmdpqsohK87U/0kcydJzTWZf2Gyzcc7C56laFAg
	oxmKX+iwWS+7RVlqaaG93/KfsvXqXYhvmItWLv+4ZARORWtFd+rmEVOKCs+7g0LjcXQvLh7dKQd
	MgWKbBUF8xowF05sAagGQRND/X4tTIUjgPf5pfqx+fp68HLvSv0Ej/PTq/Oik+EkpdwKyLd2PqG
	SvCzSW7Fx4fdThx1RsqZtN/rsB7AoQknl5OxxUsLU0K3gBjh7JhKwWelL7E/5r+HA5KpdTSCPea
	eirMoX61khpH7D6Bjf3A/UV7UFzAyDQUuo5PShKNiysO1/c
X-Received: by 2002:a5d:4cc9:0:b0:482:a9d7:7ced with SMTP id ffacd0b85a97d-482e26f2d68mr8304486f8f.14.1787762245027;
        Wed, 26 Aug 2026 09:37:25 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm3350111f8f.8.2026.08.26.09.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:37:23 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-kernel@vger.kernel.org
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
Subject: [PATCH 0/1] rust: firmware: the firmware upload abstraction
Date: Wed, 26 Aug 2026 17:37:14 +0100
Message-ID: <20260826163716.6274-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

request_firmware() covers "pull an image from /lib/firmware".
firmware_upload_register() covers the other half: userspace hands the driver an
image to write. It publishes /sys/class/firmware/<name>/ with the loading and
data handshake plus status, error, remaining_size and cancel, and is what a
driver uses when an image has to be written on demand rather than only when a
newer one happens to be on disk

This adds an Upload trait mirroring struct fw_upload_ops, a Registration that
unregisters on drop, and an Error enum whose values are the fw_upload_err codes
userspace already reads back out of the error attribute

rust: firmware: add request_into_buf() reached drm-rust-next this cycle and is
not a duplicate of this: that is the pull direction, and upstream still has no
binding for the push one

The consumer is the DisplayLink driver at the end of the chain, which writes
dock firmware over DFU. This has not been posted before, so it goes out
unversioned even though that driver is on its third round

The rest of the posting, which is one series per subsystem:

  rust-core, 9 patches, rust-for-linux and linux-kernel
  https://lore.kernel.org/r/20260826162851.2497-1-mike@fireburn.co.uk
  rust-crypto, 2 patches, linux-crypto and rust-for-linux
  https://lore.kernel.org/r/20260826163004.3365-1-mike@fireburn.co.uk
  rust-usb, 5 patches, linux-usb and rust-for-linux
  https://lore.kernel.org/r/20260826163101.4168-1-mike@fireburn.co.uk
  rust-drm, 23 patches, dri-devel and rust-for-linux
  https://lore.kernel.org/r/20260826163359.4998-1-mike@fireburn.co.uk
  rust-firmware, 1 patch, this one
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

It applies to the base above on its own, with no unmerged work under it, so it
can be taken without waiting for anything else here

The reference branch also carries Boqun Feng's counted interrupt disabling
series, which SpinLockIrq needs. One patch of it is already in tip locking/core
as e901c1510e24

These patches were written with the assistance of Claude (Anthropic), used
through Claude Code as an interactive coding assistant, across the design, the
implementation and the tests. Every patch it contributed to carries an
Assisted-by trailer. The Signed-off-by is mine: I have reviewed and tested what
is here and I stand behind it

Mike Lothian (1):
  rust: firmware: add the firmware upload abstraction

 1 file changed, 237 insertions(+), 0 deletions(-)

base-commit: 4c9ba407018e8deb06dbc643112bac8f40404f95
