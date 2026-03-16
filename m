Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DF0339872
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 16:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679881; cv=pass; b=Sq+XvyDl128mTmP6jcRAeRDdGdZ2fV6M880oRBncLH4RV/CXEwkJAG6KVR+QEyY6XFS+0pJgraXfAsexz+iw4tM7FBjhc8mbxLsfaNceQaCDFZkbXno54592KtbtYf/70X6/XjhWFIxSyYuXZduWe0DgPj2hNwyrXgtr1boLXnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679881; c=relaxed/simple;
	bh=fUxvQJOTFE6tJDBwDITTqStZOAACd/nV3kCLPe+IAMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdl7wNTvuX9DqfPo0hISX0R/wVq+nmT4uMlthbalK9HoO7UKoKQkqhpCUwc+bqeFzncPBvvEZkPi9ihNq9Ztc68c70QkboZGd46B+6BuaVpV2UGL2bVhTf1lLQGe7dcuTvXAS5HBUlTM9hwm8QHGQwAaYISPgwKuB023J8cBABs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GWeTC1YO; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GWeTC1YO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aae146b604so30860905ad.3
        for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 09:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773679879; cv=none;
        d=google.com; s=arc-20240605;
        b=QzNUnK4UeSlvqChrYPScFtCtikjLhOwpmY2KJTbDsGbI53P5MN8LR/OzPUVNQxepdB
         BaAw7Cs2XsJN8BsdlahXF33mJTUdlUxXc2c+t3raKfrb0luR3d7otSQu71OatwboasTx
         vBYXgRzUXRKbnpdVBhMPGW3Md2PnVQsj+DegthFEijKwUJV9h/QqRdVCuy/pCJEofFc0
         iz3ognjeyL7FwJBA2sxOiQAMh7W5l3D/tYL33yisLSnz0SnAOFHh9JRQcrUaAsgXz6bz
         zwfzU1niNpO8xOHDVc6YWomQSNU0CHXg5DDWtxxex//p+AcEM7I5TYVg2rFG5jUzr3Lc
         Eraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fUxvQJOTFE6tJDBwDITTqStZOAACd/nV3kCLPe+IAMk=;
        fh=SxlPJehiDrnPl8XTCZQt/w+XZmvUxrKnofJO0+6/f3E=;
        b=W8j0R/v5ahTgd5XMHw6zIqQNnHVz9pRhfRCYxJ3NQdCjgznmPtyJ9ybFy0KWcVWKbF
         TOEzLgpxjUyqKkv1HAn31ir25y4R6vEcED4QLald96Q57X7Y8kRIifpEQCOxzKGiCVrE
         XuDaBeAFStcb6sQ9BXgsWWueGVnyc4lf9HCVTEZ7RM+2kVBbMQlA9nacRzS9DURAwe9l
         KOjzWz377kscYvVKB61pgXNfS8KwxUo9EUWJZ/+aqXVhGZlNaiThLUcLUCqtTnp0YHvH
         kB2X/rHJH4fTm02CwcA9JWQGaxk4guYneupr7rvVYLiaJT9QhsYix9th0jfcW8dT0TZ0
         VR3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773679879; x=1774284679; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fUxvQJOTFE6tJDBwDITTqStZOAACd/nV3kCLPe+IAMk=;
        b=GWeTC1YOmBX5CM9OwS7AQY2jGZ9ibHlUS8pe87azfTsGM6X8yrevujv2vIlNjzYTAi
         0sPgOWS+HyujX+Q9BU/NJDMFjx1zdIZ5kqvJI7djG4NH0PF8bGytHahkEmg+KtOxM7Pf
         sSImrMa8c0Wk85fA0PX/M85HvjSWx5RPtIf6xIPN+Da1L9mRqlxOvNgS2jVKnPI2VY6Q
         tatyH+8pGrs4SiyN3a1O4gvVU8fb/vcYlbRgXCMYS6a3P68RVROxptRIPuq/pTgGN2yK
         H4n2XhH3Af/+6VgnatxYnePrmUZTG/CMRdY3HCgt8UHPOmVOThFvHSzd30+9Ug3kTJKa
         Itlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773679879; x=1774284679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUxvQJOTFE6tJDBwDITTqStZOAACd/nV3kCLPe+IAMk=;
        b=qD0sYK/1ryRe2rAilEphSO4Hg7DNQvO2vWYTLpPA2Yx4ogA3E659fuzaunLEDlzPRR
         9Mwst+fN6qFyJXfy9WER5BmzDlU7y+Ll7atNpUu/XF7BELEeDLUeG5vaA1q9yXHUomTd
         mPzq42q0A0usV987cdycaNr+i2hJLbXsiWVnQSt5KD5NucwFDhhbbpH8GTcXw1TKt6RJ
         PsxWQCkF4SDKWtpAcuqouGr8ML/8HLw+ZFGHQn2EhmWXNWAlKkg6C9mMF342rGvgOlsh
         Oe8as44GX4rEfet0RYOmDH53UT14/gVs/a56xcD8K47XlnHImAapk81C+ebXRLYpQTNw
         rfeg==
