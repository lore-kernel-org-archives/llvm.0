Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F7018A930
	for <llvm@lists.linux.dev>; Wed, 26 Jun 2024 16:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719420312; cv=none; b=JRVvORdkvFqJNr/3vlV0t5555WKDlffABlX7HwFGFiVzfHMEt0iZ5LDgoMGDyHw4iKbUujQRXuoeHO1AUnWkzn+pRGS2YTPDJvL0sUPUK6LobyOm4RgiybRSUXKRyKzq0Rn8qS3MoNpEnZAA9Rn7z0L9F0MovmUjyNwvFNbOYb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719420312; c=relaxed/simple;
	bh=/XTlK8CNVzTiVxxB1xDjgvENhRkAWNqgof0AvwLMnTA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=f/k+89s0oEQhkAYagh3gHolNQmiiuUeiPJMuqy1pdypKUskYdNMEIlO4C6uP8GrFDAGXCnrvc0i0+jGk5hRdTyj2BOiv6FabKgk4ncze3MlvkLBWZKJ609kn8JU/Ma7JyMEg6fpX6/njUYkTj8uF+K0fSvP23Srm/wrZu+eks8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w5XnRqZ7; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w5XnRqZ7"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-48f463dbbd2so1698586137.1
        for <llvm@lists.linux.dev>; Wed, 26 Jun 2024 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719420309; x=1720025109; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AkHDlUR7ZAep2s6CTxvJnI8Ne4BYMt6q67j2gv0FYCk=;
        b=w5XnRqZ7WHGfAhIthOZHnaHChkjWtpuYnEYKOeypc7OynrA1POqkmFwb3VGIZlw5y4
         dXOkJ1uQv5amb+CxXl/4pxQWqGHFe36+5QMGFIsenNi3KLiTYVChMFWJrVfTFXXHidBI
         CHh2qtYHfa7o/TmsAQgOXVyVMXm/7kS4zrwDopV2eaKDqsYg+87zOL5+6U0wsN0amGml
         wnfA1phO1zyD4XcyU48GmZ+V4bwpf0sNWzMfTEynMTMgSkoDpYxIcEwtC1As7UsqMjYe
         QkClGda0CmAQgzzkZVTCbHKWfhHGmX7FyqziFRpqaRZUnigIhuDgSTaXvvaZLSv0Lm0f
         yDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719420309; x=1720025109;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AkHDlUR7ZAep2s6CTxvJnI8Ne4BYMt6q67j2gv0FYCk=;
        b=GTnHj+HelhxmMAfJUMn8bKg3DQuU8IG81qPfK1tYNGOSSJe3G4y4jhAA/jFl0I4I+K
         LH/7zrjtXWBfOTZS9K64pPsCwomQr9lf72ZPcx07i5Np/Xpyop37E0AvftsuXIH7dvek
         y6r1iwRMm5kVhvM8s9WlUx7etEnRF8wno/oILylJRRoySFfhVbNMcwYUSowWXl9CSWBS
         1FDR+7LeZ0xHbXIVtmlaDNfkSJVriW57/fTZDJ2k5LcLe9ifsgfQm54z4myVkqAWVmUz
         6D2+Lu0lB9Ecy7JHKatu0pcjAtkuOYp9X/S5g12TY0yfP+Hcgfe+9aLer5tuIdMo7y2D
         mCCw==
X-Forwarded-Encrypted: i=1; AJvYcCWpc3XmcahWP6JNFDwxRR4spWQHNjHIEJF/+N7/VH4TzDjkJYZDMp0jC4WvQTSmK+kMm8qOQEsEMdGBM/ge+rCcvuOQkQ==
X-Gm-Message-State: AOJu0YxVCwFjz9mZW8QqjnbQWN9qXcbZKN0MUbgLpnJ/EQt7Yxcv2FVF
	rCHDcPhUCVT/POFlsAN5pLpW34jCI/5F6zrT81OYp5JNhDQXylcHbkShOafTGWHy4LgRHomBArn
	+R/+nq1F8QqY6YZPLUfbsbi4TZ1J3SmMoelj9VQ==
X-Google-Smtp-Source: AGHT+IERDTeo9SUWlwbISbmX+LCiLsiuQ1dzl43YSoAXQ8Dz2vixJVMLChWoKkQj5/ZsdWmFforvxh7nXH2rV/z1Zg4=
X-Received: by 2002:ac5:cb4c:0:b0:4ef:668f:2438 with SMTP id
 71dfb90a1353d-4ef668f245fmr8617396e0c.0.1719420308489; Wed, 26 Jun 2024
 09:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 26 Jun 2024 22:14:56 +0530
Message-ID: <CA+G9fYv-rWNXZ9JxA19qSP0r+jhPDaMJejKbckN72kT1UpQ3QA@mail.gmail.com>
Subject: mm: huge_memory.c:2736:31: error: variable 'page' is uninitialized
 when used here [-Werror,-Wuninitialized]
To: open list <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	lkft-triage@lists.linaro.org, clang-built-linux <llvm@lists.linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"

The x86_64 clang builds failed on Linux next due to these warnings / errors.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
------
mm/huge_memory.c:2736:31: error: variable 'page' is uninitialized when
used here [-Werror,-Wuninitialized]
 2736 |         folio_remove_rmap_pmd(folio, page, vma);
      |                                      ^~~~
/builds/linux/mm/huge_memory.c:2700:19: note: initialize the variable
'page' to silence this warning
 2700 |         struct page *page;
      |                          ^
      |                           = NULL
1 error generated.

patch that is causing this build failures,
  mm/vmscan: avoid split lazyfree THP during shrink_folio_list()

metadata:

--
  git_describe: next-20240625
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_short_log: 0fc4bfab2cd4 ("Add linux-next specific files for 20240625")
  arch: x86_64
  toolchain: clang-18

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2iNfPlsMdxsqZTOC14r1xZZxq8X/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240625/testrun/24448204/suite/build/test/clang-18-lkftconfig/details/

--
Linaro LKFT
https://lkft.linaro.org
