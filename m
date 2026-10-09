Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99954E3247
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 11:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546717; cv=none; b=GDDbu+ODKgktPFeb3gIt7Psg6e2EMw2GPXaO3J/4KFeV2Bjgy9NNRDRyUkPA2w60I5PT7hWbnhUttaqBoV1nidDnf662auoZ6uI6+67uc/YwwPqfcSHAGmUjeIEQ9mEkz4rjf/VhNO9HNfXTFZmsYnQ9597WjeOBSsQM98ADx0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546717; c=relaxed/simple;
	bh=9c10fv+8RlbffEaqllSZarWYu0IWQKMv/n0/uRyLBSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/b03JfetLDaZxpQQDac3RhKtueE/YZJwQSug7syhScbhTxkoCs3ThYtZK67B8XpiXJ8yDy5kqoZihAdtGP/VYri8tElsriqBZxIYK9+X4+fnu/K2DUbWDcsq1XoYGOQfGozG+fzFFMgyrjnOCYUOM3Jv+kQHkRrsCNULlkbRn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYJ/cqgz; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYJ/cqgz"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91957ec418cso50395816d6.2
        for <llvm@lists.linux.dev>; Fri, 09 Oct 2026 04:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791546707; x=1792151507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrr3HiCUZJnv9aA8BpT1SjaAKZ8xaCXAbRRl/khQOqQ=;
        b=LYJ/cqgzr8W4vUiQOh1o+e4p6Rc9z0K9MOWd4hasB+z7HVHGjxVlucP5GgDifM3dfH
         91g9RMQuoZQh4SEBwyoGRa7LTneIinr2lXIdyP6Vli/qFxdFg+9qh0BGXDunVuq28MJb
         7amF+adJhj03/BXhWkdFW2czgD4K4QLTi/2XnM2S3DrjcOC8QosV9V9gmEPyVpvV630T
         jM+653lbnq2ounHuG/oyYTTLmCTS9VHtEVE9fNrU9szYxfhV8ofpxB8kMTxevJZJGyll
         1LCl+szX2hxsN7lsMjvyD5wNw2bFjNR3hfyVn6JcRD8DiRtVfw57uKhOOVxw4yKyDfcS
         GYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791546707; x=1792151507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrr3HiCUZJnv9aA8BpT1SjaAKZ8xaCXAbRRl/khQOqQ=;
        b=EmBSjYZtkVupUh9pSf3fPe7KhdlFjhTpaHUteZftMItAOwjBkfKmxvD1nNPLoznmC0
         jcZAqiFbFJXbgyoMVtrcIVQo5E6YYiAKHnZO4B8U6gzcExpdCOpOuYjrOUjATKTWcj7r
         fSH5/MU/1E9trvYlvatWfSgZtnJscFpCmXJVK/kHcD/fq/qQpaqHUEIuUwb6Kghmjih0
         lQMPyIArKVS35hLbLSbZRPPXVJ1M6xY0SvldzzsrrtAMsHtOMlMkS7+65b2soo6FRXbQ
         6Je88PmTKfSL2Jhk34j1GrUa75Leq6/pOoRPk5Y9aRZcf2VpngZfMUThafJAtAKwVerl
         WDBQ==
X-Forwarded-Encrypted: i=1; AKwUvBymzKUwgh0ApBf+HxStfqDZdjUC2Az1Q2rUbs9vEDroCZiFBWjrHxXLW1YGyWsVJC4ZKY7m@lists.linux.dev
X-Gm-Message-State: AFq9FYJ0iMg3OHSQhkTwsrA07Rw3ilyB6dOpNbTF1zZFYiYO3kHeMMqF
	12rAUwyBRfXhUf0C4xgmHrXGO0QuaH0XfXp4DFxJYWsrIIlvFP/YE/nl
X-Gm-Gg: AYBFou26izLytnGCi2Yohx/zNwYe5dDb5MBOj/Vdzd+0qDQxBTSbjSt6zlE1XxXTFce
	SMOyd86Qd38sbZR91BnlqBYe8p/MGIeb3DcwgeR9cTL2kwK3ARtH4M3tRK0zNbRLb11h2kmi8zV
	Jl3w6bpEfGkirCjdPoUs/MYctbfV75ZZg4pa1CnGk0Yfh+fPfy4khKs53/6tSd4tucFzqnbwq+U
	wAvXIIJuKy5TMMg0tt36zqtMwDcl1M/SRzoMeVgih33TU9jctxN5iiJn5pIdAh1pIxx+6NxaFC6
	Jb0u8b8lsUKPNP8WMCG/QGKYeUT9aFOZXypLkXTUyE5QcwgRyFUjjdLfdF6vmUdCaaT6k3GRIpa
	UdlLNyS0nVGjZNXfPvGL7T750CaqxMEncL2IMtFr2Q6q41CtsK0t1DudI0N2w7yNUeT+YErFekU
	vYj+mHnVAr8zp8lCf0+gvHr+4EGJvpQPLrt3aTDDjbcB5RAUPYfQzd87qe4eSKtQABu14vimP1i
	X8VWSCtjiCt5O29Uy1kChnRNSQT8vrjPejVktG2nOVz6NDOX4/rGsJKsEZ5/6Qm3/5/AYlV/pn8
	IoiNdVCoxYb+c2w=
