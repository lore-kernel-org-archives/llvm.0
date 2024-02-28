Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FE115A499
	for <llvm@lists.linux.dev>; Wed, 28 Feb 2024 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709131639; cv=none; b=quzV2jkA7c8OTXkB3lvPaYZlW/WwleyUVz7TIlNcyCQyDvBjtBPAyJkfjp9LdL1UVi4ahkoJyH4L2YTN1VOrnMaiuNsKAA7+YEBdarQPLyqJNZIV2Sh90LDnCtkuLCGrUlmww4cOppHBBELcLP8PEOnMcX99iI9CTt73TtnI4xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709131639; c=relaxed/simple;
	bh=tjYtsAGgVlu1djY/wB7YhHuAgT4nVEZ9+H+SgqgNjMY=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=RbxIlwx1Qh9F/6J/6kGRH1rAdB5Tnah99DUBm3sdve0ewgPqihyKPhs8MRml5jx1IaXRiPs5m/DlUauc0pbmoW9U0FEg+cZ8Lam4DDDqArJ9MpS/XcsKL4Evjb6QiyKVpkVgLgn7ivW/w41tgjSoD2HVUVX/LwbrcXdDUicUtuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tj4a0yNH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tj4a0yNH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33de4d3483eso1900134f8f.3
        for <llvm@lists.linux.dev>; Wed, 28 Feb 2024 06:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709131633; x=1709736433; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UJPb5I4c4BjnHDVdbNIuFbrynsu+HJLRoaHK4VpW1Rw=;
        b=Tj4a0yNHlSfo9ithwMYcsHc8SeaR+8KDE6wMsvFVhM/c3zBE/cBxaIgejztyxqGhLT
         M8ddcNp6/z4bd6B0nRLLwWy2L/hHiXXNucFMGYjOd5lhWIEArE1pySf4JZF2l8egUaZU
         XSwhmsD8HbnoenyNjdHW1xV7seLHKoOQdG3Wd+Leowiezz8zJmsjvee9FUTK4GBukhZk
         MYokaOBrjtpv6LwqinJv4wy4AkjA+KUIBWdZUNr/2Zwxh1noaIniOqZUWWTECgNexoZD
         jkaY57ZnMYS2uHmaEyRXDueQbtx9H+9oF9zP5ZzARatxnk4CDnbXEdL80bzmo3tujrkn
         37Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709131633; x=1709736433;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJPb5I4c4BjnHDVdbNIuFbrynsu+HJLRoaHK4VpW1Rw=;
        b=swPYhX3GYUUytSG4vEzAboqmisLHFZt9UZd3vfafOcP46K0T6EHo1Ge1mc7kzo5H4p
         60/UbsX0CRFcQeHe1WHtxFtLTXFj5LAlIktpytKtV/1JMQsap9QCz/ibirYS/2qwanS5
         PcbvYXb8P+Pht6TNNU9QZ3Cb+PwhK0eoA+yMqPSEfiM0rbhPQqrLGSGrNCr0tav9FN3I
         r4YFpVn3La9duVldTprjzGuLfyduwVNBk1R+0D7PqzBGJdHvOwYMh9p6x90kQMaHTbbe
         7Ttk2u167jOlNb8FeX+pgEVvzKNOGM5QBKNXGyKyrl9pUCEeS3uvsdRBIX2VeVFkpJbA
         mdQA==
X-Gm-Message-State: AOJu0YwVMzKZ9Y8OwA0snTCitphCe6r6PVqAJiWO2LjmGvGqys2rES9s
	6YJgkRrpSFbM19WzbCStmTM1VXGSQjxKu6Bvhv2snZJt0nM3JHs0ZFoERp3ZullYprosfKnt+sm
	v
X-Google-Smtp-Source: AGHT+IGzFpjWYbguqz8rWUie8IMJUjAcmkbZhBV0PRSgHXT5z6X1xkEFp5DqHH6bDyotBuLbAQnW7Q==
X-Received: by 2002:a5d:6b09:0:b0:33d:c5c7:417d with SMTP id v9-20020a5d6b09000000b0033dc5c7417dmr8627323wrw.43.1709131633560;
        Wed, 28 Feb 2024 06:47:13 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id p1-20020adf9d81000000b0033e0567e90bsm339305wre.5.2024.02.28.06.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 06:47:13 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Wed, 28 Feb 2024 14:47:11 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1103948202.2736.1709131633065@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-19-init-3481-g8c2ae42b3e1c: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2735_107174314.1709131632276"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-lts-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_2735_107174314.1709131632276
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear contributor, our automatic CI has detected problems related to your pa=
tch(es).  Please find some details below.  If you have any questions, pleas=
e follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #li=
naro-tcwg channel, or ping your favourite Linaro toolchain developer on the=
 usual project channel.

We appreciate that it might be difficult to find the necessary logs or repr=
oduce the issue locally. If you can't get what you need from our CI within =
minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-115=
3 , please let us know if you are looking at the problem and/or when you ha=
ve a fix.

In CI config tcwg_kernel/llvm-master-aarch64-lts-allyesconfig after:

  | commit llvmorg-19-init-3481-g8c2ae42b3e1c
  | Author: Kupa-Martin <84517188+Kupa-Martin@users.noreply.github.com>
  | Date:   Tue Feb 27 11:58:59 2024 -0300
  |=20
  |     [Clang][Sema] Fix missing warning when comparing mismatched enums i=
n =E2=80=A6 (#81418)
  |    =20
  |     =E2=80=A6C mode
  |    =20
  |     Factored logic from `CheckImplicitConversion` into new methods
  |     `Expr::getEnumConstantDecl` and `Expr::getEnumCoercedType` for use =
in
  |     `checkEnumArithmeticConversions`.
  | ... 2 lines of the commit log omitted.

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
37

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

-----------------8<--------------------------8<--------------------------8<=
--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch6=
4-lts-allyesconfig-build/143/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch6=
4-lts-allyesconfig-build/142/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolcha=
in/ci/interesting-commits.git/plain/llvm/sha1/8c2ae42b3e1c6aa7c18f873edcebf=
f7c0b45a37e/tcwg_kernel/llvm-master-aarch64-lts-allyesconfig/reproduction_i=
nstructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/8c2ae42b3e1c6aa7c=
18f873edcebff7c0b45a37e

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-aarch64-lts-allyesconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/ll=
vm/sha1/8c2ae42b3e1c6aa7c18f873edcebff7c0b45a37e/tcwg_kernel/llvm-master-aa=
rch64-lts-allyesconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allyesco=
nfig-build/143/artifact/artifacts
------=_Part_2735_107174314.1709131632276--
