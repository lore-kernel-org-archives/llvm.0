Received: from sonic.asd.mail.yahoo.com (sonic-usea1-0019.asd.mail.yahoo.com [34.2.64.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADB6448394
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.64.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527672; cv=none; b=msRc3ygvDm0ph4fQ2Luh6V6r5EYY35rQUzIcqgbe54J/CpGJfmcMWadbAgBRIxF+A9nx89ZJN7+qS7ZZvoNjlIPkHvF9ovPc1JsyXQM4Q8aq4co7vlS5f0OgFvV1Y15rCKTx4wLry6SalOCkLdVGYs5xwVvPoktSlK+GW/0QHnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527672; c=relaxed/simple;
	bh=RBiqQ+1JOIjRLJ2qPLzzWrhZ+V5A3kv6qj66FnkpEeM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=VSjK5osLcLsGzjl159D5iB3VmI2gYvDKJXf4ewoKsphpwf7nYJNpit4yI3qG2MGtSYuKdsMv3wpsuVrb7KmXzID67qobjCUlY9PEsdX9f+Z7aV921YINyRPKC7fyS+RtWxV5H2ny5a5gSibhbRaGad74sBoqqqzcUT2enCeDNF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=UBgFPZSF; arc=none smtp.client-ip=34.2.64.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="UBgFPZSF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791527670; bh=53F8eeZQg3g1Nqk6SIiKM9bUNM7Hn0PGxCtMlom1If0=; h=From:To:Cc:Subject:In-Reply-To:References:Date:From:Subject:Reply-To; b=UBgFPZSFju7HOd1z+ho2EmlQLYaFvndsTPVjD5QF94xMVRlOW56x4xmYmJo3nwAA7qpkvAQRbtBG/yLwF1CS5zds5cUWrH9qZg99AS+R8KrOyq3JswspF0o3j2kfbQnTjmRzkgfQKpm+nTOaHq5Ve6dC1j5fCW9ZM/SiyN4WasONFV5X27m+/wXjUI6Sda253R9CM1NW2fM8xW2hivw3wi57ICOlEYKj3/LkQj5tsQ6Lho/R00JzAYlvR+K1ejsEgJrPDgFRzEQA6C6lw9CLTJHNR7fy35rVXSeDsnPuE2BMKpuV5kpyvM0VK0CJtqS+N5w9CryalCRmVZb6Ru0bpA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791527670; bh=G8FnG61slJSrLsnZtJnhkqzfzmrElK3JWnf83kE32pM=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=gK5N3k86gqvxfgCf/X6w7xwtjS1bVsElrxmFWH6nH7b1ZCBQJKgRSdbHC8sb0ilKm++OVHFFKLg5tAlSb4biK+gBclKJlkiioeOIqKAK4C2BsKFdNJyqUI+g2asFKQ4uNVHf0mGB6X13hKFGU651AiowFMXaH94h7cNqNAS2nZQ2NTRyB87jBxj/Nw0Hi/ym4AWX3pRrSiprFQSJ8atnMxbvnvhnFcVX4RnX4EvzeSPsUxgZEvyvKs/HViW2BIfbNdYkOFC8h194BTFjJQy8ECFMO2JskleuohnVKDJyISPEfaVkaVZOwuAUpn4Aj+WpCEFlHKWanMEZF0XvnEG0xQ==
X-YMail-OSG: seHmNZIVM1nkfqqNvwtHcWmHQHqnphrWihU8eMmzVSuyS_RuQ2j.WDpUsRSavaU
 jZYfRatP1_4DA4f5KUios8OJz1tdtRvSLo3dUe5QdQCPyocBgjmsPQwtirVOqLHJ_RUQvuHXV6sM
 gd5ExRd1fsASC3LMFmZPq73krtwxAGawILY6ZXKqFGmshYJyj65KZF1nptAf.8USkkuCWuZiRY1p
 o082CsTR4w3.wIygu1h7hYKpG_GRK18sdPCHojfEVqVKG1aq6w.qixlx.lxhFpFGAU5eaGQ4YXhJ
 wBuuUNRxY.vT5Bc_AABN6_njxEFydpQroSGfUQZkLKVMg4bQqDOcEuj8SYv5j7NRAFw2I4mQEsxW
 2ufI6ScADggGo1J0sY1wu75wnZU1t.ZT380QqtzwzsgOMp75xTHPVzCyPQbVMI.1Z.6Zwsv3DJ1r
 buS4IXCb7JBgkORah9pXNUFJNvfYvBFqmKo87oDCnajnX.as2BKxQLcijHjt6HLF7m4GxR271MhJ
 HgajYuYQj2152Wk2wUt5sOzxSVyPdbSd5kFT86kl0NR8w9xIdQiqfNqviJKkGzhzVFiWJiwOwWA9
 e9Gb4k9_IWwMoc6PTIWdXQn0f7Y_T6Iew2u6IYqDiDwqoDGpQtPHsvX1YX0UupKJ3exeRy3mwgLs
 xypQzSqsT4LuG3vFAUhT5yar1Ca0_SELMOmfznOQrUx9K2WwLKP9oHNyk0SPj2Mhd7veylOEW.XN
 biYjAmgTW57x_eHYUehbadMm33w5e1Anridq5yjDPRwgNcz7iMobMptpt.8JY_b4Ld9yqUnIFPM6
 kWlDq7nDiJvv9SNvnKoYe2kZtPOWVe1JZ_GsSA6GbtxcXHRqk9XUg07JG_dd8pN5dasD5Vca6UmY
 _MMYTB.ncp9vriGX1lyQgW22OqYreNcaggxTCd9jvgOtE7WVKMqTr5HRNrTguV4SALW3AYx_iZIy
 bRl2qOqhI_Ot6bGeEHZu.cV5nWvnoaTcQsQNpoP08NGbKWpeG82MiBI4vaX_vmAEDryzjpHGREw6
 ETV5KQO3ttNig8mW9xXhVlJPKvoycJNPbo3lhVAP9xOhHorDIAc5q02i9MLXdQx8A3P32RaG5_Vv
 Ws5D5.t2o5L6CP2dnBrvHG0cnsVfi.OnbfG2B0xEve7MTb6mes8TrlgYtOxw_JyVsWjo.TerftFy
 KCQY6I8dRjZJMN583sYvZYV2Tawp5Yh02hZrx4wTxALAAfVN1k_XbbofXtyxPfYhBn0DVcEAVaOz
 HoJpnEy4ocEvum0mt0MN7.vf8t19a8cpcfFbOBtD3RQ1RECeJSvkVb.VPoQKPlJddOpGZcpIkf0K
 RXD1rBkdxPAav5d8.f8w3AhjxOpTbaYzEIE11hMNXO9vN8W2C6UuQ.VSmSBhmnqlBuDDeZ2o3wq.
 GP05skzBvCztwh24uPfm1veqfBNdpYAF2hRNa7iQt66TBGmrlMeQUn_8IZf1YSSP5c1IkoaIf1YF
 _Sx9zSwtxUJg02nUscQ8nEsJ4dKpwPeQMyk5mA9fIRy9JKsUfuITETERC2njJ1bFNh8TC07bYBHe
 amIaHHWvnaa1RwKtYgi83m5dVG.iQVp0aGkTG5KFlXUWucJUofSHBNz8AIxaBWdys6DcK0VIY6uz
 EH2MogkL80MyOODhabyo1bJ4rH12ocw60LTQb0xp5FV591hhiotiffFTNKogREL9Smp5A5Gk8o5M
 PEOdJ8OZhqMUPvBxkfBU8lvRVQnVXfsfIzgJcIiS63NRd0tOOezBJ5UURhV9j7TETD8j622oCqwm
 L5r5hZJ.6.Wjvsak97WltV9DMvxyLcwYjH03brYZhqHFf2VoxnhOvWCqLk7foGObXzAfeX3AbYz6
 CnfwfPbk5s1DA.K77VR65LBDAli3FHxUPj1ZqxiBWQ6_yqTDVAtEH0UllQo86UZLXmRWTcdaSC9D
 asgEYe3l.4tVfRpw6uf6M7RSQKlV3KdSKtZBNQGbP7KhEsgYERZTOripn2c42wdyahpsw4cdzq5V
 Wl7f4nUK1tuFRZxtuo5mSbwBm_dGn
X-Sonic-MF: <Capitain_Jack@yahoo.com>
X-Sonic-ID: 49b055a9-9390-4c2c-a8a1-4757ae31f10a
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea1-prod-sonicconsumer-svc-101 with HTTP; Fri, 9 Oct 2026 06:34:30 +0000
Received: from dip104.lsn.bf1.yahoo.com ([67.195.177.113])
          by hello (SMTP) with SMTP ID b587e42b02226132a0e74996d08f2e41;
          Fri, 09 Oct 2026 06:34:27 +0000 (UTC)
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
Subject: Re: [PATCH v5 37/38] drm/vkms: Add connector parent configuration in
 vkms_config
In-Reply-To: <20260627-vkms-all-config-v5-37-854aa0840926@bootlin.com>
References: <20260627-vkms-all-config-v5-0-854aa0840926@bootlin.com>
 <20260627-vkms-all-config-v5-37-854aa0840926@bootlin.com>
Date: Fri, 09 Oct 2026 03:34:21 -0300
Message-ID: <179152766117.1436711.17646397822774209185@yahoo.com>
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

On Sat, 27 Jun 2026 05:30:54 +0200, Louis Chauvet wrote:
> @@ -150,6 +220,8 @@ static int __must_check vkms_connector_init(struct vkms_connector *connector,
>  		}
>  	}
>  
> +	drm_object_attach_property(&connector->base.base, connector->base.dev->mode_config.path_property, 0);
> +
>  	return 0;
>  }

