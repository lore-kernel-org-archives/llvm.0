Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEDA1419A2
	for <llvm@lists.linux.dev>; Thu, 15 Feb 2024 22:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034417; cv=none; b=vCOoULpw05xTK96by0k0q4gZrfNkJLcZi6RJtSw2MYWoFJPRjNI8YSH8HsN9OTonZ9gtG+1PhrYzvT8YpZPvtJTIsG6+9Rfg3zWz5v7li3S2LVfTz1yRJkcMiW7ITp57wQ8+fflDSGhRRE6bynKD510stuw1T0dORVKBt/11Las=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034417; c=relaxed/simple;
	bh=0YKpEVkeMzTYXQ240hkjanF7zviyBcRY4VKKULoEVNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbhiRIj42G2BhMm0nu2Art0/mU9TTw4JO13y2TPpUm2fe37HPznY+kxJj7Y3l/oJWeO6dhOweit25et8BLFUNyWgnMgOJLopB4bx643bvZkqC+nZSca7ml4x4mchS/TiZrhmhC4IYDtmkY8LeVNC+Y8df0skzXcupRMHh33SNpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=h0gafVyw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="h0gafVyw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d746ce7d13so437295ad.0
        for <llvm@lists.linux.dev>; Thu, 15 Feb 2024 14:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708034415; x=1708639215; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gs6NzoFHCnkXscwFWvqskhg9gjZlTzzaBFX4/MoY5Y=;
        b=h0gafVywBJtkKRzZjE0Wj43W0xcNkZpIeL0IfNKjj/1O81UIuuADR5ED64y8jUwNXR
         ongs8bkzdd8WiBtJmvauOAWQoBttwL6hKGyHZUZP2DxJ6If7aoWq6wqxKKpECc2pj+wS
         F16rxXiajvsjigjP2wQsvQpmxhaZb7Ea4KvefwRbX/JPQJlEKQ7rCOoTWBuopGsQGJj5
         tHCwuSjAyJb/I3o2mi3JukMpQBrKXEYZIyNnxdCJV00pPGo6dV8WiJw0dqmT6CQT/VvO
         ObWuBZrW/wi3/cz/4Pj6BTrTzpt8cmatugGxYksp9OW2g8KY/mOcLPNilGF0z9yCcGDU
         TNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708034415; x=1708639215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gs6NzoFHCnkXscwFWvqskhg9gjZlTzzaBFX4/MoY5Y=;
        b=GTl331yub+KXv4CZc/6OiysnhMmYnxCVUJjtZJjfCcQRvW83rkcQ9TSzAlQB2jSr/5
         Q6e6OJjmvcMByrAbaASuLRc5Wjn3/qOzIXNVgjl0sS1WYEO4VFN6FJoEUhAYlrokoHoC
         8ZRhHHy0LQ698WBB6J4KUY/k9pNzHc8wxb8e6kmYFLt+sfgOZaH4gSco9aAlYok9R+Re
         oWWQMG7uyG3WxsUH7XSJUCCwEatauQsxoPtrVutIt0I/kLj0YxlOo3WyttdVT4fYqkz4
         eEXP7pYXz+SKfk+0HSh/8Zal1Vqteg366rcANR0bZSVzSFuuY9wYBPDI1xDC9DHWiEoo
         2Yew==
X-Forwarded-Encrypted: i=1; AJvYcCWr6bVZcdwmR/QaPXV0o/3BYTyY8ETKDcidNnq9nJYSvxUrqcNwpduN/8ulCV5glwjd9eLH5n47zjaPBZNfi+hA/hh6RQ==
X-Gm-Message-State: AOJu0YyA+Q/NBkMeukSX5dfdzaQZX06qCB+1O+TtLWypH+c2pq/l7wqP
	iiR5jtSnRFNEoBOZxvZZJ1Bj1qJG/5VKfEhKl5JUUE8nAOJlOsPNvZfvgg2vHQnrdXzF48tyu2S
	sULJlcvWb4NvTXHNCMQU4pC77/xI=
X-Google-Smtp-Source: AGHT+IHUDH5HqCEHGcEyjZXHmI5Xqq2dmWkbTvIn4GOxHNF2G+rYrxFr0nbuvjQ7lPuYMA7DRSmSDmv1O7wRb/LkOIs=
X-Received: by 2002:a17:902:e5d0:b0:1db:2ab0:f3de with SMTP id
 u16-20020a170902e5d000b001db2ab0f3demr3897384plf.13.1708034414315; Thu, 15
 Feb 2024 14:00:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240213142831.3069049-1-jbrunet@baylibre.com>
In-Reply-To: <20240213142831.3069049-1-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 15 Feb 2024 23:00:02 +0100
Message-ID: <CAFBinCCELS7ss0KBW+iHeevVWQzO4Sz6vTP4=E01u3+o73-HBw@mail.gmail.com>
Subject: Re: [PATCH v2] nvmem: meson-efuse: fix function pointer type mismatch
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 3:28=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
>
> drivers/nvmem/meson-efuse.c:78:12: error: cast from 'void (*)(struct clk =
*)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-=
Wcast-function-type-strict]
>    78 |                                        (void(*)(void *))clk_disab=
le_unprepare,
>
> The pattern of getting, enabling and setting a disable callback for a
> clock can be replaced with devm_clk_get_enabled(), which also fixes
> this warning.
>
> Fixes: 611fbca1c861 ("nvmem: meson-efuse: add peripheral clock")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks Jerome!
