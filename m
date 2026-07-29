Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954333C3C00
	for <llvm@lists.linux.dev>; Wed, 29 Jul 2026 21:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361248; cv=none; b=b4f+dAf0ErVWAnsgYPT41x3Se5GpPsm+MQB3iVYr3S2NzxDhij/ddvmgB0TxjxTPh5C1sAS2MVTJyFywxJpW4A5m5tNVc/Jr95AluQgJnp1zDxN4nJq+RsPeIjsZPnKwq5ycsVcgmToELhWILDLmEE9F3BduFize8ynkORiQTcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361248; c=relaxed/simple;
	bh=Rs3mp8pkxLYKGGhUIhdR/SYWcj1j+hYVMO2ZzNS4QpU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cdke8cd7zqYRFbwUcyS5ni88m6v9R1kooKAh2u/q22zTcMHP9LpfJ4kpPHXK7mS2UfvPMsE/Hqv8bLCjozTpIfCs/qxtRoj8KmmMOwtlR58oMX+AgkCFjAyrim1iPKkXX1z1OKdqE6I4GhGKXstgabedLyAXtf4fZVLI1L6ZDns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyCFy4oj; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyCFy4oj"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f707e5d75so1025102f8f.1
        for <llvm@lists.linux.dev>; Wed, 29 Jul 2026 14:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785361244; x=1785966044; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PbO8Jel7xAPN7wALk67arGYxdY5jvXfC9QzA4X61ObU=;
        b=MyCFy4ojifGUETQycgrRfLUizsRZPGwYTCGuJRyeoE7VE82Avy6troKpl9DcZxFvJ7
         paPiSmnwcY5JWLBAZ112lzaSD5GFC+sZb6fodSxv5L9OOxQmNK0bNJQVSGi2mCibIDw2
         4OnEfcX7M1IlKM8h2B6zuYe+9oGEZo9Yz87L4TlYS42I7mhSiQioMll8wGgpXP66+t70
         ha2QuiTgMepS/Wb1DnHtwtpj/0lhwQKPJVT6NlT0ZStCSW7Z7N44zeiS7Db4X0mZfwQE
         OiYKrFw06fCgjfDn7Fks8szFzwJnVIp2r9XKNN9+iUsD5+ERoywtfGpqAlNUzTymcUdp
         l6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785361244; x=1785966044;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PbO8Jel7xAPN7wALk67arGYxdY5jvXfC9QzA4X61ObU=;
        b=Qx6VWVp2vwzg9jkfE58amm1su9tM0kEeF2A2GhNV8lVysl1o8T+1YVF95/SHHo0/SY
         szoOql2wpv11k8Bvi3YfK67Q8NGlknZ1uXdG6QESfvDpYJkQlwVA7t2ojlMoVG/V4IMc
         NG4tUzufchRxOxESHene9Q1w08WvsACbcJybB50D3ns/FWMCzMHA3nSRHvi6BepuMGbF
         /JIwslMdFGBWjQltE+6bn5TcHnC6TeY4OwrHL57ValwaJtsFsW4Yz6mvGeqiriFO4EUx
         BP/8j07OaNQaUnxIAxsWN9vuzRfTTwPmk4aH3wmIn1X0Zzr4j+664lhCSe0EZdqotOyE
         gr7A==
X-Forwarded-Encrypted: i=1; AHgh+RqDusYGdaX2+HkLF4nDr4UknEye61sSZuY+eCz/90B+8+WtyA3gEIV8wB2fhEoKiJY6jl/4@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc6QORF0U7k/GiLG9j9gwAWhNxbaXQKNZ/s8fpPvj0p7ROWTgh
	UhdoZzZNyxhSqTLfY/y9zazsvoC88uHjpwfP7Vm3553zkmmU/3G11XXZ
X-Gm-Gg: AR+sD12mvKS3CPVaOcz8vKGzO04ydrbJhmTnJjvNKPa76i4+sCS/pgF4/xZ/Uqditu7
	MuH1OBHEfIWqhl0jTMSPDUANair9GEfxLnBmyxhLwpNTx16sjvPJcTqofTnurSYX/DujQu3UA6I
	FK7ioIulllVmYikWXj9zNygC4qYxZ1TDjrUWKkS+qSvWH/Q0ZcJEMBOhRm9PQZY/7m4Tun7KYU8
	QSSKqpHGucNHWjxKho+92XtoYh8PAg/pcxMy1cfFdjZJXksGIShSf8r/bAxM+YitiszruZQ+tTa
	Ddl9acMH/QSdZ38CUq4vqZmIoqPJ/l+FWcbe/Rq4L7J1idC+vS8j8/om0C9yF7UBiWKEM+eODc2
	IPc+UJeQ4QhEPdVN82458AnVsafjO5TiVyFTuhIT6NYLhnRMB/Yc5E/ZCclW0imWcdvzm1OMIAM
	6A/DsJPB1Pj2+GSPOpHA2ORVnHMrnMuiE+9wGaFqNXO972frONZ7dsxL3zr7j2T4wUkfdyrmNVS
	QBS0MioHUdkXhRd9l0xZKOkZg==
X-Received: by 2002:a05:6000:2dc4:b0:47f:5369:bba with SMTP id ffacd0b85a97d-47fc832a671mr32279f8f.15.1785361243606;
        Wed, 29 Jul 2026 14:40:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm11972608f8f.16.2026.07.29.14.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:40:43 -0700 (PDT)
Date: Wed, 29 Jul 2026 22:40:41 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: LiangCheng Wang <zaq14760@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: drivers/gpu/drm/tiny/pixpaper.c:579:12: warning: stack frame
 size (19320) exceeds limit (8192) in 'pixpaper_panel_hw_init'
Message-ID: <20260729224041.5f1a0cfa@pumpkin>
In-Reply-To: <202607300433.8npIqx2t-lkp@intel.com>
References: <202607300433.8npIqx2t-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Jul 2026 05:15:35 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi LiangCheng,
> 
> FYI, the error/warning still remains.

I suspect the three functions need to be noinline
If nothing else it will reduce the code size for normal builds.
Will probably run faster because the code stands a chance of being in the I-cache.

	David

> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
> commit: c9e70639f5915f2d084a0126e62fe53a52c29cea drm: tiny: Add support for Mayqueen Pixpaper e-ink panel
> date:   11 months ago
> config: x86_64-randconfig-014-20260730 (https://download.01.org/0day-ci/archive/20260730/202607300433.8npIqx2t-lkp@intel.com/config)
> compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300433.8npIqx2t-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: c9e70639f591 ("drm: tiny: Add support for Mayqueen Pixpaper e-ink panel")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607300433.8npIqx2t-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from <built-in>:3:
>    In file included from include/linux/compiler_types.h:171:
>    include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
>       28 | #define __SANITIZE_ADDRESS__
>          |         ^
>    <built-in>:353:9: note: previous definition is here
>      353 | #define __SANITIZE_ADDRESS__ 1
>          |         ^
> >> drivers/gpu/drm/tiny/pixpaper.c:579:12: warning: stack frame size (19320) exceeds limit (8192) in 'pixpaper_panel_hw_init' [-Wframe-larger-than]  
>      579 | static int pixpaper_panel_hw_init(struct pixpaper_panel *panel)
>          |            ^
>    2 warnings generated.
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
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

