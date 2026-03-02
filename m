Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68612DC79F
	for <llvm@lists.linux.dev>; Mon,  2 Mar 2026 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452835; cv=pass; b=bQpQdQeH3Kl74IG7ct+BTv594fvj8ZBrzSoZlpnhLNYcfRQHKyFGJrRHh3//oUeEEbWgM2UHMUT42cbqa4GK2nxMjjnN62sqHkchTeP2C7cLd42+ne2uyhtJ1kII1G5KWuIxbwqTz9yRrcKqDJUnUXFCMxeE7gwSdQ2UznIkLEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452835; c=relaxed/simple;
	bh=8LmPtxyT3YMtIL63fEHFCEyYwnCRKHRTqMjhB0pBD88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Em5qZ7MUsQY4qFgiGBZ7YBPrHyKZ24jfheFvcx7+gqLeK2bU1v+OcAx/C8qJLOzxr0g50pe3repfK5ux07ihU0vQR7jZWUe+zdW8sChKdO04thoY5vM9ngsgX1WEMLm0PNTYojJSsQuRXfMkzec9nR5l2f8FvFCjXlXKdBt2mVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=JosaQN1M; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JosaQN1M"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae50a33ff8so6267765ad.3
        for <llvm@lists.linux.dev>; Mon, 02 Mar 2026 04:00:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772452833; cv=none;
        d=google.com; s=arc-20240605;
        b=cB89WePysdU5LpP/at3GHDcp9+5lx8REspZNJmsFGVh7W4bhjVbfgiyvdQWImxx6Ra
         q+f86U2cTfdu+XBvoMnSgKeYBa1TJ0MKr1vos3z98B50G73nqJA2F6hsnjg1Ju7f4Byj
         Uonrj0LT+ySX/ioLyj+St07wUNKhORtynr2kz67HS+3a0UUzgN9JkuQ5eydwLoUmnSzo
         bwx6w1h8Q4jadsVEEM43NDFGMT0lV9GaRizgMuuEQpZzN5EldJOxDj5+MVckDf+QsOF6
         r947QG9uRyj3s+s/X8/9PdGYOjxOsAXaW3sUw2kCWfV5MSAXHcaufPQ2eQxO/BvR3dDD
         i+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=;
        fh=6GTzGxcXfrxaoUlGeSd0rjJUPz6l14z5ReH9slgEjB0=;
        b=bqZVP06pn3cXR+HE9GTQhwtZN4M4ub6hYLgqeFwszdYdmlW+yTsSnEYLX9TVPvIeGz
         xfC42HWtFlWPfYJOUPkxT/d4lld//dvjSwqXu2crN7QaZrgwL2fdxG6Dw04gffDoYsBw
         ZTVFT12jsCEeYIKMrowWhzsEcpRDcWh6Ag0H9jNp4kB/5RGpU7uczbCSq+DVYjrSSNHI
         XcIxhAprYp5eIT4AvI08BgoUvKeKU0q792Sv8Wvn+XAkFyQO94RfA1Xx+WIHigz9skLk
         3j0qae29fAZCvz0G9VtxaiKOdwGax9Avwlsi0AYRfFupWSlQOhNwME+TbmywhIROjKTz
         9BfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772452833; x=1773057633; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=;
        b=JosaQN1M5RwdJlJOcZDab+1YF1ktL7LqlXfxzjRNlEqoGWCCKlrs7GApy15+Ifmjxg
         urRXqzzDoqW4tKYsVlLQwwXFCLSFK8BdxH2b21ZzJERjGm0cQ70nbiSNNwuWHiT7Rfbz
         hadIM9Jhik5DKxUGsviEE8+ePPR82sgr91Qe4bieIHX/p2Rz6JL9tTpR2S1hY1JLSK2d
         DQXjsYVFcmgVsZRvCWy2HI/T4yyBiam8tXXMgF12ifXQkIb9ACZq+OWQvsYenVxqG3r1
         +PQOfio/ipkrF1qRt2YeIOnXZYM2pbTqjNHNKawgj9QnkcddJiz8BDkVgUXFf+i+61xh
         J5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452833; x=1773057633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=;
        b=Z3yI29Fc3rafOqLQ3u7Kf9lW3+PZ+lX1FaALq7gh5Z0qR6TTIlXSlcHRM3WxFyOK0h
         N641f9vGUNkAmq57WERdF16GUjNn/HKDkZXvPbuAGBxnAY2rQcKCbdW0aG5LDRwJ0Iir
         m08uSDaHzahKuvLEY6AlgB0XTVhN14H36FIh0DN0O5nzIfHBIld9irHM4eRRw+aaBIJt
         d2K13QKaWdQ/1qc3cCPpFBdsiVdAwmfDvIe6+7iomc7kqEzkkQkV2iXtdqwbYKoMjuDk
         wYnXO6GmdRFUvrXOnJfsv9ibIMq2sIpzogEMEnnqt6DzdzqL86U+Svv+EHmPgxLaKmuy
         w2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL3T2rHXcX5qPrFp1Pde1af1VXnmnq4geglDCJeSXvbvTl1t9DRNFHR72MwWlgYD2Tqvms@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt8yEDKgOjKX3b3X7xjKeCOz7Y2KjAyVBKJy5F0ahhKN8hV55w
	/9+ajbIw8h1gSnEyKM25tAwuOnNuhBoNKwvdHpScWsZGe9b/uaJ5x7MTs2eYbtCyvzgD7pa9a4Z
	JyQwGTN6Vb0oD72Cg5PmAHTXirEMfi2A=
