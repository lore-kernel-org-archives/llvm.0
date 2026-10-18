Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854D4360EF6
	for <llvm@lists.linux.dev>; Sun, 18 Oct 2026 21:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792358688; cv=none; b=X5LxGwM3+RcEHb5XQIe0bJ8+HEkXRMutF/D8T2vUN7jh+Kt00hcK8YL4LMfAkwWa2cbETPvu/C0vRuPN2jw4wulszy7my0vKZfGGR+rGGCpuFrtt+gsK0anI2o2j7hJSoqxJmXaf8u4XMR1BeZ0XZFFWocKpR5cmkvdhxVrwxIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792358688; c=relaxed/simple;
	bh=I/NvMy2kh9NjYcDpOl7qvqSIY77dP0Ht8OHckCjwHI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6Su6j+sQuSXhfTb1eZ8MLU5AAa5nGf9/gEWF4rKp6P5WhUR7fi1UVxI4n7Fm5uAZp1e2/B8+bUoCn+iadP8W0AHZGz9Q9DmiX+iqmhVAkIqNPNuNM05gvz509DecMwtUkrTv7UlcxMO/qs6+Fnd12Cnqm/+7IvKi+pLU2yIxKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vi4Khi/J; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vi4Khi/J"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso198771e87.0
        for <llvm@lists.linux.dev>; Sun, 18 Oct 2026 14:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792358685; x=1792963485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HPMK13TgXy3bouQU8dM/uJi5pR0kwrcIJazW24h+v4=;
        b=Vi4Khi/JQsRottbIKJubwG22NqJq1D+7Yh0rUfW83vKdp1GJFIJwQQ0Lbg0JWR+HnY
         CwEQpEJZiKEU5PAX7bb2OWLgxzkaOGRnr5+w34hHgLKY9OCUGD+5eUKsFEZpMMhLZvgi
         4Atnp2kfTPI4VHC69uqHAbfu37qho3nsCGuEZMSnIXqWCtj+vt9bJyq7ViQoIZ7t/2Bq
         NEBuPk9iAqTc/vpHZtvtszyvXJnlALyZqroksXzwZUMKjMea2urIXv8PtTSad8eLOcAU
         nM3QcdGRserqwdJT8JbdmuP8JvqHhMfq7AayudYW22hiw0wVjFSCvdBcR5l6G5ePaGn0
         L2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792358686; x=1792963486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HPMK13TgXy3bouQU8dM/uJi5pR0kwrcIJazW24h+v4=;
        b=o1pg5SH4AZgAFCUydS7Nqe3yRIlZgmNTaprWI1ynHbv42o6mf+tfHHzlKMyQcMfObW
         48DiWB+haLaKjL4U8LpvRGmpvIm/YOn8WD/Wx6cGM6gpBeXGibcZw+060j6FpCQEDSPb
         dkxSv69eBdYnra4OOnWmMwcIZe6ym8uuPulwnEWUQRgWv8HTaNPTDtmbnUVryl3aurWz
         7BGS+hKmL6FaqaGzVP6WcqzZN6Yv7XXstNj/o1Dlzi172zIdsRpbnI9OuUi43oA5Jjpe
         HSS7Z2QaBQNH0pWTXa+WHaGLQR7Bm5/FZnK5tE6PzJRtL14Vw5Ne7Yd8DImTYymBYL8D
         ynpw==
X-Forwarded-Encrypted: i=1; AKwUvBwk17Vd2VQBMt5ScBCuzoLcQAwfB6XVEk6Kt5EQ/HAPmOPYvRmTVCs5L77bryR86IY3B+Pl@lists.linux.dev
X-Gm-Message-State: AFq9FYJH0roJEsqugTur1RyplXn1B5quE2JPmGBITY8uU+iSuKqIJU+F
	84hu7K1A1Bm/NWxC0zcJLtvMRlYEE4aXN4hyW63QwgvaGjWyuR38J6eG
X-Gm-Gg: AYBFou1vAFjCTKCvKJ7Tow1rTJeDrdZ/aHpLmX8xqLwVGEGG6IhJWgs1NRKWSO9voEN
	HKSuhGLZxt6MS9SXUM3tyPXO/JQWx20F3CG7tJygUzFcSjMHjIDc/Xk32xxfHPqu7pgVN+z2wqj
	Kiku6nbQUxaTefDQ9eKdmVHLs5f6l34wUpFJRQySEG0loCZMuUw6Y1u2P2IH276+JZq2ASr55Ck
	ralGLd89wMl/7HqNj5o+s1sD08Qj2mqBaox1qMUYmnzWnDKeag4Gv9Uiq9Qj6Kn6g+hv+xWrudf
	ri5/AqG/OA6pLHBe9EKCKrSCpIcxW7/NYurGw1hQ10/jO83IKY8N6bfdMhBfiEDSINvNcMAUNLR
	GkADuJtPDYuSXtNfbDCwmm7hfcUF1gPPlyI/OiFh2pcg7sHjVt6XF+H3qkY9/7sG69zPgMn9O5K
	KjX3xiSwqxSVcDf9jVv3cyzoIlfAr1Bgvq2L17KrVj+UPDhWSx4ckiLTMtH7B7lSYs+9qXFo+XJ
	ZKa3IEj4etljsMV8jdoY9nd0dlbFf9769LAnnnpgIvhr+w+oZj9GnN0J3UlSbsSBmquvvUXnGJA
	cGgAU9I=
X-Received: by 2002:a05:6512:6c3:b0:5b6:10bc:dc44 with SMTP id 2adb3069b0e04-5be47919a66mr2712000e87.27.1792358685313;
        Sun, 18 Oct 2026 14:24:45 -0700 (PDT)
Received: from yantra.. (nekmmqtaaozvmkd1587-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5185:c9b3:741a:edb7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fd02esm1582832e87.10.2026.10.18.14.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:24:44 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v12 0/5] iio: pressure: dps310: hardware FIFO support
Date: Mon, 19 Oct 2026 00:24:43 +0300
Message-ID: <20261018212443.43473-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011145914.05d1c7a6@jic23-hlaptop>
References: <20261003195012.92948-1-zoone.rupert@gmail.com> <20261011145914.05d1c7a6@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 11, 2026 at 03:00:53PM +0100, Jonathan Cameron wrote:
> Applied patches 1-4.   Not this was messy so there was some hand applying needed.
> Please check I didn't mess it up!

Checked, matches what I sent.

> I replied with my view on patch 5 in the earlier thread (just now), but definitely
> open to hearing more opinions on how far we want to go with annotations.

Fine to drop it.
