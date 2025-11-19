Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6375B364032
	for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763576065; cv=none; b=TGm4YVbCoFykLGQzTdOljSGcBC1IN8zSZDw2Q6EnYIldmOaxFPgv/gVCxG4o2Xv622RwfhIIS+d/Ai6HRVArM3xusLnMDdMJMat82Otmbo2PqODW7B5WbV96rCrcc0JG6kLEmriN9ZXkB1dULxzG7XK3+fvendeUfF/2JHTxUTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763576065; c=relaxed/simple;
	bh=fq7yGHxuW0cDFvgb+sXTHDvNA06ZmRk29X+WraNFCws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bJ3cLDOOT3w2Jeaoed67qmtwfv6Kzocg7jYpMUvyuoV9M5bDH3CJ0d+kFgRtOJgjc3As2hQlnn9qEJPlgd5SMxrScDFPPFON+ksHbt3amAgXW15ndY+Gqvz5se9EjEvd1DD/1B5CoPMkn6SMzCRZYyL+HmXSajlx/F2PUssnKwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T9rHpsGK; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T9rHpsGK"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-43377ee4825so299825ab.2
        for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 10:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576037; x=1764180837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0H4D6A5/Fz6+ZVWISfjUYImiLMbW+d5U+Obqut6PQU=;
        b=T9rHpsGKXb/2tTOc8FakR1Ri92Qm5akDUZyhlz6STsuNO9b4iqbLdjCDNLqAwKSz+0
         nLROojpkOdFjVuuADfTkUiZhHUVYLmWpnf8vO1k84UBVVgCY2GpCZ7gRdVxzW3P5WAEP
         FaoRc7IjIU4x26LKbnsJu5MtTucQxgyx0OcFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576037; x=1764180837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0H4D6A5/Fz6+ZVWISfjUYImiLMbW+d5U+Obqut6PQU=;
        b=MiDx95ZYwBvjw0t1smpduHRhVwcM0dDrCra3Sf5pj1GFDTRkOFtT7nx+vUf86icMdu
         ZmHY9yG0vx1EF4pzitLQR8ph9QBmhItlmzVR5ZKCAUtEUu498+epQUKKMLmC5ruNgGlp
         9navD52HpS5vycCsAA/pXooMFoKjUL+UEtIrBiIv1UcYzrsfeC3FqxJ736ypu2QGZfAe
         1mtzLStc5X8dnwnypwcB8AVgDfGlCwU6Uia8JpcQzUu7XuJ2SXEsN6xvwmIclpjryc0E
         NOYrgYBniKbXr8TJDqiHrzFObcC2Yqq+yGlcvrMA3HleKM4CckRisdbBNDt0wUUnTNTw
         Dhiw==
X-Forwarded-Encrypted: i=1; AJvYcCUR4+VIr1uqFrf8WAHi3bPJrrk7qhBO4FCN6ajgB5Y7nRR26LjVzphpQgxvFoQxtEHkoaMr@lists.linux.dev
X-Gm-Message-State: AOJu0YzMLLScvrl/O37crMGjJvovC35p9eobiPDHQtxs6RF8leaLQ4An
	RxD9XQBzyHa7mGrUQ9NVOo+VWocTVq5Zl7M4buYUY12UY9XAI8vhONtRGg+9H7QBtA==
X-Gm-Gg: ASbGnctwmDnaR/h9G7b1tahL33V0Ha2Q79ZUVunpmRMY/8UP3L2EWptnvvD+iYnkSq8
	3+RhG9xkL9auPa3nomS2q5cwAM/prjLmh5fya7wX6/e0v0intkp1LE/J/lMZziNStySQqDQyovN
	qlEC8hdgHn0hSb/joDnQhAPTQz3vbE4IDNAtygATZOAggb8MQs5EaA0Hyu0s6kELtKn37yP8+lF
	AETqVzngCH2+/nheLJCa6FAD/4++pnYU63AIUebaBQ52DSI3b47Fbq5V2Evr64+I6DoJFqkYtpI
	60aTGKUFwN4HTtqUrNSFG6ZHz4gdBX7AHEl15LB1pKyfrcFs7tsUnE2oAvgnQw/uYYyskyyJD8U
	FFwbmOd3sNnPqa0XJrTVXBMlvPrzkXeDXb26hd6IvY8lZQsxaveCs0kJpgy4M2+p4T8DOSH3qDe
	5Hubty
X-Google-Smtp-Source: AGHT+IE/2JEiabneT+vq3UyMtVUuWtIZXvc2b4MEv6Jrjx/DrjNxhr8iITGjEUqkm6x1qj9D1rKrZQ==
X-Received: by 2002:a05:6e02:3789:b0:433:29a9:32db with SMTP id e9e14a558f8ab-435a9073140mr4249655ab.24.1763576036980;
        Wed, 19 Nov 2025 10:13:56 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:13:56 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Sterba <dsterba@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rong Xu <xur@google.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v6 0/8] scripts/make_fit: Support ramdisks and faster operations
Date: Wed, 19 Nov 2025 11:13:21 -0700
Message-ID: <20251119181333.991099-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series updates 'make image.fit' to support adding a ramdisk to the
FIT, either one provided as a parameter or one created from all the
kernel modules.

It also includes a few performance improvement, so that building a FIT
from ~450MB of kernel/module/devicetree files only takes a few seconds
on a modern machine.

Note: I included support for using the existing cpio script as suggested
by Ahmad, but a fallback remains in case that is not available.

https://lore.kernel.org/lkml/CAFLszThpTg-FBoNG_tQ0xve0LkYWER85EJeHuem-_JUD8J1Ocw@mail.gmail.com/

Changes in v6:
- Using the modules.order file instead of 'find'
- Use gen_initramfs.sh where available
- Mention that FIT_MODULES just needs to be non-empty
- Make use of modules.order instead of using 'find'

Changes in v5:
- Fix 'use' typo
- Add a new patch to split out module targets into a variable
- Build modules automatically if needed (fix from Nicolas Schier)

Changes in v4:
- Update the commit message
- Provide the list of modules from the Makefile
- Reduce verbosity (don't print every module filename)
- Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
- Use an empty FIT_MODULES to disable the feature, instead of '0'
- Make use of the 'modules' dependency to ensure modules are built
- Pass the list of modules to the script

Changes in v3:
- Move the ramdisk chunk into the correct patch
- Add a comment at the top of the file about the -r option
- Count the ramdisk in the total files
- Update the commit message
- Add a way to add built modules into the FIT

Changes in v2:
- Don't compress the ramdisk as it is already compressed

Simon Glass (8):
  scripts/make_fit: Speed up operation
  scripts/make_fit: Support an initial ramdisk
  scripts/make_fit: Move dtb processing into a function
  scripts/make_fit: Provide a way to add built modules
  kbuild: Split out module targets into a variable
  kbuild: Allow adding modules into the FIT ramdisk
  scripts/make_fit: Support a few more parallel compressors
  scripts/make_fit: Compress dtbs in parallel

 Makefile             |   8 +-
 arch/arm64/Makefile  |   1 +
 scripts/Makefile.lib |   6 +-
 scripts/make_fit.py  | 293 +++++++++++++++++++++++++++++++++++++------
 4 files changed, 269 insertions(+), 39 deletions(-)

-- 
2.43.0

base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
branch: fita6
