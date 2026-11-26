Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692545;
	b=TwUTFz7Kv+FkjM/ag8OTk9hCnghYdd66ax2yUU0A0nnjE8Pi8T30X3exJv9UMk/z6FER
	 7jZ19joUsjHEfsztO3DNns9IS5W/Zj9RYaXvk+hZ2F4/aIE/BrdqDwDRRLIKp8P1+AXUa
	 1OKvE7mLQXcCb6a0BHsxWb41ffpybqH2J2N05eGnkcL/4yOoa3n+HYYO/ZnBmY4jaCQpS
	 l5IU66zcEZQz3VPe2UqRo6nEI/xjQf++YAFlhPBm3apTT/d8xiLXLUUQtZgvN1/L5l/1x
	 z+s0S9F8+d3qjKqC56c0tGFp8CM1r89g5HB4DgiXb7fkNaZy3q7mkTnQ8KZOwO0n1Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692545;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=0SJIs+rpjiUaAsGTjABstVmfPkduoG+bc7NOjJbid+o=;
	b=JY5ccde47uBByqmegcLmnTOHSRsLTeujg4MiZ6aQpES19vm30wdV6qwKL3kEAZGm2HPB
	 KfeQlVYc65ClocqFSTXnlDjlzcP8pmXCMpX5rwQaGIyeI9NDBdib0+kK9H7LMeo4cR2Ay
	 egFOQsZi8CapXLDuw898ghtm7jw8ZRU9/Xz/ZqznJ3Z670R8FP5QLiz/5l8NkYi/wRjVh
	 mc22BgRCWCV6zjX+8g8JzmpEzyiquZ2ZKbgzTch6L0QtQVBnMDPgaLnoLqV23y4fgx46r
	 GmcKmgts4SAkU7o0mR5BgV8KZguOT2qEsDuLMylbOxGz/Pur4ZlLb1Gv4D6giAsYM/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jq1Rfj6j;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F1B606A321
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50F1B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jq1Rfj6j
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6747EC2B9C7;
	Thu, 26 Nov 2026 11:29:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D2E1F60237;
	Thu, 26 Nov 2026 11:29:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA5B211E6B363;
	Thu, 26 Nov 2026 12:28:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692539; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=0SJIs+rpjiUaAsGTjABstVmfPkduoG+bc7NOjJbid+o=;
	b=jq1Rfj6jYMU9yxaVg9UV4H8Zen8EkiT4Kg4x9rGWtovkX/SR29OIvOAEPzQMxYwu2UWSOn
	+5Uyp5jk5Ejc5PKpTL7/tAcJB4BS3w0zotb1M30bClovFKOunqc2O/M1v0sx6C8K4TqokU
	KHD7AK/LeBwJan1aZrE1S9nFZc3z+k7YeO2HCMWaMWsTqYewWK50lwEAimQIAeeE1R1GSy
	/X0VqPnkfDE4nSEYQFOq19i72sLYzSegWD6JWn03eoE8JK4SqQLefK4x5GRDuV/CV1CXkE
	GRwc7RixwSzrzZgIlQS3iAVf8b6gTkLnHRRR7/JCGAfXQ29ZWip3zIerGuCrAg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v7 00/43] VKMS: Introduce multiple configFS attributes
Date: Thu, 26 Nov 2026 12:28:43 +0100
Message-Id: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOwXCGsC/23R0U7DIBgF4FdpuBaFv0DLrnwP4wWUn424tgqVz
 Cx9d1nnMg3ecUjOx0k4k4QxYCK75kwi5pDCPJXQPTRkOJhpjzS4kgkwkJzxjua3MVFzPNJhnnz
 YU+vYAIbxXihPSus9og+nTXx5veaIH58FXq6XxJqEpT2OYdk1Lo50DGl4uh3ohKeFXJqHkJY5f
 m3TMt+qPyv6akXmlFHTdYp1UjoN7tnO83IM02N5aNMy/BJA1wIUwSIwq63nQmEttHcBAGqhvQh
 GgBtab7X3tSBugmLiP0EUwVkrAbUxhakFeRcU1L+RZRF6KYxhvWAa1F9hXddvDtJoBfIBAAA=
X-Change-ID: 20251017-vkms-all-config-bd0c2a01846f
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Lucas De Marchi <demarchi@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com, 
 victoria@system76.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3

VKMS have a wide range of options. The aim of this series is to introduce
many configfs attribute so VKMS can be used to test a wide range of
configurations.

