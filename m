Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4B128935E;
	Sat, 26 Jul 2025 19:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753558164; cv=none; b=k/ixxEhUL1Ud9w40CPrRZW5IXRSYlwrCJ5c/lZcfM3LkG+8/w2Esa/Hm1uK20kgqmvBLeP20OllcDbjYXi0gEUYgVfoSQlfUb5EbCI1U+OlIrFm24MIAxG8OgwdJWOdQeU2ii2W0bALH6v/PLPVCFF3yN3k7Bjf/3GxWFswpPBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753558164; c=relaxed/simple;
	bh=p6vlzBxPmTlXQOH312nXUMfon36HwQd45uPGmrT2Fl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=caOVGv+tGik9na7ke1ujS6Txef+b5j0EWQYfvfPIbQ6xbC1r7rOB37G2BZqao5rC1y7DLJne4FltvA2wD3mdaz4S2LLHJU+nxPYvx/iF4iK7ILmEw8lAQe3Mky0XHvf/n3Yit/1uQxZdWEdFIULE9tLQxoH7vv3ogHFxzs+/sUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldE/ZkUY; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldE/ZkUY"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af0dc229478so451167166b.1;
        Sat, 26 Jul 2025 12:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753558162; x=1754162962; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vvSfKTsgW67UgHTjYSpiHoW4cS1GZJhJf8MDOP7W80=;
        b=ldE/ZkUYgB8VgxYvTmzwGPH9ExVpyj0YY0v3QNtsl9bxf1OQwWmvSWhwK/AC5yawqk
         8ZyRpwgRPcAtbgF0rKN6sPuTuhdQvrD5F+LnwMJegY4ny+gi8HIP95tNDDZ+rUAZP6b8
         d8ZVVPDbRJcFarBtCE92ceBcxBEEw5pYq+4X7oDmlYl/jLg0dxdGj5a8YR+qwgyBOVOZ
         LP9wTdQeXa5orj9qhI1raEnrRJsAPxP67/qkiFuB/bkcrvJgZih3PWEdDUSim5NNqRCj
         uM2AaoTCYxjXmV5XIHgjv3wrbQHtkC31oJUXrCjoPZMyM9i1KRR/aR9/j6KJJfH1a5N0
         QzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753558162; x=1754162962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vvSfKTsgW67UgHTjYSpiHoW4cS1GZJhJf8MDOP7W80=;
        b=lFqbzUqoqJC4bcRzhoVqAYvVVJLWocFyQagys7no2gaQ3KCvfKcLfT5/wv58W8tHB5
         1DzeP+oRBTJuNWoi5a5vgmIIqbZcTfG2irwNkbEJcnkMvAsh/PlXouYLTadMp6xEjUus
         gp6NHSAkI6qA1MoqSnGesOFfFcfJUObrgzt2ZsDwyy1HzWYZSvSl8tGZkapBx4cKCjPR
         Vo3hmoR+VMyoqjlm7SyyuRDIdlvMw7lkugs80mSknNfjpA8i/c+uYspEdrLNRBOQMyTW
         iRYdd4kFv9b9oDwaspRtjUTFDQ8LDOuFsBvGcffzb/bNrsWbkJnrDYl3vYUJ0hwJjnIc
         lWiw==
X-Forwarded-Encrypted: i=1; AJvYcCUrZSwmp6+CkhtVyDlaGfUlDZCL2QYCCldeG3Oy3KLxnxqbyoRz01AokWo5K52W2g0ot3rS@lists.linux.dev, AJvYcCWXDPzPenNSejT3CDwSA8PvfnC07Z/qTw8RdL4KJwOBI/lbqO5aWTx5xz8jREbJr2ma3LCpgma9Z8u4mMmOog==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYJRpmjMnxVHYagwrgl+HCJgq8c6TnswRf/zTo5Z8ThvALzkkq
	C7FA7dEYkz6p4Y3ZsP1DOOY3mRDUhLhwiK4f/2hLR883cFFJg5YgpycCAe+9bAV5E4pnC2Wi/vA
	r6Vxb3EmEIkYQBwqQj6NURN7AAvV1aNw=
X-Gm-Gg: ASbGncv7s/elw4Txb6PaS/tjnglrBMLQ02RDgJlCM8r5s/9jlFaxcWzz4NAFONCIe/Y
	iowdXPfpXd6ACb9nlnQZQX41cnMEjmqNWiFQa/oDM+SdfLeX/k9oenNdcUlGKeo9wvMkNqDxfpd
	IM7bwRgM5ctKg7Ga96rBQyhX41/j0GzJCwqo+QvOp7uzt4gmT/Zc8+AKQp8YXNFUJ+bGilmi+RI
	f75bEV2rg==
X-Google-Smtp-Source: AGHT+IEX2WYBlju4aPOw0uNBG3Cx6m8n5OfxEhWAzTw7+nGHo7bYaFwlNoIWJ6wm4TCiyIXLTDzfL3Tt7hprvcOBWB0=
X-Received: by 2002:a17:907:2dac:b0:ae3:c968:370 with SMTP id
 a640c23a62f3a-af61e9224d7mr644269966b.59.1753558161391; Sat, 26 Jul 2025
 12:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-10-af4db9302de4@linaro.org> <202507261937.Txq9shpv-lkp@intel.com>
In-Reply-To: <202507261937.Txq9shpv-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 26 Jul 2025 21:28:42 +0200
X-Gm-Features: Ac12FXymY6tdOYJ4GtKwZ6wBh8I0rBJpt99EqCkKrn08JeG_YAOQylRsmRomyC4
Message-ID: <CAHp75VcrL56_8uKNrmLj9sk+t7qZfKNi6-W-yAKNZ+mSCXU8zw@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] pinctrl: make struct pinfunction a pointer in
 struct function_desc
To: kernel test robot <lkp@intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 1:31=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Bartosz,
>
> kernel test robot noticed the following build warnings:
>

> All warnings (new ones prefixed by >>):
>
> >> drivers/pinctrl/pinmux.c:917:7: warning: cast from 'void (*)(const voi=
d *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-=
function-type-strict]
>      917 |                                          (void (*)(void *))kfr=
ee_const,
>          |                                          ^~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>    include/linux/device/devres.h:166:34: note: expanded from macro 'devm_=
add_action_or_reset'
>      166 |         __devm_add_action_or_reset(dev, action, data, #action)
>          |                                         ^~~~~~
>    1 warning generated.

Good catch, LKP!

...

>    910          /*
>    911           * FIXME: It's generally a bad idea to use devres in subs=
ystem core
>    912           * code - managed interfaces are aimed at drivers - but p=
inctrl already
>    913           * uses it all over the place so it's a larger piece of t=
echnical debt
>    914           * to fix.
>    915           */

Indeed, this has to be addressed first, and IIRC I also got something
like this in the past.

>    916          error =3D devm_add_action_or_reset(pctldev->dev,
>  > 917                                           (void (*)(void *))kfree_=
const,
>    918                                           (void *)function->func);
>    919          if (error)
>    920                  return error;


--=20
With Best Regards,
Andy Shevchenko