With this, every VKMS connector has a PATH property, and a connector
without a parent keeps the value 0, no blob. IGT reads a PATH property
as "this connector has a path blob": kmstest_get_path_blob() asserts
the blob whenever the property exists, and igt_display_require()
reaches it through igt_output_refresh(), so IGT tests built on
igt_display stop before their first subtest.

Measured in QEMU on your base commit with v5 applied, IGT master of
2026-10-08, on the default VKMS device: kms_atomic fails with

  igt_kms-CRITICAL: Test assertion failure function kmstest_get_path_blob, file ../igt/lib/igt_kms.c:2287:
  igt_kms-CRITICAL: Failed assertion: path_blob
  ...
    #3 ../igt/lib/igt_kms.c:2618 igt_output_refresh()
    #4 ../igt/lib/igt_kms.c:2953 igt_display_reset_outputs()
    #5 ../igt/lib/igt_kms.c:3244 igt_display_require()
    #6 ../igt/tests/kms_atomic.c:1470 __igt_unique____real_main1460()

The vkms:none job of drivers/gpu/drm/ci runs IGT on that device.

Drivers attach PATH to MST connectors only, and set the blob at the
same time. With the change below, which attaches PATH only to
connectors that have a parent, kms_atomic plane-primary-legacy passes
on the default device and on a configfs device with an HDMI-A
connector, and kms_3d passes with the stereo series I am about to
post. A parent can only be linked while the connector is disabled,
and enabling a connector goes through vkms_connector_init() again, so
the property is there whenever a connector has a parent.

-- >8 --
From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
Subject: [PATCH] drm/vkms: Attach PATH only to connectors that have a parent

Every VKMS connector gets the PATH property, but only connectors with a
parent ever get a path blob, so a connector without a parent exposes
PATH = 0. Drivers attach PATH to MST connectors only, and set the blob
with it, and IGT relies on that: kmstest_get_path_blob() asserts a
blob whenever the property exists, so igt_display_require() and
kmstest_get_connector_config() fail on every VKMS device, and with
them kms_atomic and kms_3d.

Attach PATH only to connectors that have a parent.

Assisted-by: LLM
Signed-off-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 3449c4c213..5d43201cff 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -222,7 +222,9 @@ static int __must_check vkms_connector_init(struct vkms_connector *connector,
 		}
 	}
 
-	drm_object_attach_property(&connector->base.base, connector->base.dev->mode_config.path_property, 0);
+	if (vkms_config_connector_get_parent(connector_cfg))
+		drm_object_attach_property(&connector->base.base,
+					   connector->base.dev->mode_config.path_property, 0);
 
 	return 0;
 }
