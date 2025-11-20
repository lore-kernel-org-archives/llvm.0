Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27CD4503B
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 05:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763615074; cv=none; b=CdQWwgbkXA6VC2wjB/VARSGVwTo1+AoGOKCWsC1HE/ilbi2sjVckCmpMXD+keBfUL1pWcgSWiyteGKhELeOLIW58nYoX+B2sJ7qILPTTm7omhRPofPxxhyxJMh1YHHwt50mHknFisDKF64H5WlsdISisGH5JQBBjXYmIntxLq4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763615074; c=relaxed/simple;
	bh=bk1F7lxOAbLVWQoXSdnzvnLRCge3t6S5LAhXQgT9YgY=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=XJwohBVgM4GVbMWBXPWFUi/Ab4BqmSSyEoFHNsNWp9Z7KTCMskihHdOWcVX2n6+sY48yzHAOmrIHTPLdzcewYpmGD8L1/Qr03lgDKTwuWTnKVi9NZMGoLikF811bvdYz1wNTvhyuwbJ+zF6SGM74MFULymVldxD83sWhlzNcg5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UOYPTNL4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UOYPTNL4"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429c82bf86bso248274f8f.1
        for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 21:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763615071; x=1764219871; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J2ZkCnf5ylAcQjAFa3QNlVX2TckxAQ2S+HyALq/DyeM=;
        b=UOYPTNL4wDxtda+EGU62SeBTFtvbQ5x0/Vaiix7LFpZOHYMnjPWA/QlNhw+GA2CdEm
         01BN4rDeLQfXbNVZGY9SGUHsaWPBOuXYcC7uz4FE9Qw+tLdAVsoFEYMOgnFrwlj2zqVw
         1Yums0NQcMWz1C7/OE2yzwmGFW1T+UyXOgEcE2l4FUnv6yJj/d/KgnF4xGS+e6Hvy3To
         ZTICFA0qClSGUNRJmebBgcHlyHO/bS19lll8X0ow57MQolXxq8xRTbdeiLWtMpmRo68D
         q+g1GHjoxkfNuYPKkO9DypU5ubwKEIVYYBoBSDJGMK2ckkn65Q66NHm77CrxNX5W4R2N
         oXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763615071; x=1764219871;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2ZkCnf5ylAcQjAFa3QNlVX2TckxAQ2S+HyALq/DyeM=;
        b=IcUG5Is5uA5qSVsmo/IL4POv4SbagqAGhphoCSzcAOQpdzy1dJUgkESNAqjw2ED+M3
         jXL1zSEAjQdZA9zzA+zK2fYLCbnPC1tJoknfVdY5wpRcDjTYlLMzplQK7LOrIs+d/Sd2
         YBKBQpZUKctBYrs2Sqd4sv/RFML6YroowxvJQrfs38OWLRSU2RTQBKA4zzNV1GoGugjp
         5MNczz2P+mU7cPwqYvaaUvK7OMWDmaam/1bGUBf/ZvEAFgr6Kjhx50ecGcLN2SR7E4P2
         jOlSTDQH5KOH9Fl40+Ntd2hDO1DRcPqo+2o1tsQCh57ZMLk4LAuZas3M3skhpE4kOAut
         T2/A==
X-Gm-Message-State: AOJu0Yw1XQPxEsqog0XPacQl8II/A93A37EO2t9hdXHiUwE9UfUdgbC0
	Tg/1FMYvsWRArfhiabDAuHPFO6DxfqwLlkmzDZGg3efRbbSzYTLr4Ciq7P9MPPG2jG3NbFVllry
	UonqF
X-Gm-Gg: ASbGnctsDtqQ0D4AJ1tYa+89iDVJByVue6wjw6Roi0XJ+v/6Ho04CX6SuAOe0TzEJk5
	Kg5eIMxSFK5jnPO1hPE8u4FuK8APLaQoJYIkpWbbGLXl1MKqp/cSOQzjeYV9AKVrjfc0gTMgzII
	GufAVI3ZwpaFaWjArXLuc9bC8H7gY4uLC+HBG5XQ2MKQoIFBnmYj2fsGMg/GUa4HFHHd4Uhf6Uz
	EWqtgcmnhem5DGEb5m7ErL6zGHRvOw+FW8ddNizfMHzd/ZwYxYu4B1vGnkngB//93o5WRH5pHDS
	siiH6Xfq6WpPhFTdBy9K8+hUFMQgd1u7+caY5GQe9xd4Jz/kal+9Aw0W4n0awOSPX8tkYCOJgq3
	kAhbdxOMy//fswDXard4WmOfESZdS+LaOyx1WcgD0mlb4CENYlOPv5V0+ucq3vlfwbLuZsbTgVw
	fn537x719xM9ncWFN2yhpTsuE+OPaeh0r6uSmzXpF9u1O4hwaagvTnISCFzg==
X-Google-Smtp-Source: AGHT+IF4TYHrIEgkmddR7+xtO1rH2Mqd0nhpy5rvdl31+jv8Z7uOiLY64hB4Mv3gM7U6df3X9hagrA==
X-Received: by 2002:a05:6000:4006:b0:429:cce9:9b76 with SMTP id ffacd0b85a97d-42cb9a5595emr1138422f8f.50.1763615071113;
        Wed, 19 Nov 2025 21:04:31 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f3635bsm2983069f8f.17.2025.11.19.21.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 21:04:29 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 20 Nov 2025 05:04:29 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1733050262.3851.1763615069939@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-22-init-14314-g3c52f536902b: Failure on
 arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3850_1023125889.1763615069145"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-next-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_3850_1023125889.1763615069145
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please fi=
nd some details below.

In tcwg_kernel/llvm-master-arm-next-allmodconfig, after:
  | commit llvmorg-22-init-14314-g3c52f536902b
  | Author: Tuomas K=C3=A4rn=C3=A4 <tuomas.karna@intel.com>
  | Date:   Wed Nov 12 12:24:23 2025 +0200
  |=20
  |     [MLIR][XeGPU][TransformOps] Add insert_prefetch op (#167356)
  |    =20
  |     Adds `transform.xegpu.insert_prefetch` transform op that inserts
  |     `xegpu.prefetch_nd` ops for the given `Value` in an `scf.for` loop.

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
  | 36179
  | # linux build successful:
  | all
  | # First few build errors in logs:
  |=20
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
  | 36179
  | # linux build successful:
  | all
  | # linux boot successful:
  | boot

Used configuration :
 tcwg_kernel/llvm-master-arm-next-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-212=
3. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolc=
hain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<=
--------------------------

The information below contains the details of the failures, and the ways to=
 reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-ne=
xt-allmodconfig-build/411/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-ne=
xt-allmodconfig-build/410/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/LinaroLtd/tcwg/ci/i=
nteresting-commits/-/raw/master/llvm/sha1/3c52f536902b1f4096e25e0e73bc3c263=
55cbf40/tcwg_kernel/llvm-master-arm-next-allmodconfig/reproduction_instruct=
ions.txt

Full commit : https://github.com/llvm/llvm-project/commit/3c52f536902b1f409=
6e25e0e73bc3c26355cbf40
------=_Part_3850_1023125889.1763615069145--
