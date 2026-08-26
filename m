Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B540740B11C
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 16:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762055; cv=none; b=VgAiRrU60PmqUKMoxb9PGpvaaMw6CABHYu86d+wqecj5ylzN2kVZrLkE2e0c07AzzEOUNE2ty7OTC1d5iG8ovo/bUEjw713P83baq+6rhGD+VqZyjiYsf0UZyKtCXukvVJOqXdilTwDHpIeiEObvJg8CwGDmKJyx+wsmksVRtTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762055; c=relaxed/simple;
	bh=s9SXFkDKJWYemu64oqEap57yuOxkINYTmbpVqR1nemE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+dgMZyFXxU2jlHuA56tnUc20ywTTwjDEWEVrRJVXXnR8DUaMRPDBBLtavS/GIfsR1otcCnyIim463QVUSLn90jR510UHbFp9aqqpfbRTystmwG7MNKKjM3LmetFBo7VZWOkdn12p7+TqAFyXiBDfwsA917EsSJEtjI7Y51jalk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=b0IgSpz+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="b0IgSpz+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so511905e9.0
        for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 09:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762048; x=1788366848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BNp6aViZcz4to/Cdqsuhox+93lABRwOcAkdzqvBJ+0U=;
        b=b0IgSpz+R6HGRd11bfSW08fmZeigryeZiI1Xz4pplureR1ahblxTPWvkPVZ8dVLO1H
         Rsv8HNGI7OXiVD9p7Vk4ILH2K/7wTnXQ2lK45RchdgdLI1Vi4vuxfqLEzp7VO4a9uk5k
         gGo5ARcemUDlGsSK0A5FS0bfzr/4I5bL7fSoCvSgCgRFeQM/yDCajnbvboXsqgY31t2o
         XcMEP2vOSeHvSU9+84fRM7a29umC6SEox0JEZ0hpvCLYVzTlkNnqe1S3jWr+S7htQp51
         /KQdZYA4lAU0wpt/g8Lkf54Df52dKlpHB+AoHByS2XPayKkD+jqqirY4hIBPBwLnl3iT
         r8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762048; x=1788366848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNp6aViZcz4to/Cdqsuhox+93lABRwOcAkdzqvBJ+0U=;
        b=k2k8L4S6uLwHckViikFuKK1w9+kGAfL4o4yCzdVtWuXEId/6LNv6NOp+T0dFAtMnxT
         cMGYab1DS+cBv75xg/3iRgdllmo2UyzCF8jZRgcU8GXxFQcVp8zQoLs3/HNk3yKob5Zv
         /5AfaCnE+K4bp+2u16Ta0h435GGNZqUmogjD7RIApDX9qHDzyE0x0f1m2drCgEdjLyKc
         yLOhLAe9wgDklidiobZTprFjw3iV4LiY2cFK0AkREKpUouuLwTO9fI/wKh/sQlXpwK8+
         uGhYzHoljmn//oznt228fnt4sViFcBfsqkUM4MuPL4j8kVKbYOFBzGy/s0pT8dAtoty1
         Ntqw==
X-Forwarded-Encrypted: i=1; AHgh+Rou49lEx0Dn63HvNICQudRnKLRBP5ikcpxVhH7aHvZYY/hpIeHFzOFQ+MuYs0KugJgVcbWR@lists.linux.dev
X-Gm-Message-State: AFuF++l32M5ROqfwF6E68dodGLuPyRCNp10E65rU6W+cipSDsW69D4E9
	fCoVaXyrPgTjNm79V4eq5XPNKNhcuhESqeSLXrL3XAGjFS4JWMSMONkKlTPAq4rxBA==
X-Gm-Gg: AR+sD10zmNkkeyMCB/quSsS7xnzyh/k2pCx2YCqJNwgOmDUXE0bokZULeUAGD4TwVXb
	i7Swzd71QLaQQT210VWx8m79p//gD/gSccobqkJYHdnWB6mrQu1z1QKukyQLrDTvAgMyaiTxtyH
	FFgJKDYJIv+BoGBxzCphyQKuIK8mK2M5xquM2kE0Sh+TSLAN3TQ8AVinP6U0NodcFEYhHecCY+i
	Eu2d+lm8IfZymB6+xc7Hkpz4jTm+D96fmvsF2xBX9mkkdxb/CihGgNQc7T0TslS8IhayVO4XYrX
	IdlRH4On191HBxhxnJtBL7evxh68JLqK0fyVNvKP3ZEWkp4zP+ri2Gfr94GH+jLztBFUQj+lDNo
	7W+x/uDRbReQMmTj4qJgsO22bhwUr6frI+exP+qFDy4bXiyDpfC/h9Eu9ebUZMU9xckl0xNjL+2
	lEe7d0nYxBegauWgMA+f8yQbmd0OoZOrk5YWcUsIAkdYhkeY8OlrFP49Nqhc9G0CjVpf3E+g9qW
	Q6AG/f9l1HqN7y+gk4bBIPZX5dNUXBiZSUK
X-Received: by 2002:a05:600c:46d0:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-49b0dd5821cmr5708995e9.0.1787762048114;
        Wed, 26 Aug 2026 09:34:08 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:34:07 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
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
Subject: [PATCH v3 0/23] rust: drm: KMS abstractions for a Rust display driver
Date: Wed, 26 Aug 2026 17:31:31 +0100
Message-ID: <20260826163359.4998-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMS abstractions for a Rust display driver, continuing Lyude Paul's KMS series
rather than replacing it. The first patch adapts that work to the DRM APIs as
they stand today, and the rest add what a real driver turned out to need

