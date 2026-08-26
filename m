Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6072C470E84
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 16:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762515; cv=none; b=JMTTrfeuRFiwnRuPtHpQdrTId7XfREXTZBn1ay2ORxI5WztSlF/jEZwW/jvzf3m4wQqlgNYMz/r8ENqs8VufO8R8xvLnD/2E3/Sw2yxlza4bPgUllZ8HDmN6j4Ju2II7E0QkJaTWLvex3VHHD92ty/m2wxznSg3ie2zcEqjnNJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762515; c=relaxed/simple;
	bh=hxwU9iVyxpGSAAhg2LMrI2wFBmgWHb6UAnI9L1baLjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vAGSfBR1JLBGIYIuJJgp39WEvRNyOu6W+DIjIB16Pl9lvW+uDJ9dGsCHvFXDhC7fkW6uTGXt8OqKgX/emBo+QyKIa7HBpZ9J7ggRkwnzYnxe57LIU7C2Fi+oqitjxLAysbx/TrCJ81Nh8p3vrIPsv4oAyJHyyMrmLBnusn7zPRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=QYvcenI6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="QYvcenI6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso9997155e9.3
        for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 09:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762488; x=1788367288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4V2qWTIy9upPrwYp43xXrz2kFXEg2TQMUb90MextArg=;
        b=QYvcenI68LU4dqp1rQij+wXXUJ+29ytEb8QW0cbS9B4E2ldmOrOI29DKjdfHPhM+Sf
         cJq9gFCyvYNjW0Zf354nQaDeyraaKofjTryBCkPPDrTV4DIE5stB8ht0l+YcZIU9DahQ
         3J1wS+KagRGuznU3kPGaKhIf3tiDlJcZEsiHmusgRvEnQblZPaY8+7Vp0qmMOcNgyH/I
         SM1xSwYjhiH9LywzSD89E+ToJV9qNZd0mGjIaz+SiMkIVjip2h6NpdIVQu9tUc1q1xrs
         KckupJacw5KV0DeIwRQWBFB0UQa3B79Qkwg2VOh4wdGOOrASlwAgvONoJtrIe9CPqwSs
         5/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762488; x=1788367288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4V2qWTIy9upPrwYp43xXrz2kFXEg2TQMUb90MextArg=;
        b=WVYdWOQcYDU72EKZhvW6XgahWazE4iYlDrTfSmEIhVuFkaXlcmJ71CRMYihXRX9+wz
         nw594zf8omyda32jBDHRCR0n4rhIIGgg0ZURBNunrZzRxiHLtMwdgMCtut1K3AuzIfRK
         Fl/aUVCG15HX7Ud7GG7IjazH0gAdF1rXUlaK/4kGGowJNP3/YcSsRcafaIjGcCfP/e1t
         kJJj8vXiaCsGliJSf0ttfzfCLCPL3wa5w1oVqYvBDtO2+YrZSMaXeolckG0hoMzKrakx
         6Gc/8I2yfMiMj+7UKpx6lsqn4TvyuDSucaiy7Gmuoaz0Hhgc0fy8/9hC3wIqnNlcfgzB
         IMew==
X-Forwarded-Encrypted: i=1; AHgh+RpidxqLPw3N4S+HKn7jX4LvTvG/8B1baSBoiMxmzbij/kJOWJrxTbiebSerAEwXfXCKcAxJ@lists.linux.dev
X-Gm-Message-State: AFuF++naebLVDOK1OOA8rSyqy+iJJQ7LwUg86ABqEgtalEZMPoCmLRlb
	5U/eTb2Sv4VEMkPiIJxJgTP1m4bqvjVvV7InZ9tW/e+JLycZILYgHI9qDQ56SVOpwg==
X-Gm-Gg: AR+sD10BSAFElAwpsTa8oy7V+i/6I2mWUdGDdonZucwkpij2idRoYRwday1nLRgPaHp
	Iw74CesXIkY6h4Rgy5tRjJuLVf0NchcopUKdupT/9bCZskGZOiRiaR0vkbcMpRmaHk94loWNq+f
	k8CQYRVLrawKVV1eJDn81NgZtEEODK4i6t25Nc3vkh2D6rjKzf0oIPe1ZyQa8TLxu5hDAjZwDh/
	D35ZU9IRDe4UWooxy/IBBvw9aue7WQZIdrUZCM8hICXE1yZsouvCIqVxAcizFFj3z/G8mZuKnN6
	wYnVlJVjeIuQv5ZjOz2YsfyKLCIK1tLhueyiK4BHZaJie8Zwq5po2UjLQy78SL231Hwmf7h5613
	whvvnx4mX+7rU3vRyHbBvhyZYxOO5Yv/lgOP92KutPr4OnMduF/G1BXcp8eXA9vvO4oSlhxFrzy
	qgQQBKxYYdIUzy4HDcZaC1vDlSNaHGpGksCNtZGE1zRBameTMJjorruWW8mtSy2RuXUJ3UTONXM
	sJ0rBubzX7X1NsWurJ2HZxDUQ6vBpxh1NH42seex9wB6sU=
