Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197952;
	b=zIHgMNXXhSx8FQXSss5jNedJTzBOFD2aRJ3GDrC2RFbo1NF/7ViphPwSpEecQ8Ve1Y1+
	 YESBb6Mv9G5vNmLQn3rIN0m02G/aX3gFewu32DPD7VCEWIx1MhqtCHrEb2OpNI4lZggjS
	 OIEoHCHUVZDh4w/u3MqMLC/dToDe5xz3iDs2/KqNKOGtzQfeA0Mj5BLQ2+rB9leVHfjBt
	 cVG/DvOheomHGjhOWVEqWynjXLV/LUIlLBIlgOHtKEzGRXEQQF5GSuPeleNICSaqXhUwy
	 rNRcIhMbWTGonQmDIUgRXoqnTnVqkYfIrGrabDF65fxqwlg3altxiEHejTb1zOTo8Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197952;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=S9fSw4hraQCwojNuCfNblHW1lFU62Or3gDMm9b4pn5I=;
	b=omp3N/k6Vn9VUM1iqNoLYQOnQConWLHMAm4fo8VrL9sDbj+jwho+EcCch6L+ZuqK3l/P
	 JhszBTyZ5q2LnEqnRAgW9ADAIEicAKlmNWxB/Fx1WMaVuyeYEhxmMaMZHrqL47DcFJ1uT
	 s8n1Jx2KjsZi/HX/ioJVjsv+idZtkUlO3ZYzj2pmXlgxuNqdtshD7pUfEjFTKyHz8BBXp
	 i5U6w6tJySxnlJEqPBmQlQFxnFt/j+lzerbb+UpnhIcDoxVAAy+RTFa07Z2GhVJshoQ7e
	 ZYBOrfIO4PzEzp7kerpVCETaqzGGBgACyahID12251+kbAk/rU6/U4BU+tZVej/z0Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UiwJgKbZ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E22260A262C
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 18:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E22260A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UiwJgKbZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 00A424E41690;
	Fri, 20 Nov 2026 18:05:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C774D601B9;
	Fri, 20 Nov 2026 18:05:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4466511BC09B6;
	Fri, 20 Nov 2026 19:05:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S9fSw4hraQCwojNuCfNblHW1lFU62Or3gDMm9b4pn5I=;
	b=UiwJgKbZr4DFlOMOGgHSS32UQCYYswk9JuUQlUuFulGnTYE7gpwW7ehEJMGLZbqE7eTdug
	NhDB6id+fy6E/lcVg/507YOAXaBRIWRBd4T1Sl1sXDhaN7NY5oBwYcNEtxn6x42B0hEL8E
	zaqwXpl46JnThTdON2WtqaY9oEnNPCNIf7YDGnA3JqdhogrZWFQlpKlesrfqKb/J3KO9HS
	WiZnq1psmHZjsGKVrGytA22xeBkavDfcKBe9ckNc5I/3zRnVlkoiZXGn6y3B2CUbv0B0/n
	Zh1OwlP8vDy/cwVdX/18cu1OA5ZSMcaxEuhSDcxDveamCUeAXwQi4YCgnWpvSw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:59:15 +0100
Subject: [PATCH v6 33/43] drm/vkms: Introduce configfs for connector type
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
Message-Id: <20261120-vkms-all-config-v6-33-78ace90f4fc1@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4409;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=4wtCkAps3IKbI5DS/B52tdqh9wSRFCua90o6wLxsPBI=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIsBaAt/qeK8cvb8ACSC95M2kC12/nEfjKMgR
 VyBj+Jm8eaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCLARsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOJxbA//YTzeCX0uKomoeYToWd6adCSn2sAwYRq
 PomJf7WIrV5y65k4Rc1Y7uDqHWosin0RftfURXd6zppt7l5fVTYVxzEY5OO4mZ1kTFmn9LSBwau
 /dGKtGkwyxAUW5iVr6zIZgm8r/TqiE/gLMHc2rVE6rhvYLJIY0hQmu4kYUGHQkEx1hlRJqe04/T
 w949G5zBHCEkB74eRNjtCgNcFZ/vQrcEFu/T84nx4D9AL1C29qxlidgILjrR4GpL/cMrEbJ6UW5
 hTfiLL6zW34/c8hG7YcXva6Vcy8881WyBn4CV7qCVBAECSxwvBTNUVlDPzAwjC5C6BXRnaXLWpH
 Z8v7FtFhPoj/EhSJ4Cn2/LbEvOtETQktfqADw3Mksl0tJQvDjh01YFz7BdZVUg+r9e4si/6+NWU
 eZsDhWji0BUkSDA7hdvW+oY0BvNbhdPcPtWC+MVpEzIAVmQ7j0kH0xsAzOO7QkpZhNBuajGHY3Y
 2ZlIb0YdfvoSaDMhtE5mfBs0TW98HbwZ15YA2l6uZY/6ciBmqntUFaEQDW+TaTOflDaxeeVSQM7
 6lNIikql20u/MbouI8vjp5iscRX8dSPvRlhmkRIrxjKkoZGVGUYbveeGbDyFftdEjqc3ntZX+un
 dlZtDVrrU7+OUTpCSqZWaRM/lJLqo2nvhgWJkwh5Wn1OeD3Y+gj4=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Add a new attribute to connector to change its type. This is mostly
