Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2653F219A71
	for <llvm@lists.linux.dev>; Thu,  8 Jan 2026 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767886811; cv=none; b=IlBLQFTTglxXq5XVMf4jw4iluoxoo1LNa7iv79Bc7rpnRhsahvfcfDxXOaKGpLvfm+/eS0P4gn2Y76qZgxkxGAS/kqZL7YYeLCINhYxgyz6+hS1fecZ+nPP8yhtwZxd8LlBd093s9msi80wEvy2ViI7m7cq39DrK3jHn1iijphY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767886811; c=relaxed/simple;
	bh=NkWLe98qh9F/G9rVqj3CNvimsQ6CTIncUVluqRlSDnk=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=eDUARAZeY7HQQd26K3KMAkzbcqKQWkeXCStPYYF2jsaw3an1r4oL994ia6KEFKvNy3Nk0yfbBTqxFHNXlTwpU5Lm9qg9N9ZlN5FPDWjld2mLlH+KS7HcuMa1sNWR+8mbTVYtrsxK5owMa6rDwuFtoZW28kddmavJDzg0roJ14wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FifAN5zS; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FifAN5zS"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47774d3536dso19507515e9.0
        for <llvm@lists.linux.dev>; Thu, 08 Jan 2026 07:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767886808; x=1768491608; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EQ9YGWWRJ/GtPJ0CV8MnrZfCKF9r6uGQ5aRt07LlwLI=;
        b=FifAN5zSRUrzAtWXHoR8LGeB7TeCiXDRRcsE7hQR/cIDVzmAQJLTXr9YvuhvgcXN6e
         4T+2bPHTVXoCpZn1pTGBYWgeWVxWteT+9DXGmYmsxxpHvtyec6vZZOIP+amjx2bBvO/K
         XoIoZsmIXy3RbGq+gP81tAST1MHyqu9grThHnKrThFCs9hYpTII2SvUPiEMbJKlJ6oiu
         O6GcjTqK85ZRFtY7iOc6pb7Vo77ujMpw+XfsQgEPTQ+Y2TzRZi/LPoBWLTs3yC2IbRzB
         qavQXliYWKNYaKh3dzZpkj0QuammjdR/j5FIBhncRx/AiUAbZvj5A9PJwucJxsHugpyy
         +GFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767886808; x=1768491608;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQ9YGWWRJ/GtPJ0CV8MnrZfCKF9r6uGQ5aRt07LlwLI=;
        b=H+LMyzHrWskJs6OOm47WOQ0j8mfNZy6MuJ6UTNJhYus/GuzxotqJ5aIW1kOhXm4rbv
         HJg2hBpmEuXGZt3jLirtJhZ5A5itRib+1mb7EQEB8kiI0cgQXDJ76PdL5J4V4zrVs04T
         X+ETMjwrqllXMg0sNhOJXuVfBrFDdCFX4acNCNrek2teIsZqQzxVfclUEilMrh6Nx3Xc
         Q6c+AYQnIx9uMhr82b1Evuve4HSNx6F6ioRDlcyZwFv8odqoKb6r5C4bX+PRXc3D5TDa
         G+sK9tER+aeA61H51DdcEu4w+Xlm+2lY917Iv2W9+gufSdBxfrhbIUNXdKji7gmzPzq4
         1aTQ==
X-Gm-Message-State: AOJu0Yw3KY97gMsCGMmymmozsumtWRNOmX5qh1eNs2YH7ERp8P0dDRrq
	JE0Yo/X/iWVofW3JWdgzSm3KedI5R+3VoYhfDZRtDCyZg18nKSjRG2Ue2lv25sGqPH/CqG3fIlr
	TbeIfEBE=
X-Gm-Gg: AY/fxX7CGdQehV/2SsyE+AoilSzS5VTx/F9YmGd8d/yMSDsX/Rn/mnx2tEqmnmY52o9
	Go/l+/EVqjtvcPwB+Cu3MslyPIpySDCQWpd06hlkZpGaDsRBkPYFJBKwp9EiW2yHJZH2rSk7YnD
	Bcu5xzkG7c0my+7QiNfDVGMTLfkyn9COHcuhpfh63ESQhKy3CdKBDXzTWKPy/TKZWpEFtbYGcMj
	sbeT5VgTTIec75GCkUsxDUgSoAi7o6oP5C6up3s+h4djkKL9m5mh3JBp+o5/Ja7U7e+sOxNrIwg
	yeOoz3kiYeFnJOXmwmzt+FAB45I0WaQu9gBy87/0S8kSohXOhKooa2RyyCMo6FSYvl639LMBTzR
	io5Nm9d0yeoO5UWOV4aaJhvlFrEtQQSS5p0klxEFMxqccZqmvn4pFFqgwX/lAEeX2M9Q/Jj4ekb
	Mh1hwrysmGWX+f7q70ZUmfQYGz2f3AD4FgE0XrlEREwDugwYw+JHXpOh5UMQ==
X-Google-Smtp-Source: AGHT+IEeRJrAXIcCtu7i4CxFDvACzgSiZC2jKLsG1vmDaX3z/3VAqu5kI/GJGtZVb+H8vaI/+NZTBg==
X-Received: by 2002:a05:600c:681b:b0:477:a219:cdc3 with SMTP id 5b1f17b1804b1-47d8486d5e6mr76495175e9.12.1767886808298;
        Thu, 08 Jan 2026 07:40:08 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f620ac8sm153684175e9.0.2026.01.08.07.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:40:07 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 8 Jan 2026 15:40:05 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1987263045.13894.1767886807819@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.19-rc3-237-gf2960def96dfa: Failure on arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13893_1100228239.1767886806191"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-next-defconfig
X-Jenkins-Result: SUCCESS

------=_Part_13893_1100228239.1767886806191
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-arm-next-defconfig, after:
  | commit v6.19-rc3-237-gf2960def96dfa
  | Author: Mike Rapoport (Microsoft) <rppt@kernel.org>
  | Date:   Fri Jan 2 08:59:58 2026 +0200
  | 
  |     arch, mm: consolidate initialization of nodes, zones and memory map
  |     
  |     To initialize node, zone and memory map data structures every architecture
  |     calls free_area_init() during setup_arch() and passes it an array of zone
  |     limits.
  | ... 69 lines of the commit log omitted.

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
  | 8057
  | # linux build successful:
  | all
  | # First few build errors in logs:
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
  | 8057
  | # linux build successful:
  | all
  | # linux boot successful:
  | boot

Used configuration :
 tcwg_kernel/llvm-master-arm-next-defconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-2150. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-defconfig-build/282/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-defconfig-build/281/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/LinaroLtd/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/f2960def96dfa78e379b2906015f0c9e90ef37ae/tcwg_kernel/llvm-master-arm-next-defconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/f2960def96dfa78e379b2906015f0c9e90ef37ae
------=_Part_13893_1100228239.1767886806191--
