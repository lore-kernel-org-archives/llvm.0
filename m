Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56C12737EA
	for <llvm@lists.linux.dev>; Wed, 17 Sep 2025 06:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758091948; cv=none; b=oDkdeKmxTT9bauFPM8R3VduTB7t2/UtFzhP/VZZ03SoPQCN+UHxJ+KYZuxXHsOsXE1ZR4+ZkxVYwnoPV2yj3UuNpVo9GRJ2gl7dgL6T2wRWacW8ICZFG37IRCplA+m2rJd20EiU3eV1BxfXGOyHxWJe8AD/ObBfyVbkrjdtVf4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758091948; c=relaxed/simple;
	bh=wCfiWlZfUqSHeQOfkvHnQzocCDMDT6uuAREbRBabYLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FI0CRvnDI/1OrAI+EQJQOh1BjczuRjqmB4G2FRiR4YgaPxykP2UqfAQ4l4eFFahGERJRG5+ffZjIepkh+hEreAXKIAcWX/ZaWvwvOKW/fH+aUHz+Eb1hNrhW8J8TYJQ1kEiXsnI0+tkLxUn/gRtvuYCXszxbvFdwJ8bElHwpAD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sixOjX5q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Oe0Fj9xM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LP0ZZpcA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0UoJb8/2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sixOjX5q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Oe0Fj9xM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LP0ZZpcA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0UoJb8/2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E438021FA7;
	Wed, 17 Sep 2025 06:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758091944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x96fWJNoIG7/8c16BVQHGGuejrjhmcZi9/xgRJg6FeI=;
	b=sixOjX5qsbmef7X6P3sl9KU3FGnu86vURNBvIAKFRBuuBCY2m1GCH2lKz9h9316oY1I5LM
	Zr3N/+qFV5PgsxAeBCFB+6F8a3Ot9mCOLvarGoAyQ1VEEfY7WaaTlXbsgWo8WcKfQqYjfL
	CrEmqVkrVuFE/yIusl0Ba88if7jpW3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758091944;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x96fWJNoIG7/8c16BVQHGGuejrjhmcZi9/xgRJg6FeI=;
	b=Oe0Fj9xMEPWjvE8se5ONVRatDjmcc0wo4tx/C2n/G517pq9cgAiYVJy+hot1xPLHUebNpI
	y1TLWQRgDKEBh4Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758091943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x96fWJNoIG7/8c16BVQHGGuejrjhmcZi9/xgRJg6FeI=;
	b=LP0ZZpcAe+SYa2sb11LhQlgGlUKx1ZOfS6Tjln15niWiusz6Gi2Ue6BgftpL6N88i7ilEi
	KPaeMPFQUPhx3g8LxebCe/LX5k2cBi1diyqR7IP7SqtbO5KRvztky4RfHmwhE44h346WHY
	4BFjLFwWsht7+9vK6K3Yb1FgCkpseZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758091943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x96fWJNoIG7/8c16BVQHGGuejrjhmcZi9/xgRJg6FeI=;
	b=0UoJb8/2ayy4uu7M7OZJ1H5RumSuNwMbqgkvEZY7BU4v8wZ4eZhq3NGyC/0Ar9ndvzV2up
	8Shxdmbo+zHHmxAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B94CB1368D;
	Wed, 17 Sep 2025 06:52:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VMXpK6daymgFZQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 17 Sep 2025 06:52:23 +0000
Message-ID: <a555ff12-e0a9-4413-b90c-0b0fe8515723@suse.de>
Date: Wed, 17 Sep 2025 08:52:23 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [lee-backlight:for-backlight-next 14/14]
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:718:25: error: call
 to undeclared function 'device_property_read_bool'; ISO C99 and later do not
 support implicit function declarations
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Lee Jones <lee@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 "Daniel Thompson (RISCstar)" <danielt@kernel.org>
References: <202509170410.RubSxK3n-lkp@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <202509170410.RubSxK3n-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.55 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	LONG_SUBJ(1.75)[233];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,intel.com:email,01.org:url]
X-Spam-Flag: NO
X-Spam-Score: -2.55

Hi,

