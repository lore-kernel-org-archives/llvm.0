Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CF113C9A3
	for <llvm@lists.linux.dev>; Tue,  8 Oct 2024 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728373230; cv=none; b=LsR58JZktxfFUtTlUCD7QEXipaSF97M60rKG9vIwvIX6gM+zCDYd7wysqI3o8qGIV98g2dF7felX1NTz52GoYEbyKN7jnW5VMT2zhBNRmLEUKmc6bStcQgdIcy0yjsPIlop7YD83n2js6NU/21ZeNSaFtQAWC5GoypCCY6vXza8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728373230; c=relaxed/simple;
	bh=QdNYVEqzHPo7pGfhv4hTteTh/N+9ljrUAbL82tcOG64=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=mskVpX3jS5Up+ZCzu/ABPqwwg2jmCMZ0LMipF4ZhLjU3Zo3YtO1e6k67dLC6s0wuyq4C6wpbvNlQ6hPsOlB5+EVQY6weKCJuK7mCmt86OEcJvZAMj6jDdKjwCQd0C4Nj5Eg7vOzhNyFgXEu4JYLIvC103Swxo6UHGxTpDK/JwfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vtmUJ/7R; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vtmUJ/7R"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso908748266b.0
        for <llvm@lists.linux.dev>; Tue, 08 Oct 2024 00:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728373224; x=1728978024; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yXA19ceyZZ+3Cf7+WfRq4udLadYCLPCelkPinKbVkjg=;
        b=vtmUJ/7Rz4FCc7qXpKmsF9dbgmabhds63VGJqqyuLh/cl0dANASP/Y1LOgifOOg3KM
         eArLRn2EC9ziuzRjnveBCMnWjECrtvw6ldlv/cPE1slPSM9ZxIbAGhPeOKGMrRRjKpqo
         JKL9UkkGLVtrHdXxvpjzk45MnScHu/UZeT3Nk2Ot1cjFRl1WTLNl3xj/YjMg7YA90gZO
         7r/Ie1iRK4HR4zD/FiG0RK/t9RTTMCfwvW2OpUfF46/EfaFnAQopWdldUm5Ks+5tfd9+
         5uhb+QarxDWqESiFazoITZkhUzBR+OECYx0PnHXD2BST75N8rJEImz8SPiVahe66pOLO
         Tuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728373224; x=1728978024;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXA19ceyZZ+3Cf7+WfRq4udLadYCLPCelkPinKbVkjg=;
        b=LODLJqRQWP2bWehLITRU10BSg7XuwoV5hVbmdsctk+FYWMkL6JgPWhz95yUW8LFRXE
         GmSn87NShDzg++q2pUQ3AEbicXjMHh5Ha61SXmo++CeFr0cs/NDZrbjWZVJI8bu0R3oH
         lRssqUNtZRcImG+2IJwgZjPyx5t7eI9BFZcuUJZ04uOITzGvdRaD19W1SkHR8reTPq3h
         wns+SW25uZWlaI+nNnwJq+UWVOrqK8vMH1xvKoPNW4LwwC5m+QqKIBkVGvZsX9PuNFFK
         O+tzXODw77M4ILbFbE7jtx6DNcDGvKYKHmEu7WMenijW4dYVFbhVqWGYNWlrIH2lRMrU
         5xpg==
X-Gm-Message-State: AOJu0Ywy6yto1bsTUABFTyhkoYTEm9SLYH8Mvic/CnIElKfmFD7ahpoQ
	S2IsRKSozgJe3BL24CFdoWoyjlO0W8Dt7ACjuuRt1D+U+JBP5ncPuCX4ZbhAhPIqW7u3ojeTCeS
	F
X-Google-Smtp-Source: AGHT+IHQsxK2bjpoHnf+wywr/ey9UvSHuUromPiewBWPpuCbchEz9L70ACR8FbEo/v3pFGIdgD4clg==
X-Received: by 2002:a17:907:7fa8:b0:a99:4e74:52aa with SMTP id a640c23a62f3a-a9967953d80mr222870466b.33.1728373224497;
        Tue, 08 Oct 2024 00:40:24 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a995096d0d3sm263756566b.217.2024.10.08.00.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:40:23 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Tue, 8 Oct 2024 07:40:22 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <637931286.20442.1728373223783@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-20-init-8119-gd2408c417cfa: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_20441_1833911217.1728373222960"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-lts-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_20441_1833911217.1728373222960
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We understand that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1390 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-aarch64-lts-allmodconfig after:

  | commit llvmorg-20-init-8119-gd2408c417cfa
  | Author: David Green <david.green@arm.com>
  | Date:   Sun Oct 6 10:44:21 2024 +0100
  | 
  |     [InstCombine] Canonicalize more geps with constant gep bases and constant offsets. (#110033)
  |     
  |     This is another small but hopefully not performance negative step to
  |     canonicalizing towards i8 geps. We looks for geps with a constant offset
  |     base pointer of the form `gep (gep @glob, C1), x, C2` and expand the gep
  | ... 2 lines of the commit log omitted.

The configuration of this build is:
CI config tcwg_kernel/llvm-master-aarch64-lts-allmodconfig
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
24511

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
33835
# linux build successful:
all

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allmodconfig-build/214/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-allmodconfig-build/213/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/d2408c417cfa71f1786c909788560374eb1aca96/tcwg_kernel/llvm-master-aarch64-lts-allmodconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/d2408c417cfa71f1786c909788560374eb1aca96
------=_Part_20441_1833911217.1728373222960--
