Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED9023CB
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 15:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175731; cv=none; b=oZUxCb3hl9INZQlAlwMVwQ5S6XbsmIQ+58RlRxFsOw2+gzHLS6jexXjDnj+Z4j2EaqZEW1gKxaItmLFrE8j3W0QRCELy04o+B7nSYn1jtEIVmr7s2c+V2YBx1ZYlnrfrPqajYa0za/D5wGXELYXbFNAICBOiA2QLkeAYmP8ss5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175731; c=relaxed/simple;
	bh=RCZBkLxtPdDnFzR2+EBrHe5Lcgn0EkS3WGLsgnDQl8k=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=AyuqAMjeZY3A0A4k0iCu4dMmLBoqO/ZFfFfG5wkMPrN4TFDVobsj3WmkRitW0eDzSjAqA2U6d+DdUGnWIppaoxWcUnFfh8UH/59SpQUiZ/fzVmT6b+wt0nxHfD89W7gqDIaIAL4P2//J3yHlW1cPYw1ctFZDldL5OJeOAVISDok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iHj3/4aF; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iHj3/4aF"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso6152196a12.0
        for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743175728; x=1743780528; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVPYur+nsO5lEOSpoFeVIx+n3Sx4vNWvc7Hc2RiH/QU=;
        b=iHj3/4aFiXvalYJvHPjoE3BITZHAtzbmWjY62Y3UO2jE8Z80Gww73drdm4EBn08Pcz
         fL+ymw4NdkQYcF1578Z6rXX+wKjVvwFhvNaLUga4kae0z5qqZ0j4kM/7d3tcG8oGSqwg
         FvoeEKpVdpJI6IMD2y7oy3YPP1r+7rlxjEjOy2zdXyCAqiqM+L5wPaYiiKiwNME415Wj
         QowFZjYtwye18AJdmBX3DIiB2pzx+Ov+yzzD2783fslwSofZSqEcYBf9Wp9F49UaJi1G
         rdNJZPJi3lD+1TiifusP516X9vzNXiMeYGIA60hJfchu8DVnjXeo+TCItL+gIGXiGq1C
         nbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743175728; x=1743780528;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVPYur+nsO5lEOSpoFeVIx+n3Sx4vNWvc7Hc2RiH/QU=;
        b=P0VW8tGt3NrwS3JjR4bjjRyW7j174n6r1f2CTDG2iINMVrpKT13tEnNHIW3bEQ2DHJ
         hB2eg4/YgKFUihwe5ESO/DwDMWK1FVL2MLx7Rgpa05vKMcMZk1hcPQ+G3/jEeHI4MAHz
         9h2zz4QZyTT32y/d0y4afmO2q5fcy9Gd6hFN81OJyOqwZYGuPgeu2Vr5MAQhtGU32of5
         erVjCXEHklF187DAvzK4sJV6aDY2rjeCv5zfI8Wv1Dt8D0wIPDzRfaLOPFFtriEkJlSb
         x6KHNcEbaJoX/oAkYZKupurqjIa0ugxjK5wJRir4MUp4/8PDZcewZLF2HAEhxynMqvAV
         lI0A==
X-Gm-Message-State: AOJu0YyOKcNsYzB28CvotIQ9/6dncTqG+8U59ZKAPYvo3/eZUK9T9HRO
	JOnkpQMHy3KOM4zjRpSIvV3fiw2Cnsdty6wVc3aP5qJEWb5sFYfI0iws+P1dWVrygbmjYi+px8Y
	R
X-Gm-Gg: ASbGncu43vio04wnv2QVVYUhB327rSI3U4r16HSr+YgCQpqsj4r+UMu009sDWHsYTNM
	CumZDwuxrtL+ZYPQuNq5YlBko0EeqCExZ3NhH7deFLeHcEKevwINU9eRnc0XAVt5kFhzIek8F5E
	B9zx5yJ53VbOR2W4flj+epYssIt4IFUn1UV2cXhA1UYHJLf6B5NM9lqBHs8CVwb3Pf1BRcT8IFR
	EQJEKo3E4nAW/SN/aGXGnlDcAF5QnHmjbmfQcefP1VDvCxgU5qDFusoXtzOMrOR78cP/2zF6Y7Y
	Im8gsqWUESZkOud8X+gRJnp9lU6ydmkMEYW6uRsPQRG7O/kF3ZALSs7uZpyNyNqniR5cPRtt7g5
	Ra6dD7F6ORkN0bmJc
X-Google-Smtp-Source: AGHT+IGIaGr3uCQBqsXftV52gdlcxWrkdktODXGQ7vP0V30W2d+PekJ0prIT6oQAU1U333J8nwRKFQ==
X-Received: by 2002:a17:906:c08e:b0:ac3:4228:6e00 with SMTP id a640c23a62f3a-ac71f3a0855mr297542566b.6.1743175728269;
        Fri, 28 Mar 2025 08:28:48 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac719278259sm177200266b.38.2025.03.28.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 08:28:47 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 28 Mar 2025 15:28:46 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1405005597.178104.1743175727731@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-21-init-6198-g9694844d7e36: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_178103_1172743860.1743175726925"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-stable-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_178103_1172743860.1743175726925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-stable-allmodconfig, after:
  | commit llvmorg-21-init-6198-g9694844d7e36
  | Author: Henry Jiang <h243jian@uwaterloo.ca>
  | Date:   Mon Mar 24 09:49:31 2025 -0400
  | 
  |     Reland "[Transforms] LoopIdiomRecognize recognize strlen and wcslen #108985" (#132572)
  |     
  |     Reland https://github.com/llvm/llvm-project/pull/108985
  |     
  |     Extend `LoopIdiomRecognize` to find and replace loops of the form
  | ... 12 lines of the commit log omitted.

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
  | 25985
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
  | 35809
  | # linux build successful:
  | all

Used configuration :
 tcwg_kernel/llvm-master-aarch64-stable-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1645. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allmodconfig-build/283/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allmodconfig-build/282/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/9694844d7e36fd5e01011ab56b64f27b867aa72d/tcwg_kernel/llvm-master-aarch64-stable-allmodconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/9694844d7e36fd5e01011ab56b64f27b867aa72d
------=_Part_178103_1172743860.1743175726925--
