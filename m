Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48161B3F1E
	for <llvm@lists.linux.dev>; Mon,  9 Sep 2024 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725885456; cv=none; b=euQ0U3SSSoKhjgYbu7IPi3UrBo18uTvTsqFtDFxPt9jF/4bUrajfxyIFl8znA7+1+iu0Gx+vNLTkVJvHkasK14NzvQuZUxYu2beAVW5kqHaQl/Hb5jzDjPsac12vmhZ8rURg9XMg+LqBQ317h4AuazEzTCJaQZqhXY+QybSELLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725885456; c=relaxed/simple;
	bh=7x++IXptugSBcTMKm1CnBGE34+7xQrLR4WRchoqO7zI=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=XwvHIsT55Kjvt5G4cwmVEVlF3gdDVORLhEATea/gz1A3FBioPT4EFAYyg89CbZhonal3xaqVUIoJUXz9xYOtMM2q7mJDbhuqaRVlH4Jzsgbxwn3A2tcUK+pKmdUmNxVHdeQGhH8REcTKYFaEOCM13Z+ix4l0Hys6KKIjg/MWIw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ybKLtNCJ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ybKLtNCJ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c3ed267a7bso1851014a12.3
        for <llvm@lists.linux.dev>; Mon, 09 Sep 2024 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725885453; x=1726490253; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1i1SG9ZyQO1Dn1Tv20UB4E8WTvm5LphoCfNmE2TqwkI=;
        b=ybKLtNCJCzCyODtP0J2y7JaltmNN+FXVdY1SV1JCVQX0mU5+tAN0lM9tSrmP1cKFUw
         WJz4J84ZZ+aYBHU4jgzpu3ss3vmsqTJ6YizIyykdOYwaGXF/EWBAa6pMspN+ANRc97Xb
         S8Z1E9VpIXaQqOYif7oe0Mi6Iju8wPDStrjFXFs0GUusUk8zgSw+vhjVl0RsAffEtYx3
         pcNEFxyOtHclTTfg0/1QupvtjgI+/rJIYJ8NHCFXGlJrKM7edgGUoS+rw7xpcJsQSETc
         uC8IogvTd2V0HZumlSjOASeQt6DvaBUxY93RBONOdvhWBihtfrC7G7k8eHNJC7oKCTd0
         TIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725885453; x=1726490253;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1i1SG9ZyQO1Dn1Tv20UB4E8WTvm5LphoCfNmE2TqwkI=;
        b=KULf6sgXRzhX9HKH7uByJNFjRZXC3vgJrqTUjC1eDITMTo4qGxbd0czE32/oM3wkH8
         qmqbWgDAqbLDr304jX//IReENU6/onmsT+vemHpg8IywfixuaFGcVVahXSI2vI9V4taI
         6xB5wGkO6h6m2pCXavi3XUNpsPJJryTSTODltaQIm/IZerInlm2WK0xSX7Y1QlGmGeFb
         CzBd2Kq4Zzd1/Xn606Xrjr4lCd45ZJoW1ujK5BwrwfBcD4BK+cjZv1FeEHpgwkgQphEq
         LitPF+BaWoG0NKGx+DWGu3osr/bYCuiGqhnf9LdlgfM7Y0qUQcEgHgL0HsDduSVX1lo4
         Jncg==
X-Gm-Message-State: AOJu0YwxLNBl5OSWLEXLGRLljOuInY6gjdUj6Eg/yEN04DR6lsY4fQ9d
	MnFuCKDp7wlJ/SxvRJMS+S+kY2eXTY5bRNFRpkYeueMNbsokudWwEgJvjM1l+NIBNs/1MTNMOfs
	3
X-Google-Smtp-Source: AGHT+IFPMpLNSPEx2AqxH90baBQr2iNHSvzorGKDLa/Ixu1Pz6nkg070ttX1dpMV1CurY11gy4frCQ==
X-Received: by 2002:a17:907:3688:b0:a7d:e5b1:bf65 with SMTP id a640c23a62f3a-a8a885f6487mr922550566b.21.1725885452394;
        Mon, 09 Sep 2024 05:37:32 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc97sm337027566b.212.2024.09.09.05.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 05:37:31 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 9 Sep 2024 12:37:30 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1833124036.181352.1725885451762@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.10-12615-g08c2182cf0b47: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_181351_1536764681.1725885450927"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_181351_1536764681.1725885450927
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We understand that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1343 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-aarch64-next-allmodconfig after:

  | commit v6.10-12615-g08c2182cf0b47
  | Author: Florian Westphal <fw@strlen.de>
  | Date:   Tue Aug 27 15:37:32 2024 +0200
  | 
  |     xfrm: policy: use recently added helper in more places
  |     
  |     No logical change intended.
  |     
  |     Signed-off-by: Florian Westphal <fw@strlen.de>
  |     Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>

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
25706

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
35360
# linux build successful:
all

The configuration of this build is:
CI config tcwg_kernel/llvm-master-aarch64-next-allmodconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/255/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/254/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/08c2182cf0b47646af7f3daa292980f95f5e1ea6/tcwg_kernel/llvm-master-aarch64-next-allmodconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/08c2182cf0b47646af7f3daa292980f95f5e1ea6

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-aarch64-next-allmodconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/08c2182cf0b47646af7f3daa292980f95f5e1ea6/tcwg_kernel/llvm-master-aarch64-next-allmodconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/255/artifact/artifacts
------=_Part_181351_1536764681.1725885450927--
