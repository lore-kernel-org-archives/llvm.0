Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A31187350
	for <llvm@lists.linux.dev>; Fri,  7 Jun 2024 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717763843; cv=none; b=rCZL+JAMHoNTV2UiwG6AJS1O6wpW/6/xpcuhlGrj5JRUWSVS9/TnjPlGh5FoIlgkDozVJkefI+nqXm5ZCRe4kGQ5E1rg2XTk0lbmKNFvj66NudhK5PIrobXG7xtWrwoXQNlbjcJr7JajdkOIlkGklbEPo12rFtT5B0el1Na1THc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717763843; c=relaxed/simple;
	bh=TZ/ZhmIzrqOSG+OEUHTv5WbsvCvdliRlsVlV3lPdpdk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Si0/Ta4bltAN6vwKP+rC+pZ+AWoA0oY/BQQxnxjP/l2phRvNHOXyiiReO+xYbyG7zSPHxaiqC14Gc8bQaRvn6CQtvJGAOhMI7yoI2xzpKvHOV+NfLRfgzA/mI63OG/+7bCh4A04VV0elUmWoLt8ypsvFuxHGiCI/XCMfMeXwwb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbkmkx89; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbkmkx89"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso29877191fa.3
        for <llvm@lists.linux.dev>; Fri, 07 Jun 2024 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717763840; x=1718368640; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ/ZhmIzrqOSG+OEUHTv5WbsvCvdliRlsVlV3lPdpdk=;
        b=lbkmkx89H0wml7po288LWJz6DK4PpJtV+WTnCdGXyEEWucihEzfdEWoWeonNQWmPCg
         GFXujOds+i00cnIuzE1JX7RnP8pENJN45jV0yZguZx4vy2Go+i11NQsYjDWv3k5NfRFA
         ZZyt1P8/JqvRUJ0+bYM2fR9YhHVJkLIraMQOphJH2YtRka6Mavx8TsO4ziL50kvi8h9X
         M/pN+GzqLuWAqcu7kGWukUcVA5RqvvF5JXKTsK5tiTkZ8Mx/KB4fko+0KYc4XcxaQY8D
         7cHipEzkMAZW/r/1E57qpvvyxMryrqBDWYY6MFmvGum6KH9fO4Xzl8JXeRG11aOVmkHT
         GnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717763840; x=1718368640;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TZ/ZhmIzrqOSG+OEUHTv5WbsvCvdliRlsVlV3lPdpdk=;
        b=GnD1XJFXEKxiQP8veRkH6HlSQEurZ8vxoEae1vfy+rtK9AhGonBPzWg6iBQicLfeIZ
         kzq1Fz0oRbRDk7w6HBV+v2M6TjRc7ON7f8ngzHMC+kdMgsDJex2RUy3XmUkUIo2OW3mA
         c6x9i2boUube2vMo0vXAug6FVW7k45FyEPdZxjg58Na28zAZcA/LFJnMKPcC/S3MW5OV
         425vw+KUMmgBun0jX3G5Rbl7yJujp6M1XfgeclxGamasXU9TwwxHKSxQJB2Vi5vxADzT
         B7klZakO9GULmRAl9ZsbgzXGPpLYFf4GUnUvZk6fypy/Xc1bO0u89Qg5m09QanxXtnuB
         d9lw==
X-Gm-Message-State: AOJu0YxX/tiVlmYCRyMbS2RhaHQYqWjQXcgJH2mvXRpgNZWphR/abqJH
	KD43a7WU30MUNLdXcv/HeQaDp6f3L4obhvNm7kR2DmrXj71O85etdRtQ8aKh
X-Google-Smtp-Source: AGHT+IHMzxB3qb3l+2IugZUadnhQFabfZ7UdW/eQFyy+n3U9YQNITKkcggv8h1NfKBSjVsXd/XQ/Ow==
X-Received: by 2002:a2e:984c:0:b0:2d9:f68a:d82c with SMTP id 38308e7fff4ca-2eadce71c17mr16467551fa.41.1717763840064;
        Fri, 07 Jun 2024 05:37:20 -0700 (PDT)
Received: from [10.5.1.156] (188-22-218-164.adsl.highway.telekom.at. [188.22.218.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae20238asm2696643a12.73.2024.06.07.05.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 05:37:19 -0700 (PDT)
Message-ID: <0bfc6b38-8bc5-4971-b6fb-dc642a73fbfe@gmail.com>
Date: Fri, 7 Jun 2024 14:37:19 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [Bug] Failing kunit test on ARCH=arm and LLVM=1
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: kunit-dev@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Greetings,

when trying to port Rust to ARM I noticed that the DEFINE_FLEX_test
kunit test in lib/overflow_kunit.c:1188 fails when combining LLVM=1
and ARCH=arm.

I have reproduced this on v6.10-rc1 and next-20240606.

Here is the clang/llvm version I'm using:
clang version 18.1.6 (Fedora 18.1.6-3.fc40)
Target: x86_64-redhat-linux-gnu
Thread model: posix
InstalledDir: /usr/bin
Configuration file: /etc/clang/x86_64-redhat-linux-gnu-clang.cfg

I have not looked closer at the failure so I'm unsure if this is a
problem with LLVM or if the test case is to speciffic.

Let me know if I should open a issue at
https://github.com/ClangBuiltLinux/linux/issues instead.

Cheers,
Christian
