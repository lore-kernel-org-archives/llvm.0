Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6058394792
	for <llvm@lists.linux.dev>; Thu, 23 Apr 2026 08:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932703; cv=none; b=KtHxY+xyhatfcasXmIjBRC4yO9lImvUxcw5NvjySM9nb0RQHlQCwtIf2cHMFT0qCyKl2KaMY4rSPxL69zOKLANfwZ3S4TTgas9krHkqM2+JC9r18YpGbrQjGQhO9eKoFOQLeP89vr158KQhBNnATymkdU3v9od7HHhtjq+JxMDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932703; c=relaxed/simple;
	bh=pEG5q1K3q4rNqE+dv56RAw5gTDj61FpVhvEFK7I1JaM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XbPaDSJgKXbsR5VY1vR3K+e/5s4tTqCk6ZU3ALZY1oH3qmHgIeqHHIGIVhM4bzfyycMBkN8VobNSVFjURyTl4HQn8+OflntAB40196tztKM9CCfEMv830LMywyc4zFAnHl6hFayPdzZP1sGS1HLBIDjYk5nLnqbD+pq7F5zFeH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5IDPTWc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5IDPTWc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso65552335e9.1
        for <llvm@lists.linux.dev>; Thu, 23 Apr 2026 01:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776932700; x=1777537500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzTh6TgwvRxOhySU4DIA2mRhAv+jUq93gvppWWxQXFo=;
        b=r5IDPTWc/n2VJk3vbrZLLXTOBqbP282SMXL4wGLGExq/kmhSi/geygsIsaF2z2Zl5u
         0zTIefOlM63i63QaLzX6x96CyeTqMuvccYKS5uWcnAEwbKwoql6KMofIOHDul/Pb54AP
         C9v8KW4mfNAAKAOTd38/nz2GL9wOC3r2DkaaG3X0ccJCIMgUWG8vf73tLHl2TsaCT/OI
         fwz3rzlEDAIqswd9VkO1+b1x4vROrLTd/fg816TEJBy8bGs+PN9yrq7R9CkQ5BaWJew0
         PSso0ScQYt9JQVSVoaVozoq6NOJ2CUljIBU2AJ41rKM+DLP5TzhFGjZWqyQF3aXloKYC
         zHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776932700; x=1777537500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzTh6TgwvRxOhySU4DIA2mRhAv+jUq93gvppWWxQXFo=;
        b=HJOxSXYb+UKMF5etYNMsOPHifC9ifL69sMP9MtUv977tb7cd1bvfldHlIyGtOrGxl3
         pdAmACW8mmGdNOEMF15aV4GrXP/awL/08cK1KPNI/o4XOM2bd2to8UPuucQQlUscHcEW
         teJmzpu18X7CcUkbr89pzq6jL7wrEHXSmlTafpE9eGVvw+wDnw/wg+KylvhpDAOz+tS7
         iqS0DjbDkr4/Ya9aD08ozhqdrxpCeOdzJbv71ActqeEt7eRMgP+PX1Ues9RpnAvOqwy/
         xgSssASiCDp82Or6yB1LkOV2cqTt/WIPwQPlp/w+wS6pX7y7uCIY21clhewqH0cK9dE/
         7KWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/15ZpQKQSRx3S6R6H/94fNxDi5cWZAu4/VkvFP5SLpza/7t7QU6VWJUzYpwSbeleadKYN4@lists.linux.dev
X-Gm-Message-State: AOJu0YwNOBywFiBqD9x+8JsQRZzhEHucIi6/3HnR1x/jQbbC2mRrGOOs
	GZaBkC8mmoXtHg+34f/VY76yI/xVZ9aNiGX86QuN+BG4BWYRqHXrgkCF
X-Gm-Gg: AeBDiesv6W/3xuE29VPzQv+i56t3l1mCAWWwxeNi2m3f2PSWQT/oT0ZZHb95nSilP02
	H2omoo4hTPcdaXjEqBukGQXOjkhZghH8+Ae1YSHRLROY5iEei36rvNilSKCioQkJiL81SUKJLyt
	/6DvDpTJopoCCqcHJ7PHxvikhUM822Q3dF2pj7a3z0SaBNh92BBlYVsEdmCi3DupHy8U+1uVWgo
	dmqn0CazUTU+aKG3Jal2KKbAeZEn7vUrNclTUYaK7zxZKnk1QkRZRGXJGUpxCABFz7qYOMDX+oE
	maj4NeEfCq0+8U5T5dCpU12dDh2Q7ajg2gvyyhuQMEUnCxLE2JPCAezrYBOVXgR5bxsPZE5waBz
	U7aX12Qu9tfpJTuUhcECKYpBqpYhA0iRs09Tnj8TkCOJVxQkCGinFTRkPoqBVmyzWfvE680W74/
	Jmn1VVyZhPjIRgk2RI6L4jB5guu+ohsanbS7AOi0BW/hXz8YNK/82Pm7WcIw3yHA/o/AaYKO6yS
	4w=
