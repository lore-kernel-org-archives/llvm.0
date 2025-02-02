Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B333288A5
	for <llvm@lists.linux.dev>; Sun,  2 Feb 2025 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738492224; cv=none; b=TQVCT6L9Xzwqly0p8Ma3vU+PLf0avPBWWes33J3F6IdsAI1zUtiraE6dfyzVCRyVcdHl6nRssu1zjdPOnUn/0zJliZXoFkH45avrzJ8pNfe5hJl0eH9yJ8kxoFtJX3xl26wLFAafLjr1VO+nhCfrRqQK8KkICadNXIqQrVOVb8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738492224; c=relaxed/simple;
	bh=SmO4ukMEUk7kDV/UEd21BcjWZX5Cg+wqDf+7PUbNZFI=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=dCyZbEMOVkmECeB1SHjfDJd7HSIXqQlbzrLCliwW8fb5Pb/iRZsdC8nxjIJv0jomrNyb99/FDOQ5e9wYBuaiofMIqs4XxkybtfkC29LpLr96KxZ2uxehAYdUh5M5MHzCh341qR0tdPmsKAoif8q2S2uzwQJXy8QXD9qUpUFMBaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6tgdYnh; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6tgdYnh"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso4873534a12.0
        for <llvm@lists.linux.dev>; Sun, 02 Feb 2025 02:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738492220; x=1739097020; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0uIhTJvHUJM+LAbjfQ7ED9QfD+kzQdDwtyXq+Wx38Q=;
        b=U6tgdYnhtToxFCeb+8ditVms2jFqZx2cBvzL/xYS1JXV28yw7YDmMrT7FM5/HALm7M
         hgJCx1/tvhXOZa/zgIbWNTC09ZNOSbFKTtOEebJPvvLh/H2XbqdtiQH4cQnwtYEwNYsF
         soj7QvZAVB6RWMJtSuNgygLe6cuiJtPCvkK4A5gCAqnXuECzn5H3AHIBpG4p4D+dzbew
         v6a6pr7C8+ODmiqk47ed24uFY9JlbyeILldtVKuw9fxZbYBgtxNi64t6kcKgSo6kTRMp
         QC2sYnRt4P27DXghOh9BsFdaWMq5OKdcwbCvRuvI40dnTGOut4ak5DzBNfSKf9Kp0v81
         msdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738492220; x=1739097020;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0uIhTJvHUJM+LAbjfQ7ED9QfD+kzQdDwtyXq+Wx38Q=;
        b=eJmfF36jE9rg6I2l6WRRrmi17vF5iLTdmvamT8FWhewr4/9oldK5B2Kj2jzHwHb/9/
         N/znFZnV0A8pWEhHCJOxQ+cfB7l0ZA2RloVEa2qlAATVxv24vkOh3O+deFdh2pOBBHJp
         djhwehhD15zPE/QPupxtHDpxPgMUiG8hW/dZ4JPAKI+B2doasZ5IfdYpEO938ZhbbFkN
         Dewqk5t5YDKmTgsphWkRopRGtzVfRu7gq1s6fXDObulwLRwkaLPhaxts7phvHQVZxFlW
         D5V3hSZqrJBuFlfWpk6iC5Fhy+T9av1QVo4bBAM5Ud5oLLfFAWivGzta3j2F1WCkHWTM
         RlJQ==
X-Gm-Message-State: AOJu0YyvlDYw45mntwxQHzmiUW0lIkmYUIXdfA17TcjGAmfb0DV6Hdss
	Yb+eM5FlV05BMeRJ/o5o5ItcmtB7NkPKNuACxEG18EMdrRHwURXqhSZ7kiNscHulzK1TSxd67B9
	O
X-Gm-Gg: ASbGncupbV0BLKKbC/zTGQrXxrDUEQ2M91uCvTqmgnVHn9XQtZbn0MmPGDXM2qebeJt
	2zxYfJt/hIbKAvwNm0HoyW+Hh8y5zTGTx/qNcLI2RhFryXSpBCQGweQnhglvChD2zmjXBtgZnVE
	VQAL6DdhU+FpZZr55L9ms0A1OhQfMoYheq3NfFXWdQTfOVwwQno70KXG2RBOuvfXxujT4ej61wa
	BW443SvTKjyV6scbvG2Ac2tqsS86Jb4rII0JLrmqhMYSfbc6Z04O96WoNksKC9oowTuemcQuYdQ
	Hi2mDvTghFvWVBQhLxT3YbOahovYEA6o80cVo+EOju983se7G/5cbCTt0nhfB+s=
X-Google-Smtp-Source: AGHT+IG/mah3gncmao7XKleXHTKp4js8ILyW0jiMzTELJqA8gRRLJ0YdNPt2c+e7Uex8bnX4XYevVw==
X-Received: by 2002:a05:6402:510f:b0:5dc:5ada:e0c7 with SMTP id 4fb4d7f45d1cf-5dc5efec13emr50173569a12.26.1738492220196;
        Sun, 02 Feb 2025 02:30:20 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7fc2sm557929266b.37.2025.02.02.02.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 02:30:19 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 2 Feb 2025 10:30:18 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1599984364.127113.1738492219737@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-21-init-262-gcff0a460ae86: Failure on arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_127112_1888833574.1738492219105"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-stable-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_127112_1888833574.1738492219105
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-arm-stable-allyesconfig, after:
  | commit llvmorg-21-init-262-gcff0a460ae86
  | Author: Bill Wendling <morbo@google.com>
  | Date:   Thu Jan 30 15:36:13 2025 -0800
  | 
  |     [Clang][counted_by] Refactor __builtin_dynamic_object_size on FAMs (#122198)
  |     
  |     Refactoring of how __builtin_dynamic_object_size() is calculated for
  |     flexible array members (in preparation for adding support for the
  |     'counted_by' attribute on pointers in structs).
  | ... 86 lines of the commit log omitted.

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
  | 22473
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
  | 22474

Used configuration :
 tcwg_kernel/llvm-master-arm-stable-allyesconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1541. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-stable-allyesconfig-build/233/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-stable-allyesconfig-build/232/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/cff0a460ae864505bc2a064c269ebe548aa35949/tcwg_kernel/llvm-master-arm-stable-allyesconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/cff0a460ae864505bc2a064c269ebe548aa35949
------=_Part_127112_1888833574.1738492219105--
