Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE642E370B
	for <llvm@lists.linux.dev>; Fri, 18 Jul 2025 00:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752797930; cv=none; b=CKcX9+81iG6ihSCX84UCiQstywDQ+eQHR/7/y75kIr7fkRCo+HHDAJ9ZjumHGkrYrM0s7EWHXhSFLFOZewhe4dQ2Wf/h4QJ/BG+2b1LXMHgyJYThOOmZB5QhFEhTmesV43a0uRY1VLWs6rMr/QQ8liPA23RmK0D9SuYPgN4/2C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752797930; c=relaxed/simple;
	bh=SnHK2YpDqbH1X5eGQLRTWt3yy67B8OnZ0pSizM5I7CA=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=DBc/emsyAY0GRH/lmgSxMYVwZk8xlr/C9c+FA8mTfj4p4GCpNsInmeg7TTfYxAnySDbueh85EPfSAmiT48/zswCO9yd2NqAUpMZFcAVsX6Oo5fxLptpjgaO7FEEA0iDteHfNsRMepVOQFpHdANh2BrfYr9RRJ002KYVzoyuh8+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q4plcWFw; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q4plcWFw"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so2524083a12.3
        for <llvm@lists.linux.dev>; Thu, 17 Jul 2025 17:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752797926; x=1753402726; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7VmB/pQJpe6V+Rwe1WZTBeLEJeQPiD97l5Otx01MAjg=;
        b=q4plcWFwxngS+xOe5J2dBRXtOoF2ledgIseCd2rydQAcLHw3/eM5HgN8Nn/RWv3n01
         Ljbml2bAP0MPccf6vyhHRRWrNqcKBdqNVXYpkuumgaEJU7z982+/fqMDGpurlm4yu0P4
         9Ax5dRd3su/odNyxLRgXX1IavV/eHUgRx3zp8X1i/4TSWr0vwFMHocXxduyAQu1iKQna
         Tli3Ou/P1WkTrX1kXT7qmPbOZwFo+Gau3fjklgrI95QGClvn/T5aKipP6R223HqdEJjy
         yWK8rzKAjtYhqUcHXLysGdCdNN+wcuBNYo7IOueeH2uHlIrJaKnBPP54z+g8MokdXuJR
         E0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752797926; x=1753402726;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VmB/pQJpe6V+Rwe1WZTBeLEJeQPiD97l5Otx01MAjg=;
        b=qez9CWv8RzrRwnSV8i+4lYXjLIssMQUMt2ymS+/WnwWb3PuNOYo7EjGALP5FTvE60T
         /6ZvhlJ9oAvUWqWu9DmtIYfVLI4Rks7X8+msbNThEohD0uv2WUKo/qUh/jxU/L5Q4bUM
         Sd8Au50+ac+v+Qqx/wG/r+ielvlFfZyodoRB7z/O8ILVBnTCZyVfsMlhNTrYfFxCzDiP
         zkmvYKyKwTNcZjTywxQNUg/piXmR5fi1shA8DU+vip2ZJiMxIHg6BZqw2Clx7DTzf8EO
         iFKxuAG1lSFBrEYoUlhgubgiX+tlGDW0fyaCstrCitWwwBOB6xPKJK3h4uoB6QtEp+BO
         buwA==
X-Gm-Message-State: AOJu0Yz/4wtlX4kjiW/UbOGZb/hPY0T+gsBKaEg1qI70Ph+TzC7qNnse
	ekbhBwPTjryZ30T+MJ/wsgTV00ydr77EeVK8j//xFQITb7SvkCEikmyY+en9SNBdyEqx+VaHUln
	b7gSY
X-Gm-Gg: ASbGnctAEm8ZlOkdGHauZZ0gaIkDFTUfGsW6EcWHh5Qgve4ksyUuPV1HLm86iZI1Jec
	eBh31jj44oBOq420PkggL5rRdviAbMY7+ChZU9e4Re8UsGDbY4s3UDoORFr8p4fqbW3Lx4AhqX5
	HCqudw1XU1w7vT9eFhwtrZ08A1D6kedfoywti2LwJ2NMsRrRGcGVXZEtaYbj3wAito0Jl9IHSDf
	zgL3Ayxbz9wqyLdkj40qaT7ASPGN4eUrkLP8St5OpM6UBT+YE8RsoeniFYRkzPTFdsj5/9C2b+g
	EiInUzhkonyYJvWJlrGs5DKir+RcMHXcx/DCSqGQDsefZskrZKCMddgCtGU3B/82+S72nd26y1e
	YjdhGUKFgGtqdQnIk7gywuTDX21x1HkofsXpkqwY09oE5jYJr9RY5Yxs6xr2lUJK3wUf+oQ==
X-Google-Smtp-Source: AGHT+IGsCddcQCHkoF/AtHioLTBVgHu7h7vb9aGwYRf6E0iXYsHXK9GlIdRrEraj7bUJTp8t6njX0g==
X-Received: by 2002:a05:6402:2804:b0:60c:397d:d638 with SMTP id 4fb4d7f45d1cf-61281ebe856mr7901581a12.14.1752797926517;
        Thu, 17 Jul 2025 17:18:46 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f0a0e2sm177722a12.4.2025.07.17.17.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 17:18:45 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 18 Jul 2025 00:18:44 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <2032695932.3605.1752797925051@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.16-rc6-80-g141fd174e6dc5: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3604_1345002347.1752797924402"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_3604_1345002347.1752797924402
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-next-allmodconfig, after:
  | commit v6.16-rc6-80-g141fd174e6dc5
  | Author: Kent Overstreet <kent.overstreet@linux.dev>
  | Date:   Mon Jul 14 10:35:16 2025 -0400
  | 
  |     bcachefs: convert super.c to CLASS/guards
  |     
  |     Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>

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
  | 26632
  | # First few build errors in logs:
  | # 00:29:57 fs/bcachefs/super.c:2269:3: error: cannot jump from this goto statement to its label
  | # 00:29:57 make[4]: *** [scripts/Makefile.build:287: fs/bcachefs/super.o] Error 1
  | # 00:30:46 make[3]: *** [scripts/Makefile.build:554: fs/bcachefs] Error 2
  | # 00:36:23 make[2]: *** [scripts/Makefile.build:554: fs] Error 2
  | # 00:53:06 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_0/linux/Makefile:2003: .] Error 2
  | # 00:53:06 make: *** [Makefile:248: __sub-make] Error 2
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
  | 36665
  | # linux build successful:
  | all

Used configuration :
 tcwg_kernel/llvm-master-aarch64-next-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1729. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/412/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/411/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/Linaro/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/141fd174e6dc5a3c294c3d64048cccb6270d5868/tcwg_kernel/llvm-master-aarch64-next-allmodconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/141fd174e6dc5a3c294c3d64048cccb6270d5868
------=_Part_3604_1345002347.1752797924402--
