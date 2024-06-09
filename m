Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25647179AE
	for <llvm@lists.linux.dev>; Sun,  9 Jun 2024 23:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717976270; cv=none; b=uySEWf1TTwyTK4r8m9/J3zRhY5QObmouI5MSmndxzSDWCBaDqSx8bi/ohBo7X5q6w280L4oSVGKt5UFcIiXr25WGRvOoaDcHrMupacWgcEFk/B3y7URQhT1VsEuUWhM6dnmE8dzx8yR0CV0yryql7uqCihtKTVQ4lTRey2+qfU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717976270; c=relaxed/simple;
	bh=o+c92v7lPvwcZ08VgODfBDGvKxRb3xK7CA8hOGrsZxg=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=TY5Sa6cmh/Dt6kLLYl1kA2tRzwSHoUCYPyiFp58DW5Q/BKRdfYs/Jez37xZAWO3sEhMiY8NviMwbpoLUcfXQqeJ4or8syeN4oYjma9RWMb2MH51z7i0MckpUeIkKcAeZUu5mGurs4GFE6zUm+k536dWnHBY17+H7q+EMXTFjVk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I16+48Xi; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I16+48Xi"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a626919d19dso872145566b.0
        for <llvm@lists.linux.dev>; Sun, 09 Jun 2024 16:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717976266; x=1718581066; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w/AgbyKZLcP1UVl8LAAKZHexQuM0DHUBRkdz2ui0PTA=;
        b=I16+48XisDyJzqyZZr4N6EZp+WylxKBQZI/Q95E18B7YBob37f2w7jsFUVkmIVcD6i
         Ekao1bXWM1k0ipEutpjYmKJ6wnMkDJeZoyBJufinCj8mBQxAWW1/oHJrbwCqQkMtNm0s
         QQymHTUX+kKan2bXlWVkDoUT3xhWSY22zpQDADClgWVk+tEQ2XYK7tHjrQHO7zwjUmTd
         W03YFWVuBhcreSONfvjKMUaS26aY80RhLEt9qopSYFoncqlW6D4Jz7WUwkl40FeahD0u
         HecHONkok9HSL0TiiER1uo4IoHoIMZR5P5zsmfb5aou3cGKMryjFKFfxP00E1yo9fUVQ
         ktjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717976266; x=1718581066;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/AgbyKZLcP1UVl8LAAKZHexQuM0DHUBRkdz2ui0PTA=;
        b=spaDhtkEgK8HXKFio3fnrD6e7MsqCEsGIIsj5CNXvm2jKP/VQccCQHxtSnVRF8vaNB
         /tTN8TwvOYhMkZwstV6O3oSLcXKKyvIGxZPM+clyEl2igi+WwvQZsowEi0hqabkQM7YP
         tng601qg+njc0KPUOK0vsvMu0KKnfPijLVfMKDqnVFpjo0Dur9AKpVfmaIAtAVh9O9Zg
         OkrzF/8R/j47sfttSzGyxfNyj2zePhQaSR6d6Rd4HjxpPYPjAeAoRynhXEZaxrX+LNfS
         kkSjrbunlLM63270/Cixo25Pt0/kwky6IlLuAyr9ETXU6FatBPh+2UjJXZTDFaZantro
         efVQ==
X-Gm-Message-State: AOJu0Yz4MZSYVH4/cKR27vs4bbIxEEEEcbDnFC9UjeyN/QN1L8kF2wnT
	/+rDenoNnGYqsTTufZWOrl9UZyocfMTKzFl70U+ghHQHPUEnnEFC/1lryPJzJMhqnf7+Za05zT6
	L
X-Google-Smtp-Source: AGHT+IH410EIHn3YbEDTeVH+aRks7LmvLkO+gfgsjknwjSIbZ2rkst40LYtHAiFyflMabUxPAw8mvg==
X-Received: by 2002:a17:906:fca9:b0:a6e:ab8b:aff4 with SMTP id a640c23a62f3a-a6eab8bb0c7mr449852866b.13.1717976266353;
        Sun, 09 Jun 2024 16:37:46 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aadcbf568sm6411423a12.0.2024.06.09.16.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 16:37:45 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 9 Jun 2024 23:37:45 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <944395997.80401.1717976265852@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-19-init-12271-g29189738b832: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_80400_2094123120.1717976265179"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-lts-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_80400_2094123120.1717976265179
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We appreciate that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1233 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-aarch64-lts-allmodconfig after:

  | commit llvmorg-19-init-12271-g29189738b832
  | Author: Dan Liew <dan@su-root.co.uk>
  | Date:   Thu May 23 18:35:24 2024 -0700
  | 
  |     Reland #90786 ([BoundsSafety] Allow 'counted_by' attribute on pointers in structs in C) (#93121)
  |     
  |     [BoundsSafety] Reland #93121 Allow 'counted_by' attribute on pointers in structs in C (#93121)
  |     
  |     Fixes #92687.
  |     
  |     Previously the attribute was only allowed on flexible array members.
  | ... 130 lines of the commit log omitted.

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
24458

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
33831
# linux build successful:
all

The configuration of this build is:
CI config tcwg_kernel/llvm-master-aarch64-lts-allmodconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allmodconfig-build/174/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allmodconfig-build/173/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/29189738b832b111b905fcc037a287eeeb0aab2c/tcwg_kernel/llvm-master-aarch64-lts-allmodconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/29189738b832b111b905fcc037a287eeeb0aab2c

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-aarch64-lts-allmodconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/29189738b832b111b905fcc037a287eeeb0aab2c/tcwg_kernel/llvm-master-aarch64-lts-allmodconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allmodconfig-build/174/artifact/artifacts
------=_Part_80400_2094123120.1717976265179--
