Received: from sonic.asd.mail.yahoo.com (sonic-usea1-0019.asd.mail.yahoo.com [34.2.64.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AE8446055
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 06:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.64.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527655; cv=none; b=n7enrRlhPRJoMGCXLp6ztXKypRNzKuhHulZmFMOO/zP0v1vkSdECoRBft1TqXdEA5BecEfA1Jrwd1sIas1PTmvcHEkwanxFkp+rqdkmnMjtp23eGBY9anIMCsAoaEmuUPdUi3VFzMqhGl48BfihiUA20njG1K1FpE7UvNZV5XH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527655; c=relaxed/simple;
	bh=oSk7Vdi7Gq/dNVx3VSMUN/xhAqAHju+O1Vvv9xUer00=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=Wgk+zJrnN5WOm5BvoT09Tcd+ABm9aG5N6nlDF8IC2EqpB9asFxnS0tECxKIqLhVI0Iu6qih0X7o1MGZkh+fnSaN3YtnL1eoGdxl2CRHtOcsKIU9FmLTEteZLvz5mKzTdSXRbDMGmwplHNYA7rrlm5vBjF12ieLmP9TsihVdja14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=UVNigtKA; arc=none smtp.client-ip=34.2.64.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="UVNigtKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791527653; bh=zoqJwTIshs9G4DvjFBPzzu4t8DddL4XLXAp2ZmUNtgE=; h=From:To:Cc:Subject:In-Reply-To:References:Date:From:Subject:Reply-To; b=UVNigtKAm8QxY1B6HNyhuKYkmtIWEqCeJUgijtTJlMv0Xez8NnoBl2wNJ8b6Bz607PmMi2vDemRIDb66UxJ4kLXHRT7DArJiiNf7klTt3FYjUpPQReFDOKTLHdrQdbtHcO87LELzuWuXrdLPNfimus/xV/d0oTetS7MNaqECCPUD1PJFxkcg3YsNC6NL5aO9gXF9pr8pBInJMCHqUy6KWyqxM9QpvYg1bCG7qevaA6CuRAeJYFsZSvC2fWimD6bPmRQzDWBNmjsqjqQr5IZesZDqfqaanPMvCgPxl4pZrwS73MAZ1ci1+sPOi1lzyuO7JNK5TZAl0fg0DYku2ZBDNA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791527653; bh=eTCVOCM/1pAN9RZDe/NdxxAtFQvhNJb8IIwb0RFzmSR=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=U/wZMRajc8suEUJt7juBriiWeQyW2kxLkYQB29EeTyWlNmea0Y0cHPpZVnXMlTqjnCJoAVS0iMYaSJf2aQJ3HWmp06KTdt8t81WJvod+UwoRZDapRYwluO/nsHm2FSIlrcADyjP6uL6r2He+TBGID/iwyTyrY8HR+IlA5KB6JjsEHVmKIiDzphGE99ew94chDLUl4t5GgMrD6U5nKpqEliRRLlV/eQGsdFLaTC1WlgWRozG3YstB/MH623l6J9Qd+FDSxn0/ysjF9n2aIZuYa+J457TUk+LL1MwQaXdhOI8SyCSd/HIYPQqYuPv2qZMBoZQLPNsKNleK6EEjerUZ0g==
X-YMail-OSG: zvpY.ZEVM1nYy3ivwGJc7PA7t4f3TVbqq0wJyW.tQTD8qMpfdVHFzSBKJuE6xcD
 b.91SA3b5NWXShxwg7rM6Na3tt.goJ.PGbWYWgRgpXWHlEr_z4ja09jgLCfLZ4t_L3WrPZaIY4EG
 a4AMS.4ZFp8uw2yoQhnZ_WSe8.8vffy7qavyDIJM0Pj6MR.ww9ZJnR7UtXA_.wrZw5V0u7ZOxVlY
 2G7PinlkspJTFUXb6rU4xYx5GOmEkUUctBtlJlWMYqcIolTvoLJDwQRsG0ArJYqZ5z6L2Ggw.Aw6
 l8v_vg87Vz2504ehNHqfwP_BMHxbjLHouEJbT3e5hteXMqT1FyxMpbDX3wyjbpU0Rhb7syqIFP_O
 fRSqB35qCUh4Hf8LoB1ussaDEQm0bTqdNsOJC3kvq_dBz6oib71.Vqao9p43cRSzifkIZdYTkXOX
 EMsIJwf.XHs3ldjArk_H3ygg6gof3qCfyakBBz1R4PIwRZIF7EkSkdH8bzCv033Aevq_1yfI1ON4
 I74GsGATI2lu615dK_TfeoXepe5SsWZe7ERdGStt54mePPpqP9vHjyZLi1TmgBD2sIi_vxI1.MS8
 KlblD7PpzX7GadeluKMFjy_C.IpAT9Y616LpKasdAbtQWvp4GdX8uHyDAdbP1T_LWLOMz3d3jfBY
 wcENBh1w4ywOrFkDG6UKfVfSr0dsv3EzjTuzxsNqDSosb5jm_HRfcD.vZmPY7ifvXGRFoDd9xpNq
 9gmqqtK6H5.XtWnBGtmDM4dXdA1A3BMl8dHk78Kr2TB0Q3up_VUjPkb67iRwCdWpJrwbINUh6Wfk
 UrjcakGNViHLnPf92W7G8u3L0qjbtZ6zitBhh8wKxNACCwDEioHAa25cIDfTmORhTT.puQf9b39B
 piuTJd3YsdlkmmKTcdRNa0faCYJzMzCpIBXo7Cy6G10xrLqx_uopQLXlWpVX3ylMdc9edFmI95H2
 glV6oou1yz7Qn92Yd_2oZMYQ9vdJYm3vs9VsKJJ0iKypM60eJWp1FtWyE0vkyZzFdN_OXc9jLk36
 xI9_jO_CAEJzIEPC1Q.vaKxJUmSgS5Ob9F6B7wPnuDvLCE3rILgfdrh3J2Cx9bg3K7GVCFXO9T2r
 Rv4PyM0h06tHShEIXxvb8jbeV1TGUzGwJFUmg_r69vR4070GgmGOIZrHZOWuwLUCtbxcirw7oGzS
 dpgIzVZ9lf7iehsmlQ2GWYiRNc0EoPyuFO2EkSfvNzRiQH_XMQXEsRtNW5a1MBAJjZzY7GQGOl.Y
 ygPVnFHJ3Pa.2y6R8BWx_U3aRX.HiE3QRD8Sr0CiHxmF.oJWwa0WnhrnRlBxsAC330gi8TwSmtrj
 NU2gg9YmaaVv7byDIDSk0T5_M1tVxQZj_vWAz7P13cLOAE5njw9eLIB15YVRiTKkpmprYPziHUib
 Z7B4Of6KS9M5Vtz_fGqtu2RGYKxEwZyzK5vZBHI_P3Ir8H3.nse1PAUe.daNzK2D5rOtSY7AdUTH
 eTfPR7rByawmtpKcgYGVOt9xGPliXP_oPoXFcVX3lzUBkLquyoBh94lKj2VYrOrO8OTf2K4B1UPT
 wF_Z013fso5uGHl9jOBlZFY8GuAzOpv5ww4vJojHwvOVdL1ghkkOJMonx0VqbaY6w2dZ4Y.2R7wA
 0c8MA8eLUitz7TBihTFzfraYGCXauQBb5V6DLp8aLFRsHznixCj8cP4MZOutfgxHSe68oY3LcEc4
 SA6uu1JAprYpUEF9CTB_ZQxEzx.9tK.lFA3h0ykAyamTXu3f1pBnCcVaydSHbIaFZ85XZUXR5pac
 mZjSdtsZJlzBj3G4pJbcBmoNznM5dqYAs1_eaVcqhiN8JgWqxQebEijxa5Go5WLsFyDr_tSLMkbu
 .yVJJChXHBTzZr1Oy8luH.Asn3XmqB6df.SCM2w8cOlEF8a48iUZ_vxABS6kA_jeVSTcIJKFDsgC
 0uA1xuPP9cQkR_FSEMBJGVMQ_Zuggc3LxXbXH0M2yXrJkFeBACBb.4gpsnZCddTS3GRAf1cKSlob
 y9g--
X-Sonic-MF: <Capitain_Jack@yahoo.com>
X-Sonic-ID: 54bcac01-f489-4771-a68f-d2597017b96d
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea1-prod-sonicconsumer-svc-102 with HTTP; Fri, 9 Oct 2026 06:34:13 +0000
Received: from dip101.lsn.bf1.yahoo.com ([67.195.177.110])
          by hello (SMTP) with SMTP ID 3afe77cf69c240796f55b68abbd20cef;
          Fri, 09 Oct 2026 06:34:11 +0000 (UTC)
From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, victoria@system76.com,
 sebastian.wick@redhat.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 32/38] drm/vkms: Introduce config for connector EDID
In-Reply-To: <20260627-vkms-all-config-v5-32-854aa0840926@bootlin.com>
References: <20260627-vkms-all-config-v5-0-854aa0840926@bootlin.com>
 <20260627-vkms-all-config-v5-32-854aa0840926@bootlin.com>
Date: Fri, 09 Oct 2026 03:34:03 -0300
Message-ID: <179152764385.1436711.6215580184547295403@yahoo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: WebService/1.1.26668 mail.core.serving.mcws.prd.acl:role.token.mcws.jsmtp.yahoo

Hi Louis,

I use the EDID attributes of this series to give a VKMS connector the
EDID of a 3D display, for tests of HDMI 3D modes without one (RFC to
follow). Running it with kmemleak showed one leak in this patch.

On Sat, 27 Jun 2026 05:30:49 +0200, Louis Chauvet wrote:
> +static inline void
> +vkms_config_connector_set_edid(struct vkms_config_connector *connector_cfg,
> +			       const u8 *edid, unsigned int len)
> +{
> +	if (len) {
> +		void *edid_tmp = krealloc(connector_cfg->edid, len, GFP_KERNEL);

Nothing frees this copy when the connector configuration goes away:
vkms_config_destroy_connector() frees the configuration, not
connector_cfg->edid. Sashiko's review of this patch pointed at it too.

Measured in QEMU on your base commit with v5 applied and kmemleak on:
eight configfs connectors, each given a 256-byte EDID and removed
again, left eight unreferenced 256-byte objects allocated through
connector_edid_store(). With the change below, the same run leaves
none.

Feel free to squash it into this patch.

-- >8 --
From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
Subject: [PATCH] drm/vkms: Free the connector EDID with its configuration

vkms_config_connector_set_edid() keeps a copy of the EDID in the
connector configuration, but vkms_config_destroy_connector() never
frees it, so the copy leaks each time a connector that has an EDID is
removed from configfs or its device is destroyed. Free it with the rest
of the connector configuration.

Assisted-by: LLM
Signed-off-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index b9d5a2e44f..04a3019317 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -1008,6 +1008,7 @@ void vkms_config_destroy_connector(struct vkms_config *config,
 
 	xa_destroy(&connector_cfg->possible_encoders);
 	list_del(&connector_cfg->link);
+	kfree(connector_cfg->edid);
 	kfree(connector_cfg);
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_connector);