X-Received: by 2002:a05:600c:34c3:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499dc720bd2mr92288185e9.10.1787762487943;
        Wed, 26 Aug 2026 09:41:27 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5721a0sm21769715e9.4.2026.08.26.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:41:26 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
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
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 13/13] Documentation/gpu: document the Vino driver
Date: Wed, 26 Aug 2026 17:37:38 +0100
Message-ID: <20260826163913.7052-14-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163913.7052-1-mike@fireburn.co.uk>
References: <20260826163913.7052-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe how a dock is identified and placed by family rather than by
product ID, what the driver implements in-kernel in place of EVDI and
DisplayLinkManager, and the module parameters an unfamiliar dock or a
converter with broken DDC may need.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 Documentation/gpu/drivers.rst |   1 +
 Documentation/gpu/vino.rst    | 254 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   1 +
 3 files changed, 256 insertions(+)
 create mode 100644 Documentation/gpu/vino.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 20d2c454aa1d..4b524d6980c4 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -17,6 +17,7 @@ GPU Driver Documentation
    tve200
    v3d
    vc4
+   vino
    vkms
    bridge/dw-hdmi
    xen-front
diff --git a/Documentation/gpu/vino.rst b/Documentation/gpu/vino.rst
new file mode 100644
index 000000000000..98e82297a82a
--- /dev/null
+++ b/Documentation/gpu/vino.rst
@@ -0,0 +1,254 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==========================
+Vino DisplayLink DL3 driver
+==========================
+
+Vino is a Rust DRM/KMS driver for DisplayLink DL3 USB display devices. Three
+hardware families are supported: Ella (DL-3x00 silicon, e.g. the HP 3005pr),
+Ridge (DL-6xxx silicon, e.g. the Dell Universal Dock D6000) and Navarro
+(DL-7000 silicon, e.g. the DL-7400 quad-display docks). Each family has a
+profile carrying the endpoints, strip geometry, connector count, link limits
+and pacing of its hardware; the rest of the driver reads those values rather
+than branching on the model.
+
+Device identification
+=====================
+
+The driver binds to a DisplayLink *function*, not to a list of product IDs: any
+device with vendor ``17e9`` exposing an interface of class ``0xff``, subclass
+``0``, protocol ``0x03`` (a DL3 display function; ``0x00`` is the older ``udl``
+hardware), plus that device's USB DFU interface. This matches what the vendor's
+own udev rules key on, and means a dock nobody has tested is offered to the
+driver rather than ignored.
+
+Which family a device belongs to is then read from the device itself. Every
+DisplayLink dock carries a sixteen-byte vendor descriptor, type ``0x40``, in
+its ordinary configuration descriptor, holding the running firmware version and
+an eight-character platform name -- ``NavaDock``, ``RidgeDoc`` and so on. It is
+read with a standard ``GET_DESCRIPTOR``, needing no session and no crypto, so
+identification happens at probe.
+
+A device whose identity names a family the driver cannot drive is declined by
+name, so its owner gets a log line and something worth reporting instead of a
+driver guessing at an unknown wire format. A device whose identity cannot be
+*read* falls back to a small product-ID quirk table, so a transient descriptor
+failure does not cost a known dock its displays.
+
+The number of connectors comes from how many of the family's video endpoints
+the device actually exposes, bounded by the profile. A dock in a known family
+with fewer outputs is therefore driven with the outputs it has.
+
+The driver owns the USB device and implements the dock's initialization,
+HDCP 2.2 authentication, encrypted control protocol, downstream monitor
+management, mode programming, cursor updates, video compression, and USB
+submission in the kernel. It does not use EVDI or a userspace display daemon.
+
+Configuration
+=============
+
+The driver is selected by ``CONFIG_DRM_VINO``. It requires Rust, USB, DRM,
+MMU support, the Rust DRM shmem helper, and the kernel crypto primitives used
+by HDCP 2.2.
+
+``CONFIG_DRM_VINO=m`` builds ``vino.ko``.
+
+Verbose protocol and scanout diagnostics are disabled by default. Pass
+``debug=1`` when loading the module to enable them::
+
+    modprobe vino debug=1
+
+Errors, connection changes, and session state remain visible without this
+parameter.
+
+The remaining module parameters are for recovery and diagnosis:
+
+``edid_override``
+  Bitmask of connectors whose EDID the dock cannot read -- typically a monitor
+  behind a DP-to-HDMI converter that mangles DDC -- and which are described by
+  DRM's own EDID override instead.
+
+``force_flash``
+  Write the packaged dock firmware even when the dock already runs that version
+  or newer. See `Firmware updates`_.
+
+``rtc_utc_offset_minutes``
+  Local offset from UTC, in minutes east, used when synchronizing a Navarro
+  dock's real-time clock.
+
+``trace_crypto``
+  Discloses the ephemeral control and video keys of one session so that a
+  ``usbmon`` capture can be decrypted. For protocol work only.
+
+The optional ``CONFIG_DRM_VINO_KUNIT_TEST`` setting builds the driver's KUnit
+suite. It is intended for development kernels and is disabled by default.
+
+KMS model
+=========
+
+A dock exposes independent display connectors: two on the D6000, four on the
+DL-7400, where they are multiplexed over two video endpoints. Each has:
+
+* one primary plane using ``DRM_FORMAT_XRGB8888``, and ``DRM_FORMAT_XRGB2101010``
+  as well where the dock's link carries ten bits per channel;
+* one cursor plane using ``DRM_FORMAT_ARGB8888``;
+* one CRTC, encoder, and connector;
+* a downstream EDID channel; and
+* a bulk-OUT video endpoint, which two connectors may share.
+
+Atomic commits record the latest desired state and wake an ordered,
+device-owned control queue. Blocking USB transactions are never issued from
+the atomic callback. A transient control failure retains the desired
+generation and retries it; a newer atomic state always supersedes an older
+retry.
+
+The primary plane supports the four DRM rotations and both reflection axes in
+all valid combinations. Rotated and reflected frames are conservatively sent
+as full updates. Their independent codec strips are still encoded in parallel;
+identity scanout additionally supports damage updates and encoded-strip reuse.
+
+Mode validation
+===============
+
+A mode reaches the dock as a timing plus two control words describing its sync
+polarity and its CTA video identification code. Those words are taken verbatim
+from decrypted vendor captures for the timings a capture covers -- 1920x1080 at
+60 and 120 Hz, and 2560x1440 CVT-RB at 60 and 120 Hz -- and derived from the
+mode's own sync flags and VIC otherwise, so a monitor's native timing is driven
+rather than approximated.
+
+A mode is refused when it exceeds the ceilings its dock's profile names: the
+highest pixel clock a single connector may carry, an optional refresh-rate cap
+where the vendor driver is known to clamp, and the dock-wide pixel budget. The
+budget is shared, so the atomic check enforces the combined rate of the
+connectors a commit leaves enabled, while mode validation refuses only a single
+mode too large for the whole dock.
+
+Framebuffer ownership and damage
+================================
+
+The dock cannot scan out a GEM object directly. Vino therefore copies changed
+strips from the shmem framebuffer into driver-owned snapshots before the
+atomic commit completes. The compositor may reuse its source buffer after
+that snapshot without racing the encoder.
+
+Each head retains at most four validated, owned shmem mappings, matching a
+typical compositor swapchain. Repeated flips reuse those prepared mappings;
+round-robin eviction and DPMS teardown keep pinned memory bounded. This is the
+USB-display equivalent of preparing buffers before submission and requires no
+driver-specific userspace API.
+
+Encoding and USB submission run asynchronously on per-head workers. Damage is
+tracked against the last frame successfully submitted to the dock, not merely
+against the previous atomic commit. This preserves changes when commits are
+coalesced or a transfer fails.
+
+A strip whose content changes is charged one transmission for each buffer the
+dock rotates through, plus one, and remains selected until that debt is paid.
+One presentation reaches exactly one of those buffers, so a strip delivered to
+only some of them would leave the panel alternating between old and new
+content. A surface with no change and no debt outstanding sends nothing.
+
+The video path keeps a bounded, persistent USB request ring. The first
+presentation after a mode change carries the decoder arm sequence and the
+opening frame in one USB request, as required by the receiver.
+
+Control and authentication
+==========================
+
+One per-device session owns the HDCP and encrypted-control counters, keys,
+nonces, EP02 submissions, and EP84 replies. The control queue serializes
+transactions so a KMS update cannot interleave with a heartbeat or monitor
+operation.
+
+Initial transport, authentication, and encrypted-control setup is retried after
+transient failures. Once authentication has succeeded, a timeout while
+discovering one downstream monitor does not discard the live session. That
+head remains disconnected until the bounded runtime re-engagement path
+obtains a valid EDID.
+
+HDCP message identifiers and HDMI mode matching use the DRM display helpers.
+AES, AES-CMAC, SHA-256, HMAC-SHA256, and RSA operations use kernel crypto
+interfaces. Session material is stored per device and is not exposed through
+a driver-specific userspace API.
+
+Colour management
+=================
+
+The CRTC advertises ``CTM`` and a 256-entry ``GAMMA_LUT``, and both are applied
+in software during encoding. A dock has no colour hardware to program, so a
+compositor correcting through those properties -- as GNOME's Night Light and
+KDE's Night Colour do -- would otherwise have nowhere to put the correction on
+this output while native outputs are corrected normally.
+
+Colour depth and HDR
+====================
+
+On a dock whose silicon carries ten bits per channel, each connector also
+advertises ``max bpc``, ``Colorspace`` and ``HDR_OUTPUT_METADATA``. The wire
+format is one codec parameterised by sample depth rather than two: an HDR
+frame differs from an SDR one only in how deep its samples are, in the escape
+ceilings the entropy coder is allowed to reach, and in the transfer function
+and colorimetry stated in the mode set.
+
+The link's depth is taken from ``max bpc`` together with the PQ transfer
+function the compositor attached, not from the committed framebuffer's format:
+driving a ten-bit link from an eight-bit surface is ordinary, and a sample is
+widened into the deeper link after it is decoded. A ten-bit connector costs the
+dock a third more bandwidth per pixel, so the shared budget is priced at the
+deepest connector in use, and where a pair of modes does not fit at ten bits
+the depth gives way rather than the mode -- a compositor handed ``EINVAL``
+disables the output instead of asking for a shallower link.
+
+Firmware updates
+================
+
+A dock reports the firmware it is running in a vendor descriptor, and the
+vendor's ``*-release.spkg`` packages state the version they carry. If the
+kernel firmware loader can supply a package that is newer than what the dock
+is running, vino writes it over USB DFU before opening a control session.
+
+Two deliberate paths exist alongside that. ``force_flash=1`` writes the
+packaged image even when the dock already runs that version or a newer one,
+which is how a dock left in a bad state is recovered. The
+``/sys/class/firmware/vino-<dock>/`` upload interface takes an image from
+userspace and writes whatever version it is, which is the only way to re-flash
+the running version or to go back to an older one. Both refuse an image that is
+not a DisplayLink package or is for another dock family: the DFU interface
+supports no upload, so the running image cannot be read back and there is
+nothing to restore from.
+
+Monitor handling
+================
+
+EDID reads are tunneled through the dock's encrypted control protocol. An
+unsolicited downstream event schedules a fresh presence probe. Removal,
+reattachment, and a connector powered down by userspace are tracked separately
+so a deliberate power transition is not reported as a physical unplug.
+
+The initial driver does not register a virtual I2C adapter for DDC/CI monitor
+controls.
+
+Disconnect
+==========
+
+USB I/O is guarded by a revocable I/O window. Disconnect closes that window
+before workers and request queues are drained, preventing new transfers from
+starting during teardown. The owned DRM registration, timers, work queues,
+frame snapshots, and USB queues are then released by their Rust owners.
+
+Testing and validation
+======================
+
+With ``CONFIG_DRM_VINO_KUNIT_TEST=y``, the protocol and codec have KUnit
+coverage for cryptographic known-answer tests, captured control-message
+vectors, mode profiles, decoder-arm framing, codec boundaries, damage
+selection, USB record construction, and serial-versus-parallel output for all
+rotation and reflection combinations.
+
+A focused compile check is::
+
+    make LLVM=1 rust/kernel.o drivers/gpu/drm/vino/vino.o
+
+External-module ``modpost`` also needs a completed kernel build with a
+matching ``Module.symvers``.
diff --git a/MAINTAINERS b/MAINTAINERS
index 79ccf112fabd..1b0d496897ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8541,6 +8541,7 @@ DRM DRIVER FOR VINO DISPLAYLINK DL3 DEVICES
 M:	Mike Lothian <mike@fireburn.co.uk>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
+F:	Documentation/gpu/vino.rst
 F:	drivers/gpu/drm/vino/
 
 DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
