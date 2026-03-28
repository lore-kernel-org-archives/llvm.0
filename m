Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510CD327C18
	for <llvm@lists.linux.dev>; Sat, 28 Mar 2026 01:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774660775; cv=none; b=jvd/u6U3+n60JpB+QXkPHa1GuBiecwlgYtlev3ZttqH4vsshZHjIOhvdV0wk3KvWv9xXeEZoxHMmfy1QZErxHdvdItNY+l1EwODa9ABcT3LrCvx4P/QBITzWkNalaPoN1Gcpv4gWX+8OYpBgKXWplIOvfM8Rrj++1Oy7Rx9QaP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774660775; c=relaxed/simple;
	bh=HDqV0Py005zQIsbLeQfUi8Qe3O2XbyV3pJb2YvqFjZ8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lxrcEzW8Uqe4+nzMpsY+96ru2TPAnrrvNRK48YB/9GGh/0YaXK6YZzX0//sMbmE82H4MjMQ+x2GozsJbaeoBZjj4Hmuun930IWOyF8Gr1bghrMktpnqpRBS0gp+8JXKwyBs6XByDrAqOp/sn670xgWrJ4ij4VQAPFtowlL+GhXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZGp/UIgP; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZGp/UIgP"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso1755072eec.0
        for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 18:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774660771; x=1775265571; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Y8qoX2i2pgK07/S9R6C/ITZShbzZ0BOZvH25QidFt8=;
        b=ZGp/UIgPx/CQzZxCP1sFqvrYOxlbUPXYCt2B9muoc9aFKhMb56QgJyAnumbvOL3Gun
         8d9xVnKW51NRAFMdQuEBZONvclOPSOIhNpLvVp1q5PIM4IifEOaDHbCmInQA7ERejTDM
         CgA4ilfVFNQ0KfOMrBgsnYbCfuXj2LAkv1FtabVenE7nwI9RY2LBSYPrVrwX9VgoYlvq
         wL6J6Iq3lkZzPyQ8S1wueZ58OrlLw1S9ImQyTLHh183kydUFZ7TEl5+LgG1hlhme4WaU
         omgKARYpFVMnod0Ins4uK/3SIMAlrOBvtri0zxL6mMzTIf0tmjMjheVeYfEVhyQljOn3
         9w1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774660771; x=1775265571;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Y8qoX2i2pgK07/S9R6C/ITZShbzZ0BOZvH25QidFt8=;
        b=sK8ROKduh0hs9p1JJw1wJKdvGh2uuU/8IQHJ/7qbA8FBU0j4u+4MQyDYhaKLjcWxd5
         GSSXForcET7xDd3OnLs1l0vO/D9nDfgiBIIpbaHv1jZEmxYBH5gAysXgHBvJr34Qecpq
         721Fvq2AxsjbcfDYbOoRE+mjjkAh3eI1j4ZUfF9WZ9tGTbM4B+G5Z/X8L1lG73XHElR4
         4iePdFuMQZxBrIzpwGqtJI4cFgti18rkgTDHi4HCPFnkUumvgjNzuhecUig3E0LOD/zR
         AZpc7tRpcoaq9o2/ERQjNqIcrBDuYTOtgX0Np6FrY3fOOfK9C1Y3Zw29cOLSp0klhT4v
         gTuw==
X-Forwarded-Encrypted: i=1; AJvYcCUFwl7jCZeCmp6QMAW8vRzwgxJLgpO6eqHbeKPz/6OjmEQ9X53TmTmUM+IEot9kgxkjO4Cs@lists.linux.dev
X-Gm-Message-State: AOJu0YxI1VaGGSGRrAB56B+2GW4LF5FC1oFelXJAOUHxecCjAyNwSH0b
	YvT7Z8m0U/e0BzmmlsdUXbxEKy4Rbv/+VKLCsR3PYLvVlLs2TajZNueR1Iou+87amkkfgw==
X-Received: from dlbsj11.prod.google.com ([2002:a05:7022:f90b:b0:128:dfaf:10ac])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:670d:b0:128:cdb7:76e1
 with SMTP id a92af1059eb24-12ab3029ebfmr1892234c88.13.1774660770853; Fri, 27
 Mar 2026 18:19:30 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:19:24 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260328011927.3569802-1-xur@google.com>
Subject: [PATCH v7 0/3] kbuild: distributed build support for Clang ThinLTO
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

ChangeLog:

V7: (1) Resolved a conflict by rebasing to kbuild/kbuild-next-unstable.
    (2) Separated the '--thin' to 'T' change into its own patch to
        preserve Masahiro's original version.
V6: Change '--thin' back to 'T' in Makefile.vmlinux_a to fix
    reported the build error from old ar.
V5: Handle single quote escaping in echo _c_flags to fix
    Piotr Gorski's reported error.

V4: This is based on the reimplementation provided by Masahiro Yamada
on May 26. The difference is that this version now saves the compiler
flags (_c_flags) from the Front-End (FE) compilation and re-uses them
for the subsequent Back-End (BE) compilation.

Rong Xu (3):
  kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
  kbuild: change --thin back to 'T' in $(AR)
  kbuild: distributed build support for Clang ThinLTO

 .gitignore                 |  2 +
 Makefile                   | 25 +++++-------
 arch/Kconfig               | 19 +++++++++
 scripts/Makefile.lib       |  7 ++++
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 174 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: dcc99abebfa1e9ca70f8af8695b6682ad7597bf2
-- 
2.53.0.1018.g2bb0e51243-goog