it seems impossible to catch all of those. I'm going to send out a patch 
for the driver and get it upstream ASAP.

Best regards
Thomas

Am 16.09.25 um 22:29 schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
> head:   9f218f9bb9d274b9d5d48a4c95e1b199141fc1f2
> commit: 9f218f9bb9d274b9d5d48a4c95e1b199141fc1f2 [14/14] backlight: Do not include <linux/fb.h> in header file
> config: x86_64-buildonly-randconfig-004-20250917 (https://download.01.org/0day-ci/archive/20250917/202509170410.RubSxK3n-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170410.RubSxK3n-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509170410.RubSxK3n-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:718:25: error: call to undeclared function 'device_property_read_bool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       718 |         ctx->flip_horizontal = device_property_read_bool(dev, "flip-horizontal");
>           |                                ^
>     drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:718:25: note: did you mean 'drm_property_create_bool'?
>     include/drm/drm_property.h:271:22: note: 'drm_property_create_bool' declared here
>       271 | struct drm_property *drm_property_create_bool(struct drm_device *dev,
>           |                      ^
>>> drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:748:61: error: array has incomplete element type 'const struct of_device_id'
>       748 | static const struct of_device_id s6e88a0_ams427ap24_of_match[] = {
>           |                                                             ^
>     include/linux/device/driver.h:106:15: note: forward declaration of 'struct of_device_id'
>       106 |         const struct of_device_id       *of_match_table;
>           |                      ^
>     2 errors generated.
>
>
> vim +/device_property_read_bool +718 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
>
> 5b67fdf1668fc37 Jakob Hauser    2024-10-28  683
> d5658db2a0768a7 Jakob Hauser    2024-10-28  684  static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
> d5658db2a0768a7 Jakob Hauser    2024-10-28  685  {
> d5658db2a0768a7 Jakob Hauser    2024-10-28  686  	struct device *dev = &dsi->dev;
> d5658db2a0768a7 Jakob Hauser    2024-10-28  687  	struct s6e88a0_ams427ap24 *ctx;
> d5658db2a0768a7 Jakob Hauser    2024-10-28  688  	int ret;
> d5658db2a0768a7 Jakob Hauser    2024-10-28  689
> 3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  690  	ctx = devm_drm_panel_alloc(dev, struct s6e88a0_ams427ap24, panel,
> 3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  691  				   &s6e88a0_ams427ap24_panel_funcs,
> 3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  692  				   DRM_MODE_CONNECTOR_DSI);
> 3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  693  	if (IS_ERR(ctx))
> 3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  694  		return PTR_ERR(ctx);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  695
> d5658db2a0768a7 Jakob Hauser    2024-10-28  696  	ret = devm_regulator_bulk_get_const(dev,
> d5658db2a0768a7 Jakob Hauser    2024-10-28  697  				      ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
> d5658db2a0768a7 Jakob Hauser    2024-10-28  698  				      s6e88a0_ams427ap24_supplies,
> d5658db2a0768a7 Jakob Hauser    2024-10-28  699  				      &ctx->supplies);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  700  	if (ret < 0)
> d5658db2a0768a7 Jakob Hauser    2024-10-28  701  		return ret;
> d5658db2a0768a7 Jakob Hauser    2024-10-28  702
> d5658db2a0768a7 Jakob Hauser    2024-10-28  703  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  704  	if (IS_ERR(ctx->reset_gpio))
> d5658db2a0768a7 Jakob Hauser    2024-10-28  705  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> d5658db2a0768a7 Jakob Hauser    2024-10-28  706  				     "Failed to get reset-gpios\n");
> d5658db2a0768a7 Jakob Hauser    2024-10-28  707
> d5658db2a0768a7 Jakob Hauser    2024-10-28  708  	ctx->dsi = dsi;
> d5658db2a0768a7 Jakob Hauser    2024-10-28  709  	mipi_dsi_set_drvdata(dsi, ctx);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  710
> d5658db2a0768a7 Jakob Hauser    2024-10-28  711  	dsi->lanes = 2;
> d5658db2a0768a7 Jakob Hauser    2024-10-28  712  	dsi->format = MIPI_DSI_FMT_RGB888;
> d5658db2a0768a7 Jakob Hauser    2024-10-28  713  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> 5b67fdf1668fc37 Jakob Hauser    2024-10-28  714  			  MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_VIDEO_NO_HFP;
> d5658db2a0768a7 Jakob Hauser    2024-10-28  715
> d5658db2a0768a7 Jakob Hauser    2024-10-28  716  	ctx->panel.prepare_prev_first = true;
> d5658db2a0768a7 Jakob Hauser    2024-10-28  717
> e70d4f8e242bbc4 Jakob Hauser    2024-10-28 @718  	ctx->flip_horizontal = device_property_read_bool(dev, "flip-horizontal");
> e70d4f8e242bbc4 Jakob Hauser    2024-10-28  719
> 5b67fdf1668fc37 Jakob Hauser    2024-10-28  720  	ret = s6e88a0_ams427ap24_register_backlight(ctx);
> 5b67fdf1668fc37 Jakob Hauser    2024-10-28  721  	if (ret < 0)
> 5b67fdf1668fc37 Jakob Hauser    2024-10-28  722  		return ret;
> 5b67fdf1668fc37 Jakob Hauser    2024-10-28  723
> d5658db2a0768a7 Jakob Hauser    2024-10-28  724  	drm_panel_add(&ctx->panel);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  725
> d5658db2a0768a7 Jakob Hauser    2024-10-28  726  	ret = mipi_dsi_attach(dsi);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  727  	if (ret < 0) {
> d5658db2a0768a7 Jakob Hauser    2024-10-28  728  		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  729  		drm_panel_remove(&ctx->panel);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  730  		return ret;
> d5658db2a0768a7 Jakob Hauser    2024-10-28  731  	}
> d5658db2a0768a7 Jakob Hauser    2024-10-28  732
> d5658db2a0768a7 Jakob Hauser    2024-10-28  733  	return 0;
> d5658db2a0768a7 Jakob Hauser    2024-10-28  734  }
> d5658db2a0768a7 Jakob Hauser    2024-10-28  735
> d5658db2a0768a7 Jakob Hauser    2024-10-28  736  static void s6e88a0_ams427ap24_remove(struct mipi_dsi_device *dsi)
> d5658db2a0768a7 Jakob Hauser    2024-10-28  737  {
> d5658db2a0768a7 Jakob Hauser    2024-10-28  738  	struct s6e88a0_ams427ap24 *ctx = mipi_dsi_get_drvdata(dsi);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  739  	int ret;
> d5658db2a0768a7 Jakob Hauser    2024-10-28  740
> d5658db2a0768a7 Jakob Hauser    2024-10-28  741  	ret = mipi_dsi_detach(dsi);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  742  	if (ret < 0)
> d5658db2a0768a7 Jakob Hauser    2024-10-28  743  		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  744
> d5658db2a0768a7 Jakob Hauser    2024-10-28  745  	drm_panel_remove(&ctx->panel);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  746  }
> d5658db2a0768a7 Jakob Hauser    2024-10-28  747
> d5658db2a0768a7 Jakob Hauser    2024-10-28 @748  static const struct of_device_id s6e88a0_ams427ap24_of_match[] = {
> d5658db2a0768a7 Jakob Hauser    2024-10-28  749  	{ .compatible = "samsung,s6e88a0-ams427ap24" },
> d5658db2a0768a7 Jakob Hauser    2024-10-28  750  	{ /* sentinel */ },
> d5658db2a0768a7 Jakob Hauser    2024-10-28  751  };
> d5658db2a0768a7 Jakob Hauser    2024-10-28  752  MODULE_DEVICE_TABLE(of, s6e88a0_ams427ap24_of_match);
> d5658db2a0768a7 Jakob Hauser    2024-10-28  753
>
> :::::: The code at line 718 was first introduced by commit
> :::::: e70d4f8e242bbc4fd39f3a867dc3e33122d7e559 drm/panel: samsung-s6e88a0-ams427ap24: Add flip option
>
> :::::: TO: Jakob Hauser <jahau@rocketmail.com>
> :::::: CC: Neil Armstrong <neil.armstrong@linaro.org>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