X-Received: by 2002:a05:600c:3e1a:b0:489:1ca2:eafd with SMTP id 5b1f17b1804b1-4891ca2ee65mr227559915e9.11.1776932699946;
        Thu, 23 Apr 2026 01:24:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6124d7e7sm14410915e9.5.2026.04.23.01.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 01:24:59 -0700 (PDT)
Date: Thu, 23 Apr 2026 09:24:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: LiangCheng Wang <zaq14760@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: drivers/gpu/drm/tiny/pixpaper.c:579:12: warning: stack frame
 size (19288) exceeds limit (8192) in 'pixpaper_panel_hw_init'
Message-ID: <20260423092458.15743768@pumpkin>
In-Reply-To: <202604230813.tiodR4pT-lkp@intel.com>
References: <202604230813.tiodR4pT-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Apr 2026 08:20:01 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi LiangCheng,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   2e68039281932e6dc37718a1ea7cbb8e2cda42e6
> commit: c9e70639f5915f2d084a0126e62fe53a52c29cea drm: tiny: Add support for Mayqueen Pixpaper e-ink panel
> date:   8 months ago
> config: x86_64-randconfig-075-20260423 (https://download.01.org/0day-ci/archive/20260423/202604230813.tiodR4pT-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230813.tiodR4pT-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: c9e70639f591 ("drm: tiny: Add support for Mayqueen Pixpaper e-ink panel")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604230813.tiodR4pT-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/gpu/drm/tiny/pixpaper.c:579:12: warning: stack frame size (19288) exceeds limit (8192) in 'pixpaper_panel_hw_init' [-Wframe-larger-than]  
>      579 | static int pixpaper_panel_hw_init(struct pixpaper_panel *panel)
>          |            ^
>    1 warning generated.
> 
> 
> vim +/pixpaper_panel_hw_init +579 drivers/gpu/drm/tiny/pixpaper.c
> 
>    578	
>  > 579	static int pixpaper_panel_hw_init(struct pixpaper_panel *panel)  
>    580	{
>    581		struct pixpaper_error_ctx err = { .errno_code = 0 };
>    582	
>    583		gpiod_set_value_cansleep(panel->reset, 0);
>    584		msleep(50);
>    585		gpiod_set_value_cansleep(panel->reset, 1);
>    586		msleep(50);
>    587	
>    588		pixpaper_wait_for_panel(panel);
>    589	
>    590		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_4D, &err);
>    591		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_4D_CONFIG, &err);

Both the above functions need marking unconditionally 'noinline'.
They both contain usleep_range(1, 5) so the performance can't matter.
So inlining just bloats the object file and clang+kasan tends to allocate
the per-function on-stack data separately for each inlined call.

	David

