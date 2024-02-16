Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADB71350C7
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 19:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708111716; cv=none; b=E8hfkMB4M9PL326u6RePvLQ2y0EKwLaXq/nOfC9ZA5fM+rxYl8yNz3Bm63nXYZe+QjGnrGh3XH6KQKP8zKBsfiAOaLAGahyDI6dSN6mG7xtHSFjUfEpUN6FxwvdSDyvV7LSQ+Re5ZFgKqQfPgEh13PAzz2Zk7mrYZvNFGmDkfRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708111716; c=relaxed/simple;
	bh=yIdkjjhlnq0V2YqP35lCylOPdgwAG7jHVS1txaLQjpU=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=uN2JjFLT/auDMUu2oQOMxFetIqWnmHM1rZpeWZXavDNYF2qhGk/xY7N2sMSMBuk/kuaYb2fOzOJFmrw4yPyJhCh8TpdsEQk6Tg9LIqUeZQF2ydHYY8IYMfFHeozbd5n5G48cz9SxhODI8R/gIeB+OgRUYmZimnqPZVaAzG87fy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WZUsKk+u; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZUsKk+u"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3394b892691so1599758f8f.1
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 11:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708111712; x=1708716512; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H3YJn4FcnPcgxqBeJlZpypeShY3FOuwcuzGIAMfitGI=;
        b=WZUsKk+uni+x6Uahs9UPcFs0hA4weyfOEhGIMr57cbfdrII7wuwy4rahsm0oPGfHlI
         +ZBKNnPQIt+DPfkfXgLL/ZA6RNgX3on4V+ZpzQD3mx220XqdOkPF7Dbqurxg3et+unHd
         DRa1zlMzkgo3HEW9qqk3Fn2T7y+pGvgF1Ts6qFEZR+dE2O72GEJ532NYN1KnRMbfOGYn
         GYuHdZ132U8d3Cl++Vcy5pWf/aHEItTqbNCvMc0Lt5TsG45qC0CSId1A22iH5FO3AbA7
         JoO+WUP5a4dKptN0YXP1LMQ/FTVhsUr7JpeswNERnvHRyP1BuKqA/Vs307vMKIlFsV+l
         7h1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708111712; x=1708716512;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3YJn4FcnPcgxqBeJlZpypeShY3FOuwcuzGIAMfitGI=;
        b=QRfo8+9TVz7UxYpFD1uWtdpdljWZcqLnAtnz9pvKzQrtV7+2Dhqc0ZLQhIHdDaVJvd
         TE5dLtprx8R4rs8e1/DOxaaC9lpUyMmAyhaKMwGqFgWXkS+7tPSZ4MDzjmkT3pugk4HB
         ndTp0SowH8jrvwkkpKaobSB2ypiPciSiHe+DARdsbdGRHuXnwlKuliNN9Ha3lWxX6haz
         31S6ZH8VqYWslsCwUr7A2B2HRYZDNTMA0zBL11t3kFvRb2b3T1tSFfr9xh7lwvrlHQTT
         WtV9XWwBt6ZEFxIucDt++hN/nbKgkFhVS4/9I00oqH8tk17za0gJCcr+BW8w6OkAJCsN
         Ox2A==
X-Gm-Message-State: AOJu0YzEsbDMn0voWgHAh2IpIxOlicm8am6FUpc+TcMTXWOYpta9Qui6
	fyI9TB6kAFgU+QuaAvMtMdUmW2xw4rOpouKpuOLAEbVpXBJMGrOM7jh8r/Ki60lVHsVtCa14ErJ
	p
X-Google-Smtp-Source: AGHT+IFp15FhVOUlHatntaY0T0vUGengaenPeXq3U6EG6m4penbseDFzKA9SS247L3fiCUq3lu9NDg==
X-Received: by 2002:adf:efd2:0:b0:33d:201f:ea9d with SMTP id i18-20020adfefd2000000b0033d201fea9dmr2108140wrp.2.1708111712492;
        Fri, 16 Feb 2024 11:28:32 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c044a00b004122fbf9253sm3114516wmb.39.2024.02.16.11.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 11:28:31 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 16 Feb 2024 19:28:31 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <50916757.18748.1708111711932@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-19-init-2410-g9cc98e336980: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_18747_175492600.1708111711158"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-lts-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_18747_175492600.1708111711158
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We appreciate that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1135 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-aarch64-lts-allyesconfig after:

  | commit llvmorg-19-init-2410-g9cc98e336980
  | Author: ostannard <oliver.stannard@arm.com>
  | Date:   Thu Feb 15 12:39:16 2024 +0000
  | 
  |     [AArch64] Add soft-float ABI (#74460)
  |     
  |     This adds support for the AArch64 soft-float ABI. The specification for
  |     this ABI was added by https://github.com/ARM-software/abi-aa/pull/232.
  |     
  |     Because all existing AArch64 hardware has floating-point hardware, we
  |     expect this to be a niche option, only used for embedded systems on
  | ... 11 lines of the commit log omitted.

Results changed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
22071

From
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
22291

The configuration of this build is:
CI config tcwg_kernel/llvm-master-aarch64-lts-allyesconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allyesconfig-build/135/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allyesconfig-build/134/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/9cc98e336980f00cbafcbed8841344e6ac472bdc/tcwg_kernel/llvm-master-aarch64-lts-allyesconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/9cc98e336980f00cbafcbed8841344e6ac472bdc

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-aarch64-lts-allyesconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/9cc98e336980f00cbafcbed8841344e6ac472bdc/tcwg_kernel/llvm-master-aarch64-lts-allyesconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allyesconfig-build/135/artifact/artifacts
------=_Part_18747_175492600.1708111711158--