X-Received: by 2002:a05:6214:2f05:b0:918:c4b8:fc57 with SMTP id 6a1803df08f44-91b554f1bbcmr27272116d6.9.1791546707414;
        Fri, 09 Oct 2026 04:51:47 -0700 (PDT)
Received: from mobile5.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e7f6aesm16537346d6.2.2026.10.09.04.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:51:46 -0700 (PDT)
From: Mike Bommarito <michael.bommarito@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Tingmao Wang <m@maowtm.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] landlock: Move the domain layer counter out of the anonymous union
Date: Fri,  9 Oct 2026 07:51:08 -0400
Message-ID: <20261009115108.17819-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007-b4-landlock-fix-domain-fortify-panic-v1-1-042e9108f5f8@oss.qualcomm.com>
References: <20261007-b4-landlock-fix-domain-fortify-panic-v1-1-042e9108f5f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 07, 2026 at 07:28:30PM +0300, Abel Vesa wrote:
> With Clang 20 and CONFIG_FORTIFY_SOURCE, stacking Landlock domains can
> trigger a fortify panic in the handled_masks copy in inherit_ruleset():
[...]
> Based on next-20260930. Validated arm64 Landlock object builds with
> Clang 20 and GCC 14, with CONFIG_FORTIFY_SOURCE enabled, and checked the
> counter load in Clang-generated code. Not boot-tested.

Hi all, hit this issue yesterday on x86_64 (Framework 13, Meteor Lake),
v7.3-rc5 built with clang 21.1.8 and CONFIG_FORTIFY_SOURCE=y.  I triggered
it simply by opening the printer settings on 26.04 (through xz, see below).

My build tree was recent v7.3-rc5, so I applied the patch, which was clean,
and then went through the repro steps after rebuilding.  Everything works
as expected after 10-15 minutes of use - no crash, no other dmesg/journal
issues.

I hope you don't mind, but given how irritating it was to track down
the issue, I am including some of the Claude output below to help others
find the root cause more quickly if they hit it.  I checked the
disassembly and ran the tests below myself on this machine.

<CLAUDE>
This is easy to hit on a stock desktop.  xz 5.8 sandboxes itself with
nested landlock_restrict_self() calls, so on an unpatched clang build every
`xz -d` oopses:

  memcpy: detected buffer overflow: 4 byte write of buffer size 0
  WARNING: lib/string_helpers.c:1037 at __fortify_report+0x1f/0x60, CPU#6: xz/9888
  kernel BUG at lib/string_helpers.c:1044!
  Oops: invalid opcode: 0000 [#1] SMP NOPTI
  RIP: 0010:__fortify_panic+0x9/0x10
  Call Trace:
   landlock_merge_ruleset+0x353/0x360
   __se_sys_landlock_restrict_self+0x1bf/0x470
   __x64_sys_landlock_restrict_self+0x16/0x30

On Ubuntu, simply opening GNOME Settings -> Printers runs the CUPS driver
helpers, which run xz.  With kdump-tools installed (panic_on_oops=1), that
panics the machine.  Nothing more than an unprivileged process is needed;
the reproducer below triggers it as a normal user:

  prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
  for (i = 0; i < 2; i++) {
          struct landlock_ruleset_attr a = {
                  .handled_access_fs = LANDLOCK_ACCESS_FS_MAKE_REG };
          int fd = syscall(SYS_landlock_create_ruleset, &a, sizeof(a), 0);
          syscall(SYS_landlock_restrict_self, fd, 0);  /* i == 1 oopses */
          close(fd);
  }

The x86_64 codegen matches your arm64 analysis.  Unpatched, with
num_layers at 0x24 and handled_masks at 0x28:

  mov    0x28(%rbx),%esi      # "count" read from child->handled_masks[0]
  shl    $0x2,%rsi
  cmp    %rdx,%rsi
  jb     <__fortify_panic>

With the patch, num_layers is at 0x40 and handled_masks at 0x44.  The
count is loaded from the right field, and clang folds away the fortify
checks after the WARN_ON_ONCE(child->num_layers <= parent->num_layers):

  mov    0x40(%r12),%edx
  cmp    %edx,0x40(%rbx)
  ...
  call   memcpy

Results after booting the patched kernel, with panic_on_oops=1 and
kdump loaded (the configuration that used to panic):

  nested restrict reproducer:  both layers succeed
  echo hello | xz | xz -d:     ok
  lpinfo -m (CUPS -> xz):      ok
  fortify reports in dmesg:    none; kernel not tainted

The layout change grows struct landlock_domain from 64 to 72 bytes.  A
one-layer domain is still a kmalloc-96 allocation (68 bytes before, 76
after); only stacks of 7 or 8 layers move up to kmalloc-128.  That seems
fine.
</CLAUDE>

Since this is reachable from unprivileged userspace on any clang +
FORTIFY_SOURCE build of 7.3-rc, it would be good to get this in before
v7.3 final.

Tested-by: Mike Bommarito <michael.bommarito@gmail.com>

