Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15B91586D7
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 22:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717627011; cv=none; b=a4qT2EaEKGDptJMSYHOBknXFVlWUJAT6n7ERl+auy9vqzXkMGbgz00AG2nl4ogHGsQVwAZuGyHE8CyWfJ0QYKHQkZY2HcdqgWQ3hQFgvbLQpmwtx2WTfKmcYH49b4Wnb487sc0/xdMycpJhDca3s4sN841VPQWkamGZFr7xcQnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717627011; c=relaxed/simple;
	bh=FAxq/WJA3jAwur4ufatkzAyl90jSZN079xQn1B8hIQo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PQ2f+QxHCRaFBYOn7EIkmehnJkuIkcseTRnsgcWx0muhTnvVgYciqyW4zVG+9WxITa9jt2uWtri45hiNkLIs0LNU3D8FthijewSJgP00LfVnQMaUWChyd8/OUSuZbfiwf4p/0N9cquKR3BSwb+ZSqS3hXPODpVdvHFqI8B3Kq1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=biMurWvC; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="biMurWvC"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a50486746so3839307b3.3
        for <llvm@lists.linux.dev>; Wed, 05 Jun 2024 15:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717627008; x=1718231808; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UDMXqeIeVKqn4Qjsv0IGaXMAVsD6Gi7Ax4kHrxCoB1Q=;
        b=biMurWvCZKGGYl9GB97jz7YAx/NwGk1zhP/dDJ8dgJ4K4REdvo+3AI/g2/eq2zTyxA
         GackJ2PnNQmC9eNVGhhU4oWXmwFvFoTO5FB0KW4J3ZjNatibP1OXNHU3NjiUKDHXbqzl
         PECAx/AfP30UPilmwDjarJBG3a18x3agbNBlb7wwoFpu/UnGuRxCVh+8QMfJh6gaBum2
         V7xSrZzOPDSdcFRoXSM/irZ/+5CEMKlmuEoUY20neG2HpkdD0Hb4Jaf6FMEo1d//gKoi
         Ior4doQQWeenRSPz7bNQaCD4IeM0jga1p3aB+wNEIZryF44X0CTukh2GDOiR8r9N5W0z
         IfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717627008; x=1718231808;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UDMXqeIeVKqn4Qjsv0IGaXMAVsD6Gi7Ax4kHrxCoB1Q=;
        b=idTTjC5rWxKkWSMokm1+ypKv2zhT0bF7oci7HfEGhgHuZc0XKoG4kz0BJ8KoveK3Rl
         EtM8rnebZVd7VDjv6+fDCvPFtuxYrm/4iNzXwoqSWBJ3tx9W742rsalPXVLS1M8/40Y4
         GwZ0BE8SZrc8IaGxzbQpyiVlkkUPQ+f5x0uO3cuGpdul9aco2DEIc4zcK7qrLyRAnttu
         eL4lyV/97btRSWtn2uu805nGI8HPbambv/Xhic+Rn/Ve0UZPicmavoi+SMu0PanlwrDz
         zSL6YIyF3/C6fCyDuAshr1Fn5y07zMl5eHHAE10z9QRuW+wJEH4lRbgageY1nbUxu65G
         cEOg==
X-Forwarded-Encrypted: i=1; AJvYcCWRK5yzus1rAY2ueOFxziAeILXjNTj1o3yEpiUKXw9EOw2CKhk5r3oL+167XA9cAxmmle1fiYSKQMCxPJY7WvQGmSoirQ==
X-Gm-Message-State: AOJu0YwioqoO1gXh90Di4PE3CyNVFrE7gl4X7brApjKeRLyLR7/kuzbQ
	K2XkQZOK/pat0tVraroo0/BFEnyDBI5TGKPQsie+aGeaFLapuPaDe83VUf0Fhn53DTHLeCvB1T2
	u7A==
X-Google-Smtp-Source: AGHT+IFVehH9WFewQGik+Dl0yz205/vF46via66nugJeD3HwTwVLDF4W27JfIYCAwQuhN1N8YQzQilb3Kio=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:38c:b0:627:a961:caee with SMTP id
 00721157ae682-62cbb4cd151mr5405207b3.4.1717627008528; Wed, 05 Jun 2024
 15:36:48 -0700 (PDT)
Date: Wed,  5 Jun 2024 22:36:33 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605223637.1374969-1-edliaw@google.com>
Subject: [PATCH v1 0/2] selftests/mm: thuge-gen defines
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: cmllamas@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

When compiling with Android bionic, the MAP_HUGE_* and SHM_HUGE_* macros
are redefined because they are included from the uapi by sys/mman.h and
sys/shm.h:

INFO: From Compiling common/tools/testing/selftests/mm/thuge-gen.c:
common/tools/testing/selftests/mm/thuge-gen.c:32:9: warning: 'MAP_HUGE_2MB' macro redefined [-Wmacro-redefined]
   32 | #define MAP_HUGE_2MB    (21 << MAP_HUGE_SHIFT)
      |         ^
external/_main~_repo_rules~prebuilt_ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/linux/mman.h:38:9: note: previous definition is here
   38 | #define MAP_HUGE_2MB HUGETLB_FLAG_ENCODE_2MB
      |         ^
common/tools/testing/selftests/mm/thuge-gen.c:33:9: warning: 'MAP_HUGE_1GB' macro redefined [-Wmacro-redefined]
   33 | #define MAP_HUGE_1GB    (30 << MAP_HUGE_SHIFT)
      |         ^
external/_main~_repo_rules~prebuilt_ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/linux/mman.h:44:9: note: previous definition is here

This test should probably use the uapi definitions instead of redefining
them.  However, glibc gets struct redefinitions when including sys/shm.h
and linux/shm.h together.  So, add guards for the SHM_HUGE_* macros
instead.

Edward Liaw (2):
  selftests/mm: Include linux/mman.h
  selftests/mm: Guard defines from shm

 tools/testing/selftests/mm/thuge-gen.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

--
2.45.1.467.gbab1589fc0-goog

