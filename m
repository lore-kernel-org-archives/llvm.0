Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520881607BA
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 22:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717627017; cv=none; b=Dn7TWoH3VFVtw/FoKroVoIc47u2HQS/H9avs/W5AzWnImdFKKH12n2X5AUaa7hdaFAMpyj2hHGvzp/rqSiweUnoVr/DYreJ+i/jXA7z8T+d9K01wjGfzUNNKfgNnSbel6s4C48qXugWX5OKcgbg5lWTgTXzTIiX70DEpJS2NXKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717627017; c=relaxed/simple;
	bh=9eIW5Nk9I4U8j48RPo1MRyDNbVsR5OYHwY3uM3dehXE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HE9hcE8hI9a4Gvth8fe5LVX/zOFrjJpJU7dQyPBZoTNyTjtYKlb1B+9TflngnSeNb8Cus1C9xOZgwAFI8465ff186N1Jx6Ee0VHbxdJ9J7/2iZygdEo9AK4SNqVuCE4+5HOKTmD1kVtowiWlJhG68eCeMHKquCkE5Sb9Dbs5GIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MRnJARYh; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MRnJARYh"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a1e9807c0so3623257b3.0
        for <llvm@lists.linux.dev>; Wed, 05 Jun 2024 15:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717627013; x=1718231813; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvR2KzRbeN2y+kQBsoY3woptqhul8uQMwsNjpEueFQI=;
        b=MRnJARYhQJWKtYnlkUH8n+62juZHaXs9+M/9gAIQkeUhdKtUzWy9/vpVL8H/ut3MKc
         9VPszkxgI3X25FsgsZO7nP8ZqLQSP0eDATakFB5OekqJjCLTgpOG6GS+DZG4dkd2bUa2
         no1oB6KyFWhSU5I1AFlCqEG5Px2LXbO+8auGjmwp+ZafY4cSIUJ5VNjH0XKz7Pp1hE0R
         qqKPH9sAaBsUYuP0fosiTlmIYetF6e5sw+oeNrbzdkNat6MM06m86NbiviOjTC/cXchR
         ubs8NnSp0GXKObKp4xCH7NXrAy+QahBB/t4N42ExxLebJByNAKR98nYC6Xug3sZlD0DO
         d2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717627013; x=1718231813;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HvR2KzRbeN2y+kQBsoY3woptqhul8uQMwsNjpEueFQI=;
        b=RRMYVMPeXGprarDm6GpnxbostFf95BbhvrL3JCqCmdyEeVqs+LG4HA6nSfbeG/sZGS
         54T8aUJdXrCwTXUdgybgxzQOr273KUiScJq+T+M0WSWgLXsBe7525+yGd4j5c3k1IEuF
         A0ayOEmVTcB8qXKsYODtTQnCw4byFX96Rxz2VYoxCsPmyQNT+CWz+pXE4RQtD84WPiYg
         E3Pono31GhmWkMRsDUhWQFp+0aJRcn89H+ovSHprhyIwZQnYOIcZrxmREZji7JY8OJuA
         bobgEDmLI0MgBxZimtr1LCeZy+BWWCDnSlfMPzGuv5ThBSOWNvZrf3gL2oAbZShBXKx2
         PGJA==
X-Forwarded-Encrypted: i=1; AJvYcCVp6pLtg/o4vvb0TyEcQ0W/R+pA64/qkyFAhlJHeKP9IH6FapKRyHZadEe1ngMWoynMeqvzSOwJvdlxT2b1txlQy88zag==
X-Gm-Message-State: AOJu0YwzeeYTgw1C8NlB7Y9Lz/SEtzDmUhfdlTZhY/z9V/wK/UQoujtJ
	MwaKMFOL5P1BxY5M9UwzVqMTus4IX1vQECTBI5DFB8kmz5jOWnsVBYNJhxcxscoRwElu62vMM6k
	3+Q==
X-Google-Smtp-Source: AGHT+IHQMSg3BZwEdpTjqj45BkSGSDIqDJ5xpSLfVCjXGbqd16zv34TQGDGB9Qio8PSsr4E5OLx/pSf4zjw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:6413:b0:620:32ea:e1d4 with SMTP id
 00721157ae682-62cc6f92037mr2991207b3.0.1717627013381; Wed, 05 Jun 2024
 15:36:53 -0700 (PDT)
Date: Wed,  5 Jun 2024 22:36:35 +0000
In-Reply-To: <20240605223637.1374969-1-edliaw@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240605223637.1374969-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605223637.1374969-3-edliaw@google.com>
Subject: [PATCH v1 2/2] selftests/mm: Guard defines from shm
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: cmllamas@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, llvm@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thuge-gen.c defines SHM_HUGE_* macros that are provided by the uapi
since 4.14. These macros get redefined when compiling with Android's
bionic because its sys/shm.h will import the uapi definitions.

However if linux/shm.h is included, with glibc, sys/shm.h will clash on
some struct definitions:

  /usr/include/linux/shm.h:26:8: error: redefinition of =E2=80=98struct shm=
id_ds=E2=80=99
     26 | struct shmid_ds {
        |        ^~~~~~~~
  In file included from /usr/include/x86_64-linux-gnu/bits/shm.h:45,
                   from /usr/include/x86_64-linux-gnu/sys/shm.h:30:
  /usr/include/x86_64-linux-gnu/bits/types/struct_shmid_ds.h:24:8: note: or=
iginally defined here
     24 | struct shmid_ds
        |        ^~~~~~~~

For now, guard the SHM_HUGE_* defines with ifndef to prevent
redefinition warnings on Android bionic.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/mm/thuge-gen.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/mm/thuge-gen.c b/tools/testing/selftes=
ts/mm/thuge-gen.c
index 034635317935..d50dc71cac32 100644
--- a/tools/testing/selftests/mm/thuge-gen.c
+++ b/tools/testing/selftests/mm/thuge-gen.c
@@ -34,10 +34,18 @@
 #endif
=20
 #define SHM_HUGETLB     04000   /* segment will use huge TLB pages */
+#ifndef SHM_HUGE_SHIFT
 #define SHM_HUGE_SHIFT  26
+#endif
+#ifndef SHM_HUGE_MASK
 #define SHM_HUGE_MASK   0x3f
+#endif
+#ifndef SHM_HUGE_2MB
 #define SHM_HUGE_2MB    (21 << SHM_HUGE_SHIFT)
+#endif
+#ifndef SHM_HUGE_1GB
 #define SHM_HUGE_1GB    (30 << SHM_HUGE_SHIFT)
+#endif
=20
 #define NUM_PAGESIZES   5
 #define NUM_PAGES 4
--=20
2.45.1.467.gbab1589fc0-goog

