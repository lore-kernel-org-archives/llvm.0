Received: from mail-lr2-f27.google.com (mail-lr2-f27.google.com [74.125.230.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C1E4322E1
	for <llvm@lists.linux.dev>; Fri,  2 Oct 2026 07:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925935; cv=none; b=WOXzwjMD+5E1hwsznwnOfVWV6Uewvz7OFMWeW0pHWH25OYYaUltD6ryU1KVcyKRPllq6HZtR0kk2xHF5AmB5cuDXZZprp/NQBxbzGNlqQM3k2llAHsc/iAr9SqSl/1k33azlHcwufr8qbRmN/lQZPG5tzA5GPJQh0q5KCRTaLCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925935; c=relaxed/simple;
	bh=/kQ4fSekPPFinZeyqe+grEE9/hzLsUKUj00QBMn+5Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mB9nxrdsDnTHNpzSC77k3ZOojzZsJZHqIEagOM1NAgT2QWq/zJfo3YHKRbsapqifVeQJVbp2f/yJZ/7quojnwOYNobdhLL9thgbgiaCmKNSDEQbCrO6CbpzxJd+eezCXBm0TjqqXtC0nXy7bDncmqMZGUAMIDoPquCczKCxMaLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieXqNOfj; arc=none smtp.client-ip=74.125.230.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieXqNOfj"
Received: by mail-lr2-f27.google.com with SMTP id 38308e7fff4ca-3a76a5a5d4cso30017151fa.0
        for <llvm@lists.linux.dev>; Fri, 02 Oct 2026 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925928; x=1791530728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sG65+SKn65DP6wBKULwQwiXjO7ctbm5y4pXnwFPOBMw=;
        b=ieXqNOfjes4VR6TEBAo61pN1gkSHc17JE+BZrBfCwd+cu4ICpXgwedb2BF/Ai02ncl
         yFxJQONqFqV99/KUU4z/956mUZ2vE+QiibQCSGWA81ItSLfEIyIi0tIbSG0M/bY7daSJ
         +dOVnf6atUurMS+7J1Eo35tBR8QfVDFgHJ3wJgZmYxxnLlxjmg/kGPNlm4SpIuSURGjx
         Dy2MAKaGaN+KDLGGoso3jM4WDR+414bj7eBXkaI6HC9cYjke8tnom8t32KaPSrqAJcXT
         bjiFXyWbpNeUIAeALRBGDjs8S2Yvo0RApTV6Cgl9doFYcmSOmvQJIPWx3DBl8SRkV0GT
         6iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925928; x=1791530728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sG65+SKn65DP6wBKULwQwiXjO7ctbm5y4pXnwFPOBMw=;
        b=iujTkruUa7a/ytDMKHVlAHJlg7XYmNObrlo65QmEsnH8olPM4x7/k86pyGyUzXFrGR
         ongf0tOqdFiX6DpmJ6IEE/RuMfJrTHhft7W8lm3G7FqbgWG7XmdW4Mr6gL0VEQqwIgeN
         FGa8kZbF1RGBMxqYv/loDt+xiv6RjFGKzZ41WEyJ78WSXmdOxzP2Eahq89PPB60XYs0L
         6ltExKWfhLKB89w8vM5XlG4n4oSuVYm/r+d1x67CtbSGFoe4mdi3gvcclHdYRMxbQ3yL
         gHKijitBK3cuhCYg6GdL6Sm3tCT1GO/4WTH1eoBhvUAHL3K3SoJfFH+r5nodrF1tu8pH
         QvEQ==
X-Forwarded-Encrypted: i=1; AKwUvByRyH5ajJZbCeMNlAcKzmgrWnCfUusJ6xTsTiRTKUrfR+liYf5WPiXgLFS/bvi0FDHJcqff@lists.linux.dev
X-Gm-Message-State: AFq9FYIVyLP9kTJ/NkEyJUS7X4s/70kT520mMcFXg7/TK4HuvrQZRzqI
	seKRs3rkIKYID8i8gR7y5SCHPaMoUJDUM4rcNXoM8EaNUxxvj8Dovk9E
X-Gm-Gg: AYBFou287z4cgAiboKPuMgKorlgb+Y9QTDMm2jyyvM+eVoq/LN+1InzCS8RDrTmso7Q
	eo6sNKYmloMtYCyrIQg7lfUMA5gS6mqZw2sjA/uegbyvETnw5fcYUQFwUVA8puVXstiTIXC7Fol
	krjuAMbC6hHmyR2i9KyNbV+lyWzka9+CtrolHPcjVHiOtkwq2PJkcB1B5k8+Dkt04gw6Vo1cdyq
	/hIl1c3xYHndq1JMBdaEDPmz58nFW8zyXYf1lnt1nE688oJTH51T/OIIO0fCwnaJQDoQT4C3hI9
	0db7ipaq3KOdeQXiNPDWlmP9W2rOcWxLqh9mvNFkPpaYn0vigSlExH4yBIayzbZ7AlSUkywt6Ok
	EATg5YKN7poiEDc6+K/fzJd/UiqUJ725ybCUcp/mzItOTZslT96vPmPYAQyH7gJyzGnCgHBMPDn
	iFA7A+cNmdCX0g5J9Y080oqxKG+5Sa34/kh9J/HLZLmTAVhLcUy3a5wUI2S+JIC7iyHvyvwUD52
	mqbmXfeXWp7A3gjii/MZ2Bt1DPydPGwgQqShuuvnMz9r332uC7NdD/1+9kwZCPeI+v0zevKsSC1
	B5M5RQ==
X-Received: by 2002:a2e:a9a1:0:b0:3a9:2e08:c76f with SMTP id 38308e7fff4ca-3a92e08cabcmr2410271fa.22.1790925927480;
        Fri, 02 Oct 2026 00:25:27 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm6724731fa.36.2026.10.02.00.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:25:27 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v11 0/5] iio: pressure: dps310: hardware FIFO support
Date: Fri,  2 Oct 2026 10:25:21 +0300
Message-ID: <20261002072526.250081-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rest of FIFO series, on iio/togreg which has 1-6 and 10 of v8.

Since v10:
 - patch 1, new: devm_mutex_init()
 - patch 2: devm_delayed_work_autocancel(), modes reordered, unused
   units.h dropped
 - patch 3: drain_interval_ms local
 - patch 5: Suggested-by dropped, patch is optional

Pressure overflow fix is now at v3:
https://lore.kernel.org/linux-iio/20261001121616.109973-1-zoone.rupert@gmail.com/
Patches 1 and 5 conflict trivially with it. I can rebase on whichever
goes in first.

Retested on DPS310 with BeagleBone Black, now also unbind during
capture. Lockdep run under QEMU.

v10: https://lore.kernel.org/linux-iio/20260930100158.957977-1-zoone.rupert@gmail.com/

Rupesh Majhi (5):
  iio: pressure: dps310: use devm_mutex_init()
  iio: pressure: dps310: read buffered samples from the hardware FIFO
  iio: pressure: dps310: derive the drain interval from the watermark
  iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
  iio: pressure: dps310: assert the lock at runtime too

 drivers/iio/pressure/dps310.c | 447 +++++++++++++++++++++++++++++++++-
 1 file changed, 436 insertions(+), 11 deletions(-)


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.43.0

