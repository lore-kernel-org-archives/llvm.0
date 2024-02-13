Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3751626DD
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 21:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707861500; cv=none; b=py4hAjRvIfKl9XAXJVnfcf5qvf24zWrh++SqYt8+gkFMYFkyOMPzE3qDbAg+MnvAr+4Nu3iRZImtQM6QNUCjKjgsQrUJd9BcHYanLpY1mESrt3kQbJ3Hyo4VvqW6nYRkNcuidbbtdV73z1wJqts8incriG+cYAippY8EmkaLesU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707861500; c=relaxed/simple;
	bh=fG6Q1QiFR6PmovjVj2fEe8hauDiQX9AI9JtszF3W1lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8Sx/w4eAoUEa/1ZnrlFQ3U4a6f3PI4K1B7PwmUYGR4skwT0f/hR/LXIhTBIaajgrLDoEIP7XL1hajLtxvLZ0izSZ2uObiN93L7P612MwSnIkoyFlffRZDCGwSsiHJ/4tT1UyXjRwdFANfwN36Y6z07YRP1Fyr0u4BM3pxRGZao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cWuBRhlr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cWuBRhlr"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33ce57b2283so144962f8f.0
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 13:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707861496; x=1708466296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JTFkdUvqDHeua3DO9ZE8KGhtt+pXkN0o9OOhcSIs5kI=;
        b=cWuBRhlrHkZHLjNMZM2YQuetMv8JNDPq4hx3BXyBRmjlm0tHMsxPNVXrDn6XJIOLnI
         Ax7/B5o119dBVsOfRND+RPiQZcGzVMcFibZybLauIwcfTxRkidxukRUbfu+sxRhLGGRJ
         3mPMn8+WYVhXctk6P+uFydr5VDQBMU8cL4FS78O/OTJCZIGOHP0VbQVlhzY187FGGKwo
         Adil5jpJqt4ibgEW4kHjWSfx4L9pfTkL4bADIwH/5f0gnF5/Qirksr01ZPcKqpG3wt/P
         RaEmTz5b8dYUztUHJ7dOhf9v2IvARRBz/2Ac1c3VjerEh/VVs1tqFmbbwdup+w0bztxM
         y8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707861496; x=1708466296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTFkdUvqDHeua3DO9ZE8KGhtt+pXkN0o9OOhcSIs5kI=;
        b=RsV2SCmEPINyeSJ2lHz1CPH2sskmrKckt8m7C1RMfGbgl8evtlwJAgtGxYEPGvRBv1
         5CnvuuA8NnJL9K+0C2ZJygDMhtMsuTLwuTGga/gsqwxacWYE9JLtFrQIrrAlh1RZypS1
         8eM2P/BlOLDk5Gm1Y3O0i5mXVlZPxNt15vIKWQ9rrvu+7B6oJyyJ3AJrjGKUGKmBsn9Z
         reen8TLfsO0AJe4RaQfrXmbVteHoFQeLy5vL0BZ6vZ/WJlWRrCCSeetLXW5320AIPqL4
         G+3s9ayGbd1yEKnS1SKSwMNekhgQwQ9VJFnY3knJOHJ0GbBA3nGyrOzSLrYtOS8LPXyW
         6yFg==
X-Forwarded-Encrypted: i=1; AJvYcCXa4JgQ1fXg0e8NiG6Ap1GcACDDhjgFTawc7uAKjuhTZUCKFRtued3QIMzDo1vq1QTndh6/hqez38lNOqXkk3iIKA9xHg==
X-Gm-Message-State: AOJu0YyDsLXl+KdAzm02QAPPFYe1+n63vB+7CfrbG7K9k+x6+a89SYcy
	o3WA8nPSeZaBWOaTlPmOCJTiYsnOyj+E9+zDwud8O2+p6rLUzL8somYLDsy+g3I=
X-Google-Smtp-Source: AGHT+IEvF9YysnB+h9yQmXedxh2DZ1klO9I/GaHAGPGFJ/xyzrf4xPser0a/xrJw7KqwTxEY1n/K1Q==
X-Received: by 2002:a05:6000:1e84:b0:33c:dec9:a269 with SMTP id dd4-20020a0560001e8400b0033cdec9a269mr403220wrb.57.1707861495863;
        Tue, 13 Feb 2024 13:58:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDhr6+e+5qjE0+9Mw4cEpFjAFXBxy7lvahl/dXNLc4oKDO+uMl+AqZFDqC/VhnfJ2IXWUNIqwOxedeeZ+wjrmUZc1Fe2gpVedxuJNN5OlaRbtIaAP4oPoW3QmhRzlxky9J/Ovv/Es2NvK6bzgsP/Tz2sps2oihr/qvKiqyZ5Puv+B1RAWJlXgOguK7mCZFVDtV7zwLXtxQCQjqUPKqv5+cGOqetxhWGEWgpxTM52qr2B+WyDUin1UvGQp45l7cJ4Ke8Q53c4b9lNfJQctutivgKWXGXWKQMnX/AVO73GxFgBsfY7iFPj8RbGDNOqID4sWqOubeVd93IM/Mh0BJ5J6oe9GTFDwiIjZcu1bQwWUY6Yfi9wBaSaiM8gs6eM3zYjxPRzeQ7AwLqQ3iu0FUPuXcfBHtuWVL0yqORytKv6KuGmrqsva+lnxTYKgm54WQtmUuURzwV3QouQiA4wtrTdk3uSf0AptwXWMXM3R/iCUWSJqBDAMf7Mu1BmnvnJdz6t/rDMkViAkdhWAQVIthhnjPAMyFqW4BFbsWCWbJgM9TfxNzdN9tCCAyTJYO8zqP6+2ZX1fda/Wmf1xc0uoCeB4M5wYHHTNAKcEdLnk1cT38hgOq7mc=
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:af6b:4350:776e:dcda])
        by smtp.googlemail.com with ESMTPSA id r3-20020adfca83000000b0033cdbe335bcsm2415244wrh.71.2024.02.13.13.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:58:15 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/2] ASoC: meson: aiu: fix function pointer type mismatch
Date: Tue, 13 Feb 2024 22:58:02 +0100
Message-ID: <20240213215807.3326688-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

This patchset fixes 2 -Wcast-function-type-strict warning in amlogic
audio drivers with clang 16.

Changes since v1: [0]
* use devm_clk_get_enabled() instead of adding a dedicated helper in each
  driver.
* Split the patch, 1 per fixed commit to make it easier for stable.

[0]: https://lore.kernel.org/lkml/20240213101220.459641-1-arnd@kernel.org/

Jerome Brunet (2):
  ASoC: meson: aiu: fix function pointer type mismatch
  ASoC: meson: t9015: fix function pointer type mismatch

 sound/soc/meson/aiu.c   | 19 ++++---------------
 sound/soc/meson/aiu.h   |  1 -
 sound/soc/meson/t9015.c | 20 ++++----------------
 3 files changed, 8 insertions(+), 32 deletions(-)

-- 
2.43.0

