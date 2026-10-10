Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C7A3C9EE5
	for <llvm@lists.linux.dev>; Sat, 10 Oct 2026 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791650703; cv=none; b=mvsyX1FQo9vik3BbePRY6LojDkf7glE8pfVVsDSkwIOjCrJZgcKp+9KEKitO8SkXE0FEthSIkkBJIvufh4obNwcxpETHKSaHiTGS0vmpWSrreNYxd9u7oUXEL0oHOvjeQFIQNZFJUpxUv/rSjTaJYo9857J/SO4b3TeKZYrUek8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791650703; c=relaxed/simple;
	bh=4mXkg6pjMpHSRcU3f83JQMaC6JjhCSK2DlDg91mL8SU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ijeAyj4hBkou/+xxISXXDg2blj1G/z+ZyG9S8TMlUBVpTjD8XPgZR6+7K/EI4dZGwz+r8z8oEH5+ksLls9CuIjCESG+1FmaVh+jI4du0dX1yuErtFJu9DhGNUdhrpl/nwyCE05OsS0umL+sQg5LNaWBGJUbQYqvb596LZe3dbuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCZOWdxk; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCZOWdxk"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so1775760a91.1
        for <llvm@lists.linux.dev>; Sat, 10 Oct 2026 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791650702; x=1792255502; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MavqeFwiz7qivrzrIW1HjpN4bRTfbcocClc6dsjot50=;
        b=nCZOWdxkrYNgvvQ+wOGEDDkzPrPT41hbcKH1qPZkXxtNzEUTd7pRnYpXhrUIHufHh6
         XxUIlV6YL0LtcuXi+CWM5tXC0GY+cFoxGE/RPqoBB+UsHhI6eW2eLE5LGhsulO0xOP3I
         R+qK5Z7Ug7z1urrX4j5UzuGrJCH5Mq3bmWdxTgqXl0dkddgARn8PD9LdChCdL/E8qyn4
         kPVrcqjA4fsjcldcG2vKy8qRWhUJgiO6Vng6H4WrZl8eMEcwXlks6SGCKWRjVQxjM2NI
         8LZ4uCZVjZOHj+P78/hYJ3s08lctxyk1+DOoHO7W7BUdWiNGTK4vr7XxXiXcywNBkcLh
         +kyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791650702; x=1792255502;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MavqeFwiz7qivrzrIW1HjpN4bRTfbcocClc6dsjot50=;
        b=iiBBSLINT2rD7eXbSzXRA7ag5gHDQhNMal1C/R/WQVl9X9GAo/JAwuQ2aLwWboJ2Dt
         WW+WJuwe6p3T6+ga+TsK34tGlesGP6yABVynmS+QhFK88OlhILGUEYuxy+stg9c0ijuD
         NbUgHloEeL0K7phQ1HmfFhuSo69rRq9yaLz+C1lOw6Q7bE8L/ABnk8tP6xjb9TU5GE6r
         XhKPHh90OyVut32VhGR9UrhhS8wo4VTsrEdsrulD0wWeQ8yYH3ptjUAZvwERXPBLnPx7
         tRDAWOP+Kq2ocH0z2zTKMoeMOjdH2wGqFSZas4JWHa4SEW0Obz1VM6YD6WPdXT/OdMNg
         QbAw==
X-Forwarded-Encrypted: i=1; AKwUvBxUgZea08wyg/XwewygvSMZnlrILRaahNdTwIe1M5FCpc0TPgzS8dV68gAu9+LmYpZAU+13@lists.linux.dev
X-Gm-Message-State: AFq9FYJ9JNJSHOn7qm8jDZvUwQr5HiZr+JzRgVNbaLhMUJ64v/Tg7S+L
	zXdggh/+/0T50Hw5mJFrpm1ag6fWDxc+3i2yrjrSIpt5wfokAMq8yns2
