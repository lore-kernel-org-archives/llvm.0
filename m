Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A57D2F4A;
	Wed,  5 Jun 2024 03:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717557377; cv=none; b=jpYbpJAYuC6Si03p+rgZUb2Bb5ISsQi3Epwmzw9lbJ90OdthkvQKPbzscdD5UNnCHWaxP/y2e5CBqT+4GD3OeLWai0ndgfdaZOv+l7Cl7IdgdKxoYenPt3AQkzAdw1mATnycxX/Dl/AQT55F6nP+nPFC73KqDcj/XyjoKjKP6Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717557377; c=relaxed/simple;
	bh=04xAPzHHRLN22wGYvDSc+81bOug5t7dxgEN4MPJ3+BA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EkoEO4/Pq8SYgCtor1NnRG2czPtDX1COEO7gubnJ1W2lztLHegMrXapn6iWdkmyPd1YBMAe9icw4lQ9EWPpaNXgd4FmXtE1ODv+wba0vPpjsrsp+98cz+IC7Mm3FF86IDfZFjwq4n9jB73zdGMNciCmqTnIzI3z7oqwSj91w39Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO4oSnZf; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO4oSnZf"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eabd22d404so18620491fa.2;
        Tue, 04 Jun 2024 20:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717557374; x=1718162174; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04xAPzHHRLN22wGYvDSc+81bOug5t7dxgEN4MPJ3+BA=;
        b=hO4oSnZfYEuSBdqHPNMNAbU2yIU64z3alvTAjg7E6vgcUN6zaIwpmH7+ZdRAI87+BX
         +eohR01GZ/u3Vzsfp36suIaz/GmXSwHMvBvC9386PB/t4plI9n+4uWw8sB31KDgT6zHF
         dMSkgfRropFRx6VA3KS6UqyWT3pDL3+ge/Qj5pLQnuavn5mF7Y37QfkBlg+RvCtN2q39
         aroBf/mQnNAcO+hz/5suJAN/16cBECWFsk3QjTPyfM9gPMolU0zsvE5AFTilKqABxPXg
         dDexRremr5tuD8yTKTDX35q0dlGtPowqA6jszAiL8eEFrYxOnHX/Ti0a31Qs4wMwUg1K
         MZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717557374; x=1718162174;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04xAPzHHRLN22wGYvDSc+81bOug5t7dxgEN4MPJ3+BA=;
        b=VHDLweLv2klBw87zGzuQ+n+tJSSPtfvUcgc1bjMllVDP9E1GcDx7pQRcjRcfYBF2hM
         UKB5r0QrwoRYJ6X/abW1R2kAhc+vs7rNPhBL1GyBtkSy8pCN8+c6EXhPsoiuiDXd9VPN
         Jl4A6JrzWzLziyQQ3zwIJpGGo57yJFRzWhc3A+yVziIsvTX784L346rbLQqNt2J1C3Hu
         DoJbUkK22rwmhDTdxFlTJ8sq76Sse/WkDGrQp5xE9VUyMABfuc3d3N5Is1i7Q9a9FNCG
         jdsrYI6Bn8eUNObQISToohc96vvxStyM2T7xGFQxU4U+u3lZABoKmwvN8+/4ooyT6tTa
         U8KA==
X-Forwarded-Encrypted: i=1; AJvYcCVm1ejb8hemTaCPmsDofTFLlQnCt9Cm9LzKEDWWdg/SrqO/BcNhmCE6WiueeCikVer/c/lm9Mh9b7Oh1TQ+IPeVGbzZWntlU1XDOENoQ27OmoDH+LR6C2jWiwPKfCuf+LP/kiE=
X-Gm-Message-State: AOJu0Yz5mJrGEGo7rlWjHoThvaLyjIW4r0mfuHtTO2pKoLj+U683dcQ9
	S/yM4ecGLGuZXYIWDfJ3Ek9pI19j41ZmgoHhjscRgYZny2fFgyFm
X-Google-Smtp-Source: AGHT+IEn3UnSfnLJLoh7YmAsbD4H23Zx0LdCCxW3cgnZIPOfTgWthOubw4aRXW/incMEXo938UnCzw==
X-Received: by 2002:a05:651c:208:b0:2e9:816b:da78 with SMTP id 38308e7fff4ca-2eac798b75cmr4930521fa.9.1717557373887;
        Tue, 04 Jun 2024 20:16:13 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215811d49esm4836265e9.27.2024.06.04.20.16.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2024 20:16:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 2/2] iio: adc: meson: add support for the GXLX SoC
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <202406041751.elQWr6cj-lkp@intel.com>
Date: Wed, 5 Jun 2024 07:15:58 +0400
Cc: Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-iio@vger.kernel.org,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AML <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <1E90764E-5D50-496A-B4DC-3D3982392183@gmail.com>
References: <20240604055431.3313961-2-christianshewitt@gmail.com>
 <202406041751.elQWr6cj-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)

> On 4 Jun 2024, at 1:10=E2=80=AFPM, kernel test robot <lkp@intel.com> =
wrote:
>=20
> kernel test robot noticed the following build errors:

Apologies. Build errors are because I wrongly imagined this dependent =
series from Martin to be merged:

=
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20240323231309=
.415425-1-martin.blumenstingl@googlemail.com/

To be continued!

Christian

