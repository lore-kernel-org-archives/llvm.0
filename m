Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC2154774
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 19:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791054683; cv=none; b=Cc6IWwjGHQzzA1PVJOGLhSXop6Cb07W0mJJQQrN93dYFJY+qoaL1s635iFBVyoGawU6rYD6ELbjglJ+QLQ2D5f02gyalQfY5SWBcWybHbZCS5Ny+bnHwYrHEoSIAL6f1XwoI6hrk6az+BiWdTvkq5hCYO9KWABse0biujHjGOVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791054683; c=relaxed/simple;
	bh=fbyGV63fwXkPEJ1aVy/GDfNe2j2MUoamF77AMyyYKHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1sqfOe5MJMSOeRPfQSp2Xtw1vuLpExaGZUNrVVVNr0fR8By/ZMhnv3xmEXJEJzCHGveiU2kuUtSldcuTAeQUsOJdFQNRFnpm+G1V7ymZPRxnr05EOX3+woEC/7HBntH5bDkh8O8do04LQVlIV2r2MxnnU7aWv7ssIHRIynU7Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiLnDTEU; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiLnDTEU"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a7858d3a20so7227521fa.0
        for <llvm@lists.linux.dev>; Sat, 03 Oct 2026 12:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791054680; x=1791659480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbyGV63fwXkPEJ1aVy/GDfNe2j2MUoamF77AMyyYKHI=;
        b=OiLnDTEU7SUfRe2j6LjuxW3wEvynJIXu3qjzyEWL//58fD3h6+QdhgQ3zZP8gJb1a0
         zpWg/jfLh3MTamsuZbxqJUt/p7VlT5AZeCpGxn2VeajMfJAdpHWUesTzEnOJp6KWZLVh
         xABZbESVm7n4VrndzW9czS/q7iband4dOtyGiq9Gq+xtropy5A4K1Ju7gJsX6cZtNsdK
         +5hd7sNJ4gFlOyfdLPqLRmoS79sy3syPg+KWGQXRQfnQeTuF/JCnl2wIjYLJmPKUgoBG
         xqvHMyP7RnbckFtBz3p/VRI6zeV8W0t8fTnilgDJFG3zLaK4TokM8ZqGBe/2UbFgWYZA
         kFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791054680; x=1791659480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fbyGV63fwXkPEJ1aVy/GDfNe2j2MUoamF77AMyyYKHI=;
        b=FgADSi3f4oafKfhgxTxO//sd09puOnjfV+d/pzhHhMx0D/MYrOnyDVuFnDZu8FNgid
         VrmwIvOkCxF2K3JpoEgc6/tsmd5iX3RrS1JI4DFCIzRJKpnY30qNu6lPsjZT6kQs/t9X
         nlmsVskloxSgzW+/M83VK/478h8aSv0iHsJP/GuhTJSKEVlXU0vqoCjMa0ssmWfpKb5w
         c3TCOuFSxfBZA1IqAWS1ccALBRzGFoLWsCgAfc7hDGC1KCllrKNTsKYM76nrcQ61BFBh
         MWLTMPvJC2Qnl/CTWaWx3hhOSSgwSmuIxiXdud1vldUM1Fg5l7SysuifkFiyVI6rq2+L
         YKdw==
X-Forwarded-Encrypted: i=1; AKwUvBxW9ExSXSvCqTkgE0Cp40RwKJkCwf2D2ANZ5CaAdDlXlCwTlAgJGpAZxbG5PTTyLSCCTEQc@lists.linux.dev
X-Gm-Message-State: AFq9FYJAL5ewQD9uKfnSIbdAdB21l73jjP9t4ehEeCoEfmXDEm8fbJ+4
	LZn5HGds3wbfjTHCEEHJpKPFom3WIAL7vR3HObFbOxxggLmUUELgGjat
X-Gm-Gg: AYBFou0HrU2+KlRWYi5kLWa9nckaTkx1FNl2mVC20CGSBXjpV6zvXUKo2PipArdDTy3
	4gOHJZz2sYNdtagR6Iv8DsrgApxtswxohHc9ofV8U3WqIIf9xUG+B6I1wsWR5v0p5D6QJDVJylB
	E1+6IIrgWJG4x8iVyvRYRokcs32Hd4eTil/B24dVyU7LMYwkEx6iT9Kp3zlRtaO3vhkbvL37ZTS
	oVYiD5an43Ye6ZsryAS4E8MVkgZ97ZZefX5z6+h5pbi6/+vw7WNOMRAOhxSLX5xQy0vNPpAM5wt
	3yM3jQeQ0eZ6OED3pgCWH+12OqZUhyETT10cAC0EQOAOUo/dgfztKuLWsWMR9PM+JWeUCtkowO9
	JxpmJRtRRfDY6mX8W4NKIeJe006V5cH4dHKzY+rLG6DJxSFan3cxnFOzHwGiAGJOQ5mBy8edUDm
	HeF75EsOg5yexy0xkCBsFzGdEHdhoXZAI5Lxdk5HzfubvIydN9Bey5ed2uupsmLdyz1EYKBnTj+
	CBApdN2ex0j6qX+TLZHEhHWKU6it/3bpFxaGezyg/9VAWEf7eX3E23lgnQR77Nn20txdg==
X-Received: by 2002:a2e:b8cb:0:b0:3a7:8294:caac with SMTP id 38308e7fff4ca-3a97d7e9d13mr1971021fa.3.1791054679482;
        Sat, 03 Oct 2026 12:11:19 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f826dsm23626371fa.8.2026.10.03.12.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:11:19 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v11 5/5] iio: pressure: dps310: assert the lock at runtime too
Date: Sat,  3 Oct 2026 22:09:26 +0300
Message-ID: <20261003191058.35287-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ar9j0O7DdJ7O1DVk@ashevche-desk.local>
References: <20261002072526.250081-1-zoone.rupert@gmail.com> <20261002072526.250081-6-zoone.rupert@gmail.com> <ar9j0O7DdJ7O1DVk@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 02, 2026 at 10:57:04AM +0300, Andy Shevchenko wrote:
> On Fri, Oct 02, 2026 at 10:25:26AM +0300, Rupesh Majhi wrote:
> > __must_hold() is clang only and does nothing in GCC builds. Add
> > lockdep_assert_held() next to each, so lockdep catches a missing lock
> > too.
>
> Suggested-by?

On v10 you said it wasn't really your suggestion, so I dropped it.
Happy to add it back if you prefer.

> But we need to hear from Jonathan and others if they like these annotations in
> a mere IIO driver.

Agreed. It stays the last patch in v12, so it can be dropped on its own.
