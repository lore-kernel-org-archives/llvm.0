Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3F51D63DF
	for <llvm@lists.linux.dev>; Fri, 24 Jan 2025 06:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737701755; cv=none; b=ixbLiTI6fwvPyOmUg7ht9bFON8f+68dBoNhcL57tXRU1kQIPRo0QYM2nW4Ld/uJuLDaO7whvlLZ7QU8FCVbnz+XykVyvRWuVSYdFEzGl7HBjPxzE7jPjooQVUxTDSpntRNTf2o4S9dsKl45qgc0jbsu5WnIb8apYxWFAZVkG9VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737701755; c=relaxed/simple;
	bh=ls+BeRCZDQi1XiFr61P4XIFHkH/1JGnfzWYbzrx9Uvs=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=qJ61Ue5bZYM49sg5qYtEOLv4QMl4/EnHvJMTthQzgpWA7xVPOB06/3XnNHYwY0Oc4MaxBkEGfHrBhYJD9MET2l3H3UbpHCVPUGccMCuCYMMaCke5RjriFYfEC5mc6oA0yeP3SS7eci8P2ImoLjFCiZne1kUqoJLb3wJ3lYS2+dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JADS7tYb; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JADS7tYb"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso286718866b.3
        for <llvm@lists.linux.dev>; Thu, 23 Jan 2025 22:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737701751; x=1738306551; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ulif/FIHPd1uMr+p9fzpuOnM0UJf7ZLpEbe/LiJzE/o=;
        b=JADS7tYbSoS3DWkoyb14W4xcUMsAsdo2IwDl/+MbBGva9eQNIjTOZvBAiGP5aWrYM5
         uTPSUgA4OBKJEZKLkr7EzmFAYf9NywLylLOg1oBofq02EhRd8ZqK2dPq9fNLuuJir9Bf
         TJfgP+9sQ8g0bLnBbV7m/GWPUqq9XfGrUbX8kgMzHy2pHeAniJT7ixRNVVpEij+STosd
         8mdjl4vytz/IRWiYcTUkZhaDHC6nHOUtnL3USBLB/tWZTYUhLNUxAY+puwQ0ahIb8XqU
         OxQBeOpuGmghDntUnr5knttgg4KuOe88NTCmXhdEoLobh7sprite34+d4fXPnh6vAVKg
         9wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737701751; x=1738306551;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ulif/FIHPd1uMr+p9fzpuOnM0UJf7ZLpEbe/LiJzE/o=;
        b=UuMlZDHEmQtQ8dMTEsDt3a0YT8b0T94scSrtCVPBlZK7EFvFZIMvK/OeCmQx7yHa0v
         nwnY0xIlAAseQfhp1k+T9Vgj7Pdkue5cVpRFvUyRbuUjW1VDKunUCcxRYLQPJh2l2D1y
         kmWJBy1il45tff2/lI8qGicBK+8rgCq4Qy+Wt5DFRWG/R4x/LvZzf6KwyqIp6u8qPbCN
         gy/xqXt7JkmIoJ1EzMet19VUOb0MwgRL4ZJX6qUlHDfBCt9NcVcjAgHS9h6racJZKCkF
         pYlSCzTRBGZoQNLBL1yUiVxPsoiczcYFzNtJE9zPEvwnWm1dCSgy0Cpdh0UWJhDWVcaA
         lK/w==
X-Gm-Message-State: AOJu0YxAGLJHDeYFT8MpWZcNxThbk6ddvytP9wvJKpABuMTYOMARnnPx
	iW5MN40StWNGDS/8t0t1rDQ9UHuG3Xbbq8A1ZMTRwQ9pIPkCDtU+x+oJGtLOoLZFXST6x7I9Aaf
	Z
X-Gm-Gg: ASbGnctS4GXCdTWT+dmPmjQKoFGZZtiFwOlFT34zPTPq3+r81WRG2KS2ToOIfU38DbL
	z7WuK63QsyKRREaIRV5WlI9HHUDLbId/OrrTz0lW3hUUBi2joA7KzXeb3FnQfdZk5Msqc54OXIZ
	fzWEZDgMPMiGGdwMWgwbEWeNx8p3HubUEZMEe2vFYXcE3cI+ZCjvZlMXIlZjClINEKbc8F9gUuG
	T4K3umnrHfWTpXu3GcSG7sj9VoWyjLOL9rocGQwfErhQ/6u+YP8geyTmbqr2yjbezb8y1vj/FuH
	yHbGIIL9NRRhoQSHOWiixzMCzzY43LvwEjestF91omiSafoIYPEo
X-Google-Smtp-Source: AGHT+IGUVhzMJd65XzsY7w6+UuCEmO1+z+nC6QZOEIFJMbHG0/dHKyIDrCdZuBMReuu7WKwwMYwU5Q==
X-Received: by 2002:a17:907:930b:b0:aa6:a9fe:46e5 with SMTP id a640c23a62f3a-ab38b3dae38mr2932385766b.53.1737701751281;
        Thu, 23 Jan 2025 22:55:51 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e65f6asm79685966b.67.2025.01.23.22.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 22:55:50 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 24 Jan 2025 06:55:49 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1238599551.120293.1737701750619@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-20-init-18802-gee99c4d4845d: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_120292_1501246152.1737701749787"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-stable-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_120292_1501246152.1737701749787
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-stable-allmodconfig, after:
  | commit llvmorg-20-init-18802-gee99c4d4845d
  | Author: SivanShani-Arm <sivan.shani@arm.com>
  | Date:   Thu Jan 23 09:46:59 2025 +0000
  | 
  |     [LLVM][Clang][AArch64] Implement AArch64 build attributes (#123990)
  |     
  |     - Added support for AArch64-specific build attributes.
  |     - Print AArch64 build attributes to assembly.
  |     - Emit AArch64 build attributes to ELF.
  | ... 2 lines of the commit log omitted.

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
  | 40
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
  | 25849

Used configuration :
 tcwg_kernel/llvm-master-aarch64-stable-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1530. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allmodconfig-build/252/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allmodconfig-build/251/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/ee99c4d4845db66c4daa2373352133f4b237c942/tcwg_kernel/llvm-master-aarch64-stable-allmodconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/ee99c4d4845db66c4daa2373352133f4b237c942
------=_Part_120292_1501246152.1737701749787--
