Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DD33DEAC4
	for <llvm@lists.linux.dev>; Sun,  6 Sep 2026 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689237; cv=none; b=tSRc1I+FRxEkcSezxOPLfWMY/Z0ujzt+FIw2o/AInlcozu2pxNhVBiCiPcQqeGqW1vkLiXXR57BN0JqjNJWD9+CsBSb18xlfNbA3i0QYHPF9gJi81UErtUILF6k/9/DRQxvMp8wDDAr6OUTQ2hgTf9eymrhGUQ23bLw1M6ZFAeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689237; c=relaxed/simple;
	bh=zdPwZrvfJK7MzyGkqu9cVdFV8gXhIeOCnL3vxgmUvv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MN2QQPEEkfdLWcYeXQo1741MtbAotQx7q9LGJ+W8itC8gBzDgniB4wmQRU0c4bxLN8eSANFyeIwy6NOonTdrCYIGnjumUOnCy+WndcMrdMuWoFL7DG/qj8TAPw6HGnspzWEyK1cqw0KnIzZjgiau4fUwSKNkfNdxRKdPJJNGDjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVQmWKZ8; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVQmWKZ8"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso4473582e87.1
        for <llvm@lists.linux.dev>; Sun, 06 Sep 2026 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788689233; x=1789294033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3ouU/PkVGCvjpETYDZTI0h0W7DBwEzUInQxKxjqn74=;
        b=pVQmWKZ8bxgjQm4bbtHZ6xmCh79s6OheFhx5AZS+ovHyVnwJ8nPSpD3YkI4fRnoKVY
         H1yBH2a9cuQ6+zPc4QgBCuHg2t5sgn+8AD+ZnP/MZzNmepwBA1HFrPlVW/jqFhzdFs7y
         HbWE+35x7GgGFSPlK8f4V+uRE08VC0n6zRHMH8b+zgNJjYnELYgTPFzYhLHbxXx1hUjk
         Krf7Ibvdbyeybo+YNxooOG1r86KIuCXQhODyDNRYJuY2mvafGnTsOOe3lHnRdD5TDZpP
         wRnSCyC0HaR7hWZWip0YF3Pyx5E7JGc90guhONKg8emcIGyyVqyKgKEcicC1sreSmmb/
         saqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788689233; x=1789294033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+3ouU/PkVGCvjpETYDZTI0h0W7DBwEzUInQxKxjqn74=;
        b=QUAQ2Z75r92baLpMV3EdQCRKM8Z7rEzzuPcy2uMmVFZ+t22dqj7fR1TQgazHCZCCll
         JdkT1kwcgK/8AZrCfpSifwJZ9sEQ1K3ckw6jM1MLfCyamz8bHh0kGoX9SaflIvVuxEsZ
         9qdVJezF4IfNoBUqMafbmESHghiPnbKZXh414/sSJbkqjd9zOFnq1+wmhFed2QSoNseP
         +g5Dag5g7mrdXIMdXToExdhbxG7dDyBtv6rJcWCzM+/QlbrRFOP456iiuUJOttKYt6xW
         FS/Mwq64KyahSRXBDcW8p0h6EE23UXtg3ye0zsUQ8e1nhUzfzkSXQV3W3SO8Nu2euytO
         /ErA==
X-Forwarded-Encrypted: i=1; AKwUvBx2Yk7sEK7k9gy0DGfiIRYQyDcDbQGXY89z/sVf+tAC5OS0wT6/OtiV9sQOIX2nLkyqiES/@lists.linux.dev
X-Gm-Message-State: AFuF++kzRirHlkI212ZP7t5CqH1a4Y45HfBrPaDSXCt92K5/BmfyzMYl
	GMHfYzFy9Vbc1O8kgCjIvUdUvfMkuF4EAJ4dnrl8OCkS1aIsy+wubYEj
X-Gm-Gg: AYBFou14nWY0KOev6pvouwUU+5h8ujioyP2pmbsITF1S7ykSxEWc7paarrSRmjwxYCi
	peQXxxptPq9u3Ye1eELE92qOmcuZ32t3TOTExv6t6bx5mY8rrzPVwOQQWEPRQSDjiGxNAQ4mdN5
	K92jGsF4MzCdhkvCjKoaNKwXn4fExC1L5zZnyGgf5gXxnqubqK+EkRWSTyhyYM6+eMS/UFbsN+Z
	l2qSdpfkETiDqXsOXxp3FQ/A6xT019zw7AghUQ4+PmQs8lC5jwfXQS4i9SBuD3reEeQOvucHvki
	QoLAEoe7HPXyTFgOUNF0sFuabT+ijc6qsUgmFHi7ma5XwNiUZFhIwBz4lK2OKPgIDNcK11vnh3t
	w88QNy/Vi5UB5vzop4R2DJ+/SH6JcQeoG5JtSF/KUV18FeiZaBu1S2BKhi4Frm6BSn3NZGWVltg
	9b2p/C8tbYWZOZgTAncnLm1+FTOQX7lUIAziu5akY+Y1CamUcFnNlCKOJcZ7CVoY6RF5t+/sihR
	a1JdkUUY6uAaCz1/+DC71plDCRKoSQxAhL8Xun7mo8mk0OX45Lqi9EQ0Itu28c3SAuR8g==
X-Received: by 2002:a05:6512:3d02:b0:5b6:10bc:b863 with SMTP id 2adb3069b0e04-5b61768ca49mr2220492e87.17.1788689233221;
        Sun, 06 Sep 2026 03:07:13 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b619820db9sm1486211e87.54.2026.09.06.03.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 03:07:11 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 4/6] iio: pressure: dps310: add triggered buffer support
Date: Sun,  6 Sep 2026 13:06:53 +0300
Message-ID: <20260906100707.435298-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ao1bBFkLXIIgNl49@ashevche-desk.local>
References: <20260824201203.396651-5-zoone.rupert@gmail.com> <ao1bBFkLXIIgNl49@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 12:06:12 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> Hmm... Is scoped_guard() too bad here?

Jonathan asked for the plain form on this handler in the v5 review:

  It isn't necessary to use guard/scoped_guard() for all locks in a
  driver if they actually hurt readability.  I think that is the case
  here.

So it stays as mutex_lock/unlock with the goto. guard() is kept where the
lock runs to the end of the function.

> Side note, at some point makes sense to move from 1000 to KILO.

The site above it is pre-existing, so both should move together in the
cleanup series rather than leaving one spelled each way here.

Rupesh
