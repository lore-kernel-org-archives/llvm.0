Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D213666B
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 20:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706214060; cv=none; b=r7KNXRmKyRNYHrh1ddCtRRrPbw0f1HYxJSl3UOXyMyh44OuoixxkmeX7RzQSAyuFluPBsVicB9bBOjl0pPAA6hm9V/dWZwfiW8/FepmzzGp+pjtMZU97fF4ApfJstWo0QlDhBUNllAT9AwH4yZRpAMRbI9ouQL4ew7czLjCmFMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706214060; c=relaxed/simple;
	bh=41pX8WDfT98rbW2PTyuuL9xOxM1qAPDMOLDL63eAFi0=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=LmalDTkfDA8a024r4eLfcHrYRFSTNwKHx6eDbkuXwYB0AxG0d32CVzhVrT+f/N5KBMHvtnh4SsjEym3v2lW/ZpWWa4aiAso/3KimoWT2wX4lo/uzMvhFRFUC2e1tammwiD5b4KXzvYKdEM0ngRDdOMCffc0UJfAujiqyZkdEj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nQODE8xI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQODE8xI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3392291b21bso6056389f8f.1
        for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 12:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706214057; x=1706818857; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y9beJv2v4raxYe/GS6279IBEXFR45U3B/2vOfg+otCo=;
        b=nQODE8xIi4d4t0dMhMAgEMsE6BTV88T30aDnhI4lorJER7RhOxsR53ayPnzAyRU3lc
         /ycr3gSYhEhOhlwqq3UPWN9Z2xbJlq4VCMx4p6ETFPuXquyDir1D710aUD6orIkcURPr
         BhQUJbdaLTqvgVNAGrJdD+HDsdasjv7cObkTypcUYEviPbT+KOMV16QHAHygooo3Lj55
         cEdU21uulXv/Fx4QkwxqtXLAQf7o5XoZlB92ZrV3Ovu6CNZmoREoKroMJLSPk7KGEv1F
         UJ+zVgYJeASch2YQ7Dq7FCfOshR9JcCdAHsuuZd2VHkw1jMdsPkh/Qq2adDjL1EbfSmO
         5lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706214057; x=1706818857;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y9beJv2v4raxYe/GS6279IBEXFR45U3B/2vOfg+otCo=;
        b=bRpSYQHbs2ahwJTv/BBVn/C8+XNw22B/EAXu4remXCMVlDoL4vr33401PjaHvlG+Bg
         DCpQgbTMk6HbgmFwgjfoi3Wg09vqCGJogQA4BCN+jlI52Yi6Cul2QncavLA5PQrMPwlG
         AJrUB4WciuVbGrhyvh2F1296Tqu/6dCW+gU4s27OUQRCyN+/HNDs9eMVxED2Ph74PU02
         Hn6Af0OiXrNHoLGlqmFdppQda44JeoNybodF7aUE3IUtlQ/TljfQ6r34pCCjkwUMfxXO
         xtYaOHaBf/ihfg8jrMCbhD281GfeB5OWs4PjW0KY1AmPWYHJAeoSA/N3lj14OiNnaJ6L
         ZUWg==
X-Gm-Message-State: AOJu0Yyc9gKu1ZYz9tOkvUnONjIoXT5zQRCE33n6mG5SnLhZ0Zl+zZ0a
	5rlJkElbHxpm/6VOg8ebv2gsVS8znPx3ly4G02NXDZQl1ClEB/NwesBuSElP3OOZ3fOnOSfn96U
	c
X-Google-Smtp-Source: AGHT+IGetiMM3gfcOAaPbzlz7WTbuXWrEERYRd3FaXKTJMmW8weDfxyPN0D6nwAYSav1RUP03AMKvw==
X-Received: by 2002:adf:ce09:0:b0:339:35e7:ec2b with SMTP id p9-20020adfce09000000b0033935e7ec2bmr189488wrn.58.1706214056827;
        Thu, 25 Jan 2024 12:20:56 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d6784000000b0033940bc04fesm7305510wru.16.2024.01.25.12.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 12:20:56 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 25 Jan 2024 20:20:54 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1845612181.12064.1706214056026@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-19-init-59-g90ba33099cbb: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_12063_249272126.1706214054894"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-stable-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_12063_249272126.1706214054894
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We appreciate that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1105 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-aarch64-stable-allyesconfig after:

  | commit llvmorg-19-init-59-g90ba33099cbb
  | Author: Nikita Popov <npopov@redhat.com>
  | Date:   Wed Jan 24 15:25:29 2024 +0100
  | 
  |     [InstCombine] Canonicalize constant GEPs to i8 source element type (#68882)
  |     
  |     This patch canonicalizes getelementptr instructions with constant
  |     indices to use the `i8` source element type. This makes it easier for
  |     optimizations to recognize that two GEPs are identical, because they
  |     don't need to see past many different ways to express the same offset.
  |     
  | ... 14 lines of the commit log omitted.

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
22291
# First few build errors in logs:

# 00:05:24 ./include/linux/fortify-string.h:493:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
# 00:05:25 make[4]: *** [scripts/Makefile.build:243: net/xfrm/xfrm_user.o] Error 1
# 00:05:32 make[3]: *** [scripts/Makefile.build:480: net/xfrm] Error 2
# 00:15:32 ./include/linux/fortify-string.h:493:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
# 00:15:32 make[5]: *** [scripts/Makefile.build:243: fs/smb/client/cifsencrypt.o] Error 1
# 00:17:12 make[4]: *** [scripts/Makefile.build:480: fs/smb/client] Error 2
# 00:17:12 make[3]: *** [scripts/Makefile.build:480: fs/smb] Error 2
# 00:19:02 make[2]: *** [scripts/Makefile.build:480: net] Error 2
# 00:33:54 make[2]: *** [scripts/Makefile.build:480: fs] Error 2
# 00:41:46 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_1/linux/Makefile:1913: .] Error 2

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
22292

The configuration of this build is:
CI config tcwg_kernel/llvm-master-aarch64-stable-allyesconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/128/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/127/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/90ba33099cbb17e7c159e9ebc5a512037db99d6d/tcwg_kernel/llvm-master-aarch64-stable-allyesconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/90ba33099cbb17e7c159e9ebc5a512037db99d6d

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-aarch64-stable-allyesconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/90ba33099cbb17e7c159e9ebc5a512037db99d6d/tcwg_kernel/llvm-master-aarch64-stable-allyesconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/128/artifact/artifacts
------=_Part_12063_249272126.1706214054894--
