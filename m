Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2D41B976
	for <llvm@lists.linux.dev>; Sat, 24 Feb 2024 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708769036; cv=none; b=lstFg7lU+OkHj7m3LtJgP5w8VqN0cXncn5Yq7ZC6/lle/Xebz3uJsJokqYRXqgYqg5J0V11bKb/nXi3bfkDiRrGCxBuseC298zVL9X5ZoSoaOhRpXu+zAwtEfXwbym/EQzG6rXjByJ4p7eC42sMNkekjPmGdC5BM9LwaxmWIrks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708769036; c=relaxed/simple;
	bh=DufvKPzYrpsgSLDiGmJiINAurWMRxjryg1rZH3wnGNQ=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=Scs7msbARq+7TnH7i9GrQ5t99rCol+YY5/f0hzuWPW3yr72aXj7eJKa07jbXpfTOfaHyRqelH0I1mgoH3J4Sk11DvAG3fxkqZohjS4WzyorONNg315ll2BkM9bxzmYDLri0VIFs4Q22QErvHoF8exhaAX7+5o4NDBnHnuqQFJAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ft8XRwpj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ft8XRwpj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4129ed3d15aso1018755e9.0
        for <llvm@lists.linux.dev>; Sat, 24 Feb 2024 02:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708769026; x=1709373826; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8I0CBZ6ytB5yIcYRu2rPsWB4jUhXL7uwgF6j8zSNp9c=;
        b=ft8XRwpjWnYoocv3RKv1ID6lBKtaakM19ObF4w0vzNVvIh0FodaJbkRkQ8wCQT+Fkl
         XBLXvc2rG9VMMUA+ywS57F4P6wQhDGR/KS+nORgYVCXK+2T0KXmj5NfNihOuXPsq5xmh
         SSW+iAlmQUC/mBGt3yEWM4TVTo2Df5DKGamGe0a1//P1SWfdyDcbAeYKoTy67835O7zK
         Y7l+O1uUmYGri9i2IxSS3+FVoQi+gLzHrrWK1zVqkCiSPUQ8wf3RJVNv8lUPkz+V4goq
         wKDgc/3MP3045CKkR6kbF3A9aNYjsLNh6TKFnjFgMV8pQ98OgBLiu+qQHVaX43AdnDyB
         1A+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708769026; x=1709373826;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8I0CBZ6ytB5yIcYRu2rPsWB4jUhXL7uwgF6j8zSNp9c=;
        b=JM+A0a/EuP4jnZnUVegaif4o1RdFQZWVIzP3rVEF6dhbCugff9cECJ/7nu4jRTjW3C
         C4o6wl7UNwruqgPpe9bd3roQW7ZiwKaJpA0eI5KNP7UMn3I6ANRGn5rTdhP63Y4o1EfO
         A1Oknt3aGFqvSD+Uo/+WTgVQe26mIUUNhFwZhnwanQD8km637/jM9xhKWST5hwBlY+/b
         G6wfUpo2wEGoKzvaTZo7ycDAZ5cA0M9aK0pWfo7yUKAjG6WWLJRXaRhVpYzZ1NlpR/Ts
         usdEd/g8LFt11LqEc0m3WqlWy6w8AB7eL7Jv2XqMWvFFukgVIfZmvbag1tFirO0uPXGk
         xBtg==
X-Gm-Message-State: AOJu0YyPBeVkJ0hSgu9du3BCyDihkglKxiZfcwaEFy6BJM8GBqmuI49i
	Rzn/88akMpuKXQdQ2S6Xw69sGTvTKGnYk2MdSYDKTW98aaBlzAsEenrGzoGZVrbe64DsQxDA02S
	p
X-Google-Smtp-Source: AGHT+IEU72uIM8pP1SOIS4mBgUkT8wGCuwnwceYHzFax+ER2xyvRwIt8/Jq3szTYqvF+3j6+rVWi5A==
X-Received: by 2002:a05:600c:5491:b0:412:9b49:11f with SMTP id iv17-20020a05600c549100b004129b49011fmr1021992wmb.2.1708769026618;
        Sat, 24 Feb 2024 02:03:46 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d608a000000b0033d8aeb229csm1573820wrt.27.2024.02.24.02.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 02:03:45 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sat, 24 Feb 2024 10:03:44 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1062719459.4137.1708769025922@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.8-rc5-15-ga0d2fcd62ac2d: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4136_358121221.1708769025000"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_4136_358121221.1708769025000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We appreciate that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1152 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-aarch64-next-allyesconfig after:

  | commit v6.8-rc5-15-ga0d2fcd62ac2d
  | Author: Anna-Maria Behnsen <anna-maria@linutronix.de>
  | Date:   Mon Feb 19 16:39:33 2024 +0100
  | 
  |     vdso/ARM: Make union vdso_data_store available for all architectures
  |     
  |     The vDSO data page "union vdso_data_store" is defined in an ARM specific
  |     header file and also defined in several other places.
  |     
  |     Move the definition from the ARM header file into the generic vdso datapage
  |     header to make it also usable for others and to prevent code duplication.
  | ... 6 lines of the commit log omitted.

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
42

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
22775

The configuration of this build is:
CI config tcwg_kernel/llvm-master-aarch64-next-allyesconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allyesconfig-build/143/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allyesconfig-build/142/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/a0d2fcd62ac2d3749ff48e30635fe8ea184f0a97/tcwg_kernel/llvm-master-aarch64-next-allyesconfig/reproduction_instructions.txt

Full commit : https://git.linaro.org/kernel-org/linux-next.git/commit/?id=a0d2fcd62ac2d3749ff48e30635fe8ea184f0a97

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-aarch64-next-allyesconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/a0d2fcd62ac2d3749ff48e30635fe8ea184f0a97/tcwg_kernel/llvm-master-aarch64-next-allyesconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allyesconfig-build/143/artifact/artifacts
------=_Part_4136_358121221.1708769025000--
