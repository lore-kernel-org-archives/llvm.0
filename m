Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8C525B2FA
	for <llvm@lists.linux.dev>; Mon,  8 Dec 2025 03:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765166113; cv=none; b=o37Mu8r2bkoPnElzGVOaWqcrrUcauRBSyVgdXUfCJqlBw4cjiDw1ZRDPqU1mhaV3+WgvUt8XepL+5pR5BqlqI9JfJHr1f0ufEthbTAO5qJVPkx0lNwDD+TpzHYHaCNeJoBdoWCs8dOIFRO5MUCTZ0z5fK1SRW7OICEhUFG9PTaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765166113; c=relaxed/simple;
	bh=UCxR/7LSxyi4Iy5GKgmJ81emIYUJoNbm2QG+ygYrVTo=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=RjK9ix8ukbXy6tEbLXqkyOLg6WtjNSJGeRoB+AhpIN+dKoVD4r7sYBDtJ3zZad1pIlcO1n3trRpE81QGRrZgvfvURuPtZ7v/hs41DR1WeBfR6K+4vcEzWl1yJssS7/WI40RMcg3jfp05ayjdJf04ANIgVWQtERNPKNwDRBuw3EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BsumN8No; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BsumN8No"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so31543115e9.0
        for <llvm@lists.linux.dev>; Sun, 07 Dec 2025 19:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765166110; x=1765770910; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=296SilC65z4XmTA3U66AfDXBjMYNo7gMqVbqMuOL8EU=;
        b=BsumN8NorNiAWetCo7DWGBh5iuDNv4wUDN+2s7KKcG/F/0vlJ0zqZ7bh/jQ9/h3A5z
         pc4XcEUVJ8l0zkcbyqk0eRd37QCINDtFQE4rRPdGV60CUk89u5UQ+3GFH6fJZk07TINx
         GX5rPnj0+lI4iUTa/HXo5h1/CxfkmdoYKEzf4sn5VOiD99SCp+hHq+VG6kqjMYI4hghC
         E1PXCBHxtsHiKIY1SBZ2cNjvyjscpQl84W7iEryaktVEEuCEhHsKbXkSY7Oo2fo5lQ0D
         7gXOv2+exHQeKjyhjjquHeBoET909hhR+dyh3iLPQ02UXI9yVjwCvzQ9quZW1hmy3pPR
         3m3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765166110; x=1765770910;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=296SilC65z4XmTA3U66AfDXBjMYNo7gMqVbqMuOL8EU=;
        b=cgUcv1eQQlI00ekKtc/yHLBYWl/CN7XEmojnCir2au8fQtGnZ6AhNWo4ztPW4ffM9t
         NKIfPQ/NnMXpWIZ5sLGugExPO4qXCO28e6fWW963YZuShUwqA0OrHUvMGMxnqAND7KZs
         JptPYrBRavuK/rpQKcK33k08hOyXiaFo+9fhPIW0/0kXezdYvQba5QuDV6GyQcDj7dOu
         fAxl6pm3mqd4U7aNZhUpt7FqVpvaKjSW17pesLLs3TDziUcCHc63Sd07O/gxSIZanJb4
         /CMIqbzRYA1c6o28gsJq/MEzyCpN6Cz4p/Kr9qHNMRcoWoZBcHA2oLw/Vn9AlAWKeMxc
         1MZg==
X-Gm-Message-State: AOJu0YzFfsv3bf7geYYC5q/dL5uHv689wfy32IstRfu/YIof70P7JqTX
	POa1IWxA2XXnDbkko18FX6901MidSqAvtJ8jRRzcIFmllIUmygXPkAWT2/X4Gq18imlj4282VM9
	cU6De