PATCH 1-3 fix display and locking of the configfs attributes
PATCH 4-9 expose human readable strings from drm core
PATCH 10 is a fix for the default rotation value
PATCH 11 is ABI documentation
PATCH 12 introduce reference counting for vkms_config
PATCH 13 add a KUnit test for the device lifecycle
PATCH 14 added some error checks in plane configuration
PATCH 15 cleanup in plane_release
PATCH 16-17 change the display in configfs to be more readable
PATCH 18,19 plane name
PATCH 20,21 plane rotation
PATCH 22,23 plane color encoding
PATCH 24,25 plane color range
PATCH 26,27 plane format
PATCH 28 properly use zpos
PATCH 29,30 plane zpos
PATCH 31 back pointer to connector
PATCH 32,33 connector type
PATCH 34 preparation in connector initialization
PATCH 35,36 connector supported colorspace
PATCH 37,38 connector EDID
PATCH 39-41 dynamic connectors
PATCH 42,43 PATH property

PS: Each pair of config/configfs patch are independant. I could
technically create ≈10 different series, but there will be a lot of
(trivial) conflicts between them. I will be happy to reordoer, split and
partially apply this series to help the review process.

PS2: I am currently cleaning the IGT test series to validate all that,
it will be submitted separately.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v7:
- add refcount on vkms_config/vkms_config_connector 
- fix issues reported by Oarora
- rebased on drm-misc-next

Changes in v6:
- disable cfi check for show_bitfield
- Rebased on drm-misc-next
- The ABI documentation is now distributed: each patch introducing an
  attribute adds its own documentation section
- vkms_config and vkms_config_connector are now reference counted,
  fixing use-after-free and races when destroying connectors
- Lock the config dump against concurrent configfs changes
- Add a KUnit test for the device lifecycle
- Link to v5: https://lore.kernel.org/r/20260627-vkms-all-config-v5-0-854aa0840926@bootlin.com

Changes in v5:
- Fixed missing property creation for PATH
- Use the folder name instead of a new attribute for plane
- Rebased on drm-misc-next
- Link to v4: https://patch.msgid.link/20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com

Changes in v4:
- Introduced a way to change the PATH property
- Reordered drm-only patches to the front of the series.
- Fixed a bug when dynamic connector are allocated/freed (drmm instead of
  kzalloc)
- Properly handle errors in vkms_connector_init
- Only parse formats one by one (no more complex algorithm, you will have
  to write multiple times for multiple formats)
- Use sysfs_emit instead of sprintf
- Fix rotate property default value
- Link to v3: https://lore.kernel.org/r/20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com

Changes in v3:
- Added Documentation/ABI (Thomas Petazzoni)
- PATCH 2: Clarify return value
- PATCH 6,7: Avoid passing null to printf
- PATCH 7: Restrict plane name to A-Za-z0-9
- PATCH 12: Fix missing s
- PATCH 13: Add macro to avoid repetition, fix missing s, make code
  consistent, remove wrong comment, properly check bit values
- PATCH 15: Fix missing s
- PATCH 16: Fix missing s, make code consistent, remove wrong comments,
  properly check value and fix default_color_range value
- PATCH 17: Create function to reduce code complexity, fix missing s
- PATCH 18: Fix parsing, rename data, reject strings > 4 chars
- PATCH 20: Remove duplicated lines, fix test comments simplify conditions,
  remove useless documentation,
- PATCH 21: {Min,Max}imal -> {Min,Max}imum, simplify commit log
- PATCH 25: Fix wrong comment
- PATCH 26: Rename type to colorspaces
- PATCH 27: Improve comment, avoid useless iterations
- PATCH 28: Fix typo in commit log
- PATCH 29: Fix typo in commit log
- PATCH 30: Remove useless include and move it to proper commit
- PATCH 32: Clarify documentation
- PATCH 33: Simplify code and use better variable names
- PATCH *: Fix EINVAL/EBUSY
- Link to v2: https://lore.kernel.org/r/20251029-vkms-all-config-v2-0-be20b9bf146e@bootlin.com

Changes in v2:
- PATCH 1: reorder includes (José)
- PATCH 2: use name property instead of folder name (José)
- PATCH 3: Fix default rotations (José)
- PATCH 3,5,7,12: Add tests and extract validation for planes (José)
- PATCH 3,5: Do not create color range/encoding properties if not set
- PATCH 5,6,7,8: Set plural form for vkms_config_plane fields (José)
- PATCH 4,6,8,13: Remove checking for default in supported (José)
- PATCH 9: Add break in vkms_config_plane_add_format (José)
- PATCH 12: fix zpos_enabled typo (José)
- PATCH 13: fix documentation (José)
- Add debug display (José)
- PATCH 20: use drmm_kzalloc instead of kzalloc (José)
- PATCH 22: simplify the code (José)
- Link to v1: https://lore.kernel.org/r/20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Louis Chauvet <louis.chauvet@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Miguel Ojeda <ojeda@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: thomas.petazzoni@bootlin.com
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: llvm@lists.linux.dev