cosmetic and don't have direct effect in VKMS behavior.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 11 ++++++
 Documentation/gpu/vkms.rst              |  3 +-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 65 +++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 2db0c950adc4..4974f3851090 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -37,6 +37,17 @@ Description:
 	the status triggers a connector hotplug if the device is
 	enabled.
 
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/type
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Type of the connector. Possible values are the DRM_MODE_CONNECTOR_*
+	numbers from drm_mode.h, restricted to one of Unknown, VGA, DVI-I,
+	DVI-D, DVI-A, Composite, SVIDEO, LVDS, Component, 9PinDIN,
+	DisplayPort, HDMI-A, HDMI-B, TV, eDP, Virtual, DSI, DPI, SPI and
+	USB. Writing fails with -EBUSY if the device is enabled and the
+	connector is enabled.
+
 What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index b58e96a3c273..f2622b3fd8af 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -137,10 +137,11 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
-Connectors have 1 configurable attribute:
+Connectors have 2 configurable attribute:
 
 - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
   as those exposed by the "status" property of a connector)
+- type: Type of connector. Same values as exposed by the "type" field in drm_connector.
 
 To finish the configuration, link the different pipeline items::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index e027bf565d4d..a350c7c0e866 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1089,10 +1089,75 @@ static ssize_t connector_status_store(struct config_item *item,
 	return (ssize_t)count;
 }
 
+static ssize_t connector_type_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	int type;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->config->lock) {
+		type = vkms_config_connector_get_type(connector->config);
+	}
+
+	return sprintf(page, "%u\n", type);
+}
+
+static ssize_t connector_type_store(struct config_item *item,
+				    const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	int val, ret;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	ret = kstrtouint(page, 10, &val);
+
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case DRM_MODE_CONNECTOR_Unknown:
+	case DRM_MODE_CONNECTOR_VGA:
+	case DRM_MODE_CONNECTOR_DVII:
+	case DRM_MODE_CONNECTOR_DVID:
+	case DRM_MODE_CONNECTOR_DVIA:
+	case DRM_MODE_CONNECTOR_Composite:
+	case DRM_MODE_CONNECTOR_SVIDEO:
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_Component:
+	case DRM_MODE_CONNECTOR_9PinDIN:
+	case DRM_MODE_CONNECTOR_DisplayPort:
+	case DRM_MODE_CONNECTOR_HDMIA:
+	case DRM_MODE_CONNECTOR_HDMIB:
+	case DRM_MODE_CONNECTOR_TV:
+	case DRM_MODE_CONNECTOR_eDP:
+	case DRM_MODE_CONNECTOR_VIRTUAL:
+	case DRM_MODE_CONNECTOR_DSI:
+	case DRM_MODE_CONNECTOR_DPI:
+	case DRM_MODE_CONNECTOR_SPI:
+	case DRM_MODE_CONNECTOR_USB:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	scoped_guard(mutex, &connector->dev->config->lock) {
+		if (connector->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_connector_set_type(connector->config, val);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(connector_, status);
+CONFIGFS_ATTR(connector_, type);
 
 static struct configfs_attribute *connector_item_attrs[] = {
 	&connector_attr_status,
+	&connector_attr_type,
 	NULL,
 };
 

-- 
2.56.0