X-Forwarded-Encrypted: i=1; AJvYcCUwGaNG8TmlQfUjNFfWQS1GELEwjpUQclsGk+rIyIszOxndN0GQY6kf69r+ckFotyBDoJ/j@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5txopn8wFWcNZQ2Xn4DyUPb1klnasHL5h3Vu/CIKXeDUi1UGc
	medTKUbzawxSzca5G68rNUHzYo8I1tvGHOb+4rELwGdqPw7P+n6a+tpWA2BVufx/ggg/Weaqkuz
	LdVdTd7pOSpQ+BicP+7aMlO3rg2xGB9OJQDzj7rVC
X-Gm-Gg: ATEYQzzyYv/cwN58ug9hhfVGwVa+VyJZS8g8fnYJh/G+I8mTl+NNJs5nynUHjtnGTWd
	jTmRlESOavAlQZBCBWXsLN11frrAckGdBHu9ExQHaHB6u9rCjPK2UcxBphkl1YWvXkPKJqztHYQ
	YUCYKkEhiySCisGQ27TAhBHd3rKfvOG11F+PrPRgPXpxv+qqnKwyQWgGgwq/jUe9cPMvhtfsMpA
	9ibFTL8q3aX4lMulqr6lL4ZO3eDLLz5KqgSMKyjlUhxQs2BtPdTcVCYJFYeMaLo6qtqu+kEUJNZ
	WdOBbdfpgMtnvP05VM4fUUyAUxvhKfdCzqGKgA==
X-Received: by 2002:a17:902:ea02:b0:2a9:5db8:d651 with SMTP id
 d9443c01a7336-2aecaa0b2a0mr150675065ad.25.1773679879066; Mon, 16 Mar 2026
 09:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
 <20260311-kcov-extrecord-v1-3-68f03c4a05ad@google.com> <CACT4Y+bRTjPG7pw-k9okGZ=Gv81b+_AgdQcCxWxpF25guYpo=w@mail.gmail.com>
In-Reply-To: <CACT4Y+bRTjPG7pw-k9okGZ=Gv81b+_AgdQcCxWxpF25guYpo=w@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 16 Mar 2026 17:50:40 +0100
X-Gm-Features: AaiRm52292XoJB25f6DdnHqQStG9zrnQ2equKXaur8ny56v8DEnkK68PiqUxUy8
Message-ID: <CAG_fn=UqW8jS49HmdB3FuFvVLHSfKGHXNhe9Vfu7NsziXZkb3A@mail.gmail.com>
Subject: Re: [PATCH 3/3] kcov: introduce extended PC coverage collection mode
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Jann Horn <jannh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Setting/saving/restoring this flag is fragile. I afraid some of future
> patches can break it in some corner cases.
> Can we have a new kcov_mode and use some mask check on tracing fast
> path, so that it's as cheap as the current == kcov_mode comparison?
>
> +glider, what did you do in your coverage deduplication patch? I have
> some vague memories we tried to do something similar.

In fact, no, we do switch (mode) for __sanitizer_cov_trace_pc_guard() here:
https://patchew.org/linux/20250731115139.3035888-1-glider@google.com/20250731115139.3035888-8-glider@google.com/
