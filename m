Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197858;
	b=UMFcq7UemcjRwfKfqWOKGkvlkBClpl6+Q0uza4X5zgq0G9EtrV//8H0emdIQpFaFeJCH
	 pLBpx25iKtKlRPVmsHXFBHjR1O2Mv2kzempLEaRK9pTaPRedg5t6Bxt7AG570Wd6GMqzC
	 qBwHSX6JtwNez39iF/0lwLV9C8WSfL2lF7jzTrcCcIzMXqcxJ4MTiPD4d8wPGdRrnk0KL
	 +9md6kOUMnRl6UrVC+kErq2Ku4vAallBn/+jQVRo1XnxkEpZkpMASe5LuDZuO7ncMASdB
	 RBvvy72Foheh5SkTZhfKHO+McjihTYfzihZNYMNSjaubihT4DFKotDpw9dovlBISPCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197858;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=cg4SfeZItMnv8HhgngTb5Vsme4va1eBtUIIb1SuER0c=;
	b=18vu+Gi+4BITChcRZcLbzQ7Tc7bAv6t4M9l6ovchW/CGQGr46o4kC/4BH7leu1+Hc0Vm
	 5x+FI5/TgFyA2edQ3kBpMCQ6auxpDBu6Y6EZm2ZcsP9KR923NO3E3hBNU/He49uODRLxm
	 eBkiOSbd35H8F62pa0BHuYLJ1UqsvWCO7pon9iHS/jugLjxTs5PlQ5W/xODiBHl6yCzON
	 8fzscRbG4eErOiVlMkafhNFgr+H7qPrP+0fpBsiQB+gx7YxBISR3mTL5O/u6wqiu7iX2z
	 glnHzgRiZFkZl9hAxbkWvgnPLje/pFuMRgLvoLPNaiw/ybQyHzgklMaST/psPtUUy5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bny3Ld8P;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9C260A2619
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 18:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F9C260A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bny3Ld8P
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DE2051A1755;
	Fri, 20 Nov 2026 18:04:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0259601B9;
	Fri, 20 Nov 2026 18:04:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C13611BC08D7;
	Fri, 20 Nov 2026 19:04:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cg4SfeZItMnv8HhgngTb5Vsme4va1eBtUIIb1SuER0c=;
	b=bny3Ld8PCNi2bhC13Bit9PeNDNo3pHX+IvACs1Pv68A8f7+pl1h4tep+WXfXYR+AvZXir0
	+lLShyNoSlEvQ0tS9pko8PgDMy7cD5nGyOowFUwMXzx2kbckZH9f9dzymPIe0ut8LaFJMI
	M33l/WBQOa+y/nikQn1czYbXVVL0cgM8DwhZ0cOg4HpVzooM3AAsj85OtG1Mrw6WgcB16z
	HIMyIOIHckrMeH3toueciTgPjVGFINLts9QEirM6OXzYokHo7m0XluDGevAuHCLlxwl5F5
	ha+E2ZQo5iIOG/1oDLNBHhylGtcgdfmGq67U+sIdqp5lH+3flgvBOcVkv9p0Yw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:58:58 +0100
Subject: [PATCH v6 16/43] drm/vkms: Explicitly display plane type
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
Message-Id: <20261120-vkms-all-config-v6-16-78ace90f4fc1@bootlin.com>
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
 llvm@lists.linux.dev, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=OAT05TwafSaZUI5qNR1+4cNJLCVDeclk80tgkB9t9UE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIr/msYT0QdyVhfbV0U4NHdJjqrfOBvoj8t3u
 FPi5WcMWVeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCK/xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOJznxAAoYFxM6AbCctXt4iA+4F8VKUlZSnJ+gE
 C9TvSC8ntVCv9JeUUiC4ksrCIz2H6R0QKhRBNlBy7YuB4IXBZv7McMTSxdY5P4w5M2b081XLf/3
 nhjwcZqS03uacEP7jVLZ7IE5NjGxqVzu1twTVmgv//7PEbl8ZVSUKo+4sKSKrM7BRXPoYEqTh3/
 9MuDH3L4ejztoPU79lcaUuuVvhqT5Mf4o26BRA30UtaLxVZXUwhhBLZeQh5nR29lOGYrVNmo+R0
 mCv7W6huF9cO+NJL/v05g8WEkgdAA9gwJSw+fXwUfM8Sj5uZ81hWiploMG8zRCt+KnKn580f4Ac
 DZSG0PNiSyxfQWCEkFa79Y4lVxR0auF8xmTPy3zshL6GZj6FGMycWItKYUu6X1URYwLS1XaED5a
 D/69XFQ7GuUo3hdGffpEta+hkGnau+ZGeJhP1wP43dSWtgeHHYKpzWFX2s8QF4VvslhAIzmAwEa
 SFtAGgwaloi0s1mfQ2U/++m9ILW5Gvq8Te1I/gmleC6lfk2V+mxz8os1u9osvdgerbs+Vd/v8uk
 uPWLsRpEwswJAAuvwFruIs/n3ZiqhdDCjU+4EhPcGkNtcrP8zP4IwwBjuCKj4OK8U/ZM+1E0hAD
 YzaOi0qLuxYzYKocLrZsRZe3Mf+FYc32eYGs1BT34+Tggdh/PsTE=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Debug information are mainly read by human, so use full name instead
of values.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 03f2d0f0e327..44ded8a86a6e 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -391,8 +391,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
 		seq_puts(m, "plane:\n");
-		seq_printf(m, "\ttype=%d\n",
-			   vkms_config_plane_get_type(plane_cfg));
+		seq_printf(m, "\ttype=%s\n",
+			   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
 	}
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {

-- 
2.56.0

