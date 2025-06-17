Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F65454BC6;
	Tue, 17 Jun 2025 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750158838; cv=none; b=nckbzMjJ1VpZtB+8W7ZpBttS/Vcx1yvZRYEjcHlOIS+g/Kd3WsJM45bu8421/iJB9zvpGgVqRn8XdV0/4tbDU1mbMCMAiFwLvLdAsBzfGfEaqQMi/tScOXG1F7aPU1YDYFuPc3aCxIV9C5pzJqKAJ3SE7UyQducPhSrvBn7idio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750158838; c=relaxed/simple;
	bh=MaHmR1wGpP7LZPIK4valG9ewGY6JUMEQrt+gAuQR41M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3P3xUmAZIbtUGPsLW+s1an74UPLSu1h/8Av2C4K2fcgAZGgOn26uC+C7cgAdmqyHruwK9fUptIdAthmY+ckj2HKj9z+h+57dwJEK0mns1kunZJtL/wkT6ygEzr3M8kkjLWEAc4MabeKJWf2FdKY6ZhoDQay3UunRUH6U9xtItE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgqcsiTT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgqcsiTT"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so818380866b.0;
        Tue, 17 Jun 2025 04:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750158835; x=1750763635; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaHmR1wGpP7LZPIK4valG9ewGY6JUMEQrt+gAuQR41M=;
        b=MgqcsiTT1KHydabKLnum9dz5a+EAtrQZoEIr8loBfk58pyjZl1Ma2AJNl4H9D43dRz
         +YJyeUzGAgqmNTJCXL0qyGUU0MMP96/EV3b8Az+zfBNVV+DGDrCJ+8X/JrD/VKlJd/kJ
         1YATRTfM87sf09JNFcLF7O5Q0mAfl6YibQowiJEsqftx3xukEcVg4i9oSSkyaSRYAQ2e
         BQ4Jx/GEk0YaM/uBNrNak3f1FnXT/p2EYeou4QzIgpyaBJzegJnrWNSDS+zid4Y6xEdv
         H31rUn5tdWi1hXRJUl0fOFjo0UGQzRBmA1piJ7e3msJG5/2HkFXlI7WIiIdNdryPLxXE
         NP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750158835; x=1750763635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaHmR1wGpP7LZPIK4valG9ewGY6JUMEQrt+gAuQR41M=;
        b=GK74SS8NrzIXtUcafwnH6cQQwCQ3hAtNrQPqp5XZSA2f2cFT6PNWnNBzZTH2mC6GZF
         emdBVTDKEuyAmFK7nFTuuK+14UJQVIVZMXxQRclnWcbtptgDLSSbOpjttPHNAPXk7zeE
         C06s78vHGjqciFcf8Tz2h54RhfyArwX0OI+w39OnXNWlp5vGHvCtqp6r12G9M+T8ZKEn
         E8pwJIoqZi4J6KVxi4ZMEhe9RnOOoZ8+CI6dpD3UpEuqmd2pQ1Bm2NnXQ/fbSS0ZSVP5
         ipS4E9b8uZ8PHg1ah8OWWyHLMlg74HixfngJDLU/olEIwLvwaPsmoPOoMe3fW1H2kYP+
         sRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSRnY/CID1TDgomPtS4fcgOXT+DX1GgsNYdBuJXs3AbES5Nt9vaaKuXqJCk8owYFQ2/LyY/n4i5blXZktzhQ==@lists.linux.dev, AJvYcCWSSmW49ZMbqEjcLDIrF3MO6yJ+NmLxaiFoIBeEPrewkGAeyekeUt3fHzl/FpyC3Uc2kfft@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1eLFuZ7eXU9m6//SzTDGgSDXUfq5azS4XKle/6fQYEWitfLCz
	vbvp8V73yjOvo6NRvmD+Dc33EyEbvY4sYsgkTteHUnHyTptZ6cqqKuq3brbd/fWA1aqS5Gjkl9v
	J2R+JmqYFVaBMevvtKIcfAY9vdpwTt00=
X-Gm-Gg: ASbGncuGRGe9GcYO2XP8955ADjodDTdzdL91zUtBh4DLPe8jBJytXYMAhCjMfwvzS9n
	xNZ9bnXPAKi4bw3LShkyGqAduEPcI0OLsd7eAdlufkn2KjgdEIncp13DFKhHtH6htyuZ43ZYG+z
	nQ+0rGM3THNTgU3PX0cTrW2QYm9l1tsxZeO1u2CcM2uCjEkQ==
X-Google-Smtp-Source: AGHT+IESHeiyOiuhAWJZBcfbJCq8fYJ700zvlkUPWv8gjHXka8KHuvGg60SAZjr8jC7/RuWODDxV0uw0bcmTEwnc7Mo=
X-Received: by 2002:a17:907:7296:b0:adf:ac21:e2c5 with SMTP id
 a640c23a62f3a-adfad437e33mr1247802266b.35.1750158834632; Tue, 17 Jun 2025
 04:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250616124934.141782-3-al.kochet@gmail.com> <202506171615.p1kpBZuQ-lkp@intel.com>
 <CAPUzuU1oqiOhKcV5e21rhjP_XcscGGLq9oZMvcK4DB_B2yZ7Jw@mail.gmail.com>
In-Reply-To: <CAPUzuU1oqiOhKcV5e21rhjP_XcscGGLq9oZMvcK4DB_B2yZ7Jw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jun 2025 14:13:18 +0300
X-Gm-Features: AX0GCFsWlekhlsxSrFFDAh3-Xv_3Al_xyZTpMNIlXJ8nV6j3STJBSz9kLCimwY4
Message-ID: <CAHp75Vc0EF+9jrG+P_0GKOc30Ze=FAUrywYFsaVAOAq0o9j5Cw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] !!! TESTING ONLY !!! Allow compile virt-dma users
 on ARM64 platform
To: Alexander Kochetkov <al.kochet@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Nishad Saraf <nishads@amd.com>, 
	Lizhi Hou <lizhi.hou@amd.com>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Paul Cercueil <paul@crapouillou.net>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Andy Shevchenko <andy@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 1:16=E2=80=AFPM Alexander Kochetkov <al.kochet@gmai=
l.com> wrote:
>
> One more question. I can translate all other dma drivers to BH
> workqueue. I cannot test all of them, but I did this for sun6i and it
> works as usual. Fix straightforward. Is it a good idea?
>
> That happened because of this change and this driver doesn't compile on x=
64.
> Any action from me? Should I send v3 without this change?

I wouldn't do anything. You explained well what's going on beforehand
along with the proper subject. This was expected, so only if the
maintainer asks you to do something. But modern tools, such as `b4`,
allows to pick up the certain patch(es) from the series, hence it can
be done easily without any need of being re-sent.


--=20
With Best Regards,
Andy Shevchenko