X-Gm-Gg: ATEYQzw2rZZKRe/f3ChwMmPpCsTlBCpAzb6DzAKQU2hqj5sr9T/yjOXRKgpDaK9s+R9
	1SCaw6cuKt7ZHRB212J77cXVA2vAjvfAi5n/oI0cvMfgcPvwFJI8ZGVxk4oe1YwpmFES1Xi48pM
	UJ5iiCCTNAaQQra5DOp7rPkM8xXXqeZv4IQOb2Buv4fVQM9woNYJYUVezUpV7qHcrM0aaspr8o/
	SEoKsAnSHIzMQoDO+8ILVe/w1Qz8TAypDyoS2kIdLG1MiiNjnHCxslFf/QjXkCzUyfAzGSCF4v6
	OGyzkz3eDdTdGvqHjNZ5sgtAGE0HWaWjsLJRIvnY
X-Received: by 2002:a17:903:2b0b:b0:2ae:5a44:ea73 with SMTP id
 d9443c01a7336-2ae5a44ff28mr9115965ad.30.1772452833138; Mon, 02 Mar 2026
 04:00:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260228065840.702651-5-nick@khadas.com> <202603010009.VfPuPoeI-lkp@intel.com>
In-Reply-To: <202603010009.VfPuPoeI-lkp@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 13:00:22 +0100
X-Gm-Features: AaiRm506ikB27OOPsiZaHy57remzQl6Z49Wi7FBnTFU4vfPVcSRrRPvLCZYsf3Y
Message-ID: <CAFBinCDBR=cgQjhv9VxYLFAmTp2p+Fm_mWCZ5o5P_SA=Rb0R+A@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 add Function key support
To: kernel test robot <lkp@intel.com>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, krzk+dt@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-iio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 5:16=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Nick,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on jic23-iio/togreg]
> [also build test ERROR on robh/for-next linus/master v7.0-rc1 next-202602=
27]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Xie/dt-bindin=
gs-iio-adc-amlogic-meson-saradc-add-S4-compatible/20260228-150346
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git tog=
reg
> patch link:    https://lore.kernel.org/r/20260228065840.702651-5-nick%40k=
hadas.com
> patch subject: [PATCH v1 4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas=
-vim1s: add Function key support
> config: arm64-randconfig-001-20260228 (https://download.01.org/0day-ci/ar=
chive/20260301/202603010009.VfPuPoeI-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9=
a109fbb6e184ec9bcce10615949f598f4c974a9)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260301/202603010009.VfPuPoeI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603010009.VfPuPoeI-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    Lexical error: arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1=
s.dts:50.18-24 Unexpected 'KEY_FN'
> >> FATAL ERROR: Syntax error parsing input tree
It turns out that this series is supposed to be applied on top of
"arm64: dts: amlogic: meson-s4-khadas-vim1s: enable LEDs, Keys and
Bluetooth" [0]
When applying this series on top of the other then there's no more build er=
ror.


[0] https://lore.kernel.org/linux-amlogic/20260228063750.701887-1-nick@khad=
as.com/T/#m2f4d30878fc8252f853bdb3005042c3aad97961e