X-Gm-Gg: ASbGncubUT1UH0hk8ierFNFuPSarfsHV/pbjcbJI1VZGRo12ArlKNXztFpYVczpjkMJ
	0agYJz8cSQWKC/I3Sj/OKmppak3ozTXqEjYq7i502jS2tUVIcO8dKRJmWUHVqy4eRYHP4cOIq+j
	7Lv4iweTj3WPDyj+aQT+aXhNZgdOKaFThJf/8Tlz/MBE5zEUrn4rOmUulytr62HAYH+QmTjmGXH
	nU0bNFba18wm0vr8nvCAILYhBIPJR/0sv0Fi5TGILRRiLLBlo2eOMe+My8wybfKYNvGTK+HW4To
	qqbfsg8bcBEOVlJT3fJ1yrGzbTCH9BZrx0lmR0whhQ0uJbdJnJLUKaJQdo3v7X154f5O54lsuC4
	e/Tn0AFpOZ4CGoQJgobsXoJ8Q+j3kmhGpP9N5pXYlJEhclG486fgX+aOzuWFDbEYxvqziU4m67Z
	b/v2j4sKP2226WwFw0wRZajyARzLOgSkKKOpd0X5tzjVXNhSYayBwrcqv6SH5nMGUC6bR6
X-Google-Smtp-Source: AGHT+IGhrJJoo9kx/8ibaBAmSemAZzFLaQVXICIiopL2d4aI21Zq7e7LXDLSkyKj3gLTExe1SGn1Jw==
X-Received: by 2002:a05:600c:4588:b0:477:7b9a:bb07 with SMTP id 5b1f17b1804b1-47939e46162mr77076875e9.35.1765166109998;
        Sun, 07 Dec 2025 19:55:09 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311ed466sm214322215e9.13.2025.12.07.19.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 19:55:09 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 8 Dec 2025 03:55:08 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1316820319.13253.1765166109507@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.18-rc6-688-gcd41d3420ef6: Failure on arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13251_938346033.1765166108816"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-mainline-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_13251_938346033.1765166108816
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-arm-mainline-allyesconfig, after:
  | commit v6.18-rc6-688-gcd41d3420ef6
  | Author: Jaroslav Kysela <perex@perex.cz>
  | Date:   Wed Nov 26 10:16:35 2025 +0100
  | 
  |     ASoC: nau8325: add missing build config
  |     
  |     This configuration was missing from the initial commit.
  |     
  |     Found by Jiri Benc <jbenc@redhat.com>
  | ... 6 lines of the commit log omitted.

Produces Failure:
  | Results changed to
  | # reset_artifacts:
  | -10
  | # build_abe binutils:
  | -9
  | # build_kernel_llvm:
  | -5
  | # build_abe qemu:
  | -2
  | # linux_n_obj:
  | 23374
  | # First few build errors in logs:
  | # 00:26:11 sound/soc/codecs/nau8325.c:430:13: error: variable 'n2_max' is uninitialized when used here [-Werror,-Wuninitialized]
  | # 00:26:11 sound/soc/codecs/nau8325.c:431:11: error: variable 'ratio_sel' is uninitialized when used here [-Werror,-Wuninitialized]
  | # 00:26:11 make[5]: *** [scripts/Makefile.build:287: sound/soc/codecs/nau8325.o] Error 1
  | # 00:33:22 make[4]: *** [scripts/Makefile.build:556: sound/soc/codecs] Error 2
  | # 00:34:29 make[3]: *** [scripts/Makefile.build:556: sound/soc] Error 2
  | # 00:34:29 make[2]: *** [scripts/Makefile.build:556: sound] Error 2
  | # 00:56:16 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_1/linux/Makefile:2010: .] Error 2
  | # 00:56:16 make: *** [Makefile:248: __sub-make] Error 2
  | 
  | From
  | # reset_artifacts:
  | -10
  | # build_abe binutils:
  | -9
  | # build_kernel_llvm:
  | -5
  | # build_abe qemu:
  | -2
  | # linux_n_obj:
  | 23454
  | # linux build successful:
  | all

Used configuration :
 tcwg_kernel/llvm-master-arm-mainline-allyesconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-2135. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allyesconfig-build/372/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-allyesconfig-build/371/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/LinaroLtd/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/cd41d3420ef658b2ca902d7677536ec8e25b610a/tcwg_kernel/llvm-master-arm-mainline-allyesconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline/commit/cd41d3420ef658b2ca902d7677536ec8e25b610a
------=_Part_13251_938346033.1765166108816--
