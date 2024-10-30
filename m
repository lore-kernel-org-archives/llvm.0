Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136D03398E
	for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 06:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730268373; cv=none; b=rll9i5DT3cSL+ZagyZx5DQE0Tm21nn2huN2kCpWuJzfyTHESf0bEij4lt23cWq69Yyxg6Um5huwGXMsiJAeIuXeEKCbxlc6Li1zZWfyUBB45t+3zbYXSSPvOzMfaXqlty+rsdxp2ZGR+MVzFvA3cUv2R9JolUAwu/AyzAHNSsqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730268373; c=relaxed/simple;
	bh=qrLyUHZBYTiR8qESxs4hW4VXrOwYIEk7QGL3JhZiMzQ=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=dVr4knoB0fdLDm/Zfb9wGn4V6gVfNdp+x10QNmtEEROVdosw1h4ZcFNRCC/73vg8pCZ6jv8WAW91XRfliwkBXYcXKQVU9eU9CHjwnv5otnEX0Kevd5naEiV+kFqiCeffIsnOEll0T16vEHUEzg8auI4Y5whYHGdhgyf/Z6As4Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BPqoQqln; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BPqoQqln"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7aa086b077so788242466b.0
        for <llvm@lists.linux.dev>; Tue, 29 Oct 2024 23:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730268369; x=1730873169; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QTzNAyhIQj0EeH4wIHAkAW3vftirfaRORumSHr6UJ2M=;
        b=BPqoQqln16QLItrAI0XHPNf6vu0iXvNBqaUxNNIvfWoR5ViX+CjmKuf5y418Gl8USB
         MxQghmrBmp/8HpjtTFsDt6soICoeFAqcXC89Ehn0Joqzb9DQuQ7cnL+F7Zvoe7N/ZNBw
         8dk1BouBq32yH9TVMQGf1HjtOJO+e5aHPX0/n4ApeA2LfeHhPn7Lst7TQOmDTmyClOIZ
         BcIYBBKrlcurzCivUe/B6GAzyPzeuClPS5RsSGpqtB6em+9B8+5uY+qkKMlkzPmHbztZ
         O3uunSxd7Rwq0EqgWYyuoZzD7qshZLrmBjRe/KAhxlXNZMNayIzJOcNKKuc89TAmEKK5
         zl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730268369; x=1730873169;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTzNAyhIQj0EeH4wIHAkAW3vftirfaRORumSHr6UJ2M=;
        b=SVBuyRCR1PanKNZ5VyOSn6CLS/tO0TxFQ+F9TjiFj/Uf0MHc2thgnOy+jpOqr4z2dT
         8QL5GgLQ18fhOsgaZfKOOfH3vJ4HUzB5F2JFpt/EE6BwY6fyH0whdqmSOcJHFuq6WXVM
         W6j2IhcEYRHKI4IvSP6wstSchWcUbf05ctkNhEYvcFfVo9k/iqsvln2GUtQmpkVZdYE0
         mkhhO/JluIfHN9Kh4UfqqmR0ha7wX6Y8h37nHHvIWO4/wQ208SB8qwOJcTFfWja4KLfx
         Gg4iTLvqwyTk+I9e6DR/0pIQJ0gUJRakAuaiVpwaIWDAurBWF+iYLXBpgG6he+XGROqy
         3bwA==
X-Gm-Message-State: AOJu0YxApwIxh7GL/Z/EV/txRSFxLV8mHzSjYfdxvm5asXKUEUGfp7SF
	4o5zEjdY8LQux8Tum7ahB/uWBlemGagRLL/LeLm16TQpq7S29zSksFFXTwlSCb5NgChcqu5Lgw6
	Z
X-Google-Smtp-Source: AGHT+IGe4JnNRYITs5hvVDklDbNImNUmsz/0Og5K2wS2X/UqFM4Up99tyDCsAaDZC5GPHzLsXIWghg==
X-Received: by 2002:a17:907:7b9e:b0:a9a:80cc:d7b0 with SMTP id a640c23a62f3a-a9e3a6c915amr195846066b.44.1730268369170;
        Tue, 29 Oct 2024 23:06:09 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a084ae4sm533714066b.197.2024.10.29.23.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 23:06:08 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Wed, 30 Oct 2024 06:06:06 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <272034616.43155.1730268368701@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-20-init-10266-g71315698c91d: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_43154_808567969.1730268367095"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-stable-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_43154_808567969.1730268367095
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We understand that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1418 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-aarch64-stable-allyesconfig after:

  | commit llvmorg-20-init-10266-g71315698c91d
  | Author: serge-sans-paille <sguelton@mozilla.com>
  | Date:   Mon Oct 28 20:40:52 2024 +0000
  | 
  |     [clang] Warn about memset/memcpy to NonTriviallyCopyable types (#111434)
  |     
  |     This implements a warning that's similar to what GCC does in that
  |     context: both memcpy and memset require their first and second operand
  |     to be trivially copyable, let's warn if that's not the case.

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
23330

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
23331

The configuration of this build is:
CI config tcwg_kernel/llvm-master-aarch64-stable-allyesconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/241/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allyesconfig-build/240/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/71315698c91d0cda054b903da0594ca6f072c350/tcwg_kernel/llvm-master-aarch64-stable-allyesconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/71315698c91d0cda054b903da0594ca6f072c350
------=_Part_43154_808567969.1730268367095--