>    592		if (err.errno_code)
>    593			goto init_fail;
>    594		pixpaper_wait_for_panel(panel);
>    595	
>    596		pixpaper_send_cmd(panel, PIXPAPER_CMD_PANEL_SETTING, &err);
>    597		pixpaper_send_data(panel, PIXPAPER_PSR_CONFIG, &err);
>    598		pixpaper_send_data(panel, PIXPAPER_PSR_CONFIG2, &err);
>    599		if (err.errno_code)
>    600			goto init_fail;
>    601		pixpaper_wait_for_panel(panel);
>    602	
>    603		pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_SETTING, &err);
>    604		pixpaper_send_data(panel, PIXPAPER_PWR_CONFIG1, &err);
>    605		pixpaper_send_data(panel, PIXPAPER_PWR_CONFIG2, &err);
>    606		pixpaper_send_data(panel, PIXPAPER_PWR_VSP_8_2V, &err);
>    607		pixpaper_send_data(panel, PIXPAPER_PWR_VSPL_15V, &err);
>    608		pixpaper_send_data(panel, PIXPAPER_PWR_VSN_4V, &err);
>    609		pixpaper_send_data(panel, PIXPAPER_PWR_VSP_8_2V, &err);
>    610		if (err.errno_code)
>    611			goto init_fail;
>    612		pixpaper_wait_for_panel(panel);
>    613	
>    614		pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_OFF_SEQUENCE, &err);
>    615		pixpaper_send_data(panel, PIXPAPER_PFS_CONFIG1, &err);
>    616		pixpaper_send_data(panel, PIXPAPER_PFS_CONFIG2, &err);
>    617		pixpaper_send_data(panel, PIXPAPER_PFS_CONFIG3, &err);
>    618		if (err.errno_code)
>    619			goto init_fail;
>    620		pixpaper_wait_for_panel(panel);
>    621	
>    622		pixpaper_send_cmd(panel, PIXPAPER_CMD_BOOSTER_SOFT_START, &err);
>    623		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG1, &err);
>    624		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG2, &err);
>    625		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG3, &err);
>    626		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG4, &err);
>    627		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG5, &err);
>    628		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG6, &err);
>    629		pixpaper_send_data(panel, PIXPAPER_BTST_CONFIG7, &err);
>    630		if (err.errno_code)
>    631			goto init_fail;
>    632		pixpaper_wait_for_panel(panel);
>    633	
>    634		pixpaper_send_cmd(panel, PIXPAPER_CMD_PLL_CONTROL, &err);
>    635		pixpaper_send_data(panel, PIXPAPER_PLL_CONFIG, &err);
>    636		if (err.errno_code)
>    637			goto init_fail;
>    638		pixpaper_wait_for_panel(panel);
>    639	
>    640		pixpaper_send_cmd(panel, PIXPAPER_CMD_TEMP_SENSOR_CALIB, &err);
>    641		pixpaper_send_data(panel, PIXPAPER_TSE_CONFIG, &err);
>    642		if (err.errno_code)
>    643			goto init_fail;
>    644		pixpaper_wait_for_panel(panel);
>    645	
>    646		pixpaper_send_cmd(panel, PIXPAPER_CMD_VCOM_INTERVAL, &err);
>    647		pixpaper_send_data(panel, PIXPAPER_CDI_CONFIG, &err);
>    648		if (err.errno_code)
>    649			goto init_fail;
>    650		pixpaper_wait_for_panel(panel);
>    651	
>    652		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_60, &err);
>    653		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_60_CONFIG1, &err);
>    654		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_60_CONFIG2, &err);
>    655		if (err.errno_code)
>    656			goto init_fail;
>    657		pixpaper_wait_for_panel(panel);
>    658	
>    659		pixpaper_send_cmd(panel, PIXPAPER_CMD_RESOLUTION_SETTING, &err);
>    660		pixpaper_send_data(panel, PIXPAPER_TRES_HRES_H, &err);
>    661		pixpaper_send_data(panel, PIXPAPER_TRES_HRES_L, &err);
>    662		pixpaper_send_data(panel, PIXPAPER_TRES_VRES_H, &err);
>    663		pixpaper_send_data(panel, PIXPAPER_TRES_VRES_L, &err);
>    664		if (err.errno_code)
>    665			goto init_fail;
>    666		pixpaper_wait_for_panel(panel);
>    667	
>    668		pixpaper_send_cmd(panel, PIXPAPER_CMD_GATE_SOURCE_START, &err);
>    669		pixpaper_send_data(panel, PIXPAPER_GSST_S_START, &err);
>    670		pixpaper_send_data(panel, PIXPAPER_GSST_RESERVED, &err);
>    671		pixpaper_send_data(panel, PIXPAPER_GSST_G_START_H, &err);
>    672		pixpaper_send_data(panel, PIXPAPER_GSST_G_START_L, &err);
>    673		if (err.errno_code)
>    674			goto init_fail;
>    675		pixpaper_wait_for_panel(panel);
>    676	
>    677		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_E7, &err);
>    678		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_E7_CONFIG, &err);
>    679		if (err.errno_code)
>    680			goto init_fail;
>    681		pixpaper_wait_for_panel(panel);
>    682	
>    683		pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_SAVING, &err);
>    684		pixpaper_send_data(panel, PIXPAPER_PWS_CONFIG, &err);
>    685		if (err.errno_code)
>    686			goto init_fail;
>    687		pixpaper_wait_for_panel(panel);
>    688	
>    689		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_E0, &err);
>    690		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_E0_CONFIG, &err);
>    691		if (err.errno_code)
>    692			goto init_fail;
>    693		pixpaper_wait_for_panel(panel);
>    694	
>    695		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_B4, &err);
>    696		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_B4_CONFIG, &err);
>    697		if (err.errno_code)
>    698			goto init_fail;
>    699		pixpaper_wait_for_panel(panel);
>    700	
>    701		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_B5, &err);
>    702		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_B5_CONFIG, &err);
>    703		if (err.errno_code)
>    704			goto init_fail;
>    705		pixpaper_wait_for_panel(panel);
>    706	
>    707		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_E9, &err);
>    708		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_E9_CONFIG, &err);
>    709		if (err.errno_code)
>    710			goto init_fail;
>    711		pixpaper_wait_for_panel(panel);
>    712	
>    713		return 0;
>    714	
>    715	init_fail:
>    716		drm_err(&panel->drm, "Hardware initialization failed (err=%d)\n",
>    717			err.errno_code);
>    718		return err.errno_code;
>    719	}
>    720	
> 

