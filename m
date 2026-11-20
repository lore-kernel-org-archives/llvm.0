Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197829;
	b=osMDAPPMJ+Fn01y4GlJyf+Vce1squgo4deHypJ+gRPVeela9Vbf30UV4ZvCPaSKPQMj1
	 Jgz3kKFomW2XNbCKHnKrMM4SORb+4AJq/ODR1Ac+3vr0biLLW/ek5g4LNXj83+3U3g6S6
	 zxaZX3ZowZGOgjF1FKqQtXxX2VhCBgBCWNUbUHtiW7ZSVVEdp0kNVwjnVIe0eBMS9WCeu
	 dgBvK9IdJK7Fx7VzQn0C/Nv0X9YbwnRTrvNEofBo0TtWW7d+ZP/clfWyHUIRca25ZoMsi
	 u2ZgfyzOpSmM/bkeJSkG5n9Jxvw6tSKVYhySVpLM5KMNSRi98SldNbn/oSMLMN2JGhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197829;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=E2/+MuqVnOusQ1sgK4tYgSvacpJ1DcttubCeZOsut9Y=;
	b=L5/s1i76XIaIYTuyt9PNoF8m4wT28yTml0H7VdVhp2T1f57P4DO4Cm8PqsPW5xijZcYs
	 fcBXo9f1w9aRsnEITaL8nfJCcF9PhFe9fJLzaoDEsIx83mbxUE6lfhGLiDEUFK8dRqftb
	 X79g7B+4iCaEe8dSWVdevX99NU/OS2hzFQqg13c/K56KolhmvO4GtLwOfXcf656YPbOZi
	 lMcMcrlRboVBEkJmnLuwVXU0+4q+TJAzMqfi9/0Nkg2C+9MgRp9FjOFm7vVqIq4RPmnm7
	 P+lwGUCLYkiSpOMh8CZYRLRUL0NhMy8wP9T3uyE9JfdH4/GjUMKkF6HcxpsdHVSR/tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GLE+zU6R;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDB560A262F
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 18:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADDB560A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GLE+zU6R
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 780171A1755;
	Fri, 20 Nov 2026 18:03:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A997601B9;
	Fri, 20 Nov 2026 18:03:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CBD511BC09B6;
	Fri, 20 Nov 2026 19:03:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E2/+MuqVnOusQ1sgK4tYgSvacpJ1DcttubCeZOsut9Y=;
	b=GLE+zU6RQoEaHp1cHLSYJDc8eckpvZ3SAxhLxbJ48/GwQtrK6czwRT0uX/bQHRFLAN7CVL
	B4F1xXSLnlaT4EV7OwSJeR/sO1Eh3UgFfKcNxOIMCOm3SkC0nwurMKtrK78kjQzDhgcz9r
	1ERMo/AbdYjBILCl698Z/SHmpqiOvQTIZSeFdvNEq09wio0ZhlBMJL9WgPD9+MUVTyqL17
	PzSpQGq04jSalCg2J6FCdaG0Ix1h1E/lddJPLajaeAcu3UTNOrsA2b/1HYVYUQ6JrdwMuv
	AmdMDgo86C+w8WHyXcmfGcQSUAg++EALAeT/AtlAB/XvhpNWgyH67xHm+aHLCg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:58:53 +0100
Subject: [PATCH v6 11/43] Documentation: ABI: vkms: Add current VKMS ABI
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
Message-Id: <20261120-vkms-all-config-v6-11-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
In-Reply-To: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
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
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4734;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=JDbGPVzHEgpOa312QEMrSGrq/NH8NxJCBYLvlhsXTng=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIr+t/sS3kI6PRqo1ye4Bc6RV6qtcg4oWEhox
 dtFL/DFTCKJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCK/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOJa+xAAnMv3QHdhDjMHEA6W7OKD8R20VU6wmiM
 e8dyYXhh0snjOjn9Mt3cm0Ivy1vfG9uDQRkysm035bCQJ34EVylox1TEH8tE7rjJNJFxAY2cOLA
 DSdifSJ1MQ75dBglJkVHp4hJIxf/MIrPme9UMmfA4qhIuLLsFOPQNWfmauLnVA6X++jdUrJ+GJc
 pU194L2e6RhG4pgrBGDl95AYeKmzQk554yediSF1CWO8ZVOjBhoclzIGj/MDCVu9AWSKm1qt7AB
 ViPVXsABTAVj4ZOPj5no7NyiKZX6HCMCVTT+MX4LNFG3LgyDrQW8ZxS01KTFZ5Aakjtk+xEbIZm
 JzWp0N+kZzWskfnl0YUvartrglSVv8NT7eY+BZg+Yb9Pzw7SBCAGIuUHygQfrnpZS2oGUtaxJ9B
 0603/sEY6jaoKe0YiAzW45B38zaUwtFWW7Drofw3srusLkbtCVfxmVy1Ip0//z5r8DXoau72Y1f
 ARilUYuuTiU5R8Eu9az7LFtda3OApd40IfSA3DbYZG/11lN3u/+zsIIi/AS0Av4A1YQ6cRJIN38
 CpDFHEENp33oYTCqAP7c+nKhshF74HNE1rZ25cPTqSkWuHeX/xWwh4gL0NeQA1aviiQI1y6glMS
 viXj1CVYgtIyPORdjeH0EL0BioDwDhLoTlXZ9dhPtKjeKC3bj9LM=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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