X-Gm-Gg: AYBFou1tUzXlLFQm/yo+Q710eYLkRZPDjDv+AVnPGZiKZUKMS0+NULstjMGQkBIP10b
	HOuYO1KtOJPZlw+eQGly4JWQay39eH4IY1CdDGGZCK9ti0EtgQIJBeY9v6hMNhClO3NrKeKd0JU
	icWGeggJQF7IXbL+yplqUFeUK6stKuVIBxdKkfboK83NHAPO0aTDiQ/h9vf1HNyAO9JJV4h9S8u
	t+XvtzaOZpv8yr3q4fKuILk1Mj4CuZo+9kpubIv5NNiYi6J/N7TJo35nxJuWD57CVGTqyVaBPXC
	HriT5SM9QyHYowo74kykcicJHt1U93TFn6r40ws0hSRkztO8rTP/8zXoPq1J/+X2wlsIhaJ4BA2
	VQU0+1RpBLme2VAPW7b0giXs7+PBqsjpGPpw0pIgEKQCm1Jkl7JmRefsM5NOFKhv/3aMWurs5Vj
	P4L2ppO64vo0lnZZgGHwlKlArlikOfepOMOfXy8h2zBvjVETWCBsfeCqmwpeWsHu7WwGi0+w==
X-Received: by 2002:a17:90a:d006:b0:3a0:c31d:80c with SMTP id 98e67ed59e1d1-3ab3a953313mr2454468a91.9.1791650701717;
        Sat, 10 Oct 2026 09:45:01 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7a80:50::3cf:2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm9096896a91.4.2026.10.10.09.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:44:58 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Tingmao Wang <m@maowtm.org>
Cc: linux-security-module@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	syzbot+a0eecb22de4d821a9e5d@syzkaller.appspotmail.com
Subject: [PATCH] landlock: Drop __counted_by from landlock_domain.layers
Date: Sat, 10 Oct 2026 23:44:49 +0700
Message-ID: <20261010164450.194439-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ac91e98.bbc4c7f9.15faa7.0023.GAE@google.com>
References: <6ac91e98.bbc4c7f9.15faa7.0023.GAE@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With clang 22 and CONFIG_FORTIFY_SOURCE, the second
landlock_restrict_self() call hits a bogus fortify report in
inherit_ruleset():

  memcpy: detected buffer overflow: 16 byte read of buffer size 0
  Call Trace:
   __fortify_panic
   landlock_merge_ruleset+0xc46/0xc90
   __se_sys_landlock_restrict_self+0x2bc/0xd40

layers[] lives in an anonymous struct inside the anonymous union
that overlays work_free.  For such a flexible array, clang computes the
address of the __counted_by counter as the start of the array instead of
&num_layers.  The bound is then read from layers[0], i.e. from
the first layer's configuration, which is not a count.  The same layout
crashes clang itself in a standalone test.

The annotation was added as documentation, so drop it rather than
restructure the union.  Keep the information in the member comment.

Reported-by: syzbot+a0eecb22de4d821a9e5d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a0eecb22de4d821a9e5d
Fixes: bd3a19800dd1 ("landlock: Add counted_by in landlock_domain")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Reproduced with clang 22.1.8 and FORTIFY_SOURCE on mic/next (64b9e6eff524):
the second landlock_restrict_self() hits the report, while 16 nested
restricts run clean with this patch.  Mickaël, if you prefer to just drop
bd3a19800dd1 from next, that works as well.
 security/landlock/domain.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/security/landlock/domain.h b/security/landlock/domain.h
index 60e8eb2d6ac2..4bf1555a4349 100644
--- a/security/landlock/domain.h
+++ b/security/landlock/domain.h
@@ -246,8 +246,12 @@ struct landlock_domain {
 			 * properly handle merged rulesets without overlapping
 			 * access rights.  These layers are set once and never
 			 * changed for the lifetime of the domain.
+			 *
+			 * Not annotated with __counted_by(@num_layers): clang
+			 * miscomputes the counter address for a FAM nested in an
+			 * anonymous struct within a union, which trips FORTIFY.
 			 */
-			struct layer_config layers[] __counted_by(num_layers);
+			struct layer_config layers[];
 		};
 	};
 };
-- 
2.43.0

