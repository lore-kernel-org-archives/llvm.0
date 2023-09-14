Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95FF21355
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 17:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52251C433C8
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 17:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694710974;
	bh=dNvKVExAcL/+xsVdm/JTZl0sH/+jDBgpCJN7oIJgWk0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eTLrZoBvHzLb8opyX5RDTUJinZWC67A/h8gxiaS9PNNpqzuxUyiS/OhPBMkjy6ja/
	 8BHaxNQdoj5KHkoyhcctU3pUxXxpSb/GtktJ/QqnESdvnLxO6FelK5cISxm7tLC1LU
	 7gJA2VY2/RjNDCURlQ6OyRmCz6WzXcQiYTER10qtSsK7nU6ewRlOZB4k4QvzUbbEuG
	 S+jCpyBJLwgrsvAgSSjQ/rV8elqtmVcGqjr/4fGv1+zzlKjGsTXvNeg17lURvgMGEu
	 HJtt719KF/mrNPsHNcMYSLK51TFJdHQwYnus2/f3hr7uWNRJJtjbuRwGiR8QSF0OhM
	 TnfQWfsTjoUhQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-501bd164fbfso2036888e87.0
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 10:02:54 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzr7He5mrinQF5hpPfaNfRuoWKm/xIH7zhN1yFtS2OlfQBspGwk
	Y0egHFuVsgGPbNLKWyKDq+vnOwzAURWi7OdPhWI=
X-Google-Smtp-Source: AGHT+IGw/eFibdqS75bKWCpJa37gsnsnifCwsJlCyAp5V7GZQe8BhXNYzITpDpDqdeTGQTy8AIuHJ7b5Z0M2SEojNyo=
X-Received: by 2002:a19:ca43:0:b0:4ff:aeef:b582 with SMTP id
 h3-20020a19ca43000000b004ffaeefb582mr4611968lfj.66.1694710972568; Thu, 14 Sep
 2023 10:02:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230908231244.1092614-1-song@kernel.org> <CAPhsuW5Xy_K=6u4s=pNAZ8+eGBtX8v16Fr+9quL-FftEu+DWOA@mail.gmail.com>
 <CAKwvOdk6FeQjbh7b5K4pps50HZa6Riw6o7huGKzYcHFk_R8MLg@mail.gmail.com>
In-Reply-To: <CAKwvOdk6FeQjbh7b5K4pps50HZa6Riw6o7huGKzYcHFk_R8MLg@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Thu, 14 Sep 2023 10:02:38 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5niOZwfc=aZcHNeWMU8OJnf9pcOgyXZpm289dQXfmOUA@mail.gmail.com>
Message-ID: <CAPhsuW5niOZwfc=aZcHNeWMU8OJnf9pcOgyXZpm289dQXfmOUA@mail.gmail.com>
Subject: Re: [PATCH v2] x86/purgatory: Remove LTO flags
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
	Sami Tolvanen <samitolvanen@google.com>, kexec@lists.infradead.org, x86@kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 9:34=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Sep 14, 2023 at 9:31=E2=80=AFAM Song Liu <song@kernel.org> wrote:
> >
> > What would be the next step for this work? We hope to back port it
> > to our production kernel soon.
>
> Please send a v3 with the fixes tag updated.  I wouldn't mind if you
> added a comment to the commit message to the effect of:
>
> We could also add the use of an explicit linker script to rejoin
> .text.* sections back into .text.  Simply disable the production of
> more .text.* sections for now; -flto* implies -ffunction-sections.

Got it. I just sent v3 with these changes.

Thanks,
Song
