Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D72C80
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 13:27:48 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id 188so3702086iou.12
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l2C9Z+js89+UJ/bqODoH5q4EnGgOhoNHPmwMLe/6Sew=;
        b=W6CTmfyhpdpdX4lrE5Ka3uaLiPlJavxd5l/Vdce3GFO5PJV5x9GMXHkEvCPQHNsQQq
         iKWUuaCaq02mTajTBFxJECSlnVhYEvrB2J1NtyMc5Y8OnZjPTHaCNxhKK86FI6Yl9h6L
         0iuSQbq+eOPIZF8eBgUBAM4JgjZuoS+mryIJCzaEb6FqVFhmkKpsz/KnMsaVIxMMfM61
         YYRy4jcgf7LaOmTxpMwRzeMJLxiM5kkkcUylYI6EsiJvAzW1ZMqQpbeYKc5OS+NnAEfG
         RiPI3oOB//o8+Q2oL6XPJ79MF90eQUOzD5kxn3inhqVTUm9sENvXHfjNeq2te07fm1lK
         Dq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l2C9Z+js89+UJ/bqODoH5q4EnGgOhoNHPmwMLe/6Sew=;
        b=LL7pQe0NFBQLXxjPwXxURWUrfXP8/TN1b9CCIkJcmplMPGjKNMX1+NiuysrO1MsG0L
         drI2p2mXR41wDABD07jjDidOwjQyK/w4ryrXlvgaOcmHisyKoFJaxdTBMYv7gOWM+FKK
         wXwbKJdgKDnCHaAzRxLOwgL0okYoQm+W5thEixOifN/OKvfPYD9CHxBM7ReY6RZRepyd
         5vRWgbek0tD+ryxg38xwfUuFIKLHDWq92ZfdRp3iDuv255DZtRnlvr1usy8RRsjwjwT5
         qClGiv2D7rcbtrvOwgF5IIUAJW5jmGuQH6JWHMV5ILKBSR5TGDs0JJjU6rMnBD+J0I6u
         zKFA==
X-Gm-Message-State: AOAM532/8Wj7bFlezCQe49sg0IMduzG/3IGcOv3Utx5HKY+Mn28UiKds
	5uDYRiQPSrUuNeTa/Kr5vVWRgHpD7EyNsLRhTjM=
X-Google-Smtp-Source: ABdhPJwA/c7l7y6txdUwodFH9OvPfiTz2WcomA6YI53CgOhqBGP6B2JqCOF5/WzZIuYRe9rCdQbSsYt8ke+xo7w3Xrs=
X-Received: by 2002:a6b:8e52:: with SMTP id q79mr2464610iod.64.1634218067845;
 Thu, 14 Oct 2021 06:27:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202110100514.3h9CI4s0-lkp@intel.com> <d6e8064803598970b463da0e9bab116b@kernel.org>
 <CANiq72=-2t=ty2SFX=ZTNvcWC05-0AiaVBdy9s-rENEb53EFUw@mail.gmail.com> <CAKwvOd=-VQHxp+Ar27LyqPMmMMt-mRu+32uD50dk6eWMfAj1VQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=-VQHxp+Ar27LyqPMmMMt-mRu+32uD50dk6eWMfAj1VQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 Oct 2021 15:27:36 +0200
Message-ID: <CANiq72nEhMTGjpaAn-GFDR0DA_s2EDnC+B+200G7aeGhu+RT3w@mail.gmail.com>
Subject: Re: [arm-platforms:timers/tval-ectomy 2/17] drivers/clocksource/arm_arch_timer.c:156:3:
 warning: variable 'val' is used uninitialized whenever switch default is taken
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Marc Zyngier <maz@kernel.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Oliver Upton <oupton@google.com>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 10:18 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> SGTM, please do.

https://lore.kernel.org/lkml/20211014132331.GA4811@kernel.org/

> Didn't I send a patch for that?
> b83a908498d68fafca931e1276e145b339cac5fb
> is in mainline.

That explains my d=C3=A9j=C3=A0 vu feeling -- I guess I didn't click on the
-rc's in Elixir :)

Cheers,
Miguel