---
Louis Chauvet (43):
      drm/vkms: Lock the config dump against concurrent configfs changes
      drm/drm_mode_config: Add helper to get plane type name
      drm/blend: Get a rotation name from its bitfield
      drm/tests: Add test cases for DRM rotation name
      drm/drm_color_mgmt: Expose drm_get_color_encoding_name
      drm/drm_color_mgmt: Expose drm_get_color_range_name
      drm/connector: Export drm_get_colorspace_name
      drm/drm_atomic_state_helper: Properly load default value for rotation
      Documentation: ABI: vkms: Add current VKMS ABI documentation
      drm/vkms: Reset config->dev when the device creation fails
      drm/vkms: Reference-count vkms_config and vkms_config_connector
      drm/vkms: Add KUnit test for device lifecycle
      drm/vkms: Add error handling in plane config creation
      drm/vkms: Simplify plane_release code
      drm/vkms: Explicitly display plane type
      drm/vkms: Use enabled/disabled instead of 1/0 for debug
      drm/vkms: Introduce config for plane name
      drm/vkms: Use plane folder name as plane name
      drm/vkms: Introduce config for plane rotation
      drm/vkms: Introduce configfs for plane rotation
      drm/vkms: Introduce config for plane color encoding
      drm/vkms: Introduce configfs for plane color encoding
      drm/vkms: Introduce config for plane color range
      drm/vkms: Introduce configfs for plane color range
      drm/vkms: Introduce config for plane format
      drm/vkms: Introduce configfs for plane format
      drm/vkms: Properly render plane using their zpos
      drm/vkms: Introduce config for plane zpos property
      drm/vkms: Introduce configfs for plane zpos property
      drm/vkms: Introduce back pointer to connector
      drm/vkms: Introduce connector type
      drm/vkms: Introduce configfs for connector type
      drm/vkms: Rename vkms_connector_init to vkms_connector_init_static
      drm/vkms: Introduce config for connector supported colorspace
      drm/vkms: Introduce configfs for connector supported colorspace
      drm/vkms: Introduce config for connector EDID
      drm/vkms: Introduce configfs for connector EDID
      drm/vkms: Store the enabled/disabled status for connector
      drm/connector: Add a way to detach encoders
      drm/vkms: Allow to hot-add connectors
      drm/vkms: Introduce configfs for dynamic connector creation
      drm/vkms: Add connector parent configuration in vkms_config
      drm/vkms: Add ConfigFS interface for connector parent and port_id

 .clang-format                                    |    2 +
 Documentation/ABI/testing/configfs-vkms          |  326 +++++++
 Documentation/gpu/vkms.rst                       |   44 +-
 drivers/gpu/drm/drm_atomic_state_helper.c        |    6 +
 drivers/gpu/drm/drm_blend.c                      |   19 +-
 drivers/gpu/drm/drm_color_mgmt.c                 |    4 +-
 drivers/gpu/drm/drm_connector.c                  |   18 +
 drivers/gpu/drm/drm_crtc_internal.h              |    6 -
 drivers/gpu/drm/drm_mode_config.c                |   16 +
 drivers/gpu/drm/tests/Makefile                   |    1 +
 drivers/gpu/drm/tests/drm_rotation_test.c        |   76 ++
 drivers/gpu/drm/vkms/tests/.kunitconfig          |   10 +
 drivers/gpu/drm/vkms/tests/Makefile              |    3 +-
 drivers/gpu/drm/vkms/tests/vkms_config_test.c    |  520 ++++++++++-
 drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c |  280 ++++++
 drivers/gpu/drm/vkms/vkms_composer.c             |   15 +-
 drivers/gpu/drm/vkms/vkms_config.c               |  724 ++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.h               |  724 ++++++++++++++-
 drivers/gpu/drm/vkms/vkms_configfs.c             | 1081 +++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_connector.c            |  347 ++++++-
 drivers/gpu/drm/vkms/vkms_connector.h            |   60 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                 |   16 +-
 drivers/gpu/drm/vkms/vkms_drv.c                  |   12 +-
 drivers/gpu/drm/vkms/vkms_output.c               |   21 +-
 drivers/gpu/drm/vkms/vkms_plane.c                |   85 +-
 include/drm/drm_blend.h                          |   34 +
 include/drm/drm_color_mgmt.h                     |    3 +
 include/drm/drm_connector.h                      |    2 +
 include/drm/drm_mode_config.h                    |    3 +
 29 files changed, 4263 insertions(+), 195 deletions(-)
---
base-commit: 3c7c3c12dfc7704ca614abbfa266ca00a2b5a994
base-tree: https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
change-id: 20251017-vkms-all-config-bd0c2a01846f

Best regards,
--  
Louis Chauvet <louis.chauvet@bootlin.com>

