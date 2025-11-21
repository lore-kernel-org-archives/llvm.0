Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C678248F77
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 19:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763754009; cv=none; b=Vo3ch4vuHiE65qLEe+9TBYwbxD57pmpf9snPXtt4CxBwrXb/irFnT1GmUXcjx4JDg9Jd/vn9Uxseogyz0/fKW0cwaYK8OIaNSsHwtb9E+DC5AbgICm4v/E45VrAneVby3AaZAVTpN3TiMhI9V2mtqOLqBu2o5T+HBrRO6ueb5fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763754009; c=relaxed/simple;
	bh=uyjlPQjCUIP3tN/i8tzIaK5s2tBhsnrdcDrEmNw41BA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eJsVJ+BB5fADYE4gNYaq5H3yeCyuqFKkuOpFy5M7RUbqgSNSvaXMAG42leRA0x4t1HMSw91EcVYItlh1YVYOGHC8EAINlQs7QYKUGTHPM8beBeHkcUf5C0rHFIuJpo3y8NuM2oSgN0dpyrhm3uhMDLDVDQOfhMJa9WN3fzv4u+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZYzBwJuh; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZYzBwJuh"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7bf5cdef41dso5695841b3a.0
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 11:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763754007; x=1764358807; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MVJsPQnIVZajk+lHlfDveIvLKD+85UYee4pfqF03cLk=;
        b=ZYzBwJuhCl9niWyGd794wzVg9RiazixB82LTy3jl3mlKY2su1zOviYBbre0HkEqaWH
         F/mdkeRPIun8CS2Az1Cl/yQesJvR6GlBvFYvJK8w7VIHBgWlp7FJv9OR4VZL0557UNcR
         IqQC2u7abjEumqVoPbI+WC1HEJOy7SUUYsVqtH8t+cYpx1RSinm2Y4e1QaTEiXrTWUpB
         5bum1Rkz6XOkLtBYh8rC8nH7wt3qKjB3KSckoJe4uiOYS95FjXDbeh/lXd8GS5dJN/20
         2XPQnLYZ/U8B7XkHsG9vFBLwR+P8pTDuCcbMRHL2mEloDRXpD0qZlgK4uFIhemd0w305
         0qXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763754007; x=1764358807;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVJsPQnIVZajk+lHlfDveIvLKD+85UYee4pfqF03cLk=;
        b=JQaxrxb6Vm0/tzos5NnhyIKhQdyQP4vUT3CIbbh7VZeUmHTFsYepfB9pYttFOx/xmk
         rIXnWbVoYN6g7DuUCuw7JEq2Vv+wks0Vdrvv4k0TdWE613pTjsVvbCR1FotJA3nRvMRZ
         OZOgS+eEI0R/KBWrjewF1XYKUdIke4Sgv1lfp9V6An3/uYnbKlnm4lBv3X+6XYyyQO0u
         3X7YFNtlblpM2aZG5XwnbURwirjyX85B2Dftpe1h2NRQ2Th+7kc562cVt21OtYozHacv
         gcdHMyoV4QY5yY+aF5WX9SDvGyDw4/vay77owiRVZINPluqwzV9PK0AfnozFpP4I6gQJ
         nOAw==
X-Forwarded-Encrypted: i=1; AJvYcCVo9++wo9tFEL+X3N16XtpobgMbFyfRgFCBiLXLrSiUhLofx+HKzWk6INrglqPuwcPlKQvY@lists.linux.dev
X-Gm-Message-State: AOJu0YweqXeYmQIvWLKfEeWU3FcdcA4Kyomnmsc6mjsEszPntYrxKfqH
	ipPdgVsdN5b5ROyFbfqZlCiCSWjAabR0ZB3VQLQZwbYMMnwzu7/wK+MZNyfXxz6On+tc45JyjG1
	M
X-Google-Smtp-Source: AGHT+IHarLcIknxetIYeUvDf3MVSiAq41e5Mrh95YVro6zYarTxgqBJdpBdWXVnAePgCSrupRn3actC+TQ==
X-Received: from pfbfa5.prod.google.com ([2002:a05:6a00:2d05:b0:781:26f4:7855])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:158a:b0:35d:1bcd:6882
 with SMTP id adf61e73a8af0-36150ea818emr3944453637.23.1763754006657; Fri, 21
 Nov 2025 11:40:06 -0800 (PST)
Date: Fri, 21 Nov 2025 19:39:42 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251121193957.1655580-1-morbo@google.com>
Subject: [PATCH 0/2] Add __counted_by_ptr macro
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

These patches add the __counted_by_ptr macro and then uses it in
mm/memblock.h. The name of the __counted_by_ptr attribute is the same as
__counted_by, but two different macros are needed, because of feature
skew in GCC and clang. Once the minmum versions of the compilers support
'counted_by' on both flexible array members and pointers in structs,
this macro will become obsolete.

Bill Wendling (2):
  Compiler Attributes: Add __counted_by_ptr macro
  memblock: annotate struct memblock_type with __counted_by_ptr

 include/linux/compiler_types.h | 11 +++++++++++
 include/linux/memblock.h       |  2 +-
 init/Kconfig                   |  5 +++++
 3 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.52.0.rc2.455.g230fcf2819-goog