Broadly they fall into four groups:

  Lifetime and ownership: mode-object references tied to their owners, owned
    CRTC and vblank references, a safe constructor for owned registration data,
    pinning the owner while DRM files remain open, and rejecting cross-device
    GEM handle creation
  Properties a driver must read or publish: typed colour and rotation, plane
    blend mode, FB_DAMAGE_CLIPS, connector colorimetry and HDR metadata, and a
    connector's requested link depth
  Callbacks and state: connector detect() and mode_valid(), common state and
    connector helpers, checked plane geometry, walking the CRTCs an atomic
    commit carries, and CRTC mode changes
  Modes and framebuffers: an owned display mode constructor, mode flags and CTA
    VIC matching, synthesized CVT connector modes, and validated shmem scanout
    views

Also here are the HDCP 2.2 message identifiers, which are DRM UAPI rather than
driver constants

Changes since v2:

  Lyude's 43 commits are carried in order and patch-identical to the imported
    source, with her messages and tags untouched and no trailer of mine on any
    of them. v2 mixed her work with adaptations of mine and obscured the
    attribution, which was the fair complaint
  Everything of mine on top is a separate commit, and it is either an
    adaptation to a DRM API that has moved or a safety extension a driver
    needed
  The i2c adapter-provider patch is dropped. Igor Korotin's work is active and
    its provider-lifetime question is not one to answer privately in a driver,
    so the kernel driver registers no downstream I2C adapter this round
  The typed event channels and the private ioctl compat translations are
    dropped. Both existed for a second consumer that is not part of this
    posting, so neither has a user in what is sent
  The hardware-cursor support that was a separate v2 patch is folded into the
    plane work it belongs to

Two overlaps worth naming. Alvin Sun's
"Fix missing fops.owner in Rust DRM/misc abstractions" fixes the same bug as
"rust: drm: pin the owner while DRM files remain open", from the other end,
through ModuleMetadata rather than by threading an owning module through
UnregisteredDevice::new(). Theirs is the better shape and mine should be dropped
the moment it lands; it is still load-bearing today because upstream
UnregisteredDevice::new() takes no module. And where an early patch here fixes a
commit of Lyude's that is itself unmerged, that fix would be better folded into
her next revision than carried separately, and I am happy to do it that way

v2: https://lore.kernel.org/r/20260703030123.2814-1-mike@fireburn.co.uk

The rest of the posting, which is one series per subsystem:

  rust-core, 9 patches, rust-for-linux and linux-kernel
  https://lore.kernel.org/r/20260826162851.2497-1-mike@fireburn.co.uk
  rust-crypto, 2 patches, linux-crypto and rust-for-linux
  https://lore.kernel.org/r/20260826163004.3365-1-mike@fireburn.co.uk
  rust-usb, 5 patches, linux-usb and rust-for-linux
  https://lore.kernel.org/r/20260826163101.4168-1-mike@fireburn.co.uk
  rust-drm, 23 patches, this one
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

  Lyude Paul, Rust bindings for KMS + RVKMS
  https://lore.kernel.org/r/20250305230406.567126-1-lyude@redhat.com

The reference branch also carries Boqun Feng's counted interrupt disabling
series, which SpinLockIrq needs. One patch of it is already in tip locking/core
as e901c1510e24

These patches were written with the assistance of Claude (Anthropic), used
through Claude Code as an interactive coding assistant, across the design, the
implementation and the tests. Every patch it contributed to carries an
Assisted-by trailer. The Signed-off-by is mine: I have reviewed and tested what
is here and I stand behind it

Mike Lothian (23):
  rust: drm: kms: adapt Lyude's KMS series to current DRM APIs
  rust: drm: kms: tie mode-object references to their owners
  rust: drm: kms: constrain connector encoder attachment
  rust: drm: reject cross-device GEM handle creation
  rust: drm: kms: add common state and connector helpers
  rust: drm: expose HDCP 2.2 message identifiers
  rust: drm: kms: add typed color and rotation properties
  rust: drm: kms: add connector detect() and mode_valid() hooks
  rust: drm: kms: add plane damage-clip accessors
  rust: drm: framebuffer: add validated shmem scanout views
  rust: drm: kms: expose checked plane geometry
  rust: drm: kms: add owned CRTC and vblank references
  rust: drm: kms: plane: add FB_DAMAGE_CLIPS property support
  rust: drm: add a safe constructor for owned registration data
  rust: drm: pin the owner while DRM files remain open
  rust: drm: kms: add the plane blend-mode property
  rust: drm: add an owned display mode constructor
  rust: drm: expose mode flags and CTA VIC matching
  rust: drm: expose CRTC mode changes
  rust: drm: kms: add synthesized CVT connector modes
  rust: drm: kms: read a connector's colorimetry and HDR metadata
  rust: drm: kms: walk the CRTCs an atomic commit carries
  rust: drm: kms: expose a connector's requested link depth

 22 files changed, 2062 insertions(+), 99 deletions(-)

base-commit: 4c9ba407018e8deb06dbc643112bac8f40404f95
prerequisite-message-id: <20250305230406.567126-1-lyude@redhat.com>
