Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692611;
	b=OeNwHWy11iKH9YN1JpAcxoLwDFtJOZpYDSgEqKoLL8Jp6sAYjDrDTjS4YlT9jDzH/RDO
	 R9m1pDiqsI79/xTTQjNMQEq1H5GQgBGyfgupQP5NTlWENXnph/xUfKhf3TRFRgK9iZcP/
	 wYEexumiIq5vzk+GNkTHKIO4gqQJwxdP/f1jWreR2a4exfjDCSl/TtfOtiacsd1nDVjR4
	 srOSmUapL0Vd6TTtBrzgpItwV08A+4jS7EzrE2Feaim44LPaY6W5BFinPyLHreqjqxc0z
	 PLpP6LZwIOzJoHq4Z0ZYj7A8IySp2Ws9ZiANcC7es2k0APvb3oHpA7gPXRS9KMJGsGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692611;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=E2/+MuqVnOusQ1sgK4tYgSvacpJ1DcttubCeZOsut9Y=;
	b=B/FrlgCNWw/KDA409H75DMMXcvmakHJEDCeZsucMpPoPYG5eGuBzikEjaJ6stWmTV0ga
	 2mEeP3HW/wMUwFkVX92JBw+fAnS7wEVCv91ttiHFhnIw1E724iJbU5t2/LnD1MONUOPjA
	 T/q3zlNl3WtPVw+NMCcHQkUkmHfxZ5zj5AyZTQmTHFfpIdthnMEr+vpBNNgg9X21AgRUZ
	 tftLabglUOe21PZqaHLPTXnqBhfcOhj5OK6nDFH0ha/Zyx9loUL7tWZ3yHka9Xnt4CWCW
	 4pMl+M9e6EkPWoG4BXFmRuaEkiENary2VmEfP8L4SCdigVa/SHUOhYupy8L+QBKtH8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=poXxYTGD;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4269D606A32E
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4269D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=poXxYTGD
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E63A94E41693;
	Thu, 26 Nov 2026 11:30:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B131960237;
	Thu, 26 Nov 2026 11:30:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A652411E6B367;
	Thu, 26 Nov 2026 12:30:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E2/+MuqVnOusQ1sgK4tYgSvacpJ1DcttubCeZOsut9Y=;
	b=poXxYTGDakjeqdK2ho8kvkTnN9q8SxOv3wYxtoLJGSbvjp+FFWMsYom/7kMNA08hOJo7j+
	s43VIUvH71seNGdwhUyEvoG8FAK7hN0dnZ0dlhFak3pcpLnQ+zdzQHgAuu4YsF59LhqiFY
	kcmmgpf+TJTkY7raC/w6n0CFli5PwIUsxWBMLcFhQGKiFzS1TZCVk+B02Jup0uAgoR6D9G
	C+p9b4WOlZYCmVFxtB6w25phW9xdtAJomDJn7WKspKgbCl0+JF6YbdkDZguIhDGE7xH1yI
	iy2gwaf70VXlEOzPfHwMC4355CQMrSdiXyw2GuWOdxvVuTqtazHdK+T8jkfDoA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:52 +0100
Subject: [PATCH v7 09/43] Documentation: ABI: vkms: Add current VKMS ABI
 documentation
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-vkms-all-config-v7-9-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
In-Reply-To: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
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
 linux-doc@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3

VKMS recently introduced a ConfigFS API to configure new devices.
Add proper ABI documentation.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 123 ++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
new file mode 100644
index 000000000000..26e7f81b5b7d
--- /dev/null
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -0,0 +1,123 @@
+What:		/sys/kernel/config/vkms/
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains sub-groups corresponding to created
+	VKMS devices. Creating a device named "vkms" fails with
+	-EINVAL: that name is reserved for the default device
+	created by the create_default_dev module parameter.
+
+What:		/sys/kernel/config/vkms/<device>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the VKMS
+	device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/connectors
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the
+	connectors of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains attributes corresponding to the
+	connector <connector> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/status
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Connection status of the connector. Possible values:
+	1 - connected, 2 - disconnected, 3 - unknown. Changing
+	the status triggers a connector hotplug if the device is
+	enabled.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains symbolic links to possible encoders
+	for this connector.
+
+What:		/sys/kernel/config/vkms/<device>/crtcs
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the
+	CRTCs of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/crtcs/<crtc>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains attributes corresponding to the
+	CRTC <crtc> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/crtcs/<crtc>/writeback
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Enable or disable writeback connector support for this
+	CRTC. Value: 1 - enabled, 0 - disabled.
+
+What:		/sys/kernel/config/vkms/<device>/encoders
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the
+	encoders of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/encoders/<encoder>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains attributes corresponding to the
+	encoder <encoder> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/encoders/<encoder>/possible_crtcs
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains symbolic links to possible CRTCs
+	for this encoder.
+
+What:		/sys/kernel/config/vkms/<device>/planes
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the
+	planes of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains attributes corresponding to the
+	plane <plane> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/type
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Plane type. Possible values: 0 - overlay, 1 - primary,
+	2 - cursor.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains symbolic links to possible CRTCs
+	for this plane.
+
+What:		/sys/kernel/config/vkms/<device>/enabled
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Enable or disable the VKMS device. Value: 1 - enabled,
+	0 - disabled. Enabling validates the device configuration
+	and fails with -EINVAL if it is invalid.

-- 
2.56.0

