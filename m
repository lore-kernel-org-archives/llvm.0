Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108498;
	b=av5Zpe93sEfYZ+TERryulPl5Ma+xR5f1tPffNm0x/gaWlkFDbqTp2f9ihyjqhF+C5VjY
	 76B5LQ2s6BYbsWa16fwdyUt5DEjZ7MSIi25/HdKMjs+h1tD5NejJnDLlIkYsNmNorRyMU
	 NAt4yb9fopZ2Q9YF8252jznE0JzKNultzicFG7mT/5qhEZKRHSDhW4byyj62WGbPECqR4
	 G4F3zJFJD9TbQ7pI8C3G8VcEWqWBuX11DdmeGY59JKbmZaWndYjxS3vY3kxW2fBBpXk2/
	 C8aNRCZ2Eo6YiUXRJHb6TN0+KCBcut5bS5tEwlTauA7MQFI/WusK9LvtX/tbuAYvk6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6QyjNsTJ8Pk5IbHY7V8NIIncLAiaHTchnKhUzfM71SE=;
	b=09xeDlGadZArflrfEQ8gs4yWkZRWN2d6IFa70+aLyCNowRQz6HWfG7vxK/c2Fw0xBnjV
	 +2ca7ZNmQTP0p3bE5ZCglrvNaEW2z5Ya/froN8BuAy0KgdJhbxNt2KOm0MPnUaMUZpgVj
	 vy7SiesEY9IT0xtfEQxrNfuW16sd2+0AfUt3FhR0YKtkAmC+6CMcpxuVSJfyCfnO4A+Ei
	 +NGxW6c/lNKu6bUTBVIrSfJ9OPwmCXqs4lNwsh9b2rdDH5BRrRpNcKeB54NFgWpwOKcn9
	 KVynndgjH56ohH9daqr5Xl1VEGkMouedPFUpzNeaPpQ8lBksnkyijgw3X5izHriX14Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Qr/8sJny";
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C0606A325
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B1C0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qr/8sJny
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-85f37d25fa3so3087a34.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108497; x=1795713297; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QyjNsTJ8Pk5IbHY7V8NIIncLAiaHTchnKhUzfM71SE=;
        b=Qr/8sJnyyrrzektlNl2YsEyCrK3hMrJrHcKLJAxF9ic7VzeZNxJLk1S9u0HxlJKL80
         gvDphNVgGpLiZf+EtiI4T8cZRQ46M52CHYkcLh7YtXL0DRIXuqlNmsfbqB7ZRJi7jDLc
         fabj7XsHznDwLEMlROt2t+6CWLbxm1qSCIDqMSJWelO4SvlLNE1FFSFCQOOzqzPDTnKL
         tSznIIZM+nRd2xqVV7/qygQYEPWFG5Z3VjWIT+08hLUbWNYlVU0Xu8PBthEssU/Q0NPe
         xxOH/w8Q1npL5soTkOinaQDpKJQGNy1r+rxor5pGTo+hVRERhNPhnRtnAKshbC4zyj2J
         n8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108497; x=1795713297;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QyjNsTJ8Pk5IbHY7V8NIIncLAiaHTchnKhUzfM71SE=;
        b=s+PrgHlMUbockhiq2p9+cVMc5BsuiQLXPHTR8gVmeQaH6OjtErAJfwZEBGXbVhPtnC
         GvTSDtVgnva5CXMqvzEJXOeQ5PwXO97hu1Xpyf7SAdBhVAuYFRzatFbufkgY61I4hE+4
         zFj4/Z4bYNDNJdWxJZN3EMHglE1GLsK9x8llt+APRJZc54BBCI+s2I0t2XftYXydKLbb
         qUfM+OGZng8CHJ+87fZrHMrX1H9bdWyn2LjF1tSzBlgw9GMOif9smowQdSxcOhbjvXfr
         7VubekDI028itZVT/OS3DbwWII6C/QcnzkQF0IJEEs6593q1zFfXk99pWH9yzme81jKr
         fWaA==
X-Forwarded-Encrypted: i=1; AL+hErEGlYByFg/OTlERpyYpONdbYB1E/cFjsOKUTP0rCXFa+lM+KDWNGe3/5F6x3UxzbR4s/Gat@lists.linux.dev
X-Gm-Message-State: APuU4Z90IKhHDX5VYZ3CEXVpOMzqrI4bel/sMkQfCukG1nV5tp6rgBMI
	6NebjX/fvjZ0D9AHCmBNrOFWuIMcWb/ZON1YdF8Dm1Bygc7VBjBX7qHWdniwIN5Wt0u1XniAeXV
	WXkfdd3ZTQQ==
X-Received: from oakd17.prod.google.com ([2002:a05:6870:3231:b0:495:bb4d:1619])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:9d98:b0:442:175:cea7
 with SMTP id 586e51a60fabf-4bc7beb0334mr203879fac.1.1795108022773; Thu, 19
 Nov 2026 09:07:02 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:56 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170656.1522183-1-irogers@google.com>
Subject: [PATCH] ASoC: rt1320-sdw: Reject unknown dev_id in FU Capture Volume handlers
From: Ian Rogers <irogers@google.com>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

rt1320_sdw_init() registers the ASoC component and its "FU Capture Volume"
control before SoundWire peripheral enumeration populates rt1320->dev_id
(which starts at 0). Unlike rt1320_set_fu_capture_ctl(), the
switch (rt1320->dev_id) blocks in rt1320_set_gain_get() and
rt1320_set_gain_put() omit a default case. Reading "FU Capture Volume"
before enumeration completes (or with an unrecognized dev_id) leaves
'regvalue' uninitialized on the stack and returns a value derived from it
directly to userspace; writing the control similarly reads uninitialized
'regvalue', 'err', and 'reg_base'.

Return -EINVAL in the default branch of all three switch statements,
matching rt1320_set_fu_capture_ctl().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not tested on Realtek RT1320/RT1321 hardware.

Fixes: 7bf9e646af9a ("ASoC: rt1321: Add RT1321 amplifier support")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/codecs/rt1320-sdw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 20288ea7a2ff..19f7aafc6f2d 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -2672,6 +2672,8 @@ static int rt1320_set_gain_put(struct snd_kcontrol *kcontrol,
 			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
 			regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue[i]);
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		gain_val[i] = ucontrol->value.integer.value[i];
@@ -2702,6 +2704,8 @@ static int rt1320_set_gain_put(struct snd_kcontrol *kcontrol,
 			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
 			err = regmap_write(rt1320->mbq_regmap, reg_base + i, gain_val[i]);
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		if (err < 0)
@@ -2760,6 +2764,8 @@ static int rt1320_set_gain_get(struct snd_kcontrol *kcontrol,
 			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
 			regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue);
 			break;
+		default:
+			return -EINVAL;
 		}
 
 		ctl = p->max - (((0x1e00 - regvalue) & 0xffff) / interval_offset);
-- 
2.56.1.708.g77570a6a1d-goog

