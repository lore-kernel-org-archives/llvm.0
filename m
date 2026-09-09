Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8BC3783BB
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974823; cv=none; b=ImPh2yolz57mqZY4PzztuyIR0EbfUP4hikLa/SV4FSKlObpEqQpqfFaFdq5ACg+6ndmD05KSfbhuBfWisUqveOn+qNauaP5RtSycF48GRvpbgpXLbpiC7HzaVeTxl+1RT0N1SbxlSC01uoW7QLJfc+m2ti+OTgOAf8N9TsHFZ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974823; c=relaxed/simple;
	bh=SUxP5gT1ZaOy4mmgP6chw0Cr8VRY83cgnbGtN/GeIrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Juba0PEXZLUnv5bkxUONe2kx0MkAELpdJM4IJ6oA4Ev5GeJdzMl39vhC5tJ7Qktne4uw8wdBnNE+rZObQrIfWrZFZW+kMl9M27PAV8HW66VIDTA4EGjuCpuEssc4D2Wb+anS8tHuazrpTkfGsKMWUSd+azwpmLFh2ynnACbgodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBew0+6L; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBew0+6L"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-869ac301739so106726b3a.1
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974821; x=1789579621; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BxkJmMQiuFGLIVhYvP7iekSRoJyyqxrT2LFSLJP0a4Q=;
        b=hBew0+6LcALPWkoU9pPOcHLf/roFs+pcahVIuR2QMygL40EusUeizzo8jneADVPA2u
         IUMEqTsV4wTLHUmigXT8qlkpXr3g94O1fkhl0LfagqrteAXWGc0FXy4Ywzax+/vaXw/3
         zmc22PhK0LlbTHOkKVFGxwZNB6kIXzYgTsZfehVpxTL0jPL/DjJarBq+PEsu+II4ze8H
         fcN737xFw4Ihq+Hb8iGntniyjb/4Q4IhPHQ0VyQ+/nj1cK5ie0DOqskRWBn24T3dj2sJ
         y71mvySTIdsZF6n5zIfuVsW00kuCxaIpXb0rY+s+O+CtR4TbZzLyTcBa01HGZU1bjtjo
         X/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974821; x=1789579621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxkJmMQiuFGLIVhYvP7iekSRoJyyqxrT2LFSLJP0a4Q=;
        b=fo3LbUDSnZCcDiaK2DhiP2OmMnH505TE71mbF9Neus8ynNnOxvYW3jCJ/zELQGrU1j
         Z1DDi91J+0jbkS8/jezg3VpqPm5pJsXvawAJ5lUTGO21x/rCyAIFS4xxVBuXc7EW+CP4
         J+Uca+vLVSyvXVWoOjHlXf/xoqrqGwI94jpbAbkJ67lAGwh4vWmfY+dT4fxcgJ2U4m2W
         O59e6d7r/9Tt8D++NubY9pAgXfFAva82br+zbTYKUaiDzeQ75yvx1HRyECq/JJTO8LT2
         hnLu8NSHwZuiIC+7UOfPz1TzfDXosCTKN0XZz+Tll8RwXyIQTNOej4PByn63OZaU2lcM
         kKYw==
X-Forwarded-Encrypted: i=1; AKwUvBzCZk5IaPjvWDjGv+PJ9PMzLDTctMebmsFG1dTijIGiMZg63LUPCNisHaUvy5Mek7BPw6y6@lists.linux.dev
X-Gm-Message-State: AFuF++lGA0i39q+qEP+uZjHbAVVi/FDxKPhJc4d5zk6iwXN1KQVof8Qq
	BDT5h22B0p+S3XNkIhAb8HJ0AghjiDzQH7bNml5pgHt6PfvaItLcDNUx
X-Gm-Gg: AYBFou1wuNje2OxZlWfe6jU2qXdpXE4zSgZMzaJ3g5fW+hOzuvRes51Z1jGu+Xe7+w9
	1l6gCuJ7ECS8S/HCxEeYOMXY9alW1dL49WrVRIbvJyiBQ9nygzJi2l2wvQo7psnTnhJHLJNJ2Xm
	PEOQXf8mqS/pq0JuCmICYGv2PHMC3RQNkI8GD09OtxLgUmJu4pRgk5VbSWpM1ON2f0RJvLAGFEP
	i/WIeTAXxqZjOKzZ3316dST93Yp6mKIruqOVnkRT5KWLbv4/84QfuCnbQQz/MybOQdbkecqait0
	T6Tu4WQYOl1VZZtDkHEM4egr+eIqPHcyFJ+R5buN9CjNE5D8vHMlKURdFoiNEh823FkzBKnjj9v
	SbqHMhCm5rtOpt4k148sDV5PjDCKOMkW3imPM7yU/do7JiFB1utrD5Q6nxjvAh3wXGb3muYZr4O
	OIAAieWo76JFrJebP32hMZnvRPUf0lYEGljjnQUCv+8bwOxc7HQhNjBy1ZteIuBQY2ku7QOoEe8
	08RdklWixSEoUFS7eZ++p3bQZBjUXG4/hjRLb0u3cNMR7jOxcqK
X-Received: by 2002:a05:6a21:9d84:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3da3a16a579mr57975715637.26.1788974820346;
        Wed, 09 Sep 2026 10:27:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2d43:5153:5c50:643e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm52422943eec.7.2026.09.09.10.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:26:59 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:26:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH 00/14] mfd: unused driver purge
Message-ID: <aqGWjAuGXq_JHvxk@google.com>
References: <20260909132153.1596191-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-1-arnd@kernel.org>

On Wed, Sep 09, 2026 at 03:21:37PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As part of my cleanup of old platforms, I had a look at all drivers that
> may have become unused because the last platform_data or DT definition
> was removed, or because of unmet Kconfig dependencies.
> 
> These are all the mfd drivers I found. The first ten in the list
> actually turned out to have been unusable long before my series, and
> I have added explanations on how I determined this in each patch. The
> last four patches are still in use in linux-7.3 but become unused after
> my series [1] that I hope to get merged for 7.4.
> 
> Somewhat unorthodox, I took a shortcut here and remove both the mfd drivers
> and the corresponding subsystem drivers (gpio, hwmon, iio, input, led,
> media, power, regulator, rtc, video, watchdog, asoc) in a combined patch,
> to simplify the interdependencies: removing just the mfd driver would
> leave unselectable or broken drivers in other subsystems.  I also have
> additional patches for each of the other subsystems, currently a total
> of 300 patches, many of which still need better testing or proper
> changelog texts.
> 
> Please let me know if you all think this approach is ok, or if I should
> explode this further and turn these 14 patches into 70 individual ones
> by splitting them per subsystem.

Sounds good to me, especially if Lee makes an immutable branch from this
pull so we can all pull it in...

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
