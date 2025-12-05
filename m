Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C6E23B60A
	for <llvm@lists.linux.dev>; Fri,  5 Dec 2025 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764923455; cv=none; b=hZvLF6jJrQ0INdIsvJuOQ+eqJO9s9ouy9ZS41H4wBsmvsjeqqnHuFjZjfi66u7PSiUZDvXRSiamfmt4ognjeW3PRvw8KfTOM1NPelylPdnKLvKvIcsLJWXIX9sblfE5zz+Imkv24oCigsJ6aIV7UGSJB6VpCnKPh+O7o6k8dqwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764923455; c=relaxed/simple;
	bh=/HKbrueeav0hfVFCXbRIEc+ezn+SuJvusACsWP8Bipg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DzFtj8tHYizhwquRavzFMVOYVDsTL5aDfZ+0O16BmXDWvEHSjcddii0du+5vAennaBH/2LazgGy0ImOrAVFPMYEXetkaAQt93EO12Q8ygBAG83jHYGoGMlhSdBpQxA6iPF4mCgpliS5mly90rCrgQDW1zU/QgNojUJ1AcsHewNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYaLG5r2; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYaLG5r2"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b76b5afdf04so274271666b.1
        for <llvm@lists.linux.dev>; Fri, 05 Dec 2025 00:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764923445; x=1765528245; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V+dVo2JNAn7MsrQQRK8VE52kJO6dog4ObFIZQRBPJw8=;
        b=XYaLG5r2bqG3+0iI4PFdZLY0Bh5bVaoeJE6zPBgj4pSVZC4csMHgRPwB2Q2RBX52kg
         svPsCQtTWNSzwoZfGIYkDVJi2TxhSbMo1Vd0eMDw5YCJsf4l4l//kber/oUxuyyVotcZ
         RI/dZ/P/qI9JhWS/rh00A42Atp/KDKkKAihPpaOfC5U0HYmi0SYN8LbdUB8ebxLSwd3e
         lSfx5jqjgDeIyvVsqdudFTZOR8KtK4PnIkEcDeOhgoUs8f2gCuRLJ0RfkEgfOsTe6ddP
         LjxbWqWBxoXV96oIRetrir4zDA1u3lOG5FUbCUxIMN9hnM7ZywR3gR/Lbuj5GKvtHVK1
         PgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764923445; x=1765528245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+dVo2JNAn7MsrQQRK8VE52kJO6dog4ObFIZQRBPJw8=;
        b=VCGtAWhmeQ0F3Iq9D8wLVnwyJ0655yNfxU8ADKH0TR7rym9dudnCP7WpoGbW2D12uV
         AVflCwkR0PaRyiu1FuMqfYKbIIgwmQLmF/TEjoUr82hRWKjSW8Ubeg5mODuDtxoh2T61
         g++mJdNj/nEoAOHVqKxrKjA8ddeWldJGr6xxPM+wNFkUz8O8hNRuTPxksFWrDfz6CoGz
         TrFTnZaYJmQEZzHUfYhEwCEjl7Ps87RIJTE1uNraUv/Taoemb8ZXoEM4laqM0GMegzP/
         Qb8S88zeavNdnhmyepgoytvmsJ6U+mNnKqG1kooSblLiT4seGMxDrLDVzk/l1kPnD2fo
         8Uew==
X-Forwarded-Encrypted: i=1; AJvYcCVxfcGrJaChrUi0sY1UpV6OHQyR0Mzi56ZV6ARImE0gL/8fJEeeuC3Kfyo37eEJYUNC+3U2@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/9nf9UlUItln+3jvOziS5DSOmv5OfSfw+FR1aqZX3NOH4KEjW
	RgqeBP3sQIr+U5uSF74d09zZUlQnAHkPvnsyM8nZj/H3HwBV+6L2NQ1GxaUZcaaW43Szk+r1Ai1
	mPEud9NEmr6MKlHGHfguxP478pvja8EA=
X-Gm-Gg: ASbGncsmouLu8/B6RsrufRNzT5BYi35sRO3d+ft+65wELdwnIde+ENHmW3/oDJmKrWI
	lQdVUaYWPXES0Rz8izWHFE91px5u87zDYAHLM3Kwjw6jNkah4+1do80Fx8GAqZm3TzsifJ2UiWA
	S8dHGNgDkJXGe8Cpq5gNZwDQn7ZOKli3VVpUo6SvyadCvlXgGnjq9dnCcdgZ0UfCuUVmEZtgDvV
	Z75ip8VmyxqqhBezRIkneRpK5bPo7eetmvWEquppBgAS2aKJbIVrj1ZptQJaYou6X3ZYw==
X-Google-Smtp-Source: AGHT+IHyhPhO5ji1Udtkp6jlBiDNdS1nJUTysDiG/BFsQGzVGkOYuq8S0+wdBeVac/yGVlo5iFM2k5xQ7B6Gl1w0/Sw=
X-Received: by 2002:a17:907:3fa1:b0:b76:5b73:75fb with SMTP id
 a640c23a62f3a-b79dbe72a9emr795463366b.9.1764923445456; Fri, 05 Dec 2025
 00:30:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250813131007.343402-1-linux.amoon@gmail.com>
In-Reply-To: <20250813131007.343402-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 5 Dec 2025 14:00:29 +0530
X-Gm-Features: AQt7F2qxbYSQuCXsYlo3s2RghAVsnJFzDr1A7ezZUPavGedOu8ugG3TEr0d0Qp4
Message-ID: <CANAwSgRqFsRvCzrK7NXfqa91xhQLLVU_u2irLBBrRcpiK9gGkA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] Exynos Thermal code improvement
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Cc: Mateusz Majewski <m.majewski2@samsung.com>
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Wed, 13 Aug 2025 at 18:40, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi All,
>
> This patch series is a rework of my previous patch series [1],
> where the code changes were not adequately justified.
>
> In this new series, I have improved the commit subject
> and commit message to better explain the changes.
>
> v7: Integrated my RFC patch which improves the IRQ framework
>     for all the SoC link below.
>     [6] https://lore.kernel.org/all/20250616163831.8138-1-linux.amoon@gmail.com/
>
> v6: Add new patch to use devm_clk_get_enabled
>     and Fix few typo in subject as suggested by Daniel.
> v5: Drop the guard mutex patch
> v4: Tried to address Lukasz review comments.
>
> I dont have any Arm64 device the test and verify
> Tested on 32 bit Arch Odroid U3 amd XU4 SoC boards.
> Build with clang with W=1 enable.
>
> Please sare the feedback on this.

Can you review the first 5 patches of this series?
Do you want me to resend

Thanks
-Anand
