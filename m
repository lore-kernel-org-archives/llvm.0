Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17B62E685
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 16:34:32 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4121b5334f3so6985141cf.0
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 09:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694709271; x=1695314071; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XASZo9YTM/nTEYGFKuVlo/54fQU/sete5YVGxHMmtGE=;
        b=d2iPirXJkMKBJmJCliWxf8dgS0klwVPNGmrTG6/n2RpZ/13yBHHkQOAjYOTPKfX4d/
         WHT6OcgS7ikc4km5NezznJVgGXXbIIHezYWRRtF0L1GlcgMPHSCtpsXrX4TIRyQXjR8b
         eNZNNwrO4+QZBxV3S4l2oYTSLYs3cHJUq49MDZBrah9G0j7/BDBSFNgiOZmYFMOtkD7T
         ly0UfaOPebRTuLdd845Fuw+0BpQLEKOhP5ua2kRlOxqkOrMIcLGRx117lPqXYDIFIXH9
         mDVwBy2WnPhgYhEzzGm9gHVyUfM9Yr0JqpVjJy5fiCpJUlRhPFD1S8lQAHzzT4zEyvAX
         i7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694709271; x=1695314071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XASZo9YTM/nTEYGFKuVlo/54fQU/sete5YVGxHMmtGE=;
        b=SurKdTqwWLNTKTcr63hDzbUouLmFDPBOkWc6+buShM1VEKWOSxsE1V7xHCpat2kuI2
         XMX6QFLSzOn2QC+VuypQF+jp5EzqU27Rm1uSY7RWOGNNkTOLzzTG/VnEvncqFmeRLpXT
         +Q6/5Go/ru0ee0FS8x54qQPoTGr2dv4YS9gg2dFcSbv6V+v3bZH1fDUzm/yIx1PCQSCf
         aQjIWHSWm/1pRlpj4JAwJOzoCZ62SOLrU/KvgGjcQeCT2aaO0axqaI3OSufdP1xGx6Un
         DlbBadYkBmd1wMdppx+YTuDPP0UAM3qon1ZfZ4Bl8Tm7s8Rt7XMQxIvfIuC3xikY0+z+
         uYYw==
X-Gm-Message-State: AOJu0Yxj+HXBGmnLJRUolG95WaS1EOthSKy5cm1KxtXAptKeoz4dyi1Z
	gxH0N33UiBPqiQdo/bFj7HED0Qo7VH494h/nHjL/3g==
X-Google-Smtp-Source: AGHT+IHg7UmjBEGVkEhvOpg5Q7l9qEP6HqefOiFuxlirIIM6Mj2/H8NYbCInlRHktmnsTl9fFeuW1sLvb4zQBpyU210=
X-Received: by 2002:a05:6214:12e:b0:64f:59b8:cfd9 with SMTP id
 w14-20020a056214012e00b0064f59b8cfd9mr5860447qvs.18.1694709271421; Thu, 14
 Sep 2023 09:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230908231244.1092614-1-song@kernel.org> <CAPhsuW5Xy_K=6u4s=pNAZ8+eGBtX8v16Fr+9quL-FftEu+DWOA@mail.gmail.com>
In-Reply-To: <CAPhsuW5Xy_K=6u4s=pNAZ8+eGBtX8v16Fr+9quL-FftEu+DWOA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Sep 2023 09:34:17 -0700
Message-ID: <CAKwvOdk6FeQjbh7b5K4pps50HZa6Riw6o7huGKzYcHFk_R8MLg@mail.gmail.com>
Subject: Re: [PATCH v2] x86/purgatory: Remove LTO flags
To: Song Liu <song@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
	Sami Tolvanen <samitolvanen@google.com>, kexec@lists.infradead.org, x86@kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 9:31=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> What would be the next step for this work? We hope to back port it
> to our production kernel soon.

Please send a v3 with the fixes tag updated.  I wouldn't mind if you
added a comment to the commit message to the effect of:

We could also add the use of an explicit linker script to rejoin
.text.* sections back into .text.  Simply disable the production of
more .text.* sections for now; -flto* implies -ffunction-sections.

--=20
Thanks,
~Nick Desaulniers
