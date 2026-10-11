Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A6137750
	for <llvm@lists.linux.dev>; Sun, 11 Oct 2026 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791734387; cv=none; b=ryl3vvkPrwjecYLiOoQ1IDoEw1RXcgZ0cHy17WEeS4ubp5FhgxkMrIvvZvB5DJlV5JRvzNcG4TAUKJ7ysPulUrPGWW3HH9c5o37TQBbSozdoaUy3vJlibdH595PcBKfnIsQoo3pG/bAymz5c2sCJZQS7taDJUio38dTY5SUCWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791734387; c=relaxed/simple;
	bh=tc916MmcKzeiSk4IxVqtEZOAPg8oprGZK7KktYFCscg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rnzNs0bfK6KTgXgc932FlEHJq1KqbeFssAozF9IFBjFTRYw2mYS3WZAj4cXlGiJ6VUgjBD/DaKQy3629jxMA8fg++DRCyCOFoUs5r72VRzF9CQsL3YW4dc7imD42jhMCBiBG1XxKU+GFJb3tDK9va2oCss8WhbykkNl0djCrF8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSyy0it2; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSyy0it2"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5338f65913dso14364441cf.2
        for <llvm@lists.linux.dev>; Sun, 11 Oct 2026 08:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791734384; x=1792339184; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tc916MmcKzeiSk4IxVqtEZOAPg8oprGZK7KktYFCscg=;
        b=mSyy0it2DRhIKVjFkSsroT2B0tSYSJgK+UiYrmRyW5qSv92qhV2Y61U1g3eriB1XqE
         mYyO21fROZUQpJx0dzNIhucHxRx52o7yk9fUbMj3Z51XV5cEHl0kGU+ucz0WRhZ4NLzs
         i0B79oNkN3Kft4+PH8tkTeJwRHgkQ2BbVEpCaQlR9CjkqdDQYfWgyY3dP141Q8jDr8+g
         ofx2dDxDEfGj+GQSq7XV99Bed4jGqL2l/Rp0Lpdq1X2f0UqM9AEkKQ6rUeZ4G7Zs/DxJ
         +b3LvCxtGYuI2WNdjOoPloMnEBVfUxXUv5pO6scgt0hp1Z3itRobTeX0wHdObLoyWsyF
         92aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791734384; x=1792339184;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tc916MmcKzeiSk4IxVqtEZOAPg8oprGZK7KktYFCscg=;
        b=mng0ZHc4HpISlp+3Dh0mJSW9FMO61N5kTmgnm/xQg/5NzJgIONJdN0T8jY5zGYARqu
         C12uKBapIBnequMxTQ8Z11HhbHgpFAU/yji6k3+1qhubjk7HRATIoNR9zd7Bol9JaqGU
         1TSrc5elCITIi4HrcKmjprGevq+ByGEhpVyVJzTfUynE0mV5UKcX9+QJCV12tAj1KdKB
         p4j/ZPAnOluVkfG1cvzoFhICTXZs96UN14P2itdK8aitRNorUQfC14CmLV/YnbEIHugv
         MaV+PglUb1IP9uici4tc9x9OHJ2SzhCTDD43GyDP/sDJ37CiwTXKXoy+uk4NHU32lQoh
         RJdw==
X-Forwarded-Encrypted: i=1; AKwUvBwDDwLT9fKsdMnm9AcNno1ogk1wYRosFdab4DwPy4acLuJFQlAB7v90KBFe4iPicd9Sm2er@lists.linux.dev
X-Gm-Message-State: AFq9FYKuGr5chrXcqLmH7SBSl7rhNRgPDhEB+jnN5H3gYqM7QLilSh9j
	L7C1H04SPzvYjsTcZkTOvJV5ZlTuaMqsEV7vrpPbJ6yWnI5ydefteBN1
X-Gm-Gg: AYBFou2DSAQi27Oqb/n2u0Ay3/8+iDubQIW/COnCLXlSxQkXjYKauBn0HQan1/HULSQ
	8stBbkSaPGscF8bmfT6jOmN2BeC6GjiRaLV+XaiYeyxE/iaOHTqPCbLgmAPzVDxAf7riD1GSjwN
	846CzDkqN6o3yd6R/DB8wSBy/f0d0JxMp2eBnZffBKLhRONQ/uACh9cfP9xRogUcBiZPM7w22jw
	8SZBscPLMhZu1npiw5pAY7Shd8JQSKWJuqoakZHI0Jwb7dIeaeODwh37klwZ0DTAkb2DWDaKncG
	irFLB62BE9td4CHYeY/isgfm5qFBdhtnIQc9Dcyn/DMDeq+HSieWqWKLfu2drGffi/8OIbzyETa
	pDGK9rsWzSPiWeVZxv9wo8bxwUOY/lIHEEJIfzcPD/kBybowy+qxBtX22GGThJotEEZRvl2lq8R
	iEctNcxdHR8OihqSs3emFUakMfGiAqOOWHyyvP9BAyBemc5rybwk+Q8lu1vuokO31GbWIbwSqx
X-Received: by 2002:a05:622a:54c:b0:533:42e0:a1e3 with SMTP id d75a77b69052e-5359fb6fa39mr134548311cf.34.1791734383760;
        Sun, 11 Oct 2026 08:59:43 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45a:2646::3d0:17])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7dba11sm59816441cf.26.2026.10.11.08.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 08:59:42 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: mic@digikod.net
Cc: gnoack3000@gmail.com,
	m@maowtm.org,
	linux-security-module@vger.kernel.org,
	kees@kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	syzbot+a0eecb22de4d821a9e5d@syzkaller.appspotmail.com
Subject: Re: [PATCH] landlock: Drop __counted_by from landlock_domain.layers
Date: Sun, 11 Oct 2026 22:59:36 +0700
Message-ID: <20261011155936.8033-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011.oe8teu2LahTh@digikod.net>
References: <20261011.oe8teu2LahTh@digikod.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mickaël, Günther,

Sounds good, no problem at all. Thanks for the quick review, and
happy for you to take your version for v7.3-rc7.

Thanks,
Thang
