Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E77816D9C6
	for <llvm@lists.linux.dev>; Mon, 22 Jul 2024 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721657584; cv=none; b=Fal1gVnjHvqoExsQ3XnsTNqaGIZRpn0gT8NEEIR/1KYc1208W5yaPsDlZxmUXObzrVlFs73pCm45fGqw9qfDnTWC+gVMU6Hy8NSWEjU9n4Qp4bsdy7LojqXEKylTBltVO7Fy0Nz3YZAEU9uMDALKHW6N2NYCr9PNEUwYuLiGjWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721657584; c=relaxed/simple;
	bh=0FSuVSEBg4EdRogBAx63ue51JzP8r2IjRTIYebbugiU=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=VNHwUyG5h4+KLnjhTnYly1nL+6xhnVEw9F9CDHdJN1rcQB/EJfP8P3sPuCl8q9K49eK5dlZ+jTbd2zgH5iaaeF7hNSUQV8Zr79nfBvBjjk36T6N0xsXIy0QlHQkeu/bjkmEI6LwXgzaOwAJNbZ7M3vMks4h8uxjTIoTpzQy4Fbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMwaLe28; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMwaLe28"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-79ef8e0c294so265932085a.1
        for <llvm@lists.linux.dev>; Mon, 22 Jul 2024 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721657581; x=1722262381; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=23IitzNJDWbuO6UP+MW7B/hQMtxlzsAZ+NlARzrhYu0=;
        b=HMwaLe28f42kCHe9HuBy7aDhpZIt82bChaph0iQ38hKbL9IwOpv1WAX6tCN6nYYf6A
         P3HGFLxDdnXZCLHzR/opNgBeTIQrc/INThcUet+NWL902FKZ1chpXnA304T4cp7v8Nou
         jyaTdD2frC8TwTkqKG0cTLkPXOEEeLrBAEK19AGf6FGmVdpN78DHRY9mEv4JEKzRD6fU
         mTGoIHVn3gZgESYdHZseI9LBrB7uiiV4I7MTdfSCdEAkSZVBQtsn4LwAfHoBL6Wgsef9
         F8mfhf8QhpTY0PwG0iI18o7hpyYGCoP6ppEkYQuprUcVN0FQuPd+y7iDZ1z6Wgb+nTtq
         Vg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721657581; x=1722262381;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23IitzNJDWbuO6UP+MW7B/hQMtxlzsAZ+NlARzrhYu0=;
        b=oguMhoMkir6PPdAVWE1hqUC7GUtQYIrBy6vIFpQKiK7b8inn1aw3A9tgOh+2W/lnPI
         a/E90smOELdizrEN+bu/1UpHJ0ajexYRfjggBFN8F/ZTEF2rEUvrknazQlveRaz+U6cq
         CHtScz8zMn46GQUj4UIi9RlduWhzeGWSTCSVHLgRASY+WV1DZVjAF0vJLui4YjLr3rrK
         vkEzBRWtxW3/JiMxECInSI7aSKcKFVVAlJRD19KFFa2SwwN2epU7YtjEpR3orLQDY4eG
         lehzRt9jk6oW31q/1eSeRuBh+7UTDTtMvYiUroKryh9bXeefGXCq7N1v9Dy81TsccrBZ
         dHLA==
X-Gm-Message-State: AOJu0Yx+N5yS+RzI1Yn2BiD7R4pQ5Eza68vcLW30D81IVEMhj4clEjz3
	Burqn/6XKXuGMc/KjQjuL9p0IqgL4qzTXMlYX45BsuwMpgb5h+19DO5EYQJJb1+y2IRKqfbGFjZ
	R
X-Google-Smtp-Source: AGHT+IEsRX3VP4FeshmpXbOVMCdnuRM1RovkG6ZUSfxOfQtF0fPbPkpe8ZPOWdDJoNiN9TB/a0wGBw==
X-Received: by 2002:a05:620a:29cb:b0:79d:7893:1cc with SMTP id af79cd13be357-7a1a18e98afmr1137774785a.12.1721657581442;
        Mon, 22 Jul 2024 07:13:01 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1990788f3sm361913285a.99.2024.07.22.07.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 07:13:01 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 22 Jul 2024 14:12:58 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1017473160.129075.1721657581027@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-19-init-18145-g1f6f97e2b64a: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_129074_646767790.1721657579005"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-stable-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_129074_646767790.1721657579005
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We appreciate that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1287 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-aarch64-stable-allyesconfig after:

  | commit llvmorg-19-init-18145-g1f6f97e2b64a
  | Author: Bill Wendling <5993918+bwendling@users.noreply.github.com>
  | Date:   Thu Jul 18 22:11:56 2024 +0000
  | 
  |     [Clang] Loop over FieldDecls instead of all Decls (#99574)
  |     
  |     Only FieldDecls are important when determining GEP indices. A struct
  |     defined within another struct has the same semantics as if it were
  |     defined outside of the struct. So there's no need to look into
  |     RecordDecls that aren't a field.
  |     
  | ... 4 lines of the commit log omitted.

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
22903

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
22904

The configuration of this build is:
CI config tcwg_kernel/llvm-master-aarch64-stable-allyesconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/202/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/201/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/1f6f97e2b64a9c4c51712d32b53e07d2a20e0cc0/tcwg_kernel/llvm-master-aarch64-stable-allyesconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/1f6f97e2b64a9c4c51712d32b53e07d2a20e0cc0

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-aarch64-stable-allyesconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/1f6f97e2b64a9c4c51712d32b53e07d2a20e0cc0/tcwg_kernel/llvm-master-aarch64-stable-allyesconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/202/artifact/artifacts
------=_Part_129074_646767790.1721657579005--
