Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7D841B361
	for <llvm@lists.linux.dev>; Fri,  6 Mar 2026 17:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817802; cv=none; b=t9M5CSmfu7vnpEO7d0NQK2+FeeLA9Wa35gpDTdqncf7DzLlqPvYikkrU/XXD1lOPZP1ZvfyCSSpPxd4YxXmtbXpnP4QCPB1TlT7rwBIWen7xvP03Y2hIhdKvDmVITwZTqwlYc8+zeMgUSM+ToJbyQ6DbSDOgVTRu6LyFAnyk+vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817802; c=relaxed/simple;
	bh=28PgpQjXpX06klA0+NZf+/j1U6ayzOO+y+w1rOpBpOU=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=WBWxO3CFVRRvNEP+YUeI8QnxtevqFuyioAvYCrAzy5JeKonY1F8iXtxqZdQJRLgcc/0CzsoqknUV82GkQ+e8GPYkC7hGwGOPQXQVk5fiJW8OBFJXolmPNT76IC4caLJZZJmplkOUL+hPs/1ShJsMUQqAY1Do39ubTlejncdr714=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Am/hurKj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Am/hurKj"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483bd7354efso124092895e9.2
        for <llvm@lists.linux.dev>; Fri, 06 Mar 2026 09:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772817799; x=1773422599; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJxRsyeN4rh2Hs6t770BtULfs11CYbEujdDpyg3thI4=;
        b=Am/hurKjq3mnC0RpNDSYtjDiPm89SlZ9jRXV3ShxSM4dR677AB3Aqc/8Rgxbmaq1A4
         CL/vBkcDuLdelMlNOhsOGHeAZXTdR5fiEr4CFVTBoNltrnGT63Ehwp1jSoJj8LUMNgwf
         UwLgSXg5pT8t+CKTTuc2JoqiTNO6SNVM5oUCbcj/NhhdWDZWkLucxS7MggAo5954wgwB
         EWgX7VddkIscG2oQXls5+wBK0uWiEIzMfCpKJ/7xgP/uBfs/WmwBrS1KxSVCSxMTW1Cb
         BXJw307yFKMZPrmbzKzlx64fymdh5MckBZ63EJS4sAOGlT8okQiHr0CW1NF6O0hSHyXa
         +xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817799; x=1773422599;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJxRsyeN4rh2Hs6t770BtULfs11CYbEujdDpyg3thI4=;
        b=hOHL+fNutaJM9iOIwME9hCixKaHmPkArG8Zptv8KPepgXCaMxXNrpboFWP5UTLEe8N
         K6/xf71oy85UVz+rUGcDv1Os82uzDVj7QqQ1X/xlNDcZxsOa11Cbae6iMKb712tdQkhv
         BEz7meWtVR3LI0sFa5lWvcQCFDy5BmYkv8v1QznHwYCbVUl37Lk0yIrELOht9tW6Cg0b
         36YM1ledlvbCon/2/hGeb4Labb03FUp3QHJYDvERne5DSA2cO/PUydR0il4fRCHGB9ZW
         ZYTr2UL/f74EpnJ22BrcMUmyTJkLIG9O4QbKGXCLU4dNQhmCFh/ojGEa+QZqobjjdkK7
         QObg==
X-Gm-Message-State: AOJu0Yy4SRBX2HHf1lgvCtrFSWum8vYoNdQ7btv/weYHGDVAv3iq5eqd
	Mt0qUlFJZBczsxMAT943F38iIX4FQr0tk/j7AzTC1DYMcLc09rrDXx/uTcU08h0D9skbW2BHUKl
	o/oRl
X-Gm-Gg: ATEYQzxIMu0HrQLzU7gVqck7r2MvP7E0adcofvraBg91y0BS/N/qfNks5IzU1zC4ee8
	3dBVlsxlksTykVNwMfzahrdM+MyyBGvjZev+Xbqbfyp2VCR990fzYsDQWcq1h5pCu16ovh7zJQB
	gf5BdTlUvqqBlSUml8QLaXzj+UZkwOJGrOqpJM8dGIxnJ1yNy62EL6ThTpUvaLIdns0YTDENWcs
	Q854wTVG9r9Gb1s5UoeZawQuKCZ9Kb73LtBD4a4C2YlRTX9smEI8OzskzWlrvFyx7yMB/2F7EML
	VYloyAz9FHMl2tu7yMP0DZdtoMxgGZeLTmAScyk1uqXKsbhDaBXo7ye+kYh408THVThuPmYa0Xs
	B1k8NcIYpdqb4letR2vPitjE0e2NkSwDkBnTJoFdy7EIKVzgQszVJhsOKYWXKdX/TpK3yweZkDS
	N22OFuVRSXH4DvncdhRMfNPFycX+SfZxn+RB2AylQt/4DILAg7KNmW4OA2V8F1RSk/FpDl0A==
X-Received: by 2002:a05:600c:4451:b0:483:bcff:7948 with SMTP id 5b1f17b1804b1-4852692427cmr47205035e9.10.1772817799211;
        Fri, 06 Mar 2026 09:23:19 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm76532745e9.11.2026.03.06.09.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:18 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 6 Mar 2026 17:23:16 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1797330463.42395.1772817798699@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v7.0-rc1-9-gdb64b9107f146: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_42394_1192100199.1772817796644"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_42394_1192100199.1772817796644
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-next-allmodconfig, after:
  | commit v7.0-rc1-9-gdb64b9107f146
  | Author: Joanne Koong <joannelkoong@gmail.com>
  | Date:   Tue Jan 20 14:44:47 2026 -0800
  | 
  |     fuse: simplify logic in fuse_notify_store() and fuse_retrieve()
  |     
  |     Simplify the folio parsing logic in fuse_notify_store() and
  |     fuse_retrieve().
  |     
  | ... 9 lines of the commit log omitted.

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
  | 27509
  | # First few build errors in logs:
  | # 01:13:39 fs/fuse/dev.c:1818:43: error: variable 'folio_offset' is uninitialized when used here [-Werror,-Wuninitialized]
  | # 01:13:39 make[4]: *** [scripts/Makefile.build:289: fs/fuse/dev.o] Error 1
  | # 01:14:47 make[3]: *** [scripts/Makefile.build:546: fs/fuse] Error 2
  | # 01:52:43 make[2]: *** [scripts/Makefile.build:546: fs] Error 2
  | # 02:22:13 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_0/linux/Makefile:2101: .] Error 2
  | # 02:22:13 make: *** [Makefile:248: __sub-make] Error 2
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
  | 37968
  | # First few build errors in logs:
  | # 02:03:02 make[2]: *** [scripts/Makefile.vmlinux:100: vmlinux] Error 1
  | # 02:03:22 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_0/linux/Makefile:1295: vmlinux] Error 2
  | # 02:28:01 make: *** [Makefile:248: __sub-make] Error 2

Used configuration :
 tcwg_kernel/llvm-master-aarch64-next-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-2188. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/505/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/504/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/LinaroLtd/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/db64b9107f146940606d512f1d6214323b905565/tcwg_kernel/llvm-master-aarch64-next-allmodconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/db64b9107f146940606d512f1d6214323b905565
------=_Part_42394_1192100199.1772817796644--
