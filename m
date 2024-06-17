Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE0E18FDB8
	for <llvm@lists.linux.dev>; Mon, 17 Jun 2024 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609600; cv=none; b=h4ScWLd5EyY2i6y4ieWrcApOQouSxiAsdoG7C8rSFEwxFM87GtxeC3jQ25shWS0tJDIRDG+mwfrRFLPT93qwlm8Azh4Wnk9dkF1Gzt+ZEZU3xVJV7XR3PQM7ZQTjC/oZR7W/mKcriKWp9TmdhhN8rp66WnTdm7oUaHR8/F7J6gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609600; c=relaxed/simple;
	bh=tnw8KJfIC0QaKsEcAmnbEoCX/ETKGVtP6MF9dkMum/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R66PuTdSeeKFN6QsYd+vG6Kz+V2M5TVahcizPwRRoqUl9uViFDeRh8uwEW3AYgjT0uKav+ebWkTzKbCGQKIfbKBBYW68polzp9GBVulvcBDKmtorSAuyKNuBveTr2TAueIr9HjRXS4rig5svdbT4sAwVGVHQtWbBjERPTIOGEXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ocB3GAva; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ocB3GAva"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3608e6d14b6so976995f8f.0
        for <llvm@lists.linux.dev>; Mon, 17 Jun 2024 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718609595; x=1719214395; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qFAO7hjZrJD4X05uwsexfWcIBbA0sH4Zj3/d1Zhwfts=;
        b=ocB3GAvan4oPykIAmvkYhSdIWRcwLAMuWBYf5e6FnyNRxx6FdS+qioPqlVexRzX+Ye
         qOC7H5SP17SBFqcRUWsbDdZ3gyUxWIeL7SbF5+zlCdXQ0TndUjR83oPQQWiAfPI3vXmY
         eFsTzfnxrCu0V3mwt2Rzt/kCxE5v/BFc8vXmkWpTQJhWG79/rYcayYj6MftdiHt/Fzy7
         X0zZxv1jB7LfhY29uDTryB2SNHJV0lsUzwqULMidkjLtUklLvmHO4oWB6wJlIj2ADbKF
         ARtoUwPuq6TjPw15bz48lsuEYMBMbs6Jh79DGRzArU2Q07ZEvbHBiTiJBUm+dhg5oqzD
         VV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609595; x=1719214395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFAO7hjZrJD4X05uwsexfWcIBbA0sH4Zj3/d1Zhwfts=;
        b=NsWeZ1uSoCEhO5ON6QLZFLqUFDgnp3pfUux3UI0uQ4ifxYbXxitwmHVk3CLb96qpcg
         F/Wtyybje6p5o+aYTGjuKiurhQ0DGofUs4lLugl5AU39EDvy08st7Gk5kbqZExvvsT5l
         5Wreg9VvqE3m7OmQ1zaEALTVINREdY+IO471wpxrnHcBg69iR418Kf77yTKi9miXenjl
         50YLO8Eb/8W67r9UvDFF5w/0tvtU5hqGwypFYcwIRR91OcnqPkjSjNi+YDVqXY+9jNS3
         lDlmvCjr0qzzeBZfw3ADh+O1bRAyrXbXJO7CkbAEUM3mhG2wNgAeqcS4uLxMM9sTP54u
         NFGg==
X-Gm-Message-State: AOJu0YziD9pqdBfIZmXJHWVMRbtVG/j3YE2Rg+3ooOH3CEU/QWmrSlVA
	AbgV/F+WS0q90xnnUFKn6X9G9glVtYzINO/x2t+Y02SIfueabPoSdbxqE/VgvLs=
X-Google-Smtp-Source: AGHT+IGV5JrEkxcxq5+1SfbTzayMIALViJH5MkFKfNBIodGAdkmP3L2n4Rl0JQqWgY60pp/FOR8bwg==
X-Received: by 2002:a05:6000:47:b0:35f:1bc3:50b0 with SMTP id ffacd0b85a97d-3607a7844e7mr6344442f8f.63.1718609595419;
        Mon, 17 Jun 2024 00:33:15 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750934a4sm11225143f8f.10.2024.06.17.00.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:33:14 -0700 (PDT)
Message-ID: <71d53ff6-fdae-440d-b60d-3ae6f0c881d9@baylibre.com>
Date: Mon, 17 Jun 2024 09:33:12 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mediatek:v6.10-next/dts64 51/53] Error:
 arch/arm64/boot/dts/mediatek/mt8186.dtsi:2399.29-30 syntax error
To: kernel test robot <lkp@intel.com>, Nicolas Pitre <npitre@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <202406142304.D63dr3NH-lkp@intel.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <202406142304.D63dr3NH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/24 17:10, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.10-next/dts64
> head:   2f950510411a33d98eea28c22d7880eeb48adb61
> commit: d7c1bde38bf37a59551cfd52cfdb5bd974b17431 [51/53] arm64: dts: mediatek: mt8186: add default thermal zones
> config: arm64-randconfig-004-20240614 (https://download.01.org/0day-ci/archive/20240614/202406142304.D63dr3NH-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406142304.D63dr3NH-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406142304.D63dr3NH-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/arm64/boot/dts/mediatek/mt8186.dtsi:2399.29-30 syntax error
>     FATAL ERROR: Unable to parse input tree
>

This dt-binding patch has not been applied:
https://lore.kernel.org/all/20240603-mtk-thermal-mt818x-dtsi-v7-1-8c8e3c7a3643@baylibre.com/

This is why this error is raised.

Julien
